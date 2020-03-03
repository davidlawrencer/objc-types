//
//  main.m
//  objc-types
//
//  Created by David Rifkin on 2/27/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person: NSObject
- (void)sayHello;
@end

@implementation Person

- (void)sayHello {
    NSLog(@"Hello");
}

@end


/*
 OBJC refresher
 Syntax is different:
 - when declaring a var, we start with the type that that instance will be.
- var a = 10? keyword var doesn't exist, and there's no type inference
 
 We'll have to manage the memory (sometimes).
 - Ex: autoreleasepool sets a scope for you to declare variables, do stuff with them, and then at the end of the block, whatever is in memory will be told to release.
 
 Object-Oriented Language! (OOP)
 - not protocol oriented -> so true
 - 4 pillars: encapsulation, *inheritance*, abstraction, polymorphism.
 
 First! We're gonna talk about the functionality that ObjC gets from a different language.
 
 Swift compiles into Swift, which compiles into some Swift-y kind of thing (SIL) and then gets set up to be actual instructions to the computer
 
 Objective C does not compile to itself. C and its functionality sit below ObjC, and so when we compile our code, at one point all the stuff we write will be in C. After that, it'll get set up to be actual instructions to the computer.
 
 Digression: most languages compile to an intermediary language called Assembly, which is the layer of code that gets translated to the hardware of our computers.
 Digression over.
 
 First: let's do some C stuff.
 After: Let's do some ObjC stuff.
 */

/*
 function signature for main.
 how to execute this function
 */
// -> int
// argc is the number of arguments to this main function. By default there are two, the first is the function name and the second is the number of arguments.

void printThisNumber(int mainNum) {
    NSLog(@"Here is the int %d", mainNum);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // I can't use argv.count to get the number of things in my argv.
        // basic types are not objects that we have instance methods for... so we don't get to use those predefined things we're used to seeing in a definition
        // c-style for-loop executes until when?
        // i increases until it's no longer less than the size of argv (aka, the count - 1)
//        for (int i = 10; i >= sizeof(argv); i++) {
            //char isn't a character, it's a pointer... oh no. So what we're doing isn't looking at an instance of a char, or an array of those things... but actually it's an array of bytes for us to look at.
//            NSLog(@"let's see the argument %d: %s", i, argv[i]);
//        }
        int number = 10; //For basic types, I can use the = assignment that we're used to.
        int *placeANumberIs = 10; //i've set up a way to look at where this number is stored in memory -> that's called a pointer. How could I use this? I could keep count of how many references there are in memory.
        number = 32;
        
        // the value being storing at that pointer uses a byte stored in hexadecimal. Bytes are a memory unit that have 8 bits in them. A bit is made up of the values 0 or 1, or YES or NO in some interpretations of gates. Let's talk to philosophers some other day. hex: 0-9,a-f
        placeANumberIs = 32;
        
        // long long? wut. When we use these basic types, since we see that there's only a certain of memory allocated, we have to tell the program that it should allocate more space
        // Integer overflow? We try to save beyond the capacity of what memory has been allocated to our storage space. No quick and dirty way to handle in Swift.
        long long int aSuperBigNumber = 100000000000000000;
        //this sucks
        int arrayInt[] = {1,2,3,4};
        NSLog(@"put stuff in here number: %d place: %p", number, placeANumberIs);
        //Pointers suck and I don't want to use them
        //HOWEVER, ALL THE OBJECTS THAT WE GET FROM OBJC ARE GOING TO BE ACCESSED USING POINTERS.
        // Objc used to be some language that no one really used. Then Apple bought it, and they built out this framework that we're using that let us be object-oriented.
        //FOUNDATION -> Import the major NS objects for us.
        // NS -> NextStep
        // We create objects from all of these types.
        // Base object is called NSObject. It's the parent or ancestor at the root of class hierarchies for ObjC objects. Need this to create/use custom objects.
        //All of my objects are going to have pointers so that our program creates and uses that object at runtime (not creating instances when we compile, like we did above with that basic type int).
        // var lianasObject: NSObject - declaring a variable without initializing it with a value. allocating space to the object
        //There should be a pointer to some address i can reference named lianasObject
//        NSObject *lianasObject = [NSObject alloc];
        
        // var lianasString = String() -> ""
        // don't call methods, sending message
        
        NSObject *lianasObject = [[NSObject alloc] init];
        
        // Object wrapper for primitive scalar numeric values. We've created structs that wrap other structs (encapsulates other objects).
        // 'Boxing' some values to allow us to have behavior with those values
//        NSNumber *myFirstNumber = [[NSNumber alloc] init]; -> Null right now
        //NSNumber lets us do numbery things, NSInteger is just a wrapper around the different in things
        NSNumber *myFirstNumber = [NSNumber numberWithInt:7];
        NSNumber *mySecondNumber = [NSNumber numberWithFloat:1.23];
        NSNumber *myThirdNumber = [NSNumber numberWithDouble:2.4];
        int secondNumberAsInt = [mySecondNumber intValue]; // if this /'s, how could we get the remainder %
        
        // how can i initialize array with multiple arguments???
        NSArray *myFirstArray = [NSArray arrayWithObjects: myFirstNumber, mySecondNumber, myThirdNumber, nil];
        NSLog(@"I want to see my first number %@, %@, %@ %lu", myFirstNumber, mySecondNumber, myThirdNumber, [myFirstArray count]);
        // how can i print mySecondNumber as an int? I'll need to send a message
        
        
        // Mutability
        //Wrap-up -> Create an array with 5 NSNumbers in it that allows me to remove the last item.
        NSNumber *ourFirstNumber = [NSNumber numberWithInt:0];
        NSNumber *ourSecondNumber = [NSNumber numberWithInt:1];
        NSNumber *ourThirdNumber = [NSNumber numberWithInt:2];
        NSNumber *ourFourthNumber = [NSNumber numberWithInt:3];
        NSNumber *ourFifthNumber = [NSNumber numberWithInt:4];
        NSMutableArray *kimballsArray = [NSMutableArray arrayWithObjects:ourFirstNumber, ourSecondNumber, ourThirdNumber, ourFourthNumber, ourFifthNumber, nil];
        // sent a message to this object saying, remove the last object inside of you.
        [kimballsArray removeLastObject];
        NSLog(@"our mutable array has this many items in it %lu", [kimballsArray count]);
        BOOL t = true;
        BOOL f = NO;
//        f = 1;
        f++;
        int q = 2;
        BOOL tbd = f == t;
        NSMutableString *thing = [NSString stringWithString: @"here's thing"];
        thing = [thing capitalizedString];
        
        NSLog(@"here's a thing %@", thing);
        
        simpleBlock = ^{
            
        }
        /*
         Next time:
         We make our own objects!
         We learn about inheriting from root class (NSObject).
         We learn about setting up interface/implementation parts of our code.
         We learn about files structures because of interface/implementation.
         */
    }
    return 0;
}
// when we go over functions, message sending, next Tuesday, [main]

