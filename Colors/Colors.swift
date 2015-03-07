//
//  main.swift
//  PermaWifi
//
//  Created by Chad Scira on 3/3/15.
//  Copyright (c) 2015 Chad Scira. All rights reserved.
//

import Foundation

var colorCodes:[String:Int] = [
    "black": 30,
    "red": 31,
    "green": 32,
    "yellow": 33,
    "blue": 34,
    "magenta": 35,
    "cyan": 36,
    "white": 37
];

var bgColorCodes:[String:Int] = [
    "blackBackground": 40,
    "redBackground": 41,
    "greenBackground": 42,
    "yellowBackground": 43,
    "blueBackground": 44,
    "magentaBackground": 45,
    "cyanBackground": 46,
    "whiteBackground": 47
];

var styleCodes:[String:Int] = [
    "reset": 0,
    "bold": 1,
    "italic": 3,
    "underline": 4,
    "inverse": 7,
    "strikethrough": 9,
    "boldOff": 22,
    "italicOff": 23,
    "underlineOff": 24,
    "inverseOff": 27,
    "strikethroughOff": 29
];

func getCode(key:String) -> Int? {
    if (colorCodes[key] != nil) {
        return colorCodes[key];
    } else if (bgColorCodes[key] != nil) {
        return bgColorCodes[key];
    } else if (styleCodes[key] != nil) {
        return styleCodes[key];
    }
    
    return nil;
}

func addCodeToCodesArray (codes:Array<Int>, code:Int) -> Array<Int> {
    var result:Array<Int> = codes;
    
    if (contains(colorCodes.values, code)) {
        result = result.filter { !contains(colorCodes.values, $0) }
    } else if (contains(bgColorCodes.values, code)) {
        result = result.filter { !contains(bgColorCodes.values, $0) }
    } else if (code == 0) {
        return [];
    }
    
    if (!contains(result, code)) {
        result.append(code);
    }
    
    return result;
}

func matchesForRegexInText(regex: String!, text: String!, global: Bool = false) -> [String] {
    let regex = NSRegularExpression(pattern: regex,
        options: nil, error: nil)!
    
    let nsString = text as NSString
    
    let results = regex.matchesInString(nsString as String,
        options: nil, range: NSMakeRange(0, nsString.length))
        as! [NSTextCheckingResult]
    
    if (!global && results.count == 1) {
        var result:[String] = [];
        
        for (var i:Int = 0; i < results[0].numberOfRanges; i++) {
            result.append(nsString.substringWithRange(results[0].rangeAtIndex(i)));
        }
        
        return result;
    } else {
        return map(results) { nsString.substringWithRange($0.range)}
    }
}

struct ANSIGroup {
    var codes:[Int];
    var string:String;
    func toString() -> String {
        
        return "\u{001B}[" + ";".join(map(codes) {String($0)}) + "m" + string + "\u{001B}[0m";
    }
}

func parseExistingANSI(string:String) -> [ANSIGroup] {
    var results:[ANSIGroup] = [];
    
    var matches = matchesForRegexInText("\\u001B\\[([^m]*)m(.+?)\\u001B\\[0m", string, global: true);
    
    for (index, match) in enumerate(matches) {
        var parts = matchesForRegexInText("\\u001B\\[([^m]*)m(.+?)\\u001B\\[0m", match),
        codes = split(parts[1]) {$0 == ";"},
        string = parts[2];
        
        results.append(ANSIGroup(codes: map(codes.filter { $0.toInt() != nil }) {$0.toInt()!}, string: string));
    }
    
    return results;
}

func format(string:String, command:String) -> String {

    if (NSProcessInfo.processInfo().environment["DEBUG"] != nil && NSProcessInfo.processInfo().environment["DEBUG"] as! String == "true" && (NSProcessInfo.processInfo().environment["TEST"] == nil || NSProcessInfo.processInfo().environment["TEST"] as! String == "false")) {
        return string;
    }
    
    var code = getCode(command);
    var existingANSI = parseExistingANSI(string);
    
    if (code == nil) {
        return string;
    } else if (existingANSI.count > 0) {
        return "".join(map(existingANSI) {
            return ANSIGroup(codes: addCodeToCodesArray($0.codes, code!), string: $0.string).toString();
            })
    } else {
        var group = ANSIGroup(codes: [code!], string: string);
        return group.toString();
    }
}

public extension String {
    // foregrounds
    var black:String {
        get {
            return format(self, "black");
        }
    };
    var red:String {
        get {
            return format(self, "red");
        }
    };
    var green:String {
        get {
            return format(self, "green");
        }
    };
    var yellow:String {
        get {
            return format(self, "yellow");
        }
    };
    var blue:String {
        get {
            return format(self, "blue");
        }
    };
    var magenta:String {
        get {
            return format(self, "magenta");
        }
    };
    var cyan:String {
        get {
            return format(self, "cyan");
        }
    };
    var white:String {
        get {
            return format(self, "white");
        }
    };
    
    // backgrounds
    var blackBackground:String {
        get {
            return format(self, "blackBackground");
        }
    };
    var redBackground:String {
        get {
            return format(self, "redBackground");
        }
    };
    var greenBackground:String {
        get {
            return format(self, "greenBackground");
        }
    };
    var yellowBackground:String {
        get {
            return format(self, "yellowBackground");
        }
    };
    var blueBackground:String {
        get {
            return format(self, "blueBackground");
        }
    };
    var magentaBackground:String {
        get {
            return format(self, "magentaBackground");
        }
    };
    var cyanBackground:String {
        get {
            return format(self, "cyanBackground");
        }
    };
    var whiteBackground:String {
        get {
            return format(self, "whiteBackground");
        }
    };
    
    // formats
    var bold:String {
        get {
            return format(self, "bold");
        }
    };
    
    var italic:String {
        get {
            return format(self, "italic");
        }
    };
    
    var underline:String {
        get {
            return format(self, "underline");
        }
    };
    
    var reset:String {
        get {
            return format(self, "reset");
        }
    };
    
    var inverse:String {
        get {
            return format(self, "inverse");
        }
    };
    
    var strikethrough:String {
        get {
            return format(self, "strikethrough");
        }
    };
    
    var boldOff:String {
        get {
            return format(self, "boldOff");
        }
    };
    
    var italicOff:String {
        get {
            return format(self, "italicOff");
        }
    };
    
    var underlineOff:String {
        get {
            return format(self, "underlineOff");
        }
    };
    
    var inverseOff:String {
        get {
            return format(self, "inverseOff");
        }
    };
    
    var strikethroughOff:String {
        get {
            return format(self, "strikethroughOff");
        }
    };
}