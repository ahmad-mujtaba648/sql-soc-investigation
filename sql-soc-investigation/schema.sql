-------------- 1. Employees Table--------------
CREATE TABLE employees (
    emp_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    department TEXT NOT NULL
);

--<-------------------------------------------->

--------------- 2. Devices Table----------------
CREATE TABLE devices (
    device_id TEXT PRIMARY KEY,
    emp_id INTEGER,
    os_name TEXT NOT NULL,
    last_patch_date DATE NOT NULL
);

--<-------------------------------------------->

----------------3. Log In Attempts Table---------
CREATE TABLE log_in_attempts (
    event_id INTEGER PRIMARY KEY AUTOINCREMENT,
    emp_id INTEGER,
    device_id TEXT,
    login_time DATETIME NOT NULL,
    country TEXT NOT NULL,
    source_ip TEXT NOT NULL,
    status TEXT NOT NULL
);

--<-------------------------------------------->
--<----------------------------------------------->

---------------Insert Employees-------------------
INSERT INTO employees (emp_id, name, department) VALUES
(101, 'Ali Khan', 'Finance'),
(102, 'Sara Ahmed', 'Engineering'),
(103, 'Usman Tariq', 'Marketing'),
(104, 'Maria Garcia', 'HR'),
(105, 'Bilal Raza', 'IT Support');

--<-------------------------------------------->

--------------Insert Devices-----------------------
INSERT INTO devices (device_id, emp_id, os_name, last_patch_date) VALUES
('DEV-001', 101, 'Windows 11', '2026-09-15'),
('DEV-002', 102, 'macOS Sonoma', '2026-10-01'),
('DEV-003', 103, 'Ubuntu 24.04', '2026-08-20'),
('DEV-004', 104, 'Windows 10', '2025-11-10'),
('DEV-005', 105, 'Windows 11', '2026-09-25');

--<-------------------------------------------->

---Insert Login Logs (Attacks & Normal Activity-----
INSERT INTO log_in_attempts (emp_id, device_id, login_time, country, source_ip, status) VALUES
(101, 'DEV-001', '2026-10-25 09:00:00', 'Pakistan', '192.168.1.15', 'SUCCESS'),
(102, 'DEV-002', '2026-10-25 09:15:00', 'Pakistan', '192.168.1.20', 'SUCCESS'),
(101, 'DEV-001', '2026-10-25 23:10:12', 'Russia', '185.220.101.5', 'FAILED'),
(101, 'DEV-001', '2026-10-25 23:11:05', 'Russia', '185.220.101.5', 'FAILED'),
(101, 'DEV-001', '2026-10-25 23:11:45', 'Russia', '185.220.101.5', 'FAILED'),
(101, 'DEV-001', '2026-10-25 23:12:40', 'Russia', '185.220.101.5', 'SUCCESS'),
(104, 'DEV-004', '2026-10-26 08:30:00', 'Pakistan', '192.168.1.45', 'SUCCESS'),
(NULL, 'DEV-999', '2026-10-26 03:00:00', 'Unknown', '10.0.0.99', 'SUCCESS'),
(105, 'DEV-005', '2026-10-26 14:00:00', 'Pakistan', '192.168.1.50', 'SUCCESS'),
(105, 'DEV-005', '2026-10-26 14:20:00', 'Brazil', '177.18.90.11', 'SUCCESS');


--<-------------------------------------------->
--<----------------------------------------------->