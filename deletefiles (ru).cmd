@echo off
chcp 65001 >nul
title Потрошитель гашни (удаляем старые файлы)
::Проверка папки:
set gdata=GenshinImpact_Data
if not exist %gdata% (echo %gdata% не найдено, закройте скрипт и переместите его в папку с игрой.
	echo Ну или продолжить на пофиг(enter^), но файлы не будут найдены.
	pause >nul)

echo Вставить текстовик со списком файлов на удаление
echo (перетащить сюда или вставить имя текстового файла, вместе с расширением типа .txt):
set /p delf="> "
set game=%~dp0

::Подсчет файлов:
echo Поиск файлов по списку...
set sum=0
set sumno=0
for /F "usebackq delims=" %%f in (%delf%) do (
	if exist "%game%%%f" (set /a sum+=1) else set /a sumno+=1)
echo *Всего файлов на удаление найдено - %sum%, не найдено - %sumno%.

echo ---Начать удаление (любая кнопка)---
pause >nul

	::Блок идиотизма(можно отключить закоментив ::for):
set "tlol=timeout 2 >nul"
set lol="Думаю... Надо вывести лог файлов.., хотя не.." "Достаю кувалду и начинаю ломать игру :З" "Закидываю говном михуев >=)" "Ворую крутки, гемы и труселя :З" "Запускаю вирусы, майнеры, стилеры и ломаю сервер михуев >=D" "Пытаюсь украсть твой акк.. Уже почти продал его.." "Лан, не получилось не фортануло.. =D" "Ну тогда все, ты забанен, поздравляю, можешь удалять игру, ты свободен, хатико XD" "Хотя ладно, размечтался :Р" "Все, прекращаю дурацкие шутки, щас все будет :З" -----
	for %%L in (%lol%) do echo %%L & %tlol%

echo Удаление файлов...
for /F "usebackq delims=" %%f in (%delf%) do (
	if exist "%game%%%f" attrib -R "%game%%%f" && del "%game%%%f")
echo *Удалено - %sum%, пропущено - %sumno% файлов из списка.

echo ---Готово (любая кнопка выход)---
pause >nul