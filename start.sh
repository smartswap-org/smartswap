tmux new-session -d -s smartswap-qtb 'cd /home/simon/smartswap/qtb && sh sh/qtb.sh'
tmux new-session -d -s smartswap-qtb-app 'cd /home/simon/smartswap/qtb && sh sh/app.sh'

tmux new-session -d -s smartswap-qtsbe-api 'cd /home/simon/smartswap/QTSBE && sh sh/api.sh'
tmux new-session -d -s smartswap-qtsbe-autofetch 'cd /home/simon/smartswap/QTSBE && sh sh/auto_fetch.sh'
tmux new-session -d -s smartswap-qtsbe-discord-chat-bot 'cd /home/simon/smartswap/QTSBE && sh sh/discord_chat_bot.sh'