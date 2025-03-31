/***
 * @author GroggyOtter
 * @created 04/21/2024
 * @contributors Laser_Made, Axelfublr, Descolada
 * @contributions LaserMade on 08/02/2024 static methods (__Item & __Enum) along with at(), matchAll(), replaceAll(), valueOf() and respective descriptions
 * @updated 08/02/2024
 */
class __javascript_strings {
    static __New() {
		__ObjDefineProp := Object.Prototype.DefineProp
		for ____javascript_strings_Prop in __javascript_strings.OwnProps()
			if SubStr(____javascript_strings_Prop, 1, 2) != "__"
				__ObjDefineProp(String.Prototype, ____javascript_strings_Prop, __javascript_strings.GetOwnPropDesc(____javascript_strings_Prop))
		__ObjDefineProp(String.Prototype, "__Item", {get:(args*)=>__javascript_strings.__Item[args*]})
		__ObjDefineProp(String.Prototype, "__Enum", {call:__javascript_strings.__Enum})   
    }
    ;Added by Laser_Made 08/02/2024 (with credit to Axelfublr 10/2/2022)
    static __Item[args*] {
		get {
			if args.length = 2
				return SubStr(args[1], args[2], 1)
			else {
				len := StrLen(args[1])
				if args[2] < 0
					args[2] := len+args[2]+1
				if args[3] < 0
					args[3] := len+args[3]+1
				if args[3] >= args[2]
					return SubStr(args[1], args[2], args[3]-args[2]+1)
				else
					return SubStr(args[1], args[3], args[2]-args[3]+1).Reverse()
			}
		}
	}
    ;Added by Laser_Made 08/02/2024 (with credit to Descolada 3/1/2023)
	static __Enum(varCount) {
		pos := 0, len := StrLen(this)
		EnumElements(&char) {
			char := StrGet(StrPtr(this) + 2*pos, 1)
			return ++pos <= len
		}		
		EnumIndexAndElements(&index, &char) {
			char := StrGet(StrPtr(this) + 2*pos, 1), index := ++pos
			return pos <= len
		}
		return varCount = 1 ? EnumElements : EnumIndexAndElements
	}   

    ; === Properties ===
    static length => StrLen(this)

    ; === Methods ===
    
    /**
     * @returns {String} the character at a specified index (position). Can search negative indices
     * @see {@link https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/at|String.at() on MDN}
     */
    static at(index) => SubStr(this, index, 1)
    
    ; charAt() - Returns the character at a specified index (position)
    static charAt(index) => index <= 0 ? 0 : SubStr(this, index, 1)

    ; charCodeAt() - Returns the Unicode of the character at a specified index
    static charCodeAt(index) => Ord(SubStr(this, index, 1))
    
    ; includes() - Returns true if a string contains a specified value
    static includes(value, start_pos:=1) => InStr(this, value,, start_pos) ? 1 : 0
    
    ; indexOf() - Returns the index (position) of the first occurrence of a value in a string
    static indexOf(value, start_pos:=1) => InStr(this, value,, start_pos)
    
    ; lastIndexOf() - Returns the index (position) of the last occurrence of a value in a string
    static lastIndexOf(value, end_pos:=unset) => InStr(SubStr(this, 1, IsSet(end_pos) ? end_pos : unset), value,,, -1)
    
    ; replace() - Searches a string for a pattern, and returns a string where the first match is replaced
    static replace(needle, replacement:='', mode := 0) {
        if !mode {
            return StrReplace(this, needle, replacement, 1,, 1)
        } else {
            return RegExReplace(this, regex := needle, replacement)
        }
    }

    /**
     * @description replaces all occurrences of a string, not just the first one. Does not mutate the original string.
     * @returns {String} Searches a string for a pattern, and returns a string with every match having been replaced
     * @see {@link https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replaceAll|String.replaceAll() on MDN}
     */
    static replaceAll(args*) => RegExReplace(this, args*)

    ; search() - Searches a string for a value, or regular expression, and returns the index (position) of the match
    static search(regex) => RegExMatch(this, regex)
    
    ; slice() - Extracts a part of a string and returns a new string
    static slice(start:=1, end:=unset) => SubStr(this, start, IsSet(end) ? end-start+1 : unset)
    
    ; split() - Splits a string into an array of substrings
    static split(delimiter:='', limit:=-1) => (limit = 0) ? [] : StrSplit(this, delimiter,'', limit)

    ; substring() - Extracts characters from a string, between two specified indices (positions)
    static substring(start, end:=unset) => SubStr(this, start, IsSet(end) ? end-start+1 : unset)
        
    ; toLowerCase() - Returns a string converted to lowercase letters
    static toLowerCase() => StrLower(this)
    
    ; toUpperCase() - Returns a string converted to uppercase letters
    static toUpperCase() => StrUpper(this)
    
    ; trim() - Returns a string with removed whitespaces
    static trim(chars:=' \t`n`r') => Trim(this, chars)
    
    ; trimEnd() - Returns a string with removed whitespaces from the end
    static trimEnd(chars:=' \t`n`r') => RTrim(this, chars)
    
    ; trimStart() - Returns a string with removed whitespaces from the start
    static trimStart(chars:=' \t`n`r') => LTrim(this, chars)

 
    ;=======================
    ; concat() - Returns two or more joined strings
    static concat(strings*) {
        for str in strings
            this .= str
        return this
    }

    ; endsWith() - Returns if a string ends with a specified value
    static endsWith(search_str, end_pos:=unset) {
        str_len := StrLen(this)
        if !IsSet(end_pos)
            end_pos := str_len
        srch_len := StrLen(search_str)
        if (SubStr(this, end_pos-srch_len+1, srch_len) = search_str)
            return 1
        return 0
    }
    
    ; match() - Searches a string for a value, or regular expression, and returns the match
    static match(regex) {
        RegExMatch(this, regex, &m)
        return m
    }

    /**
     * @description Searches a string for a value, or regular expression, and returns the matches
     * @returns {Object} The matched strings where every match is found
     * @see {@link https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/matchAll|String.matchAll() on MDN}
     */
    static matchAll(RegEx, start := 1) {
        results := Array()
		While (start := RegExMatch(this, RegEx, &match, start)) {
			results.push(match)
            start += match[0] ? StrLen(match[0]) : 1
        }
        return results
    }
    
    ; padEnd() - Pads the end of the string to a given length with with a given string. Repeats if needed.
    static padEnd(length, pad:=' ') {
        while (StrLen(this) != length)
            loop parse pad
                this .= A_LoopField
            until (StrLen(this) = length)
        return this
    }
    
    ; padStart() - Pads the end of the string to a given length with with a given string. Repeats if needed.
    static padStart(length, pad:=' ') {
        while (StrLen(this) != length)
            loop parse pad
                this := A_LoopField this
            until (StrLen(this) = length)
        return this
    }
    
    ; repeat() - Returns a new string with a number of copies of a string
    static repeat(count) {
        str := ''
        loop count
            str .= this
        return str
    }
    
    ; startsWith() - Checks whether a string begins with specified characters
    static startsWith(search_str, start_pos:=1) {
        if (search_str = SubStr(this, start_pos, StrLen(search_str)))
            return 1
        return 0
    }

    ; valueOf() - Returns this string value.
    static valueOf() => this

}
