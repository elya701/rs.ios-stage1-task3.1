#import "ViewController.h"



@implementation ViewController
#pragma mark -
UILabel* color_label;
UILabel* red_label;
UILabel* green_label;
UILabel* blue_label;
UIView* color_view;
UITextField* red_textfield;
UITextField* green_textfield;
UIButton* process_button;
UITextField* blue_textfield;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    color_label = [[UILabel alloc] initWithFrame:CGRectMake(40, 50, 135, 30)];
    [color_label setText:@"Color"];
    
    red_label = [[UILabel alloc] initWithFrame:CGRectMake(40, 100, 100, 30)];
    [red_label setText:@"RED"];
    
    green_label = [[UILabel alloc] initWithFrame:CGRectMake(40, 150, 100, 30)];
    [green_label setText:@"GREEN"];
    
    blue_label = [[UILabel alloc] initWithFrame:CGRectMake(40, 200, 100, 30)];
    [blue_label setText:@"BLUE"];
    
    [self.view addSubview:color_label];
    [self.view addSubview:red_label];
    [self.view addSubview:green_label];
    [self.view addSubview:blue_label];
    
    color_view = [[UIView alloc] initWithFrame:CGRectMake(180, 50, 160, 30)];
    color_view.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:color_view];
    
    red_textfield = [[UITextField alloc] initWithFrame:CGRectMake(160, 100, 180, 30)];
    [red_textfield setPlaceholder:@"0..255"];
    red_textfield.layer.cornerRadius=8;
    red_textfield.layer.masksToBounds=YES;
    red_textfield.layer.borderWidth= 1;
    red_textfield.layer.borderColor=[[UIColor lightGrayColor]CGColor];
    [red_textfield addTarget:self action:@selector(check_on_error) forControlEvents:UIControlEventEditingDidBegin];
    green_textfield = [[UITextField alloc] initWithFrame:CGRectMake(160, 150, 180, 30)];
    [green_textfield setPlaceholder:@"0..255"];
    green_textfield.layer.cornerRadius=8;
    green_textfield.layer.masksToBounds=YES;
    green_textfield.layer.borderWidth= 1;
    green_textfield.layer.borderColor=[[UIColor lightGrayColor]CGColor];
    [green_textfield addTarget:self action:@selector(check_on_error) forControlEvents:UIControlEventEditingDidBegin];
    blue_textfield = [[UITextField alloc] initWithFrame:CGRectMake(160, 200, 180, 30)];
    [blue_textfield setPlaceholder:@"0..255"];
    blue_textfield.layer.cornerRadius=8;
    blue_textfield.layer.masksToBounds=YES;
    blue_textfield.layer.borderWidth= 1;
    blue_textfield.layer.borderColor=[[UIColor lightGrayColor]CGColor];
    [blue_textfield addTarget:self action:@selector(check_on_error) forControlEvents:UIControlEventEditingDidBegin];
    
    

    [self.view addSubview:red_textfield];
    [self.view addSubview:green_textfield];
    [self.view addSubview:blue_textfield];
    
    
    process_button = [[UIButton alloc] initWithFrame:CGRectMake(self.view.center.x - 70   , 250, 140, 30)];
    [process_button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [process_button setTitle:@"Process" forState:UIControlStateNormal];
    [process_button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal ];
    [self.view addSubview:process_button];
    
    self.view.accessibilityIdentifier = @"mainView";
    
    
    red_textfield.accessibilityIdentifier = @"textFieldRed";
    green_textfield.accessibilityIdentifier = @"textFieldGreen";
    blue_textfield.accessibilityIdentifier = @"textFieldBlue";
    
    process_button.accessibilityIdentifier = @"buttonProcess";
    
    red_label.accessibilityIdentifier = @"labelRed";
    green_label.accessibilityIdentifier = @"labelGreen";
    blue_label.accessibilityIdentifier = @"labelBlue";
    color_label.accessibilityIdentifier = @"labelResultColor";
    
    color_view.accessibilityIdentifier = @"viewResultColor";
    
}


-(void) buttonClicked:(UIButton*)sender
 {
     double red = red_textfield.text.doubleValue;
     double green = green_textfield.text.doubleValue;
     double blue = blue_textfield.text.doubleValue;
     
     NSCharacterSet* our_correct_numbers = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
     
     [red_textfield resignFirstResponder];
     [green_textfield resignFirstResponder];
     [blue_textfield resignFirstResponder];
     
     if ( [red_textfield.text  isEqual: @""] || [green_textfield.text  isEqual: @""] || [blue_textfield.text  isEqual: @""] || [red_textfield.text rangeOfCharacterFromSet:our_correct_numbers].location != NSNotFound || [green_textfield.text rangeOfCharacterFromSet:our_correct_numbers].location != NSNotFound || [blue_textfield.text rangeOfCharacterFromSet:our_correct_numbers].location != NSNotFound ||
            red < 0 || red > 255 || green < 0 || green > 255 || blue < 0 || blue > 255
        ) {
            color_label.text = @"Error";
            color_view.backgroundColor = UIColor.whiteColor;
        } else {
            UIColor *color = [UIColor colorWithRed:red/255.0
            green:green/255.0
             blue:blue/255.0
            alpha:1];
            
            color_view.backgroundColor = color;
            color_label.text = [self hexStringFromColor: color];
        }
 }

- (void)check_on_error {
    if (![color_label.text isEqualToString:@"Color"]) {
        red_textfield.text = @"";
        green_textfield.text = @"";
        blue_textfield.text = @"";
        
        color_label.text = @"Color";
        color_view.backgroundColor = UIColor.whiteColor;
    }
}


- (NSString *)hexStringFromColor:(UIColor *)color {
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    return [NSString stringWithFormat:@"0x%02lX%02lX%02lX",
        lroundf(components[0] * 255),
        lroundf(components[1] * 255),
        lroundf(components[2] * 255)
    ];
}



@end
