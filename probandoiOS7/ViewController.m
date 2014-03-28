//
//  ViewController.m
//  probandoiOS7
//
//  Created by Antonio Guirola on 22/02/14.
//  Copyright (c) 2014 Antonio Guirola. All rights reserved.
//

#import "ViewController.h"
#import "CapturadorDatos.h"
#import "TFHpple.h"

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
    
    // probamos la descarga del parser
    NSArray* aBlogs = [self obtenerBlogs];
    
    // los recorremos y mostramos por pantalla
    for(TFHppleElement *element in aBlogs){
        
        NSLog(@"Elemento encontrado: %@", [element objectForKey:@"href"]);

    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSArray*)obtenerBlogs
{
    CapturadorDatos *objCapturador = [CapturadorDatos obtenerObjeto];
    [objCapturador setUrl:@"http://programacionmovilesugr.blogspot.com.es/2014/03/lista-de-blogs.html"];
    [objCapturador setQuery:@"//div[@itemprop='blogPost']//li/a"];
    
    return [objCapturador parse];
}


@end
