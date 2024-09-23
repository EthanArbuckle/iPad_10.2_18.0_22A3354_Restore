@implementation SBFluidSwitcherTouchPassThroughView

- (void)setNeedsLayout
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SBFluidSwitcherTouchPassThroughView;
  -[SBFluidSwitcherTouchPassThroughView setNeedsLayout](&v2, sel_setNeedsLayout);
}

@end
