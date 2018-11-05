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

// Toggle this printMaches variable to suit your preferences!
// It will print out capture group matches if set to True

public func test(regex pattern: String, printMatches: Bool = false) {
    let regex = try! NSRegularExpression(pattern: pattern, options: [])

    print("Testing: \"\(pattern)\"")
    
    for line in lines {
        let matches = regex.matches(in: line, options: [], range: line.nsrange)
        if !matches.isEmpty {
            print("Found match: \"\(line)\"")
            
            if printMatches {
                for match in matches {
                    let numberRanges = match.numberOfRanges
                    for i in 0..<numberRanges {
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
