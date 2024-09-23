@implementation _UIButtonBarButtonVisualProviderIOS

- (void)_setTitle:(id)a3
{
  __CFString *v4;
  unint64_t v5;
  NSObject *v6;
  NSObject *v7;
  id WeakRetained;
  _UIModernBarButton *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  _UIModernBarButton *titleButton;
  int v25;
  id v26;
  __int16 v27;
  _UIModernBarButton *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  if (v4)
    goto LABEL_12;
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      goto LABEL_8;
    WeakRetained = objc_loadWeakRetained((id *)&self->super._barButtonItem);
    titleButton = self->_titleButton;
    -[UIButton _allButtonContent](titleButton, "_allButtonContent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138412802;
    v26 = WeakRetained;
    v27 = 2112;
    v28 = titleButton;
    v29 = 2112;
    v30 = v10;
    _os_log_fault_impl(&dword_185066000, v7, OS_LOG_TYPE_FAULT, "Received nil title, substituting item's title (item=%@, button=%@, buttonContent=%@)", (uint8_t *)&v25, 0x20u);
  }
  else
  {
    v5 = _setTitle____s_category;
    if (!_setTitle____s_category)
    {
      v5 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&_setTitle____s_category);
    }
    v6 = *(NSObject **)(v5 + 8);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    v7 = v6;
    WeakRetained = objc_loadWeakRetained((id *)&self->super._barButtonItem);
    v9 = self->_titleButton;
    -[UIButton _allButtonContent](v9, "_allButtonContent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138412802;
    v26 = WeakRetained;
    v27 = 2112;
    v28 = v9;
    v29 = 2112;
    v30 = v10;
    _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "Received nil title, substituting item's title (item=%@, button=%@, buttonContent=%@)", (uint8_t *)&v25, 0x20u);
  }

LABEL_8:
LABEL_9:
  v11 = objc_loadWeakRetained((id *)&self->super._barButtonItem);
  objc_msgSend(v11, "resolvedTitle");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = &stru_1E16EDF20;
  if (v12)
    v14 = (__CFString *)v12;
  v4 = v14;

LABEL_12:
  if (!self->_finalTitleAttributes)
    -[_UIButtonBarButtonVisualProviderIOS _computeTextAttributes](self, "_computeTextAttributes");
  v15 = objc_alloc(MEMORY[0x1E0CB3498]);
  -[NSArray objectAtIndexedSubscript:](self->_finalTitleAttributes, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithString:attributes:", v4, v16);

  -[UIButton setAttributedTitle:forState:](self->_titleButton, "setAttributedTitle:forState:", v17, 0);
  v18 = objc_alloc(MEMORY[0x1E0CB3498]);
  -[NSArray objectAtIndexedSubscript:](self->_finalTitleAttributes, "objectAtIndexedSubscript:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithString:attributes:", v4, v19);

  -[UIButton setAttributedTitle:forState:](self->_titleButton, "setAttributedTitle:forState:", v20, 1);
  v21 = objc_alloc(MEMORY[0x1E0CB3498]);
  -[NSArray objectAtIndexedSubscript:](self->_finalTitleAttributes, "objectAtIndexedSubscript:", 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v21, "initWithString:attributes:", v4, v22);

  -[UIButton setAttributedTitle:forState:](self->_titleButton, "setAttributedTitle:forState:", v23, 2);
}

- (void)updateButton:(id)a3 forEnabledState:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  NSMutableDictionary *backgroundImages;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  id v12;

  v4 = a4;
  -[UIButton setEnabled:](self->_backIndicatorButton, "setEnabled:", a4);
  -[UIButton setEnabled:](self->_titleButton, "setEnabled:", v4);
  -[UIButton setEnabled:](self->_imageButton, "setEnabled:", v4);
  if (v4)
    v6 = 0;
  else
    v6 = 2;
  backgroundImages = self->_backgroundImages;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](backgroundImages, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = self->_backgroundImages;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_backgroundView, "setImage:", v11);

  }
}

- (void)configureButton:(id)a3 withAppearanceDelegate:(id)a4 fromBarItem:(id)a5
{
  _UIButtonBarAppearanceDelegate **p_appearanceDelegate;
  id v9;
  id v10;

  p_appearanceDelegate = &self->_appearanceDelegate;
  v9 = a5;
  v10 = a3;
  objc_storeWeak((id *)p_appearanceDelegate, a4);
  -[_UIButtonBarButtonVisualProviderIOS configureButton:fromBarButtonItem:](self, "configureButton:fromBarButtonItem:", v10, v9);

}

- (void)updateButton:(id)a3 forSelectedState:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  NSMutableDictionary *backgroundImages;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  id v12;

  v4 = a4;
  -[UIButton setSelected:](self->_titleButton, "setSelected:", a4);
  -[UIButton setSelected:](self->_imageButton, "setSelected:", v4);
  if (v4)
    v6 = 4;
  else
    v6 = 0;
  backgroundImages = self->_backgroundImages;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](backgroundImages, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = self->_backgroundImages;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_backgroundView, "setImage:", v11);

  }
}

- (BOOL)buttonSelectionState:(id)a3 forRequestedState:(BOOL)a4
{
  if (!a4)
    return 0;
  if ((objc_msgSend(a3, "isBackButton") & 1) != 0)
    return 0;
  if (self->_titleButton)
    return 1;
  return self->_imageButton != 0;
}

- (id)symbolImageView
{
  void *imageButton;

  imageButton = self->_imageButton;
  if (imageButton)
  {
    objc_msgSend(imageButton, "_imageView");
    imageButton = (void *)objc_claimAutoreleasedReturnValue();
  }
  return imageButton;
}

- (BOOL)supportsBackButtons
{
  return 1;
}

- (void)_configureImageWithInsets:(UIEdgeInsets)a3 paddingEdges:(unint64_t)a4 additionalPadding:(double)a5
{
  double right;
  double bottom;
  double left;
  double top;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[_UIButtonBarButtonVisualProviderIOS _addHorizontalConstraintsForImageWithInsets:paddingEdges:additionalPadding:](self, "_addHorizontalConstraintsForImageWithInsets:paddingEdges:additionalPadding:", a4, a3.top, a3.left, a3.bottom, a3.right, a5);
  -[_UIButtonBarButtonVisualProviderIOS _addVerticalConstraintsForImageWithInsets:](self, "_addVerticalConstraintsForImageWithInsets:", top, left, bottom, right);
}

- (void)_configureTextBackButtonWithTitlePositionAdjustment:(UIOffset)a3 backButtonLayoutInsets:(NSDirectionalEdgeInsets)a4 useBaselineAlignment:(BOOL)a5
{
  _BOOL8 v5;
  double trailing;
  double bottom;
  double leading;
  double top;
  double vertical;
  double horizontal;
  void *v14;

  v5 = a5;
  trailing = a4.trailing;
  bottom = a4.bottom;
  leading = a4.leading;
  top = a4.top;
  vertical = a3.vertical;
  horizontal = a3.horizontal;
  if (!self->_titleButton)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIButtonBarButtonVisualProviderIOS.m"), 1395, CFSTR("Invalid text button configuration"));

  }
  -[_UIButtonBarButtonVisualProviderIOS _addHorizontalConstraintsForContentButton:titleOffset:backButtonLayoutInsets:](self, "_addHorizontalConstraintsForContentButton:titleOffset:backButtonLayoutInsets:", horizontal, top, leading, bottom, trailing);
  -[_UIButtonBarButtonVisualProviderIOS _addVerticalConstraintsForBackIndicatorWithTitleOffset:bottomOffset:useBaselineAlignment:](self, "_addVerticalConstraintsForBackIndicatorWithTitleOffset:bottomOffset:useBaselineAlignment:", v5, vertical, bottom);
  -[_UIButtonBarButtonVisualProviderIOS _addVerticalConstraintsForTextWithOffset:](self, "_addVerticalConstraintsForTextWithOffset:", vertical);
  -[_UIButtonBarButtonVisualProviderIOS _configureBackButtonMask](self, "_configureBackButtonMask");
}

- (void)_configureTextWithOffset:(UIOffset)a3 additionalPadding:(UIEdgeInsets)a4
{
  double vertical;

  vertical = a3.vertical;
  -[_UIButtonBarButtonVisualProviderIOS _addHorizontalConstraintsForTextWithOffset:additionalPadding:](self, "_addHorizontalConstraintsForTextWithOffset:additionalPadding:", a3.horizontal, a4.top, a4.left, a4.bottom, a4.right);
  -[_UIButtonBarButtonVisualProviderIOS _addVerticalConstraintsForTextWithOffset:](self, "_addVerticalConstraintsForTextWithOffset:", vertical);
}

- (void)_addHorizontalConstraintsForTextWithOffset:(double)a3 additionalPadding:(UIEdgeInsets)a4
{
  double right;
  double left;
  UIUserInterfaceLayoutDirection v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  right = a4.right;
  left = a4.left;
  v8 = -[UIView effectiveUserInterfaceLayoutDirection](self->super._button, "effectiveUserInterfaceLayoutDirection", a3, a4.top, a4.left, a4.bottom);
  if (v8 == UIUserInterfaceLayoutDirectionRightToLeft)
    v9 = right;
  else
    v9 = left;
  if (v8 == UIUserInterfaceLayoutDirectionRightToLeft)
    right = left;
  -[UIView leadingAnchor](self->_titleButton, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->super._button, "leadingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, v9 + a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIButtonBarButtonVisualProviderIOS addActiveConstraint:named:](self, "addActiveConstraint:named:", v12, CFSTR("TB_Leading_Leading"));

  -[UIView trailingAnchor](self->super._button, "trailingAnchor");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_titleButton, "trailingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v13, right - a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIButtonBarButtonVisualProviderIOS addActiveConstraint:named:](self, "addActiveConstraint:named:", v14, CFSTR("TB_Trailing_Trailing"));

}

- (void)_configureBackButtonMask
{
  _UIBackButtonMaskView *backButtonMask;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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
  id v26;

  backButtonMask = self->_backButtonMask;
  if (backButtonMask)
  {
    -[UIView leadingAnchor](backButtonMask, "leadingAnchor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self->super._button, "leadingAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "constraintEqualToAnchor:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIButtonBarButtonVisualProviderIOS addActiveConstraint:named:](self, "addActiveConstraint:named:", v6, CFSTR("Mask_Leading_Leading"));

    -[UIView trailingAnchor](self->_backButtonMask, "trailingAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->super._button, "trailingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIButtonBarButtonVisualProviderIOS addActiveConstraint:named:](self, "addActiveConstraint:named:", v9, CFSTR("Mask_Trailing_Trailing"));

    -[UIView topAnchor](self->_backButtonMask, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self->super._button, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIButtonBarButtonVisualProviderIOS addActiveConstraint:named:](self, "addActiveConstraint:named:", v12, CFSTR("Mask_Top_Top"));

    -[UIView bottomAnchor](self->_backButtonMask, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self->super._button, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIButtonBarButtonVisualProviderIOS addActiveConstraint:named:](self, "addActiveConstraint:named:", v15, CFSTR("Mask_Bottom_Bottom"));

    -[_UIBackButtonMaskView maskImageView](self->_backButtonMask, "maskImageView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self->_backIndicatorButton, "leadingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIButtonBarButtonVisualProviderIOS addActiveConstraint:named:](self, "addActiveConstraint:named:", v19, CFSTR("MaskIV_Leading_BIB_Leadinng"));

    -[_UIBackButtonMaskView maskExtensionLeadingAnchor](self->_backButtonMask, "maskExtensionLeadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_backIndicatorButton, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIButtonBarButtonVisualProviderIOS addActiveConstraint:named:](self, "addActiveConstraint:named:", v22, CFSTR("MaskEV_Leading_BIB_Trailing"));

    -[_UIBackButtonMaskView maskImageView](self->_backButtonMask, "maskImageView");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "centerYAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](self->_backIndicatorButton, "centerYAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIButtonBarButtonVisualProviderIOS addActiveConstraint:named:](self, "addActiveConstraint:named:", v25, CFSTR("MaskIV_CenterY_BIB_CenterY"));

  }
}

- (void)addActiveConstraint:(id)a3 named:(id)a4
{
  id v7;
  NSMutableDictionary **p_oldConstraints;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v7 = a4;
  if (!objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIButtonBarButtonVisualProviderIOS.m"), 709, CFSTR("Activating a constraint requires a non-empty identifier"));

  }
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIButtonBarButtonVisualProviderIOS.m"), 710, CFSTR("Cannot activate a nil constraint (%@)"), v7);

  }
  p_oldConstraints = &self->_oldConstraints;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_oldConstraints, "objectForKeyedSubscript:", v7);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = v17;
  if ((id)v9 == v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIButtonBarButtonVisualProviderIOS.m"), 715, CFSTR("On non-optimal path for reusing existing constraint – did you mean to call -activate[Width|Height]Minimizer instead?"));

    v11 = v17;
    if (!v10)
      goto LABEL_10;
  }
  else if (!v9)
  {
LABEL_10:
    objc_msgSend(v11, "setIdentifier:", v7);
    p_oldConstraints = &self->_currentConstraints;
    v13 = v17;
    goto LABEL_11;
  }
  v12 = objc_msgSend(v10, "_isEqualToConstraintValue:includingConstant:includeOtherMutableProperties:", v17, 0, 0);
  v11 = v17;
  if (!v12)
    goto LABEL_10;
  objc_msgSend(v17, "constant");
  objc_msgSend(v10, "setConstant:");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_currentConstraints, "setObject:forKeyedSubscript:", v10, v7);
  v13 = 0;
LABEL_11:
  -[NSMutableDictionary setObject:forKeyedSubscript:](*p_oldConstraints, "setObject:forKeyedSubscript:", v13, v7);

}

- (void)_addVerticalConstraintsForBackIndicatorWithTitleOffset:(double)a3 bottomOffset:(double)a4 useBaselineAlignment:(BOOL)a5
{
  UIButton *backIndicatorButton;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  backIndicatorButton = self->_backIndicatorButton;
  if (a5)
  {
    -[UIView lastBaselineAnchor](backIndicatorButton, "lastBaselineAnchor", a3, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView layoutMarginsGuide](self->super._button, "layoutMarginsGuide");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bottomAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:constant:", v10, -a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("BIB_Baseline_Baseline");
  }
  else
  {
    -[UIView bottomAnchor](backIndicatorButton, "bottomAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView layoutMarginsGuide](self->super._button, "layoutMarginsGuide");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bottomAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:constant:", v10, a4 - a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("BIB_Bottom_Baseline");
  }
  -[_UIButtonBarButtonVisualProviderIOS addActiveConstraint:named:](self, "addActiveConstraint:named:", v11, v12);

  -[UIView topAnchor](self->_backIndicatorButton, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->super._button, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintGreaterThanOrEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIButtonBarButtonVisualProviderIOS addActiveConstraint:named:](self, "addActiveConstraint:named:", v16, CFSTR("BIB_Top_Top"));

  -[UIView bottomAnchor](self->super._button, "bottomAnchor");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_backIndicatorButton, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintGreaterThanOrEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIButtonBarButtonVisualProviderIOS addActiveConstraint:named:](self, "addActiveConstraint:named:", v18, CFSTR("BIB_Bottom_Bottom"));

}

- (void)_addVerticalConstraintsForImageWithInsets:(UIEdgeInsets)a3
{
  double bottom;
  double top;
  BOOL v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
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
  void *v28;
  id v29;

  bottom = a3.bottom;
  top = a3.top;
  if (!self->_imageButton)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3.top, a3.left, a3.bottom, a3.right);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIButtonBarButtonVisualProviderIOS.m"), 1337, CFSTR("Invalid image button configuration"));

  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    -[UIView lastBaselineAnchor](self->_imageButton, "lastBaselineAnchor", a3.top, a3.left, a3.bottom, a3.right);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView layoutMarginsGuide](self->super._button, "layoutMarginsGuide");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIButtonBarButtonVisualProviderIOS addActiveConstraint:named:](self, "addActiveConstraint:named:", v21, CFSTR("IB_Baseline_Baseline"));

    -[UIView topAnchor](self->_imageButton, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self->super._button, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintGreaterThanOrEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIButtonBarButtonVisualProviderIOS addActiveConstraint:named:](self, "addActiveConstraint:named:", v24, CFSTR("IB_Top_Top"));

    -[UIView bottomAnchor](self->super._button, "bottomAnchor");
    v29 = (id)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self->_imageButton, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintGreaterThanOrEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIButtonBarButtonVisualProviderIOS addActiveConstraint:named:](self, "addActiveConstraint:named:", v26, CFSTR("IB_Bottom_Bottom"));

  }
  else
  {
    v6 = bottom != 0.0 && top == 0.0;
    v7 = -bottom;
    if (v6)
      v8 = v7;
    else
      v8 = top;
    -[UIView centerYAnchor](self->_imageButton, "centerYAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](self->super._button, "centerYAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIButtonBarButtonVisualProviderIOS addActiveConstraint:named:](self, "addActiveConstraint:named:", v11, CFSTR("IB_CenterY_CenterY"));

    -[UIView topAnchor](self->_imageButton, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self->super._button, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintGreaterThanOrEqualToAnchor:constant:", v13, top);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIButtonBarButtonVisualProviderIOS addActiveConstraint:named:](self, "addActiveConstraint:named:", v14, CFSTR("IB_Top_Top"));

    -[UIView bottomAnchor](self->super._button, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self->_imageButton, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintGreaterThanOrEqualToAnchor:constant:", v16, v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIButtonBarButtonVisualProviderIOS addActiveConstraint:named:](self, "addActiveConstraint:named:", v17, CFSTR("IB_Bottom_Bottom"));

    -[_UIButtonBarButtonVisualProviderIOS activateHeightMinimizer](self, "activateHeightMinimizer");
  }
}

- (void)_addVerticalConstraintsForTextWithOffset:(double)a3
{
  id WeakRetained;
  int v6;
  _UIModernBarButton *titleButton;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  id v19;

  if (!self->_titleButton)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIButtonBarButtonVisualProviderIOS.m"), 1323, CFSTR("Invalid text button configuration"));

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
  v6 = objc_msgSend(WeakRetained, "centerTextButtons");

  titleButton = self->_titleButton;
  if (v6)
  {
    -[UIView centerYAnchor](titleButton, "centerYAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](self->super._button, "centerYAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIButtonBarButtonVisualProviderIOS addActiveConstraint:named:](self, "addActiveConstraint:named:", v10, CFSTR("TB_CenterY_CenterY"));
  }
  else
  {
    -[UIView lastBaselineAnchor](titleButton, "lastBaselineAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView layoutMarginsGuide](self->super._button, "layoutMarginsGuide");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bottomAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:constant:", v10, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIButtonBarButtonVisualProviderIOS addActiveConstraint:named:](self, "addActiveConstraint:named:", v11, CFSTR("TB_Baseline_Baseline"));

  }
  -[UIView topAnchor](self->_titleButton, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->super._button, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintGreaterThanOrEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIButtonBarButtonVisualProviderIOS addActiveConstraint:named:](self, "addActiveConstraint:named:", v14, CFSTR("TB_Top_Top"));

  -[UIView bottomAnchor](self->super._button, "bottomAnchor");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_titleButton, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintGreaterThanOrEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIButtonBarButtonVisualProviderIOS addActiveConstraint:named:](self, "addActiveConstraint:named:", v16, CFSTR("TB_Bottom_Bottom"));

}

- (void)_addHorizontalConstraintsForContentButton:(id)a3 titleOffset:(double)a4 backButtonLayoutInsets:(NSDirectionalEdgeInsets)a5
{
  double trailing;
  double leading;
  id WeakRetained;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  id v24;

  trailing = a5.trailing;
  leading = a5.leading;
  v24 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
  objc_msgSend(WeakRetained, "backButtonMargin");
  v11 = v10;

  -[UIView leadingAnchor](self->_backIndicatorButton, "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->super._button, "leadingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, v11 - leading);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIButtonBarButtonVisualProviderIOS addActiveConstraint:named:](self, "addActiveConstraint:named:", v14, CFSTR("BIB_Leading_Leading"));

  if (v24)
  {
    objc_msgSend(v24, "leadingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_backIndicatorButton, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, a4 + 6.0 - trailing);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIButtonBarButtonVisualProviderIOS addActiveConstraint:named:](self, "addActiveConstraint:named:", v17, CFSTR("BIB_Trailing_CB_Leading"));

    -[_UIButtonBarButtonVisualProviderIOS contentButtonTrailingOffset:](self, "contentButtonTrailingOffset:", 0.0);
    v19 = -v18;
    objc_msgSend(v24, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->super._button, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintLessThanOrEqualToAnchor:constant:", v21, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = CFSTR("CB_Trailing_Trailing");
  }
  else
  {
    -[UIView trailingAnchor](self->_backIndicatorButton, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->super._button, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintLessThanOrEqualToAnchor:constant:", v21, -trailing);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = CFSTR("BIB_Trailing_Trailing");
  }
  -[_UIButtonBarButtonVisualProviderIOS addActiveConstraint:named:](self, "addActiveConstraint:named:", v22, v23);

  -[_UIButtonBarButtonVisualProviderIOS activateWidthMinimizer](self, "activateWidthMinimizer");
}

- (void)_addHorizontalConstraintsForImageWithInsets:(UIEdgeInsets)a3 paddingEdges:(unint64_t)a4 additionalPadding:(double)a5
{
  double right;
  double left;
  double v10;
  double v11;
  UIUserInterfaceLayoutDirection v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  id WeakRetained;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v41;
  void *v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  id v48;

  right = a3.right;
  left = a3.left;
  -[_UIButtonBarButtonVisualProviderIOS _defaultPaddingForInsets:](self, "_defaultPaddingForInsets:", a3.top, a3.left, a3.bottom);
  v11 = v10;
  v12 = -[UIView effectiveUserInterfaceLayoutDirection](self->super._button, "effectiveUserInterfaceLayoutDirection");
  if (v12 == UIUserInterfaceLayoutDirectionRightToLeft)
    v13 = 8;
  else
    v13 = 2;
  if (v12 == UIUserInterfaceLayoutDirectionRightToLeft)
    v14 = 2;
  else
    v14 = 8;
  if (v12 == UIUserInterfaceLayoutDirectionRightToLeft)
    v15 = right;
  else
    v15 = left;
  if (v12 == UIUserInterfaceLayoutDirectionRightToLeft)
    v16 = left;
  else
    v16 = right;
  if ((v13 & a4) != 0)
  {
    v17 = v11 * 0.5 + a5;
    -[UIView leadingAnchor](self->_imageButton, "leadingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self->super._button, "leadingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintGreaterThanOrEqualToAnchor:constant:", v19, v17 + v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIButtonBarButtonVisualProviderIOS addActiveConstraint:named:](self, "addActiveConstraint:named:", v20, CFSTR("IB_Leading_Leading"));

    v21 = v17 + 0.0;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
    objc_msgSend(WeakRetained, "defaultEdgeSpacing");
    v24 = v15 + v23;

    -[UIView leadingAnchor](self->_imageButton, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self->super._button, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:constant:", v26, v24);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIButtonBarButtonVisualProviderIOS addActiveConstraint:named:](self, "addActiveConstraint:named:", v27, CFSTR("IB_Leading_Leading"));

    v17 = 0.0;
    v21 = 0.0;
  }
  if ((v14 & a4) != 0)
  {
    v28 = v11 * 0.5 + a5;
    -[UIView trailingAnchor](self->super._button, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_imageButton, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintGreaterThanOrEqualToAnchor:constant:", v30, v28 + v16);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIButtonBarButtonVisualProviderIOS addActiveConstraint:named:](self, "addActiveConstraint:named:", v31, CFSTR("IB_Trailing_Trailing"));

    v21 = v28 + v21;
  }
  else
  {
    v32 = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
    objc_msgSend(v32, "defaultEdgeSpacing");
    v34 = v16 + v33;

    -[UIView trailingAnchor](self->super._button, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_imageButton, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:constant:", v36, v34);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIButtonBarButtonVisualProviderIOS addActiveConstraint:named:](self, "addActiveConstraint:named:", v37, CFSTR("IB_Trailing_Trailing"));

    v28 = 0.0;
  }
  v38 = left + v17;
  v39 = right + v28;
  if (left + v17 != 0.0 || v39 == 0.0)
  {
    if (v39 == 0.0 && v38 != 0.0)
      left = left + v17;
  }
  else
  {
    left = -v39;
  }
  -[UIView centerXAnchor](self->_imageButton, "centerXAnchor", v38);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->super._button, "centerXAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:constant:", v42, left);
  v48 = (id)objc_claimAutoreleasedReturnValue();

  LODWORD(v43) = 1148829696;
  objc_msgSend(v48, "setPriority:", v43);
  -[_UIButtonBarButtonVisualProviderIOS addActiveConstraint:named:](self, "addActiveConstraint:named:", v48, CFSTR("IB_CenterX_CenterX"));
  -[_UIButtonBarButtonVisualProviderIOS activateWidthMinimizer](self, "activateWidthMinimizer");
  -[UIView widthAnchor](self->super._button, "widthAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView widthAnchor](self->_imageButton, "widthAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:constant:", v45, v21);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v47) = 1148829696;
  objc_msgSend(v46, "setPriority:", v47);
  -[_UIButtonBarButtonVisualProviderIOS addActiveConstraint:named:](self, "addActiveConstraint:named:", v46, CFSTR("IB_Width"));

}

- (double)_defaultPaddingForInsets:(UIEdgeInsets)a3
{
  double right;
  double left;
  id WeakRetained;
  uint64_t v6;
  double v7;

  right = a3.right;
  left = a3.left;
  WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
  v6 = objc_msgSend(WeakRetained, "barType");

  v7 = 10.0;
  if (v6 == 1)
    v7 = 22.0;
  return v7 - left - right;
}

- (void)activateWidthMinimizer
{
  id v3;

  -[_UIButtonBarButton widthMinimizingConstraint](self->super._button, "widthMinimizingConstraint");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_currentConstraints, "setObject:forKeyedSubscript:", v3, CFSTR("minimizeWidth"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_oldConstraints, "setObject:forKeyedSubscript:", 0, CFSTR("minimizeWidth"));

}

- (void)configureButton:(id)a3 fromBarButtonItem:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  int v9;
  char v10;
  char flags;
  void *v12;
  id WeakRetained;
  uint64_t v14;
  int v15;
  UIButton *v16;
  UIButton *v17;
  void *v18;
  void *backButtonMask;
  _UIBackButtonMaskView *v20;
  _UIBackButtonMaskView *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  UIButton *backIndicatorButton;
  id v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[4];
  id v54;
  _UIButtonBarButtonVisualProviderIOS *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  char v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "isSpringLoaded") & 1) != 0)
    v8 = 1;
  else
    v8 = objc_msgSend(v6, "isBackButton");
  objc_msgSend(v6, "setSpringLoaded:", v8);
  -[_UIButtonBarButtonVisualProviderIOS updateMenu](self, "updateMenu");
  v9 = objc_msgSend(v7, "isSystemItem");
  if (v9)
    v10 = 32;
  else
    v10 = 0;
  flags = *(_BYTE *)&self->_flags & 0xDF | v10;
  *(_BYTE *)&self->_flags = flags;
  if (v9)
  {
    self->_systemItem = objc_msgSend(v7, "systemItem");
    flags = (char)self->_flags;
  }
  *(_BYTE *)&self->_flags = flags & 0xFD;
  -[_UIButtonBarButtonVisualProviderIOS _computeTextAttributesForBarButtonItem:](self, "_computeTextAttributesForBarButtonItem:", v7);
  -[_UIButtonBarButtonVisualProviderIOS tintColor](self, "tintColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTintColor:", v12);

  WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
  v14 = objc_msgSend(WeakRetained, "compactMetrics");

  -[_UIButtonBarButtonVisualProviderIOS _configureImageOrTitleCompact:](self, "_configureImageOrTitleCompact:", v14);
  if (objc_msgSend(v6, "isBackButton"))
  {
    objc_msgSend(v6, "effectiveUserInterfaceLayoutDirection");
  }
  else
  {
    v15 = objc_msgSend(v7, "_showsChevron");
    objc_msgSend(v6, "effectiveUserInterfaceLayoutDirection");
    if (!v15)
    {
      -[UIView removeFromSuperview](self->_backIndicatorButton, "removeFromSuperview");
      backIndicatorButton = self->_backIndicatorButton;
      self->_backIndicatorButton = 0;

      -[UIView removeFromSuperview](self->_backButtonMask, "removeFromSuperview");
      v26 = 0;
      v18 = 0;
      backButtonMask = self->_backButtonMask;
      self->_backButtonMask = 0;
      goto LABEL_18;
    }
  }
  if (!self->_backIndicatorButton)
  {
    _newButton(self);
    v16 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v17 = self->_backIndicatorButton;
    self->_backIndicatorButton = v16;

  }
  -[_UIButtonBarButtonVisualProviderIOS _backIndicatorImageForCompact:](self, "_backIndicatorImageForCompact:", v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setImage:forState:](self->_backIndicatorButton, "setImage:forState:", v18, 0);
  -[_UIButtonBarButtonVisualProviderIOS _backIndicatorSymbolConfigurationForCompact:](self, "_backIndicatorSymbolConfigurationForCompact:", v14);
  backButtonMask = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setPreferredSymbolConfiguration:forImageInState:](self->_backIndicatorButton, "setPreferredSymbolConfiguration:forImageInState:", backButtonMask, 0);
  -[UIButton setTintColor:](self->_backIndicatorButton, "setTintColor:", 0);
  if (!self->_backButtonMask)
  {
    v20 = objc_alloc_init(_UIBackButtonMaskView);
    v21 = self->_backButtonMask;
    self->_backButtonMask = v20;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_backButtonMask, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  }
  -[_UIButtonBarButtonVisualProviderIOS _backIndicatorMaskForCompact:](self, "_backIndicatorMaskForCompact:", v14);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBackButtonMaskView maskImageView](self->_backButtonMask, "maskImageView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setImage:", v22);

  -[_UIButtonBarButtonVisualProviderIOS _backIndicatorMaskSymbolConfigurationForCompact:](self, "_backIndicatorMaskSymbolConfigurationForCompact:", v14);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBackButtonMaskView maskImageView](self->_backButtonMask, "maskImageView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setPreferredSymbolConfiguration:", v24);

  v26 = 1;
LABEL_18:

  -[_UIButtonBarButtonVisualProviderIOS _prepareBackgroundViewFromBarButtonItem:isBackButton:](self, "_prepareBackgroundViewFromBarButtonItem:isBackButton:", v7, v26);
  -[_UIButtonBarButtonVisualProviderIOS _updateViewsForMaskingEnabled](self, "_updateViewsForMaskingEnabled");
  -[_UIButtonBarButtonVisualProviderIOS _insetsForCompact:](self, "_insetsForCompact:", v14);
  objc_msgSend(v6, "setLayoutMargins:");
  v28 = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
  v29 = objc_msgSend(v28, "edgesPaddingBarButtonItem:", v7);

  v30 = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
  objc_msgSend(v30, "absorptionForItem:", v7);
  v32 = v31;

  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __73___UIButtonBarButtonVisualProviderIOS_configureButton_fromBarButtonItem___block_invoke;
  v53[3] = &unk_1E16B58A8;
  v60 = v26;
  v33 = v18;
  v54 = v33;
  v55 = self;
  v61 = v14;
  v34 = v7;
  v56 = v34;
  v57 = v29;
  v58 = v32;
  v59 = v14;
  -[_UIButtonBarButtonVisualProviderIOS updateActiveConstraints:](self, "updateActiveConstraints:", v53);
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  objc_msgSend(v34, "_gestureRecognizers");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v49, v63, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v50 != v38)
          objc_enumerationMutation(v35);
        objc_msgSend(v6, "addGestureRecognizer:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i));
      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v49, v63, 16);
    }
    while (v37);
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  objc_msgSend(v34, "_interactions");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v45, v62, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v46;
    do
    {
      for (j = 0; j != v42; ++j)
      {
        if (*(_QWORD *)v46 != v43)
          objc_enumerationMutation(v40);
        objc_msgSend(v6, "addInteraction:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * j));
      }
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v45, v62, 16);
    }
    while (v42);
  }

}

- (void)updateMenu
{
  UIBarButtonItem **p_barButtonItem;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id *v12;
  id *v13;
  _QWORD *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id menuProvider;
  id v20;
  char v21;
  id v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD aBlock[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id to;

  p_barButtonItem = &self->super._barButtonItem;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._barButtonItem);
  objc_msgSend(WeakRetained, "menu");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[_UIButtonBarButton isBackButton](self->super._button, "isBackButton"))
  {
    v6 = 0;
  }
  else
  {
    v7 = objc_loadWeakRetained((id *)p_barButtonItem);
    v6 = objc_msgSend(v7, "_menuIsPrimary");

  }
  v8 = objc_loadWeakRetained((id *)p_barButtonItem);
  objc_msgSend(v8, "_secondaryActionsProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_loadWeakRetained((id *)p_barButtonItem);
  objc_msgSend(v10, "_owningButtonGroup");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_copyWeak(&to, (id *)p_barButtonItem);
    if ((_DWORD)v6)
    {
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __49___UIButtonBarButtonVisualProviderIOS_updateMenu__block_invoke;
      v32[3] = &unk_1E16B58F8;
      v12 = &v33;
      v33 = v9;
      v13 = &v34;
      objc_copyWeak(&v34, &to);
      v14 = v32;
    }
    else
    {
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __49___UIButtonBarButtonVisualProviderIOS_updateMenu__block_invoke_2;
      v29[3] = &unk_1E16B58F8;
      v12 = &v30;
      v30 = v9;
      v13 = &v31;
      objc_copyWeak(&v31, &to);
      v14 = v29;
    }
    v18 = _Block_copy(v14);
    menuProvider = self->_menuProvider;
    self->_menuProvider = v18;

    objc_destroyWeak(v13);
    objc_destroyWeak(&to);
  }
  else
  {
    if (v5)
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __49___UIButtonBarButtonVisualProviderIOS_updateMenu__block_invoke_3;
      aBlock[3] = &unk_1E16B5118;
      v28 = v5;
      v15 = _Block_copy(aBlock);
      v16 = self->_menuProvider;
      self->_menuProvider = v15;

      v17 = v28;
    }
    else
    {
      if (v11)
      {
        v20 = objc_loadWeakRetained((id *)p_barButtonItem);
        v21 = objc_msgSend(v20, "_hasAction");

        if ((v21 & 1) == 0)
        {
          v25[0] = MEMORY[0x1E0C809B0];
          v25[1] = 3221225472;
          v25[2] = __49___UIButtonBarButtonVisualProviderIOS_updateMenu__block_invoke_4;
          v25[3] = &unk_1E16B5118;
          v26 = v11;
          v23 = _Block_copy(v25);
          v24 = self->_menuProvider;
          self->_menuProvider = v23;

          v6 = 1;
          goto LABEL_15;
        }
      }
      v17 = self->_menuProvider;
      self->_menuProvider = 0;
    }

  }
LABEL_15:
  v22 = objc_loadWeakRetained((id *)p_barButtonItem);
  -[_UIButtonBarButton setPreferredMenuElementOrder:](self->super._button, "setPreferredMenuElementOrder:", objc_msgSend(v22, "preferredMenuElementOrder"));

  -[UIControl setContextMenuInteractionEnabled:](self->super._button, "setContextMenuInteractionEnabled:", self->_menuProvider != 0);
  -[UIControl setShowsMenuAsPrimaryAction:](self->super._button, "setShowsMenuAsPrimaryAction:", v6);

}

- (void)updateActiveConstraints:(id)a3
{
  NSMutableDictionary **p_oldConstraints;
  NSMutableDictionary *oldConstraints;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary **p_currentConstraints;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void (**v13)(void);

  v13 = (void (**)(void))a3;
  p_oldConstraints = &self->_oldConstraints;
  oldConstraints = self->_oldConstraints;
  if (oldConstraints)
  {
    v6 = oldConstraints;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  p_currentConstraints = &self->_currentConstraints;
  objc_storeStrong((id *)p_oldConstraints, *p_currentConstraints);
  objc_storeStrong((id *)p_currentConstraints, v7);
  v13[2]();
  if (-[NSMutableDictionary count](*p_oldConstraints, "count"))
  {
    v9 = (void *)MEMORY[0x1E0D156E0];
    -[NSMutableDictionary allValues](*p_oldConstraints, "allValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deactivateConstraints:", v10);

    -[NSMutableDictionary removeAllObjects](*p_oldConstraints, "removeAllObjects");
  }
  if (-[NSMutableDictionary count](*p_currentConstraints, "count"))
  {
    v11 = (void *)MEMORY[0x1E0D156E0];
    -[NSMutableDictionary allValues](*p_currentConstraints, "allValues");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "activateConstraints:", v12);

  }
}

- (void)_updateViewsForMaskingEnabled
{
  char flags;
  UIImageView *backgroundView;
  _UIModernBarButton *titleButton;
  _UIBackButtonMaskView *backButtonMask;
  UIImageView *v7;
  uint64_t v8;
  UIImageView *v9;
  _UIModernBarButton *v10;
  _UIBackButtonMaskView *v11;
  UIButton *backIndicatorButton;
  UIImageView *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    backgroundView = 0;
  else
    backgroundView = self->_backgroundView;
  v9 = backgroundView;
  titleButton = self->_titleButton;
  if (!titleButton)
    titleButton = self->_imageButton;
  backButtonMask = self->_backButtonMask;
  v10 = titleButton;
  v11 = backButtonMask;
  backIndicatorButton = self->_backIndicatorButton;
  if ((flags & 2) != 0)
    v7 = self->_backgroundView;
  else
    v7 = 0;
  v13 = v7;
  -[UIView _ensureViewsAreInstalledInRelativeOrder:viewCount:insertionStartIndex:](self->super._button, "_ensureViewsAreInstalledInRelativeOrder:viewCount:insertionStartIndex:", &v9, 5, 0);
  -[UIView setHidden:](self->_backButtonMask, "setHidden:", (*(_BYTE *)&self->_flags & 2) == 0, v9, v10, v11, backIndicatorButton);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v8 = 18;
  else
    v8 = 0;
  -[UIView setCompositingMode:](self->_backgroundView, "setCompositingMode:", v8);
}

- (void)_prepareBackgroundViewFromBarButtonItem:(id)a3 isBackButton:(BOOL)a4
{
  _BOOL4 v4;
  id WeakRetained;
  unsigned int v7;
  uint64_t v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *backgroundImages;
  uint64_t v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  NSMutableDictionary *v20;
  void *v21;
  void *v22;
  UIImageView *backgroundView;
  UIImageView *v24;
  UIImageView *v25;
  void *v26;
  id v27;

  v4 = a4;
  v27 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
  v7 = objc_msgSend(WeakRetained, "compactMetrics");

  v8 = v7;
  if (!self->_backgroundImages)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    backgroundImages = self->_backgroundImages;
    self->_backgroundImages = v9;

  }
  v11 = 0;
  v12 = *MEMORY[0x1E0C9D820];
  v13 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  do
  {
    v14 = qword_186679238[v11];
    if (v4)
    {
      objc_msgSend(v27, "backButtonBackgroundImageForState:barMetrics:", qword_186679238[v11], v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        -[_UIButtonBarButtonVisualProviderIOS backButtonBackgroundImageForState:compact:](self, "backButtonBackgroundImageForState:compact:", v14, v8);
        v16 = objc_claimAutoreleasedReturnValue();
LABEL_9:
        v15 = (void *)v16;
        if (!v16)
        {
          objc_msgSend(v27, "_backgroundImageForState:compact:type:", v14, v8, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v15)
            goto LABEL_16;
        }
      }
    }
    else
    {
      objc_msgSend(v27, "backgroundImageForState:style:barMetrics:", qword_186679238[v11], ((unint64_t)*(_BYTE *)&self->_flags >> 2) & 7, v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        -[_UIButtonBarButtonVisualProviderIOS backgroundImageForState:compact:](self, "backgroundImageForState:compact:", v14, v8);
        v16 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
    }
    objc_msgSend(v15, "size");
    if (v18 != v12 || v17 != v13)
    {
      v20 = self->_backgroundImages;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v20, "setObject:forKey:", v15, v21);

    }
LABEL_16:

    ++v11;
  }
  while (v11 != 3);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_backgroundImages, "objectForKeyedSubscript:", &unk_1E1A96DB0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  backgroundView = self->_backgroundView;
  if (v22)
  {
    if (!backgroundView)
    {
      v24 = objc_alloc_init(UIImageView);
      -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIImageView setContentMode:](v24, "setContentMode:", 0);
      -[UIView insertSubview:atIndex:](self->super._button, "insertSubview:atIndex:", v24, 0);
      v25 = self->_backgroundView;
      self->_backgroundView = v24;

    }
    -[NSMutableDictionary objectForKeyedSubscript:](self->_backgroundImages, "objectForKeyedSubscript:", &unk_1E1A96DB0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_backgroundView, "setImage:", v26);
LABEL_23:

  }
  else if (backgroundView)
  {
    -[UIView removeFromSuperview](backgroundView, "removeFromSuperview");
    v26 = self->_backgroundView;
    self->_backgroundView = 0;
    goto LABEL_23;
  }

}

- (id)backgroundImageForState:(unint64_t)a3 compact:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  id WeakRetained;
  void *v12;

  v4 = a4;
  -[_UIButtonBarButton appearanceData](self->super._button, "appearanceData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if ((a3 & 1) != 0)
      v9 = 1;
    else
      v9 = a3 & 2;
    objc_msgSend(v7, "backgroundImageForState:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
    objc_msgSend(WeakRetained, "appearanceStorage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "backgroundImageForState:style:isMini:", a3, ((unint64_t)*(_BYTE *)&self->_flags >> 2) & 7, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (UIEdgeInsets)_insetsForCompact:(BOOL)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = 16.0;
  if (a3)
    v3 = 11.0;
  v4 = 0.0;
  v5 = 0.0;
  v6 = v3;
  result.right = v5;
  result.bottom = v6;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)_configureImageOrTitleCompact:(BOOL)a3
{
  _BOOL8 v3;
  _UIModernBarButton *imageButton;
  id WeakRetained;
  void *v7;
  _UIModernBarButton *v8;
  _UIModernBarButton *v9;
  id v10;
  id v11;
  _UIModernBarButton *titleButton;
  _UIModernBarButton *v13;
  _UIModernBarButton *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _UIModernBarButton *v19;
  _UIModernBarButton *v20;
  _UIModernBarButton *v21;
  void *v22;
  id v23;
  id v24;
  char v25;
  double v26;
  double v27;
  BOOL v28;
  id v29;
  id v30;
  char v31;
  id v32;
  NSArray *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  NSArray *titleContent;
  id v40;
  void *v41;
  id v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, void *);
  void *v54;
  id v55;
  _QWORD v56[3];
  CGRect v57;
  CGRect v58;

  v3 = a3;
  v56[2] = *MEMORY[0x1E0C80C00];
  if (-[_UIButtonBarButton isBreadcrumb](self->super._button, "isBreadcrumb"))
  {
    -[UIView removeFromSuperview](self->_imageButton, "removeFromSuperview");
    imageButton = self->_imageButton;
    self->_imageButton = 0;

    -[_UIButtonBarButtonVisualProviderIOS _removeTitleButton](self, "_removeTitleButton");
    return;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->super._barButtonItem);
  objc_msgSend(WeakRetained, "_imageForState:compact:type:", 0, v3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_UIButtonBarButtonVisualProviderIOS _removeTitleButton](self, "_removeTitleButton");
    v8 = self->_imageButton;
    if (v8)
    {
      -[UIButton setNeedsLayout](v8, "setNeedsLayout");
    }
    else
    {
      _newButton(self);
      v13 = (_UIModernBarButton *)objc_claimAutoreleasedReturnValue();
      v14 = self->_imageButton;
      self->_imageButton = v13;

      v15 = objc_loadWeakRetained((id *)&self->super._barButtonItem);
      objc_msgSend(v15, "_additionalSelectionInsets");
      -[_UIModernBarButton _setAdditionalSelectionInsets:](self->_imageButton, "_setAdditionalSelectionInsets:");

      -[_UIModernBarButton _setupForUseAsImageButton](self->_imageButton, "_setupForUseAsImageButton");
    }
    v16 = objc_loadWeakRetained((id *)&self->super._barButtonItem);
    -[UIButton setEnabled:](self->_imageButton, "setEnabled:", objc_msgSend(v16, "isEnabled"));

    v11 = v7;
    *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | objc_msgSend(v11, "hasBaseline");
    -[_UIButtonBarButtonVisualProviderIOS symbolConfigurationCompact:](self, "symbolConfigurationCompact:", v3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](self->_imageButton, "setImage:forState:", v11, 0);
    -[UIButton setPreferredSymbolConfiguration:forImageInState:](self->_imageButton, "setPreferredSymbolConfiguration:forImageInState:", v17, 0);
    -[UIButton setImage:forState:](self->_imageButton, "setImage:forState:", v11, 2);
    -[_UIModernBarButton _setGuardAgainstDegenerateBaselineCalculation:](self->_imageButton, "_setGuardAgainstDegenerateBaselineCalculation:", 1);
    v18 = objc_loadWeakRetained((id *)&self->super._barButtonItem);
    -[UIControl setSymbolAnimationEnabled:](self->_imageButton, "setSymbolAnimationEnabled:", objc_msgSend(v18, "isSymbolAnimationEnabled"));

    goto LABEL_35;
  }
  -[UIView removeFromSuperview](self->_imageButton, "removeFromSuperview");
  v9 = self->_imageButton;
  self->_imageButton = 0;

  *(_BYTE *)&self->_flags &= ~1u;
  v10 = objc_loadWeakRetained((id *)&self->super._barButtonItem);
  objc_msgSend(v10, "resolvedTitle");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    titleButton = self->_titleButton;
    if (titleButton)
    {
      -[UIButton setNeedsLayout](self->_titleButton, "setNeedsLayout");
    }
    else
    {
      _newButton(self);
      v19 = (_UIModernBarButton *)objc_claimAutoreleasedReturnValue();
      v20 = self->_titleButton;
      self->_titleButton = v19;

      v21 = self->_titleButton;
      v56[0] = 0x1E1A99540;
      v56[1] = 0x1E1A995A0;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[UIView _registerForTraitTokenChanges:withTarget:action:](v21, "_registerForTraitTokenChanges:withTarget:action:", v22, self, sel__updateTextContent);

    }
    v24 = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
    v25 = objc_msgSend(v24, "centerTextButtons");

    v26 = 0.0;
    v27 = 0.0;
    if ((v25 & 1) == 0)
    {
      v28 = -[_UIButtonBarButton isBackButton](self->super._button, "isBackButton", 0.0);
      v27 = 0.0;
      if (!v28)
      {
        v29 = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
        v30 = objc_loadWeakRetained((id *)&self->super._barButtonItem);
        v31 = objc_msgSend(v29, "edgesPaddingBarButtonItem:", v30);

        if ((v31 & 8) != 0)
          v27 = 3.0;
        else
          v27 = 0.0;
      }
      v26 = 1.0;
      if (v3)
        v26 = 3.0;
    }
    -[UIButton setContentEdgeInsets:](self->_titleButton, "setContentEdgeInsets:", v26, 0.0, 0.0, v27);
    v32 = objc_loadWeakRetained((id *)&self->super._barButtonItem);
    -[UIButton setEnabled:](self->_titleButton, "setEnabled:", objc_msgSend(v32, "isEnabled"));

    if (titleButton && (v33 = self->_titleContent) != 0)
    {
      -[NSArray firstObject](v33, "firstObject");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "title");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "isEqualToString:", v11);

      -[_UIButtonBarButtonVisualProviderIOS _setupAlternateTitles](self, "_setupAlternateTitles");
      if (v36 && self->_titleContent)
      {
        -[UIButton attributedTitleForState:](self->_titleButton, "attributedTitleForState:", 0);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "string");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (v38)
        {
          titleContent = self->_titleContent;
          v51 = MEMORY[0x1E0C809B0];
          v52 = 3221225472;
          v53 = __69___UIButtonBarButtonVisualProviderIOS__configureImageOrTitleCompact___block_invoke;
          v54 = &unk_1E16B5860;
          v40 = v38;
          v55 = v40;
          if (-[NSArray indexOfObjectPassingTest:](titleContent, "indexOfObjectPassingTest:", &v51) == 0x7FFFFFFFFFFFFFFFLL)
            v41 = v11;
          else
            v41 = v40;
          v42 = v41;

        }
        else
        {
          v42 = v11;
        }

LABEL_31:
        -[_UIButtonBarButtonVisualProviderIOS _setTitle:](self, "_setTitle:", v42, v51, v52, v53, v54);
        if (-[UIView translatesAutoresizingMaskIntoConstraints](self->super._button, "translatesAutoresizingMaskIntoConstraints"))
        {
          -[UIView layoutMargins](self->_titleButton, "layoutMargins");
          v43 = *MEMORY[0x1E0C9D538];
          v44 = *(double *)(MEMORY[0x1E0C9D538] + 8);
          v47 = v45 + v46;
          v50 = v48 + v49;
          -[UIView bounds](self->super._button, "bounds");
          v58.origin.x = v43;
          v58.origin.y = v44;
          v58.size.width = v47;
          v58.size.height = v50;
          if (!CGRectContainsRect(v57, v58))
            -[_UIButtonBarButton setBounds:](self->super._button, "setBounds:", v43, v44, v47, v50);
        }
        -[UIView layoutIfNeeded](self->_titleButton, "layoutIfNeeded");

        goto LABEL_35;
      }
    }
    else
    {
      -[_UIButtonBarButtonVisualProviderIOS _setupAlternateTitles](self, "_setupAlternateTitles");
    }
    v42 = v11;
    goto LABEL_31;
  }
  -[_UIButtonBarButtonVisualProviderIOS _removeTitleButton](self, "_removeTitleButton");
LABEL_35:

}

- (void)_computeTextAttributesForBarButtonItem:(id)a3
{
  id v4;
  UIColor *v5;
  UIColor *tintColor;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSArray *v16;
  NSArray *barButtonTitleAttributes;
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xE3 | (4 * (objc_msgSend(v4, "style") & 7));
  objc_msgSend(v4, "tintColor");
  v5 = (UIColor *)objc_claimAutoreleasedReturnValue();
  tintColor = self->_tintColor;
  self->_tintColor = v5;

  objc_msgSend(v4, "titleTextAttributesForState:", 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = (void *)MEMORY[0x1E0C9AA70];
  if (v7)
    v10 = v7;
  else
    v10 = MEMORY[0x1E0C9AA70];
  objc_msgSend(v4, "titleTextAttributesForState:", 1, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = v11;
  else
    v13 = (uint64_t)v9;
  v18[1] = v13;
  objc_msgSend(v4, "titleTextAttributesForState:", 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    v15 = v14;
  else
    v15 = v9;
  v18[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
  v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
  barButtonTitleAttributes = self->_barButtonTitleAttributes;
  self->_barButtonTitleAttributes = v16;

  -[_UIButtonBarButtonVisualProviderIOS _computeTextAttributes](self, "_computeTextAttributes");
}

- (void)_computeTextAttributes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
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
  NSArray *v30;
  NSArray *finalTitleAttributes;
  NSArray *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];

  v36[3] = *MEMORY[0x1E0C80C00];
  -[_UIButtonBarButton appearanceData](self->super._button, "appearanceData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "titleTextAttributesForState:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "titleTextAttributesForState:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v4;
    objc_msgSend(v4, "titleTextAttributesForState:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[_UIBarButtonItemData standardItemDataForStyle:](_UIBarButtonItemData, "standardItemDataForStyle:", ((unint64_t)*(_BYTE *)&self->_flags >> 2) & 7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "titleTextAttributesForState:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
    objc_msgSend(WeakRetained, "appearanceStorage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "textAttributesForState:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _finalAttributesFromSources(v9, v12, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "titleTextAttributesForState:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
    objc_msgSend(v14, "appearanceStorage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "textAttributesForState:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _finalAttributesFromSources(v13, v16, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = v8;
    objc_msgSend(v8, "titleTextAttributesForState:", 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
    objc_msgSend(v18, "appearanceStorage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "textAttributesForState:", 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    _finalAttributesFromSources(v17, v20, 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[_UIButtonBarButtonVisualProviderIOS tintColor](self, "tintColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView traitCollection](self->super._button, "traitCollection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndexedSubscript:](self->_barButtonTitleAttributes, "objectAtIndexedSubscript:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v5;
  _finalAttributesFromSources(v5, v23, v21, v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSArray objectAtIndexedSubscript:](self->_barButtonTitleAttributes, "objectAtIndexedSubscript:", 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v6;
  _finalAttributesFromSources(v6, v25, v21, v22);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSArray objectAtIndexedSubscript:](self->_barButtonTitleAttributes, "objectAtIndexedSubscript:", 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIColor _disabledColorForColor:]((uint64_t)UIColor, v21);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  _finalAttributesFromSources(v7, v27, v28, v22);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v36[0] = v24;
  v36[1] = v26;
  v36[2] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 3);
  v30 = (NSArray *)objc_claimAutoreleasedReturnValue();
  finalTitleAttributes = self->_finalTitleAttributes;
  if (finalTitleAttributes && !-[NSArray isEqualToArray:](finalTitleAttributes, "isEqualToArray:", v30))
    -[NSMutableDictionary removeAllObjects](self->_titleLookup, "removeAllObjects");
  v32 = self->_finalTitleAttributes;
  self->_finalTitleAttributes = v30;

}

- (id)tintColor
{
  UIColor *v3;
  id WeakRetained;
  void *v5;
  id v6;

  v3 = self->_tintColor;
  if (!v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
    objc_msgSend(WeakRetained, "appearanceStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tintColor");
    v3 = (UIColor *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      v6 = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
      objc_msgSend(v6, "tintColor");
      v3 = (UIColor *)objc_claimAutoreleasedReturnValue();

      if (!v3)
      {
        -[UIView tintColor](self->super._button, "tintColor");
        v3 = (UIColor *)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  return v3;
}

- (id)backButtonBackgroundImageForState:(unint64_t)a3 compact:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  id WeakRetained;
  void *v12;

  v4 = a4;
  -[_UIButtonBarButton appearanceData](self->super._button, "appearanceData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if ((a3 & 1) != 0)
      v9 = 1;
    else
      v9 = a3 & 2;
    objc_msgSend(v7, "backgroundImageForState:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
    objc_msgSend(WeakRetained, "appearanceStorage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "backButtonBackgroundImageForState:isMini:", a3, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (void)_removeTitleButton
{
  NSLayoutConstraint *backButtonTitleMaxWidthConstraint;
  _UIModernBarButton *titleButton;

  backButtonTitleMaxWidthConstraint = self->_backButtonTitleMaxWidthConstraint;
  self->_backButtonTitleMaxWidthConstraint = 0;

  -[UIView removeFromSuperview](self->_titleButton, "removeFromSuperview");
  titleButton = self->_titleButton;
  self->_titleButton = 0;

}

- (UIOffset)titlePositionOffsetForCompact:(BOOL)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UIOffset result;

  -[_UIButtonBarButton appearanceData](self->super._button, "appearanceData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "titlePositionAdjustmentForState:", 0);
    v8 = v7;
    v10 = v9;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
    objc_msgSend(WeakRetained, "appearanceStorage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3)
      objc_msgSend(v12, "miniTitlePositionOffset");
    else
      objc_msgSend(v12, "titlePositionOffset");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "UIOffsetValue");
      v8 = v15;
      v10 = v16;
    }
    else
    {
      v8 = 0.0;
      v10 = 0.0;
    }

  }
  v17 = v8;
  v18 = v10;
  result.vertical = v18;
  result.horizontal = v17;
  return result;
}

- (UIOffset)backButtonTitlePositionOffsetForCompact:(BOOL)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UIOffset result;

  -[_UIButtonBarButton appearanceData](self->super._button, "appearanceData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "titlePositionAdjustmentForState:", 0);
    v8 = v7;
    v10 = v9;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
    objc_msgSend(WeakRetained, "appearanceStorage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3)
      objc_msgSend(v12, "miniBackButtonTitlePositionOffset");
    else
      objc_msgSend(v12, "backButtonTitlePositionOffset");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "UIOffsetValue");
      v8 = v15;
      v10 = v16;
    }
    else
    {
      v8 = 0.0;
      v10 = 0.0;
    }

  }
  v17 = v8;
  v18 = v10;
  result.vertical = v18;
  result.horizontal = v17;
  return result;
}

- (UIOffset)backButtonBackgroundVerticalAdjustmentForCompact:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id WeakRetained;
  void *v12;
  double v13;
  double v14;
  double v15;
  UIOffset result;

  v3 = a3;
  -[_UIButtonBarButton appearanceData](self->super._button, "appearanceData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "backgroundImagePositionAdjustmentForState:", 0);
    v8 = v7;
    v10 = v9;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
    objc_msgSend(WeakRetained, "appearanceStorage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "backButtonBackgroundVerticalAdjustmentForBarMetrics:", v3);
    v10 = v13;
    v8 = 0.0;

  }
  v14 = v8;
  v15 = v10;
  result.vertical = v15;
  result.horizontal = v14;
  return result;
}

- (void)_addConstraintsForBackgroundViewWithOffset:(double)a3 isBackButton:(BOOL)a4 resizesImage:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  _UIModernBarButton *imageButton;
  _UIModernBarButton *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  UIImageView *backgroundView;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  _UIModernBarButton *v26;

  v5 = a5;
  v6 = a4;
  imageButton = self->_imageButton;
  if (imageButton)
  {
    v10 = imageButton;
  }
  else
  {
    v10 = self->_titleButton;
    if (!v10)
      return;
  }
  v26 = v10;
  if (v6 && self->_backIndicatorButton)
  {
    -[UIView leadingAnchor](self->_backgroundView, "leadingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self->_backIndicatorButton, "leadingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, -3.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = CFSTR("BGI_Leading_BIB_Leading");
  }
  else
  {
    -[UIView leadingAnchor](self->_backgroundView, "leadingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v26, "leadingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, -3.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = CFSTR("BGI_Leading_CB_Leading");
  }
  -[_UIButtonBarButtonVisualProviderIOS addActiveConstraint:named:](self, "addActiveConstraint:named:", v13, v14);

  -[UIView trailingAnchor](self->_backgroundView, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](v26, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, 3.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIButtonBarButtonVisualProviderIOS addActiveConstraint:named:](self, "addActiveConstraint:named:", v17, CFSTR("BGI_Trailing_CB_Trailing"));

  backgroundView = self->_backgroundView;
  if (v5)
  {
    -[UIView topAnchor](backgroundView, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v26, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, a3 + -3.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIButtonBarButtonVisualProviderIOS addActiveConstraint:named:](self, "addActiveConstraint:named:", v21, CFSTR("BGI_Top_CB_Top"));

    -[UIView bottomAnchor](self->_backgroundView, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v26, "bottomAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, a3 + 3.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = CFSTR("BGI_Bottom_CB_Bottom");
  }
  else
  {
    -[UIView centerYAnchor](backgroundView, "centerYAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](v26, "centerYAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, a3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = CFSTR("BGI_Center_CB_Center");
  }
  -[_UIButtonBarButtonVisualProviderIOS addActiveConstraint:named:](self, "addActiveConstraint:named:", v24, v25);

}

- (UIEdgeInsets)_imageInsetsForBarButtonItem:(id)a3 compact:(BOOL)a4 isBackButton:(BOOL)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
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
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  UIEdgeInsets result;

  v6 = a4;
  v8 = a3;
  -[UIButton currentImage](self->_imageButton, "currentImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "alignmentRectInsets");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v19 = 0.0;
    v20 = 0.0;
    v21 = 0.0;
    v22 = 0.0;
    v23 = 0.0;
    if (v8)
    {
      if (v6)
        objc_msgSend(v8, "landscapeImagePhoneInsets", 0.0);
      else
        objc_msgSend(v8, "imageInsets", 0.0);
      v22 = v24;
      v20 = v25;
    }
    v30 = v12 + v23;
    v31 = v16 + v21;
    if (!a5)
    {
      -[_UIButtonBarButtonVisualProviderIOS backgroundVerticalAdjustmentForCompact:](self, "backgroundVerticalAdjustmentForCompact:", v6);
      v19 = v32;
      if (fabs(v32) < 2.22044605e-16)
      {
        objc_msgSend(v8, "backgroundVerticalPositionAdjustmentForBarMetrics:", v6);
        v19 = v33;
      }
    }
    v28 = v14 + v22;
    v26 = v18 + v20;
    v34 = v30 + v19;
    v35 = v31 - v19;
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "scale");
    v38 = v37;

    UIRoundToScale(1.0 / v38, v38);
    v29 = v34 - v39;
    v27 = v35 - v39;
  }
  else
  {
    v26 = 0.0;
    v27 = 0.0;
    v28 = 0.0;
    v29 = 0.0;
  }

  v40 = v29;
  v41 = v28;
  v42 = v27;
  v43 = v26;
  result.right = v43;
  result.bottom = v42;
  result.left = v41;
  result.top = v40;
  return result;
}

- (UIOffset)backgroundVerticalAdjustmentForCompact:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id WeakRetained;
  void *v12;
  double v13;
  double v14;
  double v15;
  UIOffset result;

  v3 = a3;
  -[_UIButtonBarButton appearanceData](self->super._button, "appearanceData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "backgroundImagePositionAdjustmentForState:", 0);
    v8 = v7;
    v10 = v9;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
    objc_msgSend(WeakRetained, "appearanceStorage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "backgroundVerticalAdjustmentForBarMetrics:", v3);
    v10 = v13;
    v8 = 0.0;

  }
  v14 = v8;
  v15 = v10;
  result.vertical = v15;
  result.horizontal = v14;
  return result;
}

- (id)_backIndicatorImageForCompact:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;

  -[_UIButtonBarButton appearanceData](self->super._button, "appearanceData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    goto LABEL_6;
  if (a3)
    objc_msgSend(v5, "compactBackIndicatorImage");
  else
    objc_msgSend(v5, "backIndicatorImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
LABEL_6:
    WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
    objc_msgSend(WeakRetained, "backIndicatorImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      +[_UIBarButtonItemData standardBackButtonData](_UIBarButtonItemData, "standardBackButtonData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (a3)
        objc_msgSend(v9, "compactBackIndicatorImage");
      else
        objc_msgSend(v9, "backIndicatorImage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  objc_msgSend(v7, "imageFlippedForRightToLeftLayoutDirection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_backIndicatorMaskSymbolConfigurationForCompact:(BOOL)a3
{
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;

  if (dyld_program_sdk_at_least())
  {
    -[_UIButtonBarButton appearanceData](self->super._button, "appearanceData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
      objc_msgSend(WeakRetained, "backIndicatorImage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v5 = 0;
      }
      else
      {
        +[_UIBarButtonItemData standardBackButtonData](_UIBarButtonItemData, "standardBackButtonData");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    if (a3)
      objc_msgSend(v5, "compactBackIndicatorTransitionMaskSymbolConfiguration");
    else
      objc_msgSend(v5, "backIndicatorTransitionMaskSymbolConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)_backIndicatorSymbolConfigurationForCompact:(BOOL)a3
{
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;

  if (dyld_program_sdk_at_least())
  {
    -[_UIButtonBarButton appearanceData](self->super._button, "appearanceData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
      objc_msgSend(WeakRetained, "backIndicatorImage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v5 = 0;
      }
      else
      {
        +[_UIBarButtonItemData standardBackButtonData](_UIBarButtonItemData, "standardBackButtonData");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    if (a3)
      objc_msgSend(v5, "compactBackIndicatorSymbolConfiguration");
    else
      objc_msgSend(v5, "backIndicatorSymbolConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)_backIndicatorMaskForCompact:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;

  -[_UIButtonBarButton appearanceData](self->super._button, "appearanceData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    goto LABEL_6;
  if (a3)
    objc_msgSend(v5, "compactBackIndicatorTransitionMaskImage");
  else
    objc_msgSend(v5, "backIndicatorTransitionMaskImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
LABEL_6:
    WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
    objc_msgSend(WeakRetained, "backIndicatorMaskImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      +[_UIBarButtonItemData standardBackButtonData](_UIBarButtonItemData, "standardBackButtonData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "compactBackIndicatorTransitionMaskImage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  objc_msgSend(v7, "imageFlippedForRightToLeftLayoutDirection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)symbolConfigurationCompact:(BOOL)a3
{
  void *v5;
  void *v6;

  -[_UIButtonBarButton appearanceData](self->super._button, "appearanceData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[_UIBarButtonItemData standardItemDataForStyle:](_UIBarButtonItemData, "standardItemDataForStyle:", ((unint64_t)*(_BYTE *)&self->_flags >> 2) & 7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (a3)
    objc_msgSend(v5, "compactImageSymbolConfiguration");
  else
    objc_msgSend(v5, "imageSymbolConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (Class)buttonControlClass
{
  return (Class)objc_opt_class();
}

- (void)buttonLayoutSubviews:(id)a3 baseImplementation:(id)a4
{
  void (**v6)(_QWORD);
  _UIButtonBarAppearanceDelegate **p_appearanceDelegate;
  id WeakRetained;
  double v9;
  double v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;
  double v14;
  _BOOL4 v15;
  void *v16;
  int v17;
  id v18;
  char v19;
  id v20;
  id v21;

  v21 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (!self->_titleContent)
    goto LABEL_16;
  -[UIView _nsis_bounds](self->_titleButton, "_nsis_bounds");
  p_appearanceDelegate = &self->_appearanceDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
  objc_msgSend(WeakRetained, "backButtonMaximumWidth");

  UIRoundToViewScale(self->_titleButton);
  v10 = v9;
  if (-[NSArray count](self->_titleContent, "count"))
  {
    v11 = 0;
    v12 = &stru_1E16EDF20;
    while (1)
    {
      -[NSArray objectAtIndexedSubscript:](self->_titleContent, "objectAtIndexedSubscript:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "width");
      if (v14 <= v10)
        break;

      if (++v11 >= -[NSArray count](self->_titleContent, "count"))
      {
        v15 = 0;
        v13 = 0;
        goto LABEL_11;
      }
    }
    v15 = v11 != 0;
    if (v13)
    {
      objc_msgSend(v13, "title");
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
  }
  else
  {
    v15 = 0;
    v13 = 0;
  }
  v12 = &stru_1E16EDF20;
LABEL_11:
  -[UIButton titleForState:](self->_titleButton, "titleForState:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v16, "length"))
  {
    -[_UIButtonBarButtonVisualProviderIOS _setTitle:](self, "_setTitle:", v12);

LABEL_16:
    v6[2](v6);
    goto LABEL_17;
  }
  v17 = v15 & (objc_msgSend(v16, "isEqualToString:", v12) ^ 1);
  -[_UIButtonBarButtonVisualProviderIOS _setTitle:](self, "_setTitle:", v12);

  v6[2](v6);
  if (v17 == 1)
  {
    v18 = objc_loadWeakRetained((id *)p_appearanceDelegate);
    v19 = objc_opt_respondsToSelector();

    if ((v19 & 1) != 0)
    {
      v20 = objc_loadWeakRetained((id *)p_appearanceDelegate);
      objc_msgSend(v20, "backButtonTitleDidChange");

    }
  }
LABEL_17:

}

- (BOOL)canUpdateMenuInPlace
{
  return 1;
}

- (void)_setupAlternateTitles
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSArray *titleContent;
  NSArray *v9;
  double v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *titleLookup;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  BOOL v22;
  NSArray *v23;
  NSArray *v24;
  NSUInteger v25;
  char v26;
  void *v27;
  double v28;
  double v29;
  id *p_backButtonTitleMaxWidthConstraint;
  NSLayoutConstraint *backButtonTitleMaxWidthConstraint;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v35;
  char v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (!self->_titleButton)
  {
    titleContent = self->_titleContent;
    self->_titleContent = 0;

    return;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->super._barButtonItem);
  objc_msgSend(WeakRetained, "_backButtonAlternateTitles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_opt_new();
    v6 = objc_loadWeakRetained((id *)&self->super._barButtonItem);
    objc_msgSend(v6, "resolvedTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      v36 = objc_msgSend(v4, "containsObject:", v7);
    else
      v36 = 0;
    if (!self->_titleLookup)
    {
      v11 = (NSMutableDictionary *)objc_opt_new();
      titleLookup = self->_titleLookup;
      self->_titleLookup = v11;

    }
    if (v7)
    {
      -[_UIButtonBarButtonVisualProviderIOS _titleContentForTitle:](self, "_titleContentForTitle:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v13);

    }
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v14 = v4;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v38 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
          -[_UIButtonBarButtonVisualProviderIOS _titleContentForTitle:](self, "_titleContentForTitle:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v5, "indexOfObject:inSortedRange:options:usingComparator:", v20, 0, objc_msgSend(v5, "count"), 1024, &__block_literal_global_50);
          if (v19)
            v22 = v21 == 0;
          else
            v22 = 0;
          if (!v22)
            objc_msgSend(v5, "insertObject:atIndex:", v20, v21);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v16);
    }

    v23 = (NSArray *)objc_msgSend(v5, "copy");
    v24 = self->_titleContent;
    self->_titleContent = v23;

    v25 = -[NSArray count](self->_titleContent, "count");
    v26 = v36 ^ 1;
    if (!v7)
      v26 = 0;
    if ((v26 & 1) != 0)
    {
      if (v25 > 1)
        goto LABEL_28;
    }
    else if (v25)
    {
LABEL_28:
      LODWORD(v10) = 1132068864;
      -[UIView setContentCompressionResistancePriority:forAxis:](self->_titleButton, "setContentCompressionResistancePriority:forAxis:", 0, v10);
      -[NSArray firstObject](self->_titleContent, "firstObject");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "width");
      v29 = v28;

      p_backButtonTitleMaxWidthConstraint = (id *)&self->_backButtonTitleMaxWidthConstraint;
      backButtonTitleMaxWidthConstraint = self->_backButtonTitleMaxWidthConstraint;
      if (backButtonTitleMaxWidthConstraint)
      {
        -[NSLayoutConstraint setConstant:](backButtonTitleMaxWidthConstraint, "setConstant:", v29);
      }
      else
      {
        -[UIView widthAnchor](self->_titleButton, "widthAnchor");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "constraintLessThanOrEqualToConstant:", v29);
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = *p_backButtonTitleMaxWidthConstraint;
        *p_backButtonTitleMaxWidthConstraint = (id)v34;

      }
      v32 = 1;
      goto LABEL_34;
    }
  }
  else
  {
    v9 = self->_titleContent;
    self->_titleContent = 0;

  }
  LODWORD(v10) = 1144913920;
  -[UIView setContentCompressionResistancePriority:forAxis:](self->_titleButton, "setContentCompressionResistancePriority:forAxis:", 0, v10);
  v32 = 0;
  p_backButtonTitleMaxWidthConstraint = (id *)&self->_backButtonTitleMaxWidthConstraint;
LABEL_34:
  objc_msgSend(*p_backButtonTitleMaxWidthConstraint, "setActive:", v32);

}

- (id)_titleContentForTitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_titleLookup, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[NSArray objectAtIndexedSubscript:](self->_finalTitleAttributes, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UITitleContent contentWithTitle:attributes:button:](_UITitleContent, "contentWithTitle:attributes:button:", v4, v6, self->_titleButton);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_titleLookup, "setObject:forKeyedSubscript:", v5, v4);
  }

  return v5;
}

- (id)buttonSpringLoadedInteractionEffect
{
  return (id)objc_opt_new();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_menuProvider, 0);
  objc_storeStrong((id *)&self->_backButtonTitleMaxWidthConstraint, 0);
  objc_storeStrong((id *)&self->_titleLookup, 0);
  objc_storeStrong((id *)&self->_titleContent, 0);
  objc_storeStrong((id *)&self->_backgroundImages, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_finalTitleAttributes, 0);
  objc_storeStrong((id *)&self->_barButtonTitleAttributes, 0);
  objc_destroyWeak((id *)&self->_appearanceDelegate);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_imageButton, 0);
  objc_storeStrong((id *)&self->_titleButton, 0);
  objc_storeStrong((id *)&self->_backButtonMask, 0);
  objc_storeStrong((id *)&self->_backIndicatorButton, 0);
  objc_storeStrong((id *)&self->_oldConstraints, 0);
  objc_storeStrong((id *)&self->_currentConstraints, 0);
}

- (id)contentView
{
  _UIModernBarButton *imageButton;
  _UIModernBarButton *v3;

  imageButton = self->_imageButton;
  if (!imageButton)
  {
    v3 = self->_titleButton;
    if (v3)
      return v3;
    imageButton = (_UIModernBarButton *)self->_backIndicatorButton;
  }
  v3 = imageButton;
  return v3;
}

- (id)alignmentViewForStaticNavBarButtonLeading
{
  _UIModernBarButton *backIndicatorButton;

  backIndicatorButton = (_UIModernBarButton *)self->_backIndicatorButton;
  if (!backIndicatorButton)
  {
    backIndicatorButton = self->_imageButton;
    if (!backIndicatorButton)
      backIndicatorButton = self->_titleButton;
  }
  return backIndicatorButton;
}

- (void)resetButtonHasHighlighted
{
  -[UIControl _setTouchHasHighlighted:](self->_titleButton, "_setTouchHasHighlighted:", 0);
  -[UIControl _setTouchHasHighlighted:](self->_imageButton, "_setTouchHasHighlighted:", 0);
  -[UIControl _setTouchHasHighlighted:](self->_backIndicatorButton, "_setTouchHasHighlighted:", 0);
}

- (id)pointerPreviewParameters
{
  void *v3;
  _UIModernBarButton *v4;
  _UIModernBarButton *titleButton;
  void *v6;

  v3 = (void *)objc_opt_new();
  if ((*(_BYTE *)&self->_flags & 0x20) != 0 && self->_systemItem == 24)
  {
    -[UIView frame](self->_backgroundView, "frame");
    +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:");
    v4 = (_UIModernBarButton *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setShadowPath:", v4);
LABEL_9:

    return v3;
  }
  if (-[UIControl isSelected](self->super._button, "isSelected"))
  {
    titleButton = self->_titleButton;
    if (titleButton)
    {
      v4 = titleButton;
LABEL_8:
      -[_UIModernBarButton _selectedIndicatorBounds](v4, "_selectedIndicatorBounds");
      -[UIView convertRect:toView:](v4, "convertRect:toView:", self->super._button);
      +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setShadowPath:", v6);

      goto LABEL_9;
    }
    v4 = self->_imageButton;
    if (v4)
      goto LABEL_8;
  }
  return v3;
}

- (id)pointerShapeInContainer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  UIImageView *backgroundView;
  void *v8;
  _UIModernBarButton *titleButton;
  _UIModernBarButton *v10;
  UIButton *backIndicatorButton;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double x;
  double y;
  double width;
  double height;
  _UIModernBarButton *v24;
  void *v25;
  _UIModernBarButton *imageButton;
  void *v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  _UIButtonBarButton *button;
  id WeakRetained;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  v4 = a3;
  +[_UIPointerSettingsDomain rootSettings](_UIPointerSettingsDomain, "rootSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationAndToolbarSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((*(_BYTE *)&self->_flags & 0x20) == 0 || self->_systemItem != 24)
  {
    if (-[UIControl isSelected](self->super._button, "isSelected"))
    {
      titleButton = self->_titleButton;
      if (titleButton)
      {
        v10 = titleButton;
      }
      else
      {
        v10 = self->_imageButton;
        if (!v10)
          goto LABEL_22;
      }
      if (-[UIButton _hasVisibleDefaultSelectionIndicator](v10, "_hasVisibleDefaultSelectionIndicator"))
      {
        -[_UIModernBarButton _selectedIndicatorBounds](v10, "_selectedIndicatorBounds");
        -[UIView convertRect:toView:](v10, "convertRect:toView:", v4);
        +[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_21;
      }

    }
    backIndicatorButton = self->_backIndicatorButton;
    if (backIndicatorButton)
    {
      v12 = *MEMORY[0x1E0C9D628];
      v13 = *(double *)(MEMORY[0x1E0C9D628] + 8);
      v14 = *(double *)(MEMORY[0x1E0C9D628] + 16);
      v15 = *(double *)(MEMORY[0x1E0C9D628] + 24);
      -[UIView frame](backIndicatorButton, "frame");
      v40.origin.x = v16;
      v40.origin.y = v17;
      v40.size.width = v18;
      v40.size.height = v19;
      v36.origin.x = v12;
      v36.origin.y = v13;
      v36.size.width = v14;
      v36.size.height = v15;
      v37 = CGRectUnion(v36, v40);
      x = v37.origin.x;
      y = v37.origin.y;
      width = v37.size.width;
      height = v37.size.height;
      v24 = self->_titleButton;
      if (v24)
      {
LABEL_13:
        -[UIButton titleLabel](v24, "titleLabel");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      }
LABEL_17:
      imageButton = self->_imageButton;
      if (!imageButton)
      {
LABEL_20:
        button = self->super._button;
        WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
        _calculateFinalPointerShape(button, v4, WeakRetained, v6, -[_UIButtonBarButton isBackButton](self->super._button, "isBackButton"), -[UIView effectiveUserInterfaceLayoutDirection](self->super._button, "effectiveUserInterfaceLayoutDirection") != UIUserInterfaceLayoutDirectionRightToLeft, x, y, width, height);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_21;
      }
      -[UIButton imageView](imageButton, "imageView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:
      v27 = v25;
      objc_msgSend(v25, "bounds");
      objc_msgSend(v27, "convertRect:toView:", self->super._button);
      v41.origin.x = v28;
      v41.origin.y = v29;
      v41.size.width = v30;
      v41.size.height = v31;
      v38.origin.x = x;
      v38.origin.y = y;
      v38.size.width = width;
      v38.size.height = height;
      v39 = CGRectUnion(v38, v41);
      x = v39.origin.x;
      y = v39.origin.y;
      width = v39.size.width;
      height = v39.size.height;

      goto LABEL_20;
    }
    v24 = self->_titleButton;
    if (v24 || self->_imageButton)
    {
      x = *MEMORY[0x1E0C9D628];
      y = *(double *)(MEMORY[0x1E0C9D628] + 8);
      width = *(double *)(MEMORY[0x1E0C9D628] + 16);
      height = *(double *)(MEMORY[0x1E0C9D628] + 24);
      if (v24)
        goto LABEL_13;
      goto LABEL_17;
    }
LABEL_22:
    v8 = 0;
    goto LABEL_21;
  }
  backgroundView = self->_backgroundView;
  -[UIView bounds](backgroundView, "bounds");
  -[UIView convertRect:toView:](backgroundView, "convertRect:toView:", v4);
  +[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:", v35.origin.x, v35.origin.y, v35.size.width, v35.size.height, CGRectGetWidth(v35) * 0.5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:

  return v8;
}

- (id)matchingPointerShapeForView:(id)a3 rect:(CGRect)a4 inContainer:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a5;
  v11 = a3;
  +[_UIPointerSettingsDomain rootSettings](_UIPointerSettingsDomain, "rootSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "navigationAndToolbarSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _calculateFinalPointerShape(v11, v10, 0, v13, 0, 0, x, y, width, height);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)shouldLift
{
  _BOOL4 v2;
  void *v3;
  void *v4;

  if ((*(_BYTE *)&self->_flags & 0x20) != 0 && self->_systemItem == 24)
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    v2 = -[UIControl isSelected](self->super._button, "isSelected");
    if (v2)
    {
      +[_UIPointerSettingsDomain rootSettings](_UIPointerSettingsDomain, "rootSettings");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "navigationAndToolbarSettings");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      LOBYTE(v3) = objc_msgSend(v4, "enableLiftOnSelected");
      LOBYTE(v2) = (_BYTE)v3;
    }
  }
  return v2;
}

- (void)activateHeightMinimizer
{
  id v3;

  -[_UIButtonBarButton heightMinimizingConstraint](self->super._button, "heightMinimizingConstraint");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_currentConstraints, "setObject:forKeyedSubscript:", v3, CFSTR("minimizeHeight"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_oldConstraints, "setObject:forKeyedSubscript:", 0, CFSTR("minimizeHeight"));

}

- (BOOL)backButtonMaskEnabled
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (void)setBackButtonMaskEnabled:(BOOL)a3
{
  char flags;
  char v4;

  if (self->_backButtonMask)
  {
    flags = (char)self->_flags;
    if (((((flags & 2) == 0) ^ a3) & 1) == 0)
    {
      if (a3)
        v4 = 2;
      else
        v4 = 0;
      *(_BYTE *)&self->_flags = flags & 0xFD | v4;
      -[_UIButtonBarButtonVisualProviderIOS _updateViewsForMaskingEnabled](self, "_updateViewsForMaskingEnabled");
    }
  }
}

- (void)updateButton:(id)a3 forHighlightedState:(BOOL)a4
{
  _BOOL8 v4;
  NSMutableDictionary *backgroundImages;
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  id v11;

  v4 = a4;
  -[UIButton setHighlighted:](self->_backIndicatorButton, "setHighlighted:", a4);
  -[UIButton setHighlighted:](self->_titleButton, "setHighlighted:", v4);
  -[UIButton setHighlighted:](self->_imageButton, "setHighlighted:", v4);
  backgroundImages = self->_backgroundImages;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](backgroundImages, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = self->_backgroundImages;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_backgroundView, "setImage:", v10);

  }
}

- (void)updateButton:(id)a3 forHeldState:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  -[UIButton _setHasActiveMenuPresentation:](self->_backIndicatorButton, "_setHasActiveMenuPresentation:", a4);
  -[UIButton _setHasActiveMenuPresentation:](self->_titleButton, "_setHasActiveMenuPresentation:", v4);
  -[UIButton _setHasActiveMenuPresentation:](self->_imageButton, "_setHasActiveMenuPresentation:", v4);
}

- (id)backIndicatorView
{
  return self->_backIndicatorButton;
}

- (double)_defaultBackIndicatorBaselineInsetCompact:(BOOL)a3
{
  double result;
  void *v4;
  double v5;
  double v6;

  result = 3.0;
  if (!a3)
  {
    -[UIView traitCollection](self->super._button, "traitCollection", 3.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayScale");
    v6 = v5;

    result = 4.0;
    if (v6 > 0.0)
      return -1.0 / v6 + 5.0;
  }
  return result;
}

- (id)alignmentViewForStaticNavBarButtonTrailing
{
  _UIModernBarButton *titleButton;

  titleButton = self->_titleButton;
  if (!titleButton)
  {
    titleButton = self->_imageButton;
    if (!titleButton)
      titleButton = (_UIModernBarButton *)self->_backIndicatorButton;
  }
  return titleButton;
}

- (void)_configureImageBackButtonWithImageInsets:(UIEdgeInsets)a3 backButtonLayoutInsets:(NSDirectionalEdgeInsets)a4 useBaselineAlignment:(BOOL)a5
{
  _BOOL8 v5;
  double trailing;
  double bottom;
  double leading;
  double top;
  double right;
  double v11;
  double left;
  double v13;
  void *v16;

  v5 = a5;
  trailing = a4.trailing;
  bottom = a4.bottom;
  leading = a4.leading;
  top = a4.top;
  right = a3.right;
  v11 = a3.bottom;
  left = a3.left;
  v13 = a3.top;
  if (!self->_imageButton)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIButtonBarButtonVisualProviderIOS.m"), 1386, CFSTR("Invalid image button configuration"));

  }
  -[_UIButtonBarButtonVisualProviderIOS _addHorizontalConstraintsForContentButton:titleOffset:backButtonLayoutInsets:](self, "_addHorizontalConstraintsForContentButton:titleOffset:backButtonLayoutInsets:", 0.0, top, leading, bottom, trailing);
  -[_UIButtonBarButtonVisualProviderIOS _addVerticalConstraintsForBackIndicatorWithTitleOffset:bottomOffset:useBaselineAlignment:](self, "_addVerticalConstraintsForBackIndicatorWithTitleOffset:bottomOffset:useBaselineAlignment:", v5, 0.0, bottom);
  -[_UIButtonBarButtonVisualProviderIOS _addVerticalConstraintsForImageWithInsets:](self, "_addVerticalConstraintsForImageWithInsets:", v13, left, v11, right);
  -[_UIButtonBarButtonVisualProviderIOS _configureBackButtonMask](self, "_configureBackButtonMask");
}

- (void)_configureBackButtonWithBackButtonLayoutInsets:(NSDirectionalEdgeInsets)a3 useBaselineAlignment:(BOOL)a4
{
  _BOOL8 v4;
  double bottom;

  v4 = a4;
  bottom = a3.bottom;
  -[_UIButtonBarButtonVisualProviderIOS _addHorizontalConstraintsForContentButton:titleOffset:backButtonLayoutInsets:](self, "_addHorizontalConstraintsForContentButton:titleOffset:backButtonLayoutInsets:", 0, 0.0, a3.top, a3.leading, a3.bottom, a3.trailing);
  -[_UIButtonBarButtonVisualProviderIOS _addVerticalConstraintsForBackIndicatorWithTitleOffset:bottomOffset:useBaselineAlignment:](self, "_addVerticalConstraintsForBackIndicatorWithTitleOffset:bottomOffset:useBaselineAlignment:", v4, 0.0, bottom);
  -[_UIButtonBarButtonVisualProviderIOS _configureBackButtonMask](self, "_configureBackButtonMask");
}

- (CGSize)buttonImageViewSize:(id)a3
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
  objc_super v12;
  CGSize result;

  if (self->_imageButton)
  {
    -[UIButton _imageView](self->_imageButton, "_imageView", a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)_UIButtonBarButtonVisualProviderIOS;
    -[_UIButtonBarButtonVisualProvider buttonImageViewSize:](&v12, sel_buttonImageViewSize_, a3);
    v5 = v8;
    v7 = v9;
  }
  v10 = v5;
  v11 = v7;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)_updateTextContent
{
  NSArray *finalTitleAttributes;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  finalTitleAttributes = self->_finalTitleAttributes;
  self->_finalTitleAttributes = 0;

  -[UIButton attributedTitleForState:](self->_titleButton, "attributedTitleForState:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIButtonBarButtonVisualProviderIOS _setTitle:](self, "_setTitle:", v4);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_titleContent;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[NSArray objectAtIndexedSubscript:](self->_finalTitleAttributes, "objectAtIndexedSubscript:", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "updateWithTitleAttributes:button:", v11, self->_titleButton);

      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  -[NSArray firstObject](self->_titleContent, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "width");
  v14 = v13;

  -[NSLayoutConstraint setConstant:](self->_backButtonTitleMaxWidthConstraint, "setConstant:", v14);
  -[UIView setNeedsLayout](self->super._button, "setNeedsLayout");

}

- (id)buttonContextMenuInteractionConfiguration
{
  void *v2;

  if (self->_menuProvider)
  {
    +[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:](UIContextMenuConfiguration, "configurationWithIdentifier:previewProvider:actionProvider:", CFSTR("UIBarButtonItemContextMenu"), 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)buttonContextMenuStyleFromDefaultStyle:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  _UIButtonBarButton *button;
  void *v10;

  v4 = a3;
  -[_UIButtonBarButtonVisualProviderIOS menuAnchorPoint](self, "menuAnchorPoint");
  v6 = v5;
  v8 = v7;
  button = self->super._button;
  -[_UIButtonBarButtonVisualProviderIOS buttonContextMenuTargetedPreview](self, "buttonContextMenuTargetedPreview");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _UIControlMenuSupportUpdateStyleForBarButtons(v4, button, v10, self->_backIndicatorButton != 0, v6, v8);

  return v4;
}

- (id)buttonContextMenuTargetedPreview
{
  _UIButtonBarButton *button;
  _UIModernBarButton *imageButton;

  button = self->super._button;
  imageButton = self->_imageButton;
  if (!imageButton)
    imageButton = self->_titleButton;
  return _UIControlMenuSupportTargetedPreviewOverViews(button, imageButton, self->_backIndicatorButton);
}

- (CGPoint)menuAnchorPoint
{
  _UIModernBarButton *imageButton;
  _UIModernBarButton *v3;
  void *v4;
  void *v5;
  void *v6;
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
  CGPoint result;

  imageButton = self->_imageButton;
  if (!imageButton)
    imageButton = self->_titleButton;
  v3 = imageButton;
  -[UIView _viewControllerForAncestor](v3, "_viewControllerForAncestor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[UIView window](v3, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[UIView superview](v3, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView frame](v3, "frame");
  objc_msgSend(v6, "convertRect:toView:", v5);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = _UIControlMenuAttachmentPointForRectInContainer(v5, v8, v10, v12, v14);
  v17 = v16;

  v18 = v15;
  v19 = v17;
  result.y = v19;
  result.x = v18;
  return result;
}

- (void)updateImage
{
  _UIButtonBarButton *button;
  id WeakRetained;

  if (self->_imageButton)
  {
    button = self->super._button;
    WeakRetained = objc_loadWeakRetained((id *)&self->super._barButtonItem);
    -[_UIButtonBarButtonVisualProviderIOS configureButton:fromBarButtonItem:](self, "configureButton:fromBarButtonItem:", button, WeakRetained);

  }
}

- (void)reload
{
  _UIButtonBarButton *button;
  id WeakRetained;

  button = self->super._button;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._barButtonItem);
  -[_UIButtonBarButtonVisualProviderIOS configureButton:fromBarButtonItem:](self, "configureButton:fromBarButtonItem:", button, WeakRetained);

}

- (id)textButton
{
  return self->_titleButton;
}

- (id)imageButton
{
  return self->_imageButton;
}

- (id)backgroundImageView
{
  return self->_backgroundView;
}

@end
