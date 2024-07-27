# Smartswap

<img src="https://avatars.githubusercontent.com/u/171923264" width="125" height="125">

For more details about the project, visit [**smartswap-org**](https://github.com/smartswap-org/). You will find information about each repository, their purpose, stack, and more.

> [!CAUTION]  
> **`BETA` DEVELOPMENT**

---

# Install the project:

To get the latest working version of the project, clone the `master` branch. If you want a specific version, browse all branches and select the one you need.

#### Steps to begin using the Smartswap project:

## 1. **Clone the Main Repository**:

```bash
git clone https://github.com/smartswap-org/smartswap
cd smartswap
git submodule update --init --recursive
```

## 2. **Open the project and get requirements**:

![VSCode](https://img.shields.io/badge/Visual_Studio_Code-0078D4?style=for-the-badge&logo=visual%20studio%20code&logoColor=white) 

```bash
pip install -r 'databases/requirements.txt'
pip install -r 'QTSBE/requirements.txt'
pip install -r 'discord-int/requirements.txt'
pip install -r 'simulator/requirements.txt'
```

## 3. **Set up Databases**:
```bash
python databases/create_env/create_env.py
```
If you want to set up locally (anything in `db_user` and `db_password` is OK):

- `host`: localhost
- `sql_user`: root
- `sql_password`: **your root pass**
- `db_user`: dev
- `db_password`: dev

> [!NOTE]  
> During development, if you want to reset all databases, just restart the `create_env` script. It will ask if you want to reset the database if it already exists, and also your user permissions.

## 4. **Setup QTSBE Api and Strategies**
Import your folders with strategies with the format of smartswap/QTSBE/api/README.md about `QTSBE/api/strategies`
Once you have imported your strategies in `QTSBE/api/strategies/` you can run:
```bash
python QTSBE/api/api.py
```

## 5. **Set up Simulator**:
> [!NOTE]
> The Simulator uses SQLite (local file DB) and is independent of the database setup in part 3.

- If you don't have one already, create a Discord Server, create a channel, and copy the channel ID.
- Add an Application from Discord (see the next README to get the token from the Discord portal).
- Follow the instructions in `smartswap/simulator/config/README.md` to create the files `simulator/configs/discord_bot.json` and `simulator/simulations.json`.

**Once** you have set up the 2 files required to use the Simulator with Discord Integration, you can run the simulator using:
      
```bash
python simulator/simulator.py
```

## 6. **Set up Trading Bot**:
> [!CAUTION]  
> **NOT FINAL**, still in development.

## 7. **Set up Web**:
> [!CAUTION]  
> **NOT FINAL**, still in development.
```bash
cd web/smartswap/
npm install
npm run dev
```

---

# Run the project:
> [!IMPORTANT]  
> *In coming...*

