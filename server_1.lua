-- Первый вариант

-- Открываем файлы
local fileid = fileOpen("fileid.txt")
local tablesort = fileCreate("tablesort.txt")

if fileid and tablesort then
    -- Читаем содержимое файла целиком
    local fileContent = fileRead(fileid, fileGetSize(fileid))

    -- Разбиваем содержимое на строки
    local lines = {}
    for line in string.gmatch(fileContent, "[^\r\n]+") do
        table.insert(lines, line)
    end

    -- Записываем строки в таблицу
    for _, line in ipairs(lines) do
        local data = {}
        for val in string.gmatch(line, "%S+") do
            table.insert(data, val)
        end
        local tableEntry = "{ " .. table.concat(data, ", ") .. " }\n"
        fileWrite(tablesort, tableEntry)
    end

    -- Закрываем файлы
    fileClose(fileid)
    fileClose(tablesort)
    outputChatBox("Файл tablesort.txt был успешно создан.")
else
    outputChatBox("Произошла ошибка при открытии файлов.")
end
