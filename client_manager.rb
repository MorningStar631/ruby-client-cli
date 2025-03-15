require 'json'
require 'optparse'

class ClientManager
  attr_reader :clients

  def initialize(file_path)
    @file_path = file_path
    load_clients
  end

  def load_clients
    begin
      file_content = File.read(@file_path)
      @clients = JSON.parse(file_content)
    rescue Errno::ENOENT
      puts "Error: File '#{@file_path}' not found."
      exit(1)
    rescue JSON::ParserError
      puts "Error: Invalid JSON format in '#{@file_path}'"
      exit(1)
    end
  end

  def search_by_name(query)
    return [] if query.nil? || query.empty?
    
    query = query.downcase
    @clients.select { |client| client["full_name"].downcase.include?(query) }
  end

  def find_duplicate_emails
    email_counts = Hash.new(0)

    @clients.each { |client| email_counts[client["email"]] += 1 }

    duplicate_emails = email_counts.select { |email, count| count > 1 }.keys

    result = {}
    duplicate_emails.each do |email|
      result[email] = @clients.select { |client| client["email"] == email }
    end

    result
  end
end

def display_clients(clients)
  if clients.empty?
    puts "No clients found."
  else
    clients.each { |client| puts "ID: #{client['id']}, Name: #{client['full_name']}, Email: #{client['email']}" }
  end
end

def display_duplicate_emails(duplicates)
  if duplicates.empty?
    puts "No duplicate emails found."
  else
    puts "Found #{duplicates.keys.length} duplicate email(s):"
    duplicates.each do |email, clients|
      puts "\nEmail: #{email}"
      puts "#{clients.length} clients with this email:"
      clients.each { |client| puts "  ID: #{client['id']}, Name: #{client['full_name']}" }
    end
  end
end

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: client_manager.rb [options]"

  opts.on("-f", "--file FILE", "JSON file with client data") { |file| options[:file] = file }
  opts.on("-s", "--search QUERY", "Search clients by name") { |query| options[:search] = query }
  opts.on("-d", "--duplicates", "Find duplicate emails") { options[:duplicates] = true }
  opts.on("-h", "--help", "Show this help message") do
    puts opts
    exit
  end
end.parse!

options[:file] ||= "clients.json"

client_manager = ClientManager.new(options[:file])

if options[:search]
  puts "Search results for '#{options[:search]}':"
  display_clients(client_manager.search_by_name(options[:search]))
elsif options[:duplicates]
  display_duplicate_emails(client_manager.find_duplicate_emails)
else
  puts "Please specify an operation (--search or --duplicates)"
  puts "Use --help for more information"
end
