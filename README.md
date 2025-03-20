Scryper Network Tool is your ultimate command-line network diagnostic suite. Whether you're a tech enthusiast, network admin, or just want powerful tools in your hands, Scryper provides everything you need in one place. 🔥

Ping a Website or IP
Track IP addresses
Run DNS Lookups
Advanced Tools for Premium Users: VPN checker, bandwidth tests, and more!
Customizable: Add, edit, and manage your own user accounts.
🌟 Key Features
💻 Free Tools (Available to everyone)
Ping a Website or IP: Test network connectivity with ease.
Get Your Public IP: Quickly fetch your public IP.
Track an IP Address: Lookup detailed IP information such as location, ISP, and organization.
Run Network Diagnostics: Perform Traceroute (Tracert) and DNS lookups directly from the command line.
💎 Premium Tools (Exclusive for paid users)
VPN Monitor: Check if a VPN is active on a connection.
Bandwidth Test: Measure your connection speed directly from the command line.
Advanced IP Geolocation: Get detailed information about any IP address.
🛠️ Admin Tools
User Management: Admins can view users, modify passwords, and manage accounts.
Logs: Keep track of activity with built-in logging features for actions like DNS lookups, Tracert results, and more.
🔒 Secure Login & Registration
Create User Accounts: Easily register with your email and a secure password.
Login: Existing users can log in, while new users can create accounts.
Admin Control: Full control for admins to view all users, change passwords, and more.
🚀 Installation Guide
Step 1: Download the Files
Clone this repository or download the ZIP from GitHub:

git clone https://github.com/leandro201333/scryper-network-tool.git
Step 2: Install Prerequisites
Windows OS: This tool is built for Windows.

Curl: Ensure curl is installed to fetch data (like your public IP or IP geolocation).

If you don't have curl, download and install it from here.

Step 3: Set Up users.txt
The users.txt file stores your users' credentials.
Format for users.txt:

username password account_type
admin adminpassword admin
user1 user1password free
user2 user2password free
paid userpassword paid
Step 4: Run the Tool
Double-click scryper.bat to launch the tool. Follow the prompts to either log in or register.
🔧 How To Use
Login/Registration:

On launch, choose Login or Register.
If you register, create a username, password, and provide your email.
Accessing Tools:

Once logged in, you'll be presented with the main menu.
Free Users have access to basic tools.
Paid Users unlock exclusive tools like VPN monitoring and bandwidth tests.
Admins can manage users, view logs, and adjust settings.
Logging Out:

You can log out at any time by selecting the "Log Out" option in the Account Settings.
Admin Features:

Admins can view and manage user accounts, including changing passwords, viewing logs, and more!
📝 Example of Commands
Ping Test: Ping an IP or website to test network latency.



PING google.com
IP Tracker: Get detailed geolocation data for an IP.


IP-TRACKER 8.8.8.8
Traceroute: Perform a traceroute on a domain or IP.


TRACERT google.com
DNS Lookup: Check the DNS information of a domain.


💡 Why Use Scryper?
All-in-One Network Tool: Scryper combines essential network tools in one sleek command-line interface.
Lightweight: No need for heavy software installations. It’s a simple .bat file you can run anywhere.
Free & Paid Tools: Whether you’re just starting or a pro, Scryper offers both free and premium tools, with even more tools for paid users.
User-Friendly: Manage your network activities easily with intuitive menus and an interactive interface.
📈 Contribute
We welcome contributions from everyone! Whether it’s bug fixes, new feature ideas, or improvements, feel free to open issues and pull requests.

To Contribute:
Fork the repository
Create a new branch
Make your changes
Submit a pull request
⚖️ License
This project is licensed under the MIT License - see the LICENSE file for details.

⚠️ Important Note
Security: Please keep in mind that Scryper Network Tool does not encrypt passwords in its current version. This is a simple prototype. In production, password encryption should be implemented for security purposes.
