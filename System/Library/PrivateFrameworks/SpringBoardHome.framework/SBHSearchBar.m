@implementation SBHSearchBar

- (SBHSearchBar)initWithFrame:(CGRect)a3
{
  SBHSearchBar *v3;
  uint64_t v4;
  SBFFeatherBlurView *backgroundView;
  uint64_t v6;
  UIButton *cancelButton;
  UIButton *v8;
  void *v9;
  void *v10;
  void *v11;
  SBHSearchTextField *v12;
  uint64_t v13;
  SBHSearchTextField *searchTextField;
  SBHSearchTextField *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  double v21;
  void *v22;
  void *v23;
  id v24;
  objc_super v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)SBHSearchBar;
  v3 = -[SBHSearchBar initWithFrame:](&v26, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E00]), "initWithRecipe:", 1);
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = (SBFFeatherBlurView *)v4;

    -[SBHSearchBar addSubview:](v3, "addSubview:", v3->_backgroundView);
    v3->_backgroundViewBottomInsetToTextField = *(double *)MEMORY[0x1E0DC55F0];
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v6 = objc_claimAutoreleasedReturnValue();
    cancelButton = v3->_cancelButton;
    v3->_cancelButton = (UIButton *)v6;

    v8 = v3->_cancelButton;
    SBHBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("APP_LIBRARY_SEARCH_CANCEL_BUTTON_TITLE"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v8, "setTitle:forState:", v10, 0);

    -[UIButton sizeToFit](v3->_cancelButton, "sizeToFit");
    -[UIButton setAlpha:](v3->_cancelButton, "setAlpha:", 0.0);
    -[UIButton setPointerInteractionEnabled:](v3->_cancelButton, "setPointerInteractionEnabled:", 1);
    -[UIButton addTarget:action:forControlEvents:](v3->_cancelButton, "addTarget:action:forControlEvents:", v3, sel__cancelButtonTapped_, 64);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v3, sel__accessibilityBoldStatusDidChange_, *MEMORY[0x1E0DC44D0], 0);

    -[SBHSearchBar addSubview:](v3, "addSubview:", v3->_cancelButton);
    -[SBHSearchBar _updateCancelButtonFont](v3, "_updateCancelButtonFont");
    v12 = [SBHSearchTextField alloc];
    v13 = -[SBHSearchTextField initWithFrame:](v12, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    searchTextField = v3->_searchTextField;
    v3->_searchTextField = (SBHSearchTextField *)v13;

    -[UISearchTextField setDelegate:](v3->_searchTextField, "setDelegate:", v3);
    v15 = v3->_searchTextField;
    SBHBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("APP_LIBRARY_SEARCH_PLACEHOLDER"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHSearchTextField setPlaceholder:](v15, "setPlaceholder:", v17);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v3, sel__searchBarTextFieldDidChangeText_, *MEMORY[0x1E0DC54D0], v3->_searchTextField);

    -[SBHSearchBar addSubview:](v3, "addSubview:", v3->_searchTextField);
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "userInterfaceIdiom");

    v21 = 16.0;
    if ((v20 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v21 = 20.0;
    v3->_textFieldCancelButtonSpacing = v21;
    v3->_alignsTextFieldOnPixelBoundaries = 1;
    v3->_portraitOrientation = 1;
    -[SBHSearchBar setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("dewey-search-bar"));
    -[SBHSearchBar _setIgnoresLayerTransformForSafeAreaInsets:](v3, "_setIgnoresLayerTransformForSafeAreaInsets:", 1);
    objc_opt_self();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (id)-[SBHSearchBar registerForTraitChanges:withAction:](v3, "registerForTraitChanges:withAction:", v23, sel__preferredContentSizeCategoryDidChange);

  }
  return v3;
}

- (void)_preferredContentSizeCategoryDidChange
{
  -[SBHSearchBar _updateCancelButtonFont](self, "_updateCancelButtonFont");
  -[SBHSearchBar setNeedsLayout](self, "setNeedsLayout");
  -[SBHSearchBar layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)_accessibilityBoldStatusDidChange:(id)a3
{
  -[SBHSearchBar _updateCancelButtonFont](self, "_updateCancelButtonFont", a3);
  -[SBHSearchBar setNeedsLayout](self, "setNeedsLayout");
  -[SBHSearchBar layoutIfNeeded](self, "layoutIfNeeded");
}

- (BOOL)canBecomeFirstResponder
{
  return -[UISearchTextField canBecomeFirstResponder](self->_searchTextField, "canBecomeFirstResponder");
}

- (BOOL)becomeFirstResponder
{
  return -[UISearchTextField becomeFirstResponder](self->_searchTextField, "becomeFirstResponder");
}

- (BOOL)canResignFirstResponder
{
  return -[UISearchTextField canResignFirstResponder](self->_searchTextField, "canResignFirstResponder");
}

- (BOOL)resignFirstResponder
{
  return -[UISearchTextField resignFirstResponder](self->_searchTextField, "resignFirstResponder");
}

- (BOOL)isFirstResponder
{
  return -[SBHSearchTextField isEditing](self->_searchTextField, "isEditing");
}

- (NSString)text
{
  return (NSString *)-[UISearchTextField text](self->_searchTextField, "text");
}

- (void)setShowsCancelButton:(BOOL)a3
{
  -[SBHSearchBar setShowsCancelButton:animated:](self, "setShowsCancelButton:animated:", a3, 0);
}

- (void)setShowsCancelButton:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v20[9];
  BOOL v21;

  if (self->_showsCancelButton != a3)
  {
    v4 = a4;
    v7 = objc_msgSend(MEMORY[0x1E0DC3F10], "_isInAnimationBlock");
    -[SBHSearchBar frame](self, "frame");
    v9 = v8;
    v11 = v10;
    -[SBHSearchBar sizeThatFits:](self, "sizeThatFits:", v8, v10);
    v13 = v12;
    v15 = v14;
    self->_showsCancelButton = a3;
    -[SBHSearchBar sizeThatFits:](self, "sizeThatFits:", v9, v11);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __46__SBHSearchBar_setShowsCancelButton_animated___block_invoke;
    v20[3] = &unk_1E8D89E10;
    v20[4] = self;
    v21 = a3;
    v20[5] = v13;
    v20[6] = v15;
    v20[7] = v16;
    v20[8] = v17;
    v18 = _Block_copy(v20);
    v19 = v18;
    if (v7 || !v4)
      (*((void (**)(void *))v18 + 2))(v18);
    else
      objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 6, v18, 0);

  }
}

uint64_t __46__SBHSearchBar_setShowsCancelButton_animated___block_invoke(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(_BYTE *)(a1 + 72);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "setAlpha:", (double)*(unint64_t *)&a2);
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  if (*(double *)(a1 + 40) != *(double *)(a1 + 56) || *(double *)(a1 + 48) != *(double *)(a1 + 64))
    objc_msgSend(*(id *)(a1 + 32), "_invalidateIntrinsicContentSizeAndNotify");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)setSearchTextField:(id)a3
{
  SBHSearchTextField *v5;
  SBHSearchTextField *searchTextField;
  SBHSearchTextField *v7;

  v5 = (SBHSearchTextField *)a3;
  searchTextField = self->_searchTextField;
  if (searchTextField != v5)
  {
    v7 = v5;
    -[SBHSearchTextField removeFromSuperview](searchTextField, "removeFromSuperview");
    objc_storeStrong((id *)&self->_searchTextField, a3);
    -[SBHSearchBar addSubview:](self, "addSubview:", self->_searchTextField);
    -[SBHSearchBar setNeedsLayout](self, "setNeedsLayout");
    -[SBHSearchBar _invalidateIntrinsicContentSizeAndNotify](self, "_invalidateIntrinsicContentSizeAndNotify");
    -[SBHSearchBar layoutIfNeeded](self, "layoutIfNeeded");
    v5 = v7;
  }

}

- (void)setInactiveSearchConfiguration:(id)a3
{
  SBHSearchVisualConfiguration *v4;
  SBHSearchVisualConfiguration *inactiveSearchConfiguration;
  id v6;

  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (SBHSearchVisualConfiguration *)objc_msgSend(v6, "copy");
    inactiveSearchConfiguration = self->_inactiveSearchConfiguration;
    self->_inactiveSearchConfiguration = v4;

    -[SBHSearchBar setNeedsLayout](self, "setNeedsLayout");
    -[SBHSearchBar _invalidateIntrinsicContentSizeAndNotify](self, "_invalidateIntrinsicContentSizeAndNotify");
  }

}

- (void)setPortraitOrientation:(BOOL)a3
{
  if (self->_portraitOrientation != a3)
  {
    self->_portraitOrientation = a3;
    -[SBHSearchBar setNeedsLayout](self, "setNeedsLayout");
    -[SBHSearchBar _invalidateIntrinsicContentSizeAndNotify](self, "_invalidateIntrinsicContentSizeAndNotify");
  }
}

- (void)setAlignsTextFieldOnPixelBoundaries:(BOOL)a3
{
  if (self->_alignsTextFieldOnPixelBoundaries != a3)
  {
    self->_alignsTextFieldOnPixelBoundaries = a3;
    -[SBHSearchBar setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setListLayoutProvider:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  CGFloat v7;
  void *v8;
  void *v9;
  SBHSearchTextField *searchTextField;
  SBHSearchVisualConfiguration *v11;
  SBHSearchVisualConfiguration *inactiveSearchConfiguration;
  SBHSearchVisualConfiguration *v13;
  SBHSearchVisualConfiguration *activeSearchConfiguration;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_listLayoutProvider);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_listLayoutProvider, obj);
    objc_msgSend(obj, "layoutForIconLocation:", CFSTR("SBIconLocationRoot"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "iconImageInfo");
    SBHIconListLayoutNonDefaultIconGridSizeClassLayoutInsets(v6, 1);
    BSFloatFloorForScale();
    self->_textFieldHorizontalLayoutInsets.top = 0.0;
    self->_textFieldHorizontalLayoutInsets.left = v7;
    self->_textFieldHorizontalLayoutInsets.bottom = 0.0;
    self->_textFieldHorizontalLayoutInsets.right = v7;
    objc_msgSend(obj, "layoutForIconLocation:", CFSTR("SBIconLocationAppLibrary"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appLibraryVisualConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    searchTextField = self->_searchTextField;
    objc_msgSend(v9, "searchContinuousCornerRadius");
    -[SBHSearchTextField _setContinuousCornerRadius:](searchTextField, "_setContinuousCornerRadius:");
    if (!self->_inactiveSearchConfiguration)
    {
      objc_msgSend(v9, "standardSearchVisualConfiguration");
      v11 = (SBHSearchVisualConfiguration *)objc_claimAutoreleasedReturnValue();
      inactiveSearchConfiguration = self->_inactiveSearchConfiguration;
      self->_inactiveSearchConfiguration = v11;

    }
    objc_msgSend(v9, "activeSearchVisualConfiguration");
    v13 = (SBHSearchVisualConfiguration *)objc_claimAutoreleasedReturnValue();
    activeSearchConfiguration = self->_activeSearchConfiguration;
    self->_activeSearchConfiguration = v13;

    -[SBHSearchBar setNeedsLayout](self, "setNeedsLayout");
    -[SBHSearchBar layoutIfNeeded](self, "layoutIfNeeded");

    v5 = obj;
  }

}

- (void)setBackgroundViewBottomInsetToTextField:(double)a3
{
  if (self->_backgroundViewBottomInsetToTextField != a3)
  {
    self->_backgroundViewBottomInsetToTextField = a3;
    -[SBHSearchBar setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGSize)sizeThatFits:(CGSize)a3 forVisualConfiguration:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[SBHSearchBar searchTextField](self, "searchTextField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "effectiveLayoutSizeFittingSize:", width, height);
  v10 = v9;

  -[SBHSearchBar _performHeightCalculationForVisualConfiguration:](self, "_performHeightCalculationForVisualConfiguration:", v7);
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (id)focusGroupIdentifier
{
  return (id)-[SBHSearchTextField focusGroupIdentifier](self->_searchTextField, "focusGroupIdentifier");
}

- (void)setFocusGroupIdentifier:(id)a3
{
  -[SBHSearchTextField setFocusGroupIdentifier:](self->_searchTextField, "setFocusGroupIdentifier:", a3);
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[SBHSearchBar searchTextField](self, "searchTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intrinsicContentSize");
  v5 = v4;

  -[SBHSearchBar _currentVisualConfiguration](self, "_currentVisualConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHSearchBar _performHeightCalculationForVisualConfiguration:](self, "_performHeightCalculationForVisualConfiguration:", v6);
  v8 = v7;

  v9 = v5;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[SBHSearchBar _currentVisualConfiguration](self, "_currentVisualConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHSearchBar sizeThatFits:forVisualConfiguration:](self, "sizeThatFits:forVisualConfiguration:", v6, width, height);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  CGFloat v24;
  double v25;
  void *v26;
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
  double v39;
  double v40;
  double v41;
  double v42;
  id *v43;
  uint64_t v44;
  double v45;
  double v46;
  double v47;
  double v48;
  SBHSearchTextField *searchTextField;
  SBHSearchTextField *v50;
  SBFFeatherBlurView *backgroundView;
  SBFFeatherBlurView *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  double v57;
  double v58;
  double v59;
  double v60;
  UIButton *cancelButton;
  UIButton *v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double textFieldCancelButtonSpacing;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  objc_super v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;

  v78.receiver = self;
  v78.super_class = (Class)SBHSearchBar;
  -[SBHSearchBar layoutSubviews](&v78, sel_layoutSubviews);
  -[SBHSearchBar bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v75 = v7;
  v72 = v8;
  -[SBHSearchBar _currentVisualConfiguration](self, "_currentVisualConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHSearchBar window](self, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHSearchBar traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayScale");

  -[SBHSearchBar delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v12, "safeAreaInsetsForSearchBar:", self);
  else
    -[SBHSearchBar safeAreaInsets](self, "safeAreaInsets");
  if (-[SBHSearchBar isPortraitOrientation](self, "isPortraitOrientation"))
    objc_msgSend(v9, "textFieldPortraitLayoutInsets");
  else
    objc_msgSend(v9, "textFieldLandscapeLayoutInsets");
  UIEdgeInsetsAdd();
  v14 = v4 + v13;
  v16 = v6 + v15;
  v18 = v75 - (v13 + v17);
  v20 = v72 - (v15 + v19);
  objc_msgSend(v9, "textFieldWidth");
  v22 = v21;
  v23 = (v75 - v21) * 0.5;
  if (v22 <= 0.0)
  {
    v24 = v14;
  }
  else
  {
    v18 = v22;
    v24 = v23;
  }
  -[UIButton frame](self->_cancelButton, "frame");
  v71 = v25;
  -[SBHSearchBar searchTextField](self, "searchTextField");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "intrinsicContentSize");

  textFieldCancelButtonSpacing = self->_textFieldCancelButtonSpacing;
  if (self->_alignsTextFieldOnPixelBoundaries)
    UIRectCenteredIntegralRectScale();
  else
    UIRectCenteredRect();
  v73 = v28;
  v74 = v27;
  v76 = v30;
  v77 = v29;
  v63 = v18;
  v64 = v20;
  v65 = v16;
  UIEdgeInsetsAdd();
  v68 = v32;
  v69 = v31;
  v66 = v34;
  v67 = v33;
  UIEdgeInsetsAdd();
  v36 = v35;
  v38 = v37;
  v40 = v39;
  v42 = v41;
  v43 = (id *)MEMORY[0x1E0DC4730];
  if (self->_showsCancelButton)
  {
    v44 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection");
    v45 = v71 + textFieldCancelButtonSpacing;
    if (v44 == 1)
      v38 = v45 + v38;
    else
      v42 = v45 + v42;
  }
  v46 = v74 + v38;
  v47 = v77 - (v38 + v42);
  v48 = v76 - (v36 + v40);
  searchTextField = self->_searchTextField;
  BSRectWithSize();
  -[SBHSearchTextField setBounds:](searchTextField, "setBounds:");
  v50 = self->_searchTextField;
  UIRectGetCenter();
  -[SBHSearchTextField setCenter:](v50, "setCenter:");
  if (self->_backgroundViewBottomInsetToTextField != *MEMORY[0x1E0DC55F0])
  {
    v79.origin.x = v46;
    v79.origin.y = v73 + v36;
    v79.size.width = v47;
    v79.size.height = v48;
    CGRectGetMaxY(v79);
  }
  backgroundView = self->_backgroundView;
  BSRectWithSize();
  -[SBFFeatherBlurView setBounds:](backgroundView, "setBounds:");
  v52 = self->_backgroundView;
  UIRectGetCenter();
  -[SBFFeatherBlurView setCenter:](v52, "setCenter:");
  v53 = (void *)MEMORY[0x1E0DA9E00];
  -[SBFFeatherBlurView frame](self->_backgroundView, "frame");
  objc_msgSend(v53, "matchMoveAnimationForFrame:relativeToView:", v10);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFFeatherBlurView layer](self->_backgroundView, "layer");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "addAnimation:forKey:", v54, CFSTR("SBHSearchBarMatchMoveAnimation"));

  -[UIButton frame](self->_cancelButton, "frame");
  v80.origin.x = v74;
  v80.origin.y = v73;
  v80.size.width = v77;
  v80.size.height = v76;
  CGRectGetMidY(v80);
  LODWORD(v55) = self->_showsCancelButton;
  v56 = objc_msgSend(*v43, "userInterfaceLayoutDirection");
  if ((_DWORD)v55)
  {
    v57 = v74 + v68;
    v58 = v73 + v69;
    v59 = v77 - (v68 + v66);
    v60 = v76 - (v69 + v67);
    if (v56 == 1)
      CGRectGetMinX(*(CGRect *)&v57);
    else
      CGRectGetMaxX(*(CGRect *)&v57);
  }
  else if (v56 == 1)
  {
    v81.origin.x = v74;
    v81.origin.y = v73;
    v81.size.height = v76;
    v81.size.width = v77;
    CGRectGetMinX(v81);
  }
  else
  {
    v82.origin.x = v24;
    v82.size.width = v63;
    v82.size.height = v64;
    v82.origin.y = v65;
    CGRectGetMaxX(v82);
  }
  UIRectIntegralWithScale();
  cancelButton = self->_cancelButton;
  BSRectWithSize();
  -[UIButton setBounds:](cancelButton, "setBounds:");
  v62 = self->_cancelButton;
  UIRectGetCenter();
  -[UIButton setCenter:](v62, "setCenter:");

}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  void *v4;
  BOOL v5;

  -[SBHSearchBar delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && !objc_msgSend(v4, "searchBarShouldBeginEditing:", self))
  {
    v5 = 0;
  }
  else
  {
    v5 = 1;
    -[SBHSearchBar setShowsCancelButton:animated:](self, "setShowsCancelButton:animated:", 1, 1);
  }

  return v5;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4;

  -[SBHSearchBar delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "searchBarTextDidBeginEditing:", self);

}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  void *v4;
  char v5;

  -[SBHSearchBar delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(v4, "searchBarShouldEndEditing:", self);
  else
    v5 = 1;

  return v5;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4;

  -[SBHSearchBar delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "searchBarTextDidEndEditing:", self);

}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  void *v9;
  char v10;

  length = a4.length;
  location = a4.location;
  v8 = a5;
  -[SBHSearchBar delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v10 = objc_msgSend(v9, "searchBar:shouldChangeTextInRange:replacementText:", self, location, length, v8);
  else
    v10 = 1;

  return v10;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  -[SBHSearchBar delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v5, "searchBarShouldReturn:", self))
  {
    objc_msgSend(v4, "resignFirstResponder");
    v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_cancelButtonTapped:(id)a3
{
  id v4;

  -[UISearchTextField setText:](self->_searchTextField, "setText:", &stru_1E8D8E958);
  -[SBHSearchBar delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "searchBarCancelButtonClicked:", self);
  -[SBHSearchBar setShowsCancelButton:animated:](self, "setShowsCancelButton:animated:", 0, 1);

}

- (void)_searchBarTextFieldDidChangeText:(id)a3
{
  void *v4;
  id v5;

  -[SBHSearchBar delegate](self, "delegate", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UISearchTextField text](self->_searchTextField, "text");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "searchBar:textDidChange:", self, v4);

  }
}

- (id)_currentVisualConfiguration
{
  _BOOL4 v3;
  int *v4;

  v3 = -[SBHSearchBar showsCancelButton](self, "showsCancelButton");
  v4 = &OBJC_IVAR___SBHSearchBar__inactiveSearchConfiguration;
  if (v3)
    v4 = &OBJC_IVAR___SBHSearchBar__activeSearchConfiguration;
  return *(id *)((char *)&self->super.super.super.super.isa + *v4);
}

- (void)_invalidateIntrinsicContentSizeAndNotify
{
  id v3;

  -[SBHSearchBar invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[SBHSearchBar delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "searchBarDidInvalidateIntrinsicContentSize:", self);

}

- (double)_performHeightCalculationForVisualConfiguration:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v4 = a3;
  -[SBHSearchBar searchTextField](self, "searchTextField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intrinsicContentSize");
  v7 = v6;

  if (-[SBHSearchBar isPortraitOrientation](self, "isPortraitOrientation"))
    objc_msgSend(v4, "textFieldPortraitLayoutInsets");
  else
    objc_msgSend(v4, "textFieldLandscapeLayoutInsets");
  v10 = v8;
  v11 = v9;

  return v11 + v7 + v10;
}

- (void)_updateCancelButtonFont
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)MEMORY[0x1E0DC3E88];
  -[SBHSearchBar traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIContentSizeCategoryClip();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollectionWithPreferredContentSizeCategory:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:compatibleWithTraitCollection:", *MEMORY[0x1E0DC4A88], v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton titleLabel](self->_cancelButton, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v7);

  -[UIButton sizeToFit](self->_cancelButton, "sizeToFit");
}

- (SBHSearchTextField)searchTextField
{
  return self->_searchTextField;
}

- (SBHSearchBarDelegate)delegate
{
  return (SBHSearchBarDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (BOOL)showsCancelButton
{
  return self->_showsCancelButton;
}

- (BOOL)alignsTextFieldOnPixelBoundaries
{
  return self->_alignsTextFieldOnPixelBoundaries;
}

- (SBIconListLayoutProvider)listLayoutProvider
{
  return (SBIconListLayoutProvider *)objc_loadWeakRetained((id *)&self->_listLayoutProvider);
}

- (SBHSearchVisualConfiguration)activeSearchConfiguration
{
  return self->_activeSearchConfiguration;
}

- (SBHSearchVisualConfiguration)inactiveSearchConfiguration
{
  return self->_inactiveSearchConfiguration;
}

- (BOOL)isPortraitOrientation
{
  return self->_portraitOrientation;
}

- (SBFFeatherBlurView)backgroundView
{
  return self->_backgroundView;
}

- (double)backgroundViewBottomInsetToTextField
{
  return self->_backgroundViewBottomInsetToTextField;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_inactiveSearchConfiguration, 0);
  objc_storeStrong((id *)&self->_activeSearchConfiguration, 0);
  objc_destroyWeak((id *)&self->_listLayoutProvider);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_searchTextField, 0);
}

@end
