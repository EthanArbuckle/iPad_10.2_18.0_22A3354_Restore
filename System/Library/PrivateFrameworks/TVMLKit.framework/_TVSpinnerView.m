@implementation _TVSpinnerView

- (_TVSpinnerView)initWithFrame:(CGRect)a3
{
  return -[_TVSpinnerView initWithFrame:color:](self, "initWithFrame:color:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TVSpinnerView)initWithFrame:(CGRect)a3 color:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  _TVSpinnerView *v11;
  _TVSpinnerView *v12;
  void **p_color;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  UIView *spinnerContainer;
  double v21;
  double v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  UIView *spinnerOverlayContainer;
  void *v31;
  uint64_t v32;
  id *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  objc_super v39;
  CGRect v40;
  CGRect v41;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v39.receiver = self;
  v39.super_class = (Class)_TVSpinnerView;
  v11 = -[_TVSpinnerView initWithFrame:](&v39, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (!v11)
    goto LABEL_14;
  p_color = (void **)&v11->_color;
  objc_storeStrong((id *)&v11->_color, a4);
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "_graphicsQuality") != 10)
    goto LABEL_5;
  v15 = *p_color;

  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.6);
    v16 = objc_claimAutoreleasedReturnValue();
    v14 = *p_color;
    *p_color = (void *)v16;
LABEL_5:

  }
  v17 = *p_color;
  v18 = objc_alloc(MEMORY[0x24BDF6F90]);
  -[_TVSpinnerView bounds](v12, "bounds");
  v19 = objc_msgSend(v18, "initWithFrame:");
  spinnerContainer = v12->_spinnerContainer;
  v12->_spinnerContainer = (UIView *)v19;

  -[UIView setAutoresizingMask:](v12->_spinnerContainer, "setAutoresizingMask:", 18);
  -[UIView setContentMode:](v12->_spinnerContainer, "setContentMode:", 1);
  if (v17)
  {
    v40.origin.x = x;
    v40.origin.y = y;
    v40.size.width = width;
    v40.size.height = height;
    v21 = CGRectGetWidth(v40);
    v41.origin.x = x;
    v41.origin.y = y;
    v41.size.width = width;
    v41.size.height = height;
    v22 = CGRectGetHeight(v41);
    if (v21 >= v22)
      v22 = v21;
    _TVCreateSpinnerImage(v10, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView layer](v12->_spinnerContainer, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_retainAutorelease(v23);
    objc_msgSend(v24, "setContents:", objc_msgSend(v25, "CGImage"));

    -[UIView layer](v12->_spinnerContainer, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "scale");
    objc_msgSend(v26, "setContentsScale:");

    -[_TVSpinnerView addSubview:](v12, "addSubview:", v12->_spinnerContainer);
  }
  else
  {
    -[UIView layer](v12->_spinnerContainer, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setCompositingFilter:", *MEMORY[0x24BDE5BC0]);

    -[_TVSpinnerView addSubview:](v12, "addSubview:", v12->_spinnerContainer);
    v28 = objc_alloc(MEMORY[0x24BDF6F90]);
    -[_TVSpinnerView bounds](v12, "bounds");
    v29 = objc_msgSend(v28, "initWithFrame:");
    spinnerOverlayContainer = v12->_spinnerOverlayContainer;
    v12->_spinnerOverlayContainer = (UIView *)v29;

    -[UIView setAutoresizingMask:](v12->_spinnerOverlayContainer, "setAutoresizingMask:", 18);
    -[UIView setContentMode:](v12->_spinnerOverlayContainer, "setContentMode:", 1);
    -[_TVSpinnerView traitCollection](v12, "traitCollection");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "userInterfaceStyle");
    v33 = (id *)MEMORY[0x24BDE5BD8];
    if (v32 != 2)
      v33 = (id *)MEMORY[0x24BDE5BD0];
    v34 = *v33;

    -[UIView layer](v12->_spinnerOverlayContainer, "layer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setCompositingFilter:", v34);

    -[_TVSpinnerView addSubview:](v12, "addSubview:", v12->_spinnerOverlayContainer);
    -[_TVSpinnerView traitCollection](v12, "traitCollection");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVSpinnerView _updateImagesForTraitCollection:](v12, "_updateImagesForTraitCollection:", v36);

    -[_TVSpinnerView layer](v12, "layer");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setAllowsGroupOpacity:", 0);
    objc_msgSend(v25, "setAllowsGroupBlending:", 0);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addObserver:selector:name:object:", v12, sel__applicationDidBecomeActiveNotification_, *MEMORY[0x24BDF7510], 0);
    objc_msgSend(v37, "addObserver:selector:name:object:", v12, sel__applicationWillResignActiveNotification_, *MEMORY[0x24BDF75D8], 0);

  }
LABEL_14:

  return v12;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7510], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF75D8], 0);

  v4.receiver = self;
  v4.super_class = (Class)_TVSpinnerView;
  -[_TVSpinnerView dealloc](&v4, sel_dealloc);
}

- (void)willMoveToWindow:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_TVSpinnerView;
  -[_TVSpinnerView willMoveToWindow:](&v5, sel_willMoveToWindow_);
  if (!a3)
  {
    self->_shouldResumeAnimation = self->_animating;
    -[_TVSpinnerView stopAnimating](self, "stopAnimating");
  }
}

- (void)didMoveToWindow
{
  void *v3;
  _BOOL4 shouldResumeAnimation;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_TVSpinnerView;
  -[_TVSpinnerView didMoveToWindow](&v5, sel_didMoveToWindow);
  -[_TVSpinnerView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    shouldResumeAnimation = self->_shouldResumeAnimation;

    if (shouldResumeAnimation)
      -[_TVSpinnerView startAnimating](self, "startAnimating");
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id *v12;
  id v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_TVSpinnerView;
  -[_TVSpinnerView traitCollectionDidChange:](&v14, sel_traitCollectionDidChange_, v4);
  -[_TVSpinnerView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "userInterfaceStyle"))
  {
LABEL_6:

    goto LABEL_7;
  }
  v6 = objc_msgSend(v4, "userInterfaceStyle");
  -[_TVSpinnerView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceStyle");

  if (v6 != v8)
  {
    -[_TVSpinnerView traitCollection](self, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVSpinnerView _updateImagesForTraitCollection:](self, "_updateImagesForTraitCollection:", v9);

    -[_TVSpinnerView traitCollection](self, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "userInterfaceStyle");
    v12 = (id *)MEMORY[0x24BDE5BD8];
    if (v11 != 2)
      v12 = (id *)MEMORY[0x24BDE5BD0];
    v13 = *v12;

    -[UIView layer](self->_spinnerOverlayContainer, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCompositingFilter:", v13);

    goto LABEL_6;
  }
LABEL_7:

}

- (void)_applicationDidBecomeActiveNotification:(id)a3
{
  void *v4;
  _BOOL4 shouldResumeAnimation;

  -[_TVSpinnerView window](self, "window", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    shouldResumeAnimation = self->_shouldResumeAnimation;

    if (shouldResumeAnimation)
      -[_TVSpinnerView startAnimating](self, "startAnimating");
  }
}

- (void)_applicationWillResignActiveNotification:(id)a3
{
  void *v4;

  -[_TVSpinnerView window](self, "window", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    self->_shouldResumeAnimation = self->_animating;
    -[_TVSpinnerView stopAnimating](self, "stopAnimating");
  }
}

- (void)startAnimating
{
  void *v3;

  if (!self->_animating)
  {
    -[_TVSpinnerView window](self, "window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      self->_animating = 1;
      -[_TVSpinnerView _addAnimations](self, "_addAnimations");
    }
    else
    {
      self->_shouldResumeAnimation = 1;
    }
  }
}

- (void)stopAnimating
{
  if (self->_animating)
  {
    self->_animating = 0;
    -[_TVSpinnerView _removeAnimations](self, "_removeAnimations");
  }
}

- (id)_spinnerImageForTraitCollection:(id)a3 size:(CGSize)a4 alpha:(double)a5
{
  double height;
  double width;
  id v8;
  uint64_t v9;
  double v10;
  void *v11;
  void *v12;

  height = a4.height;
  width = a4.width;
  v8 = a3;
  if (objc_msgSend(v8, "userInterfaceStyle") == 2
    || (v9 = objc_msgSend(v8, "userInterfaceStyle"), v10 = 0.0, v9 == 1000))
  {
    v10 = 1.0;
  }
  if (width >= height)
    height = width;
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", v10, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _TVCreateSpinnerImage(v11, height);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)_updateImagesForTraitCollection:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;

  v4 = a3;
  -[_TVSpinnerView frame](self, "frame");
  -[_TVSpinnerView _spinnerImageForTraitCollection:size:alpha:](self, "_spinnerImageForTraitCollection:size:alpha:", v4, v5, v6, 0.75);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView layer](self->_spinnerContainer, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_retainAutorelease(v7);
  objc_msgSend(v8, "setContents:", objc_msgSend(v16, "CGImage"));

  -[UIView layer](self->_spinnerContainer, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "scale");
  objc_msgSend(v9, "setContentsScale:");

  -[_TVSpinnerView frame](self, "frame");
  -[_TVSpinnerView _spinnerImageForTraitCollection:size:alpha:](self, "_spinnerImageForTraitCollection:size:alpha:", v4, v10, v11, 0.3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIView layer](self->_spinnerOverlayContainer, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_retainAutorelease(v12);
  objc_msgSend(v13, "setContents:", objc_msgSend(v14, "CGImage"));

  -[UIView layer](self->_spinnerOverlayContainer, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "scale");
  objc_msgSend(v15, "setContentsScale:");

}

- (void)_addAnimations
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  -[_TVSpinnerView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animationForKey:", CFSTR("repeatingGroupAnimation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[_TVSpinnerView setAlpha:](self, "setAlpha:", 0.0);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __32___TVSpinnerView__addAnimations__block_invoke;
    v17[3] = &unk_24EB85440;
    v17[4] = self;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 4, v17, &__block_literal_global_25, 0.5, 0.0);
    objc_msgSend(MEMORY[0x24BDE5648], "animation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setKeyPath:", CFSTR("opacity"));
    objc_msgSend(v5, "setDuration:", 0.0833333333);
    LODWORD(v6) = 2139095040;
    objc_msgSend(v5, "setRepeatCount:", v6);
    objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTimingFunction:", v7);

    objc_msgSend(v5, "setFromValue:", &unk_24EBCD558);
    objc_msgSend(v5, "setToValue:", &unk_24EBCD568);
    objc_msgSend(MEMORY[0x24BDE56C0], "animation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 12);
    v10 = -30;
    do
    {
      v10 += 30;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)v10 * 0.0174532925);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v11);

    }
    while ((unint64_t)v10 < 0x14A);
    objc_msgSend(v8, "setKeyPath:", CFSTR("transform.rotation.z"));
    objc_msgSend(v8, "setValues:", v9);
    objc_msgSend(v8, "setCalculationMode:", CFSTR("discrete"));
    LODWORD(v12) = 2139095040;
    objc_msgSend(v8, "setRepeatCount:", v12);
    objc_msgSend(v8, "setDuration:", 1.0);
    objc_msgSend(MEMORY[0x24BDE5638], "animation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v5;
    v18[1] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAnimations:", v14);

    objc_msgSend(v13, "setDuration:", 1.0e100);
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    -[UIView layer](self->_spinnerContainer, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addAnimation:forKey:", v13, CFSTR("repeatingGroupAnimation"));

    -[UIView layer](self->_spinnerOverlayContainer, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addAnimation:forKey:", v13, CFSTR("repeatingGroupAnimation"));

    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  }

}

- (void)_removeAnimations
{
  _QWORD v2[5];
  _QWORD v3[5];

  v2[4] = self;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __35___TVSpinnerView__removeAnimations__block_invoke;
  v3[3] = &unk_24EB85440;
  v3[4] = self;
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __35___TVSpinnerView__removeAnimations__block_invoke_2;
  v2[3] = &unk_24EB85A38;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 4, v3, v2, 0.5, 0.0);
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (UIColor)color
{
  return self->_color;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_spinnerOverlayContainer, 0);
  objc_storeStrong((id *)&self->_spinnerContainer, 0);
}

@end
