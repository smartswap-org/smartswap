USE smartswap;

CREATE TABLE IF NOT EXISTS wallets (
    name VARCHAR(50),
    address VARCHAR(255),
    `keys` BLOB,
    type VARCHAR(20), 
    PRIMARY KEY (name)
);

CREATE TABLE IF NOT EXISTS clients (
    user CHAR(100),
    discord_user_id VARCHAR(125),
    password BLOB,
    power INTEGER DEFAULT 0,
    email VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (user)
);

CREATE TABLE IF NOT EXISTS wallets_access (
    client_user CHAR(100),
    wallet_name VARCHAR(50),
    PRIMARY KEY (client_user, wallet_name),
    FOREIGN KEY (client_user) REFERENCES clients(user),
    FOREIGN KEY (wallet_name) REFERENCES wallets(name)
);

CREATE TABLE IF NOT EXISTS bots (
    bot_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    client_user CHAR(100),
    wallet_name VARCHAR(50),
    bot_name VARCHAR(50),
    exchange_name VARCHAR(50),
    pairs TEXT,
    strategy VARCHAR(50),
    reinvest_gains BOOLEAN,
    position_percent_invest DECIMAL(5, 2),
    invest_capital DECIMAL(18, 2),
    adjust_with_profits_if_loss BOOLEAN,
    timeframe VARCHAR(10),
    simulation BOOLEAN,
    status BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (client_user) REFERENCES clients(user),
    FOREIGN KEY (wallet_name) REFERENCES wallets(name)
);

CREATE TABLE IF NOT EXISTS cex_market (
    position_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    buy_order_id BIGINT,
    buy_price DECIMAL(18, 8),
    buy_date TIMESTAMP,
    buy_quantity DECIMAL(18, 8),
    buy_fees DECIMAL(18, 8),
    buy_value_usdc DECIMAL(18, 8),
    buy_order_type VARCHAR(20) DEFAULT NULL,
    sell_order_id BIGINT,
    sell_price DECIMAL(18, 8),
    sell_date TIMESTAMP,
    sell_quantity DECIMAL(18, 8),
    sell_fees DECIMAL(18, 8),
    sell_value_usdc DECIMAL(18, 8),
    sell_order_type VARCHAR(20) DEFAULT NULL,
    exchange VARCHAR(20),
    ratio DECIMAL(18, 8),
    position_duration INTEGER,
    pair VARCHAR(20),
    buy_signals TEXT,
    sell_signals TEXT,
    bot_id INTEGER,
    fund_slot INTEGER DEFAULT 0,
    order_status VARCHAR(20),
    FOREIGN KEY (bot_id) REFERENCES bots(bot_id)
);

CREATE TABLE IF NOT EXISTS funds (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    bot_id INTEGER,
    last_position_id INTEGER,
    funds TEXT,
    FOREIGN KEY (bot_id) REFERENCES bots(bot_id)
);
