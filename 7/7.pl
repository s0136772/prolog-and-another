read_str(A):-get0(X),r_str(X,A,[]).
r_str(10,A,A):-!.
r_str(X,A,B):-append(B,[X],B1),get0(X1),r_str(X1,A,B1).
%Предикат чтения

:-dynamic pol/2.
pol_r(X,Y):-repeat,(pol(X,Y) -> (nl,write(X),nl,write(Y),write("."), retract(pol(X,Y))); X=nil, Y=nil).
read_pol(-1):-!.
read_pol(_):-read_str(Lang), name(X,Lang),read(Y),asserta(pol(X,Y)), get0(Sym),read_pol(Sym).%чтение
pr_pol_t:-tell('c:/7/pol.txt'), pol_r(X,_), X=nil, told.%запись
pr_pol_s:-see('c:/7/pol.txt'), get0(Sym), read_pol(Sym), seen.%открытие файла для чтения


:-dynamic hum/2.
hum_r(X,Y):-repeat,(hum(X,Y) -> (nl,write(X),nl,write(Y),write("."), retract(hum(X,Y))) ;X=nil,Y=nil).
read_hum(-1):-!.
read_hum(_):- read_str(Lang),name(X,Lang),read(Y),asserta(hum(X,Y)),get0(Sym),read_hum(Sym).
pr_hum_t:-tell('c:/7/hum.txt'),hum_r(X,_),X=nil,told.
pr_hum_s:-see('c:/7/hum.txt'), get0(Sym), read_hum(Sym),seen.


:-dynamic suit/2.
suit_r(X,Y):-repeat,(suit(X,Y) -> (nl,write(X),nl,write(Y),write("."), retract(suit(X,Y))); X=nil, Y=nil).
read_suit(-1):-!.
read_suit(_):-read_str(Lang), name(X,Lang),read(Y),asserta(suit(X,Y)), get0(Sym),read_suit(Sym).
pr_suit_t:-tell('c:/7/suit.txt'), suit_r(X,_), X=nil, told.
pr_suit_s:-see('c:/7/suit.txt'), get0(Sym), read_suit(Sym), seen.


:-dynamic dd/2.
dd_r(X,Y):-repeat,(dd(X,Y) -> (nl,write(X),nl,write(Y),write("."), retract(dd(X,Y))); X=nil, Y=nil).
read_dd(-1):-!.
read_dd(_):-read_str(Lang), name(X,Lang),read(Y),asserta(dd(X,Y)), get0(Sym),read_dd(Sym).
pr_dd_t:-tell('c:/7/dd.txt'), dd_r(X,_), X=nil, told.
pr_dd_s:-see('c:/7/dd.txt'), get0(Sym), read_dd(Sym), seen.

:-dynamic tank/2.
tank_r(X,Y):-repeat,(tank(X,Y) -> (nl,write(X),nl,write(Y),write("."), retract(tank(X,Y))); X=nil, Y=nil).
read_tank(-1):-!.
read_tank(_):-read_str(Lang), name(X,Lang),read(Y),asserta(tank(X,Y)), get0(Sym),read_tank(Sym).
pr_tank_t:-tell('c:/7/tank.txt'), tank_r(X,_), X=nil, told.
pr_tank_s:-see('c:/7/tank.txt'), get0(Sym), read_tank(Sym), seen.

:-dynamic over/2.
over_r(X,Y):-repeat,(over(X,Y) -> (nl,write(X),nl,write(Y),write("."), retract(over(X,Y))); X=nil, Y=nil).
read_over(-1):-!.
read_over(_):-read_str(Lang), name(X,Lang),read(Y),asserta(over(X,Y)), get0(Sym),read_over(Sym).
pr_over_t:-tell('c:/7/over.txt'), over_r(X,_), X=nil, told.
pr_over_s:-see('c:/7/over.txt'), get0(Sym), read_over(Sym), seen.

:-dynamic kog/2.
kog_r(X,Y):-repeat,(kog(X,Y) -> (nl,write(X),nl,write(Y),write("."), retract(kog(X,Y))); X=nil, Y=nil).
read_kog(-1):-!.
read_kog(_):-read_str(Lang), name(X,Lang),read(Y),asserta(kog(X,Y)), get0(Sym),read_kog(Sym).
pr_kog_t:-tell('c:/7/kog.txt'), kog_r(X,_), X=nil, told.
pr_kog_s:-see('c:/7/kog.txt'), get0(Sym), read_kog(Sym), seen.
%Предикаты для чтения и записи

question1(X1):-	write("Ваш персонаж мужского пола?"),nl,
				write("0. Нет"),nl,
				write("1. Да"),nl,
				read(X1).

question2(X2):-	write("Ваш персонаж человек?"),nl,
				write("0. Нет"),nl,
				write("1. Да"),nl,
				write("2. Киборг"),nl,
				read(X2).

question3(X3):-	write("Ваш персонаж использует броневой костюм?"),nl,
				write("0. Нет"),nl,
				write("1. Да"),nl,
				read(X3).

question4(X4):-	write("Ваш персонаж дд?"),nl,
				write("0. Нет"),nl,
				write("1. Да"),nl,
				read(X4).

question5(X5):-	write("Ваш персонаж танк?"),nl,
				write("0. Нет"),nl,
				write("1. Да"),nl,
				read(X5).

question6(X6):-	write("Ваш персонаж состоял в рядах овервотч?(Блэквотч в счёт)"),nl,
				write("0. Нет"),nl,
				write("1. Да"),nl,
				read(X6).

question7(X7):-	write("Ваш персонаж состоит в рядах Когтя?"),nl,
				write("0. Нет"),nl,
				write("1. Да"),nl,
				read(X7).
%Предикаты выводящие вопросы и считывающие ответы выше
a:- pred,%Подготовка и удаление лишних данных из памяти

    pr_pol_s, pr_hum_s, pr_suit_s, pr_dd_s, pr_tank_s, pr_over_s, pr_kog_s,%Чтение файлов

    question1(X1),question2(X2),question3(X3),question4(X4),question5(X5),question6(X6),question7(X7),%Вывод вопросов
	prov(X1,X2,X3,X4,X5,X6,X7).%Проверка

prov(X1,X2,X3,X4,X5,X6,X7):-otvet(X1,X2,X3,X4,X5,X6,X7),!.%Если найдено, то выводим ответ
prov(X1,X2,X3,X4,X5,X6,X7):-add(X1,X2,X3,X4,X5,X6,X7).%Если не найдено, то добавляем

otvet(X1,X2,X3,X4,X5,X6,X7):-pol(X,X1),hum(X,X2),suit(X,X3),dd(X,X4),tank(X,X5),over(X,X6),kog(X,X7),
write("Ваш персонаж:\n"),write(X),!.%Проверка и вывод ответа

add(X1,X2,X3,X4,X5,X6,X7):-%Добавление варианта ответа
    write("Я не знаю такого персонажа."), nl,
    write("Как его зовут?"), nl,get0(E),
    read_line_to_codes(user_input,Name),
    name(Q,Name), write(Name),nl,asserta(pol(Q,X1)),asserta(hum(Q,X2)),asserta(suit(Q,X3)),
    asserta(dd(Q,X4)),asserta(tank(Q,X5)),asserta(over(Q,X6)),asserta(kog(Q,X7)), rel,!.


rel:-pr_pol_t, pr_hum_t, pr_suit_t, pr_dd_t, pr_tank_t, pr_over_t, pr_kog_t, pred,
        pr_pol_s, pr_hum_s, pr_suit_s, pr_dd_s, pr_tank_s, pr_over_s, pr_kog_s.%Чтение и запись

pred:-retractall(pol(X,Y)),retractall(hum(X,Y)),retractall(suit(X,Y)),retractall(dd(X,Y)),
retractall(tank(X,Y)), retractall(over(X,Y)),retractall(kog(X,Y)).%Подготовка и удаление лишних данных из памяти

