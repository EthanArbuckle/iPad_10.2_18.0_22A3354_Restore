@implementation PKNavigationBar

- (void)didAddSubview:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKNavigationBar;
  v3 = a3;
  -[PKNavigationBar didAddSubview:](&v4, sel_didAddSubview_, v3);
  objc_msgSend(v3, "setExclusiveTouch:", 1, v4.receiver, v4.super_class);

}

@end
