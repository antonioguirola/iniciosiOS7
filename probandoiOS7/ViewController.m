//
//  ViewController.m
//  probandoiOS7
//
//  Created by Antonio Guirola on 22/02/14.
//  Copyright (c) 2014 Antonio Guirola. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Cargamos la dirección a visitar
    NSString *urlCompleta = @"http://programacionmovilesugr.blogspot.com.es/";
    NSURL *url = [NSURL URLWithString:urlCompleta];
    NSURLRequest *peticion = [NSURLRequest requestWithURL:url];
    
    // cargamos la página:
    [_wvNavegador loadRequest:peticion];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
