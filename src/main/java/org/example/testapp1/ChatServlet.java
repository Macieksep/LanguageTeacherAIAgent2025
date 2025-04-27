package org.example.testapp1;

import com.azure.ai.inference.models.ChatRequestMessage;
import com.azure.ai.inference.models.ChatRequestUserMessage;
import com.azure.ai.inference.ChatCompletionsClient;
import com.azure.ai.inference.ChatCompletionsClientBuilder;
import com.azure.ai.inference.models.ChatCompletions;
import com.azure.ai.inference.models.ChatCompletionsOptions;
import com.azure.core.credential.AzureKeyCredential;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "chatServlet", value = "/chat")
public class ChatServlet extends HttpServlet {

    String key;
    String endpoint;
    String model;
    ChatCompletionsClient client;

    HttpSession session;

    TeacherAgent.Language userLang;
    TeacherAgent.Language teacherLang;
    TeacherAgent.LanguageLevel langLevel;


    public void init() {

        key = "YOUR KEY from https://github.com/marketplace/models/azure-openai/gpt-4o";

        endpoint = "https://models.inference.ai.azure.com";
        model = "gpt-4o";

        client = new ChatCompletionsClientBuilder()
                .credential(new AzureKeyCredential(key))
                .endpoint(endpoint)
                .buildClient();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws  IOException {

        session = request.getSession(true);

        List<ChatRequestMessage> knowledge = (List<ChatRequestMessage>) session.getAttribute("knowledge");

        if (knowledge == null) {
            knowledge = new ArrayList<>();
            session.setAttribute("knowledge", knowledge);
        }

        String userInput = request.getParameter("userText");

        List<ChatRequestMessage> chatMessages = new ArrayList<>();

        chatMessages.addAll(TeacherAgent.setupKnowledge(userLang, teacherLang, langLevel));
        chatMessages.addAll(knowledge);


        ChatRequestUserMessage userInputRequest = new ChatRequestUserMessage(userInput);
        knowledge.add(userInputRequest);
        chatMessages.add(userInputRequest);


        ChatCompletionsOptions chatCompletionsOptions = new ChatCompletionsOptions(chatMessages);
        chatCompletionsOptions.setModel(model);

        ChatCompletions completions = client.complete(chatCompletionsOptions);
        String botResponse = completions.getChoices().get(completions.getChoices().size() - 1).getMessage().getContent();


        response.setContentType("text/plain");
        response.getWriter().write(botResponse);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        session = request.getSession(true);


        session.invalidate();
        session = request.getSession(true);


        userLang = TeacherAgent.Language.getLanguage(request.getParameter("userLang"));
        teacherLang = TeacherAgent.Language.getLanguage(request.getParameter("teacherLang"));
        langLevel = TeacherAgent.LanguageLevel.getLevel(request.getParameter("langLevel"));


        System.out.println("User: " + userLang);
        System.out.println("Teacher: " + teacherLang);
        System.out.println("Level: " + langLevel);


        List<ChatRequestMessage> knowledge = new ArrayList<>();
        session.setAttribute("knowledge", knowledge);


        request.getRequestDispatcher("chat.jsp").forward(request, response);
    }
}
