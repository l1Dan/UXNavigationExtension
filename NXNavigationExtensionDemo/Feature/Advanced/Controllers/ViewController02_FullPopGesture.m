//
//  ViewController02_FullPopGesture.m
//  NXNavigationExtensionDemo
//
//  Created by Leo Lee on 2020/10/26.
//

#import <NXNavigationExtension/NXNavigationExtension.h>

#import "ViewController02_FullPopGesture.h"
#import "ViewController07_PageViewController.h"
#import "ViewController06_ScrollView.h"

@interface ViewController02_FullPopGesture ()

@property (nonatomic, strong) UIStackView *contentView;
@property (nonatomic, strong) UIButton *scrollViewTypeButton;
@property (nonatomic, strong) UIButton *pageViewControllerTypeButton;
@property (nonatomic, strong) NSArray<NSString *> *imageNames;

@end

@implementation ViewController02_FullPopGesture

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addViewContent];
    [self addViewConstraints];
}

- (void)addViewContent {
    [self.view addSubview:self.contentView];
    
    [self.contentView addArrangedSubview:self.scrollViewTypeButton];
    [self.contentView addArrangedSubview:self.pageViewControllerTypeButton];
}

- (void)addViewConstraints {
    [NSLayoutConstraint activateConstraints:@[
        [self.contentView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.contentView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:200],
    ]];
}

- (BOOL)nx_enableFullscreenInteractivePopGesture {
    return YES;
}

#pragma mark - Actions

- (void)clickUseScrollViewButton:(UIButton *)button {
    [self.navigationController pushViewController:[[ViewController06_ScrollView alloc] initWithImageNames:self.imageNames] animated:YES];
}

- (void)clickUsePageViewControllerButton:(UIButton *)button {
    [self.navigationController pushViewController:[[ViewController07_PageViewController alloc] initWithImageNames:self.imageNames] animated:YES];
}

#pragma mark - Getter

- (UIStackView *)contentView {
    if (!_contentView) {
        _contentView = [[UIStackView alloc] init];
        _contentView.axis = UILayoutConstraintAxisVertical;
        _contentView.spacing = 20;
        _contentView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _contentView;
}

- (UIButton *)scrollViewTypeButton {
    if (!_scrollViewTypeButton) {
        _scrollViewTypeButton = [[UIButton alloc] init];
        _scrollViewTypeButton.translatesAutoresizingMaskIntoConstraints = NO;
        _scrollViewTypeButton.backgroundColor = [UIColor brownColor];
        [_scrollViewTypeButton setTitle:@"Use UIScrollView" forState:UIControlStateNormal];
        [_scrollViewTypeButton addTarget:self action:@selector(clickUseScrollViewButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _scrollViewTypeButton;
}

- (UIButton *)pageViewControllerTypeButton {
    if (!_pageViewControllerTypeButton) {
        _pageViewControllerTypeButton = [[UIButton alloc] init];
        _pageViewControllerTypeButton.translatesAutoresizingMaskIntoConstraints = NO;
        _pageViewControllerTypeButton.backgroundColor = [UIColor brownColor];
        [_pageViewControllerTypeButton setTitle:@"Use UIPageViewController" forState:UIControlStateNormal];
        [_pageViewControllerTypeButton addTarget:self action:@selector(clickUsePageViewControllerButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _pageViewControllerTypeButton;
}

- (NSArray<NSString *> *)imageNames {
    /**
     * Image Links
     * https://images.unsplash.com/photo-1633620210623-edf036a3621e?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&dl=nicolas-arnold-YgjkyR3eU-w-unsplash.jpg
     * https://images.unsplash.com/photo-1633673489026-62f02b97c1fe?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&dl=heye-jensen-aZBzt_oMX7Y-unsplash.jpg
     * https://images.unsplash.com/photo-1633630167673-8650317b1c9d?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&dl=jusfilm-nRxaFz7pXUc-unsplash.jpg
     */
    if (!_imageNames) {
        NSMutableArray<NSString *> *imageNames = [NSMutableArray array];
        for (NSUInteger index = 0; index < 3; index++) {
            NSString *name = [NSString stringWithFormat:@"0%zd", index];
            [imageNames addObject:name];
        }
        _imageNames = imageNames;
    }
    return _imageNames;
}

@end
