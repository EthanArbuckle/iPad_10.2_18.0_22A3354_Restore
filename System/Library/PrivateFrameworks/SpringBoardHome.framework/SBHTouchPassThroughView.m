@implementation SBHTouchPassThroughView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  SBHTouchPassThroughView *v5;
  SBHTouchPassThroughView *v6;
  SBHTouchPassThroughView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBHTouchPassThroughView;
  -[SBHTouchPassThroughView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (SBHTouchPassThroughView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
    v7 = 0;
  else
    v7 = v5;

  return v7;
}

@end
