#  Mars Rovers Kata
This is a Mars Rover Kata, using Swift 5 language.
See Problem Description section for more info.

## How to build
- This code is meant to be built in XCode 10 in OSX.
- Build makes an MarsExplorer executable file and a MarsExplorerCore framework. The reason to have two separate "products" is just for testability purposes.

## How to run
Locate the build folder and execute:

$ s./MarsExplorer your_input_file

Note: MarsExplorer won't work unless is ran in the same directory as MarsExplorerCore framework. A normal build will make both files available in the same Build directory.

## Problem Description
A squad of robotic rovers are to be landed by NASA on a plateau on Mars. This plateau, which is curiously rectangular, must be navigated by the rovers so that their on-board cameras can get a complete view of the surrounding terrain to send back to Earth. A rover’s position and location is represented by a combination of x and y co- ordinates and a letter representing one of the four cardinal compass points. The plateau is divided up into a grid to simplify navigation. An example position might be 0, 0, N, which means the rover is in the bottom left corner and facing North.

In order to control a rover, NASA sends a simple string of letters. The possible letters are ‘L’, ‘R’ and ‘M’. ‘L’ and ‘R’ makes the rover spin 90 degrees left or right respectively, without moving from its current spot. ‘M’ means move forward one grid point, and maintain the same Heading. Assume that the square directly North from (x, y) is (x, y+1).

INPUT:
The first line of input is the upper-right coordinates of the plateau, the lower- left coordinates are assumed to be 0,0. The rest of the input is information pertaining to the rovers that have been deployed. Each rover has two lines of input. The first line gives the rover’s position, and the second line is a series of instructions telling the rover how to explore the plateau. The position is made up of two integers and a letter separated by spaces, corresponding to the x and y co-ordinates and the rover’s orientation. Each rover will be finished sequentially, which means that the second rover won’t start to move until the first one has finished moving.

OUTPUT:
The output for each rover should be its final co-ordinates and heading.

INPUT AND OUTPUT:
Test Input:
5 5
1 2 N
L M L M L M L M M
3 3 E
M M R M M R M R R M

Expected Output:
1 3 N
5 1 E

## Problem Assumptions
- A rover can't move out of the plateau, but is allowed to move back inside if has "landed" outside.
- Two rovers can share the same position.
- Input  data follows the guidelines.

## Boilerplate known Issues
- Code in a Command Line Tool built in Swift can't be tested because code would contain 2 main() functions. In order to fix, all  MarsExplorer code is built as a framework which can be tested sepparately. Then, a command line tool that uses that framework as a core dependency is built: 
https://www.swiftbysundell.com/posts/building-a-command-line-tool-using-the-swift-package-manager
- Building a command line tool in Swift that links to dynamic libraries is not quite well supported yet. There are some workarounds available: 
https://medium.com/livefront/how-to-add-a-dynamic-swift-framework-to-a-command-line-tool-bab6426d6c31
- "Swift 5 Runtime package” is mandatory and it might not be present if your OSX version is earlier than 10.14.4.
https://developer.apple.com/download/more/ (Swift 5 Runtime Support for Command Line Tools)
Failing to do so makes the app crash without previous warning.
