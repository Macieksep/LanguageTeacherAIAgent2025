package org.example.testapp1;

import com.azure.ai.inference.models.ChatRequestMessage;
import com.azure.ai.inference.models.ChatRequestSystemMessage;

import java.util.ArrayList;
import java.util.List;

public class TeacherAgent {

    private static List<ChatRequestMessage> startKnowledge = new ArrayList<>();

    public enum Language {

        POLISH ("pl"),
        ENGLISH ("eng"),
        SPANISH ("es"),
        GERMAN ("de"),
        FRENCH ("fr"),
        ITALIAN ("it"),
        PORTUGESE ("pt"),
        DUTCH ("nl"),
        RUSSIAN ("ru"),
        CHINESE ("zh"),
        JAPANESE ("ja"),
        KOREAN ("kor"),
        TURKISH ("tur"),
        ARABIC ("ar");

        private final String langCode;

        Language(String langCode){
            this.langCode = langCode;
        }

        public static Language getLanguage(String langSelect){

            for(Language l : Language.values())
                if (l.langCode.equals(langSelect))
                    return l;

            return ENGLISH;

        }

    }

    public enum LanguageLevel {
        A1,
        A2,
        B1,
        B2,
        C1,
        C2;

        public static LanguageLevel getLevel(String langSelect){

            for(LanguageLevel l : LanguageLevel.values())
                if (l.toString().equals(langSelect))
                    return l;

            return A1;

        }
    }

    public static List<ChatRequestMessage> setupKnowledge(Language userLanguage, Language teacherLanguage, LanguageLevel languageLevel){

        startKnowledge.addAll(List.of(
                new ChatRequestSystemMessage("Jesteś nauczycielem języków. Uczysz poprzez rozmowę na czacie."),
                new ChatRequestSystemMessage(String.format("Prowadzisz konwersację w języku %s na poziomie %s.", teacherLanguage, languageLevel)),
                new ChatRequestSystemMessage(String.format("Jeśli uczeń popełni błąd, popraw go i wytłumacz w języku %s.", userLanguage)),
                new ChatRequestSystemMessage(String.format("Po poprawce kontynuuj rozmowę, zadawaj pytania w języku %s.", teacherLanguage)),
                new ChatRequestSystemMessage("Nie zmieniaj tematu. Skup się tylko na nauce języka poprzez rozmowę."),
                new ChatRequestSystemMessage("Nie formatuj specjalnie tekstu, używaj prostych odpowiedzi."),
                new ChatRequestSystemMessage("W trakcie rozmowy wprowadzaj nowe słowa i wyrażenia, aby uczeń mógł poszerzać swoje słownictwo."),
                new ChatRequestSystemMessage(String.format(
                        "Prowadź rozmowę na poziomie %s. Używaj odpowiedniego poziomu trudności: prostych słów i krótkich zdań dla poziomów A1–A2, średnio zaawansowanego języka dla B1–B2 oraz zaawansowanych struktur i słownictwa dla C1–C2.",
                        languageLevel
                )),
                new ChatRequestSystemMessage(String.format("Po każdej odpowiedzi w języku %s dodaj w nowej linijce tłumaczenie tej samej treści na język %s, aby ułatwić zrozumienie uczniowi.",teacherLanguage, userLanguage)),                new ChatRequestSystemMessage("Nie powtarzaj pytań"),
                new ChatRequestSystemMessage("Po wykryciu błędu w wypowiedzi ucznia, najpierw wskaż, na czym polegał błąd, następnie wyjaśnij jego przyczynę oraz przedstaw prostą regułę lub zasadę poprawnego użycia."),
                new ChatRequestSystemMessage("Zadawaj uczniowi różnorodne pytania, obejmujące różne tematy i sytuacje, aby rozwijać jego umiejętność komunikacji w różnych kontekstach."),
                new ChatRequestSystemMessage("Unikaj zadawania pytań o dane osobowe, takie jak imię, nazwisko, adres, numer telefonu czy inne informacje prywatne."),
                new ChatRequestSystemMessage("Odpowiadaj uprzejmie i w sposób rozwinięty. Unikaj krótkich, jednowyrazowych lub jednosłownych odpowiedzi. Zawsze rozwiń odpowiedź o dodatkowe informacje, przykłady lub krótkie komentarze, aby rozmowa była płynna i naturalna.")

        ));

        return startKnowledge;

    }


}
