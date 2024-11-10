# SQL_financial_Systems_Optimization
## Business Problem 
I identified a scenario inspired by real-world challenges often faced by finance departments. These issues typically include manual data handling, inconsistent budget tracking, and a lack of real-time insights for department leaders. My goal was to design a SQL-based solution to automate financial processes, improve budget forecasts, and create a user-friendly system for managing data. This project aimed to demonstrate SQL's capacity to address complex business needs in a finance context.

## Tasks
The core tasks for this project were to develop a fully functional database system capable of

- Automating routine tasks, such as flagging high-value transactions for approval.
- Providing budget forecasts based on historical data.
- Maintaining compliance by logging user actions.
- Offering real-time insights to managers through a dashboard.
- Tracking errors to ensure system reliability.

The technical requirements included designing tables, creating stored procedures, building triggers, and setting up data views compatible with Tableau for data visualization.

## Plan Of Action
To achieve the project objectives, I undertook the following steps: 

### 1. Database Design:
- Developed tables for Departments, Transactions, Budgets, and ForecastedTransactions, with additional tables for AuditLog and ExceptionReports to capture user actions and system errors.
- This design provided an organized data structure, facilitating efficient querying for compliance and reporting purposes.
### 2. Stored Procedures for Automation:
- Created a PredictNextQuarterBudget stored procedure, which forecasts budgets based on previous spending patterns.
- Developed a FlagHighValueTransactions procedure that flags transactions above a specified threshold (e.g., $10,000) for approval. This simulated automated financial oversight.
### 3. Triggers for Auditing:
- Implemented the trgTransactionsAudit trigger to record all changes to the Transactions table, logging each action along with the username and timestamp in the AuditLog table, thereby ensuring traceability and compliance.
### 4. Error Logging and Notifications:
- Designed a LogAndNotifyError procedure to capture system errors in the ExceptionReports table and send email alerts to administrators. This setup demonstrated proactive monitoring and error management.
### 5. View and Real-Time Reporting Dashboard:
- Created a SQL view, ManagerSummaryView, to aggregate departmental budget and transaction data, which included budget remaining calculations.
- Linked this view to Power BI, creating a real-time dashboard that provided financial managers with updated insights on budget status and spending patterns. Set up regular refreshes in Power BI to maintain data currency.
### 6. Scheduled Jobs:
- Used SQL Server Agent to automate the daily execution of key stored procedures, simulating a real-world financial environment where daily updates are essential.

## Result
### 1. Automated Key Processes:
- By automating approvals for high-value transactions and forecasting budgets, the system reduced the hypothetical workload for finance managers, enabling a focus on analysis rather than manual entry.
### 2. Enhanced Compliance and Transparency:
- The audit logs and error notifications provided robust compliance tracking, simulating real-world needs for accountability and traceability.
### 3. Real-Time Insights:
- The Power BI dashboard offered managers an intuitive, real-time interface for monitoring budgets, tracking spending patterns, and identifying budget risks promptly.
###4. Demonstrated SQL’s Capabilities:
- This project highlighted SQL's capabilities beyond data storage, demonstrating its utility in handling complex financial processes, from forecasting and error handling to compliance tracking.

## Conclusion :  

Through this project, I showcased how SQL and data management concepts can be practically applied to address real-world finance challenges. Presenting this work to my class, I emphasized the value of bringing theoretical knowledge into impactful applications that streamline operations and enhance decision-making for finance departments.
