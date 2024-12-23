
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	// СтандартныеПодсистемы.ПодключаемыеКоманды
	ПодключаемыеКоманды.ПриСозданииНаСервере(ЭтотОбъект);
	// Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
	//{{ Зузыкин Е.В. Добавление новых элементов формы. Задача:Обновление конфигурации 10.11.2024 
	//Добавление группы "Скидки"
	Группа = Элементы.Вставить("ГруппаСкидок", Тип("ГруппаФормы"), ЭтаФорма, Элементы.Страницы);
	Группа.Вид = ВидГруппыФормы.ОбычнаяГруппа;
	Группа.Заголовок = "Установить скидку";
	//}}
	
	//{{ Зузыкин Е.В. Добавление новых элементов формы. Задача:Обновление конфигурации 10.11.2024
    //Добавление поля "Согласованная скидка"
	ПолеСкидка = Элементы.Вставить("Скидка", Тип("ПолеФормы"), Группа);
	ПолеСкидка.Вид = ВидПоляФормы.ПолеВвода;
	ПолеСкидка.Заголовок = "Согласованная скидка";
	ПолеСкидка.ПутьКДанным = "Объект.Дк_Скидка";
	ПолеСкидка.УстановитьДействие("ПриИзменении", "ПриИзмененииСкидки");
	//}}
	
	//{{ Зузыкин Е.В. Добавление новых элементов формы. Задача:Обновление конфигурации 10.11.2024
	//Добавление поля "Контактное лицо"
	ПолеКонтактноеЛицо = Элементы.Вставить("КонтактноеЛицо", Тип("ПолеФормы"), Элементы.ГруппаШапкаПраво);
	ПолеКонтактноеЛицо.Вид = ВидПоляФормы.ПолеВвода;
	ПолеКонтактноеЛицо.Заголовок = "Контактное лицо";
	ПолеКонтактноеЛицо.ПутьКДанным = "Объект.Дк_КонтактноеЛицо";
	//}} 
	
    //{{ Зузыкин Е.В. Добавление команды формы. Задача:Обновление конфигурации 10.11.2024
	//Добавление команды "Пересчитать"
	Команда = Команды.Добавить("Пересчитать");
	Команда.Заголовок = "Пересчитать";
	Команда.Действие = "КомандаПересчитать";
	//}}
	
	//{{ Зузыкин Е.В. Добавление команды формы. Задача:Обновление конфигурации 10.11.2024
	//Добавление кнопки "Пересчитать таблицу"
	КнопкаФормы = Элементы.Вставить("Пересчитать", Тип("КнопкаФормы"), Группа);
	КнопкаФормы.ИмяКоманды = "Пересчитать";
	КнопкаФормы.Заголовок = "Пересчитать таблицу";
	КнопкаФормы.Вид = ВидКнопкиФормы.ОбычнаяКнопка;
	КнопкаФормы.Отображение = ОтображениеКнопки.КартинкаИТекст;
	КнопкаФормы.Картинка = БиблиотекаКартинок.Обновить;
	//}}
	
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
    // СтандартныеПодсистемы.ПодключаемыеКоманды
    ПодключаемыеКомандыКлиент.НачатьОбновлениеКоманд(ЭтотОбъект);
    // Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаСервере
Процедура ПриЧтенииНаСервере(ТекущийОбъект)
	
    // СтандартныеПодсистемы.ПодключаемыеКоманды
    ПодключаемыеКомандыКлиентСервер.ОбновитьКоманды(ЭтотОбъект, Объект);
    // Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаКлиенте
Процедура ПослеЗаписи(ПараметрыЗаписи)
    ПодключаемыеКомандыКлиент.ПослеЗаписи(ЭтотОбъект, Объект, ПараметрыЗаписи);
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыТовары

&НаКлиенте
Процедура ТоварыКоличествоПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыЦенаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыПриИзменении(Элемент)
	РассчитатьСуммуДокумента();
КонецПроцедуры

&НаКлиенте
Процедура ТоварыСкидкаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыУслуги

&НаКлиенте
Процедура УслугиКоличествоПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиЦенаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиСкидкаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиПриИзменении(Элемент)
	РассчитатьСуммуДокумента();
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаКлиенте
Процедура КомандаПересчитать()
	//{{ Зузыкин Е.В. Задача:Обновление конфигурации 23.12.2024
	Для Каждого СтрокаТовары Из Объект.Товары Цикл
				
		РассчитатьСуммуСтроки(СтрокаТовары);
		
	КонецЦикла;
	
	Для Каждого СтрокаУслуги Из Объект.Услуги Цикл
				
		РассчитатьСуммуСтроки(СтрокаУслуги);
		
	КонецЦикла;
	//}}
	
КонецПроцедуры

&НаКлиенте
Процедура ПриИзмененииСкидки(Элемент)
	
	//{{ Зузыкин Е.В. Задача:Обновление конфигурации 23.12.2024
	ВыбратьАсинх();
	//}}
	
КонецПроцедуры

&НаКлиенте
Асинх Процедура ВыбратьАсинх()
	
	//{{ Зузыкин Е.В. Задача:Обновление конфигурации 23.12.2024
	Если Объект.Товары.Количество() > 0 ИЛИ Объект.Услуги.Количество() > 0 Тогда 
		Режим = РежимДиалогаВопрос.ДаНет;
		Ответ = Ждать ВопросАсинх("Процент скидки изменен. Пересчитать все таблицы?", Режим, 0);
		Если Ответ = КодВозвратаДиалога.Да Тогда
			КомандаПересчитать();
		КонецЕсли;
	КонецЕсли;
	//}}
	
КонецПроцедуры


&НаКлиенте
Процедура РассчитатьСуммуСтроки(ТекущиеДанные)
	
	КоэффициентСкидки = 1 - ТекущиеДанные.Скидка / 100;
	ТекущиеДанные.Сумма = ТекущиеДанные.Цена * ТекущиеДанные.Количество * КоэффициентСкидки;
	
КонецПроцедуры

&НаКлиенте
Процедура РассчитатьСуммуДокумента()
	
	Объект.СуммаДокумента = Объект.Товары.Итог("Сумма") + Объект.Услуги.Итог("Сумма");
	
КонецПроцедуры

#Область ПодключаемыеКоманды

// СтандартныеПодсистемы.ПодключаемыеКоманды
&НаКлиенте
Процедура Подключаемый_ВыполнитьКоманду(Команда)
    ПодключаемыеКомандыКлиент.НачатьВыполнениеКоманды(ЭтотОбъект, Команда, Объект);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ПродолжитьВыполнениеКомандыНаСервере(ПараметрыВыполнения, ДополнительныеПараметры) Экспорт
    ВыполнитьКомандуНаСервере(ПараметрыВыполнения);
КонецПроцедуры

&НаСервере
Процедура ВыполнитьКомандуНаСервере(ПараметрыВыполнения)
    ПодключаемыеКоманды.ВыполнитьКоманду(ЭтотОбъект, ПараметрыВыполнения, Объект);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ОбновитьКоманды()
    ПодключаемыеКомандыКлиентСервер.ОбновитьКоманды(ЭтотОбъект, Объект);
КонецПроцедуры
// Конец СтандартныеПодсистемы.ПодключаемыеКоманды

#КонецОбласти

#КонецОбласти
