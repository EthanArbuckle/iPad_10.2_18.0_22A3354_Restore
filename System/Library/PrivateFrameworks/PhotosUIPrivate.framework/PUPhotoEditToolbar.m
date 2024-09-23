@implementation PUPhotoEditToolbar

- (PUPhotoEditToolbar)initWithFrame:(CGRect)a3
{
  PUPhotoEditToolbar *v3;
  PUPhotoEditToolbar *v4;
  _PUPhotoEditToolbarPassThroughView *v5;
  uint64_t v6;
  UIView *mainToolbarContainer;
  _PUPhotoEditToolbarPassThroughView *v8;
  UIView *gradientBackgroundView;
  CAGradientLayer *v10;
  CAGradientLayer *gradientLayer;
  void *v12;
  uint64_t v13;
  UILongPressGestureRecognizer *accessibilityLongPressGestureRecognizer;
  void *v15;
  NSString *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PUPhotoEditToolbar;
  v3 = -[PUPhotoEditToolbar initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PUPhotoEditToolbar setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v4->_useLargeShortSideHeight = 0;
    v4->_useiPhonePrimaryPortraitHeight = 0;
    v4->_backgroundStyle = 1;
    v5 = [_PUPhotoEditToolbarPassThroughView alloc];
    v6 = -[_PUPhotoEditToolbarPassThroughView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    mainToolbarContainer = v4->_mainToolbarContainer;
    v4->_mainToolbarContainer = (UIView *)v6;

    -[PUPhotoEditToolbar addSubview:](v4, "addSubview:", v4->_mainToolbarContainer);
    v8 = objc_alloc_init(_PUPhotoEditToolbarPassThroughView);
    gradientBackgroundView = v4->_gradientBackgroundView;
    v4->_gradientBackgroundView = &v8->super;

    v10 = (CAGradientLayer *)objc_alloc_init(MEMORY[0x1E0CD2790]);
    gradientLayer = v4->_gradientLayer;
    v4->_gradientLayer = v10;

    -[UIView layer](v4->_gradientBackgroundView, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSublayer:", v4->_gradientLayer);

    -[CAGradientLayer setAnchorPoint:](v4->_gradientLayer, "setAnchorPoint:", 0.0, 0.0);
    -[PUPhotoEditToolbar insertSubview:belowSubview:](v4, "insertSubview:belowSubview:", v4->_gradientBackgroundView, v4->_mainToolbarContainer);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", v4, sel_accessibilityLongPressChanged_);
    accessibilityLongPressGestureRecognizer = v4->_accessibilityLongPressGestureRecognizer;
    v4->_accessibilityLongPressGestureRecognizer = (UILongPressGestureRecognizer *)v13;

    -[UILongPressGestureRecognizer setMinimumPressDuration:](v4->_accessibilityLongPressGestureRecognizer, "setMinimumPressDuration:", 0.15);
    -[PUPhotoEditToolbar addGestureRecognizer:](v4, "addGestureRecognizer:", v4->_accessibilityLongPressGestureRecognizer);
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "preferredContentSizeCategory");
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    -[UILongPressGestureRecognizer setEnabled:](v4->_accessibilityLongPressGestureRecognizer, "setEnabled:", UIContentSizeCategoryIsAccessibilityCategory(v16));

  }
  return v4;
}

- (void)willMoveToWindow:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUPhotoEditToolbar;
  -[PUPhotoEditToolbar willMoveToWindow:](&v5, sel_willMoveToWindow_);
  if (a3)
    -[PUPhotoEditToolbar _updateBackgroundAnimated:](self, "_updateBackgroundAnimated:", 0);
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[PUPhotoEditToolbar bounds](self, "bounds");
  -[PUPhotoEditToolbar sizeThatFits:](self, "sizeThatFits:", v3, v4);
  result.height = v6;
  result.width = v5;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  double v5;
  double v6;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if ((unint64_t)(self->_layoutOrientation - 1) <= 1)
    -[PUPhotoEditToolbar shortSideSize](self, "shortSideSize");
  v5 = width;
  v6 = height;
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)PUPhotoEditToolbar;
  -[PUPhotoEditToolbar setBounds:](&v8, sel_setBounds_);
  -[CAGradientLayer setBounds:](self->_gradientLayer, "setBounds:", x, y, width, height);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  PUPhotoEditToolbar *v5;
  PUPhotoEditToolbar *v6;
  PUPhotoEditToolbar *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUPhotoEditToolbar;
  -[PUPhotoEditToolbar hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (PUPhotoEditToolbar *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
    v7 = 0;
  else
    v7 = v5;

  return v7;
}

- (void)setupWithLayoutOrientation:(int64_t)a3
{
  void *v6;

  if (-[PUPhotoEditToolbar layoutOrientation](self, "layoutOrientation") && self->_layoutOrientation != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoEditToolbar.m"), 155, CFSTR("Can only set layout orientation once"));

  }
  self->_layoutOrientation = a3;
}

- (void)setToolButtons:(id)a3 mainActionButton:(id)a4 secondaryActionButton:(id)a5 stretchableView:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v15 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoEditToolbar.m"), 161, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("stretchableView != nil"));

  }
  -[PUPhotoEditToolbar _setToolButtons:buttonSpacing:mainActionButton:secondaryActionButton:stretchableView:](self, "_setToolButtons:buttonSpacing:mainActionButton:secondaryActionButton:stretchableView:", v15, 0, v11, v12, v13);

}

- (void)setToolButtons:(id)a3 buttonSpacing:(int64_t)a4 mainActionButton:(id)a5 secondaryActionButton:(id)a6
{
  -[PUPhotoEditToolbar _setToolButtons:buttonSpacing:mainActionButton:secondaryActionButton:stretchableView:](self, "_setToolButtons:buttonSpacing:mainActionButton:secondaryActionButton:stretchableView:", a3, a4, a5, a6, 0);
}

- (void)_setToolButtons:(id)a3 buttonSpacing:(int64_t)a4 mainActionButton:(id)a5 secondaryActionButton:(id)a6 stretchableView:(id)a7
{
  id v12;
  UIButton *v13;
  UIButton *v14;
  UIView *m;
  UIButton **p_mainActionButton;
  UIButton **p_secondaryActionButton;
  UIView **p_stretchableView;
  NSArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  NSArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  PUPhotoEditToolbar *v31;
  void *v32;
  void *v33;
  void *v34;
  NSArray *v35;
  NSArray *toolButtons;
  NSArray *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  uint64_t v42;
  void *v43;
  NSUInteger v44;
  int64_t buttonSpacing;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  id v49;
  objc_class *v50;
  void *v51;
  NSArray *mainActionButtonConstraints;
  NSArray *secondaryActionButtonConstraints;
  NSArray *toolButtonsConstraints;
  uint64_t v55;
  uint64_t v56;
  id v57;
  int64_t v58;
  UIView *v59;
  UIButton *v60;
  UIButton *v61;
  void *v62;
  id obj;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  obj = a5;
  v13 = (UIButton *)a5;
  v64 = a6;
  v14 = (UIButton *)a6;
  m = (UIView *)a7;
  if ((objc_msgSend(v12, "isEqualToArray:", self->_toolButtons) & 1) == 0
    || self->_buttonSpacing != a4
    || self->_mainActionButton != v13
    || self->_secondaryActionButton != v14
    || self->_stretchableView != m)
  {
    v57 = a7;
    v61 = v13;
    p_mainActionButton = &self->_mainActionButton;
    if (-[UIButton isDescendantOfView:](self->_mainActionButton, "isDescendantOfView:", self))
      -[UIButton removeFromSuperview](*p_mainActionButton, "removeFromSuperview");
    v60 = v14;
    p_secondaryActionButton = &self->_secondaryActionButton;
    if (-[UIButton isDescendantOfView:](self->_secondaryActionButton, "isDescendantOfView:", self))
      -[UIButton removeFromSuperview](*p_secondaryActionButton, "removeFromSuperview");
    v59 = m;
    v62 = v12;
    p_stretchableView = &self->_stretchableView;
    if (-[UIView isDescendantOfView:](self->_stretchableView, "isDescendantOfView:", self))
      -[UIView removeFromSuperview](*p_stretchableView, "removeFromSuperview");
    v58 = a4;
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v19 = self->_toolButtons;
    v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v74;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v74 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
          if (objc_msgSend(v24, "isDescendantOfView:", self))
            objc_msgSend(v24, "removeFromSuperview");
        }
        v21 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
      }
      while (v21);
    }

    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    v55 = 464;
    v25 = self->_toolButtonLayoutGuides;
    v26 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v70;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v70 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * j);
          objc_msgSend(v30, "owningView", v55);
          v31 = (PUPhotoEditToolbar *)objc_claimAutoreleasedReturnValue();

          if (v31 == self)
            -[PUPhotoEditToolbar removeLayoutGuide:](self, "removeLayoutGuide:", v30);
        }
        v27 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
      }
      while (v27);
    }

    objc_storeStrong((id *)p_mainActionButton, obj);
    -[PUPhotoEditToolbar mainToolbarContainer](self, "mainToolbarContainer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addSubview:", *p_mainActionButton);

    objc_storeStrong((id *)p_secondaryActionButton, v64);
    -[PUPhotoEditToolbar mainToolbarContainer](self, "mainToolbarContainer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addSubview:", *p_secondaryActionButton);

    objc_storeStrong((id *)p_stretchableView, v57);
    -[PUPhotoEditToolbar mainToolbarContainer](self, "mainToolbarContainer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addSubview:", *p_stretchableView);

    v12 = v62;
    v35 = (NSArray *)objc_msgSend(v62, "copy");
    toolButtons = self->_toolButtons;
    self->_toolButtons = v35;

    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v37 = self->_toolButtons;
    v38 = -[NSArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v66;
      do
      {
        for (k = 0; k != v39; ++k)
        {
          if (*(_QWORD *)v66 != v40)
            objc_enumerationMutation(v37);
          v42 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * k);
          -[PUPhotoEditToolbar mainToolbarContainer](self, "mainToolbarContainer", v55);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "addSubview:", v42);

        }
        v39 = -[NSArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
      }
      while (v39);
    }

    self->_buttonSpacing = v58;
    v44 = -[NSArray count](self->_toolButtons, "count");
    if (v44)
    {
      buttonSpacing = self->_buttonSpacing;
      if (buttonSpacing == 2)
        v46 = v44 + 1;
      else
        v46 = 0;
      if (buttonSpacing == 1)
        v47 = 2;
      else
        v47 = v46;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v47, v55);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      for (m = v59; v47; --v47)
      {
        v49 = objc_alloc_init(MEMORY[0x1E0DC39A0]);
        -[PUPhotoEditToolbar addLayoutGuide:](self, "addLayoutGuide:", v49);
        objc_msgSend(v48, "addObject:", v49);

      }
    }
    else
    {
      v48 = 0;
      m = v59;
    }
    v50 = (objc_class *)objc_msgSend(v48, "copy", v55);
    v51 = *(Class *)((char *)&self->super.super.super.isa + v56);
    *(Class *)((char *)&self->super.super.super.isa + v56) = v50;

    mainActionButtonConstraints = self->_mainActionButtonConstraints;
    self->_mainActionButtonConstraints = 0;

    secondaryActionButtonConstraints = self->_secondaryActionButtonConstraints;
    self->_secondaryActionButtonConstraints = 0;

    toolButtonsConstraints = self->_toolButtonsConstraints;
    self->_toolButtonsConstraints = 0;

    -[PUPhotoEditToolbar setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    v14 = v60;
    v13 = v61;
  }

}

- (void)setLongSideMargin:(double)a3
{
  NSArray *mainActionButtonConstraints;
  NSArray *secondaryActionButtonConstraints;

  if (self->_longSideMargin != a3)
  {
    self->_longSideMargin = a3;
    if (self->_mainActionButtonConstraints)
    {
      -[PUPhotoEditToolbar removeConstraints:](self, "removeConstraints:");
      mainActionButtonConstraints = self->_mainActionButtonConstraints;
      self->_mainActionButtonConstraints = 0;

      -[PUPhotoEditToolbar setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    }
    if (self->_secondaryActionButtonConstraints)
    {
      -[PUPhotoEditToolbar removeConstraints:](self, "removeConstraints:");
      secondaryActionButtonConstraints = self->_secondaryActionButtonConstraints;
      self->_secondaryActionButtonConstraints = 0;

      -[PUPhotoEditToolbar setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    }
  }
}

- (void)setBackgroundStyle:(int64_t)a3
{
  -[PUPhotoEditToolbar setBackgroundStyle:animated:](self, "setBackgroundStyle:animated:", a3, 0);
}

- (void)setBackgroundStyle:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_backgroundStyle != a3)
  {
    self->_backgroundStyle = a3;
    -[PUPhotoEditToolbar _updateBackgroundAnimated:](self, "_updateBackgroundAnimated:", a4);
  }
}

- (double)tabBarHeight
{
  double v3;
  double v4;

  if (-[PUPhotoEditToolbar layoutOrientation](self, "layoutOrientation") == 2)
  {
    v3 = 39.0;
  }
  else if (self->_useiPhonePrimaryPortraitHeight)
  {
    v3 = 50.0;
  }
  else
  {
    v3 = 35.0;
  }
  -[PUPhotoEditToolbar topActionButtonPadding](self, "topActionButtonPadding");
  return v3 + v4;
}

- (double)shortSideSize
{
  double v3;
  double v4;
  _BOOL4 v5;
  double result;

  -[PUPhotoEditToolbar tabBarHeight](self, "tabBarHeight");
  v4 = v3;
  v5 = -[PUPhotoEditToolbar useLargeShortSideHeight](self, "useLargeShortSideHeight");
  result = 50.0;
  if (!v5)
    return v4;
  return result;
}

- (void)setUseLargeShortSideHeight:(BOOL)a3
{
  if (self->_useLargeShortSideHeight != a3)
  {
    self->_useLargeShortSideHeight = a3;
    -[PUPhotoEditToolbar _invalidateAllConstraints](self, "_invalidateAllConstraints");
  }
}

- (void)setUseiPhonePrimaryPortraitHeight:(BOOL)a3
{
  if (self->_useiPhonePrimaryPortraitHeight != a3)
  {
    self->_useiPhonePrimaryPortraitHeight = a3;
    -[PUPhotoEditToolbar _invalidateAllConstraints](self, "_invalidateAllConstraints");
  }
}

- (void)setContentPadding:(UIEdgeInsets)a3
{
  if (self->_contentPadding.left != a3.left
    || self->_contentPadding.top != a3.top
    || self->_contentPadding.right != a3.right
    || self->_contentPadding.bottom != a3.bottom)
  {
    self->_contentPadding = a3;
    -[PUPhotoEditToolbar _invalidateAllConstraints](self, "_invalidateAllConstraints");
  }
}

- (void)_invalidateAllConstraints
{
  NSArray *basicViewsConstraints;
  NSArray *mainActionButtonConstraints;
  NSArray *secondaryActionButtonConstraints;
  NSArray *toolButtonsConstraints;

  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_basicViewsConstraints);
  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_mainActionButtonConstraints);
  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_secondaryActionButtonConstraints);
  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_toolButtonsConstraints);
  basicViewsConstraints = self->_basicViewsConstraints;
  self->_basicViewsConstraints = 0;

  mainActionButtonConstraints = self->_mainActionButtonConstraints;
  self->_mainActionButtonConstraints = 0;

  secondaryActionButtonConstraints = self->_secondaryActionButtonConstraints;
  self->_secondaryActionButtonConstraints = 0;

  toolButtonsConstraints = self->_toolButtonsConstraints;
  self->_toolButtonsConstraints = 0;

  -[PUPhotoEditToolbar setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)updateConstraints
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int64_t v19;
  NSArray *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSArray *basicViewsConstraints;
  _BOOL8 v30;
  void *v31;
  objc_super v32;
  _QWORD v33[11];
  _QWORD v34[13];

  v34[11] = *MEMORY[0x1E0C80C00];
  if (!-[PUPhotoEditToolbar layoutOrientation](self, "layoutOrientation"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoEditToolbar.m"), 336, CFSTR("Layout orientation cannot be unknown."));

  }
  -[PUPhotoEditToolbar contentPadding](self, "contentPadding");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v33[0] = CFSTR("barShortSideSize");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[PUPhotoEditToolbar shortSideSize](self, "shortSideSize");
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v13;
  v34[1] = &unk_1E59BC580;
  v33[1] = CFSTR("barShortSideMargin");
  v33[2] = CFSTR("tallItemMargin");
  v34[2] = &unk_1E59BC590;
  v34[3] = &unk_1E59BC5A0;
  v33[3] = CFSTR("tallActionButtonMargin");
  v33[4] = CFSTR("toolButtonSpacing");
  v34[4] = &unk_1E59BC5A0;
  v34[5] = &unk_1E59BC590;
  v33[5] = CFSTR("stretchableViewItemSpacing");
  v33[6] = CFSTR("highPriority");
  v34[6] = &unk_1E59BC790;
  v33[7] = CFSTR("leftContentPadding");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v34[7] = v14;
  v33[8] = CFSTR("rightContentPadding");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v34[8] = v15;
  v33[9] = CFSTR("topContentPadding");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v34[9] = v16;
  v33[10] = CFSTR("bottomContentPadding");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v34[10] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[PUPhotoEditToolbar layoutDirection](self, "layoutDirection");
  if (!self->_basicViewsConstraints)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditToolbar mainToolbarContainer](self, "mainToolbarContainer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    _NSDictionaryOfVariableBindings(CFSTR("self, mainToolbarContainer, _gradientBackgroundView"), self, v21, self->_gradientBackgroundView, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    if (v19)
      v23 = CFSTR("H:|-leftContentPadding-[mainToolbarContainer(barShortSideSize@highPriority)]-rightContentPadding-|");
    else
      v23 = CFSTR("H:|-leftContentPadding-[mainToolbarContainer]-rightContentPadding-|");
    if (v19)
      v24 = CFSTR("V:|-topContentPadding-[mainToolbarContainer]-bottomContentPadding-|");
    else
      v24 = CFSTR("V:|-topContentPadding-[mainToolbarContainer(barShortSideSize@highPriority)]-bottomContentPadding-|");
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", v23, 0x10000, v18, v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObjectsFromArray:](v20, "addObjectsFromArray:", v25);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", v24, 0, v18, v22);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObjectsFromArray:](v20, "addObjectsFromArray:", v26);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_gradientBackgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_gradientBackgroundView]|"), 0, 0, v22);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObjectsFromArray:](v20, "addObjectsFromArray:", v27);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[_gradientBackgroundView]|"), 0, 0, v22);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObjectsFromArray:](v20, "addObjectsFromArray:", v28);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v20);
    basicViewsConstraints = self->_basicViewsConstraints;
    self->_basicViewsConstraints = v20;

  }
  v30 = v19 != 0;
  -[PUPhotoEditToolbar _addLeadingConstraintsWithMetrics:verticalLayout:](self, "_addLeadingConstraintsWithMetrics:verticalLayout:", v18, v30);
  -[PUPhotoEditToolbar _addTrailingConstraintsWithMetrics:verticalLayout:](self, "_addTrailingConstraintsWithMetrics:verticalLayout:", v18, v30);
  -[PUPhotoEditToolbar _addCenterConstraintsWithMetrics:verticalLayout:](self, "_addCenterConstraintsWithMetrics:verticalLayout:", v18, v30);
  v32.receiver = self;
  v32.super_class = (Class)PUPhotoEditToolbar;
  -[PUPhotoEditToolbar updateConstraints](&v32, sel_updateConstraints);

}

- (void)_addLeadingConstraintsWithMetrics:(id)a3 verticalLayout:(BOOL)a4
{
  id v6;
  UIButton *mainActionButton;
  NSArray *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  UIButton *v25;
  void *v26;
  void *v27;
  void *v28;
  NSArray *mainActionButtonConstraints;
  NSArray *v30;
  id v31;

  v6 = a3;
  mainActionButton = self->_mainActionButton;
  if (mainActionButton && !self->_mainActionButtonConstraints)
  {
    v31 = v6;
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](mainActionButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    -[UIButton configuration](self->_mainActionButton, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;

    objc_msgSend(v12, "contentInsets");
    v17 = v16;
    if (a4)
    {
      v18 = v13;
      v19 = v14;
      v20 = v15;
    }
    else
    {
      -[UIButton trailingAnchor](self->_mainActionButton, "trailingAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPhotoEditToolbar trailingAnchor](self, "trailingAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, -self->_longSideMargin);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v8, "addObject:", v23);

      v24 = -[PUPhotoEditToolbar useLargeShortSideHeight](self, "useLargeShortSideHeight");
      v25 = self->_mainActionButton;
      if (v24)
      {
        -[UIButton bottomAnchor](v25, "bottomAnchor");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUPhotoEditToolbar bottomAnchor](self, "bottomAnchor");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "constraintEqualToAnchor:constant:", v27, -5.0);
      }
      else
      {
        -[UIButton centerYAnchor](v25, "centerYAnchor");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUPhotoEditToolbar centerYAnchor](self, "centerYAnchor");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "constraintEqualToAnchor:", v27);
      }
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v8, "addObject:", v28);

      v20 = 0.0;
      v19 = 0.0;
      v18 = 0.0;
    }
    LODWORD(v13) = 1148846080;
    -[UIButton setContentCompressionResistancePriority:forAxis:](self->_mainActionButton, "setContentCompressionResistancePriority:forAxis:", 0, v13);
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v8);
    mainActionButtonConstraints = self->_mainActionButtonConstraints;
    self->_mainActionButtonConstraints = v8;
    v30 = v8;

    objc_msgSend(v12, "setContentInsets:", v18, v19, v20, v17);
    -[UIButton setConfiguration:](self->_mainActionButton, "setConfiguration:", v12);

    v6 = v31;
  }

}

- (void)_addTrailingConstraintsWithMetrics:(id)a3 verticalLayout:(BOOL)a4
{
  id v6;
  UIButton *secondaryActionButton;
  NSArray *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double longSideMargin;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  UIButton *v25;
  void *v26;
  void *v27;
  void *v28;
  NSArray *secondaryActionButtonConstraints;
  NSArray *v30;
  id v31;

  v6 = a3;
  secondaryActionButton = self->_secondaryActionButton;
  if (secondaryActionButton && !self->_secondaryActionButtonConstraints)
  {
    v31 = v6;
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](secondaryActionButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    -[UIButton configuration](self->_secondaryActionButton, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;

    objc_msgSend(v12, "contentInsets");
    if (a4)
    {
      v17 = v13;
      longSideMargin = v14;
      v19 = v15;
      v20 = v16;
    }
    else
    {
      longSideMargin = self->_longSideMargin;
      -[UIButton leadingAnchor](self->_secondaryActionButton, "leadingAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPhotoEditToolbar leadingAnchor](self, "leadingAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, self->_longSideMargin);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v8, "addObject:", v23);

      v24 = -[PUPhotoEditToolbar useLargeShortSideHeight](self, "useLargeShortSideHeight");
      v25 = self->_secondaryActionButton;
      if (v24)
      {
        -[UIButton bottomAnchor](v25, "bottomAnchor");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUPhotoEditToolbar bottomAnchor](self, "bottomAnchor");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "constraintEqualToAnchor:constant:", v27, -5.0);
      }
      else
      {
        -[UIButton centerYAnchor](v25, "centerYAnchor");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUPhotoEditToolbar centerYAnchor](self, "centerYAnchor");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "constraintEqualToAnchor:", v27);
      }
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v8, "addObject:", v28);

      v20 = 0.0;
      v19 = 0.0;
      v17 = 0.0;
    }
    LODWORD(v13) = 1148846080;
    -[UIButton setContentCompressionResistancePriority:forAxis:](self->_secondaryActionButton, "setContentCompressionResistancePriority:forAxis:", 0, v13);
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v8);
    secondaryActionButtonConstraints = self->_secondaryActionButtonConstraints;
    self->_secondaryActionButtonConstraints = v8;
    v30 = v8;

    objc_msgSend(v12, "setContentInsets:", v17, longSideMargin, v19, v20);
    -[UIButton setConfiguration:](self->_secondaryActionButton, "setConfiguration:", v12);

    v6 = v31;
  }

}

- (void)_addCenterConstraintsWithMetrics:(id)a3 verticalLayout:(BOOL)a4
{
  id v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 v10;
  BOOL v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSArray *v15;
  NSUInteger v16;
  UIButton *mainActionButton;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  PUPhotoEditToolbar *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  PUPhotoEditToolbar *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  UIView *v60;
  uint64_t i;
  UIView *v62;
  UIView *v63;
  void *v64;
  double v65;
  UIView *stretchableView;
  _BOOL4 v68;
  char v69;
  const __CFString *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  const __CFString *v78;
  void *v79;
  UIView *v80;
  _BOOL4 v81;
  void *v82;
  const __CFString *v83;
  uint64_t v84;
  UIView *v85;
  uint64_t v86;
  const __CFString *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  unint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  UIButton *secondaryActionButton;
  double v99;
  double v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  PUPhotoEditToolbar *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  NSArray *toolButtonsConstraints;
  NSArray *v150;
  NSUInteger v151;
  void *v152;
  int64_t v153;
  void *v154;
  _BOOL4 v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  id v160;
  PUPhotoEditToolbar *v161;
  id obj;
  id obja;
  id objb;
  int64_t v165;
  void *v166;
  NSUInteger v167;
  uint64_t v168;
  void *v169;
  _BOOL4 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  _BYTE v175[128];
  uint64_t v176;

  v170 = a4;
  v176 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[PUPhotoEditToolbar buttonSpacing](self, "buttonSpacing");
  v165 = -[PUPhotoEditToolbar buttonSpacing](self, "buttonSpacing");
  v8 = -[NSArray count](self->_toolButtons, "count");
  v9 = v8;
  v10 = self->_stretchableView && self->_secondaryActionButton && self->_mainActionButton != 0;
  v11 = v8 <= 0 && !v10;
  if (v11 || self->_toolButtonsConstraints)
    goto LABEL_104;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", self->_toolButtons);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v10)
  {
    if (v9 >= 0)
      v14 = v9;
    else
      v14 = v9 + 1;
    objc_msgSend(v12, "insertObject:atIndex:", self->_stretchableView, (v9 & 1) + (v14 >> 1));
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (v165 == 2)
  {
    v16 = -[NSArray count](self->_toolButtonLayoutGuides, "count");
    if (v16 != v9 + 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v151 = v16;
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v152, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoEditToolbar.m"), 486, CFSTR("Spacing is distributed, but number of layout guides (%ld) is wrong for number of tool buttons (%ld)"), v151, v9);

      v16 = v151;
    }
  }
  else
  {
    v16 = 0;
  }
  v153 = v7;
  v154 = v13;
  v155 = v10;
  if (objc_msgSend(v13, "count") != 1
    && (mainActionButton = self->_mainActionButton) != 0
    && self->_secondaryActionButton)
  {
    -[UIButton centerYAnchor](mainActionButton, "centerYAnchor");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton centerYAnchor](self->_secondaryActionButton, "centerYAnchor");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton centerXAnchor](self->_secondaryActionButton, "centerXAnchor");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton centerXAnchor](self->_mainActionButton, "centerXAnchor");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PUPhotoEditToolbar topAnchor](self, "topAnchor");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditToolbar bottomAnchor](self, "bottomAnchor");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditToolbar leadingAnchor](self, "leadingAnchor");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditToolbar trailingAnchor](self, "trailingAnchor");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v158 = (void *)v18;
  v160 = v6;
  v161 = self;
  if (v16)
  {
    v19 = 0;
    v20 = 0;
    obj = (id)(v16 - 1);
    v167 = v16;
    while (1)
    {
      v21 = v19;
      -[NSArray objectAtIndexedSubscript:](v161->_toolButtonLayoutGuides, "objectAtIndexedSubscript:", v20);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v170)
      {
        if (v20)
        {
          -[NSArray objectAtIndexedSubscript:](v161->_toolButtons, "objectAtIndexedSubscript:", v20 - 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "centerYAnchor");
          v23 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v23 = v157;
        }
        if (v20 >= (unint64_t)obj)
        {
          v28 = v159;
          v26 = v161;
        }
        else
        {
          v26 = v161;
          -[NSArray objectAtIndexedSubscript:](v161->_toolButtons, "objectAtIndexedSubscript:", v20);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "centerYAnchor");
          v28 = (id)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v19, "topAnchor");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v23;
        objc_msgSend(v29, "constraintEqualToAnchor:", v23);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v15, "addObject:", v31);

        objc_msgSend(v19, "bottomAnchor");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v28;
        objc_msgSend(v32, "constraintEqualToAnchor:", v28);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v15, "addObject:", v34);

        objc_msgSend(v19, "widthAnchor");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "constraintEqualToConstant:", 0.0);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v15, "addObject:", v36);

        objc_msgSend(v19, "centerXAnchor");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUPhotoEditToolbar centerXAnchor](v26, "centerXAnchor");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "constraintEqualToAnchor:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v15, "addObject:", v39);

        if (!v21)
          goto LABEL_44;
        objc_msgSend(v19, "heightAnchor");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "heightAnchor");
        v41 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v20)
        {
          -[NSArray objectAtIndexedSubscript:](v161->_toolButtons, "objectAtIndexedSubscript:", v20 - 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "centerXAnchor");
          v25 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v25 = v156;
        }
        if (v20 >= (unint64_t)obj)
        {
          v44 = v158;
          v42 = v161;
        }
        else
        {
          v42 = v161;
          -[NSArray objectAtIndexedSubscript:](v161->_toolButtons, "objectAtIndexedSubscript:", v20);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "centerXAnchor");
          v44 = (id)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v19, "leadingAnchor");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v25;
        objc_msgSend(v45, "constraintEqualToAnchor:", v25);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v15, "addObject:", v46);

        objc_msgSend(v19, "trailingAnchor");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v44;
        objc_msgSend(v47, "constraintEqualToAnchor:", v44);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v15, "addObject:", v48);

        objc_msgSend(v19, "heightAnchor");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "constraintEqualToConstant:", 0.0);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v15, "addObject:", v50);

        objc_msgSend(v19, "centerYAnchor");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUPhotoEditToolbar centerYAnchor](v42, "centerYAnchor");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "constraintEqualToAnchor:", v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v15, "addObject:", v53);

        if (!v21)
          goto LABEL_44;
        objc_msgSend(v19, "widthAnchor");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "widthAnchor");
        v41 = objc_claimAutoreleasedReturnValue();
      }
      v54 = (void *)v41;
      objc_msgSend(v40, "constraintEqualToAnchor:", v41);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v15, "addObject:", v55);

LABEL_44:
      if (v167 == ++v20)
      {

        v6 = v160;
        self = v161;
        break;
      }
    }
  }
  v173 = 0u;
  v174 = 0u;
  v171 = 0u;
  v172 = 0u;
  v56 = v154;
  v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v171, v175, 16);
  v58 = 0x1E0CB3000uLL;
  if (!v57)
  {
    v60 = 0;
    goto LABEL_92;
  }
  v59 = v57;
  v60 = 0;
  v168 = *(_QWORD *)v172;
  obja = v56;
  do
  {
    for (i = 0; i != v59; ++i)
    {
      v62 = v60;
      if (*(_QWORD *)v172 != v168)
        objc_enumerationMutation(obja);
      v63 = *(UIView **)(*((_QWORD *)&v171 + 1) + 8 * i);
      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v63, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      if (v62)
      {
        _NSDictionaryOfVariableBindings(CFSTR("item, previousItem"), v63, v62, 0);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        stretchableView = self->_stretchableView;
        v68 = v63 == stretchableView || v62 == stretchableView;
        v69 = v165 != 2 || v68;
        if (!v170)
        {
          if ((v69 & 1) != 0)
          {
            if (v68)
              v78 = CFSTR("[previousItem]-stretchableViewItemSpacing-[item]");
            else
              v78 = CFSTR("[previousItem]-toolButtonSpacing-[item]");
            objc_msgSend(*(id *)(v58 + 1816), "constraintsWithVisualFormat:options:metrics:views:", v78, 0, v6, v64);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSArray addObjectsFromArray:](v15, "addObjectsFromArray:", v79);

          }
LABEL_77:
          v80 = self->_stretchableView;
          v81 = -[PUPhotoEditToolbar useLargeShortSideHeight](self, "useLargeShortSideHeight");
          v82 = *(void **)(v58 + 1816);
          if (v63 != v80)
          {
            if (v81)
            {
              v83 = CFSTR("V:[item]-tallItemMargin-|");
              v84 = 0x10000;
            }
            else
            {
              v83 = CFSTR("V:|[item]|");
              v84 = 0;
            }
            objc_msgSend(v82, "constraintsWithVisualFormat:options:metrics:views:", v83, v84, v6, v64);
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSArray addObjectsFromArray:](v15, "addObjectsFromArray:", v89);

            v58 = 0x1E0CB3000uLL;
            objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v63, 7, 1, 0, 0, 1.0, 49.0);
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSArray addObject:](v15, "addObject:", v90);

            goto LABEL_88;
          }
          if (v81)
            v87 = CFSTR("V:[item]-barShortSideMargin-|");
          else
            v87 = CFSTR("V:|[item]|");
          objc_msgSend(v82, "constraintsWithVisualFormat:options:metrics:views:", v87, 0, v6, v64);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObjectsFromArray:](v15, "addObjectsFromArray:", v88);

          LODWORD(v65) = 0;
          v85 = v63;
          v86 = 0;
LABEL_85:
          -[UIView setContentHuggingPriority:forAxis:](v85, "setContentHuggingPriority:forAxis:", v86, v65);
          goto LABEL_88;
        }
        if ((v69 & 1) != 0)
        {
          if (v68)
            v70 = CFSTR("V:[previousItem]-stretchableViewItemSpacing-[item]");
          else
            v70 = CFSTR("V:[previousItem]-toolButtonSpacing-[item]");
          objc_msgSend(*(id *)(v58 + 1816), "constraintsWithVisualFormat:options:metrics:views:", v70, 0, v6, v64);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObjectsFromArray:](v15, "addObjectsFromArray:", v71);

          v58 = 0x1E0CB3000;
        }
      }
      else
      {
        _NSDictionaryOfVariableBindings(CFSTR("item"), v63, 0);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v170)
          goto LABEL_77;
      }
      if (v63 == self->_stretchableView)
      {
        LODWORD(v65) = 0;
        v85 = v63;
        v86 = 1;
        goto LABEL_85;
      }
      if (!-[PUPhotoEditToolbar useLargeShortSideHeight](self, "useLargeShortSideHeight"))
      {
        objc_msgSend(*(id *)(v58 + 1816), "constraintsWithVisualFormat:options:metrics:views:", CFSTR("[item]|"), 0x10000, v6, v64);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObjectsFromArray:](v15, "addObjectsFromArray:", v72);

        v58 = 0x1E0CB3000uLL;
      }
      objc_msgSend(*(id *)(v58 + 1816), "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v63, 8, 1, 0, 0, 1.0, 49.0);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v15, "addObject:", v73);

      -[UIView centerXAnchor](v63, "centerXAnchor");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPhotoEditToolbar mainToolbarContainer](self, "mainToolbarContainer");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "centerXAnchor");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "constraintEqualToAnchor:", v76);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v15, "addObject:", v77);

      v6 = v160;
      self = v161;

      v58 = 0x1E0CB3000;
LABEL_88:
      v60 = v63;

    }
    v56 = obja;
    v59 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v171, v175, 16);
  }
  while (v59);
LABEL_92:

  if (v155)
  {
    objc_msgSend(v56, "firstObject");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "lastObject");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = *(void **)(v58 + 1816);
    v94 = v58;
    v95 = v157;
    if (v170)
    {
      objc_msgSend(v93, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v91, 3, 0, v161->_mainActionButton, 4, 1.0, 15.0);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v15, "addObject:", v96);

      v97 = *(void **)(v94 + 1816);
      secondaryActionButton = v161->_secondaryActionButton;
      v99 = 1.0;
      v100 = -10.0;
      v101 = v92;
      v102 = 4;
      v103 = 3;
    }
    else
    {
      objc_msgSend(v93, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v91, 5, 0, v161->_secondaryActionButton, 6, 1.0, 15.0);
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v15, "addObject:", v127);

      v97 = *(void **)(v94 + 1816);
      secondaryActionButton = v161->_mainActionButton;
      v99 = 1.0;
      v100 = -10.0;
      v101 = v92;
      v102 = 6;
      v103 = 5;
    }
    objc_msgSend(v97, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v101, v102, 0, secondaryActionButton, v103, v99, v100);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v15, "addObject:", v106);
    goto LABEL_102;
  }
  v95 = v157;
  if (v153 == 1)
  {
    objb = v56;
    -[NSArray objectAtIndexedSubscript:](self->_toolButtons, "objectAtIndexedSubscript:", 0);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectAtIndexedSubscript:](self->_toolButtons, "objectAtIndexedSubscript:", -[NSArray count](self->_toolButtons, "count") - 1);
    v105 = self;
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectAtIndexedSubscript:](v105->_toolButtonLayoutGuides, "objectAtIndexedSubscript:", 0);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectAtIndexedSubscript:](v105->_toolButtonLayoutGuides, "objectAtIndexedSubscript:", 1);
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    v169 = v104;
    if (v170)
    {
      objc_msgSend(v106, "topAnchor");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPhotoEditToolbar mainToolbarContainer](v105, "mainToolbarContainer");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "topAnchor");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "constraintEqualToAnchor:", v109);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v15, "addObject:", v110);

      objc_msgSend(v106, "bottomAnchor");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "topAnchor");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "constraintEqualToAnchor:", v112);
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v15, "addObject:", v113);

      v114 = v166;
      objc_msgSend(v166, "topAnchor");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "bottomAnchor");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "constraintEqualToAnchor:", v116);
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v15, "addObject:", v117);

      objc_msgSend(v166, "bottomAnchor");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPhotoEditToolbar mainToolbarContainer](v105, "mainToolbarContainer");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v119, "bottomAnchor");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "constraintEqualToAnchor:", v120);
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v15, "addObject:", v121);

      objc_msgSend(v106, "heightAnchor");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v166, "heightAnchor");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v122, "constraintEqualToAnchor:", v123);
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v15, "addObject:", v124);

      objc_msgSend(v106, "widthAnchor");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v125, "constraintEqualToConstant:", 0.0);
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v15, "addObject:", v126);

      objc_msgSend(v166, "widthAnchor");
    }
    else
    {
      objc_msgSend(v106, "leadingAnchor");
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPhotoEditToolbar mainToolbarContainer](v105, "mainToolbarContainer");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v129, "leadingAnchor");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v128, "constraintEqualToAnchor:", v130);
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v15, "addObject:", v131);

      objc_msgSend(v106, "trailingAnchor");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "leadingAnchor");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v132, "constraintEqualToAnchor:", v133);
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v15, "addObject:", v134);

      v114 = v166;
      objc_msgSend(v166, "leadingAnchor");
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "trailingAnchor");
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v135, "constraintEqualToAnchor:", v136);
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v15, "addObject:", v137);

      objc_msgSend(v166, "trailingAnchor");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPhotoEditToolbar mainToolbarContainer](v105, "mainToolbarContainer");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v139, "trailingAnchor");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v138, "constraintEqualToAnchor:", v140);
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v15, "addObject:", v141);

      objc_msgSend(v106, "widthAnchor");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v166, "widthAnchor");
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v142, "constraintEqualToAnchor:", v143);
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v15, "addObject:", v144);

      objc_msgSend(v106, "heightAnchor");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v145, "constraintEqualToConstant:", 0.0);
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v15, "addObject:", v146);

      objc_msgSend(v166, "heightAnchor");
    }
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "constraintEqualToConstant:", 0.0);
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v15, "addObject:", v148);

    v95 = v157;
    v56 = objb;
    v91 = v169;
LABEL_102:

    v6 = v160;
    self = v161;
  }
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v15);
  toolButtonsConstraints = self->_toolButtonsConstraints;
  self->_toolButtonsConstraints = v15;
  v150 = v15;

LABEL_104:
}

- (void)_updateBackgroundAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  int v7;
  int64_t v8;
  double v9;
  double v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  double v15;
  id v16;
  id v17;
  double v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v23[7];
  _QWORD v24[3];

  v3 = a3;
  v24[2] = *MEMORY[0x1E0C80C00];
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "toolbarShadowsEnabled");

  v8 = -[PUPhotoEditToolbar layoutOrientation](self, "layoutOrientation");
  v9 = 0.0;
  v10 = 1.0;
  switch(-[PUPhotoEditToolbar backgroundStyle](self, "backgroundStyle"))
  {
    case 1:
      objc_msgSend(v5, "photoEditingToolbarDarkGradientStartColor");
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v12 = objc_msgSend(v11, "CGColor");

      objc_msgSend(v5, "photoEditingToolbarDarkGradientEndColor");
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v14 = objc_msgSend(v13, "CGColor");

      v9 = 1.0;
      v15 = 0.5;
      v10 = 0.0;
      goto LABEL_6;
    case 2:
      objc_msgSend(v5, "photoEditingToolbarLightGradientStartColor");
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v12 = objc_msgSend(v16, "CGColor");

      objc_msgSend(v5, "photoEditingToolbarLightGradientEndColor");
      v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v14 = objc_msgSend(v17, "CGColor");

      goto LABEL_5;
    case 3:
      objc_msgSend(v5, "photoEditingToolbarUltralightGradientStartColor");
      v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v12 = objc_msgSend(v19, "CGColor");

      objc_msgSend(v5, "photoEditingToolbarUltralightGradientEndColor");
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v14 = objc_msgSend(v20, "CGColor");

      v18 = 1.0;
      if (v8 == 2)
        v10 = 0.5;
      else
        v10 = 1.0;
      if (v8 == 2)
        v15 = 0.0;
      else
        v15 = 0.5;
      if (v8 == 2)
        v9 = 0.5;
      else
        v9 = 0.0;
      if (v8 != 2)
        v18 = 0.5;
      goto LABEL_20;
    case 4:
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v14 = objc_msgSend(v21, "CGColor");

      v15 = 0.5;
      v18 = 0.5;
      v12 = v14;
      goto LABEL_20;
    default:
      v14 = 0;
      v12 = 0;
LABEL_5:
      v15 = 0.5;
LABEL_6:
      v18 = 0.5;
LABEL_20:
      -[CAGradientLayer setStartPoint:](self->_gradientLayer, "setStartPoint:", v18, v9);
      -[CAGradientLayer setEndPoint:](self->_gradientLayer, "setEndPoint:", v15, v10);
      if (v3)
      {
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __48__PUPhotoEditToolbar__updateBackgroundAnimated___block_invoke;
        v23[3] = &unk_1E58A5BB0;
        v23[4] = self;
        v23[5] = v12;
        v23[6] = v14;
        objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v23, &__block_literal_global_62491, 0.2);
        if (!v7)
          goto LABEL_25;
      }
      else
      {
        v24[0] = v12;
        v24[1] = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAGradientLayer setColors:](self->_gradientLayer, "setColors:", v22);

        if (!v7)
          goto LABEL_25;
      }
      -[CAGradientLayer setHidden:](self->_gradientLayer, "setHidden:", 1);
LABEL_25:

      return;
  }
}

- (void)accessibilityLongPressChanged:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  id v14;

  v4 = a3;
  objc_msgSend(v4, "locationInView:", self);
  -[PUPhotoEditToolbar hitTest:withEvent:](self, "hitTest:withEvent:", 0);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "state");

  if ((unint64_t)(v5 - 1) < 2)
  {
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v14;
        -[PUPhotoEditToolbar delegate](self, "delegate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "photoEditToolbar:accessibilityHUDItemForButton:", self, v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        -[PUPhotoEditToolbar delegate](self, "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v8)
          objc_msgSend(v9, "photoEditToolbar:showAccessibilityHUDForItem:", self, v8);
        else
          objc_msgSend(v9, "dismissAccessibilityHUDForPhotoEditToolbar:", self);

        goto LABEL_13;
      }
    }
LABEL_10:
    -[PUPhotoEditToolbar delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissAccessibilityHUDForPhotoEditToolbar:", self);
LABEL_13:

    goto LABEL_14;
  }
  if (v5 != 3)
    goto LABEL_10;
  v11 = v14;
  if (v14)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v11 = v14;
    if ((isKindOfClass & 1) != 0)
    {
      -[PUPhotoEditToolbar delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "dismissAccessibilityHUDForPhotoEditToolbar:", self);

      objc_msgSend(v14, "pu_sendActionForControlEventsWithHighlightTimeout:", 64);
LABEL_14:
      v11 = v14;
    }
  }

}

- (int64_t)layoutOrientation
{
  return self->_layoutOrientation;
}

- (BOOL)useLargeShortSideHeight
{
  return self->_useLargeShortSideHeight;
}

- (BOOL)useiPhonePrimaryPortraitHeight
{
  return self->_useiPhonePrimaryPortraitHeight;
}

- (UIEdgeInsets)contentPadding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentPadding.top;
  left = self->_contentPadding.left;
  bottom = self->_contentPadding.bottom;
  right = self->_contentPadding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (NSArray)toolButtons
{
  return self->_toolButtons;
}

- (int64_t)buttonSpacing
{
  return self->_buttonSpacing;
}

- (UIButton)mainActionButton
{
  return self->_mainActionButton;
}

- (UIButton)secondaryActionButton
{
  return self->_secondaryActionButton;
}

- (UIView)stretchableView
{
  return self->_stretchableView;
}

- (int64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (void)setLayoutDirection:(int64_t)a3
{
  self->_layoutDirection = a3;
}

- (double)longSideMargin
{
  return self->_longSideMargin;
}

- (double)topActionButtonPadding
{
  return self->_topActionButtonPadding;
}

- (void)setTopActionButtonPadding:(double)a3
{
  self->_topActionButtonPadding = a3;
}

- (PUPhotoEditToolbarDelegate)delegate
{
  return (PUPhotoEditToolbarDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PUPhotoEditViewControllerSpec)photoEditSpec
{
  return self->_photoEditSpec;
}

- (void)setPhotoEditSpec:(id)a3
{
  objc_storeStrong((id *)&self->_photoEditSpec, a3);
}

- (UIView)mainToolbarContainer
{
  return self->_mainToolbarContainer;
}

- (void)setMainToolbarContainer:(id)a3
{
  objc_storeStrong((id *)&self->_mainToolbarContainer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainToolbarContainer, 0);
  objc_storeStrong((id *)&self->_photoEditSpec, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_stretchableView, 0);
  objc_storeStrong((id *)&self->_secondaryActionButton, 0);
  objc_storeStrong((id *)&self->_mainActionButton, 0);
  objc_storeStrong((id *)&self->_toolButtons, 0);
  objc_storeStrong((id *)&self->_accessibilityLongPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_toolButtonLayoutGuides, 0);
  objc_storeStrong((id *)&self->_toolButtonsConstraints, 0);
  objc_storeStrong((id *)&self->_secondaryActionButtonConstraints, 0);
  objc_storeStrong((id *)&self->_mainActionButtonConstraints, 0);
  objc_storeStrong((id *)&self->_basicViewsConstraints, 0);
  objc_storeStrong((id *)&self->_gradientLayer, 0);
  objc_storeStrong((id *)&self->_gradientBackgroundView, 0);
}

void __48__PUPhotoEditToolbar__updateBackgroundAnimated___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v2 = a1[6];
  v4[0] = a1[5];
  v4[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1[4] + 424), "setColors:", v3);

}

@end
