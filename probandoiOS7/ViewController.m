//
//  ViewController.m
//  probandoiOS7
//
//  Created by Antonio Guirola on 22/02/14.
//  Copyright (c) 2014 Antonio Guirola. All rights reserved.
//

#import "ViewController.h"
#import "TFHpple.h"
#import "CapturadorDatos.h"

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
    [self cargarBlogs];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// métodos propios
-(void)cargarBlogs {
    // 1
    NSURL *urlListadoBlogs =[NSURL URLWithString: @"http://programacionmovilesugr.blogspot.com.es/2014/03/lista-de-blogs.html"];
    NSData *blogsHtmlData =[NSData dataWithContentsOfURL: urlListadoBlogs];
    
    // 2
    
    TFHpple *parser =[TFHpple hppleWithHTMLData: blogsHtmlData];
    
    // 3
    
    NSString *sCadenaBusqueda = @"//div[@itemprop='blogPost']//li/a";
    
    NSArray *aNodos =[parser searchWithXPathQuery:sCadenaBusqueda];
    
    // 4
    
    NSMutableArray *aUrlBlogs =[[NSMutableArray alloc] initWithCapacity: 0];
    
    for(TFHppleElement *element in aNodos){
        
        NSLog(@"Elemento encontrado: %@", [element objectForKey:@"href"]);
        
        [aUrlBlogs addObject:[element objectForKey:@"href"]];
    }
    
    for (NSString *sUrl in aUrlBlogs) {
        NSLog(@"URL = %@", sUrl);
    }
}

@end
