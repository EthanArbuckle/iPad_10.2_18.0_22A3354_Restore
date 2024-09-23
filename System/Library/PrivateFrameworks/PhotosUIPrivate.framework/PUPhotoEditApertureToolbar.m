@implementation PUPhotoEditApertureToolbar

- (PUPhotoEditApertureToolbar)init
{
  PUPhotoEditApertureToolbar *v2;
  NSMutableArray *v3;
  NSMutableArray *constraints;
  id v5;
  uint64_t v6;
  CEKApertureSlider *slider;
  void *v8;
  int v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PUPhotoEditApertureToolbar;
  v2 = -[PUPhotoEditApertureToolbar init](&v11, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    constraints = v2->_constraints;
    v2->_constraints = v3;

    v5 = objc_alloc(MEMORY[0x1E0D0D018]);
    v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    slider = v2->_slider;
    v2->_slider = (CEKApertureSlider *)v6;

    -[CEKApertureSlider setDelegate:](v2->_slider, "setDelegate:", v2);
    -[CEKApertureSlider addTarget:action:forControlEvents:](v2->_slider, "addTarget:action:forControlEvents:", v2, sel__apertureSliderDidChangeValue_, 4096);
    -[CEKApertureSlider setSliderVerticalOffset:](v2->_slider, "setSliderVerticalOffset:", 28.0);
    -[CEKApertureSlider setSliderVerticalAlignment:](v2->_slider, "setSliderVerticalAlignment:", 1);
    -[CEKApertureSlider setUseTickMarkLegibilityShadows:](v2->_slider, "setUseTickMarkLegibilityShadows:", 1);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "apertureSliderHasOffPosition");

      if (v9)
      {
        v2->_sliderImplementsOffState = 1;
        -[CEKApertureSlider setIncludesOffState:](v2->_slider, "setIncludesOffState:", 1);
      }
    }
  }
  return v2;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)loadView
{
  id v3;
  void *v4;
  CEKApertureSlider *slider;
  _UIBackdropView *v6;
  _UIBackdropView *backdropBackgroundView;
  void *v8;
  void *v9;
  UIView *v10;
  UIView *solidBackgroundView;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  PFCoalescer *v40;
  PFCoalescer *apertureUpdateCoalescer;
  _QWORD v42[4];
  id v43;
  id location;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[PUPhotoEditApertureToolbar setView:](self, "setView:", v3);
  -[CEKApertureSlider setTranslatesAutoresizingMaskIntoConstraints:](self->_slider, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  slider = self->_slider;
  -[PUPhotoEditApertureToolbar apertureValue](self, "apertureValue");
  -[CEKApertureSlider setApertureValueClosestTo:](slider, "setApertureValueClosestTo:");
  v6 = (_UIBackdropView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC4028]), "initWithPrivateStyle:", 2030);
  backdropBackgroundView = self->_backdropBackgroundView;
  self->_backdropBackgroundView = v6;

  -[_UIBackdropView setHidden:](self->_backdropBackgroundView, "setHidden:", 1);
  -[_UIBackdropView layer](self->_backdropBackgroundView, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAllowsGroupOpacity:", 0);

  -[_UIBackdropView setTranslatesAutoresizingMaskIntoConstraints:](self->_backdropBackgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[_UIBackdropView groupName](self->_backdropBackgroundView, "groupName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditApertureToolbar setBackdropViewGroupName:](self, "setBackdropViewGroupName:", v9);

  v10 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  solidBackgroundView = self->_solidBackgroundView;
  self->_solidBackgroundView = v10;

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_solidBackgroundView, "setBackgroundColor:", v12);

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_solidBackgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", self->_backdropBackgroundView);
  objc_msgSend(v3, "addSubview:", self->_solidBackgroundView);
  -[_UIBackdropView leadingAnchor](self->_backdropBackgroundView, "leadingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setActive:", 1);

  -[_UIBackdropView trailingAnchor](self->_backdropBackgroundView, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActive:", 1);

  -[_UIBackdropView topAnchor](self->_backdropBackgroundView, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActive:", 1);

  -[_UIBackdropView bottomAnchor](self->_backdropBackgroundView, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bottomAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setActive:", 1);

  -[UIView leadingAnchor](self->_solidBackgroundView, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setActive:", 1);

  -[UIView trailingAnchor](self->_solidBackgroundView, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setActive:", 1);

  -[UIView topAnchor](self->_solidBackgroundView, "topAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setActive:", 1);

  -[UIView bottomAnchor](self->_solidBackgroundView, "bottomAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bottomAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setActive:", 1);

  objc_msgSend(v3, "addSubview:", self->_slider);
  objc_initWeak(&location, self);
  v37 = (void *)MEMORY[0x1E0D71080];
  v38 = MEMORY[0x1E0C80D38];
  v39 = MEMORY[0x1E0C80D38];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __38__PUPhotoEditApertureToolbar_loadView__block_invoke;
  v42[3] = &unk_1E58A3EE8;
  objc_copyWeak(&v43, &location);
  objc_msgSend(v37, "setCoalescerWithLabel:target:queue:action:", CFSTR("PUPhotoEditApertureToolbar._apertureUpdateCoalescer"), self, v38, v42);
  v40 = (PFCoalescer *)objc_claimAutoreleasedReturnValue();
  apertureUpdateCoalescer = self->_apertureUpdateCoalescer;
  self->_apertureUpdateCoalescer = v40;

  objc_destroyWeak(&v43);
  objc_destroyWeak(&location);

}

- (void)_handleApertureUpdateCoalescerWithContext:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  char v8;
  id v9;

  objc_msgSend(a3, "delayNextInvocationByTimeInterval:", 0.05);
  -[PUPhotoEditApertureToolbar delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditApertureToolbar slider](self, "slider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "apertureValue");
  v6 = v5;

  if (self->_sliderImplementsOffState)
  {
    if (v6 == 0.0
      || (-[PUPhotoEditApertureToolbar slider](self, "slider"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "isSliderOn"),
          v7,
          (v8 & 1) == 0))
    {
      objc_msgSend(v9, "apertureToolbar:didUpdateDepthActive:", self, 0);
      goto LABEL_8;
    }
    if ((objc_msgSend(v9, "apertureToolbarIsDepthActive") & 1) == 0)
      objc_msgSend(v9, "apertureToolbar:didUpdateDepthActive:", self, 1);
  }
  objc_msgSend(v9, "apertureToolbar:didChangeValue:", self, v6);
LABEL_8:

}

- (void)viewDidLayoutSubviews
{
  CGSize *p_cachedSize;
  double v4;
  void *v6;
  CGFloat v7;
  CGFloat v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUPhotoEditApertureToolbar;
  -[PUPhotoEditApertureToolbar viewDidLayoutSubviews](&v9, sel_viewDidLayoutSubviews);
  p_cachedSize = &self->_cachedSize;
  v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (*MEMORY[0x1E0C9D820] == self->_cachedSize.width && v4 == self->_cachedSize.height && !self->_isResizing)
  {
    -[PUPhotoEditApertureToolbar view](self, "view", *MEMORY[0x1E0C9D820], v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    p_cachedSize->width = v7;
    p_cachedSize->height = v8;

  }
}

- (void)setUseTranslucentBackground:(BOOL)a3
{
  -[PUPhotoEditApertureToolbar setUseTranslucentBackground:animated:](self, "setUseTranslucentBackground:animated:", a3, 0);
}

- (void)setUseTranslucentBackground:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_useTranslucentBackground != a3)
  {
    self->_useTranslucentBackground = a3;
    -[PUPhotoEditApertureToolbar _updateBackgroundAnimated:](self, "_updateBackgroundAnimated:", a4);
  }
}

- (void)setBackdropViewGroupName:(id)a3
{
  NSString *v4;
  NSString *backdropViewGroupName;
  void *v6;
  id v7;

  v7 = a3;
  if (!-[NSString isEqualToString:](self->_backdropViewGroupName, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v7, "copy");
    backdropViewGroupName = self->_backdropViewGroupName;
    self->_backdropViewGroupName = v4;

    -[PUPhotoEditApertureToolbar backdropViewGroupName](self, "backdropViewGroupName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBackdropView setGroupName:](self->_backdropBackgroundView, "setGroupName:", v6);

  }
}

- (void)updateViewConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  NSMutableArray *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSMutableArray *v23;
  NSMutableArray *constraints;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;
  _OWORD v31[3];
  _QWORD v32[6];

  v32[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_constraints);
  -[NSMutableArray removeAllObjects](self->_constraints, "removeAllObjects");
  -[PUPhotoEditApertureToolbar view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditApertureToolbar slider](self, "slider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  constraints = self->_constraints;
  objc_msgSend(v4, "centerXAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerXAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v26;
  objc_msgSend(v4, "centerYAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerYAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v6;
  objc_msgSend(v4, "heightAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToConstant:", 110.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v8;
  v29 = v3;
  objc_msgSend(v3, "heightAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "heightAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObjectsFromArray:](constraints, "addObjectsFromArray:", v12);

  v13 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v31[0] = *MEMORY[0x1E0C9BAA8];
  v31[1] = v13;
  v31[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v4, "setTransform:", v31);
  -[PUPhotoEditApertureToolbar sliderWidth](self, "sliderWidth");
  if (v14 <= 0.0)
  {
    v19 = v29;
    v23 = self->_constraints;
    objc_msgSend(v29, "widthAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "widthAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v23, "addObject:", v21);
  }
  else
  {
    objc_msgSend(v4, "widthAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditApertureToolbar sliderWidth](self, "sliderWidth");
    objc_msgSend(v15, "constraintEqualToConstant:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v17) = 1144750080;
    objc_msgSend(v16, "setPriority:", v17);
    -[NSMutableArray addObject:](self->_constraints, "addObject:", v16);
    v18 = self->_constraints;
    v19 = v29;
    objc_msgSend(v29, "widthAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "widthAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintGreaterThanOrEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v18, "addObject:", v22);

  }
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_constraints);
  v30.receiver = self;
  v30.super_class = (Class)PUPhotoEditApertureToolbar;
  -[PUPhotoEditApertureToolbar updateViewConstraints](&v30, sel_updateViewConstraints);

}

- (UIEdgeInsets)preferredPreviewViewInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double width;
  double height;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  int64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  UIEdgeInsets result;

  v3 = *MEMORY[0x1E0DC49E8];
  v4 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v6 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  width = self->_cachedSize.width;
  height = self->_cachedSize.height;
  if (width >= height)
    v9 = self->_cachedSize.height;
  else
    v9 = self->_cachedSize.width;
  if (width < height)
    width = self->_cachedSize.height;
  v10 = (width + v9 * -1.33333333) * 0.5;
  -[PUPhotoEditApertureToolbar slider](self, "slider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "intrinsicContentSize");
  v13 = v12;
  v15 = v14;

  if (v13 >= v15)
    v16 = v15;
  else
    v16 = v13;
  if (v10 >= v16)
    v17 = v10;
  else
    v17 = v16;
  v18 = -[PUPhotoEditApertureToolbar layoutOrientation](self, "layoutOrientation");
  if (v18 == 2)
    v19 = v17;
  else
    v19 = v6;
  if (v18 == 1)
    v20 = v6;
  else
    v20 = v19;
  if (v18 == 1)
    v21 = v17;
  else
    v21 = v5;
  v22 = v3;
  v23 = v4;
  result.right = v20;
  result.bottom = v21;
  result.left = v23;
  result.top = v22;
  return result;
}

- (void)_updateBackgroundAnimated:(BOOL)a3
{
  _BOOL4 v3;
  int useTranslucentBackground;
  double v6;
  double v7;
  _QWORD v8[6];
  char v9;
  _QWORD v10[6];

  v3 = a3;
  useTranslucentBackground = self->_useTranslucentBackground;
  if (useTranslucentBackground == -[_UIBackdropView isHidden](self->_backdropBackgroundView, "isHidden"))
  {
    v6 = 0.0;
    if (useTranslucentBackground)
      v7 = 0.0;
    else
      v7 = 1.0;
    if (v3)
    {
      if (useTranslucentBackground)
        v6 = 1.0;
      -[UIView setAlpha:](self->_solidBackgroundView, "setAlpha:", v6);
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __56__PUPhotoEditApertureToolbar__updateBackgroundAnimated___block_invoke;
      v10[3] = &unk_1E58AACF0;
      v10[4] = self;
      *(double *)&v10[5] = v7;
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __56__PUPhotoEditApertureToolbar__updateBackgroundAnimated___block_invoke_2;
      v8[3] = &unk_1E58A3F10;
      v8[4] = self;
      v9 = useTranslucentBackground;
      *(double *)&v8[5] = v7;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v10, v8, 0.2);
    }
    else
    {
      -[_UIBackdropView setHidden:](self->_backdropBackgroundView, "setHidden:", useTranslucentBackground == 0);
      -[UIView setAlpha:](self->_solidBackgroundView, "setAlpha:", v7);
    }
  }
}

- (BOOL)enabled
{
  void *v2;
  char v3;

  -[PUPhotoEditApertureToolbar slider](self, "slider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabled");

  return v3;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PUPhotoEditApertureToolbar slider](self, "slider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

}

- (void)setSliderWidth:(double)a3
{
  id v3;

  if (self->_sliderWidth != a3)
  {
    self->_sliderWidth = a3;
    -[PUPhotoEditApertureToolbar view](self, "view");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setNeedsUpdateConstraints");

  }
}

- (double)minimumApertureValue
{
  void *v2;
  double v3;
  double v4;

  -[PUPhotoEditApertureToolbar slider](self, "slider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minimumApertureValue");
  v4 = v3;

  return v4;
}

- (void)setMinimumApertureValue:(double)a3
{
  double v5;
  id v6;

  -[PUPhotoEditApertureToolbar slider](self, "slider");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditApertureToolbar maximumApertureValue](self, "maximumApertureValue");
  objc_msgSend(v6, "setMinimumApertureValueClosestTo:maximumApertureValueClosestTo:", a3, v5);

}

- (double)maximumApertureValue
{
  void *v2;
  double v3;
  double v4;

  -[PUPhotoEditApertureToolbar slider](self, "slider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maximumApertureValue");
  v4 = v3;

  return v4;
}

- (void)setMaximumApertureValue:(double)a3
{
  id v4;

  -[PUPhotoEditApertureToolbar slider](self, "slider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditApertureToolbar minimumApertureValue](self, "minimumApertureValue");
  objc_msgSend(v4, "setMinimumApertureValueClosestTo:maximumApertureValueClosestTo:");

}

- (void)setLayoutOrientation:(int64_t)a3
{
  -[PUPhotoEditApertureToolbar setLayoutOrientation:withTransitionCoordinator:](self, "setLayoutOrientation:withTransitionCoordinator:", a3, 0);
}

- (void)setLayoutOrientation:(int64_t)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  _QWORD v11[5];

  v6 = a4;
  v7 = v6;
  if (self->_layoutOrientation != a3)
  {
    self->_layoutOrientation = a3;
    self->_isResizing = v6 != 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __77__PUPhotoEditApertureToolbar_setLayoutOrientation_withTransitionCoordinator___block_invoke;
    v11[3] = &unk_1E58A7A08;
    v11[4] = self;
    objc_msgSend(v6, "animateAlongsideTransition:completion:", 0, v11);
    -[PUPhotoEditApertureToolbar view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNeedsUpdateConstraints");

    -[PUPhotoEditApertureToolbar delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "apertureToolbarShouldRotateLabelsWithOrientation:", self);

    if (v10)
      -[CEKApertureSlider setTextOrientation:animated:](self->_slider, "setTextOrientation:animated:", 2, 1);
  }

}

- (double)originalApertureValue
{
  void *v2;
  double v3;
  double v4;

  -[PUPhotoEditApertureToolbar slider](self, "slider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "markedApertureValue");
  v4 = v3;

  return v4;
}

- (void)setOriginalApertureValueClosestTo:(double)a3
{
  id v4;

  -[PUPhotoEditApertureToolbar slider](self, "slider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMarkedApertureValueClosestTo:", a3);

}

- (double)apertureValue
{
  void *v2;
  double v3;
  double v4;

  -[PUPhotoEditApertureToolbar slider](self, "slider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "apertureValue");
  v4 = v3;

  return v4;
}

- (id)_nextApertureValueFromValue:(id)a3 reverse:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  id v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *i;
  void *v12;
  id v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(MEMORY[0x1E0D0D020], "validApertureValues", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        if ((v8 & 1) != 0)
        {
          v7 = v12;
          goto LABEL_14;
        }
        v8 = objc_msgSend(v5, "isEqualToNumber:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i));
        if ((v8 & 1) == 0)
        {
          v13 = v12;

          v9 = v13;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v9 = 0;
  }
LABEL_14:

  if (v4)
    v14 = v9;
  else
    v14 = v7;
  v15 = v14;

  return v15;
}

- (BOOL)setNextApertureValue:(BOOL)a3 coarse:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  BOOL v14;
  uint64_t v15;
  void *v16;
  char v17;
  char v18;
  void *v19;
  float v20;

  v4 = a4;
  v5 = a3;
  -[PUPhotoEditApertureToolbar slider](self, "slider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v7, "apertureValue");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "includesOffState"))
    goto LABEL_11;
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[PUPhotoEditApertureToolbar maximumApertureValue](self, "maximumApertureValue");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if ((objc_msgSend(v7, "isSliderOn") & 1) == 0)
    {
      if (!v5)
        goto LABEL_9;
      -[PUPhotoEditApertureToolbar delegate](self, "delegate");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "apertureToolbar:didUpdateDepthActive:", self, 1);
LABEL_18:

LABEL_20:
      objc_msgSend(v11, "floatValue");
      objc_msgSend(v7, "setApertureValueClosestTo:", v20);
      v14 = 1;
      goto LABEL_21;
    }
    if (objc_msgSend(v9, "isEqualToNumber:", v11) && !v5)
    {
      -[PUPhotoEditApertureToolbar delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "apertureToolbar:didUpdateDepthActive:", self, 0);

      goto LABEL_9;
    }

LABEL_11:
    -[PUPhotoEditApertureToolbar _nextApertureValueFromValue:reverse:](self, "_nextApertureValueFromValue:reverse:", v9, v5);
    v15 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v15;
    if (v4)
      v16 = (void *)v15;
    else
      v16 = 0;
    if (v16)
    {
      v17 = 1;
      while (1)
      {
        v18 = v17;
        -[PUPhotoEditApertureToolbar _nextApertureValueFromValue:reverse:](self, "_nextApertureValueFromValue:reverse:", v11, v5);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v19)
          break;
        v13 = v19;

        v17 = 0;
        v11 = v13;
        if ((v18 & 1) == 0)
          goto LABEL_18;
      }
    }
    if (!v11)
    {
      v14 = 0;
      goto LABEL_22;
    }
    goto LABEL_20;
  }
LABEL_9:
  v14 = 0;
LABEL_21:

LABEL_22:
  return v14;
}

- (void)_apertureSliderDidChangeValue:(id)a3
{
  -[PFCoalescer update](self->_apertureUpdateCoalescer, "update", a3);
}

- (void)setApertureValueClosestTo:(double)a3
{
  id v4;

  -[PUPhotoEditApertureToolbar slider](self, "slider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setApertureValueClosestTo:", a3);

}

- (void)setDepthIsOn:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_sliderImplementsOffState)
  {
    v3 = a3;
    -[PUPhotoEditApertureToolbar slider](self, "slider");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSliderOn:", v3);

  }
}

- (void)sliderWillBeginScrolling:(id)a3
{
  id v4;

  -[PUPhotoEditApertureToolbar delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "apertureToolbarDidStartSliding:", self);

}

- (void)sliderDidEndScrolling:(id)a3
{
  id v4;

  -[PUPhotoEditApertureToolbar delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "apertureToolbarDidStopSliding:", self);

}

- (int64_t)layoutOrientation
{
  return self->_layoutOrientation;
}

- (PUPhotoEditApertureToolbarDelegate)delegate
{
  return (PUPhotoEditApertureToolbarDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (double)sliderWidth
{
  return self->_sliderWidth;
}

- (BOOL)useTranslucentBackground
{
  return self->_useTranslucentBackground;
}

- (NSString)backdropViewGroupName
{
  return self->_backdropViewGroupName;
}

- (CEKApertureSlider)slider
{
  return self->_slider;
}

- (void)setSlider:(id)a3
{
  objc_storeStrong((id *)&self->_slider, a3);
}

- (UILabel)depthEffectLabel
{
  return self->_depthEffectLabel;
}

- (void)setDepthEffectLabel:(id)a3
{
  objc_storeStrong((id *)&self->_depthEffectLabel, a3);
}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (void)setValueLabel:(id)a3
{
  objc_storeStrong((id *)&self->_valueLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_depthEffectLabel, 0);
  objc_storeStrong((id *)&self->_slider, 0);
  objc_storeStrong((id *)&self->_backdropViewGroupName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_apertureUpdateCoalescer, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_backdropBackgroundView, 0);
  objc_storeStrong((id *)&self->_solidBackgroundView, 0);
}

uint64_t __77__PUPhotoEditApertureToolbar_setLayoutOrientation_withTransitionCoordinator___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 984) = 0;
  return result;
}

uint64_t __56__PUPhotoEditApertureToolbar__updateBackgroundAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "setAlpha:", *(double *)(a1 + 40));
}

uint64_t __56__PUPhotoEditApertureToolbar__updateBackgroundAnimated___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "setHidden:", *(_BYTE *)(a1 + 48) == 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "setAlpha:", *(double *)(a1 + 40));
}

void __38__PUPhotoEditApertureToolbar_loadView__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id *v4;
  id v5;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a4;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_handleApertureUpdateCoalescerWithContext:", v5);

}

@end
