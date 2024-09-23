@implementation UIStatusBarQuietModeItemView

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("_UIStatusBarActionChangeQuietMode"), 0);

  v4.receiver = self;
  v4.super_class = (Class)UIStatusBarQuietModeItemView;
  -[UIStatusBarItemView dealloc](&v4, sel_dealloc);
}

- (BOOL)updateForNewData:(id)a3 actions:(int)a4
{
  uint64_t v4;
  id v6;
  unsigned int v7;
  void *v8;
  BOOL v9;
  objc_super v11;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = *(unsigned __int8 *)(objc_msgSend(v6, "rawData") + 2529);
  if (self->_inactive != v7 >> 7)
  {
    self->_inactive = v7 >> 7;
    -[UIStatusBarQuietModeItemView setVisible:](self, "setVisible:", -[UIStatusBarItemView isVisible](self, "isVisible"));
  }
  if (!self->_registeredForNotifications)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__triggerAction_, CFSTR("_UIStatusBarActionChangeQuietMode"), 0);

    self->_registeredForNotifications = 1;
  }
  self->_hideForAction = (v4 & 0x20) != 0;
  v11.receiver = self;
  v11.super_class = (Class)UIStatusBarQuietModeItemView;
  v9 = -[UIStatusBarItemView updateForNewData:actions:](&v11, sel_updateForNewData_actions_, v6, v4);

  return v9;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  void *v5;

  if (self->_hideForAction)
  {
    -[UIView setAlpha:](self, "setAlpha:", a3, a4, 0.0);
  }
  else
  {
    -[UIView layer](self, "layer", a3, a4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMask:", 0);

  }
  -[UIStatusBarItemView endDisablingRasterization](self, "endDisablingRasterization");
}

- (void)_triggerAction:(id)a3
{
  void *v4;
  _BOOL4 hideForAction;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  _QWORD v32[5];
  BOOL v33;
  CATransform3D v34;
  CATransform3D v35;
  CATransform3D v36;
  CGRect v37;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIView isDescendantOfView:](self, "isDescendantOfView:", v4))
  {
    -[UIStatusBarItemView beginDisablingRasterization](self, "beginDisablingRasterization");
    hideForAction = self->_hideForAction;
    self->_hideForAction = !hideForAction;
    +[UIImage kitImageNamed:](UIImage, "kitImageNamed:", CFSTR("Item_QuietModeAnimationMask.png"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scale");
    _UIGraphicsBeginImageContextWithOptions(0, 0, 14.0, 14.0, v8);

    +[UIColor blackColor](UIColor, "blackColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFill");

    v37.origin.x = 0.0;
    v37.origin.y = 0.0;
    v37.size.width = 14.0;
    v37.size.height = 14.0;
    UIRectFillUsingBlendMode(v37, kCGBlendModeCopy);
    objc_msgSend(v6, "drawInRect:blendMode:alpha:", 23, 5.0, 0.0, 9.0, 9.0, 1.0);
    _UIGraphicsGetImageFromCurrentImageContext(0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    UIGraphicsEndImageContext();
    -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sizeForMoonMaskVisible:", 1);
    v13 = v12 / 9.0;

    -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sizeForMoonMaskVisible:", 0);
    v16 = v15 / 9.0;

    if (hideForAction)
      v17 = v16;
    else
      v17 = v13;
    memset(&v36.m41, 0, 32);
    if (hideForAction)
      v18 = v13;
    else
      v18 = v16;
    memset(&v36, 0, 96);
    if (hideForAction)
      v19 = CFSTR("Reveal Moon");
    else
      v19 = CFSTR("Hide Moon");
    CATransform3DMakeScale(&v36, v18, v18, 1.0);
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setDelegate:", self);
    objc_msgSend(v20, "setDuration:", 0.5);
    v21 = (void *)MEMORY[0x1E0CB3B18];
    CATransform3DMakeScale(&v35, v17, v17, 1.0);
    objc_msgSend(v21, "valueWithCATransform3D:", &v35);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFromValue:", v22);

    v34 = v36;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v34);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setToValue:", v23);

    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_retainAutorelease(v10);
    objc_msgSend(v24, "setContents:", objc_msgSend(v25, "CGImage"));
    objc_msgSend(v25, "scale");
    objc_msgSend(v24, "setContentsScale:");
    objc_msgSend(v24, "setAnchorPoint:", 1.0, 0.0);
    v26 = *MEMORY[0x1E0C9D538];
    v27 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    objc_msgSend(v25, "size");
    objc_msgSend(v24, "setBounds:", v26, v27, v28, v29);
    -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bounds](self, "bounds");
    objc_msgSend(v30, "positionForMoonMaskInBounds:");
    objc_msgSend(v24, "setPosition:");

    v34 = v36;
    objc_msgSend(v24, "setTransform:", &v34);
    objc_msgSend(v24, "addAnimation:forKey:", v20, v19);
    -[UIView layer](self, "layer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setMask:", v24);

    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __47__UIStatusBarQuietModeItemView__triggerAction___block_invoke;
    v32[3] = &unk_1E16B1B78;
    v32[4] = self;
    v33 = hideForAction;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v32);

  }
}

uint64_t __47__UIStatusBarQuietModeItemView__triggerAction___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "setVisible:", *(unsigned __int8 *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "_visibleAlpha");
  return objc_msgSend(v2, "setAlpha:");
}

- (void)setVisible:(BOOL)a3 frame:(CGRect)a4 duration:(double)a5
{
  objc_super v5;

  *(_QWORD *)&a3 = !self->_hideForAction && a3;
  v5.receiver = self;
  v5.super_class = (Class)UIStatusBarQuietModeItemView;
  -[UIStatusBarItemView setVisible:frame:duration:](&v5, sel_setVisible_frame_duration_, a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5);
}

- (double)_visibleAlpha
{
  double result;

  result = 0.3;
  if (!self->_inactive)
    return 1.0;
  return result;
}

- (void)setVisible:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UIStatusBarQuietModeItemView;
  -[UIStatusBarItemView setVisible:](&v6, sel_setVisible_);
  v5 = 0.0;
  if (v3)
    -[UIStatusBarQuietModeItemView _visibleAlpha](self, "_visibleAlpha", 0.0);
  -[UIView setAlpha:](self, "setAlpha:", v5);
}

- (id)accessibilityHUDRepresentation
{
  void *v3;
  void *v4;
  UIAccessibilityHUDItem *v5;

  -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityHUDImageNamed:", CFSTR("QuietMode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:scaleImage:]([UIAccessibilityHUDItem alloc], "initWithTitle:image:imageInsets:scaleImage:", 0, v4, 1, 0.0, 0.0, 0.0, 0.0);
  -[UIAccessibilityHUDItem setDisabledAppearance:](v5, "setDisabledAppearance:", self->_inactive);

  return v5;
}

@end
