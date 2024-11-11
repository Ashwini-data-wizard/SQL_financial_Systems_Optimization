---Step 2: Stored Procedures for Data Automation and Processing
/*2.1 Stored Procedure for Predicting Next Quarter's Budget
---This procedure calculates average spending over the past year and projects it for the next quarter. It’s simplified here but could be made more complex with predictive analytics. */

CREATE PROCEDURE PredictNextQuarterBudget
AS
BEGIN
    INSERT INTO ForecastedTransactions (DepartmentID, ForecastDate, ForecastedAmount)
    SELECT DepartmentID, DATEADD(QUARTER, 1, GETDATE()), AVG(Amount) * 1.1
    FROM Transactions
    WHERE TransactionDate >= DATEADD(YEAR, -1, GETDATE())
    GROUP BY DepartmentID;
END;
GO

/* 2.2 Stored Procedure for High-Value Transaction Approval 
This procedure flags transactions above a certain threshold and marks them as "Pending Approval." */

CREATE PROCEDURE FlagHighValueTransactions
AS
BEGIN
    UPDATE Transactions
    SET ApprovalStatus = 'Pending Approval'
    WHERE Amount > 10000 AND ApprovalStatus = 'Pending';
END;
GO

/* 2.3 Error Logging and Notification
Logs critical errors and notifies administrators via email. */

CREATE PROCEDURE LogAndNotifyError
    @ErrorMsg NVARCHAR(255)
AS
BEGIN
    INSERT INTO ExceptionReports (ErrorMessage)
    VALUES (@ErrorMsg);

    EXEC msdb.dbo.sp_send_dbmail
        @profile_name = 'FinanceAlertsProfile',
        @recipients = 'financealerts@company.com',
        @subject = 'Critical Error in Financial System',
        @body = @ErrorMsg;
END;
GO

