# Smartswap

<img src="https://avatars.githubusercontent.com/u/171923264" width="125" height="125">

[![Docker](https://img.shields.io/badge/Docker-Ready-2496ED?style=for-the-badge&logo=docker&logoColor=white)](https://www.docker.com/)

## Quick Start with Docker

1. **Clone the repository**
```bash
git clone https://github.com/smartswap-org/smartswap --recursive
cd smartswap
```

2. **Setup database**
You need to setup a database service and prepare environnement.
You can use database module : qtb/databases/create_env/create_env.py

3. **Set up environment files**

Create `.env` files for each service:

- qtb
- aegis

You can use .env.example to see samples.

4. **Configure your services**

QTB Configuration (`qtb/configs/`):
```json
{
    "discord": {
        "guild_id": "YOUR_DISCORD_SERVER_ID",
        "category_id": "YOUR_DISCORD_CATEGORY_ON_SERVER_ID",
        "token": "YOUR_DISCORD_DEVELOPER_APP_TOKEN",
        "prefix": "$"
    }
}
```

Exchange Configuration (`qtb/configs/exchanges.json`):
```json
{
    "Binance": {
        "access": {
            "api_key": "YOUR_BINANCE_API_KEY",
            "api_secret": "YOUR_BINANCE_API_SECRET",
            "ip_address_allow": ["YOUR_IP_ADDRESS"]
        },
        "ohlcv_folder_path": "/app/QTSBE/data/bank",
        "ohlcv": [
            "BTC/USDC",
            "ETH/USDC"
        ]
    }
}
```

QTSBE Configuration (`QTSBE/tools/auto_fetch/config.json`):
```json
{
    "Binance": {
        "assets": [
            ["BTC/USDC", "1d"],
            ["ETH/USDC", "1d"]
        ]
    }
}
```

5. **Launch the services**
```bash
# Start all services
docker-compose up -d

# Or start specific services
docker-compose up -d qtb qtsbe-api webapp

# View logs
docker-compose logs -f

# Stop services
docker-compose down
```

## Services

The application consists of several Docker services:

- **QTB**: Trading bot service
- **QTSBE-API**: Backend API service (Port 5002)
- **QTSBE-Auto-Fetch**: Automatic data fetching service
- **Aegis-API**: Security service (Port 5001)
- **WebApp**: Frontend interface (Port 3000)

## Development

To run services in development mode with live reload:

```bash
docker-compose -f docker-compose.yml up
```
