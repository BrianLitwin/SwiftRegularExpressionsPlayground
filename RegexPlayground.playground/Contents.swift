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

public func testRegex(_ pattern: String, printMatches: Bool = true) {
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

lines = [
    "githawk/githawkapp#2398"
]

testRegex("(^|\\s|[^a-zA-Z])((\\w+)/(\\w+))?#([0-9]+)(?![a-zA-Z0-9])")

