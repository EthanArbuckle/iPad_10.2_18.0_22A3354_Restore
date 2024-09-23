@implementation WFSearchBar

- (WFSearchBar)initWithStyle:(unint64_t)a3
{
  WFSearchBar *v4;
  uint64_t v5;
  UIButton *cancelButton;
  UIButton *v7;
  void *v8;
  UIButton *v9;
  void *v10;
  void *v11;
  WFSearchTextField *v12;
  WFSearchTextField *searchTextField;
  WFSearchTextField *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)WFSearchBar;
  v4 = -[WFSearchBar initWithFrame:](&v18, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
    v5 = objc_claimAutoreleasedReturnValue();
    cancelButton = v4->_cancelButton;
    v4->_cancelButton = (UIButton *)v5;

    v7 = v4->_cancelButton;
    WFLocalizedString(CFSTR("Cancel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v7, "setTitle:forState:", v8, 0);

    -[UIButton sizeToFit](v4->_cancelButton, "sizeToFit");
    -[UIButton setAlpha:](v4->_cancelButton, "setAlpha:", 0.0);
    -[UIButton addTarget:action:forControlEvents:](v4->_cancelButton, "addTarget:action:forControlEvents:", v4, sel__cancelButtonTapped_, 64);
    v9 = v4->_cancelButton;
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemWhiteColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v9, "setTitleColor:forState:", v10, 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v4, sel__accessibilityBoldStatusDidChange_, *MEMORY[0x24BEBDDB8], 0);

    -[WFSearchBar addSubview:](v4, "addSubview:", v4->_cancelButton);
    -[WFSearchBar _updateCancelButtonFont](v4, "_updateCancelButtonFont");
    v12 = -[WFSearchTextField initWithStyle:]([WFSearchTextField alloc], "initWithStyle:", a3);
    searchTextField = v4->_searchTextField;
    v4->_searchTextField = v12;

    -[WFSearchTextField setTextFieldDelegate:](v4->_searchTextField, "setTextFieldDelegate:", v4);
    -[UISearchTextField setDelegate:](v4->_searchTextField, "setDelegate:", v4);
    v14 = v4->_searchTextField;
    WFLocalizedString(CFSTR("Search Shortcuts"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSearchTextField setPlaceholder:](v14, "setPlaceholder:", v15);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v4, sel__searchBarTextFieldDidChangeText_, *MEMORY[0x24BEBE868], v4->_searchTextField);

    -[WFSearchBar addSubview:](v4, "addSubview:", v4->_searchTextField);
    v4->_textFieldCancelButtonSpacing = 16.0;
    v4->_alignsTextFieldOnPixelBoundaries = 1;
    v4->_portraitOrientation = 1;
    -[WFSearchBar _setIgnoresLayerTransformForSafeAreaInsets:](v4, "_setIgnoresLayerTransformForSafeAreaInsets:", 1);
  }
  return v4;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  WFSearchBar *v5;
  WFSearchBar *v6;
  WFSearchBar *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WFSearchBar;
  -[WFSearchBar hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (WFSearchBar *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
    v7 = 0;
  else
    v7 = v5;

  return v7;
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFSearchBar;
  -[WFSearchBar traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[WFSearchBar _updateCancelButtonFont](self, "_updateCancelButtonFont");
  -[WFSearchBar setNeedsLayout](self, "setNeedsLayout");
  -[WFSearchBar layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)_accessibilityBoldStatusDidChange:(id)a3
{
  -[WFSearchBar _updateCancelButtonFont](self, "_updateCancelButtonFont", a3);
  -[WFSearchBar setNeedsLayout](self, "setNeedsLayout");
  -[WFSearchBar layoutIfNeeded](self, "layoutIfNeeded");
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
  return -[WFSearchTextField resignFirstResponder](self->_searchTextField, "resignFirstResponder");
}

- (BOOL)isFirstResponder
{
  return -[WFSearchTextField isEditing](self->_searchTextField, "isEditing");
}

- (NSString)text
{
  return (NSString *)-[UISearchTextField text](self->_searchTextField, "text");
}

- (void)setShowsCancelButton:(BOOL)a3
{
  -[WFSearchBar setShowsCancelButton:animated:](self, "setShowsCancelButton:animated:", a3, 0);
}

- (void)setShowsCancelButton:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
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
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[9];
  BOOL v25;

  if (self->_showsCancelButton != a3)
  {
    v4 = a4;
    v5 = a3;
    v7 = objc_msgSend(MEMORY[0x24BEBDB00], "_isInAnimationBlock");
    -[WFSearchBar bounds](self, "bounds");
    v9 = v8;
    v11 = v10;
    -[WFSearchBar sizeThatFits:](self, "sizeThatFits:", v8, v10);
    v13 = v12;
    v15 = v14;
    self->_showsCancelButton = v5;
    -[WFSearchBar sizeThatFits:](self, "sizeThatFits:", v9, v11);
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __45__WFSearchBar_setShowsCancelButton_animated___block_invoke;
    v24[3] = &unk_24E603798;
    v24[4] = self;
    v25 = v5;
    v24[5] = v13;
    v24[6] = v15;
    v24[7] = v16;
    v24[8] = v17;
    v18 = _Block_copy(v24);
    v19 = v18;
    if (v7 || !v4)
      (*((void (**)(void *))v18 + 2))(v18);
    else
      objc_msgSend(MEMORY[0x24BEBDB00], "_animateUsingDefaultTimingWithOptions:animations:completion:", 6, v18, 0);
    -[WFSearchBar delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v20, "searchBarCancelButtonWillAppear:", self);
      -[WFSearchBar searchTextField](self, "searchTextField");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      v23 = 1;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v20, "searchBarCancelButtonWillHide:", self);
      -[WFSearchBar searchTextField](self, "searchTextField");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      v23 = 0;
    }
    objc_msgSend(v21, "setAlignmentBehavior:animated:", v23, 1);

  }
}

- (void)setSearchTextField:(id)a3
{
  WFSearchTextField *v5;
  WFSearchTextField *searchTextField;
  WFSearchTextField *v7;

  v5 = (WFSearchTextField *)a3;
  searchTextField = self->_searchTextField;
  if (searchTextField != v5)
  {
    v7 = v5;
    -[WFSearchTextField removeFromSuperview](searchTextField, "removeFromSuperview");
    objc_storeStrong((id *)&self->_searchTextField, a3);
    -[WFSearchBar addSubview:](self, "addSubview:", self->_searchTextField);
    -[WFSearchBar setNeedsLayout](self, "setNeedsLayout");
    -[WFSearchBar _invalidateIntrinsicContentSizeAndNotify](self, "_invalidateIntrinsicContentSizeAndNotify");
    -[WFSearchBar layoutIfNeeded](self, "layoutIfNeeded");
    v5 = v7;
  }

}

- (void)setInactiveSearchConfiguration:(id)a3
{
  id v4;
  id v5;
  id v6;
  char v7;
  void *v8;
  id inactiveSearchConfiguration;
  id v10;

  v4 = a3;
  v5 = self->_inactiveSearchConfiguration;
  v6 = v4;
  v10 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = objc_msgSend(v5, "isEqual:", v6);

      if ((v7 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    v8 = (void *)objc_msgSend(v10, "copy");
    inactiveSearchConfiguration = self->_inactiveSearchConfiguration;
    self->_inactiveSearchConfiguration = v8;

    -[WFSearchBar setNeedsLayout](self, "setNeedsLayout");
    -[WFSearchBar _invalidateIntrinsicContentSizeAndNotify](self, "_invalidateIntrinsicContentSizeAndNotify");
  }
LABEL_9:

}

- (void)setPortraitOrientation:(BOOL)a3
{
  if (self->_portraitOrientation != a3)
  {
    self->_portraitOrientation = a3;
    -[WFSearchBar setNeedsLayout](self, "setNeedsLayout");
    -[WFSearchBar _invalidateIntrinsicContentSizeAndNotify](self, "_invalidateIntrinsicContentSizeAndNotify");
  }
}

- (void)setAlignsTextFieldOnPixelBoundaries:(BOOL)a3
{
  if (self->_alignsTextFieldOnPixelBoundaries != a3)
  {
    self->_alignsTextFieldOnPixelBoundaries = a3;
    -[WFSearchBar setNeedsLayout](self, "setNeedsLayout");
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
  -[WFSearchBar searchTextField](self, "searchTextField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sizeThatFits:", width, height);
  v10 = v9;

  -[WFSearchBar _performHeightCalculationForVisualConfiguration:](self, "_performHeightCalculationForVisualConfiguration:", v7);
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (id)focusGroupIdentifier
{
  return (id)-[WFSearchTextField focusGroupIdentifier](self->_searchTextField, "focusGroupIdentifier");
}

- (void)setFocusGroupIdentifier:(id)a3
{
  -[WFSearchTextField setFocusGroupIdentifier:](self->_searchTextField, "setFocusGroupIdentifier:", a3);
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

  -[WFSearchBar searchTextField](self, "searchTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intrinsicContentSize");
  v5 = v4;

  -[WFSearchBar _currentVisualConfiguration](self, "_currentVisualConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSearchBar _performHeightCalculationForVisualConfiguration:](self, "_performHeightCalculationForVisualConfiguration:", v6);
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
  -[WFSearchBar _currentVisualConfiguration](self, "_currentVisualConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSearchBar sizeThatFits:forVisualConfiguration:](self, "sizeThatFits:forVisualConfiguration:", v6, width, height);
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
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
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
  CGFloat v25;
  double v26;
  void *v27;
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
  double v43;
  double v44;
  double v45;
  id *v46;
  uint64_t v47;
  double v48;
  WFSearchTextField *searchTextField;
  uint64_t v50;
  double v51;
  double v52;
  double v53;
  double v54;
  UIButton *cancelButton;
  uint64_t v56;
  CGFloat v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double textFieldCancelButtonSpacing;
  double v65;
  double rect;
  double v67;
  uint64_t v68;
  double v69;
  double v70;
  objc_super v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;

  v71.receiver = self;
  v71.super_class = (Class)WFSearchBar;
  -[WFSearchBar layoutSubviews](&v71, sel_layoutSubviews);
  -[WFSearchBar bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[WFSearchBar _currentVisualConfiguration](self, "_currentVisualConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSearchBar traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "displayScale");
  v68 = v13;

  -[WFSearchBar safeAreaInsets](self, "safeAreaInsets");
  if (-[WFSearchBar isPortraitOrientation](self, "isPortraitOrientation"))
    objc_msgSend(v11, "textFieldPortraitLayoutInsets");
  else
    objc_msgSend(v11, "textFieldLandscapeLayoutInsets");
  UIEdgeInsetsAdd();
  v15 = v4 + v14;
  v17 = v6 + v16;
  v19 = v8 - (v14 + v18);
  v21 = v10 - (v16 + v20);
  objc_msgSend(v11, "textFieldWidth");
  v23 = v22;
  v24 = (v8 - v22) * 0.5;
  if (v23 <= 0.0)
  {
    v25 = v15;
  }
  else
  {
    v19 = v23;
    v25 = v24;
  }
  -[UIButton frame](self->_cancelButton, "frame");
  v67 = v26;
  -[WFSearchBar searchTextField](self, "searchTextField");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "intrinsicContentSize");

  textFieldCancelButtonSpacing = self->_textFieldCancelButtonSpacing;
  v28 = *MEMORY[0x24BDBEFB0];
  v29 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  if (self->_alignsTextFieldOnPixelBoundaries)
  {
    v56 = v68;
    UIRectCenteredIntegralRectScale();
  }
  else
  {
    UIRectCenteredRect();
  }
  v69 = v30;
  v70 = v28;
  v62 = v33;
  v63 = v32;
  v65 = v29;
  rect = v31;
  v57 = v21;
  UIEdgeInsetsAdd();
  v60 = v35;
  v61 = v34;
  v58 = v37;
  v59 = v36;
  UIEdgeInsetsAdd();
  v39 = v38;
  v41 = v40;
  v43 = v42;
  v45 = v44;
  v46 = (id *)MEMORY[0x24BEBDF78];
  if (self->_showsCancelButton)
  {
    v47 = objc_msgSend((id)*MEMORY[0x24BEBDF78], "userInterfaceLayoutDirection");
    v48 = v67 + textFieldCancelButtonSpacing;
    if (v47 == 1)
      v41 = v48 + v41;
    else
      v45 = v48 + v45;
  }
  -[WFSearchTextField setBounds:](self->_searchTextField, "setBounds:", v70, v65, v63 - (v41 + v45), v62 - (v39 + v43), v56);
  searchTextField = self->_searchTextField;
  UIRectGetCenter();
  -[WFSearchTextField setCenter:](searchTextField, "setCenter:");
  -[UIButton frame](self->_cancelButton, "frame");
  v72.origin.x = v69;
  v72.origin.y = rect;
  v72.size.width = v63;
  v72.size.height = v62;
  CGRectGetMidY(v72);
  LODWORD(searchTextField) = self->_showsCancelButton;
  v50 = objc_msgSend(*v46, "userInterfaceLayoutDirection");
  if ((_DWORD)searchTextField)
  {
    v51 = v69 + v60;
    v52 = rect + v61;
    v53 = v63 - (v60 + v58);
    v54 = v62 - (v61 + v59);
    if (v50 == 1)
      CGRectGetMinX(*(CGRect *)&v51);
    else
      CGRectGetMaxX(*(CGRect *)&v51);
  }
  else if (v50 == 1)
  {
    v73.origin.x = v69;
    v73.origin.y = rect;
    v73.size.width = v63;
    v73.size.height = v62;
    CGRectGetMinX(v73);
  }
  else
  {
    v74.origin.x = v25;
    v74.size.width = v19;
    v74.size.height = v57;
    v74.origin.y = v17;
    CGRectGetMaxX(v74);
  }
  UIRectIntegralWithScale();
  -[UIButton setBounds:](self->_cancelButton, "setBounds:", v70, v65);
  cancelButton = self->_cancelButton;
  UIRectGetCenter();
  -[UIButton setCenter:](cancelButton, "setCenter:");

}

- (void)reset
{
  void *v3;

  -[WFSearchTextField setTokens:](self->_searchTextField, "setTokens:", MEMORY[0x24BDBD1A8]);
  -[WFSearchTextField setText:](self->_searchTextField, "setText:", &stru_24E605650);
  -[WFSearchBar setNeedsLayout](self, "setNeedsLayout");
  -[WFSearchBar layoutIfNeeded](self, "layoutIfNeeded");
  -[WFSearchBar searchTextField](self, "searchTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resignFirstResponder");

  -[WFSearchBar setShowsCancelButton:animated:](self, "setShowsCancelButton:animated:", 0, 1);
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  -[WFSearchBar setShowsCancelButton:animated:](self, "setShowsCancelButton:animated:", 1, 1);
  return 1;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4;

  -[WFSearchBar delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "searchBarDidBeginEditing:", self);

}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return objc_msgSend(a3, "resignFirstResponder");
}

- (void)_cancelButtonTapped:(id)a3
{
  void *v4;
  id v5;

  -[WFSearchBar reset](self, "reset", a3);
  -[WFSearchBar delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UISearchTextField text](self->_searchTextField, "text");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "searchBar:textDidChange:", self, v4);

  }
}

- (void)_searchBarTextFieldDidChangeText:(id)a3
{
  void *v4;
  id v5;

  -[WFSearchBar delegate](self, "delegate", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UISearchTextField text](self->_searchTextField, "text");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "searchBar:textDidChange:", self, v4);

  }
}

- (void)textFieldDidResignFirstResponder
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[UISearchTextField text](self->_searchTextField, "text");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3
    || (v4 = (void *)v3,
        -[UISearchTextField text](self->_searchTextField, "text"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "length"),
        v5,
        v4,
        !v6))
  {
    -[WFSearchBar setShowsCancelButton:animated:](self, "setShowsCancelButton:animated:", 0, 1);
  }
}

- (id)_currentVisualConfiguration
{
  _BOOL4 v3;
  int *v4;

  v3 = -[WFSearchBar showsCancelButton](self, "showsCancelButton");
  v4 = &OBJC_IVAR___WFSearchBar__inactiveSearchConfiguration;
  if (v3)
    v4 = &OBJC_IVAR___WFSearchBar__activeSearchConfiguration;
  return *(id *)((char *)&self->super.super.super.isa + *v4);
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
  -[WFSearchBar searchTextField](self, "searchTextField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intrinsicContentSize");
  v7 = v6;

  if (-[WFSearchBar isPortraitOrientation](self, "isPortraitOrientation"))
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
  UIButton *cancelButton;
  void *v10;
  void *v11;
  id v12;

  v3 = (void *)MEMORY[0x24BEBDAB0];
  -[WFSearchBar traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIContentSizeCategoryClip(v5, (void *)*MEMORY[0x24BEBE0A8], (void *)*MEMORY[0x24BEBE060]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollectionWithPreferredContentSizeCategory:", v6);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:compatibleWithTraitCollection:", *MEMORY[0x24BEBE1D0], v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton titleLabel](self->_cancelButton, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v7);

  -[UIButton sizeToFit](self->_cancelButton, "sizeToFit");
  cancelButton = self->_cancelButton;
  -[WFSearchBar traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "userInterfaceStyle") == 2)
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemWhiteColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitleColor:forState:](cancelButton, "setTitleColor:forState:", v11, 0);

}

- (WFSearchTextField)searchTextField
{
  return self->_searchTextField;
}

- (WFSearchBarDelegate)delegate
{
  return (WFSearchBarDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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

- (id)activeSearchConfiguration
{
  return self->_activeSearchConfiguration;
}

- (id)inactiveSearchConfiguration
{
  return self->_inactiveSearchConfiguration;
}

- (BOOL)isPortraitOrientation
{
  return self->_portraitOrientation;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_inactiveSearchConfiguration, 0);
  objc_storeStrong(&self->_activeSearchConfiguration, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_searchTextField, 0);
}

uint64_t __45__WFSearchBar_setShowsCancelButton_animated___block_invoke(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(_BYTE *)(a1 + 72);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "setAlpha:", (double)*(unint64_t *)&a2);
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  if (*(double *)(a1 + 40) != *(double *)(a1 + 56) || *(double *)(a1 + 48) != *(double *)(a1 + 64))
    objc_msgSend(*(id *)(a1 + 32), "_invalidateIntrinsicContentSizeAndNotify");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

@end
