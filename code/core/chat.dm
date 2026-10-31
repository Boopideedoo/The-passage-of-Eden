mob
    proc
        Say(message)
            if(!length(message))
                return

            if(copytext(message, 1, 2) == "*")
                SendEmote(copytext(message, 2))
                return

            world << "[html_encode(src.name)] says, \"[html_encode(message)]\""