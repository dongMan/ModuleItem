#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "NSObject+TestBBundle.h"
#import "TestBOCViewController.h"

FOUNDATION_EXPORT double TestBVersionNumber;
FOUNDATION_EXPORT const unsigned char TestBVersionString[];

