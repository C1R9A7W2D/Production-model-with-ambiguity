
(defrule clear-message
	(declare (salience 90))
	?clear-msg-flg <- (clearmessage)
	?sendmessage <- (sendmessagehalt ?msg)
	=>
	(retract ?clear-msg-flg)
	(retract ?sendmessage)
)

(deftemplate item
(slot name (default none))
(slot conf (type FLOAT) (default 0.0))
)

(defrule combine
(declare (salience 60))
?i1 <- (item (name ?f1) (conf ?conf1))
?i2 <- (item (name ?f2) (conf ?conf2))
=>
(if (and (eq ?f1 ?f2) (!= ?conf1 ?conf2)) then
(assert  (item (name ?f1) (conf (- (+ ?conf1 ?conf2) (* ?conf1 ?conf2)))))
(retract ?i1)
(retract ?i2)
(assert ( sendmessagehalt (sym-cat ?f1 ": 
=================================
Коэффициент уверенности пересчитан
=================================")) )
(halt))
)

(defrule правило_1
(declare (salience 50))
(item (name "Мудрость") (conf ?c0))
(item (name "Пробуждение") (conf ?c1))
=>
(assert (item (name "Понимание") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Понимание: Глубинное знание (Жрица) соединяется с инсайтом (Суд), давая полную ясность.
"))
(halt)
)

(defrule правило_2
(declare (salience 50))
(item (name "Инициатива") (conf ?c0))
(item (name "Свобода") (conf ?c1))
=>
(assert (item (name "Творческая энергия") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Творческая энергия: Активное начало (Маг) без ограничений (Шут) рождает чистый креатив.
"))
(halt)
)

(defrule правило_3
(declare (salience 50))
(item (name "Гармония") (conf ?c0))
(item (name "Интуиция") (conf ?c1))
=>
(assert (item (name "Чувствительность") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Чувствительность: Тонкое восприятие (Жрица) в балансе (Влюбленные) усиливает эмпатию.
"))
(halt)
)

(defrule правило_4
(declare (salience 50))
(item (name "Забота") (conf ?c0))
(item (name "Изобилие") (conf ?c1))
=>
(assert (item (name "Устойчивость") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Устойчивость: Ресурсы (Императрица) под присмотром (Забота) создают базу безопасности.
"))
(halt)
)

(defrule правило_5
(declare (salience 50))
(item (name "Контроль") (conf ?c0))
(item (name "Стабильность") (conf ?c1))
=>
(assert (item (name "Уверенность") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Уверенность: Власть над ситуацией (Император) гарантирует твердую почву под ногами.
"))
(halt)
)

(defrule правило_6
(declare (salience 50))
(item (name "Обучение") (conf ?c0))
(item (name "Традиции") (conf ?c1))
=>
(assert (item (name "Передача ценностей") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Передача ценностей: Знания (Иерофант), пропущенные через опыт поколений, становятся наследием.
"))
(halt)
)

(defrule правило_7
(declare (salience 50))
(item (name "Выбор") (conf ?c0))
(item (name "Гармония") (conf ?c1))
=>
(assert (item (name "Синергия") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Синергия: Правильное решение (Влюбленные) приводит к согласованности всех элементов системы.
"))
(halt)
)

(defrule правило_8
(declare (salience 50))
(item (name "Победа") (conf ?c0))
(item (name "Решительность") (conf ?c1))
=>
(assert (item (name "Целеустремленность") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Целеустремленность: Успех (Колесница) требует несгибаемого намерения.
"))
(halt)
)

(defrule правило_9
(declare (salience 50))
(item (name "Мужество") (conf ?c0))
(item (name "Самоконтроль") (conf ?c1))
=>
(assert (item (name "Внутренняя сила") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Внутренняя сила: Укрощение зверя внутри (Сила) формирует стержень характера.
"))
(halt)
)

(defrule правило_10
(declare (salience 50))
(item (name "Поиск истины") (conf ?c0))
(item (name "Размышления") (conf ?c1))
=>
(assert (item (name "Глубина мысли") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Глубина мысли: Уход в себя (Отшельник) ради истины рождает философское видение.
"))
(halt)
)

(defrule правило_11
(declare (salience 50))
(item (name "Перемены") (conf ?c0))
(item (name "Судьба") (conf ?c1))
=>
(assert (item (name "Надежда на перемены") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Надежда на перемены: Вращение колеса (Фортуна) дает веру в то, что черная полоса закончится.
"))
(halt)
)

(defrule правило_12
(declare (salience 50))
(item (name "Равновесие") (conf ?c0))
(item (name "Честность") (conf ?c1))
=>
(assert (item (name "Прозрачность") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Прозрачность: Справедливость требует ясности и отсутствия двойных стандартов.
"))
(halt)
)

(defrule правило_13
(declare (salience 50))
(item (name "Жертва") (conf ?c0))
(item (name "Переосмысление") (conf ?c1))
=>
(assert (item (name "Новая перспектива") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Новая перспектива: Зависание (Повешенный) переворачивает картину мира, открывая иное видение.
"))
(halt)
)

(defrule правило_14
(declare (salience 50))
(item (name "Новый этап") (conf ?c0))
(item (name "Преобразование") (conf ?c1))
=>
(assert (item (name "Начало изменений") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Начало изменений: Смерть старого неминуемо запускает процессы обновления.
"))
(halt)
)

(defrule правило_15
(declare (salience 50))
(item (name "Баланс") (conf ?c0))
(item (name "Гармония") (conf ?c1))
=>
(assert (item (name "Жизненный ритм") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Жизненный ритм: Умеренность создает правильную скорость и цикличность жизни.
"))
(halt)
)

(defrule правило_16
(declare (salience 50))
(item (name "Искушение") (conf ?c0))
(item (name "Привязанность") (conf ?c1))
=>
(assert (item (name "Обостренное желание") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Обостренное желание: Дьявол провоцирует жажду обладания, которую трудно контролировать.
"))
(halt)
)

(defrule правило_17
(declare (salience 50))
(item (name "Внезапность") (conf ?c0))
(item (name "Крушение") (conf ?c1))
=>
(assert (item (name "Неожиданные возможности") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Неожиданные возможности: Когда рушатся стены Башни, открывается горизонт.
"))
(halt)
)

(defrule правило_18
(declare (salience 50))
(item (name "Вдохновение") (conf ?c0))
(item (name "Надежда") (conf ?c1))
=>
(assert (item (name "Мечты и амбиции") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Мечты и амбиции: Звезда освещает путь к высоким, пока недостижимым целям.
"))
(halt)
)

(defrule правило_19
(declare (salience 50))
(item (name "Иллюзии") (conf ?c0))
(item (name "Неопределенность") (conf ?c1))
=>
(assert (item (name "Поиск смыслов") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Поиск смыслов: В сумерках Луны человек вынужден искать опору в смыслах, а не фактах.
"))
(halt)
)

(defrule правило_20
(declare (salience 50))
(item (name "Радость") (conf ?c0))
(item (name "Успех") (conf ?c1))
=>
(assert (item (name "Ощущение достижений") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Ощущение достижений: Солнце дарит чувство удовлетворения от проделанной работы.
"))
(halt)
)

(defrule правило_21
(declare (salience 50))
(item (name "Оценка") (conf ?c0))
(item (name "Пробуждение") (conf ?c1))
=>
(assert (item (name "Самосознание") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Самосознание: Суд заставляет человека трезво взглянуть на себя и свои поступки.
"))
(halt)
)

(defrule правило_22
(declare (salience 50))
(item (name "Завершение") (conf ?c0))
(item (name "Интуиция") (conf ?c1))
=>
(assert (item (name "Заключение с пониманием") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Заключение с пониманием: Мир приносит финал, который чувствуется как правильный и своевременный.
"))
(halt)
)

(defrule правило_23
(declare (salience 50))
(item (name "Контроль") (conf ?c0))
(item (name "Созидание") (conf ?c1))
=>
(assert (item (name "Эффективное управление") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Эффективное управление: Творчество (Маг), введенное в рамки (Император), дает максимальный КПД.
"))
(halt)
)

(defrule правило_24
(declare (salience 50))
(item (name "Изобилие") (conf ?c0))
(item (name "Свобода") (conf ?c1))
=>
(assert (item (name "Безграничные возможности") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Безграничные возможности: Ресурсы при отсутствии ограничений позволяют реализовать что угодно.
"))
(halt)
)

(defrule правило_25
(declare (salience 50))
(item (name "Опыт") (conf ?c0))
(item (name "Спонтанность") (conf ?c1))
=>
(assert (item (name "Интуитивные решения") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Интуитивные решения: Доверие моменту, подкрепленное прошлыми уроками.
"))
(halt)
)

(defrule правило_26
(declare (salience 50))
(item (name "Забота") (conf ?c0))
(item (name "Плодородие") (conf ?c1))
=>
(assert (item (name "Изобилие заботы") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Изобилие заботы: Гиперопека или максимальное благоприятствование для роста.
"))
(halt)
)

(defrule правило_27
(declare (salience 50))
(item (name "Власть") (conf ?c0))
(item (name "Стабильность") (conf ?c1))
=>
(assert (item (name "Устойчивое руководство") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Устойчивое руководство: Лидерство, основанное на предсказуемости и порядке.
"))
(halt)
)

(defrule правило_28
(declare (salience 50))
(item (name "Обучение") (conf ?c0))
(item (name "Традиции") (conf ?c1))
=>
(assert (item (name "Наследие знаний") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Наследие знаний: Консервативный подход к образованию, сохранение школ и методов.
"))
(halt)
)

(defrule правило_29
(declare (salience 50))
(item (name "Гармония") (conf ?c0))
(item (name "Союз") (conf ?c1))
=>
(assert (item (name "Взаимопонимание") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Взаимопонимание: Идеальное партнерство, где стороны слышат друг друга.
"))
(halt)
)

(defrule правило_30
(declare (salience 50))
(item (name "Движение вперед") (conf ?c0))
(item (name "Решительность") (conf ?c1))
=>
(assert (item (name "Мотивированное действие") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Мотивированное действие: Активность, имеющая под собой четкий стимул.
"))
(halt)
)

(defrule правило_31
(declare (salience 50))
(item (name "Мужество") (conf ?c0))
(item (name "Терпение") (conf ?c1))
=>
(assert (item (name "Стойкость в трудностях") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Стойкость в трудностях: Способность переносить невзгоды без жалоб (Сила).
"))
(halt)
)

(defrule правило_32
(declare (salience 50))
(item (name "Размышления") (conf ?c0))
(item (name "Уединение") (conf ?c1))
=>
(assert (item (name "Глубокое самопознание") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Глубокое самопознание: Изоляция как инструмент для понимания своей сути.
"))
(halt)
)

(defrule правило_33
(declare (salience 50))
(item (name "Возможности") (conf ?c0))
(item (name "Судьба") (conf ?c1))
=>
(assert (item (name "Успех в неожиданностях") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Успех в неожиданностях: Фатализм, приносящий удачу ("повезло").
"))
(halt)
)

(defrule правило_34
(declare (salience 50))
(item (name "Равновесие") (conf ?c0))
(item (name "Честность") (conf ?c1))
=>
(assert (item (name "Этическая стабильность") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Этическая стабильность: Непоколебимые моральные принципы.
"))
(halt)
)

(defrule правило_35
(declare (salience 50))
(item (name "Жертва") (conf ?c0))
(item (name "Сопротивление") (conf ?c1))
=>
(assert (item (name "Преодоление трудностей") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Преодоление трудностей: Ситуация требует усилий через "не могу" или отказ от комфорта.
"))
(halt)
)

(defrule правило_36
(declare (salience 50))
(item (name "Конец") (conf ?c0))
(item (name "Преобразование") (conf ?c1))
=>
(assert (item (name "Начало нового пути") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Начало нового пути: Точка бифуркации, где финиш становится стартом.
"))
(halt)
)

(defrule правило_37
(declare (salience 50))
(item (name "Гармония") (conf ?c0))
(item (name "Сдержанность") (conf ?c1))
=>
(assert (item (name "Умеренность в удовольствии") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Умеренность в удовольствии: Аскеза или разумное потребление, ведущее к здоровью.
"))
(halt)
)

(defrule правило_38
(declare (salience 50))
(item (name "Искушение") (conf ?c0))
(item (name "Ограничения") (conf ?c1))
=>
(assert (item (name "Изучение границ") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Изучение границ: Дьявол проверяет, насколько далеко можно зайти.
"))
(halt)
)

(defrule правило_39
(declare (salience 50))
(item (name "Крушение") (conf ?c0))
(item (name "Перелом") (conf ?c1))
=>
(assert (item (name "Переосмысление основ") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Переосмысление основ: Кризис заставляет пересмотреть фундамент жизни.
"))
(halt)
)

(defrule правило_40
(declare (salience 50))
(item (name "Надежда") (conf ?c0))
(item (name "Озарение") (conf ?c1))
=>
(assert (item (name "Вдохновленная перспектива") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Вдохновленная перспектива: Инсайт, дающий веру в то, что все получится.
"))
(halt)
)

(defrule правило_41
(declare (salience 50))
(item (name "Иллюзии") (conf ?c0))
(item (name "Скрытое") (conf ?c1))
=>
(assert (item (name "Обман восприятия") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Обман восприятия: То, что мы видим, не соответствует действительности (Луна).
"))
(halt)
)

(defrule правило_42
(declare (salience 50))
(item (name "Радость") (conf ?c0))
(item (name "Успех") (conf ?c1))
=>
(assert (item (name "Достижение счастья") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Достижение счастья: Материальный успех, приносящий эмоциональное удовлетворение.
"))
(halt)
)

(defrule правило_43
(declare (salience 50))
(item (name "Оценка") (conf ?c0))
(item (name "Пробуждение") (conf ?c1))
=>
(assert (item (name "Прояснение ситуации") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Прояснение ситуации: Момент истины, когда все тайное становится явным.
"))
(halt)
)

(defrule правило_44
(declare (salience 50))
(item (name "Завершение") (conf ?c0))
(item (name "Целостность") (conf ?c1))
=>
(assert (item (name "Полное понимание") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Полное понимание: Гештальт закрыт, урок усвоен полностью.
"))
(halt)
)

(defrule правило_45
(declare (salience 50))
(item (name "Вдохновение") (conf ?c0))
(item (name "Доказательства") (conf ?c1))
=>
(assert (item (name "Усиливающий эффект") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Усиливающий эффект: Вера, подкрепленная фактами, становится несокрушимой.
"))
(halt)
)

(defrule правило_46
(declare (salience 50))
(item (name "Забота") (conf ?c0))
(item (name "Работа") (conf ?c1))
=>
(assert (item (name "Совместный труд") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Совместный труд: Усердие и внимание к деталям, процесс созидания с любовью.
"))
(halt)
)

(defrule правило_47
(declare (salience 50))
(item (name "Мужество") (conf ?c0))
(item (name "Самоконтроль") (conf ?c1))
=>
(assert (item (name "Внутренняя стойкость") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Внутренняя стойкость: Железная воля, позволяющая не сломаться.
"))
(halt)
)

(defrule правило_48
(declare (salience 50))
(item (name "Власть") (conf ?c0))
(item (name "Переосмысление") (conf ?c1))
=>
(assert (item (name "Переход к новому лидерству") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Переход к новому лидерству: Смена парадигмы управления или смена руководителя.
"))
(halt)
)

(defrule правило_49
(declare (salience 50))
(item (name "Забота") (conf ?c0))
(item (name "Поддержка") (conf ?c1))
=>
(assert (item (name "Укрепляющие отношения") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Укрепляющие отношения: Взаимопомощь как фундамент связи.
"))
(halt)
)

(defrule правило_50
(declare (salience 50))
(item (name "Изобилие") (conf ?c0))
(item (name "Спонтанность") (conf ?c1))
=>
(assert (item (name "Радость в неожиданных моментах") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Радость в неожиданных моментах: Сюрпризы судьбы, приносящие дары.
"))
(halt)
)

(defrule правило_51
(declare (salience 50))
(item (name "Интуиция") (conf ?c0))
(item (name "Судьба") (conf ?c1))
=>
(assert (item (name "Внутренние предзнаменования") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Внутренние предзнаменования: Предчувствие грядущих событий.
"))
(halt)
)

(defrule правило_52
(declare (salience 50))
(item (name "Взаимопонимание") (conf ?c0))
(item (name "Завершение") (conf ?c1))
=>
(assert (item (name "Мир через сострадание") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Мир через сострадание: Конфликт исчерпан благодаря эмпатии.
"))
(halt)
)

(defrule правило_53
(declare (salience 50))
(item (name "Обучение") (conf ?c0))
(item (name "Преобразование") (conf ?c1))
=>
(assert (item (name "Эволюция знаний") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Эволюция знаний: Образование меняет личность ученика.
"))
(halt)
)

(defrule правило_54
(declare (salience 50))
(item (name "Вдохновение") (conf ?c0))
(item (name "Скрытое") (conf ?c1))
=>
(assert (item (name "Невидимые источники силы") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Невидимые источники силы: Подпитка из неочевидных или эзотерических ресурсов.
"))
(halt)
)

(defrule правило_55
(declare (salience 50))
(item (name "Инициатива") (conf ?c0))
(item (name "Совершенствование") (conf ?c1))
=>
(assert (item (name "Активные улучшения") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Активные улучшения: Действия, направленные на оптимизацию процессов.
"))
(halt)
)

(defrule правило_56
(declare (salience 50))
(item (name "Гармония") (conf ?c0))
(item (name "Честность") (conf ?c1))
=>
(assert (item (name "Этика в отношениях") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Этика в отношениях: Честные отношения как залог покоя.
"))
(halt)
)

(defrule правило_57
(declare (salience 50))
(item (name "Плодородие") (conf ?c0))
(item (name "Успех") (conf ?c1))
=>
(assert (item (name "Результаты усилий") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Результаты усилий: Урожай собран, труды вознаграждены.
"))
(halt)
)

(defrule правило_58
(declare (salience 50))
(item (name "Возрождение") (conf ?c0))
(item (name "Прогресс") (conf ?c1))
=>
(assert (item (name "Новый виток жизни") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Новый виток жизни: Выход на новый уровень спирали развития.
"))
(halt)
)

(defrule правило_59
(declare (salience 50))
(item (name "Глубина") (conf ?c0))
(item (name "Рассуждение") (conf ?c1))
=>
(assert (item (name "Философское понимание") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Философское понимание: Интеллектуальный анализ приводит к мудрости.
"))
(halt)
)

(defrule правило_60
(declare (salience 50))
(item (name "Вдохновение") (conf ?c0))
(item (name "Обучение") (conf ?c1))
=>
(assert (item (name "Творческий рост через знания") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Творческий рост через знания: Учеба стимулирует креативность.
"))
(halt)
)

(defrule правило_61
(declare (salience 50))
(item (name "Будущее") (conf ?c0))
(item (name "Понимание") (conf ?c1))
=>
(assert (item (name "Осознанный путь к будущему") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Осознанный путь к будущему: Ясное видение цели позволяет строить маршрут.
"))
(halt)
)

(defrule правило_62
(declare (salience 50))
(item (name "Прошлое") (conf ?c0))
(item (name "Творческая энергия") (conf ?c1))
=>
(assert (item (name "Опыт, обогащающий творчество") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Опыт, обогащающий творчество: Прошлые наработки становятся топливом для новых идей.
"))
(halt)
)

(defrule правило_63
(declare (salience 50))
(item (name "Настоящее") (conf ?c0))
(item (name "Чувствительность") (conf ?c1))
=>
(assert (item (name "Открытость к текущему моменту") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Открытость к текущему моменту: Умение чувствовать "здесь и сейчас".
"))
(halt)
)

(defrule правило_64
(declare (salience 50))
(item (name "Будущее") (conf ?c0))
(item (name "Устойчивость") (conf ?c1))
=>
(assert (item (name "Долговременные результаты") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Долговременные результаты: Фундамент, заложенный сейчас, простоит долго.
"))
(halt)
)

(defrule правило_65
(declare (salience 50))
(item (name "Настоящее") (conf ?c0))
(item (name "Уверенность") (conf ?c1))
=>
(assert (item (name "Действия без сомнений") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Действия без сомнений: Решительность в текущем моменте времени.
"))
(halt)
)

(defrule правило_66
(declare (salience 50))
(item (name "Передача ценностей") (conf ?c0))
(item (name "Прошлое") (conf ?c1))
=>
(assert (item (name "Уроки из прошлого формируют будущее") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Уроки из прошлого формируют будущее: Традиции предков влияют на потомков.
"))
(halt)
)

(defrule правило_67
(declare (salience 50))
(item (name "Настоящее") (conf ?c0))
(item (name "Синергия") (conf ?c1))
=>
(assert (item (name "Сила сотрудничества в текущем моменте") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Сила сотрудничества в текущем моменте: Объединение усилий сейчас даст быстрый эффект.
"))
(halt)
)

(defrule правило_68
(declare (salience 50))
(item (name "Будущее") (conf ?c0))
(item (name "Целеустремленность") (conf ?c1))
=>
(assert (item (name "Определенные шаги к желаемому") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Определенные шаги к желаемому: Планирование и движение к цели.
"))
(halt)
)

(defrule правило_69
(declare (salience 50))
(item (name "Внутренняя сила") (conf ?c0))
(item (name "Настоящее") (conf ?c1))
=>
(assert (item (name "Преодоление текущих препятствий") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Преодоление текущих препятствий: Мобилизация ресурсов для решения проблемы.
"))
(halt)
)

(defrule правило_70
(declare (salience 50))
(item (name "Глубина мысли") (conf ?c0))
(item (name "Прошлое") (conf ?c1))
=>
(assert (item (name "Анализ прошлых опытов для роста") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Анализ прошлых опытов для роста: Рефлексия над ошибками прошлого.
"))
(halt)
)

(defrule правило_71
(declare (salience 50))
(item (name "Будущее") (conf ?c0))
(item (name "Надежда на перемены") (conf ?c1))
=>
(assert (item (name "Оптимизм в отношении будущих изменений") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Оптимизм в отношении будущих изменений: Позитивное ожидание того, что будет.
"))
(halt)
)

(defrule правило_72
(declare (salience 50))
(item (name "Настоящее") (conf ?c0))
(item (name "Прозрачность") (conf ?c1))
=>
(assert (item (name "Открытость в текущих делах") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Открытость в текущих делах: Отсутствие тайн в текущей ситуации.
"))
(halt)
)

(defrule правило_73
(declare (salience 50))
(item (name "Будущее") (conf ?c0))
(item (name "Новая перспектива") (conf ?c1))
=>
(assert (item (name "Видение альтернативного будущего") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Видение альтернативного будущего: Появление новых вариантов развития событий.
"))
(halt)
)

(defrule правило_74
(declare (salience 50))
(item (name "Настоящее") (conf ?c0))
(item (name "Начало изменений") (conf ?c1))
=>
(assert (item (name "Актуальные шаги к переменам") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Актуальные шаги к переменам: Процесс трансформации уже запущен.
"))
(halt)
)

(defrule правило_75
(declare (salience 50))
(item (name "Настоящее") (conf ?c0))
(item (name "Умеренность") (conf ?c1))
=>
(assert (item (name "Балансировка текущих потребностей") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Балансировка текущих потребностей: Поиск компромисса прямо сейчас.
"))
(halt)
)

(defrule правило_76
(declare (salience 50))
(item (name "Будущее") (conf ?c0))
(item (name "Обостренное желание") (conf ?c1))
=>
(assert (item (name "Стремление к осуществлению желаемого") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Стремление к осуществлению желаемого: Мотивация, направленная на перспективу.
"))
(halt)
)

(defrule правило_77
(declare (salience 50))
(item (name "Будущее") (conf ?c0))
(item (name "Неожиданные возможности") (conf ?c1))
=>
(assert (item (name "Открытие новых путей вперед") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Открытие новых путей вперед: Судьба готовит сюрприз.
"))
(halt)
)

(defrule правило_78
(declare (salience 50))
(item (name "Вдохновленная перспектива") (conf ?c0))
(item (name "Настоящее") (conf ?c1))
=>
(assert (item (name "Мощный стимул для текущих действий") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Мощный стимул для текущих действий: Муза посетила кверента сейчас.
"))
(halt)
)

(defrule правило_79
(declare (salience 50))
(item (name "Будущее") (conf ?c0))
(item (name "Поиск смыслов") (conf ?c1))
=>
(assert (item (name "Направление к поиску новых целей") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Направление к поиску новых целей: Экзистенциальный поиск вектора жизни.
"))
(halt)
)

(defrule правило_80
(declare (salience 50))
(item (name "Настоящее") (conf ?c0))
(item (name "Ощущение достижений") (conf ?c1))
=>
(assert (item (name "Ощущение радости в текущем моменте") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Ощущение радости в текущем моменте: Празднование успеха здесь и сейчас.
"))
(halt)
)

(defrule правило_81
(declare (salience 50))
(item (name "Прошлое") (conf ?c0))
(item (name "Самосознание") (conf ?c1))
=>
(assert (item (name "Понимание себя через призму прошлого") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Понимание себя через призму прошлого: Психоанализ своей истории.
"))
(halt)
)

(defrule правило_82
(declare (salience 50))
(item (name "Будущее") (conf ?c0))
(item (name "Полное понимание") (conf ?c1))
=>
(assert (item (name "Ясность в будущем выборе") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Ясность в будущем выборе: Кверент будет точно знать, что делать.
"))
(halt)
)

(defrule правило_83
(declare (salience 50))
(item (name "Будущее") (conf ?c0))
(item (name "Укрепляющие отношения") (conf ?c1))
=>
(assert (item (name "Долгосрочные связи дают силы") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Долгосрочные связи дают силы: Инвестиция в отношения окупится.
"))
(halt)
)

(defrule правило_84
(declare (salience 50))
(item (name "Настоящее") (conf ?c0))
(item (name "Радость в неожиданных моментах") (conf ?c1))
=>
(assert (item (name "Ценность текущих радостей") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Ценность текущих радостей: Умение наслаждаться моментом.
"))
(halt)
)

(defrule правило_85
(declare (salience 50))
(item (name "Будущее") (conf ?c0))
(item (name "Внутренние предзнаменования") (conf ?c1))
=>
(assert (item (name "Предчувствие будущих успехов") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Предчувствие будущих успехов: Интуиция подсказывает хороший исход.
"))
(halt)
)

(defrule правило_86
(declare (salience 50))
(item (name "Мир через сострадание") (conf ?c0))
(item (name "Прошлое") (conf ?c1))
=>
(assert (item (name "Уроки любви из прошлого") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Уроки любви из прошлого: Прощение старых обид приносит покой.
"))
(halt)
)

(defrule правило_87
(declare (salience 50))
(item (name "Настоящее") (conf ?c0))
(item (name "Эволюция знаний") (conf ?c1))
=>
(assert (item (name "Применение знаний для настоящих вызовов") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Применение знаний для настоящих вызовов: Использование навыков на практике.
"))
(halt)
)

(defrule правило_88
(declare (salience 50))
(item (name "Будущее") (conf ?c0))
(item (name "Невидимые источники силы") (conf ?c1))
=>
(assert (item (name "Нестандартные пути к достижениям") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Нестандартные пути к достижениям: Помощь придет оттуда, откуда не ждали.
"))
(halt)
)

(defrule правило_89
(declare (salience 50))
(item (name "Активные улучшения") (conf ?c0))
(item (name "Настоящее") (conf ?c1))
=>
(assert (item (name "Результаты попыток здесь и сейчас") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Результаты попыток здесь и сейчас: Виден прогресс в реальном времени.
"))
(halt)
)

(defrule правило_90
(declare (salience 50))
(item (name "Будущее") (conf ?c0))
(item (name "Этика в отношениях") (conf ?c1))
=>
(assert (item (name "Создание основ для гармонии в будущем") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Создание основ для гармонии в будущем: Честность сейчас — залог доверия потом.
"))
(halt)
)

(defrule правило_91
(declare (salience 50))
(item (name "Будущее") (conf ?c0))
(item (name "Результаты усилий") (conf ?c1))
=>
(assert (item (name "Плоды труда в будущем") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Плоды труда в будущем: Работа на перспективу, отложенная награда.
"))
(halt)
)

(defrule правило_92
(declare (salience 50))
(item (name "Настоящее") (conf ?c0))
(item (name "Новый виток жизни") (conf ?c1))
=>
(assert (item (name "Перспектива обновлений в действии") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Перспектива обновлений в действии: Смена декораций происходит сейчас.
"))
(halt)
)

(defrule правило_93
(declare (salience 50))
(item (name "Будущее") (conf ?c0))
(item (name "Философское понимание") (conf ?c1))
=>
(assert (item (name "Осмысленный путь в завтрашний день") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Осмысленный путь в завтрашний день: Стратегия жизни, основанная на мудрости.
"))
(halt)
)

(defrule правило_94
(declare (salience 50))
(item (name "Настоящее") (conf ?c0))
(item (name "Творческий рост через знания") (conf ?c1))
=>
(assert (item (name "Движение вперед с полученными уроками") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Движение вперед с полученными уроками: Учеба сразу переходит в практику.
"))
(halt)
)

(defrule правило_95
(declare (salience 50))
(item (name "Настоящее") (conf ?c0))
(item (name "Осознанный путь к будущему") (conf ?c1))
=>
(assert (item (name "Интуитивные шаги в текущих ситуациях") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Интуитивные шаги в текущих ситуациях: Действия сегодня определяют завтра.
"))
(halt)
)

(defrule правило_96
(declare (salience 50))
(item (name "Будущее") (conf ?c0))
(item (name "Долговременные результаты") (conf ?c1))
=>
(assert (item (name "Ожидание последствий действий") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Ожидание последствий действий: Эффект бумеранга или урожая.
"))
(halt)
)

(defrule правило_97
(declare (salience 50))
(item (name "Открытость к текущему моменту") (conf ?c0))
(item (name "Прошлое") (conf ?c1))
=>
(assert (item (name "Уроки из прошлого помогают сегодня") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Уроки из прошлого помогают сегодня: Опыт помогает не упустить шанс.
"))
(halt)
)

(defrule правило_98
(declare (salience 50))
(item (name "Будущее") (conf ?c0))
(item (name "Ощущение радости") (conf ?c1))
=>
(assert (item (name "Ожидание счастья впереди") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Ожидание счастья впереди: Предвкушение праздника.
"))
(halt)
)

(defrule правило_99
(declare (salience 50))
(item (name "Будущее") (conf ?c0))
(item (name "Преодоление текущих препятствий") (conf ?c1))
=>
(assert (item (name "Подготовка к будущим вызовам") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Подготовка к будущим вызовам: Закалка характера для новых битв.
"))
(halt)
)

(defrule правило_100
(declare (salience 50))
(item (name "Долговременные результаты") (conf ?c0))
(item (name "Настоящее") (conf ?c1))
=>
(assert (item (name "Непосредственное влияние действий") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Непосредственное влияние действий: То, что делаешь сейчас, сразу меняет фундамент.
"))
(halt)
)

(defrule правило_101
(declare (salience 50))
(item (name "Будущее") (conf ?c0))
(item (name "Открытость к текущему моменту") (conf ?c1))
=>
(assert (item (name "Принятие изменений в будущем") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Принятие изменений в будущем: Гибкость перед лицом грядущего.
"))
(halt)
)

(defrule правило_102
(declare (salience 50))
(item (name "Настоящее") (conf ?c0))
(item (name "Устойчивость") (conf ?c1))
=>
(assert (item (name "Поддержка в текущих трудностях") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Поддержка в текущих трудностях: Опора, которая не дает упасть сейчас.
"))
(halt)
)

(defrule правило_103
(declare (salience 50))
(item (name "Значение осознанности") (conf ?c0))
(item (name "Прошлое") (conf ?c1))
=>
(assert (item (name "Осознание уроков для будущего") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Осознание уроков для будущего: Работа над ошибками завершена.
"))
(halt)
)

(defrule правило_104
(declare (salience 50))
(item (name "Глубокие мысли") (conf ?c0))
(item (name "Настоящее") (conf ?c1))
=>
(assert (item (name "Реальное понимание текущей ситуации") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Реальное понимание текущей ситуации: Взгляд в суть проблемы.
"))
(halt)
)

(defrule правило_105
(declare (salience 50))
(item (name "Будущее") (conf ?c0))
(item (name "Внутренняя сила") (conf ?c1))
=>
(assert (item (name "Использование сил для достижения целей") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Использование сил для достижения целей: Потенциал будет реализован.
"))
(halt)
)

(defrule правило_106
(declare (salience 50))
(item (name "Надежда на перемены") (conf ?c0))
(item (name "Настоящее") (conf ?c1))
=>
(assert (item (name "Ожидание изменений в жизни") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Ожидание изменений в жизни: Состояние готовности к новому.
"))
(halt)
)

(defrule правило_107
(declare (salience 50))
(item (name "Будущее") (conf ?c0))
(item (name "Синергия") (conf ?c1))
=>
(assert (item (name "Создание мощных инициатив") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Создание мощных инициатив: Объединение даст старт крупному проекту.
"))
(halt)
)

(defrule правило_108
(declare (salience 50))
(item (name "Прозрачность") (conf ?c0))
(item (name "Прошлое") (conf ?c1))
=>
(assert (item (name "Прояснение прошлого опыта") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Прояснение прошлого опыта: Тайны прошлого раскрыты.
"))
(halt)
)

(defrule правило_109
(declare (salience 50))
(item (name "Будущее") (conf ?c0))
(item (name "Вдохновленные действия") (conf ?c1))
=>
(assert (item (name "Стремление к достижением через творческий подход") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Стремление к достижением через творческий подход: Креатив станет ключом к успеху.
"))
(halt)
)

(defrule правило_110
(declare (salience 50))
(item (name "Осознанный путь к будущему") (conf ?c0))
(item (name "Устойчивость") (conf ?c1))
=>
(assert (item (name "Будьте уверены в своих действиях, и они принесут стабильность в будущем.") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Будьте уверены в своих действиях, и они принесут стабильность в будущем.: Совет сохранять курс и не сомневаться в выбранной стратегии.
"))
(halt)
)

(defrule правило_111
(declare (salience 50))
(item (name "Открытость к текущему моменту") (conf ?c0))
(item (name "Радость в неожиданных моментах") (conf ?c1))
=>
(assert (item (name "Научитесь ценить маленькие радости сегодня, и они приведут к большему счастью завтра.") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Научитесь ценить маленькие радости сегодня, и они приведут к большему счастью завтра.: Рекомендация практики благодарности и присутствия.
"))
(halt)
)

(defrule правило_112
(declare (salience 50))
(item (name "Надежда на перемены") (conf ?c0))
(item (name "Перспективы изменений") (conf ?c1))
=>
(assert (item (name "Уверен, что перемены, которые вы ожидаете, принесут положительные результаты.") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Уверен, что перемены, которые вы ожидаете, принесут положительные результаты.: Утешение и поддержка в период нестабильности.
"))
(halt)
)

(defrule правило_113
(declare (salience 50))
(item (name "Глубина мыслей") (conf ?c0))
(item (name "Осознание уроков") (conf ?c1))
=>
(assert (item (name "Рассматривайте свои опыт и уроки как руководства к будущим успехам.") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Рассматривайте свои опыт и уроки как руководства к будущим успехам.: Совет использовать рефлексию как инструмент роста.
"))
(halt)
)

(defrule правило_114
(declare (salience 50))
(item (name "Нестандартные пути") (conf ?c0))
(item (name "Уверенность") (conf ?c1))
=>
(assert (item (name "Действуйте смело и следуйте необычным путям, и вы добьетесь результатов.") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Действуйте смело и следуйте необычным путям, и вы добьетесь результатов.: Призыв к риску и инновациям (энергия Шута/Мага).
"))
(halt)
)

(defrule правило_115
(declare (salience 50))
(item (name "Подготовка к будущим вызовам") (conf ?c0))
(item (name "Преодоление препятствий") (conf ?c1))
=>
(assert (item (name "Будьте готовы к трудностям, и вы найдете способ их преодолеть.") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Будьте готовы к трудностям, и вы найдете способ их преодолеть.: Предупреждение о необходимости мобилизации сил.
"))
(halt)
)

(defrule правило_116
(declare (salience 50))
(item (name "Значение осознанности") (conf ?c0))
(item (name "Прозрачность") (conf ?c1))
=>
(assert (item (name "Стремитесь к честности в своих мыслях и действиях, и это принесет ясность.") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Стремитесь к честности в своих мыслях и действиях, и это принесет ясность.: Совет не лгать себе и окружающим (Справедливость).
"))
(halt)
)

(defrule правило_117
(declare (salience 50))
(item (name "Синергия") (conf ?c0))
(item (name "Эмоциональная поддержка") (conf ?c1))
=>
(assert (item (name "Объединяйтесь с теми, кто разделяет ваши ценности — это приведет к силы и эффекту.") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Объединяйтесь с теми, кто разделяет ваши ценности — это приведет к силы и эффекту.: Рекомендация искать единомышленников (Влюбленные).
"))
(halt)
)

(defrule правило_118
(declare (salience 50))
(item (name "Вдохновение действий") (conf ?c0))
(item (name "Стремление к обучению") (conf ?c1))
=>
(assert (item (name "Ищите знания, и они вдохновят вас на новые высокие достижения.") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Ищите знания, и они вдохновят вас на новые высокие достижения.: Совет учиться новому для выхода из застоя.
"))
(halt)
)

(defrule правило_119
(declare (salience 50))
(item (name "Жизненный ритм") (conf ?c0))
(item (name "Прогресс") (conf ?c1))
=>
(assert (item (name "Следите за ритмом своей жизни — это поможет вам избежать выгорания.") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Следите за ритмом своей жизни — это поможет вам избежать выгорания.: Напоминание о балансе труда и отдыха (Умеренность).
"))
(halt)
)

(defrule правило_120
(declare (salience 50))
(item (name "Мудрость из прошлого") (conf ?c0))
(item (name "Открытость к новому") (conf ?c1))
=>
(assert (item (name "Не бойтесь адаптироваться, используя уроки опыта в настоящих условиях.") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Не бойтесь адаптироваться, используя уроки опыта в настоящих условиях.: Совет сочетать инновации с проверенными методами.
"))
(halt)
)

(defrule правило_121
(declare (salience 50))
(item (name "Долговременные результаты") (conf ?c0))
(item (name "Обостренное желание") (conf ?c1))
=>
(assert (item (name "Стремление к мечте ведет к успеху в будущем - действуйте уже сейчас.") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Стремление к мечте ведет к успеху в будущем - действуйте уже сейчас.: Побуждение к немедленным действиям ради мечты.
"))
(halt)
)

(defrule правило_122
(declare (salience 50))
(item (name "Интуитивные шаги") (conf ?c0))
(item (name "Сила сотрудничества") (conf ?c1))
=>
(assert (item (name "Работа в команде с интуицией поможет вам открывать новые возможности.") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Работа в команде с интуицией поможет вам открывать новые возможности.: Совет слушать коллективное бессознательное или партнера.
"))
(halt)
)

(defrule правило_123
(declare (salience 50))
(item (name "Верность традициям") (conf ?c0))
(item (name "Устойчивость") (conf ?c1))
=>
(assert (item (name "Соблюдение традиций даст вам силу в текущих ситуациях.") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Соблюдение традиций даст вам силу в текущих ситуациях.: Рекомендация действовать консервативно (Иерофант/Император).
"))
(halt)
)

(defrule правило_124
(declare (salience 50))
(item (name "Начало изменений") (conf ?c0))
(item (name "Эмоциональное развитие") (conf ?c1))
=>
(assert (item (name "Начать изменения — значит взять на себя ответственность за свое развитие.") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Начать изменения — значит взять на себя ответственность за свое развитие.: Указание на внутренний рост через внешние перемены.
"))
(halt)
)

(defrule правило_125
(declare (salience 50))
(item (name "Надежды на новое") (conf ?c0))
(item (name "Совершенствование") (conf ?c1))
=>
(assert (item (name "Работа над собой приведет вас к новым возможностям в будущем.") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Работа над собой приведет вас к новым возможностям в будущем.: Мотивация к саморазвитию.
"))
(halt)
)

(defrule правило_126
(declare (salience 50))
(item (name "Объединение усилий") (conf ?c0))
(item (name "Ожидание счастья") (conf ?c1))
=>
(assert (item (name "Счастье придёт, когда вы объедините силы с другими.") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Счастье придёт, когда вы объедините силы с другими.: Совет не быть одиночкой в поиске счастья.
"))
(halt)
)

(defrule правило_127
(declare (salience 50))
(item (name "Вдохновение на действия") (conf ?c0))
(item (name "Картирование пути") (conf ?c1))
=>
(assert (item (name "Используйте вдохновение для планирования своего пути к успеху.") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Используйте вдохновение для планирования своего пути к успеху.: Совет заземлять мечты в реальные планы.
"))
(halt)
)

(defrule правило_128
(declare (salience 50))
(item (name "Внутренняя сила") (conf ?c0))
(item (name "Уверенность в действиях") (conf ?c1))
=>
(assert (item (name "Действуйте смело, опираясь на свою силу, и преодолите любые преграды.") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Действуйте смело, опираясь на свою силу, и преодолите любые преграды.: Поддержка уверенности кверента (Сила).
"))
(halt)
)

(defrule правило_129
(declare (salience 50))
(item (name "Ориентация на результаты") (conf ?c0))
(item (name "Эволюция знаний") (conf ?c1))
=>
(assert (item (name "Развивая свои знания, вы настраиваетесь на долгосрочные достижения.") (conf (* 1.0 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "Развивая свои знания, вы настраиваетесь на долгосрочные достижения.: Утверждение, что обучение — это инвестиция.
"))
(halt)
)

