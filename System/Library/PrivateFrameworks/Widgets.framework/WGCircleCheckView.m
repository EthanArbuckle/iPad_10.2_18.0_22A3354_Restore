@implementation WGCircleCheckView

- (WGCircleCheckView)initWithFrame:(CGRect)a3
{
  WGCircleCheckView *v3;
  WGCircleCheckView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WGCircleCheckView;
  v3 = -[WGCircleCheckView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[WGCircleCheckView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
  return v4;
}

- (BOOL)isChecked
{
  return -[WGCircleCheckView _isFrozen](self, "_isFrozen") || -[WGCheckView isChecked](self->_checkView, "isChecked");
}

- (void)setChecked:(BOOL)a3
{
  _BOOL8 v3;
  _QWORD v5[4];
  id v6;
  BOOL v7;
  id location;

  v3 = a3;
  objc_initWeak(&location, self);
  if (v3 && (objc_msgSend(MEMORY[0x24BDF6F90], "_isInAnimationBlock") & 1) == 0)
  {
    -[WGCircleCheckView _setFrozen:](self, "_setFrozen:", 1);
  }
  else
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __32__WGCircleCheckView_setChecked___block_invoke;
    v5[3] = &unk_24D732408;
    v7 = v3;
    objc_copyWeak(&v6, &location);
    -[WGCircleCheckView _setChecked:completion:](self, "_setChecked:completion:", v3, v5);
    objc_destroyWeak(&v6);
  }
  objc_destroyWeak(&location);
}

void __32__WGCircleCheckView_setChecked___block_invoke(uint64_t a1, int a2)
{
  BOOL v2;
  id WeakRetained;

  if (*(_BYTE *)(a1 + 40))
    v2 = a2 == 0;
  else
    v2 = 1;
  if (!v2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_setFrozen:", 1);

  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 20.0;
  v4 = 20.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  -[WGCircleCheckView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = -[WGCircleCheckView _configureCircleViewIfNecessary](self, "_configureCircleViewIfNecessary");
    -[WGCircleCheckView _configureCheckViewIfNecessary](self, "_configureCheckViewIfNecessary");
    -[WGCircleCheckView bounds](self, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[UIImageView setFrame:](self->_circleView, "setFrame:");
    -[WGCheckView setFrame:](self->_checkView, "setFrame:", v7, v9, v11, v13);
  }
}

- (id)_configureCircleViewIfNecessary
{
  UIImageView *circleView;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  UIImageView *v10;
  UIImageView *v11;

  circleView = self->_circleView;
  if (!circleView)
  {
    +[WGMappedImageCache sharedCache](WGMappedImageCache, "sharedCache");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x24BDD17C8];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@.circle"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageForKey:generatingIfNecessaryWithBlock:", v8, &__block_literal_global_8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v9);
    v11 = self->_circleView;
    self->_circleView = v10;

    -[UIImageView setHidden:](self->_circleView, "setHidden:", 1);
    -[WGCircleCheckView addSubview:](self, "addSubview:", self->_circleView);
    -[WGCircleCheckView sendSubviewToBack:](self, "sendSubviewToBack:", self->_circleView);

    circleView = self->_circleView;
  }
  return circleView;
}

CGContext *__52__WGCircleCheckView__configureCircleViewIfNecessary__block_invoke()
{
  double v0;
  CGContext *CurrentContext;
  CGContext *v2;
  const CGPath *v3;
  void *v4;
  CGSize v6;
  CGRect v7;

  v0 = _WGMainScreenScale();
  v6.width = 20.0;
  v6.height = 20.0;
  UIGraphicsBeginImageContextWithOptions(v6, 0, v0);
  CurrentContext = UIGraphicsGetCurrentContext();
  if (CurrentContext)
  {
    v2 = CurrentContext;
    BSRectWithSize();
    v3 = CGPathCreateWithEllipseInRect(v7, 0);
    CGContextAddPath(v2, v3);
    CGPathRelease(v3);
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.35);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFill");

    CGContextFillPath(v2);
    UIGraphicsGetImageFromCurrentImageContext();
    CurrentContext = (CGContext *)objc_claimAutoreleasedReturnValue();
  }
  return CurrentContext;
}

- (void)_configureCheckViewIfNecessary
{
  WGCheckView *v3;
  WGCheckView *checkView;

  if (!self->_checkView)
  {
    v3 = objc_alloc_init(WGCheckView);
    checkView = self->_checkView;
    self->_checkView = v3;

    -[WGCircleCheckView addSubview:](self, "addSubview:", self->_checkView);
    -[WGCircleCheckView bringSubviewToFront:](self, "bringSubviewToFront:", self->_checkView);
  }
}

- (void)_setChecked:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  NSObject *v8;
  double v9;
  double v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  NSObject *v18;
  _QWORD v19[5];
  _QWORD v20[4];
  NSObject *v21;
  _QWORD v22[5];
  _QWORD v23[5];

  v4 = a3;
  v6 = a4;
  if (-[WGCircleCheckView isChecked](self, "isChecked") != v4)
  {
    if (v4)
    {
      if (objc_msgSend(MEMORY[0x24BDF6F90], "_isInAnimationBlock"))
      {
        v7 = MEMORY[0x24BDAC760];
        v23[0] = MEMORY[0x24BDAC760];
        v23[1] = 3221225472;
        v23[2] = __44__WGCircleCheckView__setChecked_completion___block_invoke;
        v23[3] = &unk_24D7314D8;
        v23[4] = self;
        objc_msgSend(MEMORY[0x24BDF6F90], "performWithoutAnimation:", v23);
        v8 = dispatch_group_create();
        objc_msgSend(MEMORY[0x24BDF6F90], "inheritedAnimationDuration");
        v10 = v9;
        dispatch_group_enter(v8);
        v11 = (void *)MEMORY[0x24BDF6F90];
        v22[0] = v7;
        v22[1] = 3221225472;
        v22[2] = __44__WGCircleCheckView__setChecked_completion___block_invoke_2;
        v22[3] = &unk_24D7314D8;
        v22[4] = self;
        v20[0] = v7;
        v20[1] = 3221225472;
        v20[2] = __44__WGCircleCheckView__setChecked_completion___block_invoke_3;
        v20[3] = &unk_24D732450;
        v12 = v8;
        v21 = v12;
        objc_msgSend(v11, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0, v22, v20, v10, v10 * 0.5, 3.0, 1560.0, 600.0, 0.0);
        dispatch_group_enter(v12);
        v13 = (void *)MEMORY[0x24BDF6F90];
        v19[0] = v7;
        v19[1] = 3221225472;
        v19[2] = __44__WGCircleCheckView__setChecked_completion___block_invoke_4;
        v19[3] = &unk_24D7314D8;
        v19[4] = self;
        v17[0] = v7;
        v17[1] = 3221225472;
        v17[2] = __44__WGCircleCheckView__setChecked_completion___block_invoke_5;
        v17[3] = &unk_24D732450;
        v14 = v12;
        v18 = v14;
        objc_msgSend(v13, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0, v19, v17, v10, v10 + 0.01, 3.0, 1560.0, 600.0, 0.0);
        if (v6)
        {
          v15[0] = v7;
          v15[1] = 3221225472;
          v15[2] = __44__WGCircleCheckView__setChecked_completion___block_invoke_6;
          v15[3] = &unk_24D7318B8;
          v16 = v6;
          dispatch_group_notify(v14, MEMORY[0x24BDAC9B8], v15);

        }
        goto LABEL_13;
      }
      -[WGCircleCheckView layoutIfNeeded](self, "layoutIfNeeded");
      -[UIImageView setHidden:](self->_circleView, "setHidden:", 0);
      -[WGCheckView setChecked:](self->_checkView, "setChecked:", 1);
      if (!v6)
        goto LABEL_13;
    }
    else
    {
      -[WGCircleCheckView _setFrozen:](self, "_setFrozen:", 0);
      if (!v6)
        goto LABEL_13;
    }
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
    goto LABEL_13;
  }
  if (v6)
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
LABEL_13:

}

uint64_t __44__WGCircleCheckView__setChecked_completion___block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;

  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 416);
  CGAffineTransformMakeScale(&v4, 0.0, 0.0);
  objc_msgSend(v2, "setTransform:", &v4);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setHidden:", 0);
}

uint64_t __44__WGCircleCheckView__setChecked_completion___block_invoke_2(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 416);
  v2 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v4[0] = *MEMORY[0x24BDBD8B8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  return objc_msgSend(v1, "setTransform:", v4);
}

void __44__WGCircleCheckView__setChecked_completion___block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __44__WGCircleCheckView__setChecked_completion___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setChecked:", 1);
}

void __44__WGCircleCheckView__setChecked_completion___block_invoke_5(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __44__WGCircleCheckView__setChecked_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_isFrozen
{
  void *v2;
  void *v3;
  BOOL v4;

  -[WGCircleCheckView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)_setFrozen:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UIImageView *circleView;
  WGCheckView *checkView;
  void *v14;
  _QWORD v15[4];
  id v16;
  id location;

  v3 = a3;
  if (-[WGCircleCheckView _isFrozen](self, "_isFrozen") != a3)
  {
    if (v3)
    {
      objc_initWeak(&location, self);
      +[WGMappedImageCache sharedCache](WGMappedImageCache, "sharedCache");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x24BDD17C8];
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%@.composite"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __32__WGCircleCheckView__setFrozen___block_invoke;
      v15[3] = &unk_24D732478;
      objc_copyWeak(&v16, &location);
      objc_msgSend(v5, "imageForKey:generatingIfNecessaryWithBlock:", v9, v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[WGCircleCheckView layer](self, "layer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setContents:", objc_msgSend(objc_retainAutorelease(v10), "CGImage"));

        -[UIImageView removeFromSuperview](self->_circleView, "removeFromSuperview");
        circleView = self->_circleView;
        self->_circleView = 0;

        -[WGCheckView removeFromSuperview](self->_checkView, "removeFromSuperview");
        checkView = self->_checkView;
        self->_checkView = 0;

      }
      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
    else
    {
      -[WGCircleCheckView layer](self, "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setContents:", 0);

      -[WGCircleCheckView setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

id __32__WGCircleCheckView__setFrozen___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  void *CurrentContext;
  void *v10;
  void *v11;
  CGSize v13;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setChecked:completion:", 1, 0);
  objc_msgSend(WeakRetained, "_circleView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "size");
  v5 = v4;
  v7 = v6;
  v8 = _WGMainScreenScale();
  v13.width = v5;
  v13.height = v7;
  UIGraphicsBeginImageContextWithOptions(v13, 0, v8);
  CurrentContext = UIGraphicsGetCurrentContext();
  if (CurrentContext)
  {
    objc_msgSend(v3, "drawAtPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
    objc_msgSend(WeakRetained, "_checkView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "renderInContext:", CurrentContext);

    UIGraphicsGetImageFromCurrentImageContext();
    CurrentContext = (void *)objc_claimAutoreleasedReturnValue();
  }

  return CurrentContext;
}

- (UIImageView)_circleView
{
  return self->_circleView;
}

- (void)setCircleView:(id)a3
{
  objc_storeStrong((id *)&self->_circleView, a3);
}

- (WGCheckView)_checkView
{
  return self->_checkView;
}

- (void)setCheckView:(id)a3
{
  objc_storeStrong((id *)&self->_checkView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkView, 0);
  objc_storeStrong((id *)&self->_circleView, 0);
}

@end
