--Step 3: Views for User-Specific Data Access

/*3.1 Manager Summary View
This view summarizes total expenditures by department for managers. */

CREATE VIEW ManagerSummaryView AS
SELECT 
    d.DepartmentID, 
    d.DepartmentName, 
    SUM(t.Amount) AS TotalExpenses,
    b.AllocatedBudget,
    (b.AllocatedBudget - SUM(t.Amount)) AS BudgetRemaining
FROM Departments d
JOIN Transactions t ON d.DepartmentID = t.DepartmentID
JOIN Budgets b ON d.DepartmentID = b.DepartmentID
GROUP BY d.DepartmentID, d.DepartmentName, b.AllocatedBudget;
GO