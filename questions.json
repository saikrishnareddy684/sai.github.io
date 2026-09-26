const QUESTIONS_FILE = "questions.json";

async function loadQuestions() {

    const response = await fetch(QUESTIONS_FILE);

    if (!response.ok) {
        throw new Error("Unable to load questions.json");
    }

    return await response.json();
}


function getQuestionFromForm() {

    return {

        q: document.getElementById("question").value.trim(),

        options: [
            document.getElementById("option1").value.trim(),
            document.getElementById("option2").value.trim(),
            document.getElementById("option3").value.trim(),
            document.getElementById("option4").value.trim()
        ],

        answer: parseInt(
            document.getElementById("answer").value
        ),

        time: 40,

        level: document.getElementById("level").value,

        topic: document.getElementById("topic").value.trim(),

        dataset: document.getElementById("dataset").value.trim(),

        expectedOutput:
            document.getElementById("expectedOutput").value.trim(),

        explanation:
            document.getElementById("explanation").value.trim()
    };
}


async function checkAndAdd() {

    const status = document.getElementById("status");

    try {

        const newQuestion = getQuestionFromForm();

        if (!newQuestion.q) {
            alert("Please enter the question.");
            return;
        }

        if (
            newQuestion.options.some(option => option === "")
        ) {
            alert("Please enter all four options.");
            return;
        }

        const questions = await loadQuestions();

        const duplicate = questions.find(q =>
            q.q.toLowerCase() === newQuestion.q.toLowerCase()
        );

        if (duplicate) {

            status.className = "";
            status.innerHTML = `
                <strong>Duplicate question found!</strong>
                <br><br>
                ${escapeHtml(duplicate.q)}
            `;

            return;
        }

        /*
         * TEMPORARY:
         * Display the JSON that would be added.
         *
         * GitHub API integration comes next.
         */

        status.className = "";

        status.innerHTML = `
            <strong>Question is ready to add.</strong>
            <br><br>
            ${escapeHtml(newQuestion.q)}
            <br><br>
            <pre>${escapeHtml(
                JSON.stringify(newQuestion, null, 2)
            )}</pre>
        `;

    } catch (error) {

        console.error(error);

        status.className = "";

        status.innerHTML =
            "Error loading questions.json.";

    }
}


function clearForm() {

    document.querySelectorAll(
        "input, textarea"
    ).forEach(element => {
        element.value = "";
    });

    document.getElementById("answer").value = "0";
    document.getElementById("level").value = "Easy";

    document.getElementById("status").className = "hidden";
}


function escapeHtml(str) {

    return String(str)
        .replace(/&/g, "&amp;")
        .replace(/</g, "&lt;")
        .replace(/>/g, "&gt;");
}
