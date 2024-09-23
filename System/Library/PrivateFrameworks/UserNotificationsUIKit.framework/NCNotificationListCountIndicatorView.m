@implementation NCNotificationListCountIndicatorView

- (NCNotificationListCountIndicatorView)initWithFrame:(CGRect)a3
{
  NCNotificationListCountIndicatorView *v3;
  NCNotificationListCountIndicatorView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NCNotificationListCountIndicatorView;
  v3 = -[NCNotificationListCountIndicatorView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[NCNotificationListCountIndicatorView setMaximumContentSizeCategory:](v3, "setMaximumContentSizeCategory:", *MEMORY[0x1E0DC48F0]);
    v4->_animateLayoutForContentTransition = 0;
    v4->_titleLabelRepresentsNotificationCount = 0;
    v4->_backlightAnimationAssertingCount = 0;
    -[NCNotificationListCountIndicatorView layer](v4, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAnchorPoint:", 0.5, 0.5);

  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[BLSAssertion invalidate](self->_backlightAnimationAssertion, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationListCountIndicatorView;
  -[NCNotificationListCountIndicatorView dealloc](&v3, sel_dealloc);
}

- (void)updateCount:(unint64_t)a3 title:(id)a4 symbolImageName:(id)a5 contentHidden:(BOOL)a6
{
  int v6;
  id v10;
  id v11;
  id v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  int v19;
  int v20;
  char v21;
  int contentHidden;
  BOOL v23;
  NSUInteger v24;
  unint64_t v25;
  UIView *containerView;
  __int128 v27;
  double v28;
  void *v29;
  void *v30;
  id v31;
  __CFString *obj;
  _QWORD v33[5];
  BOOL v34;
  char v35;
  _QWORD v36[5];
  BOOL v37;
  char v38;
  CGAffineTransform v39;

  v6 = a6;
  v10 = a4;
  v11 = a5;
  v12 = v10;
  v13 = (__CFString *)v11;
  v30 = v12;
  if (!a3)
    goto LABEL_5;
  v14 = (void *)MEMORY[0x1E0CB3940];
  NCUserNotificationsUIKitFrameworkBundle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_STRING_STATE_COUNT_TEXT"), &stru_1E8D21F60, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringWithFormat:", v16, a3, 0);
  a3 = objc_claimAutoreleasedReturnValue();

  if (a3)
  {
    a3 = (unint64_t)(id)a3;
    v29 = (void *)a3;
    if (v12)
    {
      v17 = 0;
      obj = v13;
      v18 = v12;
    }
    else
    {

      v17 = 1;
      v18 = (void *)a3;
      a3 = 0;
      obj = CFSTR("circlebadge.fill");
    }
    self->_titleLabelRepresentsNotificationCount = v17;
  }
  else
  {
LABEL_5:
    v29 = 0;
    obj = v13;
    v18 = v12;
  }
  if (BSEqualStrings())
    v19 = BSEqualStrings() ^ 1;
  else
    v19 = 1;
  v31 = (id)a3;
  v20 = BSEqualStrings();
  v21 = v20;
  contentHidden = self->_contentHidden;
  if ((v19 & 1) != 0 || (v20 ? (v23 = contentHidden == v6) : (v23 = 0), !v23))
  {
    objc_storeStrong((id *)&self->_titleString, v18);
    objc_storeStrong((id *)&self->_titleSymbol, obj);
    objc_storeStrong((id *)&self->_subtitleString, v31);
    self->_contentHidden = v6;
    if (v19)
      -[NCNotificationListCountIndicatorView _invalidateTitleLabelAnimated:](self, "_invalidateTitleLabelAnimated:", 1);
    if ((v21 & 1) == 0)
      -[NCNotificationListCountIndicatorView _invalidateSubtitleLabelAnimated:](self, "_invalidateSubtitleLabelAnimated:", 1);
    v24 = -[NSString length](self->_subtitleString, "length");
    v25 = 1;
    if (!v24)
      v25 = 2;
    self->_titleLabelNumberOfLines = v25;
    if (contentHidden != v6 && (v6 & 1) == 0)
      -[UIView setHidden:](self->_containerView, "setHidden:", 0);
    if (contentHidden != v6)
    {
      containerView = self->_containerView;
      if ((v6 & 1) != 0)
      {
        v27 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        *(_OWORD *)&v39.a = *MEMORY[0x1E0C9BAA8];
        *(_OWORD *)&v39.c = v27;
        *(_OWORD *)&v39.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      }
      else
      {
        CGAffineTransformMakeScale(&v39, 0.25, 0.25);
      }
      -[UIView setTransform:](containerView, "setTransform:", &v39);
    }
    -[NCNotificationListCountIndicatorView frame](self, "frame");
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __88__NCNotificationListCountIndicatorView_updateCount_title_symbolImageName_contentHidden___block_invoke;
    v36[3] = &unk_1E8D1B7B8;
    v37 = contentHidden != v6;
    v36[4] = self;
    v38 = v6;
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __88__NCNotificationListCountIndicatorView_updateCount_title_symbolImageName_contentHidden___block_invoke_2;
    v33[3] = &unk_1E8D1B7B8;
    v34 = contentHidden != v6;
    v35 = v6;
    v33[4] = self;
    -[NCNotificationListCountIndicatorView _performLayout:animated:completion:](self, "_performLayout:animated:completion:", v36, v28 > 1.0, v33);
  }

}

uint64_t __88__NCNotificationListCountIndicatorView_updateCount_title_symbolImageName_contentHidden___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  double v4;
  CGAffineTransform v6;

  if (*(_BYTE *)(a1 + 40))
  {
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 472);
    if (*(_BYTE *)(a1 + 41))
    {
      CGAffineTransformMakeScale(&v6, 0.25, 0.25);
    }
    else
    {
      v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&v6.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&v6.c = v3;
      *(_OWORD *)&v6.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    }
    objc_msgSend(v2, "setTransform:", &v6);
    v4 = 0.0;
    if (!*(_BYTE *)(a1 + 41))
      v4 = 1.0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "setAlpha:", v4, *(_OWORD *)&v6.a, *(_OWORD *)&v6.c, *(_OWORD *)&v6.tx);
  }
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __88__NCNotificationListCountIndicatorView_updateCount_title_symbolImageName_contentHidden___block_invoke_2(uint64_t result)
{
  if (*(_BYTE *)(result + 40))
  {
    if (*(_BYTE *)(result + 41))
      return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 472), "setHidden:", 1);
  }
  return result;
}

- (void)setShouldAllowLongPressInteraction:(BOOL)a3
{
  self->_shouldAllowLongPressInteraction = a3;
  -[NCNotificationListCountIndicatorButton setShouldAllowLongPressInteraction:](self->_titleLabel, "setShouldAllowLongPressInteraction:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double v5;
  double v6;
  NCNotificationListCountIndicatorButton *subtitleLabel;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  height = a3.height;
  -[NCNotificationListCountIndicatorView _configureTitleLabelIfNecessary](self, "_configureTitleLabelIfNecessary");
  -[NCNotificationListCountIndicatorView _configureSubtitleLabelIfNecessary](self, "_configureSubtitleLabelIfNecessary");
  -[NCNotificationListCountIndicatorView _availableWidth](self, "_availableWidth");
  v6 = v5;
  subtitleLabel = self->_subtitleLabel;
  if (subtitleLabel)
    -[NCNotificationListCountIndicatorButton sizeThatFits:](subtitleLabel, "sizeThatFits:", v5, height);
  -[NCNotificationListCountIndicatorButton sizeThatFits:](self->_titleLabel, "sizeThatFits:", v6, height);
  -[NCNotificationListCountIndicatorView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayScale");
  UICeilToScale();
  v10 = v9;

  -[NCNotificationListCountIndicatorView traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayScale");
  UICeilToScale();
  v13 = v12;

  v14 = v10;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)layoutSubviews
{
  _QWORD v3[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NCNotificationListCountIndicatorView;
  -[NCNotificationListCountIndicatorView layoutSubviews](&v4, sel_layoutSubviews);
  -[NCNotificationListCountIndicatorView _configureTitleLabelIfNecessary](self, "_configureTitleLabelIfNecessary");
  -[NCNotificationListCountIndicatorView _configureSubtitleLabelIfNecessary](self, "_configureSubtitleLabelIfNecessary");
  -[NCNotificationListCountIndicatorView _updateTitleLabelNumberOfLines](self, "_updateTitleLabelNumberOfLines");
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__NCNotificationListCountIndicatorView_layoutSubviews__block_invoke;
  v3[3] = &unk_1E8D1B568;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "_performWithAnimation:", v3);
}

uint64_t __54__NCNotificationListCountIndicatorView_layoutSubviews__block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  void *v4;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 472);
  if (v2)
  {
    objc_msgSend(v2, "transform");
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 472);
  }
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v6 = *MEMORY[0x1E0C9BAA8];
  v7 = v3;
  v8 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", &v6);
  objc_msgSend(*(id *)(a1 + 32), "_sizeToFitTitleLabelIfNecessary");
  objc_msgSend(*(id *)(a1 + 32), "_sizeToFitSubtitleLabelIfNecessary");
  objc_msgSend(*(id *)(a1 + 32), "_layoutVerticallyCenter");
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 472);
  v6 = v9;
  v7 = v10;
  v8 = v11;
  return objc_msgSend(v4, "setTransform:", &v6);
}

- (void)adjustForLegibilitySettingsChange:(id)a3
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (!v5)
  {
    v6 = *MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_ERROR))
      -[NCNotificationListCountIndicatorView adjustForLegibilitySettingsChange:].cold.1(v6);
  }
  if ((objc_msgSend(v5, "isEqual:", self->_legibilitySettings) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    -[NCNotificationListCountIndicatorButton setLegibilitySettings:](self->_titleLabel, "setLegibilitySettings:", v5);
    -[NCNotificationListCountIndicatorButton setLegibilitySettings:](self->_subtitleLabel, "setLegibilitySettings:", v5);
    -[NCNotificationListCountIndicatorView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategory = a3;
    if (a3)
      -[NCNotificationListCountIndicatorView adjustForContentSizeCategoryChange](self, "adjustForContentSizeCategoryChange");
  }
}

- (NSString)preferredContentSizeCategory
{
  NSString **p_preferredContentSizeCategory;
  NSString *preferredContentSizeCategory;

  p_preferredContentSizeCategory = &self->_preferredContentSizeCategory;
  preferredContentSizeCategory = self->_preferredContentSizeCategory;
  if (!preferredContentSizeCategory)
  {
    objc_storeStrong((id *)p_preferredContentSizeCategory, (id)*MEMORY[0x1E0DC4938]);
    preferredContentSizeCategory = *p_preferredContentSizeCategory;
  }
  return preferredContentSizeCategory;
}

- (BOOL)adjustForContentSizeCategoryChange
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  BOOL v7;
  BSUIFontProvider *fontProvider;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[NCNotificationListCountIndicatorView adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory")&& (-[NCNotificationListCountIndicatorView preferredContentSizeCategory](self, "preferredContentSizeCategory"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v6 = objc_msgSend(v4, "isEqualToString:", v5), v5, (v6 & 1) == 0))
  {
    fontProvider = self->_fontProvider;
    self->_fontProvider = 0;

    -[NCNotificationListCountIndicatorView setPreferredContentSizeCategory:](self, "setPreferredContentSizeCategory:", v4);
    -[NCNotificationListCountIndicatorView _invalidateTitleLabelAnimated:](self, "_invalidateTitleLabelAnimated:", 0);
    -[NCNotificationListCountIndicatorView _invalidateSubtitleLabelAnimated:](self, "_invalidateSubtitleLabelAnimated:", 0);
    -[NCNotificationListCountIndicatorView setNeedsLayout](self, "setNeedsLayout");
    v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_configureTitleLabelIfNecessary
{
  NSString *titleString;
  NSString *titleSymbol;
  void *v5;
  NCNotificationListCountIndicatorButton *v6;
  NCNotificationListCountIndicatorButton *titleLabel;

  if (!self->_contentHidden && !self->_titleLabel)
  {
    titleString = self->_titleString;
    if (titleString)
    {
      titleSymbol = self->_titleSymbol;
      -[NCNotificationListCountIndicatorView _titleLabelFont](self, "_titleLabelFont");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[NCNotificationListCountIndicatorView _newIndicatorButtonWithTitle:symbolName:font:](self, "_newIndicatorButtonWithTitle:symbolName:font:", titleString, titleSymbol, v5);
      titleLabel = self->_titleLabel;
      self->_titleLabel = v6;

      -[NCNotificationListCountIndicatorButton setDelegate:](self->_titleLabel, "setDelegate:", self);
      -[NCNotificationListCountIndicatorButton setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", self->_titleLabelNumberOfLines);
      -[NCNotificationListCountIndicatorButton setShouldAllowLongPressInteraction:](self->_titleLabel, "setShouldAllowLongPressInteraction:", self->_shouldAllowLongPressInteraction);
      -[NCNotificationListCountIndicatorView _sizeToFitTitleLabelIfNecessary](self, "_sizeToFitTitleLabelIfNecessary");
    }
  }
}

- (void)_configureSubtitleLabelIfNecessary
{
  NSString *subtitleString;
  void *v4;
  NCNotificationListCountIndicatorButton *v5;
  NCNotificationListCountIndicatorButton *subtitleLabel;

  if (!self->_contentHidden && !self->_subtitleLabel)
  {
    subtitleString = self->_subtitleString;
    if (subtitleString)
    {
      -[NCNotificationListCountIndicatorView _subtitleLabelFont](self, "_subtitleLabelFont");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[NCNotificationListCountIndicatorView _newIndicatorButtonWithTitle:symbolName:font:](self, "_newIndicatorButtonWithTitle:symbolName:font:", subtitleString, 0, v4);
      subtitleLabel = self->_subtitleLabel;
      self->_subtitleLabel = v5;

      -[NCNotificationListCountIndicatorView _sizeToFitSubtitleLabelIfNecessary](self, "_sizeToFitSubtitleLabelIfNecessary");
    }
  }
}

- (void)_updateTitleLabelNumberOfLines
{
  NCNotificationListCountIndicatorButton *titleLabel;

  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    if (-[NCNotificationListCountIndicatorButton numberOfLines](titleLabel, "numberOfLines") != self->_titleLabelNumberOfLines)
    {
      -[NCNotificationListCountIndicatorButton setNumberOfLines:](self->_titleLabel, "setNumberOfLines:");
      -[NCNotificationListCountIndicatorView _sizeToFitTitleLabelIfNecessary](self, "_sizeToFitTitleLabelIfNecessary");
    }
  }
}

- (id)_newIndicatorButtonWithTitle:(id)a3 symbolName:(id)a4 font:(id)a5
{
  id v8;
  id v9;
  id v10;
  NCNotificationListCountIndicatorButton *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[NCNotificationListCountIndicatorView _configureContainerViewIfNecessary](self, "_configureContainerViewIfNecessary");
  v11 = -[NCNotificationListCountIndicatorButton initWithTitle:symbolName:withFont:legibilitySettings:]([NCNotificationListCountIndicatorButton alloc], "initWithTitle:symbolName:withFont:legibilitySettings:", v10, v9, v8, self->_legibilitySettings);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("focus-container-%@"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[NCNotificationListCountIndicatorButton setAccessibilityIdentifier:](v11, "setAccessibilityIdentifier:", v12);
  -[NCNotificationListCountIndicatorButton setDelegate:](v11, "setDelegate:", self);
  -[UIView addSubview:](self->_containerView, "addSubview:", v11);
  -[UIView bringSubviewToFront:](self->_containerView, "bringSubviewToFront:", v11);

  return v11;
}

- (void)_configureContainerViewIfNecessary
{
  UIView *v3;
  UIView *containerView;

  if (!self->_containerView)
  {
    v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    containerView = self->_containerView;
    self->_containerView = v3;

    -[NCNotificationListCountIndicatorView addSubview:](self, "addSubview:", self->_containerView);
  }
}

- (void)_invalidateTitleLabelAnimated:(BOOL)a3
{
  NCNotificationListCountIndicatorButton *titleLabel;

  -[NCNotificationListCountIndicatorView _invalidateButton:animated:](self, "_invalidateButton:animated:", self->_titleLabel, a3);
  titleLabel = self->_titleLabel;
  self->_titleLabel = 0;

}

- (void)_invalidateSubtitleLabelAnimated:(BOOL)a3
{
  NCNotificationListCountIndicatorButton *subtitleLabel;

  -[NCNotificationListCountIndicatorView _invalidateButton:animated:](self, "_invalidateButton:animated:", self->_subtitleLabel, a3);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = 0;

}

- (void)_invalidateButton:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __67__NCNotificationListCountIndicatorView__invalidateButton_animated___block_invoke;
    v8[3] = &unk_1E8D1B568;
    v9 = v6;
    objc_msgSend(v9, "hideContentAnimated:completion:", v4, v8);
    -[NCNotificationListCountIndicatorView setNeedsLayout](self, "setNeedsLayout");

  }
}

uint64_t __67__NCNotificationListCountIndicatorView__invalidateButton_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void)_performLayout:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  void (**v8)(_QWORD);
  id v9;
  uint64_t v10;
  id v11;
  void (**v12)(void *, uint64_t, _QWORD);
  void *v13;
  _QWORD v14[4];
  void (**v15)(_QWORD);
  _QWORD aBlock[5];
  id v17;

  v6 = a4;
  v8 = (void (**)(_QWORD))a3;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__NCNotificationListCountIndicatorView__performLayout_animated_completion___block_invoke;
  aBlock[3] = &unk_1E8D1B7E0;
  aBlock[4] = self;
  v11 = v9;
  v17 = v11;
  v12 = (void (**)(void *, uint64_t, _QWORD))_Block_copy(aBlock);
  -[NCNotificationListCountIndicatorView queue_acquireBacklightAnimationAssertion](self, "queue_acquireBacklightAnimationAssertion");
  if (v6)
  {
    v13 = (void *)MEMORY[0x1E0DC3F10];
    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = __75__NCNotificationListCountIndicatorView__performLayout_animated_completion___block_invoke_2;
    v14[3] = &unk_1E8D1B808;
    v15 = v8;
    objc_msgSend(v13, "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:", 0, v14, v12, 0.845, 0.531, 0.0, 0.0, 0.0, 0.0);

  }
  else
  {
    v8[2](v8);
    v12[2](v12, 1, 0);
  }

}

uint64_t __75__NCNotificationListCountIndicatorView__performLayout_animated_completion___block_invoke(uint64_t a1, int a2, char a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "queue_releaseBacklightAnimationAssertion");
  if (a2)
  {
    if ((a3 & 1) == 0)
      return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  return result;
}

void __75__NCNotificationListCountIndicatorView__performLayout_animated_completion___block_invoke_2(uint64_t a1)
{
  void (**v1)(void);

  objc_msgSend(MEMORY[0x1E0DC3F10], "nc_applyHighFrameRate:", *(_QWORD *)(a1 + 32));
  v1 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v1[2]();

}

- (void)queue_acquireBacklightAnimationAssertion
{
  os_log_t *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  BLSAssertion *v13;
  BLSAssertion *backlightAnimationAssertion;
  uint8_t v15[8];
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v3 = (os_log_t *)MEMORY[0x1E0DC5F90];
  v4 = *MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_1CFC3D000, v4, OS_LOG_TYPE_DEFAULT, "Acquiring backlight assertion for count indicator view animation.", v15, 2u);
  }
  ++self->_backlightAnimationAssertingCount;
  if (self->_backlightAnimationAssertion)
  {
    v5 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1CFC3D000, v5, OS_LOG_TYPE_DEFAULT, "Backlight assertion is already acquired.", v15, 2u);
    }
  }
  else
  {
    -[NCNotificationListCountIndicatorView window](self, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "windowScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_FBSScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0D00FB8], "requestUnrestrictedFramerateForFBSScene:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v9;
      objc_msgSend(MEMORY[0x1E0D00FA0], "cancelAfterInterval:", 3.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v17[1] = v10;
      v11 = v17;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D00FB8], "requestUnrestrictedFramerate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v9;
      objc_msgSend(MEMORY[0x1E0D00FA0], "cancelAfterInterval:", 3.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16[1] = v10;
      v11 = v16;
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (BLSAssertion *)objc_msgSend(objc_alloc(MEMORY[0x1E0D00F48]), "initWithExplanation:attributes:", CFSTR("Finish notification count indicator animation"), v12);
    backlightAnimationAssertion = self->_backlightAnimationAssertion;
    self->_backlightAnimationAssertion = v13;

    -[BLSAssertion acquireWithObserver:](self->_backlightAnimationAssertion, "acquireWithObserver:", self);
  }
}

- (void)queue_releaseBacklightAnimationAssertion
{
  int64_t backlightAnimationAssertingCount;
  os_log_t *v4;
  NSObject *v5;
  _BOOL4 v6;
  int64_t v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  BLSAssertion *backlightAnimationAssertion;
  BLSAssertion *v12;
  os_log_t v13;
  int v14;
  int64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  backlightAnimationAssertingCount = self->_backlightAnimationAssertingCount;
  self->_backlightAnimationAssertingCount = backlightAnimationAssertingCount - 1;
  v4 = (os_log_t *)MEMORY[0x1E0DC5F90];
  v5 = *MEMORY[0x1E0DC5F90];
  v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT);
  if (backlightAnimationAssertingCount >= 2)
  {
    if (!v6)
      return;
    v7 = self->_backlightAnimationAssertingCount;
    v14 = 134217984;
    v15 = v7;
    v8 = "Still have %ld animation to complete; Not releasing backlight assertion.";
    v9 = v5;
    v10 = 12;
    goto LABEL_10;
  }
  if (v6)
  {
    LOWORD(v14) = 0;
    _os_log_impl(&dword_1CFC3D000, v5, OS_LOG_TYPE_DEFAULT, "Releasing backlight assertion for count indicator view animation.", (uint8_t *)&v14, 2u);
  }
  backlightAnimationAssertion = self->_backlightAnimationAssertion;
  if (backlightAnimationAssertion)
  {
    -[BLSAssertion invalidate](backlightAnimationAssertion, "invalidate");
    v12 = self->_backlightAnimationAssertion;
    self->_backlightAnimationAssertion = 0;

    return;
  }
  self->_backlightAnimationAssertingCount = 0;
  v13 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14) = 0;
    v8 = "Backlight assertion is already released!";
    v9 = v13;
    v10 = 2;
LABEL_10:
    _os_log_impl(&dword_1CFC3D000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v14, v10);
  }
}

- (void)assertionWasAcquired:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = *MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1CFC3D000, v3, OS_LOG_TYPE_DEFAULT, "Backlight assertion for notification count indicator animation is acquired.", v4, 2u);
  }
}

- (void)assertion:(id)a3 didCancelWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BLSAssertion *backlightAnimationAssertion;
  uint8_t v16[16];

  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x1E0DC5F90];
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_ERROR))
      -[NCNotificationListCountIndicatorView assertion:didCancelWithError:].cold.1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_1CFC3D000, v8, OS_LOG_TYPE_DEFAULT, "Backlight assertion for notification count indicator animation is cancelled.", v16, 2u);
  }
  self->_backlightAnimationAssertingCount = 0;
  -[BLSAssertion invalidate](self->_backlightAnimationAssertion, "invalidate");
  backlightAnimationAssertion = self->_backlightAnimationAssertion;
  self->_backlightAnimationAssertion = 0;

}

- (void)assertion:(id)a3 didFailToAcquireWithError:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BLSAssertion *backlightAnimationAssertion;

  v5 = a4;
  v6 = *MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_ERROR))
    -[NCNotificationListCountIndicatorView assertion:didFailToAcquireWithError:].cold.1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
  self->_backlightAnimationAssertingCount = 0;
  -[BLSAssertion invalidate](self->_backlightAnimationAssertion, "invalidate");
  backlightAnimationAssertion = self->_backlightAnimationAssertion;
  self->_backlightAnimationAssertion = 0;

}

- (void)buttonWasTapped:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "notificationListCountIndicatorViewTapped:", self);

}

- (void)buttonWasLongPressed:(id)a3
{
  void *v5;
  NCNotificationListCountIndicatorViewDelegate **p_delegate;
  id v7;
  id WeakRetained;
  id v9;

  if (self->_titleLabel == a3)
  {
    if (self->_titleLabelRepresentsNotificationCount)
      v5 = a3;
    else
      v5 = self;
    p_delegate = &self->_delegate;
    v7 = v5;
    v9 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(WeakRetained, "notificationListCountIndicatorViewLongPressed:presentingView:", self, v7);

  }
}

- (double)_availableWidth
{
  CGRect v3;

  -[NCNotificationListCountIndicatorView _insetBounds](self, "_insetBounds");
  return CGRectGetWidth(v3);
}

- (void)_sizeToFitTitleLabelIfNecessary
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  CGRect v13;
  CGRect v14;

  if (self->_titleLabel)
  {
    -[NCNotificationListCountIndicatorView _insetBounds](self, "_insetBounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[NCNotificationListCountIndicatorView _availableWidth](self, "_availableWidth");
    v12 = v11;
    v13.origin.x = v4;
    v13.origin.y = v6;
    v13.size.width = v8;
    v13.size.height = v10;
    -[NCNotificationListCountIndicatorButton sizeThatFits:](self->_titleLabel, "sizeThatFits:", v12, CGRectGetHeight(v13));
    -[NCNotificationListCountIndicatorView bounds](self, "bounds");
    CGRectGetWidth(v14);
    UIRectIntegralWithScale();
    -[NCNotificationListCountIndicatorButton setFrame:](self->_titleLabel, "setFrame:");
  }
}

- (void)_sizeToFitSubtitleLabelIfNecessary
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  CGRect v13;

  if (self->_subtitleLabel)
  {
    -[NCNotificationListCountIndicatorView _insetBounds](self, "_insetBounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[NCNotificationListCountIndicatorView _availableWidth](self, "_availableWidth");
    v12 = v11;
    v13.origin.x = v4;
    v13.origin.y = v6;
    v13.size.width = v8;
    v13.size.height = v10;
    -[NCNotificationListCountIndicatorButton sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v12, CGRectGetHeight(v13));
    UIRectIntegralWithScale();
    -[NCNotificationListCountIndicatorButton setFrame:](self->_subtitleLabel, "setFrame:");
    -[NCNotificationListCountIndicatorButton setAlpha:](self->_subtitleLabel, "setAlpha:", 1.0);
  }
}

- (void)_layoutVerticallyCenter
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGFloat v39;
  CGFloat v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  -[NCNotificationListCountIndicatorButton frame](self->_titleLabel, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[NCNotificationListCountIndicatorButton frame](self->_subtitleLabel, "frame");
  v14 = v13;
  v40 = v15;
  if (self->_titleLabel)
  {
    v16 = v11;
    v41.origin.x = v4;
    v17 = v12;
    v41.origin.y = v6;
    v41.size.width = v8;
    v41.size.height = v10;
    CGRectGetWidth(v41);
    v42.size.height = v10;
    v42.origin.x = v4;
    v42.origin.y = v6;
    v42.size.width = v8;
    CGRectGetMaxY(v42);
    v12 = v17;
    v11 = v16;
  }
  if (self->_subtitleLabel)
  {
    v39 = v8;
    v18 = v11;
    v19 = v12;
    v20 = v14;
    v21 = v40;
    CGRectGetWidth(*(CGRect *)&v11);
    v43.origin.x = v18;
    v43.origin.y = v19;
    v43.size.width = v14;
    v43.size.height = v40;
    CGRectGetHeight(v43);
  }
  -[NCNotificationListCountIndicatorView bounds](self, "bounds", *(_QWORD *)&v39);
  UIRectCenteredRect();
  v23 = v22;
  -[UIView setFrame:](self->_containerView, "setFrame:");
  -[UIView bounds](self->_containerView, "bounds");
  UIRectCenteredXInRect();
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  -[UIView bounds](self->_containerView, "bounds");
  UIRectCenteredXInRect();
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v38 = v23 - v36;
  -[NCNotificationListCountIndicatorButton setFrame:](self->_titleLabel, "setFrame:", v25, v27, v29, v31);
  -[NCNotificationListCountIndicatorButton setFrame:](self->_subtitleLabel, "setFrame:", v33, v38, v35, v37);
}

- (id)_fontProvider
{
  BSUIFontProvider *v3;
  BSUIFontProvider *fontProvider;

  if (!self->_fontProvider)
  {
    if (-[NCNotificationListCountIndicatorView adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory"))
    {
      objc_msgSend(MEMORY[0x1E0D01928], "preferredFontProvider");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D01928], "defaultFontProvider");
    }
    v3 = (BSUIFontProvider *)objc_claimAutoreleasedReturnValue();
    fontProvider = self->_fontProvider;
    self->_fontProvider = v3;

  }
  return self->_fontProvider;
}

- (id)_titleLabelFont
{
  void *v2;
  void *v3;

  -[NCNotificationListCountIndicatorView _fontProvider](self, "_fontProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredFontForTextStyle:hiFontStyle:", *MEMORY[0x1E0DC4B10], 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_subtitleLabelFont
{
  void *v2;
  void *v3;

  -[NCNotificationListCountIndicatorView _fontProvider](self, "_fontProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredFontForTextStyle:hiFontStyle:", *MEMORY[0x1E0DC4AB8], 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGRect)_insetBounds
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect v11;
  CGRect v12;
  CGRect result;

  -[NCNotificationListCountIndicatorView bounds](self, "bounds");
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  v6 = CGRectGetWidth(v11) + -16.0;
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  v7 = CGRectGetHeight(v12);
  v8 = 0.0;
  v9 = 0.0;
  v10 = v6;
  result.size.height = v7;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)setPreferredContentSizeCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 528);
}

- (NCNotificationListCountIndicatorViewDelegate)delegate
{
  return (NCNotificationListCountIndicatorViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)shouldAllowLongPressInteraction
{
  return self->_shouldAllowLongPressInteraction;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_subtitleString, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
  objc_storeStrong((id *)&self->_titleSymbol, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_backlightAnimationAssertion, 0);
  objc_storeStrong((id *)&self->_fontProvider, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

- (void)adjustForLegibilitySettingsChange:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1CFC3D000, log, OS_LOG_TYPE_ERROR, "Notification list count indicator view is getting nil legibility settings!", v1, 2u);
}

- (void)assertion:(uint64_t)a3 didCancelWithError:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1CFC3D000, a2, a3, "Backlight assertion for notification count indicator animation is cancelled with error %{public}@", a5, a6, a7, a8, 2u);
}

- (void)assertion:(uint64_t)a3 didFailToAcquireWithError:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1CFC3D000, a2, a3, "Backlight assertion for notification count indicator animation failed to acquire with error %{public}@.", a5, a6, a7, a8, 2u);
}

@end
