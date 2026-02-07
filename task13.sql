USE intern_training_db;

CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    account_holder VARCHAR(100),
    balance DECIMAL(10,2) CHECK (balance >= 0)
) ENGINE = InnoDB;

INSERT INTO accounts VALUES
(1, 'Kiran', 5000),
(2, 'Ravi', 3000);

SET autocommit = 0;

START TRANSACTION;

UPDATE accounts SET balance = balance - 500 WHERE account_id = 1;
UPDATE accounts SET balance = balance + 500 WHERE account_id = 2;

COMMIT;

SELECT * FROM accounts;

#Use START TRANSACTION, COMMIT, and ROLLBACK.
/*START TRANSACTION
Begins a transaction block.

COMMIT
Permanently saves changes.

ROLLBACK
Cancels all changes made after START TRANSACTION.*/

#failure & rollback changes
START TRANSACTION;

UPDATE accounts SET balance = balance - 500 WHERE account_id = 1;
UPDATE accounts SET balance = balance + 500 WHERE account_id = 999; -- invalid

ROLLBACK;

#Understand Atomicity, Consistency, Isolation, Durability
/*
A – Atomicity
All operations succeed or none succeed.
Example: Debit fails → Credit must also fail.

C – Consistency
Database moves from one valid state to another.
Constraints, rules, balances remain correct.

I – Isolation
Multiple transactions don’t affect each other.
One user’s transaction is invisible to others until committed.

D – Durability
Once committed, data is permanent.
Even system crash won’t lose committed data.*/

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

#transaction isolation levels
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

#concurrent data updates.
/*Problem: Two users updating same row at same time.

Solution

Transactions + Isolation levels ensure:
No data overwrite
No partial updates*/

#Prevent dirty reads.
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

#Map transactions to banking systems
/*Banking Action | Transaction Use        
--------------------------------------- 
 Money transfer | Debit + Credit         
 ATM withdrawal | Balance check + update 
 Online payment | Order + payment   */
 
 SELECT * FROM accounts;
 
 