@implementation PXAssetsSectionBlurView

- (PXAssetsSectionBlurView)initWithFrame:(CGRect)a3
{
  PXAssetsSectionBlurView *v3;
  UIVisualEffectView *v4;
  UIVisualEffectView *blurEffectView;
  UIView *v6;
  UIView *dimmingView;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXAssetsSectionBlurView;
  v3 = -[PXAssetsSectionBlurView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E0DC3F58]);
    blurEffectView = v3->_blurEffectView;
    v3->_blurEffectView = v4;

    -[PXAssetsSectionBlurView addSubview:](v3, "addSubview:", v3->_blurEffectView);
    v6 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    dimmingView = v3->_dimmingView;
    v3->_dimmingView = v6;

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->_dimmingView, "setBackgroundColor:", v8);

    -[PXAssetsSectionBlurView addSubview:](v3, "addSubview:", v3->_dimmingView);
  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  -[PXAssetsSectionBlurView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PXAssetsSectionBlurView blurEffectView](self, "blurEffectView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[PXAssetsSectionBlurView dimmingView](self, "dimmingView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (void)setUserData:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  if (v18)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "px_descriptionForAssertionMessage");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsSectionBlurView.m"), 53, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("userData"), v16, v17);

    }
  }
  objc_msgSend(v18, "intensity");
  v6 = v5;
  objc_msgSend(v18, "maximumBlurRadius");
  v8 = v6 * v7;
  objc_msgSend(v18, "maximumDimmingFraction");
  v10 = v6 * v9;
  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithBlurRadius:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAssetsSectionBlurView blurEffectView](self, "blurEffectView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setEffect:", v11);

  -[PXAssetsSectionBlurView dimmingView](self, "dimmingView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAlpha:", v10);

}

- (CGRect)clippingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->clippingRect.origin.x;
  y = self->clippingRect.origin.y;
  width = self->clippingRect.size.width;
  height = self->clippingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setClippingRect:(CGRect)a3
{
  self->clippingRect = a3;
}

- (NSCopying)userData
{
  return self->userData;
}

- (UIVisualEffectView)blurEffectView
{
  return self->_blurEffectView;
}

- (UIView)dimmingView
{
  return self->_dimmingView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_blurEffectView, 0);
  objc_storeStrong((id *)&self->userData, 0);
}

@end
