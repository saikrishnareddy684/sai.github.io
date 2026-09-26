const QUESTIONS_FILE = "./questions.json";

let parsedQuestion = null;


// ----------------------------------------
// Load existing questions
// ----------------------------------------

async function loadQuestions() {

    const response = await fetch(QUESTIONS_FILE);

    if (!response.ok) {
        throw new Error("Unable to load questions.json");
    }

    return await response.json();
}


// ----------------------------------------
// Parse pasted question
// ----------------------------------------

function parseQuestion(text) {

    const questionMatch =
        text.match(/Question:\s*([\s\S]*?)(?=\n\s*Options:)/i);

    const optionsMatch =
        text.match(/Options:\s*([\s\S]*?)(?=\n\s*Answer:)/i);

    const answerMatch =
        text.match(/Answer:\s*(\d+)/i);

    const datasetMatch =
        text.match(/Dataset:\s*([\s\S]*?)(?=\n\s*Expected Output:)/i);

    const expectedOutputMatch =
        text.match(/Expected Output:\s*([\s\S]*?)(?=\n\s*Level:)/i);

    const levelMatch =
        text.match(/Level:\s*([^\n]+)/i);

    const topicMatch =
        text.match(/Topic:\s*([^\n]+)/i);

    const explanationMatch =
        text.match(/Explanation:\s*([\s\S]*)/i);


    if (!questionMatch) {
        throw new Error("Question section not found.");
    }

    if (!optionsMatch) {
        throw new Error("Options section not found.");
    }

    if (!answerMatch) {
        throw new Error("Answer section not found.");
    }


    const question =
        questionMatch[1].trim();


    const options =
        optionsMatch[1]
            .trim()
            .split("\n")
            .map(line =>
                line.replace(/^\s*\d+\.\s*/, "").trim()
            )
            .filter(Boolean);


    if (options.length !== 4) {
        throw new Error(
            "Exactly four options are required."
        );
    }


    const answer =
        parseInt(answerMatch[1], 10) - 1;


    if (answer < 0 || answer >= options.length) {
        throw new Error("Invalid answer number.");
    }


    return {

        q: question,

        options: options,

        answer: answer,

        time: 40,

        level:
            levelMatch
                ? levelMatch[1].trim()
                : "Medium",

        topic:
            topicMatch
                ? topicMatch[1].trim()
                : "",

        dataset:
            datasetMatch
                ? datasetMatch[1].trim()
                : "",

        expectedOutput:
            expectedOutputMatch
                ? expectedOutputMatch[1].trim()
                : "",

        explanation:
            explanationMatch
                ? explanationMatch[1].trim()
                : ""
    };
}


// ----------------------------------------
// Check question and show preview
// ----------------------------------------

async function checkAndAdd() {

    const status =
        document.getElementById("status");

    const input =
        document.getElementById("questionInput").value.trim();


    document
        .getElementById("previewContainer")
        .classList.add("hidden");


    if (!input) {

        status.innerHTML =
            '<div class="error">Please paste a question.</div>';

        return;
    }


    try {

        parsedQuestion =
            parseQuestion(input);


        const questions =
            await loadQuestions();


        // Exact duplicate check
        const duplicate =
            questions.find(existing =>
                existing.q.trim().toLowerCase() ===
                parsedQuestion.q.trim().toLowerCase()
            );


        if (duplicate) {

            parsedQuestion = null;

            status.innerHTML = `
                <div class="error">
                    Duplicate question found!
                </div>

                <div class="preview">
                    <strong>Existing question:</strong>
                    <br><br>
                    ${escapeHtml(duplicate.q)}
                </div>
            `;

            return;
        }


        status.innerHTML = `
            <div class="success">
                Question Parsed Successfully
            </div>
        `;


        showPreview(parsedQuestion);

    }
    catch (error) {

        console.error(error);

        parsedQuestion = null;

        status.innerHTML = `
            <div class="error">
                ${escapeHtml(error.message)}
            </div>
        `;
    }
}


// ----------------------------------------
// Display preview
// ----------------------------------------

function showPreview(question) {

    document.getElementById("previewQuestion")
        .textContent = question.q;


    const optionsContainer =
        document.getElementById("previewOptions");

    optionsContainer.innerHTML = "";


    question.options.forEach((option, index) => {

        const div =
            document.createElement("div");

        div.className = "option";

        if (index === question.answer) {
            div.classList.add("correct");
        }

        div.textContent =
            `${index + 1}. ${option}`;

        optionsContainer.appendChild(div);

    });


    document.getElementById("previewAnswer")
        .textContent =
        `${question.answer + 1}. ${question.options[question.answer]}`;


    document.getElementById("previewLevel")
        .textContent =
        question.level;


    document.getElementById("previewTopic")
        .textContent =
        question.topic;


    document.getElementById("previewDataset")
        .textContent =
        question.dataset;


    document.getElementById("previewExpectedOutput")
        .textContent =
        question.expectedOutput;


    document.getElementById("previewExplanation")
        .textContent =
        question.explanation;


    document
        .getElementById("previewContainer")
        .classList.remove("hidden");
}


// ----------------------------------------
// Add Question
// ----------------------------------------

function addQuestion() {

    if (!parsedQuestion) {

        alert(
            "Please check and preview the question first."
        );

        return;
    }


    const status =
        document.getElementById("status");


    status.innerHTML = `
        <div class="success">
            Question is ready to be added.
        </div>
        <br>
        <strong>
            GitHub saving will be connected in the next step.
        </strong>
    `;


    console.log(
        "Question ready:",
        parsedQuestion
    );
}


// ----------------------------------------
// Clear
// ----------------------------------------

function clearForm() {

    document.getElementById("questionInput")
        .value = "";


    document.getElementById("previewContainer")
        .classList.add("hidden");


    document.getElementById("status")
        .innerHTML = "";


    parsedQuestion = null;
}


// ----------------------------------------
// HTML escaping
// ----------------------------------------

function escapeHtml(str) {

    return String(str)
        .replace(/&/g, "&amp;")
        .replace(/</g, "&lt;")
        .replace(/>/g, "&gt;")
        .replace(/"/g, "&quot;")
        .replace(/'/g, "&#039;");
}
