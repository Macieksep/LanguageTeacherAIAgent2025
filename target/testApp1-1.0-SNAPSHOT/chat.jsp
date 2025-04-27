<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AI Teacher Chat</title>
    <script>
        function sendMessage(event) {
            event.preventDefault();

            let userText = document.getElementById("userText").value;
            let chatBox = document.getElementById("chatBox");
            let sendButton = document.getElementById("sendButton");

            sendButton.disabled = true;

            fetch("chat", {
                method: "POST",
                headers: {
                    "Content-Type": "application/x-www-form-urlencoded"
                },
                body: "userText=" + encodeURIComponent(userText)
            })
                .then(response => response.text())
                .then(data => {
                    let userMessage = document.createElement("u");
                    let botMessage = document.createElement("p");

                    userMessage.classList.add("user-message");
                    botMessage.classList.add("bot-message");

                    userMessage.innerHTML = "<b>User:</b> " + userText;
                    botMessage.innerHTML = "<b>Bot:</b> " + data;

                    chatBox.appendChild(userMessage);
                    chatBox.appendChild(botMessage);

                    document.getElementById("userText").value = "";

                    chatBox.scrollTop = chatBox.scrollHeight;
                })
                .catch(error => console.error("Błąd:", error))
                .finally(() => {
                    sendButton.disabled = false;
                })
        }


        document.getElementById("userText").addEventListener("keypress", function(event) {
            if (event.key === "Enter") {
                sendMessage(event);
            }
        });
    </script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body, html {
            height: 100%;
            display: flex;
            flex-direction: column;
            font-family: Arial, sans-serif;
        }

        #settings_img {
            position: absolute;
            top: 10px;
            right: 10px;
            cursor: pointer;
            width: 30px;
            height: 30px;
        }

        #chatBox {
            flex-grow: 1;
            overflow-y: auto;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 10px;
            margin-bottom: 50px;
            background-color: #f9f9f9;
            height: calc(100vh - 120px);
        }

        form {
            position: fixed;
            bottom: 0;
            width: 100%;
            padding: 10px;
            background-color: white;
            border-top: 1px solid #ccc;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        input[type="text"] {
            width: 80%;
            padding: 12px;
            border-radius: 30px;
            border: 1px solid #ddd;
            font-size: 16px;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
            margin-right: 10px;
            outline: none;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus {
            border-color: #007BFF;
        }

        button {
            width: 20%;
            padding: 12px;
            border-radius: 30px;
            border: none;
            background-color: #007BFF;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #0056b3;
        }

        button:disabled {
            background-color: #ccc;
            cursor: not-allowed;
        }

        #chatBox u {
            margin-bottom: 0px;
            font-weight: bold;
        }

        #chatBox p {
            margin-bottom: 10px;
            font-size: 14px;
        }

        .user-message {
            margin-bottom: 20px;
        }

        .bot-message {
            margin-top: 20px;
        }
    </style>
</head>

<body>

<a href="/testApp1_war_exploded/">
    <img id="settings_img" src="https://upload.wikimedia.org/wikipedia/commons/4/43/Settings_%2889646%29_-_The_Noun_Project.svg" alt="Settings icon">
</a>

<h2 style="text-align:center; padding-top: 10px; padding-bottom: 10px">AI Teacher</h2>

<div id="chatBox">

</div>

<form onsubmit="sendMessage(event)">
    <input type="text" id="userText" name="userText" required placeholder="Type your message...">
    <button id="sendButton" type="submit">Send</button>
</form>

</body>
</html>
