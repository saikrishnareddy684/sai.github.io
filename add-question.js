const QUESTIONS_FILE = "questions.json";


/* -----------------------------
   LOAD EXISTING QUESTIONS
----------------------------- */

async function loadQuestions() {

    const response = await fetch(QUESTIONS_FILE);

    if (!response.ok) {
        throw new Error("Unable to load questions.json");
    }

    return await response.json();
}


/* -----------------------------
   PARSE QUESTION
----------------------------- */

function parseQuestion(text) {

    const result = {

        q: "",
        options: [],
        answer: null,
        time: 40,
        level: "Medium",
        topic: "",
        dataset: "",
        expectedOutput: "",
        explanation: ""

    };


    /* Question */

    const questionMatch =
        text.match(/Question\s*:\s*([\s\S]*?)(?=\n\s*Options\s*:)/i);

    if (questionMatch) {

        result.q =
            questionMatch[1].trim();

    }


    /* Options */

    const optionsMatch =
        text.match(/Options\s*:\s*([\s\S]*?)(?=\n\s*Answer\s*:)/i);

    if (optionsMatch) {

        const lines =
            optionsMatch[1]
            .split("\n")
            .map(x => x.trim())
            .filter(x => x);

        result.options =
            lines.map(line =>
                line.replace(/^\d+[\.\)]\s*/, "")
                    .trim()
            );

    }


    /* Answer */

    const answerMatch =
        text.match(/Answer\s*:\s*([^\n]+)/i);

    if (answerMatch) {

        const answerText =
            answerMatch[1].trim();

        const numberMatch =
            answerText.match(/^(\d+)/);

        if (numberMatch) {

            result.answer =
                parseInt(numberMatch[1]) - 1;

        }

    }


    /* Dataset */

    const datasetMatch =
        text.match(/Dataset\s*:\s*([\s\S]*?)(?=\n\s*(Expected Output|Level|Topic|Explanation)\s*:)/i);

    if (datasetMatch) {

        result.dataset =
            datasetMatch[1].trim();

    }


    /* Expected Output */

    const outputMatch =
        text.match(/Expected Output\s*:\s*([\s\S]*?)(?=\n\s*(Dataset|Level|Topic|Explanation)\s*:)/i);

    if (outputMatch) {

        result.expectedOutput =
            outputMatch[1].trim();

    }


    /* Level */

    const levelMatch =
        text.match(/Level\s*:\s*([^\n]+)/i);

    if (levelMatch) {

        result.level =
            levelMatch[1].trim();

    }


    /* Topic */

    const topicMatch =
        text.match(/Topic\s*:\s*([^\n]+)/i);

    if (topicMatch) {

        result.topic =
            topicMatch[1].trim();

    }


    /* Explanation */

    const explanationMatch =
        text.match(/Explanation\s*:\s*([\s\S]*)/i);

    if (explanationMatch) {

        result.explanation =
            explanationMatch[1].trim();

    }


    return result;
}


/* -----------------------------
   CHECK & ADD
----------------------------- */

async function checkAndAdd() {

    const status =
        document.getElementById("status");

    const text =
        document.getElementById("questionInput").value.trim();


    if (!text) {

        status.innerHTML =
            "<strong>Please paste a question.</strong>";

        return;
    }


    try {

        const newQuestion =
            parseQuestion(text);


        /* Validate */

        if (!newQuestion.q) {

            status.innerHTML =
                "<strong>Could not find Question.</strong>";

            return;
        }


        if (newQuestion.options.length !== 4) {

            status.innerHTML =
                `<strong>Expected 4 options but found ${newQuestion.options.length}.</strong>`;

            return;
        }


        if (
            newQuestion.answer === null ||
            newQuestion.answer < 0 ||
            newQuestion.answer >= newQuestion.options.length
        ) {

            status.innerHTML =
                "<strong>Could not determine the correct answer.</strong>";

            return;
        }


        /* Load existing questions */

        const questions =
            await loadQuestions();


        /* Duplicate check */

        const duplicate =
            questions.find(q =>
                q.q &&
                q.q.trim().toLowerCase() ===
                newQuestion.q.trim().toLowerCase()
            );


        if (duplicate) {

            status.innerHTML = `
                <strong>⚠ Duplicate question found!</strong>
                <br><br>
                ${escapeHtml(duplicate.q)}
            `;

            return;
        }


        /* Display parsed result */

        status.innerHTML = `

            <h3>Question Parsed Successfully</h3>

            <p>
                <strong>Question:</strong><br>
                ${escapeHtml(newQuestion.q)}
            </p>

            <p>
                <strong>Topic:</strong>
                ${escapeHtml(newQuestion.topic)}
            </p>

            <p>
                <strong>Level:</strong>
                ${escapeHtml(newQuestion.level)}
            </p>

            <p>
                <strong>Correct Option:</strong>
                ${newQuestion.answer + 1}
            </p>

            <hr>

            <pre>${escapeHtml(
                JSON.stringify(newQuestion, null, 2)
            )}</pre>

            <strong>
                Ready for GitHub save.
            </strong>
        `;


    } catch (error) {

        console.error(error);

        status.innerHTML =
            "<strong>Error reading questions.json</strong>";

    }

}


/* -----------------------------
   CLEAR
----------------------------- */

function clearForm() {

    document.getElementById(
        "questionInput"
    ).value = "";

    document.getElementById(
        "status"
    ).innerHTML = "";

}


/* -----------------------------
   HTML ESCAPE
----------------------------- */

function escapeHtml(str) {

    return String(str)

        .replace(/&/g, "&amp;")

        .replace(/</g, "&lt;")

        .replace(/>/g, "&gt;");

}
