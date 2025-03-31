# AHK-JavaScript-Strings

This is a script that adds [JavaScript-style string functionality](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String) to AHK v2 strings.  

After saving the `javascript_strings.ahk` file, [`#Include`](https://www.autohotkey.com/docs/v2/lib/_Include.htm) it at the top of your script.  
It's important to ensure the `#Include` happens before using any of the functions/property as this will throw an error.  

### List of Changes in this fork:
## Additional methods:
- String.at()
- String.replaceAll()
- String.matchAll()
- String.valueOf()

## Other changes:
- Added __Item 
- Added __Enum 

### These allow direct access for values, so you can do things like:

```
Msgbox('hello'[2])       ; -> prints 'e'
For (char in 'hello') {
  Msgbox(char)
}                        ; prints each character of 'hello' in a new msgbox
```
### You can use those with variables too of course.

```
myString := 'hello'
Msgbox(myString[5])    ; -> prints 'o'
```

### List of Properties:

* [`length`](#length) - Returns the length of the string.

### List of Methods:

* [`at(index)`](#at) - Returns the character at a specified index or position. *Can search negative indices.*
* [`charAt(index)`](#charAt) - Returns the character at a specified index/position.  
* [`charCodeAt(index)`](#charCodeAt) - Returns the Unicode of the character at a specified index/position.  
* [`concat(String1 [,String2, StringN])`](#concat) - Returns two or more joined strings.
* [`endsWith(value [, end_pos])`](#endsWith) - Returns true if a string ends with the provided value.  
* [`includes(value [, start_pos])`](#includes) - Returns true if a string contains the provided value.  
* [`indexOf(value [, start_pos])`](#indexOf) - Returns the index/position of the first occurrence of a value in a string.  
* [`lastIndexOf(value [, end_pos])`](#lastIndexOf) - Returns the index/position of the last occurrence of a value in a string.  
* [`match(regex)`](#match) - Searches a string for a value or regular expression, and returns a [RegExMatchInfo object](https://www.autohotkey.com/docs/v2/lib/RegExMatch.htm#MatchObject).
* [`padEnd(length [, pad_str])`](#padEnd) - Pads the end of the string to a given length using a given string.  
* [`padStart(length [, pad_str])`](#padStart) - Pads the beginning of the string to a given length with a given string.  
* [`repeat(number_of_times)`](#repeat) - Repeats the string as many times as requested.
* [`replace(regex_pattern [, replacement])`](#replace) - Searches a string for a value or regular expression and replace it.  
* [`replaceAll(regex_pattern [, replacement])`](#replaceAll) - Searches a string for all occurances of a value or regex and replaces them.  
* [`search(regex_pattern)`](#search) - Searches a string for a value or regular expression and returns the index/position of the match.  
* [`slice([start_pos, end_pos])`](#slice) - Extracts a part of a string and returns it.  
* [`split(delimiter, max_limit)`](#split) - Splits a string into an array of substrings.  
* [`startsWith(value [, start_pos])`](#startsWith) - Checks whether a string begins with the specified characters.  
* [`substring([start_pos, end_pos])`](#substring) - Extracts characters from a string, between two specified indices/positions.  
* [`toLowerCase()`](#toLowerCase) - Returns a string converted to lowercase letters.
* [`toUpperCase()`](#toUpperCase) - Returns a string converted to uppercase letters.  
* [`trim()`](#trim) - Returns string after removing all surrounding whitespace.  
* [`trimEnd()`](#trimEnd) - Returns string after removing all whitespace from the end of the string.  
* [`trimStart()`](#trimStart) - Returns string after removing all whitespace from the beginning of the string.  

### Properties:

##### length
* `length` - Returns the length of the string.

      str := 'AutoHotkey'
      MsgBox(str.length ' characters')  ; 10 characters

### Methods:

##### at()
* `at(index)` - Returns the character at a specified index/position. Can search negative indices.  
`index` is the string position of the desired character.  

      str := 'AutoHotkey'
      MsgBox(str.charAt(-6))  ; H

##### charAt()
* `charAt(index)` - Returns the character at a specified index/position.  
`index` is the string position of the desired character.  

      str := 'AutoHotkey'
      MsgBox(str.charAt(5))  ; H

##### charCodeAt()
* `charCodeAt(index)` - Returns the Unicode of the character at a specified index/position.  
`index` is the string position of the desired character.  

      str := 'AutoHotkey'
      MsgBox(str.charCodeAt(5))  ; 72 (the numeric code for H)

##### concat()
* `concat(string1 [, string2, ..., stringN])` - Returns two or more joined strings.

      str := 'Auto'
      MsgBox(str.concat('Hotkey', ' ', 'v2'))  ; AutoHotkey v2

##### endsWith()
* `endsWith(value [, end_pos:=unset])` - Returns true if a string ends with the provided value.  
`value` is the string to search for.  
`end_pos` allows you to set the "end of string" position. The function will ignore everything past that index.  
If end_pos is omitted, the last character of the string is the end position.


      str := 'AutoHotkey is pretty great.'
      MsgBox(str.endsWith('great.'))  ; 1
      MsgBox(str.endsWith('is pretty'))  ; 0
      MsgBox(str.endsWith('is pretty', 20))  ; 1

##### includes()
* `includes(value [, start_pos:=1])` - Returns true if a string contains the provided value.  
`value` is the string to search for.  
`end_pos` allows you to set the "end of string" position. The function will ignore everything past that index.  
If end_pos is omitted, the last character of the string is the end position.
This gives strings a built-in [InStr()](https://www.autohotkey.com/docs/v2/lib/InStr.htm).  

      str := 'AHK JavaScript Strings'
      MsgBox(str.includes('AHK'))  ; 1
      MsgBox(str.includes('AHK', 5))  ; 0

##### indexOf()
* `indexOf(value [, start_pos:=1])` - Returns the index/position of the first occurrence of a value in a string.  
`value` is the string to search for.  
`start_pos` allows you to set the "start of string" position. The function will ignore everything before that index.  
If start_pos is omitted, the first character of the string is the starting position.  
This gives strings a built-in [InStr()](https://www.autohotkey.com/docs/v2/lib/InStr.htm).

      str := 'AutoHotkey is hot!'
      MsgBox(str.indexOf('Hot'))  ; 5
      MsgBox(str.indexOf('Hot', 10))  ; 15

##### lastIndexOf()
* `lastIndexOf(value [, end_pos:=unset])` - Returns the index/position of the last occurrence of a value in a string.  
`value` is the string to search for.  
`end_pos` allows you to set the "end of string" position. The function will ignore everything past that index.  
If end_pos is omitted, the last character of the string is the ending position.  

      str := 'AutoHotkey is hot!'
      MsgBox(str.lastIndexOf('Hot'))  ; 15
      MsgBox(str.lastIndexOf('Hot', 10))  ; 5

##### match()
* `match(regex_pattern)` - Searches a string for a value or regular expression, and returns the match.
`regex_pattern` is a valid RegEx pattern.  
This gives strings a built-in [RegExMatch()](https://www.autohotkey.com/docs/v2/lib/RegExMatch.htm).

      str := 'Auto Hot Key'
      MsgBox(str.match('\w+ (\w+) \w+')[1])  ; Hot

##### matchAll()
* `match(regex_pattern)` - Searches a string for a value or regular expression, and returns a [RegExMatchInfo object](https://www.autohotkey.com/docs/v2/lib/RegExMatch.htm#MatchObject).
`regex_pattern` is a valid RegEx pattern.  
This gives strings a built-in [RegExMatch()](https://www.autohotkey.com/docs/v2/lib/RegExMatch.htm).

      str := 'Auto Hot key is the best Hot Key program'
      y := str.match('\w+ (\w+) \w+')[1]  ;returns ['Auto Hot Key', 'Hot']
      for eachStr in y {
            MsgBox(eachStr)               ;Prints 'Auto Hot Key' and then prints 'Hot'
      }
      ; 


##### padEnd()
* `padEnd(length [, pad_str:=' '])` - Pads the end of the string to a given length using a given string.  
The pattern repeats if needed to fill the specified length.  
`length` is the number of desired characters in the final string. If this number is less than the string's length, no padding is done.
`pad_str` is the character set to use to pad the string.
If pad_str is omitted, space is used.  

      str := 'Hello'
      MsgBox(str.padEnd(10)) ; "Hello     "
      MsgBox(str.padEnd(10, '123'))  ; "Hello12312"

##### padStart()
* `padStart(pad_length [, pad_str:=' '])` - Pads the beginning of the string to a given length with a given string.  
This pattern repeats if needed to fill the specified length.
`length` is the number of desired characters in the final string. If this number is less than the string's length, no padding is done.
`pad_str` is the character set to use to pad the string.
If omitted, space is used.  

      str := 'Hello'
      MsgBox(str.padStart(10))  ; "     Hello"
      MsgBox(str.padStart(10, '123'))  ; "12312Hello"

##### repeat()
* `repeat(number_of_times)` - Repeats the string as many times as requested.
`number_of_times` defines the number of times the string should be repeated.  

      str1 := 'Happy '
      str2 := 'Joy '
      MsgBox(str1.repeat(2) str2.repeat(2) '!') ; Happy Happy Joy Joy!

##### replace()
* `replace(regex_pattern [, replacement:='', mode := 0])` - Searches a string for a value or regular expression and replace it.
To remove more than one occurance either use replaceAll() or set mode equal to 1 (or any positive integer), both accept regex.

This gives strings a built-in [RegExReplace()](https://www.autohotkey.com/docs/v2/lib/RegExReplace.htm).
`regex_pattern` is a valid RegEx pattern.  
`replacement` defines the text to replace the matched text with. Because this is a RegEx process, it can included backreferences such as `$1`.  
If replacement is omitted, the matched text is removed.  
Match is case sensitive by default. 

      str := 'ManualHotkey'
      MsgBox(str.replace('Manual', 'Auto'))  ; AutoHotkey

##### replaceAll()
* `replaceAll(regex_pattern [, replacement:='', &OutputVarCount, Limit := -1, StartingPos := 1])` - Searches a string for a value or regular expression and replace all occurances of it up to Limit, where -1 replaces all.  
This gives strings a built-in [RegExReplace()](https://www.autohotkey.com/docs/v2/lib/RegExReplace.htm).
`regex_pattern` can be a valid RegEx pattern.  
`replacement` defines the text to replace every occurance of the matched text with. Because this is a RegEx process, it can included backreferences such as `$1`.  
If replacement is omitted, each occurance of matched text is removed.  

      str := 'The best version of AutoHotkey is definitely AutoHotkey v2.'
      MsgBox(str.replaceAll('AutoHotkey', 'AHK'))  ; 'The best version of AHK is definitely AHK v2.'

##### search()
* `search(regex_pattern)` - Searches a string for a value or regular expression and returns the index/position of the match.  
Unlike `match()`, this returns the position of the match instead of a RegExMatchInfo object.  
`regex_pattern` is a valid RegEx pattern.  

      str := 'AutoHotkey'
      MsgBox(str.Search('Hot.*?$'))  ; 5

##### slice()
* `slice([start_pos:=1, end_pos:=unset])` - Extracts a part of a string and returns it.  
`start_pos` allows you to set the "start of string" position. The function will ignore everything before that index.  
If start_pos is omitted, the first character of the string is the starting position.  
`end_pos` allows you to set the "end of string" position. The function will ignore everything past that index.  
If end_pos is omitted, the last character of the string is the end position.

      str := 'AutoHotkey'
      MsgBox(str.slice(5, 7))  ; Hot

##### split()
* `split([delimiter:='', max_limit:=-1])` - Splits a string into an array of substrings.  
This gives strings a built-in [StrSplit()](https://www.autohotkey.com/docs/v2/lib/StrSplit.htm).  
`delimiter` is the character that the string should be split up by. Common delimeters include space, comma, and linefeed but can be any string of 1 or more characters.  
If delimiter is omitted or an empty string, the string is split up into individual characters.  
`max_limit` defines the maximum amount of items returned in the array. Any occurrences past the max are discarded.  
If 0 is used, an empty array is returned.  
If max_limit is omitted, -1 is used to indicate no limit.  

      str := 'Auto Hot Key'
      for word in str.Split(' ')  ; Creates array ['Auto', 'Hot', 'Key']
          MsgBox(word)

      str := 'AHK'
      MsgBox(str.Split()[2])  ; Creates array ['A', 'H', 'K']

##### startsWith()
* `startsWith(value [, start_pos:=1])` - Checks whether a string begins with the specified characters.  
`value` is the string to search for.  
`start_pos` allows you to set the "start of string" position. The function will ignore everything before that index.  
If start_pos is omitted, the first character of the string is the starting position.  

      str := 'AutoHotkey'
      MsgBox(str.startsWith('Auto'))  ; 1
      MsgBox(str.startsWith('Hot'))  ; 0
      MsgBox(str.startsWith('Hot', 5))  ; 1

##### substring()
* `substring([start_pos:=1, end_pos:=unset])` - Extracts characters from a string, between two specified indices/positions.  
`start_pos` allows you to set the "start of string" position. The function will ignore everything before that index.  
If start_pos is omitted, the first character of the string is the starting position.  
`end_pos` allows you to set the "end of string" position. The function will ignore everything past that index.  
If end_pos is omitted, the last character of the string is the end position.  
This gives strings a built-in [SubStr()](https://www.autohotkey.com/docs/v2/lib/SubStr.htm).

      str := 'AutoHotkey'
      MsgBox(str.substring(5, 7))  ; Hot


##### toLowerCase()
* `toLowerCase()` - Returns a string converted to lowercase letters.

      str := 'HOTKEY'
      MsgBox('str.toLowerCase()')  ; hotkey

##### toUpperCase()
* `toUpperCase()` - Returns a string converted to uppercase letters.  

      str := 'hotkey'
      MsgBox('str.toUpperCase()')  ; HOTKEY

##### trim()
* `trim()` - Returns string after removing all surrounding whitespace.  
Whitespace includes spaces, tabs, linefeeds, and carriage returns.

      str := '    Line 1 '
          . '`nLine 2    '
      MsgBox(str.trim())  ; Line 1 Line 2

##### trimEnd()
* `trimEnd()` - Returns string after removing all whitespace from the end of the string.  
Whitespace includes spaces, tabs, linefeeds, and carriage returns.

      str := '    AHK    '
      MsgBox(str.trimEnd()) ; '    AHK'

##### trimStart()
* `trimStart()` - Returns string after removing all whitespace from the beginning of the string.  
Whitespace includes spaces, tabs, linefeeds, and carriage returns.  

      str := '    AHK    '
      MsgBox(str.trimStart()) ; 'AHK    '

##### valueOf()
* `valueOf()` - Returns the string 

      str := 'AHK'
      MsgBox(str.valueOf()) ; 'AHK'