//
//  ViewController.m
//  machswap2
//
//  Created by Soongyu Kwon on 03/03/2019.
//  Copyright © 2019 PeterDev. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

void *haxxThread(void *arg)
{
    kern_return_t ret;
    
    offsets_t *offs = get_offsets();
    if (offs == NULL)
    {
        LOG("failed to get offsets!");
        return NULL;
    }
    
    mach_port_t tfp0;
    uint64_t kernel_base;
    ret = exploit(offs, &tfp0, &kernel_base);
    if (ret != KERN_SUCCESS)
    {
        LOG("failed to run exploit: %x %s", ret, mach_error_string(ret));
        return NULL;
    }
    
    LOG("success!");
    LOG("tfp0: %x", tfp0);
    LOG("kernel base: 0x%llx", kernel_base);
    
    return NULL;
}

- (IBAction)tappedOnExploit:(id)sender {
    pthread_t thd;
    pthread_create(&thd, NULL, &haxxThread, NULL);
}
@end
