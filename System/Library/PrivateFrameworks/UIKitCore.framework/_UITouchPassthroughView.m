@implementation _UITouchPassthroughView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  _UITouchPassthroughView *v5;
  _UITouchPassthroughView *v6;
  _UITouchPassthroughView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UITouchPassthroughView;
  -[UIView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (_UITouchPassthroughView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
    v7 = 0;
  else
    v7 = v5;

  return v7;
}

@end
