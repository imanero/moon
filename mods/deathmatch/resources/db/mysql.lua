-- DB settings
local DB_CHARSET = get("DB_CHARSET")
local DB_TYPE = get("DB_TYPE")
local DB_NAME = get("DB_NAME")
local DB_HOST = get("DB_HOST")
local DB_PORT = get("DB_PORT")
local DB_USERNAME = get("DB_USERNAME")
local DB_PASSWORD = get("DB_PASSWORD")

-- Global variables
local dbConnection = nil

-- DB functions
function createConnection()
    local host = "dbname=".. DB_NAME ..";host=".. DB_HOST ..";port=".. DB_PORT ..";charset=".. DB_CHARSET ..";"
    local con = dbConnect(DB_TYPE, host, DB_USERNAME, DB_PASSWORD)
    
    if con then
        outputDebugString("[DB](info): Successfully connected to db ✅")
    else
        local errorStr = "[DB](ERROR): There was problem while establish connection to db"
        outputDebugString(errorStr)
        cancelEvent(true, errorStr)
    end

    dbConnection = con
end
addEventHandler("onResourceStart", resourceRoot, createConnection)

function getConnection()
    return dbConnection
end