//
//  CommandLineTool.swift
//  MarsExplorerCore
//
//  Created by Marc M P on 06/04/2019.
//  Copyright © 2019 Marc M P. All rights reserved.
//

import Foundation

public final class CommandLineTool {
    private let arguments: [String]

    public init(arguments: [String] = CommandLine.arguments) {
        self.arguments = arguments
    }

    public func run() {

        if arguments.count > 1 {
            let dir = FileManager()
            if dir.fileExists(atPath: arguments[1]) == true {
                let fileContents = dir.contents(atPath: arguments[1])
                let data = String(data: fileContents!, encoding: .utf8)!
                let explorer = MarsExplorer(inputData: data)
                explorer.run()
            } else {
                print("File not found")
            }
        } else {
            let testData = """
                            5 5
                            1 2 N
                            L M L M L M L M M
                            3 3 E
                            M M R M M R M R R M

                            """
            print("""
                Usage: MarsExplorer input_file

                Using the following test data instead:
                \(testData)

                ... computing ...

                """
            )
            let explorer = MarsExplorer(inputData: testData)
            explorer.run()
        }
    }
}
