<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>SQL MCQ Quiz (171 Questions)</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: #f4f4f4;
      padding: 20px;
      color: #333;
    }
    .container {
      max-width: 700px;
      margin: auto;
      background: white;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    .question {
      font-size: 1.2em;
      margin-bottom: 15px;
    }
    .options label {
      display: block;
      margin: 8px 0;
      cursor: pointer;
      padding: 8px;
      border-radius: 5px;
      transition: background-color 0.2s ease;
    }
    .options label:hover {
        background-color: #e2f0ff;
    }
    .options input[type="radio"] {
        margin-right: 10px;
    }
    .timer {
      font-weight: bold;
      margin-bottom: 10px;
      color: #d9534f;
    }
    #quizControls {
        display: flex;
        justify-content: space-between;
        flex-wrap: wrap;
        margin-top: 20px;
    }
    #quizControls button {
      padding: 10px 15px;
      background-color: #007bff;
      color: white;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      margin-right: 10px; /* Space between buttons */
      margin-bottom: 10px; /* For wrapping on small screens */
      font-size: 1em;
      transition: background-color 0.3s ease, transform 0.2s ease;
      flex-grow: 1; /* Allow buttons to grow */
      min-width: 120px; /* Minimum width for buttons */
    }
    #quizControls button:hover {
        background-color: #0056b3;
        transform: translateY(-2px);
    }
    #quizControls button:active {
        transform: translateY(0);
    }
    #prevBtn {
        background-color: #6c757d; /* Grey for Previous */
    }
    #prevBtn:hover {
        background-color: #5a6268;
    }
    #answerLaterBtn {
        background-color: #ffc107; /* Yellow for Answer Later */
        color: #333;
    }
    #answerLaterBtn:hover {
        background-color: #e0a800;
    }
    #submitBtn {
        background-color: #dc3545; /* Red for Submit */
    }
    #submitBtn:hover {
        background-color: #c82333;
    }
    #result {
      margin-top: 20px;
      background: #e9ffe9;
      padding: 15px;
      border-radius: 10px;
      border: 1px solid #c3e6cb;
    }
    #progress {
      font-size: 0.9em;
      color: #666;
      margin-bottom: 10px;
    }
    #restartBtn {
        margin-top: 20px;
        padding: 10px 15px;
        background-color: #28a745; /* Green */
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 1em;
        transition: background-color 0.3s ease, transform 0.2s ease;
    }
    #restartBtn:hover {
        background-color: #218838;
        transform: translateY(-2px);
    }
    #restartBtn:active {
        transform: translateY(0);
    }
    h3, h4 {
        color: #0056b3;
    }
    ul {
        list-style-type: none;
        padding: 0;
    }
    li {
        margin-bottom: 10px;
        padding-bottom: 5px;
        border-bottom: 1px dashed #eee;
    }
    li:last-child {
        border-bottom: none;
    }
    .pass {
        color: green;
        font-weight: bold;
    }
    .fail {
        color: red;
        font-weight: bold;
    }
    .question-navigation {
        margin-top: 20px;
        padding: 15px;
        background: #f8f9fa;
        border-radius: 10px;
        box-shadow: 0 0 5px rgba(0,0,0,0.05);
    }
    .question-numbers {
        display: flex;
        flex-wrap: wrap;
        gap: 8px;
    }
    .question-number {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 35px;
        height: 35px;
        border-radius: 50%;
        background-color: #e9ecef;
        color: #495057;
        font-weight: bold;
        cursor: pointer;
        transition: background-color 0.2s ease, transform 0.2s ease;
    }
    .question-number:hover {
        transform: translateY(-2px);
    }
    .question-number.answered {
        background-color: #28a745;
        color: white;
    }
    .question-number.unanswered {
        background-color: #dc3545;
        color: white;
    }
    .question-number.current {
        border: 2px solid #007bff;
        box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.5);
    }
  </style>
</head>
<body>
  <div class="container">
    <div id="quiz"></div>
    <div id="quizControls">
        <button id="prevBtn" onclick="goToPreviousQuestion()">Previous</button>
        <button id="nextBtn" onclick="saveAndMoveToNext()">Next</button>
        <button id="answerLaterBtn" onclick="answerLater()">Answer Later</button>
        <button id="submitBtn" onclick="submitQuiz()">Submit Exam</button>
    </div>
    <div id="questionList" class="question-navigation"></div>
    <div id="result"></div>
  </div>

  <script>
    // --- 171 SQL Questions Array Generated from the file ---
    let questions = [
      {
            "q": "Can we add a column with identity in existing table",
            "options": [
                  "Yes, by using the `ALTER COLUMN` command directly.",
                  "No, the operation is restricted or requires an alternative approach.",
                  "No, because it would violate the referential integrity.",
                  "You must drop and recreate the database."
            ],
            "answer": 1,
            "time": 20
      },
      {
            "q": "Can we add a column with not null in existing table",
            "options": [
                  "No, because it would violate the referential integrity.",
                  "Yes, by using the `ALTER COLUMN` command directly.",
                  "Yes, but a `DEFAULT` value must be provided for the existing rows.",
                  "You must drop and recreate the database."
            ],
            "answer": 2,
            "time": 20
      },
      {
            "q": "How to Creating an Incrementing Sequence Object in SQL Server:",
            "options": [
                  "You must use an `IDENTITY` column to generate sequential numbers.",
                  "The command to restart is `RESET SEQUENCE`.",
                  "Sequence values are only generated during table creation.",
                  "A SEQUENCE in SQL Server is a database object that generates a sequence of numeric values in order."
            ],
            "answer": 3,
            "time": 20
      },
      {
            "q": "How to Alter the object to reset the sequence value:",
            "options": [
                  "You must drop and recreate the database.",
                  "You must use an `IDENTITY` column to generate sequential numbers.",
                  "ALTER SEQUENCE dbo.SequenceObject RESTART WITH 1 is the correct command.",
                  "The command to restart is `RESET SEQUENCE`."
            ],
            "answer": 2,
            "time": 20
      },
      {
            "q": "questions on sequence",
            "options": [
                  "The command to restart is `RESET SEQUENCE`.",
                  "The command is unsupported and results in an error.",
                  "The DROP SEQUENCE command.",
                  "The solution is to use the `ROLLBACK` command."
            ],
            "answer": 2,
            "time": 20
      },
      {
            "q": "What is Clustered Index, a clustered index is a special type of index that physically stores and sorts the data rows in a table or view based on their key values. Because the data rows themselves are stored in sorted order, there can be only **one clustered index per table**.",
            "options": [
                  "A clustered index allows up to 5 indexes per table.",
                  "It dictates the physical, sorted storage order of the data rows.",
                  "The index is stored in memory (RAM) only.",
                  "The index structure is a Hash Table (Hash map)."
            ],
            "answer": 1,
            "time": 20
      },
      {
            "q": "What is max number of Clustered Index on a table",
            "options": [
                  "The value is stored in the master database.",
                  "The maximum limit is 16 per table.",
                  "Only one clustered index is allowed per table.",
                  "A clustered index allows up to 5 indexes per table."
            ],
            "answer": 2,
            "time": 20
      },
      {
            "q": "What is Page Split",
            "options": [
                  "The operation of moving half the rows from a full page to a new page to make room for insertions.",
                  "Page splits only occur during SELECT operations.",
                  "A page split is an error that corrupts the database.",
                  "The solution is to use the `ROLLBACK` command."
            ],
            "answer": 0,
            "time": 20
      },
      {
            "q": "What is Physical Structure of Clustered Index,",
            "options": [
                  "The index structure is a Hash Table (Hash map).",
                  "It is called a B-tree Hash map.",
                  "A B-Tree is the correct structure.",
                  "The functionality is reserved for Enterprise Edition only."
            ],
            "answer": 2,
            "time": 20
      },
      {
            "q": "What is Non-Clustered Index,",
            "options": [
                  "It dictates the physical, sorted storage order of the data rows.",
                  "It contains key values and row pointers, separate from the data.",
                  "A non-clustered index is stored in the same location as the data.",
                  "The command is unsupported and results in an error."
            ],
            "answer": 1,
            "time": 20
      },
      {
            "q": "How many Non-clustered Index can we have per table?",
            "options": [
                  "A non-clustered index is stored in the same location as the data.",
                  "Only one clustered index is allowed per table.",
                  "You must drop and recreate the database.",
                  "A table can have a maximum of 999 non-clustered indexes."
            ],
            "answer": 3,
            "time": 20
      },
      {
            "q": "What is Index fragmentation,",
            "options": [
                  "It is a feature related to distributed transactions only.",
                  "The index is stored in memory (RAM) only.",
                  "A condition where index data pages are scattered and not logically ordered, degrading performance.",
                  "It is the process of physically deleting the database file."
            ],
            "answer": 2,
            "time": 20
      },
      {
            "q": "What is difference between Index Rebuild and Index Reorganize.",
            "options": [
                  "Rebuild is online and faster, Reorganize is offline and slower.",
                  "Rebuild creates a new index and drops the old one; Reorganize physically reorders the leaf-level pages in place.",
                  "The solution is to use the `ROLLBACK` command.",
                  "Reorganize creates a new index and drops the old one; Rebuild physically reorders the leaf-level pages in place."
            ],
            "answer": 1,
            "time": 20
      },
      {
            "q": "What is Fill Factor in SQL Server index,",
            "options": [
                  "Fill factor only applies to the root node of the index.",
                  "It is a value from 0 to 100 that specifies the percentage of space to leave empty on each leaf-level page.",
                  "The functionality is reserved for Enterprise Edition only.",
                  "It specifies the maximum number of columns an index can contain."
            ],
            "answer": 1,
            "time": 20
      },
      {
            "q": "What is Covered Index in SQL Server?",
            "options": [
                  "An index that includes all the columns requested in the query, allowing the query to complete without looking up the data row.",
                  "It is a feature related to distributed transactions only.",
                  "The index is stored in memory (RAM) only.",
                  "The index structure is a Hash Table (Hash map)."
            ],
            "answer": 0,
            "time": 20
      },
      {
            "q": "What is the key difference between Truncate and Delete command in SQL Server?",
            "options": [
                  "DELETE is DDL and TRUNCATE is DML.",
                  "TRUNCATE is a DML command; DELETE is a DDL command.",
                  "DELETE is faster and doesn't use the transaction log; TRUNCATE is slower and uses the log.",
                  "TRUNCATE is DDL, logs minimal info, resets identity, and is faster; DELETE is DML, logs every row deletion, and is slower."
            ],
            "answer": 3,
            "time": 20
      },
      {
            "q": "What is difference between where and having in SQL Server?",
            "options": [
                  "`WHERE` is used for row filtering before aggregation; `HAVING` is used for group filtering after aggregation.",
                  "`HAVING` is faster than `WHERE` and is used only on indexed columns.",
                  "It is not possible in SQL Server.",
                  "`WHERE` is used for filtering data after aggregation; `HAVING` is used for filtering before aggregation."
            ],
            "answer": 0,
            "time": 20
      },
      {
            "q": "What is stored procedure in SQL Server?",
            "options": [
                  "A temporary object that holds data only for the current session.",
                  "A precompiled set of one or more SQL statements stored in the database.",
                  "The functionality is reserved for Enterprise Edition only.",
                  "An index that includes all the columns requested in the query."
            ],
            "answer": 1,
            "time": 20
      },
      {
            "q": "What is the key difference between stored procedure and function in SQL Server?",
            "options": [
                  "Functions can modify data and cannot be used in `SELECT` statements; Procedures can only return a single value.",
                  "Stored procedures can modify data and return 0 or more values; Functions cannot modify data (usually) and return a single value/table.",
                  "The command is unsupported and results in an error.",
                  "Functions can modify data; Procedures are read-only."
            ],
            "answer": 1,
            "time": 20
      },
      {
            "q": "What is difference between local temporary table and global temporary table?",
            "options": [
                  "Local temporary tables are visible to all sessions; Global temporary tables are visible only to the session that created them.",
                  "Local tables are prefixed with `##` and are session-specific; Global tables are prefixed with `#` and are visible to all sessions.",
                  "Local tables are prefixed with `#` and are session-specific; Global tables are prefixed with `##` and are visible to all sessions.",
                  "It is only available in older SQL Server versions."
            ],
            "answer": 2,
            "time": 20
      },
      {
            "q": "How to create a global temporary table:",
            "options": [
                  "CREATE GLOBAL TABLE #TableName",
                  "CREATE TABLE ##TableName",
                  "It is not possible in SQL Server.",
                  "CREATE TABLE ##TableName (Col1 INT)"
            ],
            "answer": 3,
            "time": 20
      },
      {
            "q": "What is the key difference between Table Variable and Temporary Table?",
            "options": [
                  "Table variables are stored in the `tempdb` database; Temporary tables are stored in memory.",
                  "Table variables are session-specific; Temporary tables are visible to all sessions.",
                  "Table variables do not support indexes and are used within a single batch/SP; Temporary tables support indexes and can be retained longer.",
                  "The functionality is reserved for Enterprise Edition only."
            ],
            "answer": 2,
            "time": 20
      },
      {
            "q": "What is difference between UNION and UNION ALL?",
            "options":
