
 🧰 Wipro Project 5 – Linux Maintenance Automation Suite
 📘 Overview
The **Maintenance Suite** is a shell script-based automation tool designed to simplify routine Linux system maintenance tasks such as backups, updates, log cleaning, and system monitoring.  
It helps system administrators and developers automate repetitive tasks efficiently.

---

 🚀 Features
- 📦 **Automated Backup:** Creates timestamped backups of important directories.
- 🔄 **System Updates:** Runs system updates using apt package manager.
- 🧹 **Log Cleanup:** Deletes old log files to free up disk space.
- 📊 **System Monitoring:** Displays CPU, memory, and disk usage.
- 🕒 **Daily Scheduling:** Can be set up using `cron` jobs for automatic daily runs.
- 🧾 **Error Logging:** All activities are logged with timestamps.

---

 📂 Project Structure
```

maintenance_suite/
├── backup.sh
├── update_system.sh
├── clean_logs.sh
├── monitor_system.sh
├── menu.sh
└── logs/
└── maintenance.log

````

---

⚙️ Installation & Setup

1️⃣ Clone the Repository
```bash
git clone https://github.com/your-username/wipro-project-5.git
cd wipro-project-5
````

2️⃣ Give Execution Permissions

```bash
chmod +x *.sh
```

3️⃣ Run the Menu Script

```bash
./menu.sh
```

You’ll see an interactive menu with options like:

```
1. Run Backup
2. Update System
3. Clean Logs
4. Monitor System
5. Exit
```

---

💾 Backup Details

The backup script creates compressed `.tar.gz` files in:

```
/backup/daily/
```

Each file is timestamped like:

```
backup_YYYY-MM-DD_HH-MM-SS.tar.gz
```

---

🧰 Example Log Output

```
[2025-11-07 14:25:58] Running backup script...
[2025-11-07 14:25:58] [SUCCESS] Backup created successfully at: /backup/daily/backup_2025-11-07_14-25-58.tar.gz
[2025-11-07 14:25:58] Backup completed successfully!
```

---

Common Issues & Fixes

❌ Error: `tar command failed!`

**Fix:**

* Ensure the `/backup/daily/` directory exists:

  ```bash
  sudo mkdir -p /backup/daily/
  ```
* Give proper write permissions:

  ```bash
  sudo chmod -R 777 /backup/
  ```

❌ Error: `No such file or directory`

**Fix:**
Make sure you are in the correct folder:

```bash
cd ~/maintenance_suite
```

Then run:

```bash
./menu.sh
```

---

🕒 Automate Daily Backup with Cron

To schedule the backup automatically every day at 2 AM:

```bash
crontab -e
```

Then add this line:

```
0 2 * * * /path/to/maintenance_suite/backup.sh >> /path/to/maintenance_suite/logs/cron_backup.log 2>&1
```

---

🧑‍💻 Author

**Developed by:** Asish Mohanty
**Organization:** Wipro Project Submission 2025
**Language:** Bash Shell Script
**Platform:** Linux / Ubuntu

---

📜 License

This project is open-source and available under the [MIT License](LICENSE).

---

🖼️ GitHub Repository

👉 [https://github.com/your-username/wipro-project-5](https://github.com/your-username/wipro-project-5)

---

```

Would you like me to **generate this as a `README.md` file** you can directly upload to your GitHub repo?
```
