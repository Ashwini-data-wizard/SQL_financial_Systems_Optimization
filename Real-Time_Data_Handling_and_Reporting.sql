--Step 4: Triggers for Real-Time Data Handling
/* 4.1 Trigger for Automatic Audit Logging
This trigger records user actions for changes in the Transactions table. */

CREATE TRIGGER trgTransactionsAudit
ON Transactions
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @UserID NVARCHAR(50) = SYSTEM_USER;
    DECLARE @Action NVARCHAR(255);

    IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
        SET @Action = 'Updated Transaction';
    ELSE IF EXISTS (SELECT * FROM inserted)
        SET @Action = 'Inserted Transaction';
    ELSE
        SET @Action = 'Deleted Transaction';

    INSERT INTO AuditLog (UserID, Action)
    VALUES (@UserID, @Action);
END;
GO

--Step 5: Scheduled Jobs and Real-Time Reporting

/* 5.1 Scheduled Report Generation
You can set up SQL Server Agent jobs to run stored procedures (e.g., PredictNextQuarterBudget) on a schedule. Here's an example of a job to call our budget prediction procedure daily. */

EXEC dbo.PredictNextQuarterBudget;

