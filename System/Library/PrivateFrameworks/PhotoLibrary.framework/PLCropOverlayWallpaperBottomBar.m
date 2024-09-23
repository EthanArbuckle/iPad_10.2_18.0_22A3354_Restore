@implementation PLCropOverlayWallpaperBottomBar

- (void)_commonPLCropOverlayWallpaperBottomBarInitialization
{
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)
    -[PLCropOverlayWallpaperBottomBar _commonPLCropOverlayWallpaperBottomBarInitializationPad](self, "_commonPLCropOverlayWallpaperBottomBarInitializationPad");
  else
    -[PLCropOverlayWallpaperBottomBar _commonPLCropOverlayWallpaperBottomBarInitializationPhone](self, "_commonPLCropOverlayWallpaperBottomBarInitializationPhone");
  -[PLCropOverlayWallpaperBottomBar addSubview:](self, "addSubview:", self->_titleLabel);
}

- (void)_commonPLCropOverlayWallpaperBottomBarInitializationPhone
{
  PLWallpaperButton *v3;
  PLWallpaperButton *v4;
  id v5;
  UIView *v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = (PLWallpaperButton *)+[PLWallpaperButton autoLayoutCommonWallpaperButton](PLWallpaperButton, "autoLayoutCommonWallpaperButton");
  self->_doCancelButton = v3;
  -[PLCropOverlayWallpaperBottomBar addSubview:](self, "addSubview:", v3);
  v4 = (PLWallpaperButton *)+[PLWallpaperButton autoLayoutCommonWallpaperButton](PLWallpaperButton, "autoLayoutCommonWallpaperButton");
  self->_doSetButton = v4;
  -[PLCropOverlayWallpaperBottomBar addSubview:](self, "addSubview:", v4);
  v5 = objc_alloc(MEMORY[0x1E0CEABB0]);
  v6 = (UIView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  self->_separatorLine = v6;
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PLCropOverlayWallpaperBottomBar addSubview:](self, "addSubview:", self->_separatorLine);
  -[UIView setBackgroundColor:](self->_separatorLine, "setBackgroundColor:", objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.47, 0.53, 0.53, 1.0));
  v7 = objc_alloc(MEMORY[0x1E0CEADE8]);
  v8 = (id)objc_msgSend(v7, "initWithContentColor:", objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.86, 0.86, 0.86, 0.6));
  v9 = objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 14.0);
  v10 = objc_alloc(MEMORY[0x1E0CEADE0]);
  self->_titleLabel = (_UILegibilityLabel *)objc_msgSend(v10, "initWithSettings:strength:string:font:", v8, 0, v9, *MEMORY[0x1E0CEC0C0]);
  v11 = (void *)MEMORY[0x1E0CB3718];
  v12 = CFSTR("separatorWidth");
  v13[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0);
  objc_msgSend(v11, "activateConstraints:", objc_msgSend(v11, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_doCancelButton][_separatorLine(==separatorWidth@999)][_doSetButton]|"), 24, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1), _NSDictionaryOfVariableBindings(CFSTR("_doCancelButton, _separatorLine, _doSetButton"), self->_doCancelButton, self->_separatorLine, self->_doSetButton, 0)));
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_doSetButton, 7, 0, self->_doCancelButton, 7, 1.0, 0.0), "setActive:", 1);
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[_doCancelButton]|"), 0, 0, _NSDictionaryOfVariableBindings(CFSTR("_doCancelButton"), self->_doCancelButton, 0)));
}

- (void)_commonPLCropOverlayWallpaperBottomBarInitializationPad
{
  PLWallpaperButton *v3;
  PLWallpaperButton *v4;
  PLWallpaperButton *v5;
  PLWallpaperButton *v6;
  PLWallpaperButton *v7;
  _UIBackdropView *v8;
  PLWallpaperButton *doSetLockScreenButton;
  PLWallpaperButton *doSetBothScreenButton;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[5];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = (PLWallpaperButton *)+[PLWallpaperButton autoLayoutCommonWallpaperButtonWithStyle:](PLWallpaperButton, "autoLayoutCommonWallpaperButtonWithStyle:", 1);
  self->_doCancelButton = v3;
  -[PLCropOverlayWallpaperBottomBar addSubview:](self, "addSubview:", v3);
  v4 = (PLWallpaperButton *)+[PLWallpaperButton autoLayoutCommonWallpaperButtonWithStyle:](PLWallpaperButton, "autoLayoutCommonWallpaperButtonWithStyle:", 1);
  self->_doSetLockScreenButton = v4;
  -[PLCropOverlayWallpaperBottomBar addSubview:](self, "addSubview:", v4);
  v5 = (PLWallpaperButton *)+[PLWallpaperButton autoLayoutCommonWallpaperButtonWithStyle:](PLWallpaperButton, "autoLayoutCommonWallpaperButtonWithStyle:", 1);
  self->_doSetHomeScreenButton = v5;
  -[PLCropOverlayWallpaperBottomBar addSubview:](self, "addSubview:", v5);
  v6 = (PLWallpaperButton *)+[PLWallpaperButton autoLayoutCommonWallpaperButtonWithStyle:](PLWallpaperButton, "autoLayoutCommonWallpaperButtonWithStyle:", 1);
  self->_doSetBothScreenButton = v6;
  -[PLCropOverlayWallpaperBottomBar addSubview:](self, "addSubview:", v6);
  v7 = (PLWallpaperButton *)+[PLWallpaperButton autoLayoutCommonWallpaperButtonWithStyle:](PLWallpaperButton, "autoLayoutCommonWallpaperButtonWithStyle:", 1);
  self->_motionToggle = v7;
  -[PLCropOverlayWallpaperBottomBar addSubview:](self, "addSubview:", v7);
  -[PLCropOverlayWallpaperBottomBar widthForToggleText](self, "widthForToggleText");
  -[PLCropOverlayWallpaperBottomBar setMaxToggleWidth:](self, "setMaxToggleWidth:");
  v8 = (_UIBackdropView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAC68]), "initWithPrivateStyle:", 2010);
  self->_backdropView = v8;
  -[PLCropOverlayWallpaperBottomBar addSubview:](self, "addSubview:", v8);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  doSetLockScreenButton = self->_doSetLockScreenButton;
  v31[0] = self->_doCancelButton;
  v31[1] = doSetLockScreenButton;
  doSetBothScreenButton = self->_doSetBothScreenButton;
  v31[2] = self->_doSetHomeScreenButton;
  v31[3] = doSetBothScreenButton;
  v31[4] = self->_motionToggle;
  v11 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 5);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        -[_UIBackdropView addObserver:](self->_backdropView, "addObserver:", v16);
        objc_msgSend(v16, "backdropViewDidChange:", self->_backdropView);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
    }
    while (v13);
  }
  v17 = objc_alloc(MEMORY[0x1E0CEADE8]);
  v18 = (id)objc_msgSend(v17, "initWithContentColor:", objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.86, 0.86, 0.86, 0.6));
  v19 = objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 18.0);
  v20 = objc_alloc(MEMORY[0x1E0CEADE0]);
  self->_titleLabel = (_UILegibilityLabel *)objc_msgSend(v20, "initWithSettings:strength:string:font:", v18, 0, v19, *MEMORY[0x1E0CEC0C0]);
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v21 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 4);
    v22 = v21;
    if (!self->_shouldOnlyShowHomeScreenButton)
      objc_msgSend(v21, "addObject:", CFSTR("[doSetLockScreenButton]"));
    if (!self->_shouldOnlyShowLockScreenButton)
      objc_msgSend(v22, "addObject:", CFSTR("[doSetHomeScreenButton]"));
    if (!self->_shouldOnlyShowHomeScreenButton && !self->_shouldOnlyShowLockScreenButton)
      objc_msgSend(v22, "addObject:", CFSTR("[doSetBothScreenButton]"));
    if (!self->_motionToggleHidden)
      objc_msgSend(v22, "addObject:", CFSTR("[motionToggle]"));
    v23 = objc_msgSend(v22, "componentsJoinedByString:", CFSTR("-(spacing)-"));
    v29[0] = CFSTR("doCancelButton");
    v30[0] = -[PLCropOverlayWallpaperBottomBar doCancelButton](self, "doCancelButton");
    v29[1] = CFSTR("motionToggle");
    v30[1] = -[PLCropOverlayWallpaperBottomBar motionToggle](self, "motionToggle");
    v29[2] = CFSTR("doSetBothScreenButton");
    v30[2] = -[PLCropOverlayWallpaperBottomBar doSetBothScreenButton](self, "doSetBothScreenButton");
    v29[3] = CFSTR("doSetHomeScreenButton");
    v30[3] = -[PLCropOverlayWallpaperBottomBar doSetHomeScreenButton](self, "doSetHomeScreenButton");
    v29[4] = CFSTR("doSetLockScreenButton");
    v30[4] = -[PLCropOverlayWallpaperBottomBar doSetLockScreenButton](self, "doSetLockScreenButton");
    v24 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 5);
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("H:|-(margin)-[doCancelButton]-(>=spacing)-%@-(margin)-|"), v23), 2048, &unk_1E70C6818, v24));
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[doCancelButton]-|"), 0, 0, v24));
  }
}

- (PLCropOverlayWallpaperBottomBar)initWithFrame:(CGRect)a3
{
  PLCropOverlayWallpaperBottomBar *v3;
  PLCropOverlayWallpaperBottomBar *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLCropOverlayWallpaperBottomBar;
  v3 = -[PLCropOverlayWallpaperBottomBar initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PLCropOverlayWallpaperBottomBar _commonPLCropOverlayWallpaperBottomBarInitialization](v3, "_commonPLCropOverlayWallpaperBottomBarInitialization");
  return v4;
}

- (PLCropOverlayWallpaperBottomBar)initWithCoder:(id)a3
{
  PLCropOverlayWallpaperBottomBar *v3;
  PLCropOverlayWallpaperBottomBar *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLCropOverlayWallpaperBottomBar;
  v3 = -[PLCropOverlayWallpaperBottomBar initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[PLCropOverlayWallpaperBottomBar _commonPLCropOverlayWallpaperBottomBarInitialization](v3, "_commonPLCropOverlayWallpaperBottomBarInitialization");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    -[_UIBackdropView removeObserver:](self->_backdropView, "removeObserver:", self->_doCancelButton);
    -[_UIBackdropView removeObserver:](self->_backdropView, "removeObserver:", self->_doSetHomeScreenButton);
    -[_UIBackdropView removeObserver:](self->_backdropView, "removeObserver:", self->_doSetLockScreenButton);
    -[_UIBackdropView removeObserver:](self->_backdropView, "removeObserver:", self->_doSetBothScreenButton);
    -[_UIBackdropView removeObserver:](self->_backdropView, "removeObserver:", self->_motionToggle);
  }

  v3.receiver = self;
  v3.super_class = (Class)PLCropOverlayWallpaperBottomBar;
  -[PLCropOverlayWallpaperBottomBar dealloc](&v3, sel_dealloc);
}

- (void)layoutSubviews
{
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)
    -[PLCropOverlayWallpaperBottomBar _layoutSubviewsPad](self, "_layoutSubviewsPad");
  else
    -[PLCropOverlayWallpaperBottomBar _layoutSubviewsPhone](self, "_layoutSubviewsPhone");
}

- (void)_layoutSubviewsPhone
{
  void *v3;
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
  double v15;
  double MinY;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGRect v29;
  CGRect v30;

  v3 = (void *)-[PLCropOverlayWallpaperBottomBar window](self, "window");
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "safeAreaInsets");
  -[PLCropOverlayWallpaperBottomBar convertRect:fromCoordinateSpace:](self, "convertRect:fromCoordinateSpace:", v3, v5 + v15, v7 + v12, v9 - (v15 + v13), v11 - (v12 + v14));
  MinY = CGRectGetMinY(v29);
  -[PLCropOverlayWallpaperBottomBar bounds](self, "bounds");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  -[_UILegibilityLabel frame](-[PLCropOverlayWallpaperBottomBar titleLabel](self, "titleLabel"), "frame");
  v26 = ceil(v25);
  v28 = ceil(v27);
  v30.origin.x = v18;
  v30.origin.y = v20;
  v30.size.width = v22;
  v30.size.height = v24;
  -[_UILegibilityLabel setFrame:](-[PLCropOverlayWallpaperBottomBar titleLabel](self, "titleLabel"), "setFrame:", floor(CGRectGetMidX(v30) + v26 * -0.5), MinY + 6.0, v26, v28);
}

- (void)_layoutSubviewsPad
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _UIBackdropView *v20;
  CGRect v21;
  CGRect v22;

  -[PLCropOverlayWallpaperBottomBar bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_UILegibilityLabel frame](-[PLCropOverlayWallpaperBottomBar titleLabel](self, "titleLabel"), "frame");
  v12 = v11;
  v14 = v13;
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen"), "bounds");
  if (v16 == v8)
    v17 = v15;
  else
    v17 = v16;
  v18 = ceil(v12);
  v21.origin.x = v4;
  v21.origin.y = v6;
  v21.size.width = v8;
  v21.size.height = v10;
  v19 = floor(CGRectGetMidX(v21) + v18 * -0.5);
  v22.origin.x = v4;
  v22.origin.y = v6;
  v22.size.width = v8;
  v22.size.height = v10;
  -[_UILegibilityLabel setFrame:](-[PLCropOverlayWallpaperBottomBar titleLabel](self, "titleLabel"), "setFrame:", v19, CGRectGetMaxY(v22) - v17 + 10.0, v18, ceil(v14));
  v20 = -[PLCropOverlayWallpaperBottomBar backdropView](self, "backdropView");
  -[PLCropOverlayWallpaperBottomBar bounds](self, "bounds");
  -[_UIBackdropView setFrame:](v20, "setFrame:");
  -[PLCropOverlayWallpaperBottomBar sendSubviewToBack:](self, "sendSubviewToBack:", -[PLCropOverlayWallpaperBottomBar backdropView](self, "backdropView"));
}

- (double)widthForToggleText
{
  PLWallpaperButton *v2;
  PLWallpaperButton *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v2 = [PLWallpaperButton alloc];
  v3 = -[PLWallpaperButton initWithFrame:style:](v2, "initWithFrame:style:", 1, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[PLWallpaperButton setTitle:forState:](v3, "setTitle:forState:", PLLocalizedFrameworkString(), 0);
  v4 = *MEMORY[0x1E0C9D820];
  v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  -[PLWallpaperButton sizeThatFits:](v3, "sizeThatFits:", *MEMORY[0x1E0C9D820], v5);
  v7 = v6;
  -[PLWallpaperButton setTitle:forState:](v3, "setTitle:forState:", PLLocalizedFrameworkString(), 0);
  -[PLWallpaperButton sizeThatFits:](v3, "sizeThatFits:", v4, v5);
  v9 = v8;

  if (v9 >= v7)
    return v9;
  else
    return v7;
}

- (void)setText:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;

  v5 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  -[PLCropOverlayWallpaperBottomBar _sizeForString:](self, "_sizeForString:");
  -[_UILegibilityLabel setFrame:](-[PLCropOverlayWallpaperBottomBar titleLabel](self, "titleLabel"), "setFrame:", v5, v6, v7, v8);
  -[_UILegibilityLabel setString:](-[PLCropOverlayWallpaperBottomBar titleLabel](self, "titleLabel"), "setString:", a3);
  -[PLCropOverlayWallpaperBottomBar setNeedsLayout](self, "setNeedsLayout");
}

- (CGSize)_sizeForString:(id)a3
{
  uint64_t v4;
  double v5;
  double v6;
  uint64_t v7;
  _QWORD v8[2];
  CGSize result;

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = -[_UILegibilityLabel font](-[PLCropOverlayWallpaperBottomBar titleLabel](self, "titleLabel"), "font");
  v7 = *MEMORY[0x1E0CEA098];
  v8[0] = v4;
  objc_msgSend(a3, "sizeWithAttributes:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1));
  result.height = v6;
  result.width = v5;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PLCropOverlayWallpaperBottomBar _sizeForString:](self, "_sizeForString:", -[_UILegibilityLabel string](-[PLCropOverlayWallpaperBottomBar titleLabel](self, "titleLabel", a3.width, a3.height), "string"));
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)updateForChangedSettings:(id)a3
{
  -[_UILegibilityLabel updateForChangedSettings:](-[PLCropOverlayWallpaperBottomBar titleLabel](self, "titleLabel"), "updateForChangedSettings:", a3);
}

- (PLWallpaperButton)doCancelButton
{
  return self->_doCancelButton;
}

- (PLWallpaperButton)doSetButton
{
  return self->_doSetButton;
}

- (PLWallpaperButton)doSetHomeScreenButton
{
  return self->_doSetHomeScreenButton;
}

- (PLWallpaperButton)doSetLockScreenButton
{
  return self->_doSetLockScreenButton;
}

- (PLWallpaperButton)doSetBothScreenButton
{
  return self->_doSetBothScreenButton;
}

- (PLWallpaperButton)motionToggle
{
  return self->_motionToggle;
}

- (BOOL)motionToggleHidden
{
  return self->_motionToggleHidden;
}

- (void)setMotionToggleHidden:(BOOL)a3
{
  self->_motionToggleHidden = a3;
}

- (BOOL)shouldOnlyShowLockScreenButton
{
  return self->_shouldOnlyShowLockScreenButton;
}

- (void)setShouldOnlyShowLockScreenButton:(BOOL)a3
{
  self->_shouldOnlyShowLockScreenButton = a3;
}

- (BOOL)shouldOnlyShowHomeScreenButton
{
  return self->_shouldOnlyShowHomeScreenButton;
}

- (void)setShouldOnlyShowHomeScreenButton:(BOOL)a3
{
  self->_shouldOnlyShowHomeScreenButton = a3;
}

- (_UILegibilityLabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 472);
}

- (UIView)separatorLine
{
  return self->_separatorLine;
}

- (void)setSeparatorLine:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 480);
}

- (_UIBackdropView)backdropView
{
  return self->_backdropView;
}

- (void)setBackdropView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 488);
}

- (double)maxToggleWidth
{
  return self->_maxToggleWidth;
}

- (void)setMaxToggleWidth:(double)a3
{
  self->_maxToggleWidth = a3;
}

@end
