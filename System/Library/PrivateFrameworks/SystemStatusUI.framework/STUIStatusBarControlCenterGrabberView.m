@implementation STUIStatusBarControlCenterGrabberView

- (STUIStatusBarControlCenterGrabberView)initWithFrame:(CGRect)a3
{
  STUIStatusBarControlCenterGrabberView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STUIStatusBarControlCenterGrabberView;
  v3 = -[STUIStatusBarRoundedCornerView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[STUIStatusBarControlCenterGrabberView setClipsToBounds:](v3, "setClipsToBounds:", 1);
  return v3;
}

- (void)applyStyleAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "imageTintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "colorWithAlphaComponent:", 0.5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarControlCenterGrabberView setBackgroundColor:](self, "setBackgroundColor:", v6);

  v7 = objc_msgSend(v4, "mode");
  -[STUIStatusBarControlCenterGrabberView layer](self, "layer");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (_QWORD *)MEMORY[0x1E0CD2E98];
  if (v7 == 2)
    v8 = (_QWORD *)MEMORY[0x1E0CD2EA0];
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCompositingFilter:", v9);

}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (BOOL)isUserInteractionEnabled
{
  return 0;
}

@end
