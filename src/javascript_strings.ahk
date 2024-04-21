class __javascript_strings {
    static __New() {
        String.Prototype.DefineProp := Object.Prototype.DefineProp
        
        ; === Properties ===
        String.Prototype.DefineProp('length', {get: (this) => StrLen(this)})
        
        ; === Methods ===
        ; charAt() - Returns the character at a specified index (position)
        String.Prototype.DefineProp('charAt', {call: (this, index) => SubStr(this, index, 1)})
        
        ; charCodeAt() - Returns the Unicode of the character at a specified index
        String.Prototype.DefineProp('charCodeAt', {call: (this, index) => Ord(SubStr(this, index, 1))})
        
        ; concat() - Returns two or more joined strings
        String.Prototype.DefineProp('concat', {call:concat})
        
        ; endsWith() - Returns if a string ends with a specified value
        String.Prototype.DefineProp('endsWith', {call: endsWith})
        
        ; includes() - Returns true if a string contains a specified value
        String.Prototype.DefineProp('includes', {call: (this, value, start_pos:=1) => InStr(this, value,, start_pos) ? 1 : 0})
        
        ; indexOf() - Returns the index (position) of the first occurrence of a value in a string
        String.Prototype.DefineProp('indexOf', {call: (this, value, start_pos:=1) => InStr(this, value,, start_pos)})
        
        ; lastIndexOf() - Returns the index (position) of the last occurrence of a value in a string
        String.Prototype.DefineProp('lastIndexOf', {call: (this, value, end_pos:=unset) => InStr(SubStr(this, 1, IsSet(end_pos) ? end_pos : unset), value,,, -1)})
        
        ; match() - Searches a string for a value, or a regular expression, and returns the matches
        String.Prototype.DefineProp('match', {call: match})
        
        ; padEnd() - Pads the end of the string to a given length with with a given string. Repeats if needed.
        String.Prototype.DefineProp('padEnd', {call: padEnd})
        
        ; padStart() - Pads the end of the string to a given length with with a given string. Repeats if needed.
        String.Prototype.DefineProp('padStart', {call: padStart})
        
        ; repeat() - Returns a new string with a number of copies of a string
        String.Prototype.DefineProp('repeat', {call: repeat})
        
        ; replace() - Searches a string for a pattern, and returns a string where the first match is replaced
        String.Prototype.DefineProp('replace', {call: (this, regex, replacement:='') => RegExReplace(this, regex, replacement)})
        
        ; search() - Searches a string for a value, or regular expression, and returns the index (position) of the match
        String.Prototype.DefineProp('search', {call: (this, regex) => RegExMatch(this, regex)})
        
        ; slice() - Extracts a part of a string and returns a new string
        String.Prototype.DefineProp('slice', {call: (this, start:=1, end:=unset) => SubStr(this, start, IsSet(end) ? end-start+1 : unset)})
        
        ; split() - Splits a string into an array of substrings
        String.Prototype.DefineProp('split', {call: (this, delimiter:='', limit:=-1) => (limit = 0) ? [] : StrSplit(this, delimiter,'', limit)})
        
        ; startsWith() - Checks whether a string begins with specified characters
        String.Prototype.DefineProp('startsWith', {call: startsWith})
        
        ; substring() - Extracts characters from a string, between two specified indices (positions)
        String.Prototype.DefineProp('substring', {call: (this, start, end:=unset) => SubStr(this, start, IsSet(end) ? end-start+1 : unset)})
        
        ; toLowerCase() - Returns a string converted to lowercase letters
        String.Prototype.DefineProp('toLowerCase', {call: (this) => StrLower(this)})
        
        ; toUpperCase() - Returns a string converted to uppercase letters
        String.Prototype.DefineProp('toUpperCase', {call: (this) => StrUpper(this)})
        
        ; trim() - Returns a string with removed whitespaces
        String.Prototype.DefineProp('trim', {call:(this, chars:=' \t`n`r') => Trim(this, chars)})
        
        ; trimEnd() - Returns a string with removed whitespaces from the end
        String.Prototype.DefineProp('trimEnd', {call:(this, chars:=' \t`n`r') => RTrim(this, chars)})
        
        ; trimStart() - Returns a string with removed whitespaces from the start
        String.Prototype.DefineProp('trimStart', {call:(this, chars:=' \t`n`r') => LTrim(this, chars)})
        return
        
        ;=======================
        concat(this, strings*) {
            for str in strings
                this .= str
            return this
        }
        
        endsWith(this, search_str, end_pos:=unset) {
            str_len := StrLen(this)
            if !IsSet(end_pos)
                end_pos := str_len
            srch_len := StrLen(search_str)
            if (SubStr(this, end_pos-srch_len+1, srch_len) = search_str)
                return 1
            return 0
        }
        
        match(this, regex) {
            RegExMatch(this, regex, &m)
            return m
        }
        
        padEnd(this, length, pad:=' ') {
            while (StrLen(this) != length)
                loop parse pad
                    this .= A_LoopField
                until (StrLen(this) = length)
            return this
        }
        
        padStart(this, length, pad:=' ') {
            while (StrLen(this) != length)
                loop parse pad
                    this := A_LoopField this
                until (StrLen(this) = length)
            return this
        }
        
        repeat(this, count) {
            str := ''
            loop count
                str .= this
            return str
        }
        
        startsWith(this, search_str, start_pos:=1) {
            if (search_str = SubStr(this, start_pos, StrLen(search_str)))
                return 1
            return 0
        }
    }
}
