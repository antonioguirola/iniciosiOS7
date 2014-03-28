//
//  CapturadorDatos.m
//  probandoiOS7
//
//  Created by Antonio Guirola on 27/03/14.
//  Copyright (c) 2014 Antonio Guirola. All rights reserved.
//

#import "CapturadorDatos.h"
#import "TFHpple.h"

@implementation CapturadorDatos

@synthesize query = _query;
@synthesize url = _url;
@synthesize aResultados = _aResultados;

// objeto singleton

CapturadorDatos *objCapturador = nil;

// constructores

- (instancetype)init
{
    self = [super init];
    if (self) {
        [CapturadorDatos alloc];
        objCapturador.query = @"";
        objCapturador.url = @"";
        [[objCapturador aResultados] initWithObjects:nil];
    }
    return self;
}

- (instancetype)initWithUrl:(NSString*) sUrl andQuery:(NSString*) sQuery
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

// get del objeto

+(CapturadorDatos*) obtenerObjeto
{
    if (objCapturador == nil) {
        [objCapturador init];
    }
    
    return objCapturador;
}


// métodos propios

-(NSArray*)parse {
    // 1
    NSURL *urlGeneral =[NSURL URLWithString: objCapturador.url];
    NSData *htmlData =[NSData dataWithContentsOfURL: urlGeneral];
    
    // 2
    
    TFHpple *parser =[TFHpple hppleWithHTMLData: htmlData];
    
    // 3
    
    NSString *sCadenaBusqueda = objCapturador.query;
    
    NSArray *aNodos =[parser searchWithXPathQuery:sCadenaBusqueda];
    
//    // 4
//    
//    NSMutableArray *aUrlBlogs =[[NSMutableArray alloc] initWithCapacity: 0];
//    
//    for(TFHppleElement *element in aNodos){
//        
//        NSLog(@"Elemento encontrado: %@", [element objectForKey:@"href"]);
//        
//        [aUrlBlogs addObject:[element objectForKey:@"href"]];
//    }
//    
//    for (NSString *sUrl in aUrlBlogs) {
//        NSLog(@"URL = %@", sUrl);
//    }
    
    return aNodos;
}

@end
