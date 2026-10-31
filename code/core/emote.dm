mob
    proc
        SendEmote(message)
            if(!length(message))
                return

            var/emote_key = lowertext(message)

            // Show help privately instead of broadcasting an emote.
            if(emote_key == "help")
                ShowEmoteHelp()
                return

            if(emote_key == "wag")
                ToggleTailWag()
                return

            // Use a predefined emote if the text matches its name.
            var/emote_text = emote_messages[emote_key]

            // Otherwise, preserve custom free-text emotes.
            if(!emote_text)
                emote_text = message

            world << "[html_encode(src.name)] [html_encode(emote_text)]"

        ToggleTailWag()
            if(!has_tail)
                tail_wagging = FALSE
                src << "You don't have a tail to wag."
                return

            tail_wagging = !tail_wagging

            if(tail_wagging)
                world << "[html_encode(src.name)] starts wagging their tail."
            else
                world << "[html_encode(src.name)] stops wagging their tail."

        ShowEmoteHelp()
            src << "----- Available Emotes -----"

            for(var/emote_key in emote_messages)
                var/emote_text = emote_messages[emote_key]
                src << "[emote_key]: [emote_text]"

            src << "Use: me smile, emote smile, or say *smile"
            src << "Custom emotes: me grins at the stranger."
            src << "Help: emote help"
            src << "Tail wagging: use say *wag to start or stop (requires a tail)."

    var/global/list/emote_messages = list(
    "smile" = "smiles.",
    "grin" = "grins.",
    "laugh" = "laughs.",
    "chuckle" = "chuckles.",
    "nod" = "nods.",
    "shake" = "shakes their head.",
    "shrug" = "shrugs.",
    "sigh" = "sighs.",
    "wave" = "waves.",
    "bow" = "bows.",
    "blush" = "blushes.",
    "frown" = "frowns.",
    "cry" = "cries.",
    "gasp" = "gasps.",
    "wag" = "Toggles tail wagging; requires a tail.",
    "yawn" = "yawns."
)
