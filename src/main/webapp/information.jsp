<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
            background-color: #f9f9f9;
            color: #333;
            line-height: 1.6;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 40px 20px;
        }
        h2 {
            font-size: 1.5rem;
            margin-top: 10px;
            margin-bottom: 10px;
            color: #555;
        }
        p {
            max-width: 700px;
            text-align: center;
            margin-bottom: 30px;
        }
        .creators {
            max-width: 700px;
            width: 100%;
            text-align: center;
        }
        .creator {
            margin-bottom: 10px;
        }
        .creator b {
            color: #222;
        }

        #home_img {
            position: absolute;
            top: 10px;
            right: 10px;
            cursor: pointer;
            width: 30px;
            height: 30px;
        }

    </style>
</head>
<body>

<a href="/testApp1_war_exploded/">
    <img id="home_img" src="https://upload.wikimedia.org/wikipedia/commons/5/59/Noun_Project_house_icon_475319_cc.svg" alt="Home icon">
</a>

<h2>Project: AI Teacher Agent</h2>

<h2>Mission</h2>
<p>
    Imagine a world where everyone, no matter where they live or how much they earn, can learn a new language through one-on-one conversations with native speakers.
    Our project makes this vision a reality - breaking down financial barriers and giving everyone equal access to knowledge and opportunities.
    All it takes is an Internet connection.

    We believe that language should unite, not divide - and with AI, we are making this dream come true.
</p>

<h2>Creators</h2>
<div class="creators">
    <div class="creator"><b>Maciej Sepeta</b> – team leader, backend, frontend</div>
    <div class="creator"><b>Robert Juchimiuk</b> – agent prompt engineering</div>
    <div class="creator"><b>Michał Mysiewicz</b> – design, presentation</div>
</div>

<h2>Sources</h2>
<p>
    The app is built using GitHub Azure AI GPT-4o, and the icons are provided by Wikipedia, licensed as free-to-share images for non-commercial use.
</p>

</body>
</html>
