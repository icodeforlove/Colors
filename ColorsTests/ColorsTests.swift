//
//  ColorsTests.swift
//  ColorsTests
//
//  Created by Chad Scira on 3/7/15.
//  Copyright (c) 2015 Chad Scira. All rights reserved.
//

import Cocoa
import XCTest
import Colors

class ColorsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testForegroundColors() {
        self.measureBlock() {
            XCTAssertEqual("test".black, "\u{001B}[30mtest\u{001B}[0m");
            XCTAssertEqual("test".red, "\u{001B}[31mtest\u{001B}[0m");
            XCTAssertEqual("test".green, "\u{001B}[32mtest\u{001B}[0m");
            XCTAssertEqual("test".yellow, "\u{001B}[33mtest\u{001B}[0m");
            XCTAssertEqual("test".blue, "\u{001B}[34mtest\u{001B}[0m");
            XCTAssertEqual("test".magenta, "\u{001B}[35mtest\u{001B}[0m");
            XCTAssertEqual("test".cyan, "\u{001B}[36mtest\u{001B}[0m");
            XCTAssertEqual("test".white, "\u{001B}[37mtest\u{001B}[0m");
            
            XCTAssertEqual("test".black.black, "\u{001B}[30mtest\u{001B}[0m");
            XCTAssertEqual("test".red.red, "\u{001B}[31mtest\u{001B}[0m");
            XCTAssertEqual("test".green.green, "\u{001B}[32mtest\u{001B}[0m");
            XCTAssertEqual("test".yellow.yellow, "\u{001B}[33mtest\u{001B}[0m");
            XCTAssertEqual("test".blue.blue, "\u{001B}[34mtest\u{001B}[0m");
            XCTAssertEqual("test".magenta.magenta, "\u{001B}[35mtest\u{001B}[0m");
            XCTAssertEqual("test".cyan.cyan, "\u{001B}[36mtest\u{001B}[0m");
            XCTAssertEqual("test".white.white, "\u{001B}[37mtest\u{001B}[0m");
            
            XCTAssertEqual("test".red.green.blue, "\u{001B}[34mtest\u{001B}[0m");
        }
    }
    
    func testBackgroundColors() {
        self.measureBlock() {
            XCTAssertEqual("test".blackBackground, "\u{001B}[40mtest\u{001B}[0m");
            XCTAssertEqual("test".redBackground, "\u{001B}[41mtest\u{001B}[0m");
            XCTAssertEqual("test".greenBackground, "\u{001B}[42mtest\u{001B}[0m");
            XCTAssertEqual("test".yellowBackground, "\u{001B}[43mtest\u{001B}[0m");
            XCTAssertEqual("test".blueBackground, "\u{001B}[44mtest\u{001B}[0m");
            XCTAssertEqual("test".magentaBackground, "\u{001B}[45mtest\u{001B}[0m");
            XCTAssertEqual("test".cyanBackground, "\u{001B}[46mtest\u{001B}[0m");
            XCTAssertEqual("test".whiteBackground, "\u{001B}[47mtest\u{001B}[0m");
            
            XCTAssertEqual("test".blackBackground.blackBackground, "\u{001B}[40mtest\u{001B}[0m");
            XCTAssertEqual("test".redBackground.redBackground, "\u{001B}[41mtest\u{001B}[0m");
            XCTAssertEqual("test".greenBackground.greenBackground, "\u{001B}[42mtest\u{001B}[0m");
            XCTAssertEqual("test".yellowBackground.yellowBackground, "\u{001B}[43mtest\u{001B}[0m");
            XCTAssertEqual("test".blueBackground.blueBackground, "\u{001B}[44mtest\u{001B}[0m");
            XCTAssertEqual("test".magentaBackground.magentaBackground, "\u{001B}[45mtest\u{001B}[0m");
            XCTAssertEqual("test".cyanBackground.cyanBackground, "\u{001B}[46mtest\u{001B}[0m");
            XCTAssertEqual("test".whiteBackground.whiteBackground, "\u{001B}[47mtest\u{001B}[0m");
            
            XCTAssertEqual("test".redBackground.greenBackground.blueBackground, "\u{001B}[44mtest\u{001B}[0m");
        }
    }
    
    func testStyles() {
        self.measureBlock() {
            XCTAssertEqual("test".bold, "\u{001B}[1mtest\u{001B}[0m");
            XCTAssertEqual("test".italic, "\u{001B}[3mtest\u{001B}[0m");
            XCTAssertEqual("test".underline, "\u{001B}[4mtest\u{001B}[0m");
            XCTAssertEqual("test".inverse, "\u{001B}[7mtest\u{001B}[0m");
            XCTAssertEqual("test".strikethrough, "\u{001B}[9mtest\u{001B}[0m");
            
            XCTAssertEqual("test".bold.bold, "\u{001B}[1mtest\u{001B}[0m");
            XCTAssertEqual("test".italic.italic, "\u{001B}[3mtest\u{001B}[0m");
            XCTAssertEqual("test".underline.underline, "\u{001B}[4mtest\u{001B}[0m");
            XCTAssertEqual("test".inverse.inverse, "\u{001B}[7mtest\u{001B}[0m");
            XCTAssertEqual("test".strikethrough.strikethrough, "\u{001B}[9mtest\u{001B}[0m");
            
            XCTAssertEqual("test".boldOff, "\u{001B}[22mtest\u{001B}[0m");
            XCTAssertEqual("test".italicOff, "\u{001B}[23mtest\u{001B}[0m");
            XCTAssertEqual("test".underlineOff, "\u{001B}[24mtest\u{001B}[0m");
            XCTAssertEqual("test".inverseOff, "\u{001B}[27mtest\u{001B}[0m");
            XCTAssertEqual("test".strikethroughOff, "\u{001B}[29mtest\u{001B}[0m");
            
            XCTAssertEqual("test".boldOff.boldOff, "\u{001B}[22mtest\u{001B}[0m");
            XCTAssertEqual("test".italicOff.italicOff, "\u{001B}[23mtest\u{001B}[0m");
            XCTAssertEqual("test".underlineOff.underlineOff, "\u{001B}[24mtest\u{001B}[0m");
            XCTAssertEqual("test".inverseOff.inverseOff, "\u{001B}[27mtest\u{001B}[0m");
            XCTAssertEqual("test".strikethroughOff.strikethroughOff, "\u{001B}[29mtest\u{001B}[0m");
        }
        
    }

    func testReset() {
        self.measureBlock() {
            XCTAssertEqual("test".red.reset, "\u{001B}[mtest\u{001B}[0m");
        }
    }
    
    func testNestedCommands() {
        self.measureBlock() {
            XCTAssertEqual("test".red.bold.underline, "\u{001B}[31;1;4mtest\u{001B}[0m");
            XCTAssertEqual(("test".red + "test".blue).bold, "\u{001B}[31;1mtest\u{001B}[0m\u{001B}[34;1mtest\u{001B}[0m");
        }
    }
    
}
