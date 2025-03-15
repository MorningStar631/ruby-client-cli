require 'minitest/autorun'
require_relative 'client_manager'

class ClientManagerTest < Minitest::Test
  def setup
    @test_file = "test_clients.json"
    @test_clients = [
      { "id" => 1, "full_name" => "John Doe", "email" => "john.doe@gmail.com" },
      { "id" => 2, "full_name" => "Jane Smith", "email" => "jane.smith@yahoo.com" },
      { "id" => 3, "full_name" => "Michael Brown", "email" => "michael.brown@inbox.com" },
      { "id" => 4, "full_name" => "Another Jane Smith", "email" => "jane.smith@yahoo.com" }
    ]

    File.write(@test_file, JSON.generate(@test_clients))
    @client_manager = ClientManager.new(@test_file)
  end

  def teardown
    File.delete(@test_file) if File.exist?(@test_file)
  end

  def test_search_by_name
    result = @client_manager.search_by_name("jane")
    assert_equal 2, result.length
  end

  def test_find_duplicate_emails
    duplicates = @client_manager.find_duplicate_emails
    assert_equal 1, duplicates.keys.length
  end
end
