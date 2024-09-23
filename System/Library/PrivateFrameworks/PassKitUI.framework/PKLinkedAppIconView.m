@implementation PKLinkedAppIconView

- (PKLinkedAppIconView)initWithCoder:(id)a3
{

  return 0;
}

- (PKLinkedAppIconView)initWithFrame:(CGRect)a3
{
  return -[PKLinkedAppIconView initWithLinkedApplication:](self, "initWithLinkedApplication:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PKLinkedAppIconView)initWithLinkedApplication:(id)a3
{
  id v5;
  PKLinkedAppIconView *v6;
  PKLinkedAppIconView *v7;
  id *p_linkedApplication;
  WLEasyToHitCustomButton *v9;
  WLEasyToHitCustomButton *iconButton;
  void *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKLinkedAppIconView;
  v6 = -[PKLinkedAppIconView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    p_linkedApplication = (id *)&v6->_linkedApplication;
    objc_storeStrong((id *)&v6->_linkedApplication, a3);
    objc_msgSend(*p_linkedApplication, "addObserver:", v7);
    v9 = -[WLEasyToHitCustomButton initWithMargins:]([WLEasyToHitCustomButton alloc], "initWithMargins:", 10.0, 10.0, 10.0, 10.0);
    iconButton = v7->_iconButton;
    v7->_iconButton = v9;

    -[WLEasyToHitCustomButton addTarget:action:forControlEvents:](v7->_iconButton, "addTarget:action:forControlEvents:", v7, sel_tapped_, 64);
    -[WLEasyToHitCustomButton setAlpha:](v7->_iconButton, "setAlpha:", 0.0);
    -[WLEasyToHitCustomButton setMargins:](v7->_iconButton, "setMargins:", 10.0, 10.0, 10.0, 10.0);
    -[WLEasyToHitCustomButton setAccessibilityIdentifier:](v7->_iconButton, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67EE8]);
    objc_msgSend(*p_linkedApplication, "iconImage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKLinkedAppIconView _updateWithIconImage:animated:](v7, "_updateWithIconImage:animated:", v11, 0);

    -[PKLinkedAppIconView setAccessibilityIgnoresInvertColors:](v7, "setAccessibilityIgnoresInvertColors:", 1);
    -[PKLinkedAppIconView setAccessibilityIdentifier:](v7, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67D00]);
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[PKLinkedApplication removeObserver:](self->_linkedApplication, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)PKLinkedAppIconView;
  -[PKLinkedAppIconView dealloc](&v3, sel_dealloc);
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKLinkedAppIconView;
  -[PKLinkedAppIconView didMoveToWindow](&v4, sel_didMoveToWindow);
  -[PKLinkedAppIconView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[PKLinkedApplication reloadApplicationStateIfNecessary](self->_linkedApplication, "reloadApplicationStateIfNecessary");
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  PKLinkedAppIconView *v6;
  WLEasyToHitCustomButton *iconButton;
  id v8;

  y = a3.y;
  x = a3.x;
  v6 = self;
  iconButton = self->_iconButton;
  v8 = a4;
  -[PKLinkedAppIconView convertPoint:toView:](v6, "convertPoint:toView:", iconButton, x, y);
  LOBYTE(v6) = -[WLEasyToHitCustomButton pointInside:withEvent:](iconButton, "pointInside:withEvent:", v8);

  return (char)v6;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  if (self->_iconImage)
    -[UIImage size](self->_iconImage, "size");
  else
    -[PKLinkedApplication expectedIconSize](self->_linkedApplication, "expectedIconSize");
  result.height = v3;
  result.width = v2;
  return result;
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
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v23;
  double v24;
  double v25;
  CATransform3D v26;
  CATransform3D v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)PKLinkedAppIconView;
  -[PKLinkedAppIconView layoutSubviews](&v28, sel_layoutSubviews);
  -[PKLinkedAppIconView bounds](self, "bounds");
  -[UIImage size](self->_iconImage, "size");
  v4 = v3;
  v6 = v5;
  PKSizeAspectFit();
  v9 = 1.0;
  v10 = 1.0;
  if (v4 != 0.0)
    v10 = fmin(v7 / v4, 1.0);
  if (v6 != 0.0)
    v9 = fmin(v8 / v6, 1.0);
  v24 = v8;
  v25 = v7;
  PKSizeAlignedInRect();
  v12 = v11;
  v14 = v13;
  -[WLEasyToHitCustomButton layer](self->_iconButton, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "anchorPoint");
  v17 = v16;
  v19 = v18;
  objc_msgSend(v15, "bounds");
  if (v21 != v4 || v20 != v6)
  {
    objc_msgSend(v15, "setBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v4, v6);
    -[WLEasyToHitCustomButton setNeedsLayout](self->_iconButton, "setNeedsLayout");
  }
  memset(&v27, 0, sizeof(v27));
  v23 = fmin(v10, v9);
  CATransform3DMakeScale(&v27, v23, v23, 1.0);
  v26 = v27;
  objc_msgSend(v15, "setTransform:", &v26);
  objc_msgSend(v15, "setPosition:", v12 + v17 * v25, v14 + v19 * v24);

}

- (void)_updateWithIconImage:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  UIImage *v7;
  UIImage **p_iconImage;
  void *v9;
  BOOL v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  _QWORD v23[4];
  id v24;

  v4 = a4;
  v7 = (UIImage *)a3;
  p_iconImage = &self->_iconImage;
  if (self->_iconImage != v7)
  {
    objc_storeStrong((id *)&self->_iconImage, a3);
    -[WLEasyToHitCustomButton superview](self->_iconButton, "superview");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      v10 = *p_iconImage == 0;
    else
      v10 = 0;
    if (v10)
    {
      v11 = MEMORY[0x1E0C809B0];
      if (v4)
      {
        -[WLEasyToHitCustomButton snapshotViewAfterScreenUpdates:](self->_iconButton, "snapshotViewAfterScreenUpdates:", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[WLEasyToHitCustomButton frame](self->_iconButton, "frame");
        objc_msgSend(v12, "setFrame:");
        objc_msgSend(v9, "addSubview:", v12);
        objc_msgSend(MEMORY[0x1E0D676D0], "springAnimationWithKeyPath:", CFSTR("opacity"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "alpha");
        objc_msgSend(v13, "pkui_updateForAdditiveAnimationFromScalar:toScalar:");
        v23[0] = v11;
        v23[1] = 3221225472;
        v23[2] = __53__PKLinkedAppIconView__updateWithIconImage_animated___block_invoke;
        v23[3] = &unk_1E3E62288;
        v24 = v12;
        v14 = v12;
        objc_msgSend(v13, "pkui_setCompletionHandler:", v23);
        objc_msgSend(v14, "layer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (id)objc_msgSend(v15, "pkui_addAdditiveAnimation:", v13);

        v11 = MEMORY[0x1E0C809B0];
        objc_msgSend(v14, "setAlpha:", 0.0);

      }
      v22[0] = v11;
      v22[1] = 3221225472;
      v22[2] = __53__PKLinkedAppIconView__updateWithIconImage_animated___block_invoke_2;
      v22[3] = &unk_1E3E612E8;
      v22[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v22);
    }
    -[WLEasyToHitCustomButton setImage:forState:](self->_iconButton, "setImage:forState:");
    if (*p_iconImage)
    {
      -[PKLinkedAppIconView setNeedsLayout](self, "setNeedsLayout");
      if (!v9)
      {
        -[PKLinkedAppIconView layoutIfNeeded](self, "layoutIfNeeded");
        -[WLEasyToHitCustomButton alpha](self->_iconButton, "alpha");
        v18 = v17;
        -[PKLinkedAppIconView addSubview:](self, "addSubview:", self->_iconButton);
        -[WLEasyToHitCustomButton setAlpha:](self->_iconButton, "setAlpha:", 1.0);
        if (v4 && v18 != 1.0)
        {
          objc_msgSend(MEMORY[0x1E0D676D0], "springAnimationWithKeyPath:", CFSTR("opacity"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v18, 1.0);
          -[WLEasyToHitCustomButton layer](self->_iconButton, "layer");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (id)objc_msgSend(v20, "pkui_addAdditiveAnimation:", v19);

        }
      }
    }

  }
}

uint64_t __53__PKLinkedAppIconView__updateWithIconImage_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

void __53__PKLinkedAppIconView__updateWithIconImage_animated___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "layer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllAnimations");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setAlpha:", 0.0);
  objc_msgSend(v2, "clearHasBeenCommitted");

}

- (void)tapped:(id)a3
{
  PKLinkedApplication *linkedApplication;
  id v5;

  if ((-[PKLinkedApplication state](self->_linkedApplication, "state", a3) & 0xFFFFFFFFFFFFFFFDLL) != 0)
  {
    linkedApplication = self->_linkedApplication;
    -[UIView pkui_viewControllerFromResponderChain](self, "pkui_viewControllerFromResponderChain");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[PKLinkedApplication openApplication:](linkedApplication, "openApplication:", v5);

  }
}

- (void)linkedApplicationDidChangeState:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (!objc_msgSend(v6, "state"))
  {
    -[PKLinkedAppIconView window](self, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      objc_msgSend(v6, "reloadApplicationStateIfNecessary");
  }
  objc_msgSend(v6, "iconImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKLinkedAppIconView _updateWithIconImage:animated:](self, "_updateWithIconImage:animated:", v5, 1);

}

- (PKLinkedApplication)linkedApplication
{
  return self->_linkedApplication;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedApplication, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_iconButton, 0);
}

@end
