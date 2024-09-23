@implementation SBReduceMotionSwitcherModifier

- (id)handleReduceMotionChangedEvent:(id)a3
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBReduceMotionSwitcherModifier;
  -[SBSwitcherModifier handleReduceMotionChangedEvent:](&v6, sel_handleReduceMotionChangedEvent_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[SBReduceMotionSwitcherModifier isReduceMotionEnabled](self, "isReduceMotionEnabled") & 1) == 0)
    -[SBChainableModifier setState:](self, "setState:", 1);
  return v4;
}

- (double)homeScreenScale
{
  return 1.0;
}

- (double)wallpaperScale
{
  return 1.0;
}

@end
