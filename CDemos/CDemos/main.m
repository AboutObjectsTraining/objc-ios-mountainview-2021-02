// Copyright (C) 2021 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <stdio.h>

void DoPointerStuff(void) {
    int inches = 12;
    printf("inches is %d\n", inches);
    
//    int *foo, bar, **baz;
    
    int *inchesRef = &inches;
    
    printf("inchesRef is %p\n", inchesRef);
    
    *inchesRef += 1;
    
    int value = *inchesRef;
    printf("value is %d\n", value);
}

void DoStringStuff(void) {
//    char letters1[] = { 'a', 'b', 'c', '\0' };
//    char letters2[] = { 97, 98, 99, 0 };
//    char letters3[] = "zyz";
    
    char arrayOfChars[] = {'a', 'b', 'c'};
    
    printf("%s\n", arrayOfChars);
    
    char name[] = "Fred Smith";
    //    char otherName[] = name; illegal!
    char *charRef = name;
    
    // Prints: address is 0x7fff5fbff7dd, value is F
    printf("address is %p, value is %c\n", charRef, charRef[0]);
    printf("address is %p, value is %c\n", charRef, *(charRef + 0));


    printf("address is %p, value is %c\n", name, *name);
    
    // Prints: address is 0x7fff5fbff7de, value is r
    printf("address is %p, value is %c\n", &charRef[1], charRef[1]);
    printf("address is %p, value is %c\n", name + 1, *(name + 1));
    
    //    name += 5; illegal!
    
    charRef += 5;  // Moves the pointer past the substring “Fred “
                   // Prints: address is 0x7fff5fbff7e2, value is Smith
    
    printf("address is %p, value is %s\n", charRef, charRef);
}

int main(int argc, const char * argv[]) {
    DoStringStuff();
//    DoPointerStuff();
}
