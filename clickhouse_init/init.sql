USE default;

CREATE TABLE IF NOT EXISTS logs
(
    id UUID DEFAULT generateUUIDv4(),
    date timestamp,
    level String,
    service String,
    message String,
    data String
) ENGINE = MergeTree()
PARTITION BY (service, toYYYYMMDD(date))
ORDER BY (date, level)
TTL date + INTERVAL 30 DAY DELETE;