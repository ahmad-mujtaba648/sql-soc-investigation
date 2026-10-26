---==========================================================
-- ==============SOC Investigation Queries==============
-- ==============Author: Ahmad Mujtaba==================
-- =Purpose: Security incident detection & database auditing=
-- ==========================================================

-----1. Detect External Brute Force Attacks (Failed attempts >= 3)--------------
SELECT country, COUNT(*) AS failed_attempts
FROM log_in_attempts 
WHERE status = 'FAILED' 
GROUP BY country
HAVING COUNT(*) >= 3;

--<----------------------->


-----2. Correlate Attacker IP with Compromised Employee Account------------------
SELECT 
    employees.name,
    employees.department,
    log_in_attempts.source_ip,
    log_in_attempts.status
FROM log_in_attempts 
INNER JOIN employees ON log_in_attempts.emp_id = employees.emp_id 
WHERE source_ip = '185.220.101.5' AND status = 'SUCCESS';

--<----------------------->


----3. Identify High-Risk / Unpatched Systems (Older than Aug 2026)------------------
SELECT 
    devices.device_id,
    devices.os_name,
    devices.last_patch_date,
    employees.name,
    employees.department
FROM devices 
INNER JOIN employees ON devices.emp_id = employees.emp_id
WHERE last_patch_date < '2026-08-01';

--<----------------------->


-----4. Hunt Rogue / Unassigned Machines (Shadow IT Detection)-------
SELECT 
    event_id,
    log_in_attempts.device_id,
    source_ip,
    status,
    devices.emp_id
FROM log_in_attempts 
LEFT JOIN devices ON log_in_attempts.device_id = devices.device_id 
WHERE devices.emp_id IS NULL;

--<----------------------->


------5. Impossible Travel & Geolocation Anomalies----------------
SELECT 
    emp_id,
    login_time,
    country,
    source_ip,
    status
FROM log_in_attempts 
WHERE country != 'Pakistan' AND status = 'SUCCESS';

--<----------------------->


-------6. Comprehensive Incident Report (3-Table Correlation)------
SELECT 
    employees.name,
    employees.department,
    devices.os_name,
    log_in_attempts.country,
    log_in_attempts.source_ip,
    log_in_attempts.status
FROM log_in_attempts 
INNER JOIN employees ON log_in_attempts.emp_id = employees.emp_id
INNER JOIN devices ON log_in_attempts.device_id = devices.device_id
WHERE country = 'Russia' AND status = 'SUCCESS';

--<----------------------->


-------7. Identify Top Attacking IP Address------------------
SELECT source_ip, COUNT(*) AS attack_count
FROM log_in_attempts
WHERE status = 'FAILED'
GROUP BY source_ip
ORDER BY COUNT(*) DESC
LIMIT 1;