﻿//начало текста модуля

Перем Ванесса;


Функция ДобавитьШагВМассивТестов(МассивТестов,Снипет,ИмяПроцедуры,ПредставлениеТеста = Неопределено,Транзакция = Неопределено,Параметр = Неопределено)
	Структура = Новый Структура;
	Структура.Вставить("Снипет",Снипет);
	Структура.Вставить("ИмяПроцедуры",ИмяПроцедуры);
	Структура.Вставить("ИмяПроцедуры",ИмяПроцедуры);
	Структура.Вставить("ПредставлениеТеста",ПредставлениеТеста);
	Структура.Вставить("Транзакция",Транзакция);
	Структура.Вставить("Параметр",Параметр);
	МассивТестов.Добавить(Структура);
КонецФункции


Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	//описание параметров
	//ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,Транзакция,Параметр);

//	ДобавитьШагВМассивТестов(ВсеТесты,"ЯОткрылФормуVanessaBehavoirВРежимеСамотестирования()","ЯОткрылФормуVanessaBehavoirВРежимеСамотестирования","я открыл форму VanessaBehavoir в режиме самотестирования"); //уже был в C:\Commons\Rep\vanessa-behavoir\features\Libraries\step_definitions\ЗагрузкаФичи.epf
	ДобавитьШагВМассивТестов(ВсеТесты,"ЯДобавилТегВСписокТеговИсключений(Парам01Строка)","ЯДобавилТегВСписокТеговИсключений","Я добавил тег ""IgnoreOnCIMainBuild"" в список тегов исключений");
	ДобавитьШагВМассивТестов(ВсеТесты,"ЯЗагрузилФичиИзСлужебногоКаталога(Парам01Строка)","ЯЗагрузилФичиИзСлужебногоКаталога","Я загрузил фичи из служебного каталога ""Support\Templates""");
	ДобавитьШагВМассивТестов(ВсеТесты,"ВДеревеФичНетФичиЗагруженнойИзФайла(Парам01Строка)","ВДеревеФичНетФичиЗагруженнойИзФайла","в дереве фич нет фичи загруженной из файла ""ОсновнаяТестоваяФича""");
//	ДобавитьШагВМассивТестов(ВсеТесты,"ЯЗагрузилСпециальнуюТестовуюФичу(Парам01Строка)","ЯЗагрузилСпециальнуюТестовуюФичу","Я загрузил специальную тестовую фичу ""ОсновнаяТестоваяФича"""); //уже был в C:\Commons\Rep\vanessa-behavoir\features\Libraries\step_definitions\ЗагрузкаФичи.epf
//	ДобавитьШагВМассивТестов(ВсеТесты,"ДеревоТестовЗаполнилосьСтрокамиИзФичи()","ДеревоТестовЗаполнилосьСтрокамиИзФичи","ДеревоТестов заполнилось строками из фичи"); //уже был в C:\Commons\Rep\vanessa-behavoir\features\Libraries\step_definitions\ЗагрузкаФичи.epf
	ДобавитьШагВМассивТестов(ВсеТесты,"ЯДобавилТегВСписокТеговФильтров(Парам01Строка)","ЯДобавилТегВСписокТеговФильтров","Я добавил тег ""SpecialTag"" в список тегов фильтров");
	ДобавитьШагВМассивТестов(ВсеТесты,"ВДеревеФичЕстьФичаЗагруженнаяИзФайла(Парам01Строка)","ВДеревеФичЕстьФичаЗагруженнаяИзФайла","в дереве фич есть фича загруженная из файла ""ОсновнаяТестоваяФича""");

	Возврат ВсеТесты;
КонецФункции


Процедура ПередНачаломСценария() Экспорт
	
КонецПроцедуры


Процедура ПередОкончаниемСценария() Экспорт
	Попытка
		Если Контекст.Свойство("ОткрытаяФормаVanessaBehavoir") Тогда
			ОткрытаяФормаVanessaBehavoir = Контекст.ОткрытаяФормаVanessaBehavoir;
			ОткрытаяФормаVanessaBehavoir.Закрыть();
		КонецЕсли;	 
	Исключение
	
	КонецПопытки;
КонецПроцедуры



//Я добавил тег "@IgnoreOnCIMainBuild" в список тегов исключений
//@ЯДобавилТегВСписокТеговИсключений(Парам01Строка)
Процедура ЯДобавилТегВСписокТеговИсключений(ИмяТега) Экспорт
	ФормаVB = Контекст.ОткрытаяФормаVanessaBehavoir;
	ФормаVB.СписокТеговИсключение.Добавить(ИмяТега);
КонецПроцедуры


//Я загрузил фичи из служебного каталога "Support\Templates"
//@ЯЗагрузилФичиИзСлужебногоКаталога(Парам01Строка)
Процедура ЯЗагрузилФичиИзСлужебногоКаталога(ОтносительныйПуть) Экспорт
	Путь = Ванесса.КаталогИнструментов + "\features\" + ОтносительныйПуть;
	ФормаVB = Контекст.ОткрытаяФормаVanessaBehavoir;
	
	ФормаVB.КаталогФич = Путь;
	
	ФормаVB.ЗагрузитьФичи();
КонецПроцедуры


//в дереве фич нет фичи загруженной из файла "ОсновнаяТестоваяФича.feature"
//@ВДеревеФичНетФичиЗагруженнойИзФайла(Парам01Строка)
Процедура ВДеревеФичНетФичиЗагруженнойИзФайла(ИмяФичаФайла) Экспорт
	ФормаVB = Контекст.ОткрытаяФормаVanessaBehavoir;
	ДеревоТестов = ФормаVB.ДеревоТестов;

	Ванесса.ПроверитьРавенство(ДеревоТестов.Строки[0].Имя,"Templates","В корне дерева должен быть нужный каталог.");
	
	
	Строки = ДеревоТестов.Строки[0].Строки;
	Для каждого Строка Из Строки Цикл
		Если НРег(Строка.Имя) = НРег(ИмяФичаФайла) Тогда
			ВызватьИсключение "Фича " + ИмяФичаФайла + " загрузилась в дерево, хотя не должна была загрузиться.";
		КонецЕсли;  
	КонецЦикла;
	
КонецПроцедуры


//Я добавил тег "SpecialTag" в список тегов фильтров
//@ЯДобавилТегВСписокТеговФильтров(Парам01Строка)
Процедура ЯДобавилТегВСписокТеговФильтров(ИмяТега) Экспорт
	ФормаVB = Контекст.ОткрытаяФормаVanessaBehavoir;
	ФормаVB.СписокТеговОтбор.Добавить(ИмяТега);
КонецПроцедуры

//в дереве фич есть фича загруженная из файла "ОсновнаяТестоваяФича"
//@ВДеревеФичЕстьФичаЗагруженнаяИзФайла(Парам01Строка)
Процедура ВДеревеФичЕстьФичаЗагруженнаяИзФайла(ИмяФичаФайла) Экспорт
	ФормаVB = Контекст.ОткрытаяФормаVanessaBehavoir;
	ДеревоТестов = ФормаVB.ДеревоТестов;

	Ванесса.ПроверитьРавенство(ДеревоТестов.Строки[0].Имя,"Templates","В корне дерева должен быть нужный каталог.");
	
	
	Нашел = Ложь;
	Строки = ДеревоТестов.Строки[0].Строки;
	Для каждого Строка Из Строки Цикл
		Если НРег(Строка.Имя) = НРег(ИмяФичаФайла) Тогда
			Нашел = Истина;
		КонецЕсли;  
	КонецЦикла;
	
	Если Не Нашел Тогда
		ВызватьИсключение "Фича " + ИмяФичаФайла + " не загрузилась в дерево, хотя должна была загрузиться.";
	КонецЕсли;	 
КонецПроцедуры


//окончание текста модуля  
