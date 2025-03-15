# ShiftCare CLI Application

## 🚀 Overview

The **ShiftCare CLI Application** is a simple and efficient command-line tool written in **Ruby**. It allows users to search for clients and detect duplicate email addresses within a dataset. The application is designed to be **easy to install, run, and use anywhere** without requiring prior Ruby expertise.

## 🎯 Features

- 🔍 **Search Clients by Name** – Quickly find clients using case-insensitive name search.
- 📧 **Detect Duplicate Emails** – Identify clients sharing the same email address.
- 🛠 **Error Handling** – Provides clear error messages for missing files or invalid JSON.
- 📂 **Minimal Setup** – No external database required; works with simple JSON files.
- ✅ **Unit-Tested** – Includes automated tests using `minitest`.

## 📌 Prerequisites

To run this application, ensure you have the following:

- **Ruby 3.x or later**
- **Bundler** (dependency manager for Ruby)

Check if Ruby is installed:
```bash
ruby -v
```
If Ruby is not installed, use:
```bash
sudo apt install -y ruby-full
```

## 📦 Installation

### Clone the Repository
Anyone can download and use this project by running:
```bash
git clone https://github.com/MorningStar631/ruby-client-cli.git
cd ruby-client-cli
```

### Install Dependencies
```bash
bundle install
```

### Make the Script Executable
```bash
chmod +x client_manager.rb
```

## 🛠 Usage

### 🔍 Search for Clients
To search for a client by name:
```bash
ruby client_manager.rb --search "John"
```
Example Output:
```
Search results for 'John':
ID: 1, Name: John Doe, Email: john.doe@gmail.com
```

### 📧 Detect Duplicate Emails
To list clients with duplicate emails:
```bash
ruby client_manager.rb --duplicates
```
Example Output:
```
Found 1 duplicate email(s):

Email: jane.smith@yahoo.com
2 clients with this email:
  ID: 2, Name: Jane Smith
  ID: 5, Name: Another Jane Smith
```

## 🧪 Running Tests

To ensure everything is working correctly, run the test suite:
```bash
ruby client_manager_spec.rb
```
Example Output:
```
3 runs, 3 assertions, 0 failures
```

## 📂 Project Structure
```
ruby-client-cli/
│── client_manager.rb         # Main script
│── clients.json              # JSON data file
│── client_manager_spec.rb    # Test suite
│── Gemfile                   # Dependency manager
│── README.md                 # Documentation
```

## 🚀 Running the CLI Anywhere
To run the script globally from any directory:

### Option 1: Add to System Path
```bash
echo "export PATH=\"$PWD:\$PATH\"" >> ~/.bashrc
source ~/.bashrc
```
Then use:
```bash
client_manager.rb --search "John"
```

### Option 2: Create a Global Command
```bash
ln -s $PWD/client_manager.rb /usr/local/bin/client_manager
```
Now you can simply run:
```bash
client_manager --search "John"
```

## 📜 License

This project is released under the **MIT License**. Anyone is free to use, modify, and contribute.

---

🚀 **This tool is built for simplicity and ease of use. Install and run it anywhere!**
