@implementation PXActionableSectionHeaderView

- (void)setClippingRect:(CGRect)a3
{
  id v5;

  if (!CGRectEqualToRect(a3, *MEMORY[0x1E0C9D5E0]))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActionableSectionHeaderLayoutProvider+iOS.m"), 563, CFSTR("Clipping isn't supported"));

  }
}

- (CGRect)clippingRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D5E0];
  v3 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setUserData:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  id v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  _OWORD v23[2];
  __int128 v24;
  __int128 v25;

  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "px_descriptionForAssertionMessage");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActionableSectionHeaderLayoutProvider+iOS.m"), 571, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("userData"), v19, v20);

    }
  }
  objc_getAssociatedObject(self, (const void *)UserDataAssociationKey);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 != v5)
  {
    objc_setAssociatedObject(self, (const void *)UserDataAssociationKey, v5, (void *)3);
    -[PXActionableSectionHeaderView setBackgroundStyle:](self, "setBackgroundStyle:", objc_msgSend(v5, "backgroundStyle"));
    -[PXActionableSectionHeaderView setButtonStyle:](self, "setButtonStyle:", objc_msgSend(v5, "buttonStyle"));
    objc_msgSend(v5, "primaryText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionableSectionHeaderView setPrimaryText:](self, "setPrimaryText:", v7);

    objc_msgSend(v5, "secondaryText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionableSectionHeaderView setSecondaryText:](self, "setSecondaryText:", v8);

    objc_msgSend(v5, "edgeInsets");
    -[PXActionableSectionHeaderView setContentInsets:](self, "setContentInsets:");
    objc_msgSend(v5, "weakLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionableSectionHeaderView setDelegate:](self, "setDelegate:", v9);
    objc_msgSend(v5, "actionText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionableSectionHeaderView setActionText:](self, "setActionText:", v10);

    objc_msgSend(v5, "backdropViewGroupName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionableSectionHeaderView setBackdropViewGroupName:](self, "setBackdropViewGroupName:", v11);

    objc_msgSend(v5, "gradientImage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionableSectionHeaderView setBackgroundImage:](self, "setBackgroundImage:", v12);

    objc_msgSend(v5, "gradientAlpha");
    -[PXActionableSectionHeaderView setBackgroundImageAlpha:](self, "setBackgroundImageAlpha:");
    objc_msgSend(v5, "gradientOverhang");
    -[PXActionableSectionHeaderView setBackgroundImageOverhang:](self, "setBackgroundImageOverhang:");
    objc_msgSend(v5, "buttonSpec");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionableSectionHeaderView setBackdropButtonSpec:](self, "setBackdropButtonSpec:", v13);

    objc_msgSend(v5, "filterButtonControllerFactory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionableSectionHeaderView setFilterButtonControllerFactory:](self, "setFilterButtonControllerFactory:", v14);

    if (v5)
    {
      objc_msgSend(v5, "sectionIndexPath");
    }
    else
    {
      v24 = 0u;
      v25 = 0u;
    }
    v23[0] = v24;
    v23[1] = v25;
    -[PXActionableSectionHeaderView setSectionIndexPath:](self, "setSectionIndexPath:", v23);
    -[PXActionableSectionHeaderView setAvoidsTintedButtonsAtHighSpeed:](self, "setAvoidsTintedButtonsAtHighSpeed:", objc_msgSend(v5, "avoidsTintedButtonsAtHighSpeeds"));
    -[PXActionableSectionHeaderView setSupportsMultipleLinesInCompactLayout:](self, "setSupportsMultipleLinesInCompactLayout:", objc_msgSend(v5, "supportsMultipleLinesInCompactLayout"));
    -[PXActionableSectionHeaderView setPreferredUserInterfaceStyle:](self, "setPreferredUserInterfaceStyle:", objc_msgSend(v5, "preferredUserInterfaceStyle"));
    v15 = objc_msgSend(v9, "scrollSpeedRegime") < 2;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __62__PXActionableSectionHeaderView_PXGReusableView__setUserData___block_invoke;
    v21[3] = &unk_1E5148D08;
    v21[4] = self;
    v22 = v9;
    v16 = v9;
    -[PXActionableSectionHeaderView performChangesToGroupedBackgroundPropertiesAnimated:withBlock:](self, "performChangesToGroupedBackgroundPropertiesAnimated:withBlock:", v15, v21);
    -[PXActionableSectionHeaderView setShowsActionButton:animated:](self, "setShowsActionButton:animated:", objc_msgSend(v5, "showsActionButton"), v15);
    -[PXActionableSectionHeaderView setShowsSecondaryButton:animated:](self, "setShowsSecondaryButton:animated:", objc_msgSend(v5, "showsSecondaryButton"), v15);

  }
}

- (NSCopying)userData
{
  return (NSCopying *)objc_getAssociatedObject(self, (const void *)UserDataAssociationKey);
}

uint64_t __62__PXActionableSectionHeaderView_PXGReusableView__setUserData___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setSpeedRegime:", objc_msgSend(*(id *)(a1 + 40), "scrollSpeedRegime"));
  return objc_msgSend(*(id *)(a1 + 32), "setWantsBackground:", objc_msgSend(*(id *)(a1 + 40), "wantsBackground"));
}

- (PXActionableSectionHeaderView)initWithFrame:(CGRect)a3
{
  PXActionableSectionHeaderView *v3;
  UILabel *v4;
  UILabel *primaryLabel;
  UILabel *v6;
  UILabel *spacerLabel;
  UILabel *v8;
  UILabel *secondaryLabel;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PXActionableSectionHeaderView;
  v3 = -[PXActionableSectionHeaderView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    primaryLabel = v3->_primaryLabel;
    v3->_primaryLabel = v4;

    -[UILabel setUserInteractionEnabled:](v3->_primaryLabel, "setUserInteractionEnabled:", 0);
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    spacerLabel = v3->_spacerLabel;
    v3->_spacerLabel = v6;

    -[UILabel setUserInteractionEnabled:](v3->_spacerLabel, "setUserInteractionEnabled:", 0);
    -[UILabel setText:](v3->_spacerLabel, "setText:", CFSTR("·"));
    -[UILabel setAccessibilityElementsHidden:](v3->_spacerLabel, "setAccessibilityElementsHidden:", 1);
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    secondaryLabel = v3->_secondaryLabel;
    v3->_secondaryLabel = v8;

    -[UILabel setUserInteractionEnabled:](v3->_secondaryLabel, "setUserInteractionEnabled:", 0);
    v3->_buttonStyle = 0;
    v3->_actionButtonEnabled = 1;
    -[PXActionableSectionHeaderView addSubview:](v3, "addSubview:", v3->_primaryLabel);
    -[PXActionableSectionHeaderView addSubview:](v3, "addSubview:", v3->_spacerLabel);
    -[PXActionableSectionHeaderView addSubview:](v3, "addSubview:", v3->_secondaryLabel);
    v3->_backgroundStyle = 0;
    -[PXActionableSectionHeaderView _updateBackgroundAnimated:](v3, "_updateBackgroundAnimated:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionableSectionHeaderView setBackgroundColor:](v3, "setBackgroundColor:", v10);

    -[PXActionableSectionHeaderView setOpaque:](v3, "setOpaque:", 0);
    -[PXActionableSectionHeaderView _updateLabelFonts](v3, "_updateLabelFonts");
    -[PXActionableSectionHeaderView _updateSpacerLabelHiddenState](v3, "_updateSpacerLabelHiddenState");
    -[PXActionableSectionHeaderView _updateLabelLineNumbers](v3, "_updateLabelLineNumbers");
    -[PXActionableSectionHeaderView _updateLabelColors](v3, "_updateLabelColors");
    -[PXActionableSectionHeaderView _updateActionButtonAnimated:](v3, "_updateActionButtonAnimated:", 0);
    -[PXActionableSectionHeaderView _updateActionButtonConfiguration](v3, "_updateActionButtonConfiguration");
    -[PXActionableSectionHeaderView _updateActionButtonEnabledAnimated:](v3, "_updateActionButtonEnabledAnimated:", 0);
    -[PXActionableSectionHeaderView _updateSecondaryButtonAnimated:](v3, "_updateSecondaryButtonAnimated:", 0);
    -[PXActionableSectionHeaderView _updateFilterButton](v3, "_updateFilterButton");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v3, sel__contentSizeCategoryDidChangeNotification_, *MEMORY[0x1E0DC48E8], 0);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC48E8], 0);

  v4.receiver = self;
  v4.super_class = (Class)PXActionableSectionHeaderView;
  -[PXActionableSectionHeaderView dealloc](&v4, sel_dealloc);
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXActionableSectionHeaderView;
  -[PXActionableSectionHeaderView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[PXActionableSectionHeaderView _updateClipping](self, "_updateClipping");
}

- (void)setBounds:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXActionableSectionHeaderView;
  -[PXActionableSectionHeaderView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[PXActionableSectionHeaderView _updateClipping](self, "_updateClipping");
}

- (id)traitCollection
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  -[PXActionableSectionHeaderView selfSizingTraits](self, "selfSizingTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PXActionableSectionHeaderView;
    -[PXActionableSectionHeaderView traitCollection](&v8, sel_traitCollection);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXActionableSectionHeaderView;
  v4 = a3;
  -[PXActionableSectionHeaderView traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[PXActionableSectionHeaderView _updateWithCurrentTraits](self, "_updateWithCurrentTraits", v8.receiver, v8.super_class);
  v5 = objc_msgSend(v4, "userInterfaceStyle");

  -[PXActionableSectionHeaderView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  if (v5 != v7)
  {
    -[PXActionableSectionHeaderView _updateLabelColors](self, "_updateLabelColors");
    -[PXActionableSectionHeaderView _updateBackdropActionButton](self, "_updateBackdropActionButton");
    -[PXActionableSectionHeaderView _updateFilterButton](self, "_updateFilterButton");
  }
}

- (void)setSelfSizingTraits:(id)a3
{
  UITraitCollection *v5;
  UITraitCollection *v6;

  v5 = (UITraitCollection *)a3;
  if (self->_selfSizingTraits != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_selfSizingTraits, a3);
    -[PXActionableSectionHeaderView _updateWithCurrentTraits](self, "_updateWithCurrentTraits");
    v5 = v6;
  }

}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PXActionableSectionHeaderView;
  -[PXActionableSectionHeaderView applyLayoutAttributes:](&v5, sel_applyLayoutAttributes_, v4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PXActionableSectionHeaderView setWantsBackground:](self, "setWantsBackground:", objc_msgSend(v4, "floating"));

}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFE | objc_opt_respondsToSelector() & 1;
  }

}

- (void)setPrimaryText:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[PXActionableSectionHeaderView primaryLabel](self, "primaryLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[PXActionableSectionHeaderView _updateSpacerLabelHiddenState](self, "_updateSpacerLabelHiddenState");
  -[PXActionableSectionHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (NSString)primaryText
{
  void *v2;
  void *v3;

  -[PXActionableSectionHeaderView primaryLabel](self, "primaryLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setSecondaryText:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[PXActionableSectionHeaderView secondaryLabel](self, "secondaryLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[PXActionableSectionHeaderView _updateSpacerLabelHiddenState](self, "_updateSpacerLabelHiddenState");
  -[PXActionableSectionHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (NSString)secondaryText
{
  void *v2;
  void *v3;

  -[PXActionableSectionHeaderView secondaryLabel](self, "secondaryLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (UIControl)currentActionButton
{
  unint64_t v3;
  void *v4;
  uint64_t v5;

  v3 = -[PXActionableSectionHeaderView buttonStyle](self, "buttonStyle");
  if (v3 - 1 < 2)
  {
    -[PXActionableSectionHeaderView backdropActionButton](self, "backdropActionButton");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (v3 == 3 || !v3)
  {
    -[PXActionableSectionHeaderView systemActionButton](self, "systemActionButton");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v4 = (void *)v5;
  }
  return (UIControl *)v4;
}

- (void)setButtonStyle:(unint64_t)a3
{
  if (self->_buttonStyle != a3)
  {
    self->_buttonStyle = a3;
    -[PXActionableSectionHeaderView _updateActionButtonAnimated:](self, "_updateActionButtonAnimated:", 0);
    -[PXActionableSectionHeaderView _updateActionButtonConfiguration](self, "_updateActionButtonConfiguration");
  }
}

- (void)setFilterButtonControllerFactory:(id)a3
{
  void *v4;
  id filterButtonControllerFactory;

  if (self->_filterButtonControllerFactory != a3)
  {
    v4 = (void *)objc_msgSend(a3, "copy");
    filterButtonControllerFactory = self->_filterButtonControllerFactory;
    self->_filterButtonControllerFactory = v4;

    -[PXActionableSectionHeaderView _updateSecondaryButtonAnimated:](self, "_updateSecondaryButtonAnimated:", 0);
    -[PXActionableSectionHeaderView _updateFilterButton](self, "_updateFilterButton");
  }
}

- (void)setBackdropButtonSpec:(id)a3
{
  PXCuratedLibrarySectionHeaderLayoutSpec *v5;
  PXCuratedLibrarySectionHeaderLayoutSpec *v6;

  v5 = (PXCuratedLibrarySectionHeaderLayoutSpec *)a3;
  if (self->_backdropButtonSpec != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_backdropButtonSpec, a3);
    -[PXActionableSectionHeaderView _updateBackdropActionButton](self, "_updateBackdropActionButton");
    -[PXActionableSectionHeaderView _updateFilterButton](self, "_updateFilterButton");
    v5 = v6;
  }

}

- (void)setShowsActionButton:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_showsActionButton != a3)
  {
    self->_showsActionButton = a3;
    -[PXActionableSectionHeaderView _updateActionButtonAnimated:](self, "_updateActionButtonAnimated:", a4);
  }
}

- (void)setShowsSecondaryButton:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_showsSecondaryButton != a3)
  {
    self->_showsSecondaryButton = a3;
    -[PXActionableSectionHeaderView _updateSecondaryButtonAnimated:](self, "_updateSecondaryButtonAnimated:", a4);
  }
}

- (void)setShowsActionButton:(BOOL)a3
{
  -[PXActionableSectionHeaderView setShowsActionButton:animated:](self, "setShowsActionButton:animated:", a3, 0);
}

- (void)setShowsSecondaryButton:(BOOL)a3
{
  -[PXActionableSectionHeaderView setShowsSecondaryButton:animated:](self, "setShowsSecondaryButton:animated:", a3, 0);
}

- (BOOL)_wantsActionButton
{
  void *v2;
  BOOL v3;

  -[PXActionableSectionHeaderView actionText](self, "actionText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (BOOL)_wantsSecondaryButton
{
  void *v2;
  BOOL v3;

  -[PXActionableSectionHeaderView currentSecondaryButton](self, "currentSecondaryButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)setActionButtonEnabled:(BOOL)a3
{
  -[PXActionableSectionHeaderView setActionButtonEnabled:animated:](self, "setActionButtonEnabled:animated:", a3, 0);
}

- (void)setActionButtonEnabled:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_actionButtonEnabled != a3)
  {
    self->_actionButtonEnabled = a3;
    -[PXActionableSectionHeaderView _updateActionButtonEnabledAnimated:](self, "_updateActionButtonEnabledAnimated:", a4);
  }
}

- (void)_updateActionButtonEnabledAnimated:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  _BOOL8 v6;
  void *v7;
  double v8;
  id v9;
  _QWORD v10[5];

  v3 = a3;
  v5 = -[PXActionableSectionHeaderView buttonStyle](self, "buttonStyle");
  if (v5 - 1 < 2)
  {
    -[PXActionableSectionHeaderView _updateBackdropActionButton](self, "_updateBackdropActionButton");
    -[PXActionableSectionHeaderView _updateFilterButton](self, "_updateFilterButton");
  }
  else if (v5 == 3 || !v5)
  {
    v6 = -[PXActionableSectionHeaderView actionButtonEnabled](self, "actionButtonEnabled");
    -[PXActionableSectionHeaderView systemActionButton](self, "systemActionButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEnabled:", v6);

    if (v3)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __68__PXActionableSectionHeaderView__updateActionButtonEnabledAnimated___block_invoke;
      v10[3] = &unk_1E5149198;
      v10[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v10, 0.2);
    }
    else
    {
      if (-[PXActionableSectionHeaderView actionButtonEnabled](self, "actionButtonEnabled"))
        v8 = 1.0;
      else
        v8 = 0.6;
      -[PXActionableSectionHeaderView systemActionButton](self, "systemActionButton");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAlpha:", v8);

    }
  }
}

- (void)setActionText:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *actionText;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_actionText;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v4, "isEqualToString:", v8);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      actionText = self->_actionText;
      self->_actionText = v6;

      -[PXActionableSectionHeaderView _updateActionButtonAnimated:](self, "_updateActionButtonAnimated:", 0);
      -[PXActionableSectionHeaderView _updateActionButtonConfiguration](self, "_updateActionButtonConfiguration");
    }
  }

}

- (void)setShowsTopSeparator:(BOOL)a3
{
  if (self->_showsTopSeparator != a3)
  {
    self->_showsTopSeparator = a3;
    -[PXActionableSectionHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateActionButtonAnimated:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  id *p_backdropActionButton;
  int *v7;
  uint64_t v8;
  id v9;
  PXCuratedLibraryOverlayButton *v10;
  id v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  double v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  BOOL v19;

  v3 = a3;
  v5 = -[PXActionableSectionHeaderView buttonStyle](self, "buttonStyle");
  if (v5 - 1 < 2)
  {
    p_backdropActionButton = (id *)&self->_backdropActionButton;
    if (self->_backdropActionButton)
    {
      v7 = &OBJC_IVAR___PXActionableSectionHeaderView__systemActionButton;
      goto LABEL_11;
    }
    v10 = objc_alloc_init(PXCuratedLibraryOverlayButton);
    v11 = *p_backdropActionButton;
    *p_backdropActionButton = v10;

    v7 = &OBJC_IVAR___PXActionableSectionHeaderView__systemActionButton;
LABEL_10:
    objc_msgSend(*p_backdropActionButton, "addTarget:action:forControlEvents:", self, sel__actionButtonPressed_, 64);
    -[PXActionableSectionHeaderView addSubview:](self, "addSubview:", *p_backdropActionButton);
    goto LABEL_11;
  }
  if (v5 == 3 || !v5)
  {
    p_backdropActionButton = (id *)&self->_systemActionButton;
    if (self->_systemActionButton)
    {
      v7 = &OBJC_IVAR___PXActionableSectionHeaderView__backdropActionButton;
LABEL_11:
      v12 = *v7;
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v12), "removeFromSuperview");
      v13 = *(Class *)((char *)&self->super.super.super.super.isa + v12);
      *(Class *)((char *)&self->super.super.super.super.isa + v12) = 0;

      goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *p_backdropActionButton;
    *p_backdropActionButton = (id)v8;

    objc_msgSend(*p_backdropActionButton, "setContentVerticalAlignment:", 0);
    v7 = &OBJC_IVAR___PXActionableSectionHeaderView__backdropActionButton;
    goto LABEL_10;
  }
LABEL_12:
  v14 = -[PXActionableSectionHeaderView showsActionButton](self, "showsActionButton");
  if (v3)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __61__PXActionableSectionHeaderView__updateActionButtonAnimated___block_invoke;
    v18[3] = &unk_1E5144398;
    v18[4] = self;
    v19 = v14;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 196608, v18, 0, 0.3, 0.0);
  }
  else
  {
    if (v14)
      v15 = 1.0;
    else
      v15 = 0.0;
    -[PXActionableSectionHeaderView systemActionButton](self, "systemActionButton");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAlpha:", v15);

    -[PXActionableSectionHeaderView backdropActionButton](self, "backdropActionButton");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAlpha:", v15);

  }
  -[PXActionableSectionHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateSecondaryButtonAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  UIButton *currentSecondaryButton;
  PXPhotosFilterToggleButtonController *v7;
  PXPhotosFilterToggleButtonController *filterButtonController;
  UIButton *v9;
  UIButton *v10;
  UIButton *v11;
  PXPhotosFilterToggleButtonController *v12;
  double v13;
  void *v14;
  _QWORD v15[5];

  v3 = a3;
  -[PXActionableSectionHeaderView filterButtonControllerFactory](self, "filterButtonControllerFactory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  currentSecondaryButton = self->_currentSecondaryButton;
  if (v5)
  {
    if (!currentSecondaryButton)
    {
      (*((void (**)(void))self->_filterButtonControllerFactory + 2))();
      v7 = (PXPhotosFilterToggleButtonController *)objc_claimAutoreleasedReturnValue();
      filterButtonController = self->_filterButtonController;
      self->_filterButtonController = v7;

      -[PXContentFilterToggleButtonController button](self->_filterButtonController, "button");
      v9 = (UIButton *)objc_claimAutoreleasedReturnValue();
      v10 = self->_currentSecondaryButton;
      self->_currentSecondaryButton = v9;

      -[PXActionableSectionHeaderView addSubview:](self, "addSubview:", self->_currentSecondaryButton);
    }
    if (v3)
      goto LABEL_5;
  }
  else
  {
    -[UIButton removeFromSuperview](currentSecondaryButton, "removeFromSuperview");
    v11 = self->_currentSecondaryButton;
    self->_currentSecondaryButton = 0;

    v12 = self->_filterButtonController;
    self->_filterButtonController = 0;

    if (v3)
    {
LABEL_5:
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __64__PXActionableSectionHeaderView__updateSecondaryButtonAnimated___block_invoke;
      v15[3] = &unk_1E5149198;
      v15[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 196608, v15, 0, 0.3, 0.0);
      goto LABEL_11;
    }
  }
  if (-[PXActionableSectionHeaderView showsSecondaryButton](self, "showsSecondaryButton"))
    v13 = 1.0;
  else
    v13 = 0.0;
  -[PXActionableSectionHeaderView currentSecondaryButton](self, "currentSecondaryButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAlpha:", v13);

LABEL_11:
  -[PXActionableSectionHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateActionButtonConfiguration
{
  unint64_t v3;

  v3 = -[PXActionableSectionHeaderView buttonStyle](self, "buttonStyle");
  if (v3 - 1 < 2)
  {
    -[PXActionableSectionHeaderView _updateBackdropActionButton](self, "_updateBackdropActionButton");
    -[PXActionableSectionHeaderView _updateFilterButton](self, "_updateFilterButton");
  }
  else if (v3 == 3 || !v3)
  {
    -[PXActionableSectionHeaderView _updateSystemActionButton](self, "_updateSystemActionButton");
  }
}

- (void)_updateBackdropActionButton
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  int64_t v13;
  int v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  -[PXActionableSectionHeaderView actionText](self, "actionText");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[PXActionableSectionHeaderView backdropButtonSpec](self, "backdropButtonSpec");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[PXActionableSectionHeaderView actionText](self, "actionText");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXActionableSectionHeaderView backdropButtonSpec](self, "backdropButtonSpec");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXCuratedLibraryOverlayButtonConfiguration configurationWithTitle:spec:](PXCuratedLibraryOverlayButtonConfiguration, "configurationWithTitle:spec:", v6, v7);
      v20 = (id)objc_claimAutoreleasedReturnValue();

      if (-[PXActionableSectionHeaderView actionButtonEnabled](self, "actionButtonEnabled"))
        v8 = &__block_literal_global_213930;
      else
        v8 = 0;
      objc_msgSend(v20, "setActionHandler:", v8);
      if (-[PXActionableSectionHeaderView actionButtonEnabled](self, "actionButtonEnabled"))
      {
        v9 = -[PXActionableSectionHeaderView buttonStyle](self, "buttonStyle");
        v10 = -[PXActionableSectionHeaderView _wantsOverBackgroundBehavior](self, "_wantsOverBackgroundBehavior");
        -[PXActionableSectionHeaderView traitCollection](self, "traitCollection");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "userInterfaceStyle") == 2)
        {

LABEL_15:
          v15 = -[PXActionableSectionHeaderView backgroundStyle](self, "backgroundStyle");
          if (v9 == 2)
            v16 = 15;
          else
            v16 = 0;
          if (v15 == 1)
            v12 = v16;
          else
            v12 = 15;
          goto LABEL_22;
        }
        v13 = -[PXActionableSectionHeaderView preferredUserInterfaceStyle](self, "preferredUserInterfaceStyle");

        v14 = v13 == 2 || v10;
        if (v14 == 1)
          goto LABEL_15;
        v12 = 15;
      }
      else
      {
        v12 = 8;
      }
LABEL_22:
      objc_msgSend(v20, "setStyle:", v12);
      -[PXActionableSectionHeaderView _backdropButtonForegroundColor](self, "_backdropButtonForegroundColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setTintColor:", v17);

      -[PXActionableSectionHeaderView _backdropButtonBackgroundColor](self, "_backdropButtonBackgroundColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setBackgroundColor:", v18);

      -[PXActionableSectionHeaderView backdropActionButton](self, "backdropActionButton");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setUserData:", v20);

    }
  }
}

- (void)_updateSystemActionButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  MEMORY[0x1A85CC970](8, 0x8000, 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *MEMORY[0x1E0DC1138];
  v20[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PXActionableSectionHeaderView buttonStyle](self, "buttonStyle") == 3)
  {
    v5 = (void *)MEMORY[0x1E0DC3888];
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 20.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "configurationWithFont:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("checkmark.circle"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    v10 = 0;
    v11 = 0;
  }
  else
  {
    -[PXActionableSectionHeaderView actionText](self, "actionText");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    v14 = &stru_1E5149688;
    if (v12)
      v14 = (__CFString *)v12;
    v11 = v14;

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v11, v4);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0DC1140]);

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v11, v7);
    v8 = 0;
  }

  -[PXActionableSectionHeaderView systemActionButton](self, "systemActionButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setImage:forState:", v8, 0);
  objc_msgSend(v16, "setImage:forState:", v8, 2);
  objc_msgSend(v16, "setAttributedTitle:forState:", v10, 0);
  objc_msgSend(v16, "setAttributedTitle:forState:", v9, 2);
  objc_msgSend(v16, "titleLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeAllAnimations");

  objc_msgSend(v16, "sizeToFit");
  objc_msgSend(v16, "layoutIfNeeded");
  -[PXActionableSectionHeaderView setNeedsLayout](self, "setNeedsLayout");

}

- (void)_updateFilterButton
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PXActionableSectionHeaderView _backdropButtonForegroundColor](self, "_backdropButtonForegroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionableSectionHeaderView filterButtonController](self, "filterButtonController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setForegroundColor:", v3);

  -[PXActionableSectionHeaderView _backdropButtonBackgroundColor](self, "_backdropButtonBackgroundColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PXActionableSectionHeaderView filterButtonController](self, "filterButtonController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

}

- (void)setBackgroundStyle:(unint64_t)a3
{
  if (self->_backgroundStyle != a3)
  {
    self->_backgroundStyle = a3;
    -[PXActionableSectionHeaderView _updateBackgroundAnimated:](self, "_updateBackgroundAnimated:", 0);
    -[PXActionableSectionHeaderView _updateLabelColors](self, "_updateLabelColors");
    -[PXActionableSectionHeaderView _updateBackdropActionButton](self, "_updateBackdropActionButton");
    -[PXActionableSectionHeaderView _updateFilterButton](self, "_updateFilterButton");
  }
}

- (void)setWantsBackground:(BOOL)a3
{
  -[PXActionableSectionHeaderView setWantsBackground:animated:](self, "setWantsBackground:animated:", a3, 0);
}

- (void)setWantsBackground:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_wantsBackground != a3)
  {
    self->_wantsBackground = a3;
    if (self->_isModifyingGroupedBackgroundProperties)
    {
      self->_wantsGroupedBackgroundPropertiesUpdate = 1;
    }
    else
    {
      -[PXActionableSectionHeaderView _updateBackgroundAnimated:](self, "_updateBackgroundAnimated:", a4);
      -[PXActionableSectionHeaderView _updateLabelColors](self, "_updateLabelColors");
      -[PXActionableSectionHeaderView _updateBackdropActionButton](self, "_updateBackdropActionButton");
      -[PXActionableSectionHeaderView _updateFilterButton](self, "_updateFilterButton");
    }
  }
}

- (void)setSpeedRegime:(int64_t)a3
{
  if (self->_speedRegime != a3)
  {
    self->_speedRegime = a3;
    if (self->_isModifyingGroupedBackgroundProperties)
    {
      self->_wantsGroupedBackgroundPropertiesUpdate = 1;
    }
    else
    {
      -[PXActionableSectionHeaderView _updateBackgroundAnimated:](self, "_updateBackgroundAnimated:", 0);
      -[PXActionableSectionHeaderView _updateBackdropActionButton](self, "_updateBackdropActionButton");
      -[PXActionableSectionHeaderView _updateFilterButton](self, "_updateFilterButton");
    }
  }
}

- (void)setAvoidsTintedButtonsAtHighSpeed:(BOOL)a3
{
  if (self->_avoidsTintedButtonsAtHighSpeed != a3)
  {
    self->_avoidsTintedButtonsAtHighSpeed = a3;
    -[PXActionableSectionHeaderView _updateBackdropActionButton](self, "_updateBackdropActionButton");
    -[PXActionableSectionHeaderView _updateFilterButton](self, "_updateFilterButton");
  }
}

- (BOOL)_isMovingFast
{
  return -[PXActionableSectionHeaderView speedRegime](self, "speedRegime") > 1;
}

- (BOOL)_wantsOverBackgroundBehavior
{
  if (-[PXActionableSectionHeaderView _isMovingFast](self, "_isMovingFast"))
    return -[PXActionableSectionHeaderView avoidsTintedButtonsAtHighSpeed](self, "avoidsTintedButtonsAtHighSpeed");
  else
    return -[PXActionableSectionHeaderView wantsBackground](self, "wantsBackground");
}

- (id)_backdropButtonForegroundColor
{
  unint64_t v3;
  _BOOL4 v4;
  void *v5;
  int64_t v6;
  int v7;
  unint64_t v8;
  void *v10;

  if (-[PXActionableSectionHeaderView backgroundStyle](self, "backgroundStyle") == 3)
  {
    if (-[PXActionableSectionHeaderView wantsBackground](self, "wantsBackground"))
      goto LABEL_16;
    goto LABEL_15;
  }
  v3 = -[PXActionableSectionHeaderView buttonStyle](self, "buttonStyle");
  v4 = -[PXActionableSectionHeaderView _wantsOverBackgroundBehavior](self, "_wantsOverBackgroundBehavior");
  -[PXActionableSectionHeaderView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "userInterfaceStyle") == 2)
  {

  }
  else
  {
    v6 = -[PXActionableSectionHeaderView preferredUserInterfaceStyle](self, "preferredUserInterfaceStyle");

    v7 = v6 == 2 || v4;
    if (v7 != 1)
      goto LABEL_14;
  }
  v8 = -[PXActionableSectionHeaderView backgroundStyle](self, "backgroundStyle");
  if (v3 != 2 && v8 == 1)
    goto LABEL_16;
LABEL_14:
  if (v3 == 2)
  {
LABEL_16:
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    return v10;
  }
LABEL_15:
  -[PXActionableSectionHeaderView tintColor](self, "tintColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  return v10;
}

- (id)_backdropButtonBackgroundColor
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  uint64_t v7;
  void *v8;

  if (-[PXActionableSectionHeaderView backgroundStyle](self, "backgroundStyle") != 3)
  {
    if (-[PXActionableSectionHeaderView actionButtonEnabled](self, "actionButtonEnabled")
      && -[PXActionableSectionHeaderView buttonStyle](self, "buttonStyle") == 2)
    {
      -[PXActionableSectionHeaderView tintColor](self, "tintColor");
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v8 = (void *)v7;
      return v8;
    }
LABEL_8:
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemFillColor");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (!-[PXActionableSectionHeaderView wantsBackground](self, "wantsBackground"))
    goto LABEL_8;
  -[PXActionableSectionHeaderView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "userInterfaceStyle") == 2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGray5Color");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = 0.95;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGray2Color");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = 0.98;
  }
  objc_msgSend(v4, "colorWithAlphaComponent:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)performChangesToGroupedBackgroundPropertiesAnimated:(BOOL)a3 withBlock:(id)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  id v9;

  v4 = a3;
  v7 = a4;
  v9 = v7;
  if (self->_isModifyingGroupedBackgroundProperties)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActionableSectionHeaderView.m"), 570, CFSTR("Modifying grouped background properties recursively not allowed"));

    v7 = v9;
  }
  self->_isModifyingGroupedBackgroundProperties = 1;
  self->_wantsGroupedBackgroundPropertiesUpdate = 0;
  (*((void (**)(void))v7 + 2))();
  self->_isModifyingGroupedBackgroundProperties = 0;
  if (self->_wantsGroupedBackgroundPropertiesUpdate)
  {
    -[PXActionableSectionHeaderView _updateBackgroundAnimated:](self, "_updateBackgroundAnimated:", v4);
    -[PXActionableSectionHeaderView _updateLabelColors](self, "_updateLabelColors");
    -[PXActionableSectionHeaderView _updateBackdropActionButton](self, "_updateBackdropActionButton");
    -[PXActionableSectionHeaderView _updateFilterButton](self, "_updateFilterButton");
  }

}

- (void)setBackgroundImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_backgroundImage != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_backgroundImage, a3);
    -[PXActionableSectionHeaderView _updateBackgroundAnimated:](self, "_updateBackgroundAnimated:", 0);
    v5 = v6;
  }

}

- (void)setBackgroundImageAlpha:(double)a3
{
  void *v7;

  if (self->_backgroundImageAlpha != a3)
  {
    if (a3 < 0.0 || a3 > 1.0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActionableSectionHeaderView.m"), 595, CFSTR("Invalid alpha %lf"), *(_QWORD *)&a3);

    }
    self->_backgroundImageAlpha = a3;
    -[PXActionableSectionHeaderView _updateBackgroundAnimated:](self, "_updateBackgroundAnimated:", 0);
  }
}

- (void)setBackgroundImageOverhang:(double)a3
{
  if (self->_backgroundImageOverhang != a3)
  {
    self->_backgroundImageOverhang = a3;
    -[PXActionableSectionHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setBackdropViewGroupName:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *backdropViewGroupName;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_backdropViewGroupName;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v4, "isEqualToString:", v8);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      backdropViewGroupName = self->_backdropViewGroupName;
      self->_backdropViewGroupName = v6;

      -[PXActionableSectionHeaderView _updateBackdropViewGroupName](self, "_updateBackdropViewGroupName");
    }
  }

}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  if (self->_contentInsets.left != a3.left
    || self->_contentInsets.top != a3.top
    || self->_contentInsets.right != a3.right
    || self->_contentInsets.bottom != a3.bottom)
  {
    self->_contentInsets = a3;
    -[PXActionableSectionHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setSupportsMultipleLinesInCompactLayout:(BOOL)a3
{
  if (self->_supportsMultipleLinesInCompactLayout != a3)
  {
    self->_supportsMultipleLinesInCompactLayout = a3;
    -[PXActionableSectionHeaderView _updateLabelLineNumbers](self, "_updateLabelLineNumbers");
  }
}

- (void)setPreferredUserInterfaceStyle:(int64_t)a3
{
  if (self->_preferredUserInterfaceStyle != a3)
  {
    self->_preferredUserInterfaceStyle = a3;
    -[PXActionableSectionHeaderView _updateBackgroundAnimated:](self, "_updateBackgroundAnimated:", 0);
    -[PXActionableSectionHeaderView _updateLabelColors](self, "_updateLabelColors");
    -[PXActionableSectionHeaderView _updateBackdropActionButton](self, "_updateBackdropActionButton");
    -[PXActionableSectionHeaderView _updateFilterButton](self, "_updateFilterButton");
  }
}

- (double)baselineToBottomSpacing
{
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;

  if (-[PXActionableSectionHeaderView layoutMode](self, "layoutMode") == 1
    && (-[PXActionableSectionHeaderView secondaryText](self, "secondaryText"),
        (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = (void *)v3;
    -[UILabel font](self->_secondaryLabel, "font");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "descender");
    v7 = v6;

  }
  else
  {
    -[UILabel font](self->_primaryLabel, "font");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "descender");
    v7 = v8;
  }

  return 8.0 - v7;
}

- (double)heightForSizeClass:(int64_t)a3 width:(double)a4 safeAreaInsets:(UIEdgeInsets)a5
{
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  NSString *v13;
  _BOOL4 IsAccessibilityCategory;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  _BOOL4 v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  double v58;
  void *v59;
  double v60;
  double v61;
  void *v62;
  double v63;
  double v64;
  void *v65;
  double v66;
  double v67;

  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithHorizontalSizeClass:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionableSectionHeaderView setSelfSizingTraits:](self, "setSelfSizingTraits:", v8);

  -[PXActionableSectionHeaderView contentInsets](self, "contentInsets");
  UIEdgeInsetsMax();
  v9 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v12 = a4 - v10 - v11;
  if (-[PXActionableSectionHeaderView layoutModeForHorizontalSizeClass:](self, "layoutModeForHorizontalSizeClass:", a3) == 1)
  {
    if (-[PXActionableSectionHeaderView _wantsActionButton](self, "_wantsActionButton")
      || -[PXActionableSectionHeaderView _wantsSecondaryButton](self, "_wantsSecondaryButton"))
    {
      objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
      v13 = (NSString *)objc_claimAutoreleasedReturnValue();
      IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v13);

      if (IsAccessibilityCategory)
      {
        -[PXActionableSectionHeaderView primaryLabel](self, "primaryLabel");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "sizeThatFits:", v12, v9);
        v17 = v16;

        -[PXActionableSectionHeaderView currentActionButton](self, "currentActionButton");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "sizeThatFits:", v12, v9);
        v20 = v19;

        -[PXActionableSectionHeaderView currentSecondaryButton](self, "currentSecondaryButton");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "sizeThatFits:", v12, v9);
        v23 = v22;

        -[PXActionableSectionHeaderView secondaryLabel](self, "secondaryLabel");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "sizeThatFits:", v12, v9);
        v26 = v25;

        if (-[PXActionableSectionHeaderView _wantsActionButton](self, "_wantsActionButton"))
          v27 = 8.0;
        else
          v27 = 0.0;
        v28 = -[PXActionableSectionHeaderView _wantsSecondaryButton](self, "_wantsSecondaryButton");
        v29 = v27 + 8.0;
        if (!v28)
          v29 = v27;
        v30 = v17 + v20 + v23 + v26 + v29;
      }
      else
      {
        -[PXActionableSectionHeaderView currentActionButton](self, "currentActionButton");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "sizeThatFits:", v12, v9);
        v47 = v46;
        v49 = v48;

        -[PXActionableSectionHeaderView currentSecondaryButton](self, "currentSecondaryButton");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "sizeThatFits:", v12, v9);
        v52 = v51;
        v54 = v53;

        v55 = v12 - (v47 + v52);
        -[PXActionableSectionHeaderView primaryLabel](self, "primaryLabel");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "sizeThatFits:", v55, v9);
        v58 = v57;

        -[PXActionableSectionHeaderView secondaryLabel](self, "secondaryLabel");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "sizeThatFits:", v55, v9);
        v61 = v60;

        if (v61 <= 0.0)
          v30 = fmax(fmax(v58, v49), v54);
        else
          v30 = v58 + v61;
      }
    }
    else
    {
      -[PXActionableSectionHeaderView primaryLabel](self, "primaryLabel");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "sizeThatFits:", v12, v9);
      v64 = v63;

      -[PXActionableSectionHeaderView secondaryLabel](self, "secondaryLabel");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "sizeThatFits:", v12, v9);
      v67 = v66;

      v30 = v64 + v67;
    }
  }
  else
  {
    -[PXActionableSectionHeaderView primaryLabel](self, "primaryLabel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "sizeThatFits:", v12, v9);
    v33 = v32;

    -[PXActionableSectionHeaderView secondaryLabel](self, "secondaryLabel");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "sizeThatFits:", v12, v9);
    v36 = v35;

    -[PXActionableSectionHeaderView currentActionButton](self, "currentActionButton");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "sizeThatFits:", v12, v9);
    v39 = v38;

    -[PXActionableSectionHeaderView currentSecondaryButton](self, "currentSecondaryButton");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "sizeThatFits:", v12, v9);
    v42 = v41;

    v30 = fmax(v33, fmax(v36, fmax(v39, v42)));
  }
  v43 = v30 + 16.0;
  -[PXActionableSectionHeaderView setSelfSizingTraits:](self, "setSelfSizingTraits:", 0);
  return round(v43);
}

- (void)layoutSubviews
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
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
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
  _BOOL4 v32;
  _BOOL4 v33;
  int64_t v34;
  int v35;
  NSString *v36;
  _BOOL4 IsAccessibilityCategory;
  double v38;
  void *v39;
  double v40;
  CGFloat v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  CGFloat v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  CGFloat v57;
  void *v58;
  void *v59;
  double v60;
  CGFloat v61;
  double v62;
  double v63;
  CGFloat v64;
  double v65;
  CGFloat v66;
  double MaxX;
  void *v68;
  void *v69;
  double v70;
  double v71;
  CGFloat v72;
  double v73;
  CGFloat v74;
  double v75;
  CGFloat v76;
  double v77;
  double v78;
  CGFloat v79;
  CGFloat v80;
  CGFloat v81;
  double v82;
  CGFloat v83;
  CGFloat v84;
  CGFloat v85;
  void *v86;
  double v87;
  CGFloat v88;
  void *v89;
  double v90;
  CGFloat v91;
  CGFloat v92;
  CGFloat v93;
  CGFloat v94;
  CGFloat v95;
  CGFloat v96;
  CGFloat v97;
  CGFloat v98;
  double v99;
  void *v100;
  void *v101;
  double v102;
  double v103;
  CGFloat v104;
  double v105;
  CGFloat v106;
  double v107;
  double v108;
  void *v109;
  void *v110;
  double v111;
  double v112;
  CGFloat v113;
  double v114;
  CGFloat v115;
  double v116;
  CGFloat v117;
  double v118;
  double v119;
  double v120;
  CGFloat v121;
  CGFloat v122;
  CGFloat v123;
  CGFloat v124;
  CGFloat v125;
  CGFloat v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  double v131;
  double v132;
  double v133;
  void *v134;
  double v135;
  double v136;
  double v137;
  void *v138;
  double v139;
  CGFloat v140;
  CGFloat v141;
  double v142;
  double v143;
  double v144;
  void *v145;
  double Width;
  void *v147;
  double v148;
  void *v149;
  double v150;
  double v151;
  double v152;
  double v153;
  double v154;
  CGFloat v155;
  CGFloat v156;
  double v157;
  CGFloat v158;
  double v159;
  CGFloat v160;
  double v161;
  double y;
  double v163;
  double height;
  double v165;
  double v166;
  double v167;
  double v168;
  CGFloat v169;
  CGFloat v170;
  CGFloat v171;
  CGFloat v172;
  CGFloat v173;
  CGFloat v174;
  CGFloat v175;
  CGFloat v176;
  CGFloat v177;
  double v178;
  double v179;
  double v180;
  double v181;
  double v182;
  double v183;
  double v184;
  double v185;
  double v186;
  double v187;
  double v188;
  double v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  double v197;
  double v198;
  double v199;
  double v200;
  CGFloat v201;
  void *v202;
  void *v203;
  double v204;
  double v205;
  double v206;
  double v207;
  double v208;
  double v209;
  double v210;
  void *v211;
  double v212;
  CGFloat v213;
  void *v214;
  double v215;
  double v216;
  CGFloat v217;
  double v218;
  void *v219;
  double v220;
  CGFloat v221;
  double v222;
  double v223;
  double v224;
  double v225;
  double v226;
  double v227;
  double v228;
  double v229;
  double v230;
  CGFloat v231;
  CGFloat v232;
  CGFloat v233;
  double v234;
  CGFloat v235;
  CGFloat rect;
  CGFloat rect_8;
  double rect_8a;
  double rect_16;
  double rect_24;
  double x;
  double v242;
  CGRect v243;
  double v244;
  double v245;
  CGFloat v246;
  double v247;
  CGRect v248;
  CGFloat v249;
  double v250;
  double v251;
  CGFloat v252;
  double v253;
  double v254;
  double v255;
  double v256;
  double MinX;
  double v258;
  CGRect v259;
  CGFloat MaxY;
  CGFloat v261;
  CGFloat v262;
  double v263;
  double v264;
  double v265;
  double v266;
  double v267;
  CGFloat v268;
  CGFloat v269;
  double v270;
  objc_super v271;
  CGRect v272;
  CGRect v273;
  CGRect v274;
  CGRect v275;
  CGRect v276;
  CGRect v277;
  CGRect v278;
  CGRect v279;
  CGRect v280;
  CGRect v281;
  CGRect v282;
  CGRect v283;
  CGRect v284;
  CGRect v285;
  CGRect v286;
  CGRect v287;
  CGRect v288;
  CGRect v289;
  CGRect v290;
  CGRect v291;
  CGRect v292;
  CGRect v293;
  CGRect v294;
  CGRect v295;
  CGRect v296;
  CGRect v297;
  CGRect v298;
  CGRect v299;
  CGRect v300;
  CGRect v301;
  CGRect v302;
  CGRect v303;
  CGRect v304;

  v271.receiver = self;
  v271.super_class = (Class)PXActionableSectionHeaderView;
  -[PXActionableSectionHeaderView layoutSubviews](&v271, sel_layoutSubviews);
  -[PXActionableSectionHeaderView contentInsets](self, "contentInsets");
  -[PXActionableSectionHeaderView safeAreaInsets](self, "safeAreaInsets");
  UIEdgeInsetsMax();
  -[PXActionableSectionHeaderView layoutMargins](self, "layoutMargins");
  UIEdgeInsetsMax();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PXActionableSectionHeaderView bounds](self, "bounds");
  v12 = v6 + v11;
  v14 = v4 + v13;
  v16 = v15 - (v6 + v10);
  v18 = v17 - (v4 + v8);
  v19 = *MEMORY[0x1E0C9D648];
  v20 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v264 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v267 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  -[PXActionableSectionHeaderView bounds](self, "bounds");
  v226 = v22;
  v227 = v21;
  v224 = v24;
  v225 = v23;
  -[PXActionableSectionHeaderView bounds](self, "bounds");
  v26 = v25;
  v28 = v27;
  v228 = v29;
  v223 = v30;
  -[PXActionableSectionHeaderView backgroundImageOverhang](self, "backgroundImageOverhang");
  v222 = v31;
  v32 = -[PXActionableSectionHeaderView _wantsActionButton](self, "_wantsActionButton");
  v33 = -[PXActionableSectionHeaderView _wantsSecondaryButton](self, "_wantsSecondaryButton");
  v34 = -[PXActionableSectionHeaderView layoutMode](self, "layoutMode");
  v35 = v32 || v33;
  rect_16 = v12;
  v270 = v14;
  v234 = v16;
  rect_24 = v18;
  v229 = v28;
  v230 = v26;
  if (v34 != 1)
  {
    v56 = v16;
    if (v35)
    {
      v235 = v20;
      rect_8 = v267;
      v57 = v264;
      x = v19;
      if (v32)
      {
        -[PXActionableSectionHeaderView currentActionButton](self, "currentActionButton");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "sizeToFit");

        -[PXActionableSectionHeaderView currentActionButton](self, "currentActionButton");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "frame");
        v251 = v20;

        UIRectCenteredYInRect();
        v61 = v60;
        v57 = v62;
        v64 = v63;
        v66 = v65;
        v275.origin.x = v12;
        v275.origin.y = v270;
        v275.size.width = v16;
        v275.size.height = v18;
        MaxX = CGRectGetMaxX(v275);
        v276.origin.x = v61;
        v20 = v251;
        v276.origin.y = v57;
        v276.size.width = v64;
        v276.size.height = v66;
        v277.origin.x = MaxX - CGRectGetWidth(v276);
        v18 = rect_24;
        x = v277.origin.x;
        v277.origin.y = v57;
        rect_8 = v64;
        v277.size.width = v64;
        v235 = v66;
        v277.size.height = v66;
        v56 = v16 - CGRectGetWidth(v277);
      }
      v233 = v57;
      if (v33)
      {
        -[PXActionableSectionHeaderView currentSecondaryButton](self, "currentSecondaryButton");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "sizeToFit");

        -[PXActionableSectionHeaderView currentSecondaryButton](self, "currentSecondaryButton");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "frame");

        UIRectCenteredYInRect();
        v268 = v70;
        v72 = v71;
        v74 = v73;
        v76 = v75;
        v278.origin.x = v12;
        v278.origin.y = v270;
        v278.size.width = v234;
        v278.size.height = v18;
        v77 = CGRectGetMaxX(v278);
        v279.origin.x = v268;
        v279.origin.y = v72;
        v279.size.width = v74;
        v279.size.height = v76;
        v78 = v77 - CGRectGetWidth(v279);
        rect = v78;
        if (v32)
        {
          v79 = v72;
          v80 = v74;
          v81 = v76;
          v82 = x - (CGRectGetWidth(*(CGRect *)&v78) + 8.0);
          v78 = rect;
          x = v82;
        }
        v18 = rect_24;
        v231 = v72;
        v232 = v74;
        v83 = v72;
        v84 = v74;
        v221 = v76;
        v85 = v76;
        v56 = v56 - (CGRectGetWidth(*(CGRect *)&v78) + 8.0);
      }
      else
      {
        v221 = v20;
        v232 = v267;
        v231 = v264;
        rect = v19;
      }
    }
    else
    {
      v221 = v20;
      v232 = v267;
      v231 = v264;
      v235 = v20;
      rect = v19;
      rect_8 = v267;
      v233 = v264;
      x = v19;
    }
    -[PXActionableSectionHeaderView primaryLabel](self, "primaryLabel");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "sizeToFit");

    -[PXActionableSectionHeaderView spacerLabel](self, "spacerLabel");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "sizeToFit");

    -[PXActionableSectionHeaderView secondaryLabel](self, "secondaryLabel");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "sizeToFit");

    -[PXActionableSectionHeaderView primaryLabel](self, "primaryLabel");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "frame");
    UIRectCenteredYInRect();
    v249 = v131;
    v255 = v133;
    v258 = v132;

    -[PXActionableSectionHeaderView spacerLabel](self, "spacerLabel");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "frame");
    UIRectCenteredYInRect();
    v265 = v135;
    v269 = v136;
    v252 = v137;

    -[PXActionableSectionHeaderView secondaryLabel](self, "secondaryLabel");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "frame");
    UIRectCenteredYInRect();
    MaxY = v139;
    v140 = v18;
    v141 = v12;
    v143 = v142;
    v245 = v144;

    -[PXActionableSectionHeaderView primaryLabel](self, "primaryLabel");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "frame");
    Width = CGRectGetWidth(v286);

    -[PXActionableSectionHeaderView spacerLabel](self, "spacerLabel");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "frame");
    v148 = CGRectGetWidth(v287) + 16.0;

    -[PXActionableSectionHeaderView secondaryLabel](self, "secondaryLabel");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v149, "frame");
    v150 = CGRectGetWidth(v288);

    v289.origin.x = v141;
    v289.origin.y = v270;
    v289.size.width = v56;
    v289.size.height = v140;
    v151 = CGRectGetWidth(v289) - v148;
    v152 = v151 * 0.75;
    v153 = v151 - v151 * 0.75;
    if (Width >= v151 * 0.75 || v150 >= v153)
    {
      if (Width >= v152 || v150 < v153)
      {
        v247 = v151 - v151 * 0.75;
        v154 = v151 * 0.75;
        if (Width >= v152)
        {
          v155 = v265;
          v97 = v255;
          if (v150 < v247)
          {
            v154 = v151 - v150 - v148;
            v247 = v143;
          }
          goto LABEL_31;
        }
LABEL_30:
        v155 = v265;
        v97 = v255;
LABEL_31:
        v266 = v154;
        v290.origin.x = rect_16;
        v290.size.height = rect_24;
        v290.origin.y = v270;
        v290.size.width = v56;
        v291.origin.x = CGRectGetMinX(v290);
        v156 = v291.origin.x;
        v291.origin.y = v249;
        v291.size.width = v154;
        v291.size.height = v97;
        v19 = CGRectGetMaxX(v291) + 8.0;
        v292.origin.x = v19;
        v292.origin.y = v155;
        v157 = v155;
        v94 = v269;
        v292.size.width = v269;
        v20 = v252;
        v292.size.height = v252;
        v158 = CGRectGetMaxX(v292);
        v93 = v249;
        MinX = v158 + 8.0;
        v92 = v156;
        v96 = v157;
        v91 = v245;
        v16 = v266;
LABEL_32:
        v95 = v247;
        goto LABEL_33;
      }
      v247 = v151 - Width - v148;
    }
    else
    {
      v247 = v143;
    }
    v154 = v258;
    goto LABEL_30;
  }
  if (!v35)
  {
    -[PXActionableSectionHeaderView primaryLabel](self, "primaryLabel");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "sizeThatFits:", v16, v18);
    v88 = v87;
    v254 = v87;

    v280.origin.x = v12;
    v280.origin.y = v14;
    v280.size.width = v16;
    v280.size.height = v88;
    MaxY = CGRectGetMaxY(v280);
    -[PXActionableSectionHeaderView secondaryLabel](self, "secondaryLabel");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "sizeThatFits:", v16, v18);
    v91 = v90;

    v92 = v12;
    v93 = v14;
    v221 = v20;
    v94 = v267;
    v231 = v264;
    v232 = v267;
    v235 = v20;
    rect = v19;
    rect_8 = v267;
    v233 = v264;
    x = v19;
    v95 = v16;
    MinX = v12;
    v96 = v264;
    v97 = v254;
    goto LABEL_33;
  }
  objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
  v36 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v36);

  v250 = v20;
  v244 = v19;
  if (!IsAccessibilityCategory)
  {
    v98 = v20;
    v99 = v16;
    rect_8 = v267;
    v233 = v264;
    x = v19;
    if (v32)
    {
      -[PXActionableSectionHeaderView currentActionButton](self, "currentActionButton");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "sizeToFit");

      -[PXActionableSectionHeaderView currentActionButton](self, "currentActionButton");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "frame");

      UIRectCenteredYInRect();
      v261 = v102;
      v104 = v103;
      v106 = v105;
      v98 = v107;
      v281.origin.x = v12;
      v281.origin.y = v270;
      v281.size.width = v16;
      v281.size.height = v18;
      v108 = CGRectGetMaxX(v281);
      v282.origin.x = v261;
      v282.origin.y = v104;
      v282.size.width = v106;
      v282.size.height = v98;
      v283.origin.x = v108 - CGRectGetWidth(v282);
      v18 = rect_24;
      x = v283.origin.x;
      v233 = v104;
      v283.origin.y = v104;
      rect_8 = v106;
      v283.size.width = v106;
      v283.size.height = v98;
      v99 = v16 - CGRectGetWidth(v283);
    }
    v235 = v98;
    if (v33)
    {
      -[PXActionableSectionHeaderView currentSecondaryButton](self, "currentSecondaryButton");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "sizeToFit");

      -[PXActionableSectionHeaderView currentSecondaryButton](self, "currentSecondaryButton");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "frame");

      UIRectCenteredYInRect();
      v262 = v111;
      v113 = v112;
      v115 = v114;
      v117 = v116;
      v284.origin.x = v12;
      v284.origin.y = v270;
      v284.size.width = v16;
      v284.size.height = rect_24;
      v118 = CGRectGetMaxX(v284);
      v285.origin.x = v262;
      v285.origin.y = v113;
      v285.size.width = v115;
      v285.size.height = v117;
      v119 = v118 - CGRectGetWidth(v285);
      v120 = x;
      rect = v119;
      if (v32)
      {
        v121 = v113;
        v122 = v115;
        v123 = v117;
        v120 = x - (CGRectGetWidth(*(CGRect *)&v119) + 8.0);
        v119 = rect;
      }
      x = v120;
      v231 = v113;
      v232 = v115;
      v124 = v113;
      v125 = v115;
      v221 = v117;
      v126 = v117;
      v99 = v99 - (CGRectGetWidth(*(CGRect *)&v119) + 8.0);
      v18 = rect_24;
      v19 = v244;
    }
    else
    {
      v221 = v250;
      v232 = v267;
      v231 = v264;
      rect = v19;
    }
    -[PXActionableSectionHeaderView primaryLabel](self, "primaryLabel");
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v211, "sizeThatFits:", v99, v18);
    v213 = v212;

    v299.origin.x = v12;
    v299.origin.y = v270;
    v299.size.width = v99;
    v299.size.height = v18;
    v16 = CGRectGetWidth(v299);
    v300.origin.x = v12;
    v300.origin.y = v270;
    v300.size.width = v99;
    v300.size.height = v18;
    v256 = v213;
    MinX = CGRectGetMinX(v300);
    v301.origin.x = v12;
    v301.origin.y = v270;
    v301.size.width = v16;
    v301.size.height = v213;
    MaxY = CGRectGetMaxY(v301);
    -[PXActionableSectionHeaderView secondaryLabel](self, "secondaryLabel");
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v214, "sizeThatFits:", v99, v18);
    v216 = v215;

    v302.origin.x = v12;
    v302.origin.y = v270;
    v302.size.width = v99;
    v302.size.height = v18;
    v247 = CGRectGetWidth(v302);
    if (v216 == 0.0)
    {
      UIRectCenteredYInRect();
      v92 = v12;
      v96 = v264;
      v20 = v250;
      v91 = v216;
    }
    else
    {
      v92 = v12;
      v93 = v270;
      v96 = v264;
      v91 = v216;
      v20 = v250;
    }
    v97 = v256;
    v94 = v267;
    goto LABEL_32;
  }
  v38 = v19;
  -[PXActionableSectionHeaderView primaryLabel](self, "primaryLabel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "sizeThatFits:", v16, v18);
  v41 = v40;

  v272.origin.y = v14;
  v42 = v12;
  v272.origin.x = v12;
  v272.size.width = v16;
  v272.size.height = v18;
  v43 = CGRectGetWidth(v272);
  v44 = v18;
  v45 = v16;
  v16 = v43;
  v253 = v41;
  v246 = v42;
  if (v32)
  {
    -[PXActionableSectionHeaderView currentActionButton](self, "currentActionButton");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "sizeToFit");

    -[PXActionableSectionHeaderView currentActionButton](self, "currentActionButton");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "frame");
    v49 = v48;
    v51 = v50;

    v273.origin.x = v42;
    v273.origin.y = v14;
    v273.size.width = v45;
    v273.size.height = v44;
    v52 = CGRectGetMinX(v273);
    v274.size.width = v16;
    v274.origin.x = v42;
    v274.origin.y = v14;
    v274.size.height = v41;
    v53 = CGRectGetMaxY(v274);
    v54 = v51;
    v55 = v53 + 8.0;
    if (v33)
    {
      rect_8 = v49;
      v235 = v54;
LABEL_41:
      v263 = v54;
      -[PXActionableSectionHeaderView currentSecondaryButton](self, "currentSecondaryButton", v53);
      v202 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v202, "sizeToFit");

      -[PXActionableSectionHeaderView currentSecondaryButton](self, "currentSecondaryButton");
      v203 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v203, "frame");
      v205 = v204;
      v198 = v206;

      v298.origin.x = v42;
      v298.origin.y = v270;
      v298.size.width = v234;
      v298.size.height = rect_24;
      v201 = CGRectGetMinX(v298);
      v207 = rect_16;
      if (v32)
        v207 = v52;
      v208 = v270;
      if (v32)
        v208 = v55;
      v209 = v49;
      v210 = v263;
      v200 = CGRectGetMaxY(*(CGRect *)&v207) + 8.0;
      v231 = v200;
      v232 = v205;
      v49 = v205;
      v54 = v198;
      v53 = v201;
      goto LABEL_52;
    }
    v201 = v52;
    v200 = v53 + 8.0;
    rect_8 = v49;
    v235 = v54;
    v198 = v250;
    v232 = v267;
    v231 = v264;
    v53 = v244;
  }
  else
  {
    v54 = v41;
    v49 = v43;
    v197 = v38;
    v52 = v38;
    v55 = v264;
    rect_8 = v267;
    v198 = v250;
    v235 = v250;
    v199 = v197;
    v200 = v14;
    v201 = v42;
    v231 = v264;
    v232 = v267;
    v53 = v199;
    if (v33)
      goto LABEL_41;
  }
LABEL_52:
  rect = v53;
  v221 = v198;
  x = v52;
  v233 = v55;
  v217 = v201;
  v218 = v49;
  MaxY = CGRectGetMaxY(*(CGRect *)(&v54 - 3));
  v303.origin.x = v42;
  v303.origin.y = v270;
  v303.size.width = v234;
  v303.size.height = rect_24;
  MinX = CGRectGetMinX(v303);
  -[PXActionableSectionHeaderView secondaryLabel](self, "secondaryLabel");
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v219, "sizeThatFits:", v234, rect_24);
  v91 = v220;

  v304.origin.x = v42;
  v304.origin.y = v270;
  v304.size.width = v234;
  v304.size.height = rect_24;
  v95 = CGRectGetWidth(v304);
  v96 = v264;
  v94 = v267;
  v20 = v250;
  v97 = v253;
  v19 = v244;
  v92 = v246;
  v93 = v270;
LABEL_33:
  v159 = v16;
  v160 = v97;
  v243 = CGRectIntegral(*(CGRect *)&v92);
  v293.origin.x = v19;
  v293.origin.y = v96;
  v293.size.width = v94;
  v293.size.height = v20;
  v248 = CGRectIntegral(v293);
  v294.origin.x = MinX;
  v294.origin.y = MaxY;
  v294.size.width = v95;
  v294.size.height = v91;
  v259 = CGRectIntegral(v294);
  v295.origin.x = x;
  v295.origin.y = v233;
  v295.size.width = rect_8;
  v295.size.height = v235;
  v296 = CGRectIntegral(v295);
  v161 = v296.origin.x;
  y = v296.origin.y;
  v163 = v296.size.width;
  height = v296.size.height;
  v296.origin.x = rect;
  v296.origin.y = v231;
  v296.size.width = v232;
  v296.size.height = v221;
  v297 = CGRectIntegral(v296);
  v165 = v297.origin.x;
  v166 = v297.origin.y;
  v167 = v297.size.width;
  v168 = v297.size.height;
  v242 = height;
  if (-[PXActionableSectionHeaderView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
  {
    v243.origin.x = MEMORY[0x1A85CD2B8](v243.origin.x, v243.origin.y, v243.size.width, v243.size.height, rect_16, v270, v234, rect_24);
    v243.origin.y = v169;
    v243.size.width = v170;
    v243.size.height = v171;
    v248.origin.x = MEMORY[0x1A85CD2B8](v248.origin.x, v248.origin.y, v248.size.width, v248.size.height, rect_16, v270, v234, rect_24);
    v248.origin.y = v172;
    v248.size.width = v173;
    v248.size.height = v174;
    v259.origin.x = MEMORY[0x1A85CD2B8](v259.origin.x, v259.origin.y, v259.size.width, v259.size.height, rect_16, v270, v234, rect_24);
    v259.origin.y = v175;
    v259.size.width = v176;
    v259.size.height = v177;
    v178 = MEMORY[0x1A85CD2B8](v161, y, v163, height, rect_16, v270, v234, rect_24);
    rect_8a = v179;
    v163 = v180;
    v242 = v181;
    v165 = MEMORY[0x1A85CD2B8](v165, v166, v167, v168, rect_16, v270, v234, rect_24);
    v166 = v182;
    v167 = v183;
    v168 = v184;
    v185 = v223;
    v186 = v224;
    v187 = v222;
  }
  else
  {
    v185 = v223;
    v186 = v224;
    v187 = v222;
    rect_8a = y;
    v178 = v161;
  }
  v188 = v187 + v185;
  v189 = v186 + 5.0;
  -[PXActionableSectionHeaderView visualEffectView](self, "visualEffectView");
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v190, "setFrame:", v227, v226, v225, v189);

  -[PXActionableSectionHeaderView backgroundImageView](self, "backgroundImageView");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v191, "setFrame:", v230, v229, v228, v188);

  -[PXActionableSectionHeaderView primaryLabel](self, "primaryLabel");
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v192, "setFrame:", v243.origin.x, v243.origin.y, v243.size.width, v243.size.height);

  -[PXActionableSectionHeaderView spacerLabel](self, "spacerLabel");
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v193, "setFrame:", v248.origin.x, v248.origin.y, v248.size.width, v248.size.height);

  -[PXActionableSectionHeaderView secondaryLabel](self, "secondaryLabel");
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v194, "setFrame:", v259.origin.x, v259.origin.y, v259.size.width, v259.size.height);

  -[PXActionableSectionHeaderView currentActionButton](self, "currentActionButton");
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v195, "setFrame:", v178, rect_8a, v163, v242);

  -[PXActionableSectionHeaderView currentSecondaryButton](self, "currentSecondaryButton");
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v196, "setFrame:", v165, v166, v167, v168);

}

- (void)willTransitionFromLayout:(id)a3 toLayout:(id)a4
{
  self->_inLayoutTransition = 1;
  -[PXActionableSectionHeaderView _updateBackdropViewGroupName](self, "_updateBackdropViewGroupName", a3, a4);
}

- (void)didTransitionFromLayout:(id)a3 toLayout:(id)a4
{
  self->_inLayoutTransition = 0;
  -[PXActionableSectionHeaderView _updateBackdropViewGroupName](self, "_updateBackdropViewGroupName", a3, a4);
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (void)_contentSizeCategoryDidChangeNotification:(id)a3
{
  -[PXActionableSectionHeaderView _updateLabelFonts](self, "_updateLabelFonts", a3);
  -[PXActionableSectionHeaderView _updateLabelLineNumbers](self, "_updateLabelLineNumbers");
  -[PXActionableSectionHeaderView _updateSpacerLabelHiddenState](self, "_updateSpacerLabelHiddenState");
}

- (void)_actionButtonPressed:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[PXActionableSectionHeaderView actionButtonEnabled](self, "actionButtonEnabled")
    && (*(_BYTE *)&self->_delegateFlags & 1) != 0)
  {
    -[PXActionableSectionHeaderView delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "headerViewDidPressActionButton:inHeaderView:", v5, self);

  }
}

- (void)_updateWithCurrentTraits
{
  -[PXActionableSectionHeaderView _updateLabelLineNumbers](self, "_updateLabelLineNumbers");
  -[PXActionableSectionHeaderView _updateSpacerLabelHiddenState](self, "_updateSpacerLabelHiddenState");
}

- (void)_updateLabelFonts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PXActionableSectionHeaderView primaryLabel](self, "primaryLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1A85CC970](5, 0x8000, 7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v4);

  -[PXActionableSectionHeaderView secondaryLabel](self, "secondaryLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _PXConfigureHeaderSubtitleLabel(v5);

  -[PXActionableSectionHeaderView spacerLabel](self, "spacerLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _PXConfigureHeaderSubtitleLabel(v6);

  -[PXActionableSectionHeaderView _updateSystemActionButton](self, "_updateSystemActionButton");
  -[PXActionableSectionHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateLabelLineNumbers
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  if (-[PXActionableSectionHeaderView layoutMode](self, "layoutMode") == 1)
  {
    if (-[PXActionableSectionHeaderView supportsMultipleLinesInCompactLayout](self, "supportsMultipleLinesInCompactLayout"))
    {
      v3 = 2;
    }
    else
    {
      v3 = 1;
    }
  }
  else
  {
    v3 = 1;
  }
  -[PXActionableSectionHeaderView primaryLabel](self, "primaryLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfLines");

  if (v3 != v5)
  {
    -[PXActionableSectionHeaderView primaryLabel](self, "primaryLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNumberOfLines:", v3);

    -[PXActionableSectionHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
  -[PXActionableSectionHeaderView secondaryLabel](self, "secondaryLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "numberOfLines");

  if (v3 != v8)
  {
    -[PXActionableSectionHeaderView secondaryLabel](self, "secondaryLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNumberOfLines:", v3);

    -[PXActionableSectionHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateLabelColors
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  BOOL v6;
  _BOOL4 v7;
  BOOL v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  -[PXActionableSectionHeaderView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  v5 = -[PXActionableSectionHeaderView backgroundStyle](self, "backgroundStyle");
  if (-[PXActionableSectionHeaderView wantsBackground](self, "wantsBackground"))
    v6 = -[PXActionableSectionHeaderView backgroundStyle](self, "backgroundStyle") != 0;
  else
    v6 = 0;
  v7 = -[PXActionableSectionHeaderView wantsBackground](self, "wantsBackground");
  v8 = 0;
  if (v7 && v4 == 2)
    v8 = -[PXActionableSectionHeaderView backgroundStyle](self, "backgroundStyle") == 0;
  v9 = v5 == 2 || v6;
  if ((v9 & 1) != 0
    || v8
    || -[PXActionableSectionHeaderView preferredUserInterfaceStyle](self, "preferredUserInterfaceStyle") == 2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_primaryLabel, "setTextColor:", v10);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_spacerLabel, "setTextColor:", v11);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_primaryLabel, "setTextColor:", v13);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_spacerLabel, "setTextColor:", v14);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (id)v12;
  -[UILabel setTextColor:](self->_secondaryLabel, "setTextColor:", v12);

}

- (void)_updateSpacerLabelHiddenState
{
  uint64_t v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  uint64_t v9;

  -[PXActionableSectionHeaderView primaryText](self, "primaryText");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[PXActionableSectionHeaderView secondaryText](self, "secondaryText"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    v6 = -[PXActionableSectionHeaderView layoutMode](self, "layoutMode") == 1;
    -[PXActionableSectionHeaderView spacerLabel](self, "spacerLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = v6;
  }
  else
  {
    -[PXActionableSectionHeaderView spacerLabel](self, "spacerLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = 1;
  }
  objc_msgSend(v7, "setHidden:", v9);

  -[PXActionableSectionHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateBackgroundAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  UIVisualEffectView *v9;
  UIVisualEffectView *visualEffectView;
  uint64_t v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  _QWORD *v15;
  _QWORD *v16;
  unint64_t v17;
  UIImageView *v18;
  void *v19;
  UIImageView *backgroundImageView;
  id v21;
  UIImageView *v22;
  UIImageView *v23;
  PXActionableSectionHeaderView *v24;
  int v25;
  void *v26;
  UIVisualEffectView *v27;
  UIVisualEffectView *v28;
  PXActionableSectionHeaderView *v29;
  UIVisualEffectView *v30;
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[5];

  v3 = a3;
  if (-[PXActionableSectionHeaderView backgroundStyle](self, "backgroundStyle")
    || !-[PXActionableSectionHeaderView wantsBackground](self, "wantsBackground"))
  {
    v8 = 664;
    if (v3)
    {
      visualEffectView = self->_visualEffectView;
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __59__PXActionableSectionHeaderView__updateBackgroundAnimated___block_invoke_3;
      v35[3] = &unk_1E5149198;
      v35[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "transitionWithView:duration:options:animations:completion:", visualEffectView, 5439488, v35, 0, 0.3);
    }
    else
    {
      -[UIVisualEffectView setHidden:](self->_visualEffectView, "setHidden:", 1);
    }
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0DC3510];
    if (-[PXActionableSectionHeaderView preferredUserInterfaceStyle](self, "preferredUserInterfaceStyle") == 2)
      v6 = 20;
    else
      v6 = 10;
    objc_msgSend(v5, "effectWithStyle:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 664;
    v9 = self->_visualEffectView;
    if (v9)
    {
      -[UIVisualEffectView setEffect:](v9, "setEffect:", v7);
    }
    else
    {
      v27 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v7);
      v28 = self->_visualEffectView;
      self->_visualEffectView = v27;

    }
    -[UIVisualEffectView superview](self->_visualEffectView, "superview");
    v29 = (PXActionableSectionHeaderView *)objc_claimAutoreleasedReturnValue();

    if (v29 != self)
    {
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __59__PXActionableSectionHeaderView__updateBackgroundAnimated___block_invoke;
      v37[3] = &unk_1E5149198;
      v37[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v37);
    }
    if (v3)
    {
      v30 = self->_visualEffectView;
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __59__PXActionableSectionHeaderView__updateBackgroundAnimated___block_invoke_2;
      v36[3] = &unk_1E5149198;
      v36[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "transitionWithView:duration:options:animations:completion:", v30, 5439488, v36, 0, 0.3);
    }
    else
    {
      -[UIVisualEffectView setHidden:](self->_visualEffectView, "setHidden:", 0);
    }
    -[PXActionableSectionHeaderView _updateBackdropViewGroupName](self, "_updateBackdropViewGroupName");

  }
  if (-[PXActionableSectionHeaderView backgroundStyle](self, "backgroundStyle") != 1
    || (-[PXActionableSectionHeaderView backgroundImage](self, "backgroundImage"),
        (v11 = objc_claimAutoreleasedReturnValue()) == 0)
    || (v12 = (void *)v11,
        v13 = -[PXActionableSectionHeaderView wantsBackground](self, "wantsBackground"),
        v12,
        !v13))
  {
LABEL_16:
    if (!self->_hasBackgroundView)
      goto LABEL_21;
    self->_hasBackgroundView = 0;
    if (v3)
    {
      v14 = (void *)MEMORY[0x1E0DC3F10];
      v31[4] = self;
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __59__PXActionableSectionHeaderView__updateBackgroundAnimated___block_invoke_6;
      v32[3] = &unk_1E5149198;
      v32[4] = self;
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __59__PXActionableSectionHeaderView__updateBackgroundAnimated___block_invoke_7;
      v31[3] = &unk_1E5147360;
      v15 = v32;
      v16 = v31;
LABEL_19:
      objc_msgSend(v14, "animateWithDuration:delay:options:animations:completion:", 196608, v15, v16, 0.3, 0.0);
      goto LABEL_21;
    }
    -[UIImageView setHidden:](self->_backgroundImageView, "setHidden:", 1);
    goto LABEL_21;
  }
  if (-[PXActionableSectionHeaderView _isMovingFast](self, "_isMovingFast"))
  {
    if (self->_hasBackgroundView)
      goto LABEL_21;
    goto LABEL_16;
  }
  if (!self->_hasBackgroundView)
  {
    self->_hasBackgroundView = 1;
    backgroundImageView = self->_backgroundImageView;
    if (!backgroundImageView)
    {
      v21 = objc_alloc(MEMORY[0x1E0DC3890]);
      v22 = (UIImageView *)objc_msgSend(v21, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v23 = self->_backgroundImageView;
      self->_backgroundImageView = v22;

      -[UIImageView setAlpha:](self->_backgroundImageView, "setAlpha:", 0.0);
      backgroundImageView = self->_backgroundImageView;
    }
    -[UIImageView superview](backgroundImageView, "superview");
    v24 = (PXActionableSectionHeaderView *)objc_claimAutoreleasedReturnValue();

    if (v24 != self)
    {
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __59__PXActionableSectionHeaderView__updateBackgroundAnimated___block_invoke_4;
      v34[3] = &unk_1E5149198;
      v34[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v34);
    }
    v25 = -[UIImageView isHidden](self->_backgroundImageView, "isHidden");
    -[UIImageView setHidden:](self->_backgroundImageView, "setHidden:", 0);
    -[PXActionableSectionHeaderView backgroundImage](self, "backgroundImage");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_backgroundImageView, "setImage:", v26);

    if (v3)
    {
      if (v25)
        -[UIImageView setAlpha:](self->_backgroundImageView, "setAlpha:", 0.0);
      v14 = (void *)MEMORY[0x1E0DC3F10];
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __59__PXActionableSectionHeaderView__updateBackgroundAnimated___block_invoke_5;
      v33[3] = &unk_1E5149198;
      v33[4] = self;
      v15 = v33;
      v16 = 0;
      goto LABEL_19;
    }
    -[PXActionableSectionHeaderView backgroundImageAlpha](self, "backgroundImageAlpha");
    -[UIImageView setAlpha:](self->_backgroundImageView, "setAlpha:");
  }
LABEL_21:
  v17 = -[PXActionableSectionHeaderView backgroundStyle](self, "backgroundStyle");
  if (v17 - 2 < 2)
  {
    -[UIImageView removeFromSuperview](self->_backgroundImageView, "removeFromSuperview");
    v18 = self->_backgroundImageView;
    self->_backgroundImageView = 0;

  }
  else if (v17 != 1)
  {
    if (v17)
      return;
    v8 = 672;
  }
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v8), "removeFromSuperview");
  v19 = *(Class *)((char *)&self->super.super.super.super.isa + v8);
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = 0;

}

- (void)_updateBackdropViewGroupName
{
  uint64_t v3;
  id v4;

  if (self->_inLayoutTransition || !-[PXActionableSectionHeaderView wantsBackground](self, "wantsBackground"))
  {
    v3 = 0;
  }
  else
  {
    -[PXActionableSectionHeaderView backdropViewGroupName](self, "backdropViewGroupName");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (id)v3;
  -[UIVisualEffectView _setGroupName:](self->_visualEffectView, "_setGroupName:", v3);

}

- (void)_updateClipping
{
  -[PXActionableSectionHeaderView bounds](self, "bounds");
  -[PXActionableSectionHeaderView setClipsToBounds:](self, "setClipsToBounds:", PXSizeIsEmpty());
}

- (int64_t)layoutMode
{
  void *v3;
  int64_t v4;

  -[PXActionableSectionHeaderView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PXActionableSectionHeaderView layoutModeForHorizontalSizeClass:](self, "layoutModeForHorizontalSizeClass:", objc_msgSend(v3, "horizontalSizeClass"));

  return v4;
}

- (int64_t)layoutModeForHorizontalSizeClass:(int64_t)a3
{
  NSString *v4;
  _BOOL4 IsAccessibilityCategory;

  objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  return a3 == 1 || IsAccessibilityCategory;
}

- (PXActionableSectionHeaderViewDelegate)delegate
{
  return (PXActionableSectionHeaderViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (PXSimpleIndexPath)sectionIndexPath
{
  __int128 v3;

  v3 = *(_OWORD *)&self[22].dataSourceIdentifier;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[21].item;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (void)setSectionIndexPath:(PXSimpleIndexPath *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->item;
  *(_OWORD *)&self->_sectionIndexPath.dataSourceIdentifier = *(_OWORD *)&a3->dataSourceIdentifier;
  *(_OWORD *)&self->_sectionIndexPath.item = v3;
}

- (unint64_t)buttonStyle
{
  return self->_buttonStyle;
}

- (BOOL)showsActionButton
{
  return self->_showsActionButton;
}

- (BOOL)showsSecondaryButton
{
  return self->_showsSecondaryButton;
}

- (BOOL)actionButtonEnabled
{
  return self->_actionButtonEnabled;
}

- (NSString)actionText
{
  return self->_actionText;
}

- (id)filterButtonControllerFactory
{
  return self->_filterButtonControllerFactory;
}

- (BOOL)showsTopSeparator
{
  return self->_showsTopSeparator;
}

- (PXCuratedLibrarySectionHeaderLayoutSpec)backdropButtonSpec
{
  return self->_backdropButtonSpec;
}

- (unint64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (BOOL)wantsBackground
{
  return self->_wantsBackground;
}

- (int64_t)speedRegime
{
  return self->_speedRegime;
}

- (BOOL)avoidsTintedButtonsAtHighSpeed
{
  return self->_avoidsTintedButtonsAtHighSpeed;
}

- (UIImage)backgroundImage
{
  return self->_backgroundImage;
}

- (double)backgroundImageAlpha
{
  return self->_backgroundImageAlpha;
}

- (double)backgroundImageOverhang
{
  return self->_backgroundImageOverhang;
}

- (NSString)backdropViewGroupName
{
  return self->_backdropViewGroupName;
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

- (BOOL)supportsMultipleLinesInCompactLayout
{
  return self->_supportsMultipleLinesInCompactLayout;
}

- (int64_t)preferredUserInterfaceStyle
{
  return self->_preferredUserInterfaceStyle;
}

- (UILabel)primaryLabel
{
  return self->_primaryLabel;
}

- (void)setPrimaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_primaryLabel, a3);
}

- (UILabel)spacerLabel
{
  return self->_spacerLabel;
}

- (void)setSpacerLabel:(id)a3
{
  objc_storeStrong((id *)&self->_spacerLabel, a3);
}

- (UILabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (void)setSecondaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryLabel, a3);
}

- (UIButton)systemActionButton
{
  return self->_systemActionButton;
}

- (void)setSystemActionButton:(id)a3
{
  objc_storeStrong((id *)&self->_systemActionButton, a3);
}

- (PXCuratedLibraryOverlayButton)backdropActionButton
{
  return self->_backdropActionButton;
}

- (void)setBackdropActionButton:(id)a3
{
  objc_storeStrong((id *)&self->_backdropActionButton, a3);
}

- (PXPhotosFilterToggleButtonController)filterButtonController
{
  return self->_filterButtonController;
}

- (void)setFilterButtonController:(id)a3
{
  objc_storeStrong((id *)&self->_filterButtonController, a3);
}

- (UIButton)currentSecondaryButton
{
  return self->_currentSecondaryButton;
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (UIImageView)backgroundImageView
{
  return self->_backgroundImageView;
}

- (BOOL)inLayoutTransition
{
  return self->_inLayoutTransition;
}

- (void)setInLayoutTransition:(BOOL)a3
{
  self->_inLayoutTransition = a3;
}

- (UITraitCollection)selfSizingTraits
{
  return self->_selfSizingTraits;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selfSizingTraits, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_currentSecondaryButton, 0);
  objc_storeStrong((id *)&self->_filterButtonController, 0);
  objc_storeStrong((id *)&self->_backdropActionButton, 0);
  objc_storeStrong((id *)&self->_systemActionButton, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_spacerLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_backdropViewGroupName, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_storeStrong((id *)&self->_backdropButtonSpec, 0);
  objc_storeStrong(&self->_filterButtonControllerFactory, 0);
  objc_storeStrong((id *)&self->_actionText, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __59__PXActionableSectionHeaderView__updateBackgroundAnimated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 664));
  return objc_msgSend(*(id *)(a1 + 32), "sendSubviewToBack:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 664));
}

uint64_t __59__PXActionableSectionHeaderView__updateBackgroundAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 664), "setHidden:", 0);
}

uint64_t __59__PXActionableSectionHeaderView__updateBackgroundAnimated___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 664), "setHidden:", 1);
}

uint64_t __59__PXActionableSectionHeaderView__updateBackgroundAnimated___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 672));
  return objc_msgSend(*(id *)(a1 + 32), "sendSubviewToBack:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 672));
}

uint64_t __59__PXActionableSectionHeaderView__updateBackgroundAnimated___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "backgroundImageAlpha");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 672), "setAlpha:");
}

uint64_t __59__PXActionableSectionHeaderView__updateBackgroundAnimated___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 672), "setAlpha:", 0.0);
}

uint64_t __59__PXActionableSectionHeaderView__updateBackgroundAnimated___block_invoke_7(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 672), "setHidden:", 1);
  return result;
}

void __64__PXActionableSectionHeaderView__updateSecondaryButtonAnimated___block_invoke(uint64_t a1)
{
  double v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "showsSecondaryButton"))
    v2 = 1.0;
  else
    v2 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "currentSecondaryButton");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", v2);

}

void __61__PXActionableSectionHeaderView__updateActionButtonAnimated___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  double v4;
  id v5;

  if (*(_BYTE *)(a1 + 40))
    v2 = 1.0;
  else
    v2 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "systemActionButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", v2);

  if (*(_BYTE *)(a1 + 40))
    v4 = 1.0;
  else
    v4 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "backdropActionButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", v4);

}

void __68__PXActionableSectionHeaderView__updateActionButtonEnabledAnimated___block_invoke(uint64_t a1)
{
  double v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "actionButtonEnabled"))
    v2 = 1.0;
  else
    v2 = 0.6;
  objc_msgSend(*(id *)(a1 + 32), "systemActionButton");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", v2);

}

@end
