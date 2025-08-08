//
//  PZGlassEffectController.m
//  Pods-PZObjectiveSwiftUI
//
//  Created by admin on 2025/8/8.
//

#import "PZGlassEffectController.h"
#import "PZObjcSwiftUIMain-Swift.h"

@interface PZGlassEffectController ()

@property(nonatomic, strong) UIVisualEffectView *yEffectView;

@end

@implementation PZGlassEffectController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.greenColor;
    // 创建玻璃效果容器
    UIView *glassContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 200, self.view.bounds.size.width, 200)];
    glassContainer.layer.cornerRadius = 16;
    glassContainer.clipsToBounds = YES;
    [self.view addSubview:glassContainer];
    if (@available(iOS 26.0, *)) {
        UIGlassContainerEffect *containerEffect = [[UIGlassContainerEffect alloc] init];
        containerEffect.spacing = 40;
        UIVisualEffectView *containerEffectView = [[UIVisualEffectView alloc] initWithEffect:containerEffect];
        containerEffectView.frame = CGRectMake(50, glassContainer.frame.size.height / 2 - 50, 200, 100);
        [glassContainer addSubview:containerEffectView];
        {
            UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
            redView.backgroundColor = UIColor.clearColor;
            redView.clipsToBounds = YES;
            redView.layer.cornerRadius =  50;
            redView.userInteractionEnabled = YES;
            UITapGestureRecognizer *rTapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchesShow)];
            [redView addGestureRecognizer:rTapGes];
            
            UIGlassEffect *glassEffect = [UIGlassEffect effectWithStyle:UIGlassEffectStyleRegular];
            glassEffect.interactive = YES;
            UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:glassEffect];
            effectView.frame = CGRectMake(0, 0, 100, 100);
            [effectView.contentView addSubview:redView];
            [containerEffectView.contentView addSubview:effectView];
            
            UIView *yellowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
            yellowView.backgroundColor = UIColor.clearColor;
            yellowView.clipsToBounds = YES;
            yellowView.layer.cornerRadius =  50;
            yellowView.userInteractionEnabled = YES;
            UITapGestureRecognizer *yTapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchesHide)];
            [yellowView addGestureRecognizer:yTapGes];
            
            UIGlassEffect *yGlassEffect = [UIGlassEffect effectWithStyle:UIGlassEffectStyleRegular];
            yGlassEffect.interactive = YES;
            UIVisualEffectView *yEffectView = [[UIVisualEffectView alloc] initWithEffect:yGlassEffect];
            yEffectView.frame = CGRectMake(50, 0, 100, 100);
            [yEffectView.contentView addSubview:yellowView];
            [containerEffectView.contentView addSubview:yEffectView];
            self.yEffectView = yEffectView;
        }
    }
    UIView *swiftEffView = PZGlassEffectSwiftController.createController.view;
    swiftEffView.frame = CGRectMake(50, 450, self.view.bounds.size.width - 100, 200);
    swiftEffView.backgroundColor = UIColor.clearColor;
    [self.view addSubview:swiftEffView];
}

- (void)touchesShow {
    [UIView animateWithDuration:2 animations:^{
        self.yEffectView.frame = CGRectMake(150, 0, 100, 100);
    }];
}

- (void)touchesHide {
    [UIView animateWithDuration:2 animations:^{
        self.yEffectView.frame = CGRectMake(50, 0, 100, 100);
    }];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
