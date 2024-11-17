sudo -u simon tmux new-session -d -s smartswap-qtb 'cd /home/simon/smartswap/qtb && sh sh/qtb.sh'
sudo -u simon tmux new-session -d -s smartswap-qtb-app 'cd /home/simon/smartswap/qtb && sh sh/app.sh'

sudo -u simon tmux new-session -d -s smartswap-qtsbe-api 'cd /home/simon/smartswap/QTSBE && sh sh/api.sh'
sudo -u simon tmux new-session -d -s smartswap-qtsbe-autofetch 'cd /home/simon/smartswap/QTSBE && sh sh/auto_fetch.sh'
sudo -u simon tmux new-session -d -s smartswap-qtsbe-discord-chat-bot 'cd /home/simon/smartswap/QTSBE && sh sh/discord_chat_bot.sh'