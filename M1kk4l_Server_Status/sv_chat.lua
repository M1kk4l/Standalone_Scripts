PerformHttpRequest('WEBHOOK', function(err, text, headers) end, 'POST', json.encode(
    {
        username = "Server Status",
        embeds = {
            {              
              title = "M1kk4l Server Status";
              description = "**Servern er på vej op!**\n**```connect IP/CFX IP```**";
              color = 359935;
              footer = {
                text = "Tak fordi du valgte SERVERNAVN"
              }
            }
        }
    }), { ['Content-Type'] = 'application/json' })
