# language: ru

@IgnoreOn82Builds
@IgnoreOnOFBuilds



Функционал: Получение данных макета с переносом строк в ячейках

Как разработчик
Я хочу чтобы при получении даных макета из сеанса TestClient переносы строк заменялись на \n
Чтобы потом я мог корректно проверить состояние макета в сеансе TestManager

Контекст: 
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий


Сценарий: Проверка состояния макета у которого в ячейках есть переносы строк

	Когда В панели разделов я выбираю "Основная"
	И     В панели функций я выбираю "Отчет перенос строк"
	Тогда открылось окно "Отчет перенос строк"
	И     В открытой форме я нажимаю на кнопку с заголовком "Сформировать"
	Тогда табличный документ формы с именем "ТабДок" стал равен:
		| 'Строка1\nСтрока2' |

	