//
//  ViewController.m
//  encrypt
//
//  Created by Yestae on 2018/4/23.
//  Copyright © 2018年 Yestae. All rights reserved.
// 借鉴网址：https://www.jianshu.com/p/b12e88231367?utm_campaign=maleskine&utm_content=note&utm_medium=seo_notes&utm_source=recommendation
//
//  本章展示加密算法代码


#import "ViewController.h"
//
#import "NSString+AES256.h"

#define KeyPassWord @"es123"

#define testStr @"密码"

typedef NS_ENUM(NSInteger,YYHEncryptType){
    YYHEncryptAES,
    YYHEncryptBase64,
    YYHEncryptMD5
};

@interface ViewController ()

@property (nonatomic, strong) NSString *afterStr;
@property (nonatomic, strong) NSString *backStr;

@property (nonatomic, strong) UILabel *showLabel;
@property (nonatomic, strong) UILabel *backLabel;

@property (nonatomic, strong) UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 200, 30)];
    textField.backgroundColor = [UIColor grayColor];
    [self.view addSubview:textField];
    self.textField = textField;
    //
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.backgroundColor = [UIColor redColor];
    button.frame = CGRectMake(100, 150, 50, 20);
    [button setTitle:@"编码" forState:UIControlStateNormal];
    [button addTarget:self
               action:@selector(goaction)
     forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: button];
    //
    UILabel *showLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 180, 200,30)];
    showLabel.backgroundColor = [UIColor greenColor];
    showLabel.font = [UIFont systemFontOfSize:14.0];
    [self.view addSubview:showLabel];
    self.showLabel = showLabel;
    //
    UILabel *backLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 250, 200, 30)];
    backLabel.backgroundColor = [UIColor greenColor];
    backLabel.font = [UIFont systemFontOfSize:14.0];
    [self.view addSubview:backLabel];
    self.backLabel = backLabel;
}
- (void)goaction{
    [self AESEntrypt:_textField.text];
    //
    _showLabel.text = _afterStr;
    _backLabel.text = _backStr;
}


// 1、AES
//AES 是一个新的可以用于保护电子数据的加密算法。明确地说，AES 是一个迭代的、对称密钥分组的密码，它可以使用128、192 和 256 位密钥，并且用 128 位（16字节）分组加密和解密数据。与公共密钥密码使用密钥对不同，对称密钥密码使用相同的密钥加密和解密数据。通过分组密码返回的加密数据 的位数与输入数据相同。迭代加密使用一个循环结构，在该循环中重复置换（permutations ）和替换(substitutions）输入数据。Figure 1 显示了 AES 用192位密钥对一个16位字节数据块进行加密和解密的情形。
// 为nsstring和data添加分类方便调用
- (void)AESEntrypt:(NSString *)str{
    //
    _afterStr =  [str aes256_encrypt:KeyPassWord];
    NSLog(@"%@",_afterStr);
    //
    _backStr = [_afterStr aes256_decrypt:KeyPassWord];
    NSLog(@"%@",_afterStr);
    
}

// 2.

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
