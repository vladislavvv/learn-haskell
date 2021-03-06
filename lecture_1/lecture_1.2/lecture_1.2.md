
# Функции

## Модель вычислений

В императивных языках программа выполняется последовательно, оператор за оператором. Промежуточные вычисления хранятся в ячейках памяти. С ними ассоциируются переменные.

В функциональных языках программа - выражение. Выполнение программы - редукция этого выражения до состояния, когда последующие редукции невозможны. Результат редукции - результат программы.

Пример редукции:
```haskell
(5 + 4 * 3) ^ 2
  ~> (5 + 12) ^ 2
  ~> 17 ^ 2
  ~> 289
```

Здесь через `~>` указан шаг редукции. Сначала вычисляется умножение, потом сложение, потом возведение в степень. В итоге получается число `289`, которое уже нельзя редуцировать.

## Применение функций и скобки. Частичное применений функций.

Вызов функции записывается так:
```haskell
f x
```
где `f` - функция, а `x` - её аргумент. Скобки используются для изменения порядка вызова функций. Например:
```haskell
acos (cos pi)
```
т.е. сначала вычисляется `cos`, а потом результат передается в функцию `acos`.

Когда несколько аргументов:
```haskell
f x y
max 5 42
```
Так неправильно: ~~`max (5 42)`~~

Эквивалентный формат записи:
```haskell
(max 5) 42
```
т.е. операция применения функции ассоциативна влево.

Такой подход позволяет частично применять функции. Т.е. можно сначала применить к функции только 1 аргумент и получить функцию, которая будет принимать оставшиеся аргументы и возвращать значение с их учетом.

Аналогия из `javascript` - возврат функции из функции:
```javascript
let max = x => y => x > y ? x : y
```

Можно частичное применение функций сформулировать так:
**Если у нас есть функция N переменных, то на самом деле у нас есть функция одной переменной, возвращающая функцию N-1 переменной.**

## Тест 1

В стандартной библиотеке Haskell есть функция вычисления логарифма по произвольному основанию logBase. Это функция двух переменных, которой требуется передать основание логарифма и аргумент, на котором логарифм будет вычислен. Какие из следующих вызовов обеспечат вычисление логарифма по основанию 2 от 8?

- [ ] logBase (2, 8)
- [x] (logBase 2) 8
- [x] logBase 2 8
- [ ] (logBase, 2, 8)
- [ ] logBase (2 8)

## Определение функций

```
sumSquares x y = x ^ 2 + y ^ 2
```

Справа от знака равенства можно использовать библиотечные функции, объявленные ранее функции, операторы.
Регистр важен. Имена функций и имена формальных параметров должны начинаться с нижнего регистра. Верхний регистр для объявления типов данных. Допустимые символы - буквы, цифры, нижнее подчеркивание, кавычка '.

Для объявления функций в интерпретаторе надо перед объявлением функции написать `let`:
```haskell
let sumSquares x y = x ^ 2 + y ^ 2
```

## Задача 1

Реализуйте функцию трех аргументов lenVec3, которая вычисляет длину трехмерного вектора. Аргументы функции задают декартовы координаты конца вектора, его начало подразумевается находящимся в начале координат. Для извлечения квадратного корня воспользуйтесь функцией sqrt, определенной в стандартной библиотеке.

```haskell
GHCi> lenVec3 2 3 6
7.0
```

**Ответ:**
```haskell
lenVec3 x y z = sqrt (x^2 + y^2 + z^2)
```

Код задачи можно загрузить [из файла](./task_1.2.1.hs).

## Чистота функций

Чистая функция - это та, значение которой полностью определяется значениями её аргументов.

Как следствие - функция, которая ни принимает ни одной переменной - константа:
```haskell
fortyTwo = 42
```

## Условное выражение

Является аналогией условному оператору из других языков, за некоторыми исключениями.
```haskell
f x = if x > 0 then 1 else -1
```

При передаче функциям отрицательных чисел следует их брать в скобки. Т.к. иначе это может быть интерпретировано как вычитание:
```haskell
f (-5)
```

Особенности условных выражений:
1) Обе ветви, `then` и `else`, должны присутствовать.
1) В ветвях `then` и `else` должны стоять выражения одного типа.
1) Условное выражение - полноценное выражение. Можно использовать его внутри других выражений. Например:
```haskell
g x = (if x > 0 then 1 else -1) + 42
```

## Задача 2

Напишите реализацию функции sign, которая возвращает 1, если ей передано положительное число, (-1), если отрицательное, и 0 в случае, когда передан 0.

```haskell
GHCi> sign (-100)
-1
```

**Ответ:**
```haskell
sign x = if x == 0 then 0 else if x > 0 then 1 else -1
```

Код задачи можно загрузить [из файла](./task_1.2.2.hs).

## Определение функции через частичное применение

Такую функцию как:
```haskell
max5 x = max 5 x
```
можно определить так:
```haskell
max5' = max 5
```
Это обозначает, что функция `max5'` - это частично определенная функция max 5.

Пример:
Функция расчета скидки по сумме, проценту, и пределу, с которого скидка начинается.
```haskell
discount limit proc sum = if sum >= limit then sum * (100 - proc) / 100 else sum
```

Порядок аргументов пытаются задать так, чтобы частично применять функцию было удобно. `limit` и `proc` будут меняться редко, а `sum` - часто.
Тогда можно определить частичную функцию:
```haskell
standartDiscount = discount 1000 5
standartDiscount 2000
```

## Тест 2

Предположим, мы разрабатываем на Haskell интерфейс системы перевода для естественных языков. Он должен содержать функцию `translate` с параметрами `text`, `languageFrom` и `languageTo`. Расположите параметры в таком порядке, чтобы было удобно реализовывать следующие функции: `translateFromSpanishToRussian`, `translateFromEnglishToRussian` и `translateToRussian`.

Выберите один вариант из списка
- [ ] translate languageFrom languageTo text
- [ ] translate languageTo text languageFrom
- [ ] translate text languageTo languageFrom
- [ ] translate languageFrom text languageTo
- [ ] translate text languageFrom languageTo
- [x] translate languageTo languageFrom text

Чтобы это проверить, можно [написать программу](./test_1.2.2.hs).
