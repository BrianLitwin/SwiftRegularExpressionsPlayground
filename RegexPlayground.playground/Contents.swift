import Foundation

public extension String {
    /// An updated implementation of: https://nshipster.com/nsregularexpression/
    
    /// An `NSRange` that represents the full range of the string.
    var nsrange: NSRange {
        return NSRange(location: 0, length: utf16.count)
    }
    
    /// Returns a substring with the given `NSRange`,
    /// or `nil` if the range can't be converted.
    func substring(with nsrange: NSRange) -> String? {
        guard let range = Range(nsrange, in: self) else { return nil }
        return String(self[range])
    }
}

var lines = [String]()

// Toggle printMaches variable to suit your preference ->
// Prints capture group matches if set to True

public func test(regex pattern: String, printMatches: Bool = false) {
    guard let regex = try? NSRegularExpression(pattern: pattern) else {
        fatalError("Could not convert \"\(pattern)\" to regular expression")
    }
    print("Testing: \"\(pattern)\"")
    
    lines.forEach { line in
        let matches = regex.matches(in: line, range: line.nsrange)
        if !matches.isEmpty {
            print("Found match: \"\(line)\"")
            
            if printMatches {
                matches.forEach { match in
                    for i in 0..<match.numberOfRanges {
                        if let m = line.substring(with: match.range(at: i)) {
                            print("match[\(i)]: " + m)
                        }
                    }
                }
            }
        }
    }
    
    print("\n")
}

// Add lines to test here 
lines = [
    ""
]

// Add regex here
test(regex: "")
