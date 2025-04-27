<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AI Teacher - Main Menu</title>

    <link href="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/css/select2.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/js/select2.min.js"></script>

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f0f0f0;
        }

        .menu-container {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            height: 450px;
        }

        select {
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        button {
            padding: 10px 20px;
            border: none;
            background-color: #007BFF;
            color: white;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }

        .select2-container .select2-selection--single {
            height: 40px;
        }

        .select2-selection__rendered {
            padding-left: 40px;
        }

        .select2-selection__arrow {
            top: 10px;
        }

        .flag-icon {
            width: 20px;
            height: 20px;
            margin-right: 10px;
        }

        #information_img {
            position: absolute;
            top: 10px;
            right: 10px;
            cursor: pointer;
            width: 30px;
            height: 30px;
        }

    </style>

    <script>
        function startChat() {
            const selectUser = document.getElementById('userLang');
            const selectTeacher = document.getElementById('teacherLang');
            const selectLevel = document.getElementById('langLevel');
            const userLang = selectUser.value;
            const teacherLang = selectTeacher.value;
            const langLevel = selectLevel.value;
            window.location.href = 'chat?userLang=' + userLang + '&teacherLang=' + teacherLang + '&langLevel=' + langLevel;
        }

        $(document).ready(function() {
            $('#userLang, #teacherLang').select2({
                templateResult: formatState,
                templateSelection: formatState
            });
        });

        function formatState(state) {
            if (!state.id) {
                return state.text;
            }
            var $state = $('<span><img src="' + $(state.element).data('image') + '" class="flag-icon" /> ' + state.text + '</span>');
            return $state;
        }
    </script>
</head>
<body>

<a href="/testApp1_war_exploded/AboutUs">
    <img id="information_img" src="https://upload.wikimedia.org/wikipedia/commons/b/b3/Icon_Information.svg" alt="Info icon">
</a>

<div class="menu-container">
    <h1>AI Teacher</h1>

    <b>Your language: </b>

    <br>

    <select id="userLang">
        <option value="pl" data-image="https://upload.wikimedia.org/wikipedia/commons/1/12/Flag_of_Poland.svg">Polish</option>
        <option value="eng" data-image="https://upload.wikimedia.org/wikipedia/commons/a/a4/Flag_of_the_United_States.svg">English</option>
        <option value="es" data-image="https://upload.wikimedia.org/wikipedia/commons/7/70/Flag_of_Spain_%28civil%29.svg">Spanish</option>
        <option value="de" data-image="https://upload.wikimedia.org/wikipedia/commons/b/ba/Flag_of_Germany.svg">German</option>
        <option value="fr" data-image="https://upload.wikimedia.org/wikipedia/commons/c/c3/Flag_of_France.svg">French</option>
        <option value="it" data-image="https://upload.wikimedia.org/wikipedia/commons/0/03/Flag_of_Italy.svg">Italian</option>
        <option value="pt" data-image="https://upload.wikimedia.org/wikipedia/commons/5/5c/Flag_of_Portugal.svg">Portuguese</option>
        <option value="nl" data-image="https://upload.wikimedia.org/wikipedia/commons/2/20/Flag_of_the_Netherlands.svg">Dutch</option>
        <option value="ru" data-image="https://upload.wikimedia.org/wikipedia/commons/f/f3/Flag_of_Russia.svg">Russian</option>
        <option value="zh" data-image="https://upload.wikimedia.org/wikipedia/commons/f/fa/Flag_of_the_People%27s_Republic_of_China.svg">Chinese</option>
        <option value="ja" data-image="https://upload.wikimedia.org/wikipedia/commons/9/9e/Flag_of_Japan.svg">Japanese</option>
        <option value="ko" data-image="https://upload.wikimedia.org/wikipedia/commons/0/09/Flag_of_South_Korea.svg">Korean</option>
        <option value="tr" data-image="https://upload.wikimedia.org/wikipedia/commons/b/b4/Flag_of_Turkey.svg">Turkish</option>
        <option value="ar" data-image="https://upload.wikimedia.org/wikipedia/commons/0/0d/Flag_of_Saudi_Arabia.svg">Arabic</option>
    </select>

    <br>

    <b>Teacher's language: </b>

    <br>

    <select id="teacherLang">
        <option value="pl" data-image="https://upload.wikimedia.org/wikipedia/commons/1/12/Flag_of_Poland.svg">Polish</option>
        <option value="eng" data-image="https://upload.wikimedia.org/wikipedia/commons/a/a4/Flag_of_the_United_States.svg">English</option>
        <option value="es" data-image="https://upload.wikimedia.org/wikipedia/commons/7/70/Flag_of_Spain_%28civil%29.svg">Spanish</option>
        <option value="de" data-image="https://upload.wikimedia.org/wikipedia/commons/b/ba/Flag_of_Germany.svg">German</option>
        <option value="fr" data-image="https://upload.wikimedia.org/wikipedia/commons/c/c3/Flag_of_France.svg">French</option>
        <option value="it" data-image="https://upload.wikimedia.org/wikipedia/commons/0/03/Flag_of_Italy.svg">Italian</option>
        <option value="pt" data-image="https://upload.wikimedia.org/wikipedia/commons/5/5c/Flag_of_Portugal.svg">Portuguese</option>
        <option value="nl" data-image="https://upload.wikimedia.org/wikipedia/commons/2/20/Flag_of_the_Netherlands.svg">Dutch</option>
        <option value="ru" data-image="https://upload.wikimedia.org/wikipedia/commons/f/f3/Flag_of_Russia.svg">Russian</option>
        <option value="zh" data-image="https://upload.wikimedia.org/wikipedia/commons/f/fa/Flag_of_the_People%27s_Republic_of_China.svg">Chinese</option>
        <option value="ja" data-image="https://upload.wikimedia.org/wikipedia/commons/9/9e/Flag_of_Japan.svg">Japanese</option>
        <option value="ko" data-image="https://upload.wikimedia.org/wikipedia/commons/0/09/Flag_of_South_Korea.svg">Korean</option>
        <option value="tr" data-image="https://upload.wikimedia.org/wikipedia/commons/b/b4/Flag_of_Turkey.svg">Turkish</option>
        <option value="ar" data-image="https://upload.wikimedia.org/wikipedia/commons/0/0d/Flag_of_Saudi_Arabia.svg">Arabic</option>
    </select>

    <br>

    <b>Language difficulty: </b>

    <br>

    <select id="langLevel">
        <option value="a1">A1 - Beginner</option>
        <option value="a2">A2 - Elementary</option>
        <option value="b1">B1 - Intermediate</option>
        <option value="b2">B2 - Upper Intermediate</option>
        <option value="c1">C1 - Advanced</option>
        <option value="c2">C2 - Proficient</option>
    </select>

    <br>

    <button onclick="startChat()">Start</button>
</div>
</body>
</html>
