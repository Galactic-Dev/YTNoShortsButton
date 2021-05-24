#import <UIKit/UIKit.h> //imports the UIKit framework which has headers for all the UI elements like UIView, UIButton, etc.

@interface YTPivotBarItemView : UIView //interfaces YTPivotBarItemView and specifies that it inherits properties from UIView, which isn't really needed for this tweak
@property (strong, nonatomic) UIButton *navigationButton; //interfaces the property navigationButton of the YTPivotBarItemView item. The UIButton inherits from UIView which has the hidden property that is used later.
@end

%hook YTPivotBarView
- (void)setItemView2:(YTPivotBarItemView *)argument { //shows that the argument passed into this method is a YTPivotBarItemView object
    argument.navigationButton.hidden = YES; //hides the button view
    //there is no need to use return here because it is a void method, just excluding %orig in a hook will make it so the button is never added to the YTPivotBarView
}

- (YTPivotBarItemView *)itemView2 { //shows that the return value of this method is a YTPivotBarItemView
    YTPivotBarItemView *orig = %orig; //gets the original return value of this method
    orig.navigationButton.hidden = YES; //hides the button

    return nil; //returns nil so that the button isn't added to the YTPivotBarView
}
%end
