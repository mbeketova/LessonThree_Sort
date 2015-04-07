//
//  ViewController.m
//  LessonThree_Sort
//
//  Created by Admin on 06.04.15.
//  Copyright (c) 2015 Mariya Beketova. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//объявляем глобальные переменные:
@property NSArray * arrayPrice;
@property NSArray * arrayValue;
@property NSMutableArray * arrayM;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//в задании необходимо вывести в таблицу значения stringValue и соответствующие им значения цен в stringPrice + отсортировать данные по прайсу
    
    NSString * stringValue = @"Куртка красная, Куртка синяя, Куртка зеленая, Куртка оранжевая, Куртка черная, Куртка белая";
    NSString * stringPrice = @"250, 300, 150, 117, 280, 218";
 
    
    self.arrayM = [[NSMutableArray alloc]init];//инициализируем массив, куда будем записывать данные
    
    //заносим в массив значения из строки без символов запятая и пробел:
    self.arrayPrice = [stringPrice componentsSeparatedByString:@", "];
    self.arrayValue = [stringValue componentsSeparatedByString:@", "];
    
   
    //данный цикл записывает в коллекцию значения из массива arrayValue и соответствующие ему значения из массива arrayPrice, пока не закончатся элементы в массиве arrayPrice:
    
    for (int i = 0; i < self.arrayPrice.count; i++) {
        NSDictionary * dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                               [self.arrayValue objectAtIndex:i], @"value",
                               [self.arrayPrice objectAtIndex:i], @"price", nil];

        
        
        [self.arrayM addObject:dict]; //записываем полученную запись из коллекции в массив
   
        
        
    }
     //здесь надо отсортировать коллекцию:
    NSSortDescriptor * sorter = [[NSSortDescriptor alloc] initWithKey:@"price" ascending:YES];
    NSArray * descriptors = [NSArray arrayWithObjects:sorter, nil];
    [self.arrayM sortUsingDescriptors:descriptors];
    

    NSLog(@"%@",self.arrayM); //выводим на печать полученный массив с наименованиями и ценами
    
}


    
#pragma mark - UITableViewDelegate
    
//определяем количество ячеек в таблице (пока не закончатся элементы в массиве arrayM:
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayM.count;
}

//сложная конструкция, наверное, определяет запись в поле по наличию во вьюконтроллере: Cell
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * simpleTaibleIndefir = @"Cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:simpleTaibleIndefir];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTaibleIndefir]; //если cell встретил конец (nil), то переход к следующему значению
    }

    //заносим в таблице в техтлейбл ячейки - элемент с ключем value:
    cell.textLabel.text = [[self.arrayM objectAtIndex:indexPath.row]objectForKey:@"value"];
    
    //заносим в таблицу в детальтехтлейбл ячейки - элемент с ключем price:
    cell.detailTextLabel.text = [[self.arrayM objectAtIndex:indexPath.row]objectForKey:@"price"];
    
    
    return cell;
}

//не знаю что делает эта строка, но без нее не работает, но переводчик написал следующее:
/*Сообщает делегат, который указан ряд теперь снят.
 Делегат обрабатывает строки deselections в этом методе. Это может быть, например, удалить изображение галочка (UITableViewCellAccessoryCheckmark), связанный со строкой.*/


- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}
    
    



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
