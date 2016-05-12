//
//  ViewController.m
//  PickerView
//
//  Created by Gate on 16/1/3.
//  Copyright © 2016年 Gate. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (nonatomic ,strong) NSArray *foodLLLs;
@property (strong, nonatomic) IBOutlet UILabel *fruitLabel;
@property (strong, nonatomic) IBOutlet UILabel *mainLabel;
@property (strong, nonatomic) IBOutlet UILabel *drinkLabel;
@property (strong, nonatomic) IBOutlet UIPickerView *pickView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _foodLLLs = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"foods" ofType:@"plist"]];
}
//-(NSArray *)foodLLLs{
//    if (_foodLLLs == nil) {
//        _foodLLLs = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"foods" ofType:@"plist"]];
//    }
//    return _foodLLLs;
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    NSLog(@"_foods------%lu",(unsigned long)_foodLLLs.count);

    return _foodLLLs.count;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    NSArray *subArray = self.foodLLLs[component];
    NSLog(@"------%lu",(unsigned long)subArray.count);

    return subArray.count;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSArray *subArray = self.foodLLLs[component];
    return subArray[row];
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component == 0) {
        NSArray *subArray0 = self.foodLLLs[component];
        self.fruitLabel.text = subArray0[row];

    }else if(component == 1){
        NSArray *subArray1 = self.foodLLLs[component];
        self.mainLabel.text = subArray1[row];

    }else if (component == 2){
        NSArray *subArray2 = self.foodLLLs[component];
        self.drinkLabel.text = subArray2[row];

    }
//    NSArray *subArray0 = self.foodLLLs[0];
//    NSArray *subArray1 = self.foodLLLs[1];
//    NSArray *subArray2 = self.foodLLLs[2];
//
//    self.fruitLabel.text = subArray0[row];
//    self.mainLabel.text = subArray1[row];
//    self.drinkLabel.text = subArray2[row];
    
}
- (IBAction)random {
    
    for (int component = 0; component < self.foodLLLs.count; component ++) {
//        int com = component;
        int row = arc4random()%[self.foodLLLs[component] count];
        int oldRow = (int)[self.pickView selectedRowInComponent:component];
        while (row == oldRow) {
            row = arc4random()%[self.foodLLLs[component] count];

        }
        [self.pickView selectRow:row inComponent:component animated:YES];
        [self pickerView:self.pickView didSelectRow:row inComponent:component];
    }
//    [self.pickView selectRow:arc4random()%[self.foodLLLs[0] count] inComponent:0 animated:YES];
//    [self.pickView selectRow:arc4random()%[self.foodLLLs[1] count] inComponent:1 animated:YES];
//    [self.pickView selectRow:arc4random()%[self.foodLLLs[2] count] inComponent:2 animated:YES];

}
@end
