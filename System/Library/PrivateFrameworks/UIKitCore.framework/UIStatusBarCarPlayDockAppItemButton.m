@implementation UIStatusBarCarPlayDockAppItemButton

- (UIStatusBarCarPlayDockAppItemButton)initWithFrame:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIStatusBarCarPlayDockAppItemButton *v7;
  UIImageView *v8;
  UIImageView *iconImageView;
  UIImageView *v10;
  UIImageView *iconHighlightImageView;
  UIImageView *v12;
  UIImageView *badgeView;
  double v14;
  void *v15;
  uint64_t v16;
  NSLayoutConstraint *widthConstraint;
  void *v18;
  uint64_t v19;
  NSLayoutConstraint *heightConstraint;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
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
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  objc_super v49;
  _QWORD v50[14];

  v50[12] = *MEMORY[0x1E0C80C00];
  v49.receiver = self;
  v49.super_class = (Class)UIStatusBarCarPlayDockAppItemButton;
  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v7 = -[UIButton initWithFrame:](&v49, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v4, v5, v6);
  if (v7)
  {
    v8 = -[UIImageView initWithFrame:]([UIImageView alloc], "initWithFrame:", v3, v4, v5, v6);
    iconImageView = v7->_iconImageView;
    v7->_iconImageView = v8;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v7->_iconImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v7, "addSubview:", v7->_iconImageView);
    v10 = -[UIImageView initWithFrame:]([UIImageView alloc], "initWithFrame:", v3, v4, v5, v6);
    iconHighlightImageView = v7->_iconHighlightImageView;
    v7->_iconHighlightImageView = v10;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v7->_iconHighlightImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v7, "addSubview:", v7->_iconHighlightImageView);
    -[UIImageView setHidden:](v7->_iconHighlightImageView, "setHidden:", 1);
    v12 = -[UIImageView initWithFrame:]([UIImageView alloc], "initWithFrame:", v3, v4, v5, v6);
    badgeView = v7->_badgeView;
    v7->_badgeView = v12;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v7->_badgeView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v7, "addSubview:", v7->_badgeView);
    -[UIImageView setHidden:](v7->_badgeView, "setHidden:", 1);
    -[UIButton setShowsTouchWhenHighlighted:](v7, "setShowsTouchWhenHighlighted:", 1);
    -[UIControl addTarget:action:forControlEvents:](v7, "addTarget:action:forControlEvents:", v7, sel__buttonPressed_, 0x2000);
    -[UIView setUserInteractionEnabled:](v7, "setUserInteractionEnabled:", 1);
    LODWORD(v14) = -1102263091;
    -[UIStatusBarCarPlayDockAppItemButton setCharge:](v7, "setCharge:", v14);
    -[UIView widthAnchor](v7->_iconImageView, "widthAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToConstant:", 23.0);
    v16 = objc_claimAutoreleasedReturnValue();
    widthConstraint = v7->_widthConstraint;
    v7->_widthConstraint = (NSLayoutConstraint *)v16;

    -[UIView heightAnchor](v7->_iconImageView, "heightAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToConstant:", 23.0);
    v19 = objc_claimAutoreleasedReturnValue();
    heightConstraint = v7->_heightConstraint;
    v7->_heightConstraint = (NSLayoutConstraint *)v19;

    v50[0] = v7->_widthConstraint;
    v50[1] = v7->_heightConstraint;
    -[UIView centerXAnchor](v7->_iconImageView, "centerXAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](v7, "centerXAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:", v47);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v50[2] = v46;
    -[UIView centerYAnchor](v7->_iconImageView, "centerYAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](v7, "centerYAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:", v44);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v50[3] = v43;
    -[UIView widthAnchor](v7->_iconHighlightImageView, "widthAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToConstant:", 31.0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v50[4] = v41;
    -[UIView heightAnchor](v7->_iconHighlightImageView, "heightAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToConstant:", 31.0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v50[5] = v39;
    -[UIView centerXAnchor](v7->_iconHighlightImageView, "centerXAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](v7, "centerXAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v37);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v50[6] = v36;
    -[UIView centerYAnchor](v7->_iconHighlightImageView, "centerYAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](v7, "centerYAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v34);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v50[7] = v33;
    -[UIView widthAnchor](v7->_badgeView, "widthAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToConstant:", 9.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v50[8] = v21;
    -[UIView heightAnchor](v7->_badgeView, "heightAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToConstant:", 9.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v50[9] = v23;
    -[UIView centerXAnchor](v7->_badgeView, "centerXAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v7->_iconImageView, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25, -1.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v50[10] = v26;
    -[UIView centerYAnchor](v7->_badgeView, "centerYAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v7->_iconImageView, "topAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:constant:", v28, 1.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v50[11] = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 12);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v31);
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  UIStatusBarCarPlayDockAppItemButton *v4;
  UIStatusBarCarPlayDockAppItemButton *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = [UIStatusBarCarPlayDockAppItemButton alloc];
  v5 = -[UIStatusBarCarPlayDockAppItemButton initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[UIStatusBarCarPlayDockAppItemButton bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStatusBarCarPlayDockAppItemButton setBundleIdentifier:](v5, "setBundleIdentifier:", v6);

  -[UIStatusBarCarPlayDockAppItemButton iconImageView](self, "iconImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStatusBarCarPlayDockAppItemButton iconImageView](v5, "iconImageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImage:", v8);

  -[UIStatusBarCarPlayDockAppItemButton iconHighlightImageView](self, "iconHighlightImageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "image");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStatusBarCarPlayDockAppItemButton iconHighlightImageView](v5, "iconHighlightImageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setImage:", v11);

  -[UIStatusBarCarPlayDockAppItemButton setActive:](v5, "setActive:", -[UIStatusBarCarPlayDockAppItemButton isActive](self, "isActive"));
  -[UIStatusBarCarPlayDockAppItemButton iconHighlightImageView](self, "iconHighlightImageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isHidden");
  -[UIStatusBarCarPlayDockAppItemButton iconHighlightImageView](v5, "iconHighlightImageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setHidden:", v14);

  -[UIStatusBarCarPlayDockAppItemButton setHasBadge:](v5, "setHasBadge:", -[UIStatusBarCarPlayDockAppItemButton hasBadge](self, "hasBadge"));
  -[UIStatusBarCarPlayDockAppItemButton badgeView](self, "badgeView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "image");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStatusBarCarPlayDockAppItemButton badgeView](v5, "badgeView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setImage:", v17);

  return v5;
}

- (float)charge
{
  return -0.2;
}

- (void)setCharge:(float)a3
{
  double v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIStatusBarCarPlayDockAppItemButton;
  LODWORD(v3) = -1102263091;
  -[UIView setCharge:](&v4, sel_setCharge_, v3);
}

- (BOOL)itemHasBundleIdentifier
{
  void *v2;
  BOOL v3;

  -[UIStatusBarCarPlayDockAppItemButton bundleIdentifier](self, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)setActive:(BOOL)a3
{
  NSLayoutConstraint *widthConstraint;
  double v5;

  if (self->_active != a3)
  {
    self->_active = a3;
    widthConstraint = self->_widthConstraint;
    if (a3)
      v5 = 29.0;
    else
      v5 = 23.0;
    -[NSLayoutConstraint setConstant:](widthConstraint, "setConstant:", v5);
    -[NSLayoutConstraint setConstant:](self->_heightConstraint, "setConstant:", v5);
  }
}

- (BOOL)shouldShowBadge
{
  _BOOL4 v3;

  v3 = -[UIStatusBarCarPlayDockAppItemButton hasBadge](self, "hasBadge");
  if (v3)
  {
    if (-[UIView isFocused](self, "isFocused"))
      LOBYTE(v3) = 0;
    else
      LOBYTE(v3) = !-[UIStatusBarCarPlayDockAppItemButton isActive](self, "isActive");
  }
  return v3;
}

- (void)setBadgeHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  void *v7;
  int v8;
  void *v9;
  UIImageView *v10;
  void *v11;
  void *v12;
  UIImageView *v13;
  void *v14;
  uint64_t v15;
  UIImageView *v16;
  void *v17;
  _QWORD v18[5];
  CGAffineTransform v19;
  _QWORD v20[4];
  UIImageView *v21;
  _QWORD v22[4];
  UIImageView *v23;

  v4 = a4;
  v5 = a3;
  -[UIStatusBarCarPlayDockAppItemButton badgeView](self, "badgeView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isHidden");

  if (v8 != v5)
  {
    -[UIStatusBarCarPlayDockAppItemButton badgeView](self, "badgeView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", v5);

    if (v4)
    {
      if (v5)
      {
        v10 = [UIImageView alloc];
        -[UIStatusBarCarPlayDockAppItemButton badgeView](self, "badgeView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "image");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[UIImageView initWithImage:](v10, "initWithImage:", v12);

        -[UIStatusBarCarPlayDockAppItemButton badgeView](self, "badgeView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "frame");
        -[UIImageView setFrame:](v13, "setFrame:");

        -[UIView addSubview:](self, "addSubview:", v13);
        v15 = MEMORY[0x1E0C809B0];
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __63__UIStatusBarCarPlayDockAppItemButton_setBadgeHidden_animated___block_invoke;
        v22[3] = &unk_1E16B1B28;
        v23 = v13;
        v20[0] = v15;
        v20[1] = 3221225472;
        v20[2] = __63__UIStatusBarCarPlayDockAppItemButton_setBadgeHidden_animated___block_invoke_2;
        v20[3] = &unk_1E16B3FD8;
        v21 = v23;
        v16 = v23;
        +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v22, v20, 0.3);

      }
      else
      {
        -[UIStatusBarCarPlayDockAppItemButton badgeView](self, "badgeView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        CGAffineTransformMakeScale(&v19, 0.01, 0.01);
        objc_msgSend(v17, "setTransform:", &v19);

        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __63__UIStatusBarCarPlayDockAppItemButton_setBadgeHidden_animated___block_invoke_3;
        v18[3] = &unk_1E16B1B28;
        v18[4] = self;
        +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v18, 0.3);
      }
    }
  }
}

uint64_t __63__UIStatusBarCarPlayDockAppItemButton_setBadgeHidden_animated___block_invoke(uint64_t a1)
{
  void *v1;
  CGAffineTransform v3;

  v1 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v3, 0.01, 0.01);
  return objc_msgSend(v1, "setTransform:", &v3);
}

uint64_t __63__UIStatusBarCarPlayDockAppItemButton_setBadgeHidden_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

void __63__UIStatusBarCarPlayDockAppItemButton_setBadgeHidden_animated___block_invoke_3(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v3[3];

  objc_msgSend(*(id *)(a1 + 32), "badgeView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v3[0] = *MEMORY[0x1E0C9BAA8];
  v3[1] = v2;
  v3[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v1, "setTransform:", v3);

}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIStatusBarCarPlayDockAppItemButton;
  v6 = a3;
  -[UIResponder pressesBegan:withEvent:](&v9, sel_pressesBegan_withEvent_, v6, a4);
  LODWORD(a4) = _UIPressesContainsPressType(v6, 4);

  if ((_DWORD)a4)
  {
    if (-[UIView isUserInteractionEnabled](self, "isUserInteractionEnabled", v9.receiver, v9.super_class))
    {
      -[UIView layer](self, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v8) = 1058642330;
      objc_msgSend(v7, "setOpacity:", v8);

    }
  }
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIStatusBarCarPlayDockAppItemButton;
  v6 = a3;
  -[UIResponder pressesChanged:withEvent:](&v9, sel_pressesChanged_withEvent_, v6, a4);
  LODWORD(a4) = _UIPressesContainsPressType(v6, 4);

  if ((_DWORD)a4)
  {
    -[UIView layer](self, "layer", v9.receiver, v9.super_class);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = 1.0;
    objc_msgSend(v7, "setOpacity:", v8);

  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIStatusBarCarPlayDockAppItemButton;
  v6 = a3;
  -[UIResponder pressesEnded:withEvent:](&v9, sel_pressesEnded_withEvent_, v6, a4);
  LODWORD(a4) = _UIPressesContainsPressType(v6, 4);

  if ((_DWORD)a4)
  {
    -[UIView layer](self, "layer", v9.receiver, v9.super_class);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = 1.0;
    objc_msgSend(v7, "setOpacity:", v8);

  }
}

- (void)_buttonPressed:(id)a3
{
  unint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[3];
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = _buttonPressed____s_category;
  if (!_buttonPressed____s_category)
  {
    v4 = __UILogCategoryGetNode("UIStatusBar", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v4, (unint64_t *)&_buttonPressed____s_category);
  }
  v5 = *(NSObject **)(v4 + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = v5;
    -[UIStatusBarCarPlayDockAppItemButton bundleIdentifier](self, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v15 = v7;
    _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "CarPlayDock item pressed; bundleIdentifier: %{public}@",
      buf,
      0xCu);

  }
  -[UIStatusBarCarPlayDockAppItemButton bundleIdentifier](self, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStatusBarCarPlayDockAppItemButton bundleIdentifier](self, "bundleIdentifier", 0x1E16F26E0, 0x1E176EAE0, 0x1E176EB00, &unk_1E1A9A0F8, &unk_1E1A9A110);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationName:object:userInfo:", 0x1E176EAC0, self, v11);

  }
}

- (BOOL)canBecomeFocused
{
  return !-[UIStatusBarCarPlayDockAppItemButton isActive](self, "isActive");
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  UIStatusBarCarPlayDockAppItemButton *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "nextFocusedItem");
  v5 = (UIStatusBarCarPlayDockAppItemButton *)objc_claimAutoreleasedReturnValue();

  -[UIStatusBarCarPlayDockAppItemButton iconHighlightImageView](self, "iconHighlightImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 == self)
  {
    objc_msgSend(v6, "setHidden:", 0);

    -[UIStatusBarCarPlayDockAppItemButton badgeView](self, "badgeView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v8 = 1;
  }
  else
  {
    objc_msgSend(v6, "setHidden:", 1);

    -[UIStatusBarCarPlayDockAppItemButton badgeView](self, "badgeView");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v8 = -[UIStatusBarCarPlayDockAppItemButton shouldShowBadge](self, "shouldShowBadge") ^ 1;
    v9 = v10;
  }
  objc_msgSend(v9, "setHidden:", v8);

}

- (BOOL)isActive
{
  return self->_active;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 776);
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
  objc_storeStrong((id *)&self->_iconImageView, a3);
}

- (UIImageView)iconHighlightImageView
{
  return self->_iconHighlightImageView;
}

- (void)setIconHighlightImageView:(id)a3
{
  objc_storeStrong((id *)&self->_iconHighlightImageView, a3);
}

- (UIImageView)badgeView
{
  return self->_badgeView;
}

- (void)setBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_badgeView, a3);
}

- (BOOL)hasBadge
{
  return self->_hasBadge;
}

- (void)setHasBadge:(BOOL)a3
{
  self->_hasBadge = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_iconHighlightImageView, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
}

@end
