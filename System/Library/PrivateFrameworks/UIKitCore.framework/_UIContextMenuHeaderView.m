@implementation _UIContextMenuHeaderView

- (_UIContextMenuHeaderView)initWithFrame:(CGRect)a3
{
  _UIContextMenuHeaderView *v3;
  _UIContextMenuHeaderView *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  objc_super v10;
  uint64_t v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)_UIContextMenuHeaderView;
  v3 = -[UICollectionReusableView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView setInsetsLayoutMarginsFromSafeArea:](v3, "setInsetsLayoutMarginsFromSafeArea:", 0);
    -[_UIContextMenuHeaderView _updateBackgroundView](v4, "_updateBackgroundView");
    -[_UIContextMenuHeaderView setSeparatorStyle:](v4, "setSeparatorStyle:", 1);
    v12[0] = objc_opt_class();
    v12[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[UIView registerForTraitChanges:withHandler:](v4, "registerForTraitChanges:withHandler:", v5, &__block_literal_global_339);

    v11 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[UIView registerForTraitChanges:withHandler:](v4, "registerForTraitChanges:withHandler:", v7, &__block_literal_global_7_7);

  }
  return v4;
}

- (void)_updateBackgroundView
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void (**v16)(void);
  UIVisualEffectView *v17;
  UIVisualEffectView *v18;
  void *v19;
  UIVisualEffectView *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _UIContextMenuGetPlatformMetrics(objc_msgSend(v3, "userInterfaceIdiom"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gradientMaskingConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "backgroundMasksCorners");

  if (v6)
  {
    -[UIView layer](self, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAllowsGroupBlending:", 0);

    -[UIView layer](self, "layer");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAllowsGroupOpacity:", 0);
  }
  else
  {
    -[_UIContextMenuHeaderView bgView](self, "bgView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[_UIContextMenuHeaderView bgView](self, "bgView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeFromSuperview");

    }
    v10 = -[_UIContextMenuHeaderView isMenuTitle](self, "isMenuTitle");
    -[UIView traitCollection](self, "traitCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "userInterfaceIdiom");
    _UIContextMenuGetPlatformMetrics(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v10)
    {
      objc_msgSend(v13, "menuTitleBackgroundProvider");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(v14, "menuTitleBackgroundProvider");
        v16 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v16[2]();
        v17 = (UIVisualEffectView *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        _UIContextMenuGetPlatformMetrics(v12);
        v16 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v20 = [UIVisualEffectView alloc];
        objc_msgSend(v16, "menuBackgroundEffect");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[UIVisualEffectView initWithEffect:](v20, "initWithEffect:", v21);

        objc_msgSend(v16, "menuBackgroundColor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setBackgroundColor:](v17, "setBackgroundColor:", v22);

      }
    }
    else
    {
      v18 = [UIVisualEffectView alloc];
      objc_msgSend(v14, "menuBackgroundEffect");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[UIVisualEffectView initWithEffect:](v18, "initWithEffect:", v19);

      objc_msgSend(v14, "menuBackgroundColor");
      v16 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v17, "setBackgroundColor:", v16);
    }

    -[_UIContextMenuHeaderView setBgView:](self, "setBgView:", v17);
    -[_UIContextMenuHeaderView bgView](self, "bgView");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (id)v23;
    if (self)
    {
      -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", v23, 0);
      -[UIView _addBoundsMatchingConstraintsForView:](self, "_addBoundsMatchingConstraintsForView:", v24);
    }
  }

}

- (void)setIsMenuTitle:(BOOL)a3
{
  if (self->_isMenuTitle != a3)
  {
    self->_isMenuTitle = a3;
    -[_UIContextMenuHeaderView _updateBackgroundView](self, "_updateBackgroundView");
  }
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  if ((objc_msgSend(v22, "isEqualToString:", self->_title) & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v22, "copy");
    title = self->_title;
    self->_title = v4;

    -[_UIContextMenuHeaderView titleLabel](self, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = (void *)objc_opt_new();
      -[UIView traitCollection](self, "traitCollection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _UIContextMenuGetPlatformMetrics(objc_msgSend(v8, "userInterfaceIdiom"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "headerPrimaryColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "setTextColor:", v10);
      -[_UIContextMenuHeaderView _titleFont](self, "_titleFont");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setFont:", v11);

      -[UIView traitCollection](self, "traitCollection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "userInterfaceIdiom");
      LODWORD(v10) = -[_UIContextMenuHeaderView isMenuTitle](self, "isMenuTitle");
      _UIContextMenuGetPlatformMetrics(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if ((_DWORD)v10)
        v16 = objc_msgSend(v14, "menuTitleTextAlignment");
      else
        v16 = objc_msgSend(v14, "headerTextAlignment");
      v17 = v16;

      objc_msgSend(v7, "setTextAlignment:", v17);
      objc_msgSend(v7, "setNumberOfLines:", -[_UIContextMenuHeaderView _titleLabelNumberOfLines](self, "_titleLabelNumberOfLines"));
      objc_msgSend(v7, "setAdjustsFontForContentSizeCategory:", 1);
      -[_UIContextMenuHeaderView _titleLabelFilterForCurrentTraits](self, "_titleLabelFilterForCurrentTraits");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        objc_msgSend(v7, "layer");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setCompositingFilter:", v18);

      }
      objc_msgSend(v7, "_setOverrideUserInterfaceRenderingMode:", -[_UIContextMenuHeaderView _labelRenderingMode](self, "_labelRenderingMode"));
      -[_UIContextMenuHeaderView setTitleLabel:](self, "setTitleLabel:", v7);

    }
    -[_UIContextMenuHeaderView titleLabel](self, "titleLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setText:", v22);

    -[_UIContextMenuHeaderView titleLabel](self, "titleLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuHeaderView setContentView:](self, "setContentView:", v21);

  }
}

- (void)setContentView:(id)a3
{
  UIView *v5;
  UIView **p_contentView;
  UIView *contentView;
  UIView *v8;

  v5 = (UIView *)a3;
  p_contentView = &self->_contentView;
  contentView = self->_contentView;
  if (contentView != v5)
  {
    v8 = v5;
    -[UIView removeFromSuperview](contentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_contentView, a3);
    if (*p_contentView)
    {
      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](*p_contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIView addSubview:](self, "addSubview:", *p_contentView);
    }
    -[_UIContextMenuHeaderView _setNeedsConstraintRebuild](self, "_setNeedsConstraintRebuild");
    v5 = v8;
  }

}

- (BOOL)_isDisplayingTitleLabel
{
  _UIContextMenuHeaderView *v2;
  void *v3;
  void *v4;

  v2 = self;
  -[_UIContextMenuHeaderView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuHeaderView titleLabel](v2, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v3 == v4;

  return (char)v2;
}

- (void)setBackgroundMaterialGroupName:(id)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  id v7;

  v7 = a3;
  -[_UIContextMenuHeaderView bgView](self, "bgView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[_UIContextMenuHeaderView bgView](self, "bgView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setGroupName:", v7);

  }
}

- (void)setSeparatorStyle:(unint64_t)a3
{
  void *v4;
  unint64_t separatorStyle;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;

  if (self->_separatorStyle != a3)
  {
    self->_separatorStyle = a3;
    -[_UIContextMenuHeaderView separator](self, "separator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    separatorStyle = self->_separatorStyle;
    if (separatorStyle == 2)
    {
      v12 = (id)objc_opt_new();
      -[UIView traitCollection](self, "traitCollection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _UIContextMenuGetPlatformMetrics(objc_msgSend(v8, "userInterfaceIdiom"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sectionSeparatorColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "setBackgroundColor:", v10);
      v6 = v12;
      if (v12)
      {
LABEL_5:
        v11 = v6;
        objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[UIView addSubview:](self, "addSubview:", v11);
        v7 = v11;
LABEL_8:
        v13 = v7;
        -[_UIContextMenuHeaderView setSeparator:](self, "setSeparator:", v7);
        -[_UIContextMenuHeaderView _setNeedsConstraintRebuild](self, "_setNeedsConstraintRebuild");

        return;
      }
    }
    else if (separatorStyle == 1)
    {
      v6 = (void *)objc_opt_new();
      if (v6)
        goto LABEL_5;
    }
    v7 = 0;
    goto LABEL_8;
  }
}

- (id)_titleFont
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");
  v5 = -[_UIContextMenuHeaderView isMenuTitle](self, "isMenuTitle");
  _UIContextMenuGetPlatformMetrics(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    objc_msgSend(v6, "menuTitleFont");
  else
    objc_msgSend(v6, "headerFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_fontAdjustedForCurrentContentSizeCategory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)_titleLabelNumberOfLines
{
  void *v2;
  void *v3;
  const char *v4;
  int IsAccessibilityContentSizeCategory;

  -[UIView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityContentSizeCategory = _UIContentSizeCategoryIsAccessibilityContentSizeCategory(v3, v4);

  if (IsAccessibilityContentSizeCategory)
    return 0;
  else
    return 20;
}

- (void)_updateCompositingFilterForCurrentState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[_UIContextMenuHeaderView _titleLabelFilterForCurrentTraits](self, "_titleLabelFilterForCurrentTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v7 = v3;
    -[_UIContextMenuHeaderView _titleLabelFilterForCurrentTraits](self, "_titleLabelFilterForCurrentTraits");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuHeaderView titleLabel](self, "titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCompositingFilter:", v4);

    v3 = v7;
  }

}

- (id)_titleLabelFilterForCurrentTraits
{
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _UIContextMenuGetPlatformMetrics(objc_msgSend(v3, "userInterfaceIdiom"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "headerPrimaryCompositingFilterProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "headerPrimaryCompositingFilterProvider");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[UIView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v6)[2](v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_setNeedsConstraintRebuild
{
  self->_needsConstraintRebuild = 1;
  -[UIView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)updateConstraints
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
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
  id v34;
  id v35;
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
  void *v49;
  objc_super v50;
  _QWORD v51[4];
  _QWORD v52[4];
  _QWORD v53[6];

  v53[4] = *MEMORY[0x1E0C80C00];
  if (self->_needsConstraintRebuild)
  {
    self->_needsConstraintRebuild = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuHeaderView separator](self, "separator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)v3;
    if (v4)
    {
      -[UIView traitCollection](self, "traitCollection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "userInterfaceIdiom");

      _UIContextMenuGetPlatformMetrics(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "sectionSeparatorInsets");
      v9 = v8;
      v11 = v10;

      objc_msgSend(v4, "leadingAnchor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView leadingAnchor](self, "leadingAnchor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "constraintEqualToAnchor:constant:", v44, v9);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v53[0] = v42;
      objc_msgSend(v4, "trailingAnchor");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView trailingAnchor](self, "trailingAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "constraintEqualToAnchor:constant:", v12, -v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v53[1] = v13;
      objc_msgSend(v4, "bottomAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](self, "bottomAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "constraintEqualToAnchor:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v53[2] = v16;
      objc_msgSend(v4, "heightAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIContextMenuHeaderView _separatorHeight](self, "_separatorHeight");
      objc_msgSend(v17, "constraintEqualToConstant:");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v53[3] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "addObjectsFromArray:", v19);

    }
    -[_UIContextMenuHeaderView contentView](self, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v48 = v4;
      if (-[_UIContextMenuHeaderView _isDisplayingTitleLabel](self, "_isDisplayingTitleLabel"))
      {
        -[UIView layoutMarginsGuide](self, "layoutMarginsGuide");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "leadingAnchor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "leadingAnchor");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v22;
        objc_msgSend(v22, "constraintEqualToAnchor:", v43);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v52[0] = v41;
        objc_msgSend(v20, "trailingAnchor");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "trailingAnchor");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v23;
        objc_msgSend(v23, "constraintEqualToAnchor:", v38);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v52[1] = v24;
        objc_msgSend(v20, "topAnchor");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "topAnchor");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "constraintEqualToAnchor:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v52[2] = v27;
        objc_msgSend(v20, "lastBaselineAnchor");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v21;
        objc_msgSend(v21, "bottomAnchor");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "constraintEqualToAnchor:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v52[3] = v30;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 4);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "addObjectsFromArray:", v31);

      }
      else
      {
        objc_msgSend(v4, "topAnchor");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v32;
        if (v32)
        {
          v34 = v32;
        }
        else
        {
          -[UIView bottomAnchor](self, "bottomAnchor");
          v34 = (id)objc_claimAutoreleasedReturnValue();
        }
        v35 = v34;

        objc_msgSend(v20, "leadingAnchor");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView leadingAnchor](self, "leadingAnchor");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v36;
        objc_msgSend(v36, "constraintEqualToAnchor:", v43);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v51[0] = v41;
        objc_msgSend(v20, "trailingAnchor");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView trailingAnchor](self, "trailingAnchor");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v37;
        objc_msgSend(v37, "constraintEqualToAnchor:", v38);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v51[1] = v24;
        objc_msgSend(v20, "topAnchor");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView topAnchor](self, "topAnchor");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "constraintEqualToAnchor:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v51[2] = v27;
        objc_msgSend(v20, "bottomAnchor");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v35;
        objc_msgSend(v28, "constraintEqualToAnchor:", v35);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v51[3] = v29;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 4);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "addObjectsFromArray:", v30);
      }

      v4 = v48;
    }
    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v49);

  }
  v50.receiver = self;
  v50.super_class = (Class)_UIContextMenuHeaderView;
  -[UIView updateConstraints](&v50, sel_updateConstraints);
}

- (void)setUnscaledLayoutMargins:(NSDirectionalEdgeInsets)a3
{
  if (a3.leading != self->_unscaledLayoutMargins.leading
    || a3.top != self->_unscaledLayoutMargins.top
    || a3.trailing != self->_unscaledLayoutMargins.trailing
    || a3.bottom != self->_unscaledLayoutMargins.bottom)
  {
    self->_unscaledLayoutMargins = a3;
    -[_UIContextMenuHeaderView _updateLayoutMargins](self, "_updateLayoutMargins");
  }
}

- (void)_updateLayoutMargins
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
  id v14;

  -[_UIContextMenuHeaderView _titleFont](self, "_titleFont");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuHeaderView unscaledLayoutMargins](self, "unscaledLayoutMargins");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  objc_msgSend(v14, "_scaledValueForValue:");
  UIRoundToViewScale(self);
  v10 = v9;
  objc_msgSend(v14, "_scaledValueForValue:", v6);
  UIRoundToViewScale(self);
  v12 = v11;
  -[_UIContextMenuHeaderView _separatorHeight](self, "_separatorHeight");
  -[UIView setDirectionalLayoutMargins:](self, "setDirectionalLayoutMargins:", v10, v4, v12 + v13, v8);

}

- (double)_separatorHeight
{
  unint64_t separatorStyle;
  double v3;
  void *v4;
  void *v5;
  double v6;

  separatorStyle = self->_separatorStyle;
  if (separatorStyle == 2)
  {
    -[UIView traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _UIContextMenuGetPlatformMetrics(objc_msgSend(v4, "userInterfaceIdiom"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sectionSeparatorHeight");
    goto LABEL_5;
  }
  v3 = 0.0;
  if (separatorStyle == 1)
  {
    -[UIView traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _UIContextMenuGetPlatformMetrics(objc_msgSend(v4, "userInterfaceIdiom"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itemSeparatorHeight");
LABEL_5:
    v3 = v6;

  }
  return v3;
}

- (int64_t)_labelRenderingMode
{
  void *v2;
  void *v3;
  int64_t v4;

  -[UIView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _UIContextMenuGetPlatformMetrics(objc_msgSend(v2, "userInterfaceIdiom"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "itemSubtitleRenderingMode");
  return v4;
}

- (unint64_t)separatorStyle
{
  return self->_separatorStyle;
}

- (NSString)title
{
  return self->_title;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (BOOL)isMenuTitle
{
  return self->_isMenuTitle;
}

- (NSDirectionalEdgeInsets)unscaledLayoutMargins
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_unscaledLayoutMargins.top;
  leading = self->_unscaledLayoutMargins.leading;
  bottom = self->_unscaledLayoutMargins.bottom;
  trailing = self->_unscaledLayoutMargins.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (UIView)bgView
{
  return self->_bgView;
}

- (void)setBgView:(id)a3
{
  objc_storeStrong((id *)&self->_bgView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIView)separator
{
  return self->_separator;
}

- (void)setSeparator:(id)a3
{
  objc_storeStrong((id *)&self->_separator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_bgView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
