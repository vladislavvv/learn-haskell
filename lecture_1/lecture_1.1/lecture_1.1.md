
# Установка и настройка среды

Рады приветствовать вас на курсе "Функциональное программирование на языке Haskell"! 

В курсе нет дедлайнов, поэтому вы будете получать баллы за задачи в любое время. 

Критерии сдачи курса: для обычного сертификата достаточно набрать 140 баллов, для сертификата с отличием – 200 баллов. Как только вы получите необходимое количество баллов, ссылка на сертификат придёт автоматически. 

Удачи!

## Установка

1) Качаем компилятор либо здесь https://downloads.haskell.org/~platform/2014.2.0.0/, либо просто ставим пакет **haskell-platform** из менеджера пакетов.
1) Расширение с подсветкой синтаксиса для вс кода https://marketplace.visualstudio.com/items?itemName=justusadam.language-haskell

## Интерпретатор

Запуск: ghci
```haskell
Prelude>1+2*5
11
Prelude>"abcd"++"efgh"
"abcdefgh"
Prelude>pi
3.141592653589793
```

Есть команды интерпретатора. Начинаются все с **:**, Можно задавать лишь первую букву команды.

Команда :set устанавливает настройки (? не факт что только их) интерпретатора. Например:
```haskell
Prelude> :set prompt "GHCi> "
GHCi> 
```
Поменяет приглашение к вводу команд. Так лучше не делать :)

## Код в файлах

Сначала пишем код [в файле `Hello.hs`](./hello.hs):
```haskell
main = putStrLn "Hello, Vlad!"
```
Затем с помощью команды `ghci Hello.hs` запускаем интерпретатор с подгруженным модулем.
Теперь если в интерпретаторе вызвать функцию main, то получим результат:
```
*Main> main
Hello, Vlad!
```

## Код в модулях

[В файл `Test.hs`](./Test.hs) записываем код:
```haskell
module Test where

sayHello = putStrLn "Hello from module Test."
```

Затем в том же каталоге запускаем `ghci`. Чтобы на лету загрузить модуль, можно просто вбить:
```haskell
Prelude> :load Test
[1 of 1] Compiling Test             ( Test.hs, interpreted )
Ok, one module loaded.
*Test> 
```

Теперь можно вызвать функцию из модуля:
```haskell
*Test> sayHello
Hello from module Test.
```

Если мы поменяли код модуля, его можно перезагрузить командой
```haskell
*Test> :reload Test
[1 of 1] Compiling Test             ( Test.hs, interpreted )
Ok, one module loaded.
```