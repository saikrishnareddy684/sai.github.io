<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>SQL Server MCQ Quiz</title>
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
    }
    .timer {
      font-weight: bold;
      margin-bottom: 10px;
      color: #d9534f;
    }
    #submitBtn {
      margin-top: 20px;
      padding: 10px 15px;
      background-color: #007bff;
      color: white;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }
    #result {
      margin-top: 20px;
      background: #e9ffe9;
      padding: 15px;
      border-radius: 10px;
    }
  </style>
</head>
<body>
  <div class="container">
    <div id="quiz"></div>
    <button id="submitBtn" onclick="submitQuiz()">Submit Exam</button>
    <div id="result"></div>
  </div>

  <script>
    const questions = [
      {
        q: "Which SQL statement is used to extract data from a database?",
        options: ["GET", "OPEN", "SELECT", "EXTRACT"],
        answer: 2,
        time: 20
      },
      {
        q: "Which function is used to count the number of rows in SQL?",
        options: ["COUNT()", "SUM()", "NUMBER()", "TOTAL()"],
        answer: 0,
        time: 25
      },
      {
        q: "What does the SQL WHERE clause do?",
        options: [
          "Limits the rows returned",
          "Sorts data",
          "Joins tables",
          "Creates a new table"
        ],
        answer: 0,
        time: 30
      },
      {
        q: "Which SQL keyword is used to change data in a table?",
        options: ["MODIFY", "UPDATE", "CHANGE", "SET"],
        answer: 1,
        time: 20
      },
      {
        q: "Which of these is used to give a table or column a temporary name?",
        options: ["NICKNAME", "RENAME", "ALIAS", "TEMP"],
        answer: 2,
        time: 25
      }
    ];

    let current = 0;
    let userAnswers = [];
    let timer;
    let secondsLeft;

    function loadQuestion(index) {
      clearInterval(timer);
      const q = questions[index];
      secondsLeft = q.time;

      document.getElementById("quiz").innerHTML = `
        <div class="timer">Time Left: <span id="timer">${secondsLeft}</span>s</div>
        <div class="question">Q${index + 1}. ${q.q}</div>
        <div class="options">
          ${q.options.map((opt, i) => `
            <label><input type="radio" name="option" value="${i}"> ${opt}</label>
          `).join('')}
        </div>
      `;

      timer = setInterval(() => {
        secondsLeft--;
        document.getElementById("timer").textContent = secondsLeft;
        if (secondsLeft <= 0) {
          userAnswers.push(null);
          nextQuestion();
        }
      }, 1000);
    }

    function nextQuestion() {
      clearInterval(timer);
      if (current < questions.length - 1) {
        current++;
        loadQuestion(current);
      } else {
        submitQuiz();
      }
    }

    function submitQuiz() {
      clearInterval(timer);
      const selected = document.querySelector("input[name='option']:checked");
      if (selected && userAnswers.length < questions.length) {
        userAnswers.push(parseInt(selected.value));
      }
      showResult();
    }

    function showResult() {
      let score = 0;
      let resultHTML = "<h3>Your Results:</h3><ul>";

      questions.forEach((q, i) => {
        const userAns = userAnswers[i];
        const correct = q.answer;
        const correctText = q.options[correct];
        const userText = userAns !== null ? q.options[userAns] : "(No Answer)";

        if (userAns === correct) score++;

        resultHTML += `<li><strong>Q${i + 1}:</strong> ${q.q}<br>
          Your Answer: ${userText}<br>
          Correct Answer: ${correctText}</li><br>`;
      });

      resultHTML += `</ul><h4>Score: ${score} / ${questions.length}</h4>`;
      document.getElementById("quiz").style.display = "none";
      document.getElementById("submitBtn").style.display = "none";
      document.getElementById("result").innerHTML = resultHTML;
    }

    loadQuestion(current);
  </script>
</body>
</html>
