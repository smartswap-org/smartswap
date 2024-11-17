# Smartswap

<img src="https://avatars.githubusercontent.com/u/171923264" width="125" height="125">

Please notice that the next installation needs to be updated with:
- your custom paths
- your custom user name and permissions
- your custom python environment to install librairies (its better to create a dedicated one to smartswap)

## Installation

1. **Clone the repository**  
   Navigate to the `/home` directory and clone the project repository with all submodules:
   ```bash
   cd /home
   git clone https://github.com/smartswap-org/smartswap --recursive
   cd smartswap
   git checkout master
   ```

Please dont forget to check your python env with `python which

2.	Install Miniconda
Download and install Miniconda for managing Python environments:

```
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-armv7l.sh
bash Miniconda3-latest-Linux-armv7l.sh
```

Add Miniconda to your PATH:

```
echo 'export PATH="$HOME/miniconda3/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```


3.	Set up the Python environment
Navigate to the smartswap directory, create, and activate a new Python environment with version 3.9:

```
cd smartswap
conda create --name smartswap python=3.12.2
conda activate smartswap
```


4.	Install dependencies
```
sudo apt install libmariadb-dev
pip install -r "databases/requirements.txt"
pip install -r "QTSBE/requirements.txt"
pip install -r "qtb/requirements.txt"
```

5.	Configure startup script
Set up the system to run Smartswap automatically on startup:

```
sudo nano /etc/rc.local
```

Add the following line to the file:

```
sudo tmux new-session -d -s smartswap 'bash /home/simon/smartswap/smartswap/start.sh'
```


Configuration

qtb Configuration

1.	Discord App Configuration
Set up your Discord bot in configs/app.json:

```
{
    "discord": {
        "guild_id": "YOUR_DISCORD_SERVER_ID",
        "category_id": "YOUR_DISCORD_CATEGORY_ON_SERVER_ID",
        "token": "YOUR_DISCORD_DEVELOPER_APP_TOKEN",
        "prefix": "$"
    }
}
```

2.	Exchange Configuration
Define the OHLCV data for each exchange in configs/exchanges.json:
```
{
    "Binance": {
        "access": {
            "api_key": "YOUR_BINANCE_API_KEY",
            "api_secret": "YOUR_BINANCE_API_SECRET",
            "ip_address_allow": ["ADDRESS_IP_ALLOWED_TO_BINANCE"]
        },
        "ohlcv_folder_path": "/home/simon/smartswap/smartswap/QTSBE/data/bank",
        "ohlcv": [
            "BTC/USDT",
            "ETH/USDT"
        ]
    }
}
```

3.	Bot Configuration
Configure each bot’s settings in configs/bots.json:
```
{
    "prod": {
        "exchange": {
            "name": "Binance",
            "pairs": [
                "BTC/USDT"
            ]
        },
        "strategy": "rsi_example",
        "positions": {
            "reinvest_gains": "True",
            "position_%_invest": "50"
        },
        "wallet": {
            "invest_capital": "100",
            "adjust_with_profits_if_loss": "False"
        },
        "timeframe": "1d"
    }
}
```


QTSBE Configuration

Create a config.json file under QTSBE/tools/auto_fetch/ to specify asset configurations:
```
{
    "Yahoo": {
        "assets": [
            ["AMZN", "1d"],
            ["TSLA", "1d"],
            ["NKE", "1d"]
        ]
    },
    "Binance": {
        "assets": [
            ["BTC/USDT", "1d"],
            ["ETH/USDT", "1d"],
            ["SOL/USDT", "1d"]
        ]
    }
}
```
Additional Steps

- Activate the smartswap environment and reload the shell configuration:
```
conda activate smartswap
source ~/.bashrc
```

- Update Python (if you need on your machine):
```
conda install python=3.13.0
```

- If you have an issue with importation of libs when its run on TMUX and not on your local session, you need to set conda for sudo 
to run properly with the good environment, for instance in the start.sh:
`sudo -u simon tmux new-session -d -s smartswap-qtb 'cd /home/simon/smartswap/qtb && which python && sh sh/qtb.sh'`




Usage

Once the installation and configuration are complete, the system should be ready to run SmartSwap. The bot will start automatically on system startup if the rc.local configuration was followed. For further details, refer to the README files within specific configuration folders (e.g., QTSBE/tools/auto_fetch/README.md). You can manually start using `bash start.sh`
