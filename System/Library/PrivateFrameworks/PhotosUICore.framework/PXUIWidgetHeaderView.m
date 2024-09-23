@implementation PXUIWidgetHeaderView

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  $F2AB81A7566909F7A180D23364D26594 *p_delegateRespondsTo;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateRespondsTo = &self->_delegateRespondsTo;
    p_delegateRespondsTo->didSelectSubtitle = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->didSelectCaption = objc_opt_respondsToSelector() & 1;
  }

}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *v5;
  NSString *v6;
  char v7;
  NSString *v8;
  NSString *title;
  _QWORD v10[5];

  v4 = (NSString *)a3;
  v5 = self->_title;
  if (v5 == v4)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[NSString isEqual:](v4, "isEqual:", v5);

    if ((v7 & 1) == 0)
    {
      v8 = (NSString *)-[NSString copy](v4, "copy");
      title = self->_title;
      self->_title = v8;

      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __33__PXUIWidgetHeaderView_setTitle___block_invoke;
      v10[3] = &unk_1E5149198;
      v10[4] = self;
      -[PXUIWidgetHeaderView performChanges:](self, "performChanges:", v10);
    }
  }

}

- (void)setSubtitle:(id)a3
{
  NSString *v4;
  NSString *v5;
  NSString *v6;
  char v7;
  _BOOL4 v8;
  NSString *v9;
  NSString *subtitle;
  _QWORD v11[5];

  v4 = (NSString *)a3;
  v5 = self->_subtitle;
  if (v5 == v4)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[NSString isEqual:](v4, "isEqual:", v5);

    if ((v7 & 1) == 0)
    {
      v8 = -[PXUIWidgetHeaderView _hasSubtitle](self, "_hasSubtitle");
      v9 = (NSString *)-[NSString copy](v4, "copy");
      subtitle = self->_subtitle;
      self->_subtitle = v9;

      if (v8 != -[PXUIWidgetHeaderView _hasSubtitle](self, "_hasSubtitle"))
        -[PXUIWidgetHeaderView setNeedsLayout](self, "setNeedsLayout");
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __36__PXUIWidgetHeaderView_setSubtitle___block_invoke;
      v11[3] = &unk_1E5149198;
      v11[4] = self;
      -[PXUIWidgetHeaderView performChanges:](self, "performChanges:", v11);
    }
  }

}

- (void)setCaption:(id)a3
{
  NSString *v4;
  NSString *v5;
  NSString *v6;
  char v7;
  NSString *v8;
  NSString *caption;
  _QWORD v10[5];

  v4 = (NSString *)a3;
  v5 = self->_caption;
  if (v5 == v4)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[NSString isEqual:](v4, "isEqual:", v5);

    if ((v7 & 1) == 0)
    {
      v8 = (NSString *)-[NSString copy](v4, "copy");
      caption = self->_caption;
      self->_caption = v8;

      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __35__PXUIWidgetHeaderView_setCaption___block_invoke;
      v10[3] = &unk_1E5149198;
      v10[4] = self;
      -[PXUIWidgetHeaderView performChanges:](self, "performChanges:", v10);
    }
  }

}

- (void)setPrimaryFont:(id)a3
{
  UIFont *v5;
  UIFont *v6;
  UIFont *v7;
  char v8;
  _QWORD v9[5];

  v5 = (UIFont *)a3;
  v6 = self->_primaryFont;
  if (v6 == v5)
  {

  }
  else
  {
    v7 = v6;
    v8 = -[UIFont isEqual:](v5, "isEqual:", v6);

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_primaryFont, a3);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __39__PXUIWidgetHeaderView_setPrimaryFont___block_invoke;
      v9[3] = &unk_1E5149198;
      v9[4] = self;
      -[PXUIWidgetHeaderView performChanges:](self, "performChanges:", v9);
    }
  }

}

- (void)setSecondaryFont:(id)a3
{
  UIFont *v5;
  UIFont *v6;
  UIFont *v7;
  char v8;
  _QWORD v9[5];

  v5 = (UIFont *)a3;
  v6 = self->_secondaryFont;
  if (v6 == v5)
  {

  }
  else
  {
    v7 = v6;
    v8 = -[UIFont isEqual:](v5, "isEqual:", v6);

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_secondaryFont, a3);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __41__PXUIWidgetHeaderView_setSecondaryFont___block_invoke;
      v9[3] = &unk_1E5149198;
      v9[4] = self;
      -[PXUIWidgetHeaderView performChanges:](self, "performChanges:", v9);
    }
  }

}

- (void)setTextColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;
  UIColor *v7;
  char v8;
  _QWORD v9[5];

  v5 = (UIColor *)a3;
  v6 = self->_textColor;
  if (v6 == v5)
  {

  }
  else
  {
    v7 = v6;
    v8 = -[UIColor isEqual:](v5, "isEqual:", v6);

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_textColor, a3);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __37__PXUIWidgetHeaderView_setTextColor___block_invoke;
      v9[3] = &unk_1E5149198;
      v9[4] = self;
      -[PXUIWidgetHeaderView performChanges:](self, "performChanges:", v9);
    }
  }

}

- (void)setAllowUserInteractionWithSubtitle:(BOOL)a3
{
  _QWORD v4[5];

  if (self->_allowUserInteractionWithSubtitle != a3)
  {
    self->_allowUserInteractionWithSubtitle = a3;
    -[PXUIWidgetHeaderView setNeedsLayout](self, "setNeedsLayout");
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __60__PXUIWidgetHeaderView_setAllowUserInteractionWithSubtitle___block_invoke;
    v4[3] = &unk_1E5149198;
    v4[4] = self;
    -[PXUIWidgetHeaderView performChanges:](self, "performChanges:", v4);
  }
}

- (void)setAllowUserInteractionWithCaption:(BOOL)a3
{
  _QWORD v4[5];

  if (self->_allowUserInteractionWithCaption != a3)
  {
    self->_allowUserInteractionWithCaption = a3;
    -[PXUIWidgetHeaderView setNeedsLayout](self, "setNeedsLayout");
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __59__PXUIWidgetHeaderView_setAllowUserInteractionWithCaption___block_invoke;
    v4[3] = &unk_1E5149198;
    v4[4] = self;
    -[PXUIWidgetHeaderView performChanges:](self, "performChanges:", v4);
  }
}

- (void)setLayoutStyle:(int64_t)a3
{
  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    -[PXUIWidgetHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_contentInsets.left
    || a3.top != self->_contentInsets.top
    || a3.right != self->_contentInsets.right
    || a3.bottom != self->_contentInsets.bottom)
  {
    self->_contentInsets = a3;
    -[PXUIWidgetHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setMinimumDistanceBetweenTopAndFirstBaseline:(double)a3
{
  if (self->_minimumDistanceBetweenTopAndFirstBaseline != a3)
  {
    self->_minimumDistanceBetweenTopAndFirstBaseline = a3;
    -[PXUIWidgetHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setDistanceBetweenTitleBaselineAndSubtitleBaseline:(double)a3
{
  if (self->_distanceBetweenTitleBaselineAndSubtitleBaseline != a3)
  {
    self->_distanceBetweenTitleBaselineAndSubtitleBaseline = a3;
    -[PXUIWidgetHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setHorizontalSpacingBetweenTitleAndSubtitle:(double)a3
{
  if (self->_horizontalSpacingBetweenTitleAndSubtitle != a3)
  {
    self->_horizontalSpacingBetweenTitleAndSubtitle = a3;
    -[PXUIWidgetHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setMinimumDistanceBetweenLastBaselineAndBottom:(double)a3
{
  if (self->_minimumDistanceBetweenLastBaselineAndBottom != a3)
  {
    self->_minimumDistanceBetweenLastBaselineAndBottom = a3;
    -[PXUIWidgetHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)_hasAccessibilityLargeText
{
  void *v2;
  uint64_t v3;
  NSString *v5;
  BOOL IsAccessibilityCategory;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3)
    return 0;
  objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

  return IsAccessibilityCategory;
}

- (void)layoutSubviews
{
  int64_t v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v9;
  _QWORD v10[12];
  uint64_t v11;
  double *v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v15;
  CGRect v16;
  CGRect v17;

  v15.receiver = self;
  v15.super_class = (Class)PXUIWidgetHeaderView;
  -[PXUIWidgetHeaderView layoutSubviews](&v15, sel_layoutSubviews);
  v11 = 0;
  v12 = (double *)&v11;
  v13 = 0x2020000000;
  v14 = 0;
  if (-[PXUIWidgetHeaderView _hasContent](self, "_hasContent"))
  {
    v4 = -[PXUIWidgetHeaderView layoutStyle](self, "layoutStyle");
    -[PXUIWidgetHeaderView bounds](self, "bounds");
    x = v16.origin.x;
    y = v16.origin.y;
    width = v16.size.width;
    height = v16.size.height;
    if (CGRectIsEmpty(v16))
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bounds");
      width = CGRectGetWidth(v17);

    }
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __38__PXUIWidgetHeaderView_layoutSubviews__block_invoke;
    v10[3] = &unk_1E513E3B8;
    *(CGFloat *)&v10[6] = x;
    *(CGFloat *)&v10[7] = y;
    *(CGFloat *)&v10[8] = width;
    *(CGFloat *)&v10[9] = height;
    v10[10] = v4;
    v10[11] = a2;
    v10[4] = self;
    v10[5] = &v11;
    +[PXViewLayoutHelper performLayoutWithinView:usingBlock:](PXViewLayoutHelper, "performLayoutWithinView:usingBlock:", self, v10);
  }
  -[PXUIWidgetHeaderView _setCurrentHeight:](self, "_setCurrentHeight:", v12[3]);
  _Block_object_dispose(&v11, 8);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v5;
  double v6;
  double v7;
  CGSize result;

  width = a3.width;
  -[PXUIWidgetHeaderView layoutIfNeeded](self, "layoutIfNeeded", a3.width, a3.height);
  -[PXUIWidgetHeaderView _currentHeight](self, "_currentHeight");
  v6 = v5;
  v7 = width;
  result.height = v6;
  result.width = v7;
  return result;
}

- (id)_visualEffectViewCreateIfNeeded:(BOOL)a3
{
  UIVisualEffectView *visualEffectView;
  BOOL v5;
  void *v6;
  void *v7;
  UIVisualEffectView *v8;
  UIVisualEffectView *v9;

  visualEffectView = self->__visualEffectView;
  if (visualEffectView)
    v5 = 1;
  else
    v5 = !a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3F08], "effectForBlurEffect:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v7);
    v9 = self->__visualEffectView;
    self->__visualEffectView = v8;

    -[PXUIWidgetHeaderView addSubview:](self, "addSubview:", self->__visualEffectView);
    visualEffectView = self->__visualEffectView;
  }
  return visualEffectView;
}

- (id)_titleLabelCreateIfNeeded:(BOOL)a3
{
  UILabel *titleLabel;
  BOOL v5;
  UILabel *v6;
  UILabel *v7;
  UIVisualEffectView *visualEffectView;
  PXUIWidgetHeaderView *v9;
  PXUIWidgetHeaderView *v10;

  titleLabel = self->__titleLabel;
  if (titleLabel)
    v5 = 1;
  else
    v5 = !a3;
  if (!v5)
  {
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    v7 = self->__titleLabel;
    self->__titleLabel = v6;

    visualEffectView = self->__visualEffectView;
    if (visualEffectView)
    {
      -[UIVisualEffectView contentView](visualEffectView, "contentView");
      v9 = (PXUIWidgetHeaderView *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = self;
    }
    v10 = v9;
    -[PXUIWidgetHeaderView addSubview:](v9, "addSubview:", self->__titleLabel);

    titleLabel = self->__titleLabel;
  }
  return titleLabel;
}

- (id)_subtitleLabelCreateIfNeeded:(BOOL)a3
{
  UILabel *subtitleLabel;
  BOOL v5;
  UILabel *v6;
  UILabel *v7;
  UIVisualEffectView *visualEffectView;
  PXUIWidgetHeaderView *v9;
  PXUIWidgetHeaderView *v10;

  subtitleLabel = self->__subtitleLabel;
  if (subtitleLabel)
    v5 = 1;
  else
    v5 = !a3;
  if (!v5)
  {
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    v7 = self->__subtitleLabel;
    self->__subtitleLabel = v6;

    -[UILabel setNumberOfLines:](self->__subtitleLabel, "setNumberOfLines:", 0);
    visualEffectView = self->__visualEffectView;
    if (visualEffectView)
    {
      -[UIVisualEffectView contentView](visualEffectView, "contentView");
      v9 = (PXUIWidgetHeaderView *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = self;
    }
    v10 = v9;
    -[PXUIWidgetHeaderView addSubview:](v9, "addSubview:", self->__subtitleLabel);

    subtitleLabel = self->__subtitleLabel;
  }
  return subtitleLabel;
}

- (id)_subtitleButtonCreateIfNeeded:(BOOL)a3
{
  UIButton *subtitleButton;
  BOOL v5;
  UIButton *v6;
  UIButton *v7;

  subtitleButton = self->__subtitleButton;
  if (subtitleButton)
    v5 = 1;
  else
    v5 = !a3;
  if (!v5)
  {
    +[PXUIButton buttonWithType:](PXUIButton, "buttonWithType:", 1);
    v6 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v7 = self->__subtitleButton;
    self->__subtitleButton = v6;

    -[UIButton addTarget:action:forControlEvents:](self->__subtitleButton, "addTarget:action:forControlEvents:", self, sel__handleSubtitleButton_, 0x2000);
    -[PXUIWidgetHeaderView addSubview:](self, "addSubview:", self->__subtitleButton);
    subtitleButton = self->__subtitleButton;
  }
  return subtitleButton;
}

- (id)_captionLabelCreateIfNeeded:(BOOL)a3
{
  UILabel *captionLabel;
  BOOL v5;
  UILabel *v6;
  UILabel *v7;

  captionLabel = self->__captionLabel;
  if (captionLabel)
    v5 = 1;
  else
    v5 = !a3;
  if (!v5)
  {
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    v7 = self->__captionLabel;
    self->__captionLabel = v6;

    -[PXUIWidgetHeaderView addSubview:](self, "addSubview:", self->__captionLabel);
    captionLabel = self->__captionLabel;
  }
  return captionLabel;
}

- (id)_captionButtonCreateIfNeeded:(BOOL)a3
{
  UIButton *captionButton;
  UIButton *v5;
  UIButton *v6;

  captionButton = self->__captionButton;
  if (!captionButton)
  {
    +[PXUIButton buttonWithType:](PXUIButton, "buttonWithType:", 1);
    v5 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v6 = self->__captionButton;
    self->__captionButton = v5;

    -[UIButton addTarget:action:forControlEvents:](self->__captionButton, "addTarget:action:forControlEvents:", self, sel__handleCaptionButton_, 0x2000);
    -[PXUIWidgetHeaderView addSubview:](self, "addSubview:", self->__captionButton);
    captionButton = self->__captionButton;
  }
  return captionButton;
}

- (void)_setHasContent:(BOOL)a3
{
  if (self->__hasContent != a3)
  {
    self->__hasContent = a3;
    -[PXUIWidgetHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_setConstraints:(id)a3
{
  NSArray *v4;
  char v5;
  NSArray *v6;
  NSArray *constraints;
  NSArray *v8;

  v8 = (NSArray *)a3;
  v4 = self->__constraints;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSArray isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      if (self->__constraints)
        objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:");
      v6 = (NSArray *)-[NSArray copy](v8, "copy");
      constraints = self->__constraints;
      self->__constraints = v6;

      if (self->__constraints)
        objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:");
    }
  }

}

- (BOOL)_hasSubtitle
{
  void *v2;
  BOOL v3;

  -[PXUIWidgetHeaderView subtitle](self, "subtitle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (BOOL)_canComposeTitleWithSubtitle
{
  _BOOL4 v3;

  if (-[PXUIWidgetHeaderView layoutStyle](self, "layoutStyle") == 2)
  {
    v3 = -[PXUIWidgetHeaderView _hasSubtitle](self, "_hasSubtitle");
    if (v3)
      LOBYTE(v3) = !-[PXUIWidgetHeaderView allowUserInteractionWithSubtitle](self, "allowUserInteractionWithSubtitle");
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)_handleSubtitleButton:(id)a3
{
  id v4;
  id v5;

  if (self->_delegateRespondsTo.didSelectSubtitle)
  {
    v4 = a3;
    -[PXUIWidgetHeaderView delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "widgetHeaderView:didSelectSubtitle:", self, v4);

  }
}

- (void)_handleCaptionButton:(id)a3
{
  id v4;
  id v5;

  if (self->_delegateRespondsTo.didSelectCaption)
  {
    v4 = a3;
    -[PXUIWidgetHeaderView delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "widgetHeaderView:didSelectCaption:", self, v4);

  }
}

- (void)performChanges:(id)a3
{
  void (**v4)(_QWORD);
  _BOOL4 isPerformingChanges;
  void (**v6)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  isPerformingChanges = self->_isPerformingChanges;
  self->_isPerformingChanges = 1;
  v6 = v4;
  if (v4)
  {
    v4[2](v4);
    v4 = v6;
  }
  self->_isPerformingChanges = isPerformingChanges;
  if (!isPerformingChanges)
  {
    -[PXUIWidgetHeaderView _updateIfNeeded](self, "_updateIfNeeded");
    v4 = v6;
  }

}

- (void)_updateIfNeeded
{
  BOOL isPerformingUpdates;
  id v5;

  if (-[PXUIWidgetHeaderView _needsUpdate](self, "_needsUpdate"))
  {
    isPerformingUpdates = self->_isPerformingUpdates;
    self->_isPerformingUpdates = 1;
    -[PXUIWidgetHeaderView _updateHasContentIfNeeded](self, "_updateHasContentIfNeeded");
    -[PXUIWidgetHeaderView _updateTitleIfNeeded](self, "_updateTitleIfNeeded");
    -[PXUIWidgetHeaderView _updateSubtitleIfNeeded](self, "_updateSubtitleIfNeeded");
    -[PXUIWidgetHeaderView _updateCaptionIfNeeded](self, "_updateCaptionIfNeeded");
    self->_isPerformingUpdates = isPerformingUpdates;
    if (-[PXUIWidgetHeaderView _needsUpdate](self, "_needsUpdate"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUIWidgetHeaderView.m"), 531, CFSTR("update still needed after update pass"));

    }
  }
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.hasContent
      || self->_needsUpdateFlags.title
      || self->_needsUpdateFlags.subtitle
      || self->_needsUpdateFlags.caption;
}

- (void)_setNeedsUpdate
{
  id v4;

  if (!self->_isPerformingChanges && !self->_isPerformingUpdates)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUIWidgetHeaderView.m"), 544, CFSTR("not inside -performChanges: or _updateIfNeeded"));

  }
}

- (void)_invalidateHasContent
{
  self->_needsUpdateFlags.hasContent = 1;
  -[PXUIWidgetHeaderView _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateHasContentIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _BOOL8 v7;
  void *v8;

  if (self->_needsUpdateFlags.hasContent)
  {
    self->_needsUpdateFlags.hasContent = 0;
    -[PXUIWidgetHeaderView title](self, "title");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "length");

    if (v4
      || (-[PXUIWidgetHeaderView subtitle](self, "subtitle"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v5, "length"),
          v5,
          v6))
    {
      v7 = 1;
    }
    else
    {
      -[PXUIWidgetHeaderView caption](self, "caption");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "length") != 0;

    }
    -[PXUIWidgetHeaderView _setHasContent:](self, "_setHasContent:", v7);
  }
}

- (void)_invalidateTitle
{
  self->_needsUpdateFlags.title = 1;
  -[PXUIWidgetHeaderView _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateTitleIfNeeded
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _BOOL4 v13;
  uint64_t v14;
  id v15;

  if (self->_needsUpdateFlags.title)
  {
    self->_needsUpdateFlags.title = 0;
    -[PXUIWidgetHeaderView title](self, "title");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    -[PXUIWidgetHeaderView primaryFont](self, "primaryFont");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v5 = v3;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B60]);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = v5;

    -[PXUIWidgetHeaderView textColor](self, "textColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v15, "length");
    -[PXUIWidgetHeaderView _titleLabelCreateIfNeeded:](self, "_titleLabelCreateIfNeeded:", v8 != 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && -[PXUIWidgetHeaderView _canComposeTitleWithSubtitle](self, "_canComposeTitleWithSubtitle"))
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      -[PXUIWidgetHeaderView subtitle](self, "subtitle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ %@ %@"), v15, CFSTR("·"), v11);
      v12 = objc_claimAutoreleasedReturnValue();

      v15 = (id)v12;
    }
    objc_msgSend(v9, "setText:", v15);
    objc_msgSend(v9, "setHidden:", v8 == 0);
    objc_msgSend(v9, "setFont:", v6);
    objc_msgSend(v9, "setTextColor:", v7);
    v13 = -[PXUIWidgetHeaderView _hasAccessibilityLargeText](self, "_hasAccessibilityLargeText");
    if (v13)
      v14 = 0;
    else
      v14 = 4;
    objc_msgSend(v9, "setNumberOfLines:", !v13);
    objc_msgSend(v9, "setLineBreakMode:", v14);
    -[PXUIWidgetHeaderView setNeedsLayout](self, "setNeedsLayout");

  }
}

- (void)_invalidateSubtitle
{
  self->_needsUpdateFlags.subtitle = 1;
  -[PXUIWidgetHeaderView _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateSubtitleIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  _BOOL4 v10;
  uint64_t v11;
  _BOOL8 v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  if (self->_needsUpdateFlags.subtitle)
  {
    self->_needsUpdateFlags.subtitle = 0;
    -[PXUIWidgetHeaderView subtitle](self, "subtitle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXUIWidgetHeaderView secondaryFont](self, "secondaryFont");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;

    -[PXUIWidgetHeaderView textColor](self, "textColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PXUIWidgetHeaderView allowUserInteractionWithSubtitle](self, "allowUserInteractionWithSubtitle");
    v10 = -[PXUIWidgetHeaderView _canComposeTitleWithSubtitle](self, "_canComposeTitleWithSubtitle");
    if (v10)
    {

      v3 = 0;
    }
    v11 = objc_msgSend(v3, "length");
    if (v11)
      v12 = !v9;
    else
      v12 = 0;
    if (v11)
      v13 = v9;
    else
      v13 = 0;
    -[PXUIWidgetHeaderView _subtitleLabelCreateIfNeeded:](self, "_subtitleLabelCreateIfNeeded:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v10)
      objc_msgSend(v14, "setText:", 0);
    -[PXUIWidgetHeaderView _subtitleButtonCreateIfNeeded:](self, "_subtitleButtonCreateIfNeeded:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v15, "setText:", v3);
      objc_msgSend(v15, "setFont:", v7);
      objc_msgSend(v15, "setTextColor:", v8);
    }
    if (v13)
    {
      if (v3)
      {
        v17 = objc_alloc(MEMORY[0x1E0CB3498]);
        v24 = *MEMORY[0x1E0DC1138];
        v25[0] = v7;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v17, "initWithString:attributes:", v3, v18);

      }
      else
      {
        v19 = 0;
      }
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __47__PXUIWidgetHeaderView__updateSubtitleIfNeeded__block_invoke;
      v21[3] = &unk_1E5148D08;
      v22 = v16;
      v23 = v19;
      v20 = v19;
      objc_msgSend(v22, "px_updateTitleUsingBlock:", v21);

    }
    objc_msgSend(v15, "setHidden:", v13);
    objc_msgSend(v16, "setHidden:", v13 ^ 1);
    -[PXUIWidgetHeaderView setNeedsLayout](self, "setNeedsLayout");

  }
}

- (void)_invalidateCaption
{
  self->_needsUpdateFlags.caption = 1;
  -[PXUIWidgetHeaderView _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateCaptionIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _BOOL4 v10;
  _BOOL8 v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  if (self->_needsUpdateFlags.caption)
  {
    self->_needsUpdateFlags.caption = 0;
    -[PXUIWidgetHeaderView caption](self, "caption");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXUIWidgetHeaderView secondaryFont](self, "secondaryFont");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;

    -[PXUIWidgetHeaderView textColor](self, "textColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v3, "length");
    v10 = -[PXUIWidgetHeaderView allowUserInteractionWithCaption](self, "allowUserInteractionWithCaption");
    if (v9)
      v11 = !v10;
    else
      v11 = 0;
    if (v9)
      v12 = v10;
    else
      v12 = 0;
    -[PXUIWidgetHeaderView _captionLabelCreateIfNeeded:](self, "_captionLabelCreateIfNeeded:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXUIWidgetHeaderView _captionButtonCreateIfNeeded:](self, "_captionButtonCreateIfNeeded:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v13, "setText:", v3);
      objc_msgSend(v13, "setFont:", v7);
      objc_msgSend(v13, "setTextColor:", v8);
    }
    if (v12)
    {
      if (v3)
      {
        v15 = objc_alloc(MEMORY[0x1E0CB3498]);
        v22 = *MEMORY[0x1E0DC1138];
        v23[0] = v7;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v15, "initWithString:attributes:", v3, v16);

      }
      else
      {
        v17 = 0;
      }
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __46__PXUIWidgetHeaderView__updateCaptionIfNeeded__block_invoke;
      v19[3] = &unk_1E5148D08;
      v20 = v14;
      v21 = v17;
      v18 = v17;
      objc_msgSend(v20, "px_updateTitleUsingBlock:", v19);

    }
    objc_msgSend(v13, "setHidden:", v12);
    objc_msgSend(v14, "setHidden:", v12 ^ 1);
    -[PXUIWidgetHeaderView setNeedsLayout](self, "setNeedsLayout");

  }
}

- (PXUIWidgetHeaderViewDelegate)delegate
{
  return (PXUIWidgetHeaderViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)caption
{
  return self->_caption;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UIFont)primaryFont
{
  return self->_primaryFont;
}

- (UIFont)secondaryFont
{
  return self->_secondaryFont;
}

- (BOOL)allowUserInteractionWithSubtitle
{
  return self->_allowUserInteractionWithSubtitle;
}

- (BOOL)allowUserInteractionWithCaption
{
  return self->_allowUserInteractionWithCaption;
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)minimumDistanceBetweenTopAndFirstBaseline
{
  return self->_minimumDistanceBetweenTopAndFirstBaseline;
}

- (double)distanceBetweenTitleBaselineAndSubtitleBaseline
{
  return self->_distanceBetweenTitleBaselineAndSubtitleBaseline;
}

- (double)horizontalSpacingBetweenTitleAndSubtitle
{
  return self->_horizontalSpacingBetweenTitleAndSubtitle;
}

- (double)minimumDistanceBetweenLastBaselineAndBottom
{
  return self->_minimumDistanceBetweenLastBaselineAndBottom;
}

- (BOOL)_hasContent
{
  return self->__hasContent;
}

- (NSArray)_constraints
{
  return self->__constraints;
}

- (double)_currentHeight
{
  return self->__currentHeight;
}

- (void)_setCurrentHeight:(double)a3
{
  self->__currentHeight = a3;
}

- (UILabel)_titleLabel
{
  return self->__titleLabel;
}

- (UILabel)_subtitleLabel
{
  return self->__subtitleLabel;
}

- (UIButton)_subtitleButton
{
  return self->__subtitleButton;
}

- (UILabel)_captionLabel
{
  return self->__captionLabel;
}

- (UIButton)_captionButton
{
  return self->__captionButton;
}

- (UIVisualEffectView)_visualEffectView
{
  return self->__visualEffectView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__visualEffectView, 0);
  objc_storeStrong((id *)&self->__captionButton, 0);
  objc_storeStrong((id *)&self->__captionLabel, 0);
  objc_storeStrong((id *)&self->__subtitleButton, 0);
  objc_storeStrong((id *)&self->__subtitleLabel, 0);
  objc_storeStrong((id *)&self->__titleLabel, 0);
  objc_storeStrong((id *)&self->__constraints, 0);
  objc_storeStrong((id *)&self->_secondaryFont, 0);
  objc_storeStrong((id *)&self->_primaryFont, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_caption, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __46__PXUIWidgetHeaderView__updateCaptionIfNeeded__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setAttributedTitle:forState:", *(_QWORD *)(a1 + 40), 0);
  objc_msgSend(*(id *)(a1 + 32), "setContentHorizontalAlignment:", 1);
  objc_msgSend(*(id *)(a1 + 32), "titleLabel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLineBreakMode:", 0);

}

void __47__PXUIWidgetHeaderView__updateSubtitleIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "setAttributedTitle:forState:", *(_QWORD *)(a1 + 40), 0);
  v2 = *(void **)(a1 + 32);
  if (objc_msgSend(MEMORY[0x1E0C99DC8], "px_currentCharacterDirection") == 2)
    v3 = 2;
  else
    v3 = 1;
  objc_msgSend(v2, "setContentHorizontalAlignment:", v3);
  objc_msgSend(*(id *)(a1 + 32), "titleLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLineBreakMode:", 0);

}

void __38__PXUIWidgetHeaderView_layoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double MinX;
  double MaxX;
  double MinY;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int64x2_t v23;
  double v24;
  double v25;
  void *v26;
  uint64_t v27;
  char v28;
  void *v29;
  void *v30;
  double MidX;
  double v32;
  double v33;
  double v34;
  void *v35;
  uint64_t v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  void *v41;
  uint64_t v42;
  char v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  int64x2_t v48;
  double v49;
  double v50;
  double v51;
  int64x2_t v52;
  int64x2_t *v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  int v58;
  void *v59;
  double v60;
  int64x2_t v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  int64x2_t v67;
  int64x2_t v68;
  double v69;
  double v70;
  int64x2_t v71;
  int64x2_t v72;
  int64x2_t v73;
  int64x2_t v74;
  int64x2_t v75;
  int64x2_t v76;
  int64x2_t v77;
  int64x2_t v78;
  int64x2_t v79;
  int64x2_t v80;
  int64x2_t v81;
  int64x2_t v82;
  uint64_t v83;
  double v84;
  int64x2_t v85;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "contentInsets");
  v69 = v4;
  v70 = v5;
  v7 = v6;
  v9 = v8;
  MinX = CGRectGetMinX(*(CGRect *)(a1 + 48));
  MaxX = CGRectGetMaxX(*(CGRect *)(a1 + 48));
  MinY = CGRectGetMinY(*(CGRect *)(a1 + 48));
  v13 = CGRectGetMinY(*(CGRect *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "minimumDistanceBetweenTopAndFirstBaseline");
  v15 = v14;
  objc_msgSend(*(id *)(a1 + 32), "_visualEffectView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(*(id *)(a1 + 32), "bounds");
    objc_msgSend(v16, "setFrame:");
  }
  v17 = v7 + MinX;
  v18 = MaxX - v9;
  v19 = v13 + v15;
  objc_msgSend(*(id *)(a1 + 32), "title");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "length");

  if (v21)
  {
    objc_msgSend(*(id *)(a1 + 32), "_titleLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v23 = vdupq_n_s64(0x7FF8000000000000uLL);
      v78.i64[1] = v23.i64[1];
      v79 = v23;
      v80 = v23;
      v81.i64[1] = v23.i64[1];
      v83 = v23.i64[0];
      v85 = v23;
      *(double *)v78.i64 = v17;
      v84 = v18;
      *(double *)v81.i64 = v13 + v15;
      v82 = vdupq_n_s64(0x7FF0000000000000uLL);
      objc_msgSend(v3, "layoutView:withAttributes:", v22, &v78);
      objc_msgSend(v3, "lastBaselineOfView:", v22);
      v19 = v24;
      objc_msgSend(v3, "bottomOfView:", v22);
      MinY = v25;
    }
  }
  else
  {
    v22 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "caption");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "length");

  if (v27)
  {
    v28 = objc_msgSend(*(id *)(a1 + 32), "allowUserInteractionWithCaption");
    v29 = *(void **)(a1 + 32);
    if ((v28 & 1) != 0)
      objc_msgSend(v29, "_captionButton");
    else
      objc_msgSend(v29, "_captionLabel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30 && (objc_msgSend(*(id *)(a1 + 32), "_hasAccessibilityLargeText") & 1) == 0)
    {
      MidX = CGRectGetMidX(*(CGRect *)(a1 + 48));
      if (v22)
      {
        objc_msgSend(v3, "trailingOfView:", v22);
        if (MidX >= v32)
          MidX = v32;
      }
      v78 = vdupq_n_s64(0x7FF8000000000000uLL);
      v79.i64[1] = v78.i64[1];
      v80 = v78;
      v81.i64[1] = v78.i64[1];
      v84 = *(double *)&v78.i64[1];
      v85 = v78;
      v83 = *(_QWORD *)&MidX;
      *(double *)v79.i64 = v18;
      *(double *)v81.i64 = v19;
      v82 = vdupq_n_s64(0x7FF0000000000000uLL);
      objc_msgSend(v3, "layoutView:withAttributes:", v30, &v78, *(_OWORD *)&v82, *(_OWORD *)&v78);
      objc_msgSend(v3, "leadingOfView:", v30);
      v18 = v33;
      if (v22)
      {
        v71.i64[1] = v68.i64[1];
        v72 = v68;
        v73 = v68;
        v74 = v68;
        v76.i64[0] = v68.i64[0];
        v77 = v68;
        v71.i64[0] = 0xFFF0000000000000;
        *(double *)&v76.i64[1] = v33;
        v75 = v67;
        objc_msgSend(v3, "layoutView:withAttributes:", v22, &v71);
      }
      else
      {
        objc_msgSend(v3, "bottomOfView:", v30);
        MinY = v34;
      }
    }
  }
  else
  {
    v30 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "title");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "length");

  if (v36)
  {
    objc_msgSend(*(id *)(a1 + 32), "distanceBetweenTitleBaselineAndSubtitleBaseline");
    v38 = v37;
    if (v37 <= 0.0)
    {
      objc_msgSend(*(id *)(a1 + 32), "secondaryFont");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "lineHeight");
      v38 = v40;

    }
  }
  else
  {
    v38 = 0.0;
  }
  objc_msgSend(*(id *)(a1 + 32), "subtitle");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "length");

  if (!v42)
  {
    v45 = 0;
    goto LABEL_46;
  }
  v43 = objc_msgSend(*(id *)(a1 + 32), "allowUserInteractionWithSubtitle");
  v44 = *(void **)(a1 + 32);
  if ((v43 & 1) != 0)
    objc_msgSend(v44, "_subtitleButton");
  else
    objc_msgSend(v44, "_subtitleLabel");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (v45)
  {
    v46 = *(_QWORD *)(a1 + 80);
    switch(v46)
    {
      case 1:
        v48 = vdupq_n_s64(0x7FF8000000000000uLL);
        v78.i64[1] = v48.i64[1];
        v79 = v48;
        v80 = v48;
        v81 = v48;
        v83 = v48.i64[0];
        v85 = v48;
        *(double *)v78.i64 = v17;
        v84 = v18;
        v82 = vdupq_n_s64(0x7FF0000000000000uLL);
        if (v22)
          v19 = v19 + v38;
        else
          *(double *)v85.i64 = v69 + CGRectGetMinY(*(CGRect *)(a1 + 48));
        *(double *)v81.i64 = v19;
        objc_msgSend(v3, "layoutView:withAttributes:", v45, &v78);
        objc_msgSend(v3, "lastBaselineOfView:", v45);
        v19 = v56;
        objc_msgSend(v3, "bottomOfView:", v45);
        MinY = v57;
        if (!v30 || (objc_msgSend(*(id *)(a1 + 32), "_hasAccessibilityLargeText") & 1) != 0)
          goto LABEL_46;
        v71 = vdupq_n_s64(0x7FF8000000000000uLL);
        v72 = v71;
        v73 = v71;
        v74.i64[1] = v71.i64[1];
        v75 = v71;
        v76 = v71;
        v77 = v71;
        *(double *)v74.i64 = v19;
        v53 = &v71;
        v54 = v3;
        v55 = v30;
        break;
      case 2:
        if (v22)
        {
          objc_msgSend(v3, "trailingOfView:", v22);
          v50 = v49;
          objc_msgSend(*(id *)(a1 + 32), "horizontalSpacingBetweenTitleAndSubtitle");
          v17 = v50 + v51;
        }
        v52 = vdupq_n_s64(0x7FF8000000000000uLL);
        v78.i64[1] = v52.i64[1];
        v79 = v52;
        v80 = v52;
        v81 = v52;
        v83 = v52.i64[0];
        v85 = v52;
        *(double *)v78.i64 = v17;
        v84 = v18;
        v82 = vdupq_n_s64(0x7FF0000000000000uLL);
        if (!v22)
          *(double *)v85.i64 = v69 + CGRectGetMinY(*(CGRect *)(a1 + 48));
        *(double *)v81.i64 = v19;
        v53 = &v78;
        v54 = v3;
        v55 = v45;
        break;
      case 0:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 32), CFSTR("PXUIWidgetHeaderView.m"), 307, CFSTR("Code which should be unreachable has been reached"));

        abort();
      default:
        goto LABEL_46;
    }
    objc_msgSend(v54, "layoutView:withAttributes:", v55, v53);
  }
LABEL_46:
  v58 = objc_msgSend(*(id *)(a1 + 32), "_hasAccessibilityLargeText");
  if (v30 && v58)
  {
    if (v38 <= 0.0)
    {
      objc_msgSend(*(id *)(a1 + 32), "secondaryFont");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "lineHeight");
      v38 = v60;

    }
    v61 = vdupq_n_s64(0x7FF8000000000000uLL);
    v78.i64[1] = v61.i64[1];
    v79 = v61;
    v80 = v61;
    v81.i64[1] = v61.i64[1];
    v83 = v61.i64[0];
    v85 = v61;
    *(double *)v78.i64 = v17;
    v84 = v18;
    *(double *)v81.i64 = v19 + v38;
    v82 = vdupq_n_s64(0x7FF0000000000000uLL);
    objc_msgSend(v3, "layoutView:withAttributes:", v30, &v78);
    objc_msgSend(v3, "lastBaselineOfView:", v30);
    v19 = v62;
    objc_msgSend(v3, "bottomOfView:", v30);
    MinY = v63;
  }
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v70 + MinY;
  v64 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  objc_msgSend(*(id *)(a1 + 32), "minimumDistanceBetweenLastBaselineAndBottom");
  v66 = v19 + v65;
  if (v64 >= v66)
    v66 = v64;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v66;

}

uint64_t __59__PXUIWidgetHeaderView_setAllowUserInteractionWithCaption___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateCaption");
}

uint64_t __60__PXUIWidgetHeaderView_setAllowUserInteractionWithSubtitle___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateSubtitle");
}

uint64_t __37__PXUIWidgetHeaderView_setTextColor___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateTitle");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateSubtitle");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateCaption");
}

uint64_t __41__PXUIWidgetHeaderView_setSecondaryFont___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateSubtitle");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateCaption");
}

uint64_t __39__PXUIWidgetHeaderView_setPrimaryFont___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateTitle");
}

uint64_t __35__PXUIWidgetHeaderView_setCaption___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateHasContent");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateCaption");
}

uint64_t __36__PXUIWidgetHeaderView_setSubtitle___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateHasContent");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateSubtitle");
}

uint64_t __33__PXUIWidgetHeaderView_setTitle___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateHasContent");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateTitle");
}

@end
