//
//  ViewController.h
//  machswap2
//
//  Created by Soongyu Kwon on 03/03/2019.
//  Copyright © 2019 PeterDev. All rights reserved.
//

#import <UIKit/UIKit.h>

#include <stdio.h>
#include <pthread.h>

#include "common.h"
#include "pwn.h"
#include "offsets.h"

@interface ViewController : UIViewController
- (IBAction)tappedOnExploit:(id)sender;


@end

