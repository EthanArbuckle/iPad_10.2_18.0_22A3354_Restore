@implementation NCNotificationListSectionHeaderView

+ (CGSize)_clearButtonPreferredSize
{
  double v2;
  double v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  CGSize result;

  v3 = *((double *)&__clearButtonPreferredSize + 1);
  v2 = *(double *)&__clearButtonPreferredSize;
  if (*(double *)&__clearButtonPreferredSize == 0.0 && *((double *)&__clearButtonPreferredSize + 1) == 0.0)
  {
    NCUserNotificationsUIKitFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_LIST_CLEAR_ALL"), &stru_1E8D21F60, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[NCToggleControl dismissControlWithMaterialRecipe:clearAllText:](NCToggleControl, "dismissControlWithMaterialRecipe:clearAllText:", 0, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(v6, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    *(_QWORD *)&__clearButtonPreferredSize = v7;
    *((_QWORD *)&__clearButtonPreferredSize + 1) = v8;

    v3 = *((double *)&__clearButtonPreferredSize + 1);
    v2 = *(double *)&__clearButtonPreferredSize;
  }
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)_collapseButtonPreferredSize
{
  double v2;
  double v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  CGSize result;

  v3 = *((double *)&__collapseButtonPreferredSize + 1);
  v2 = *(double *)&__collapseButtonPreferredSize;
  if (*(double *)&__collapseButtonPreferredSize == 0.0 && *((double *)&__collapseButtonPreferredSize + 1) == 0.0)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3518]);
    v5 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = (void *)MEMORY[0x1E0DC3888];
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B50]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "configurationWithFont:scale:", v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("chevron.down"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImage:forState:", v9, 0);
    objc_msgSend(v5, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    *(_QWORD *)&__collapseButtonPreferredSize = v10;
    *((_QWORD *)&__collapseButtonPreferredSize + 1) = v11;

    v3 = *((double *)&__collapseButtonPreferredSize + 1);
    v2 = *(double *)&__collapseButtonPreferredSize;
  }
  result.height = v3;
  result.width = v2;
  return result;
}

+ (double)headerHeightWithWidth:(double)a3 title:(id)a4 isShowingCollapseButton:(BOOL)a5
{
  _BOOL4 v5;
  id *v8;
  void *v9;
  id v10;
  NSString *v11;
  BOOL IsAX;
  void *v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  BOOL v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  unint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  double v44;
  uint64_t v46;
  _QWORD v47[2];
  CGRect v48;
  CGRect v49;
  CGRect v50;

  v5 = a5;
  v47[1] = *MEMORY[0x1E0C80C00];
  v8 = (id *)MEMORY[0x1E0DC4730];
  v9 = (void *)*MEMORY[0x1E0DC4730];
  v10 = a4;
  objc_msgSend(v9, "preferredContentSizeCategory");
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAX = _NCSizeCategoryIsAX(v11);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B50]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!IsAX)
  {
    v14 = objc_msgSend(*v8, "activeInterfaceOrientation") - 3;
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "userInterfaceIdiom");
    if (v14 >= 0xFFFFFFFFFFFFFFFELL)
    {
      if (v16)
      {
        *(double *)&v17 = 52.0;
        goto LABEL_7;
      }
      v49.origin.x = NCMainScreenReferenceBounds();
      v19 = CGRectGetHeight(v49) <= 568.0;
      v18 = 52.0;
      v20 = 56.0;
    }
    else
    {
      if (v16)
      {
        *(double *)&v17 = 50.0;
LABEL_7:
        v18 = *(double *)&v17;
LABEL_12:
        objc_msgSend(v13, "_scaledValueForValue:", v18 + -8.0);
        objc_msgSend(v13, "lineHeight");

        goto LABEL_13;
      }
      v48.origin.x = NCMainScreenReferenceBounds();
      v19 = CGRectGetHeight(v48) <= 568.0;
      v18 = 50.0;
      v20 = 54.0;
    }
    if (!v19)
      v18 = v20;
    goto LABEL_12;
  }
LABEL_13:
  __clearButtonPreferredSize = *MEMORY[0x1E0C9D820];
  __collapseButtonPreferredSize = __clearButtonPreferredSize;
  objc_msgSend(a1, "_clearButtonPreferredSize");
  v22 = v21;
  objc_msgSend(a1, "_collapseButtonPreferredSize");
  v24 = v23;
  v25 = objc_msgSend(*v8, "activeInterfaceOrientation") - 1;
  v26 = 6.0;
  if (v25 < 2)
    v26 = 10.0;
  v27 = a3 - v26;
  if (IsAX)
  {
    v28 = 0.0;
  }
  else
  {
    objc_msgSend(*v8, "activeInterfaceOrientation");
    v29 = v22 + 0.0;
    v30 = 0.0;
    if (v5)
    {
      v31 = objc_msgSend(*v8, "activeInterfaceOrientation", 0.0);
      v32 = 6.0;
      if ((unint64_t)(v31 - 1) < 2)
        v32 = 10.0;
      v30 = v24 + v32;
    }
    v28 = v29 + v30;
  }
  v33 = v27 - v28;
  v46 = *MEMORY[0x1E0DC1138];
  v47[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "boundingRectWithSize:options:attributes:context:", 1, v34, 0, v33, 0.0);
  v36 = v35;
  v38 = v37;
  v40 = v39;
  v42 = v41;

  v50.origin.x = v36;
  v50.origin.y = v38;
  v50.size.width = v40;
  v50.size.height = v42;
  CGRectGetHeight(v50);

  if (!IsAX)
    objc_msgSend(v13, "_scaledValueForValue:", 8.0);
  _NCMainScreenScale();
  UICeilToScale();
  v44 = v43;

  return v44;
}

- (NCNotificationListSectionHeaderView)initWithFrame:(CGRect)a3
{
  NCNotificationListSectionHeaderView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCNotificationListSectionHeaderView;
  v3 = -[NCNotificationListSectionHeaderView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationListSectionHeaderView setBackgroundColor:](v3, "setBackgroundColor:", v4);

  }
  return v3;
}

- (void)setMaterialGroupNameBase:(id)a3
{
  id v4;

  v4 = a3;
  -[NCNotificationListSectionHeaderView _configureClearButtonIfNecessary](self, "_configureClearButtonIfNecessary");
  -[PLGlyphControl setMaterialGroupNameBase:](self->_clearButton, "setMaterialGroupNameBase:", v4);

}

- (void)setTitle:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_title, a3);
  v5 = a3;
  -[NCNotificationListHeaderTitleView setTitle:](self->_headerTitleView, "setTitle:", v5);

}

- (UIControl)clearButton
{
  return (UIControl *)self->_clearButton;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NCNotificationListSectionHeaderView;
  -[NCNotificationListSectionHeaderView layoutSubviews](&v3, sel_layoutSubviews);
  -[NCNotificationListSectionHeaderView _configureHeaderTitleViewIfNecessary](self, "_configureHeaderTitleViewIfNecessary");
  -[NCNotificationListSectionHeaderView _configureClearButtonIfNecessary](self, "_configureClearButtonIfNecessary");
  -[NCNotificationListSectionHeaderView _configureCollapseButtonIfNecessary](self, "_configureCollapseButtonIfNecessary");
  -[NCNotificationListSectionHeaderView _layoutClearButton](self, "_layoutClearButton");
  -[NCNotificationListSectionHeaderView _layoutHeaderTitleView](self, "_layoutHeaderTitleView");
  -[NCNotificationListSectionHeaderView _layoutCollapseButton](self, "_layoutCollapseButton");
}

- (BOOL)dismissModalFullScreenIfNeeded
{
  return -[NCToggleControl dismissModalFullScreenIfNeeded](self->_clearButton, "dismissModalFullScreenIfNeeded");
}

- (id)containerViewForToggleControlClickInteractionPresentedContent:(id)a3
{
  id WeakRetained;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "containerViewForHeaderViewPreviewInteractionPresentedContent:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)toggleControlDidBeginClickInteraction:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "sectionHeaderViewDidBeginForceTouchInteraction:", self);

}

- (void)toggleControlDidPresentClickInteractionPresentedContent:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "sectionHeaderViewDidPresentForceTouchView:", self);

}

- (void)toggleControlDidDismssClickInteractionPresentedContent:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "sectionHeaderViewDidDismissForceTouchView:", self);

}

- (id)_legibilitySettings
{
  _UILegibilitySettings *legibilitySettings;
  id WeakRetained;
  _UILegibilitySettings *v5;
  _UILegibilitySettings *v6;

  legibilitySettings = self->_legibilitySettings;
  if (!legibilitySettings)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "legibilitySettingsForSectionHeaderView:", self);
    v5 = (_UILegibilitySettings *)objc_claimAutoreleasedReturnValue();
    v6 = self->_legibilitySettings;
    self->_legibilitySettings = v5;

    legibilitySettings = self->_legibilitySettings;
  }
  return legibilitySettings;
}

- (void)adjustForLegibilitySettingsChange:(id)a3
{
  _UILegibilitySettings **p_legibilitySettings;
  UIButton *collapseButton;
  void *v7;
  id v8;

  p_legibilitySettings = &self->_legibilitySettings;
  v8 = a3;
  if ((objc_msgSend(v8, "isEqual:", *p_legibilitySettings) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    -[NCNotificationListSectionHeaderView _updateHeaderTitleViewWithLegibilitySettings:](self, "_updateHeaderTitleViewWithLegibilitySettings:", *p_legibilitySettings);
    collapseButton = self->_collapseButton;
    -[_UILegibilitySettings primaryColor](*p_legibilitySettings, "primaryColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](collapseButton, "setTintColor:", v7);

  }
}

- (void)_updateHeaderTitleViewWithLegibilitySettings:(id)a3
{
  if (a3)
    -[NCNotificationListHeaderTitleView adjustForLegibilitySettingsChange:](self->_headerTitleView, "adjustForLegibilitySettingsChange:");
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  _BOOL8 v3;

  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    v3 = a3;
    self->_adjustsFontForContentSizeCategory = a3;
    -[NCNotificationListHeaderTitleView setAdjustsFontForContentSizeCategory:](self->_headerTitleView, "setAdjustsFontForContentSizeCategory:");
    -[NCToggleControl setAdjustsFontForContentSizeCategory:](self->_clearButton, "setAdjustsFontForContentSizeCategory:", v3);
    if (self->_adjustsFontForContentSizeCategory)
      -[NCNotificationListSectionHeaderView adjustForContentSizeCategoryChange](self, "adjustForContentSizeCategoryChange");
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  NCToggleControl *clearButton;
  NSString *v8;
  uint64_t v9;
  _BOOL4 v10;
  _BOOL4 v11;
  UIButton *v12;
  UIButton *collapseButton;
  BOOL v14;

  if (-[NCNotificationListSectionHeaderView adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory"))
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preferredContentSizeCategory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[NCNotificationListSectionHeaderView preferredContentSizeCategory](self, "preferredContentSizeCategory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqualToString:", v5);

    if ((v6 & 1) == 0)
    {
      -[NCNotificationListSectionHeaderView setPreferredContentSizeCategory:](self, "setPreferredContentSizeCategory:", v4);
      clearButton = self->_clearButton;
      objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (_NCSizeCategoryIsAX(v8))
        v9 = 0;
      else
        v9 = 2;
      -[NCToggleControl setAnchorEdge:](clearButton, "setAnchorEdge:", v9);

    }
    v10 = -[NCNotificationListHeaderTitleView adjustForContentSizeCategoryChange](self->_headerTitleView, "adjustForContentSizeCategoryChange");
    v11 = -[NCToggleControl adjustForContentSizeCategoryChange](self->_clearButton, "adjustForContentSizeCategoryChange");
    if (-[NCNotificationListSectionHeaderView showCollapseButton](self, "showCollapseButton")
      && (v12 = self->_collapseButton) != 0)
    {
      -[UIButton removeFromSuperview](v12, "removeFromSuperview");
      collapseButton = self->_collapseButton;
      self->_collapseButton = 0;

    }
    else if (!((v11 || v10) | v6 ^ 1))
    {
      v14 = 0;
      goto LABEL_14;
    }
    -[NCNotificationListSectionHeaderView setNeedsLayout](self, "setNeedsLayout");
    v14 = 1;
LABEL_14:

    return v14;
  }
  return 0;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NCNotificationListSectionHeaderView;
  v4 = a3;
  -[NCNotificationListSectionHeaderView traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[NCNotificationListSectionHeaderView traitCollection](self, "traitCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
    -[NCNotificationListSectionHeaderView _contentSizeCategoryDidChange](self, "_contentSizeCategoryDidChange");
  -[NCNotificationListSectionHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_contentSizeCategoryDidChange
{
  __clearButtonPreferredSize = *MEMORY[0x1E0C9D820];
  __collapseButtonPreferredSize = __clearButtonPreferredSize;
}

- (void)_resetClearButtonStateAnimated:(BOOL)a3
{
  NCToggleControl *clearButton;
  NCToggleControl *v4;
  void *v5;
  NCToggleControl *v6;
  _QWORD v7[4];
  NCToggleControl *v8;

  clearButton = self->_clearButton;
  if (a3)
  {
    v4 = clearButton;
    v5 = (void *)objc_opt_class();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __70__NCNotificationListSectionHeaderView__resetClearButtonStateAnimated___block_invoke;
    v7[3] = &unk_1E8D1B568;
    v8 = v4;
    v6 = v4;
    objc_msgSend(v5, "performWithDefaultExpansionAnimation:completion:", v7, 0);

  }
  else
  {
    -[NCToggleControl setExpanded:](clearButton, "setExpanded:");
  }
}

uint64_t __70__NCNotificationListSectionHeaderView__resetClearButtonStateAnimated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setExpanded:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)_configureClearButtonIfNecessary
{
  void *v3;
  void *v4;
  NCToggleControl *v5;
  NCToggleControl *clearButton;
  NCToggleControl *v7;
  NSString *v8;
  uint64_t v9;
  id v10;

  if (!self->_clearButton)
  {
    NCUserNotificationsUIKitFrameworkBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_LIST_CLEAR_ALL"), &stru_1E8D21F60, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[NCToggleControl dismissControlWithMaterialRecipe:clearAllText:](NCToggleControl, "dismissControlWithMaterialRecipe:clearAllText:", 1, v4);
    v5 = (NCToggleControl *)objc_claimAutoreleasedReturnValue();
    clearButton = self->_clearButton;
    self->_clearButton = v5;

    -[NCToggleControl addTarget:action:forControlEvents:](self->_clearButton, "addTarget:action:forControlEvents:", self, sel__handleClearButtonTouchUpInside_, 64);
    -[NCToggleControl addTarget:action:forControlEvents:](self->_clearButton, "addTarget:action:forControlEvents:", self, sel__handleClearButtonPrimaryActionTriggered_, 0x2000);
    -[NCToggleControl addTarget:forPreviewInteractionPresentedContentWithAction:](self->_clearButton, "addTarget:forPreviewInteractionPresentedContentWithAction:", self, sel__handleClearAll_);
    -[NCToggleControl setDelegate:](self->_clearButton, "setDelegate:", self);
    v7 = self->_clearButton;
    objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (_NCSizeCategoryIsAX(v8))
      v9 = 0;
    else
      v9 = 2;
    -[NCToggleControl setAnchorEdge:](v7, "setAnchorEdge:", v9);

    -[NCToggleControl setAdjustsFontForContentSizeCategory:](self->_clearButton, "setAdjustsFontForContentSizeCategory:", self->_adjustsFontForContentSizeCategory);
    -[NCNotificationListSectionHeaderView clearButton](self, "clearButton");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[NCNotificationListSectionHeaderView addSubview:](self, "addSubview:", v10);

  }
}

- (void)_configureHeaderTitleViewIfNecessary
{
  NCNotificationListHeaderTitleView *v3;
  NCNotificationListHeaderTitleView *v4;
  NCNotificationListHeaderTitleView *headerTitleView;

  if (!self->_headerTitleView)
  {
    v3 = [NCNotificationListHeaderTitleView alloc];
    -[NCNotificationListSectionHeaderView bounds](self, "bounds");
    v4 = -[NCNotificationListHeaderTitleView initWithFrame:](v3, "initWithFrame:");
    headerTitleView = self->_headerTitleView;
    self->_headerTitleView = v4;

    -[NCNotificationListHeaderTitleView setPrimary:](self->_headerTitleView, "setPrimary:", 1);
    -[NCNotificationListHeaderTitleView setTitle:](self->_headerTitleView, "setTitle:", self->_title);
    -[NCNotificationListHeaderTitleView adjustForLegibilitySettingsChange:](self->_headerTitleView, "adjustForLegibilitySettingsChange:", self->_legibilitySettings);
    -[NCNotificationListHeaderTitleView setAdjustsFontForContentSizeCategory:](self->_headerTitleView, "setAdjustsFontForContentSizeCategory:", self->_adjustsFontForContentSizeCategory);
    -[NCNotificationListSectionHeaderView addSubview:](self, "addSubview:", self->_headerTitleView);
    -[NCNotificationListSectionHeaderView sendSubviewToBack:](self, "sendSubviewToBack:", self->_headerTitleView);
  }
}

- (void)_configureCollapseButtonIfNecessary
{
  UIButton *v3;
  UIButton *v4;
  id v5;
  UIButton *v6;
  UIButton *collapseButton;
  void *v8;
  void *v9;
  void *v10;
  UIButton *v11;
  void *v12;
  UIButton *v13;

  if (-[NCNotificationListSectionHeaderView showCollapseButton](self, "showCollapseButton") && !self->_collapseButton)
  {
    v5 = objc_alloc(MEMORY[0x1E0DC3518]);
    v6 = (UIButton *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    collapseButton = self->_collapseButton;
    self->_collapseButton = v6;

    v8 = (void *)MEMORY[0x1E0DC3888];
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B50]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "configurationWithFont:scale:", v9, 1);
    v13 = (UIButton *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("chevron.down"), v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](self->_collapseButton, "setImage:forState:", v10, 0);
    v11 = self->_collapseButton;
    -[_UILegibilitySettings primaryColor](self->_legibilitySettings, "primaryColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](v11, "setTintColor:", v12);

    -[UIButton addTarget:action:forControlEvents:](self->_collapseButton, "addTarget:action:forControlEvents:", self, sel__handleCollapseActionTriggered_, 64);
    -[UIButton _setTouchInsets:](self->_collapseButton, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
    -[NCNotificationListSectionHeaderView addSubview:](self, "addSubview:", self->_collapseButton);

    v4 = v13;
    goto LABEL_8;
  }
  if (!-[NCNotificationListSectionHeaderView showCollapseButton](self, "showCollapseButton"))
  {
    v3 = self->_collapseButton;
    if (v3)
    {
      -[UIButton removeFromSuperview](v3, "removeFromSuperview");
      v4 = self->_collapseButton;
      self->_collapseButton = 0;
LABEL_8:

    }
  }
}

- (void)_layoutClearButton
{
  double v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  id *v18;
  NSString *v19;
  int IsAX;
  int v21;
  unint64_t v22;
  double v23;
  double v24;
  CGFloat v25;
  CGFloat rect;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  -[NCNotificationListSectionHeaderView bounds](self, "bounds");
  rect = v3;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  -[NCToggleControl sizeThatFits:](self->_clearButton, "sizeThatFits:", v6, v8);
  BSRectWithSize();
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = (id *)MEMORY[0x1E0DC4730];
  objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
  v19 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAX = _NCSizeCategoryIsAX(v19);

  v21 = -[NCNotificationListSectionHeaderView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v22 = objc_msgSend(*v18, "activeInterfaceOrientation") - 1;
  v23 = 6.0;
  if (v22 < 2)
    v23 = 10.0;
  if (IsAX)
    v24 = v23;
  else
    v24 = 0.0;
  if (IsAX == v21)
  {
    v27.origin.x = rect;
    v27.origin.y = v5;
    v27.size.width = v7;
    v27.size.height = v9;
    v25 = CGRectGetMaxX(v27) - v24;
    v28.origin.x = v11;
    v28.origin.y = v13;
    v28.size.width = v15;
    v28.size.height = v17;
    v24 = round(v25 - CGRectGetWidth(v28));
  }
  -[NCNotificationListSectionHeaderView bounds](self, "bounds");
  CGRectGetHeight(v29);
  v30.origin.x = v24;
  v30.origin.y = v13;
  v30.size.width = v15;
  v30.size.height = v17;
  CGRectGetHeight(v30);
  _NCMainScreenScale();
  UIRectIntegralWithScale();
  -[NCToggleControl setFrame:](self->_clearButton, "setFrame:");
}

- (void)_layoutHeaderTitleView
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  int v19;
  id *v20;
  double Width;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  NSString *v26;
  BOOL IsAX;
  double v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  NCNotificationListHeaderTitleView *headerTitleView;
  double v41;
  double v42;
  double v43;
  NSString *v44;
  double v45;
  CGFloat v46;
  CGFloat rect;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  -[NCNotificationListSectionHeaderView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[NCNotificationListHeaderTitleView sizeThatFits:](self->_headerTitleView, "sizeThatFits:", v7, v9);
  BSRectWithSize();
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v19 = -[NCNotificationListSectionHeaderView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v20 = (id *)MEMORY[0x1E0DC4730];
  v48 = v6;
  v49 = v4;
  rect = v14;
  if (v19)
  {
    v52.origin.x = v4;
    v52.origin.y = v6;
    v52.size.width = v8;
    v52.size.height = v10;
    Width = CGRectGetWidth(v52);
    v22 = objc_msgSend(*v20, "activeInterfaceOrientation");
    v23 = 6.0;
    if ((unint64_t)(v22 - 1) < 2)
      v23 = 10.0;
    v24 = Width - v23;
    v53.origin.x = v12;
    v53.origin.y = v14;
    v53.size.width = v16;
    v53.size.height = v18;
    v25 = v24 - CGRectGetWidth(v53);
  }
  else if ((unint64_t)(objc_msgSend((id)*MEMORY[0x1E0DC4730], "activeInterfaceOrientation") - 1) >= 2)
  {
    v25 = 6.0;
  }
  else
  {
    v25 = 10.0;
  }
  objc_msgSend(*v20, "preferredContentSizeCategory");
  v26 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAX = _NCSizeCategoryIsAX(v26);

  objc_msgSend((id)objc_opt_class(), "_clearButtonPreferredSize");
  v50 = v18;
  v51 = v16;
  v29 = v18;
  v30 = v16;
  v31 = v25;
  if (!IsAX)
  {
    v32 = v28;
    v54.origin.y = v48;
    v54.origin.x = v49;
    v54.size.width = v8;
    v54.size.height = v10;
    v33 = CGRectGetWidth(v54);
    v34 = 6.0;
    if ((unint64_t)(objc_msgSend(*v20, "activeInterfaceOrientation") - 1) >= 2)
      v35 = 6.0;
    else
      v35 = 10.0;
    v36 = v33 - v35;
    objc_msgSend(*v20, "activeInterfaceOrientation");
    v37 = 0.0;
    v38 = v36 - (v32 + 0.0);
    if (-[NCNotificationListSectionHeaderView showCollapseButton](self, "showCollapseButton"))
    {
      if ((unint64_t)(objc_msgSend(*v20, "activeInterfaceOrientation") - 1) < 2)
        v34 = 10.0;
      -[UIButton sizeThatFits:](self->_collapseButton, "sizeThatFits:", v8, v10);
      v37 = v34 + v39;
    }
    headerTitleView = self->_headerTitleView;
    -[NCNotificationListSectionHeaderView bounds](self, "bounds");
    -[NCNotificationListHeaderTitleView sizeThatFits:](headerTitleView, "sizeThatFits:", v38 - v37, CGRectGetHeight(v55));
    BSRectWithSize();
    v31 = v41;
    v30 = v42;
    v29 = v43;
  }
  objc_msgSend(*v20, "preferredContentSizeCategory");
  v44 = (NSString *)objc_claimAutoreleasedReturnValue();
  v45 = 12.0;
  if (!_NCSizeCategoryIsAX(v44))
  {
    v56.origin.y = v48;
    v56.origin.x = v49;
    v56.size.width = v8;
    v56.size.height = v10;
    v46 = CGRectGetHeight(v56) + -8.0;
    v57.origin.x = v25;
    v57.origin.y = rect;
    v57.size.height = v50;
    v57.size.width = v51;
    v45 = v46 - CGRectGetHeight(v57);
  }

  if (!IsAX)
  {
    v58.origin.y = v48;
    v58.origin.x = v49;
    v58.size.width = v8;
    v58.size.height = v10;
    CGRectGetHeight(v58);
    v59.origin.x = v31;
    v59.origin.y = v45;
    v59.size.width = v30;
    v59.size.height = v29;
    CGRectGetHeight(v59);
  }
  _NCMainScreenScale();
  UIRectIntegralWithScale();
  -[NCNotificationListHeaderTitleView setFrame:](self->_headerTitleView, "setFrame:");
}

- (void)_layoutCollapseButton
{
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  UIButton *collapseButton;
  double v22;
  double v23;
  double v24;
  double v25;
  int v26;
  id *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double MinX;
  unint64_t v33;
  double v34;
  double v35;
  double MaxX;
  unint64_t v37;
  double v38;
  NSString *v39;
  _BOOL4 IsAX;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  if (self->_collapseButton)
  {
    -[NCNotificationListSectionHeaderView bounds](self, "bounds");
    v45 = v4;
    v46 = v3;
    v43 = v6;
    v44 = v5;
    -[NCNotificationListHeaderTitleView frame](self->_headerTitleView, "frame");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    -[NCToggleControl frame](self->_clearButton, "frame");
    v16 = v15;
    v18 = v17;
    v41 = v19;
    v42 = v20;
    collapseButton = self->_collapseButton;
    -[NCNotificationListSectionHeaderView bounds](self, "bounds");
    -[UIButton sizeThatFits:](collapseButton, "sizeThatFits:", v22, v23);
    v25 = v24;
    v26 = -[NCNotificationListSectionHeaderView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    v27 = (id *)MEMORY[0x1E0DC4730];
    v28 = v8;
    v29 = v10;
    v30 = v12;
    v31 = v14;
    if (v26)
    {
      MinX = CGRectGetMinX(*(CGRect *)&v28);
      v33 = objc_msgSend(*v27, "activeInterfaceOrientation") - 1;
      v34 = 6.0;
      if (v33 < 2)
        v34 = 10.0;
      v35 = MinX - v34 - v25;
    }
    else
    {
      MaxX = CGRectGetMaxX(*(CGRect *)&v28);
      v37 = objc_msgSend(*v27, "activeInterfaceOrientation") - 1;
      v38 = 6.0;
      if (v37 < 2)
        v38 = 10.0;
      v35 = MaxX + v38;
    }
    objc_msgSend(*v27, "preferredContentSizeCategory");
    v39 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAX = _NCSizeCategoryIsAX(v39);

    if (-[NCNotificationListSectionHeaderView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    {
      if (v35 >= 0.0)
        goto LABEL_19;
    }
    else
    {
      v47.origin.y = v45;
      v47.origin.x = v46;
      v47.size.height = v43;
      v47.size.width = v44;
      if (v25 + v35 <= CGRectGetWidth(v47))
      {
LABEL_19:
        UIRectCenteredYInRect();
        _NCMainScreenScale();
        UIRectIntegralWithScale();
        -[UIButton setFrame:](self->_collapseButton, "setFrame:");
        return;
      }
    }
    if (-[NCNotificationListSectionHeaderView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    {
      if (!IsAX)
      {
LABEL_16:
        v48.origin.x = v16;
        v48.origin.y = v18;
        v48.size.width = v41;
        v48.size.height = v42;
        CGRectGetMaxX(v48);
        objc_msgSend(*v27, "activeInterfaceOrientation");
        goto LABEL_19;
      }
    }
    else if (IsAX)
    {
      goto LABEL_16;
    }
    v49.origin.x = v16;
    v49.origin.y = v18;
    v49.size.width = v41;
    v49.size.height = v42;
    CGRectGetMinX(v49);
    objc_msgSend(*v27, "activeInterfaceOrientation");
    goto LABEL_19;
  }
}

- (void)_handleClearButtonTouchUpInside:(id)a3
{
  id v4;
  id v5;
  id WeakRetained;

  v4 = a3;
  -[NCNotificationListSectionHeaderView clearButton](self, "clearButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4 && !-[NCToggleControl isExpanded](self->_clearButton, "isExpanded"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "sectionHeaderViewDidTransitionToClearState:", self);

  }
}

- (void)_handleClearButtonPrimaryActionTriggered:(id)a3
{
  void *v4;
  id WeakRetained;

  -[NCNotificationListSectionHeaderView _resetClearButtonStateAnimated:](self, "_resetClearButtonStateAnimated:", 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[NCNotificationListSectionHeaderView sectionIdentifier](self, "sectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "sectionHeaderView:didReceiveClearActionForSectionIdentifier:", self, v4);

}

- (void)_handleClearAll:(id)a3
{
  void *v4;

  -[NCNotificationListSectionHeaderView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionHeaderViewDidReceiveClearAllAction:", self);

  -[NCToggleControl dismissModalFullScreenIfNeeded](self->_clearButton, "dismissModalFullScreenIfNeeded");
}

- (void)_handleCollapseActionTriggered:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  double v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  CGAffineTransform v16;
  CGAffineTransform v17;

  -[NCNotificationListSectionHeaderView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "sectionHeaderViewDidRequestCollapsing:", self);
    -[NCNotificationListSectionHeaderView collapseButton](self, "collapseButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    memset(&v17, 0, sizeof(v17));
    v6 = -[NCNotificationListSectionHeaderView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    v7 = -1.57;
    if (v6)
      v7 = 1.57;
    CGAffineTransformMakeRotation(&v17, v7);
    v8 = (void *)MEMORY[0x1E0DC3F10];
    v9 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __70__NCNotificationListSectionHeaderView__handleCollapseActionTriggered___block_invoke;
    v14[3] = &unk_1E8D1CD98;
    v10 = v5;
    v16 = v17;
    v15 = v10;
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __70__NCNotificationListSectionHeaderView__handleCollapseActionTriggered___block_invoke_2;
    v12[3] = &unk_1E8D1CDC0;
    v13 = v10;
    v11 = v10;
    objc_msgSend(v8, "animateWithDuration:delay:options:animations:completion:", 0, v14, v12, 0.3, 0.0);

  }
}

uint64_t __70__NCNotificationListSectionHeaderView__handleCollapseActionTriggered___block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return objc_msgSend(v1, "setTransform:", v4);
}

uint64_t __70__NCNotificationListSectionHeaderView__handleCollapseActionTriggered___block_invoke_2(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v4[0] = *MEMORY[0x1E0C9BAA8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v1, "setTransform:", v4);
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (NSString)preferredContentSizeCategory
{
  return self->_preferredContentSizeCategory;
}

- (void)setPreferredContentSizeCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (NCNotificationListSectionHeaderViewDelegate)delegate
{
  return (NCNotificationListSectionHeaderViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (void)setSectionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (NSString)title
{
  return self->_title;
}

- (NSString)materialGroupNameBase
{
  return self->_materialGroupNameBase;
}

- (BOOL)showCollapseButton
{
  return self->_showCollapseButton;
}

- (void)setShowCollapseButton:(BOOL)a3
{
  self->_showCollapseButton = a3;
}

- (NCNotificationListHeaderTitleView)headerTitleView
{
  return self->_headerTitleView;
}

- (void)setHeaderTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_headerTitleView, a3);
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void)setLegibilitySettings:(id)a3
{
  objc_storeStrong((id *)&self->_legibilitySettings, a3);
}

- (UIButton)collapseButton
{
  return self->_collapseButton;
}

- (void)setCollapseButton:(id)a3
{
  objc_storeStrong((id *)&self->_collapseButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collapseButton, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_headerTitleView, 0);
  objc_storeStrong((id *)&self->_materialGroupNameBase, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_clearButton, 0);
}

@end
