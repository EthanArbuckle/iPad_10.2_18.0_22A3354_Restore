@implementation UIApplicationRotationFollowingControllerView

- (UIApplicationRotationFollowingControllerView)init
{
  UIApplicationRotationFollowingControllerView *v2;
  UIApplicationRotationFollowingControllerView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIApplicationRotationFollowingControllerView;
  v2 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v3 = v2;
  if (v2)
  {
    -[UIView setOpaque:](v2, "setOpaque:", 0);
    +[UIColor clearColor](UIColor, "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3, "setBackgroundColor:", v4);

  }
  return v3;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  UIApplicationRotationFollowingControllerView *v5;
  UIApplicationRotationFollowingControllerView *v6;
  UIApplicationRotationFollowingControllerView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIApplicationRotationFollowingControllerView;
  -[UIView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (UIApplicationRotationFollowingControllerView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
    v7 = 0;
  else
    v7 = v5;

  return v7;
}

@end
