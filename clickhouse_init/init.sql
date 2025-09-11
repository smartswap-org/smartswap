USE default;

CREATE TABLE IF NOT EXISTS logs
(
    id UUID DEFAULT generateUUIDv4(),
    startTime timestamp,
    endTime timestamp,
    level String,
    service String,
    message String,
    data String
) ENGINE = MergeTree()
ORDER BY (startTime, level);