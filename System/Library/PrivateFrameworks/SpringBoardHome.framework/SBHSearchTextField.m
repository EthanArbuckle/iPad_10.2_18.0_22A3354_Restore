@implementation SBHSearchTextField

- (SBHSearchTextField)initWithFrame:(CGRect)a3
{
  SBHSearchTextField *v3;
  SBHSearchTextField *v4;
  uint64_t v5;
  UIView *backgroundView;
  void *v7;
  UIView *v8;
  uint64_t v9;
  NSHashTable *styledViews;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  objc_super v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)SBHSearchTextField;
  v3 = -[SBHSearchTextField initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SBHSearchTextField setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("dewey-search-field"));
    -[SBHSearchTextField setBorderStyle:](v4, "setBorderStyle:", 0);
    objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:", 19);
    v5 = objc_claimAutoreleasedReturnValue();
    backgroundView = v4->_backgroundView;
    v4->_backgroundView = (UIView *)v5;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView layer](v4->_backgroundView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBorderWidth:", 0.3);

    -[SBHSearchTextField updateBorderVisualStyling](v4, "updateBorderVisualStyling");
    -[UIView setAutoresizingMask:](v4->_backgroundView, "setAutoresizingMask:", 18);
    v8 = v4->_backgroundView;
    -[SBHSearchTextField bounds](v4, "bounds");
    -[UIView setFrame:](v8, "setFrame:");
    -[UIView _setContinuousCornerRadius:](v4->_backgroundView, "_setContinuousCornerRadius:", 16.0);
    -[SBHSearchTextField addSubview:](v4, "addSubview:", v4->_backgroundView);
    -[SBHSearchTextField sendSubviewToBack:](v4, "sendSubviewToBack:", v4->_backgroundView);
    -[SBHSearchTextField setReturnKeyType:](v4, "setReturnKeyType:", 6);
    -[SBHSearchTextField setKeyboardAppearance:](v4, "setKeyboardAppearance:", 1);
    -[SBHSearchTextField setAutocorrectionType:](v4, "setAutocorrectionType:", 1);
    -[SBHSearchTextField setSpellCheckingType:](v4, "setSpellCheckingType:", 1);
    -[SBHSearchTextField setEnablesReturnKeyAutomatically:](v4, "setEnablesReturnKeyAutomatically:", 1);
    -[SBHSearchTextField setMinimumFontSize:](v4, "setMinimumFontSize:", 10.0);
    -[SBHSearchTextField updateVisualStyling](v4, "updateVisualStyling");
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v9 = objc_claimAutoreleasedReturnValue();
    styledViews = v4->_styledViews;
    v4->_styledViews = (NSHashTable *)v9;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v4, sel__didEndEditing_, *MEMORY[0x1E0DC54D8], v4);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v4, sel__didBeginEditing_, *MEMORY[0x1E0DC54C8], v4);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v4, sel__textDidChange_, *MEMORY[0x1E0DC54D0], v4);

    v4->_alignmentBehavior = 0;
    -[SBHSearchTextField _updateTextAlignmentForEditing:animated:](v4, "_updateTextAlignmentForEditing:animated:", 0, 0);
    objc_opt_self();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v14;
    objc_opt_self();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)-[SBHSearchTextField registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v16, sel__effectiveAppearanceDidChange);

  }
  return v4;
}

- (double)_calculateHeightWithFont
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[SBHSearchTextField traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayScale");

  -[SBHSearchTextField font](self, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lineHeight");
  v6 = v5 + 26.0;
  objc_msgSend(v4, "descender");
  v8 = v6 + v7;
  v9 = 48.0;
  if (v8 >= 48.0)
  {
    BSFloatCeilForScale();
    v9 = v10;
  }

  return v9;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  CGSize result;

  -[SBHSearchTextField _calculateHeightWithFont](self, "_calculateHeightWithFont");
  v4 = v3;
  v7.receiver = self;
  v7.super_class = (Class)SBHSearchTextField;
  -[UISearchTextField intrinsicContentSize](&v7, sel_intrinsicContentSize);
  v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
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
  objc_super v15;
  CGSize result;

  width = a3.width;
  v15.receiver = self;
  v15.super_class = (Class)SBHSearchTextField;
  -[SBHSearchTextField sizeThatFits:](&v15, sel_sizeThatFits_, a3.width, a3.height);
  v6 = v5;
  v8 = v7;
  -[SBHSearchTextField _calculateHeightWithFont](self, "_calculateHeightWithFont");
  v10 = v9;
  if (!SBHSizeGreaterThanOrEqualToSize(width, v9, v6, v8))
  {
    v11 = SBHSizeScaledToFill(width, v10, v6, v8);
    width = SBHSizeCeiling(v11);
    v10 = v12;
  }
  v13 = width;
  v14 = v10;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHSearchTextField;
  -[UISearchTextField layoutSubviews](&v3, sel_layoutSubviews);
  -[SBHSearchTextField updateVisualStyling](self, "updateVisualStyling");
}

- (BOOL)_shouldSendContentChangedNotificationsIfOnlyMarkedTextChanged
{
  return 1;
}

- (void)_didEndEditing:(id)a3
{
  -[SBHSearchTextField _updateTextAlignmentForEditing:animated:](self, "_updateTextAlignmentForEditing:animated:", 0, 1);
}

- (void)_didBeginEditing:(id)a3
{
  -[SBHSearchTextField _updateTextAlignmentForEditing:animated:](self, "_updateTextAlignmentForEditing:animated:", 1, 1);
}

- (void)_textDidChange:(id)a3
{
  uint64_t v4;

  if (-[SBHSearchTextField _hasSearchText](self, "_hasSearchText", a3))
    v4 = 3;
  else
    v4 = 1;
  -[SBHSearchTextField setClearButtonMode:](self, "setClearButtonMode:", v4);
}

- (void)setAlignmentBehavior:(int64_t)a3
{
  -[SBHSearchTextField setAlignmentBehavior:animated:](self, "setAlignmentBehavior:animated:", a3, 0);
}

- (void)setAlignmentBehavior:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_alignmentBehavior != a3)
  {
    self->_alignmentBehavior = a3;
    -[SBHSearchTextField _updateTextAlignmentForEditing:animated:](self, "_updateTextAlignmentForEditing:animated:", -[SBHSearchTextField isEditing](self, "isEditing"), a4);
  }
}

- (BOOL)_hasSearchText
{
  void *v2;
  BOOL v3;

  -[UISearchTextField text](self, "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

+ (int64_t)_derivedTextAlignmentForBehavior:(int64_t)a3 hasSearchText:(BOOL)a4 isEditing:(BOOL)a5
{
  int64_t v5;

  if (a5)
    v5 = 4;
  else
    v5 = 1;
  if (a3)
    return 4;
  else
    return v5;
}

- (int64_t)_derivedTextAlignment
{
  return -[SBHSearchTextField _derivedTextAlignmentIfEditing:](self, "_derivedTextAlignmentIfEditing:", -[SBHSearchTextField isEditing](self, "isEditing"));
}

- (int64_t)_derivedTextAlignmentIfEditing:(BOOL)a3
{
  return objc_msgSend((id)objc_opt_class(), "_derivedTextAlignmentForBehavior:hasSearchText:isEditing:", self->_alignmentBehavior, -[SBHSearchTextField _hasSearchText](self, "_hasSearchText"), a3);
}

- (void)_updateTextAlignmentForEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  int64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[6];

  v4 = a4;
  v6 = -[SBHSearchTextField _derivedTextAlignmentIfEditing:](self, "_derivedTextAlignmentIfEditing:", a3);
  if (v6 != -[SBHSearchTextField textAlignment](self, "textAlignment"))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __62__SBHSearchTextField__updateTextAlignmentForEditing_animated___block_invoke;
    v9[3] = &unk_1E8D84C78;
    v9[4] = self;
    v9[5] = v6;
    v7 = _Block_copy(v9);
    v8 = v7;
    if (v4)
      objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 6, v7, 0);
    else
      (*((void (**)(void *))v7 + 2))(v7);

  }
}

uint64_t __62__SBHSearchTextField__updateTextAlignmentForEditing_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  objc_msgSend(*(id *)(a1 + 32), "setTextAlignment:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)_effectiveAppearanceDidChange
{
  void *v3;
  NSString *v4;
  _BOOL4 IsAccessibilityCategory;

  -[NSHashTable removeAllObjects](self->_styledViews, "removeAllObjects");
  -[SBHSearchTextField updateVisualStyling](self, "updateVisualStyling");
  -[SBHSearchTextField updateBorderVisualStyling](self, "updateBorderVisualStyling");
  -[SBHSearchTextField traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (IsAccessibilityCategory)
    -[SBHSearchTextField invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)updateVisualStyling
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t *v20;
  uint64_t *v21;
  void *v22;
  void *v23;
  id v24;

  -[SBHSearchTextField traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0DC3E88];
  v24 = v3;
  objc_msgSend(v3, "preferredContentSizeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIContentSizeCategoryClip();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "traitCollectionWithPreferredContentSizeCategory:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:compatibleWithTraitCollection:", *MEMORY[0x1E0DC4B60], v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBHSearchTextField _derivedTextAlignment](self, "_derivedTextAlignment") == 1)
  {
    self->_alwaysHideLeadingView = 0;
  }
  else
  {
    objc_msgSend(v7, "preferredContentSizeCategory");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    self->_alwaysHideLeadingView = UIContentSizeCategoryIsAccessibilityCategory(v9);

  }
  -[SBHSearchTextField setFont:](self, "setFont:", v8);
  if (updateVisualStyling_onceToken != -1)
    dispatch_once(&updateVisualStyling_onceToken, &__block_literal_global_74);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHSearchTextField setTintColor:](self, "setTintColor:", v10);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHSearchTextField setTextColor:](self, "setTextColor:", v11);

  v12 = objc_msgSend(v24, "userInterfaceStyle");
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.32, 0.32, 0.32, 1.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[SBHSearchTextField leftView](self, "leftView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  SBFSafeCast();
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[SBHSearchTextField rightView](self, "rightView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  SBFSafeCast();
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHSearchTextField _clearButton](self, "_clearButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHSearchTextField _placeholderLabel](self, "_placeholderLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTextColor:", v13);
  v20 = &updateVisualStyling_darkModeMagnifyingGlass;
  if (v12 == 2)
  {
    v21 = &updateVisualStyling_darkModeCancel;
  }
  else
  {
    v20 = &updateVisualStyling_lightModeMagnifyingGlass;
    v21 = &updateVisualStyling_lightModeCancel;
  }
  objc_storeStrong((id *)&self->_magnifyingGlassImage, (id)*v20);
  if (objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection") == 1)
    v22 = v17;
  else
    v22 = v15;
  objc_msgSend(v22, "setImage:", self->_magnifyingGlassImage);
  objc_storeStrong((id *)&self->_cancelButtonImage, (id)*v21);
  objc_msgSend(v18, "setImage:forState:", self->_cancelButtonImage, 0);
  -[SBHSearchTextField updateStyleForLeftView](self, "updateStyleForLeftView");
  -[SBHSearchTextField updateStyleForRightView](self, "updateStyleForRightView");
  -[SBHSearchTextField updateStyleForClearButton](self, "updateStyleForClearButton");
  -[SBHSearchTextField updateStyleForPlaceholderView](self, "updateStyleForPlaceholderView");
  -[SBHSearchTextField layer](self, "layer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAllowsGroupBlending:", 0);

}

void __41__SBHSearchTextField_updateVisualStyling__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithWeight:", 4);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:withConfiguration:", CFSTR("magnifyingglass"), v16);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.32, 0.32, 0.32, 1.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageWithTintColor:renderingMode:", v1, 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)updateVisualStyling_darkModeMagnifyingGlass;
  updateVisualStyling_darkModeMagnifyingGlass = v2;

  objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:withConfiguration:", CFSTR("magnifyingglass"), v16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.32, 0.32, 0.32, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageWithTintColor:renderingMode:", v5, 1);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)updateVisualStyling_lightModeMagnifyingGlass;
  updateVisualStyling_lightModeMagnifyingGlass = v6;

  objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:withConfiguration:", CFSTR("xmark.circle.fill"), v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.32, 0.32, 0.32, 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageWithTintColor:renderingMode:", v9, 1);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)updateVisualStyling_darkModeCancel;
  updateVisualStyling_darkModeCancel = v10;

  objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:withConfiguration:", CFSTR("xmark.circle.fill"), v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.32, 0.32, 0.32, 1.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "imageWithTintColor:renderingMode:", v13, 1);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)updateVisualStyling_lightModeCancel;
  updateVisualStyling_lightModeCancel = v14;

}

- (void)setFont:(id)a3
{
  id v4;
  void *v5;
  char v6;
  objc_super v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBHSearchTextField;
  -[SBHSearchTextField font](&v8, sel_font);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)SBHSearchTextField;
    -[SBHSearchTextField setFont:](&v7, sel_setFont_, v4);
    -[SBHSearchTextField invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }

}

- (void)setReturnKeyType:(int64_t)a3
{
  void *v5;
  objc_super v6;

  if (-[SBHSearchTextField returnKeyType](self, "returnKeyType") != a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)SBHSearchTextField;
    -[SBHSearchTextField setReturnKeyType:](&v6, sel_setReturnKeyType_, a3);
    objc_msgSend(MEMORY[0x1E0DC3958], "activeInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "takeTextInputTraitsFromDelegate");
    objc_msgSend(v5, "updateReturnKey:", 1);

  }
}

- (CGRect)placeholderRectForBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  int64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[SBHSearchTextField _derivedTextAlignment](self, "_derivedTextAlignment");
  -[SBHSearchTextField _calculatePlaceholderRectForBounds:alignment:isRTL:](self, "_calculatePlaceholderRectForBounds:alignment:isRTL:", v8, objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection") == 1, x, y, width, height);
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (CGRect)textRectForBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  int64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[SBHSearchTextField _derivedTextAlignment](self, "_derivedTextAlignment");
  -[SBHSearchTextField _calculateTextRectForBounds:alignment:isRTL:](self, "_calculateTextRectForBounds:alignment:isRTL:", v8, objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection") == 1, x, y, width, height);
  -[SBHSearchTextField _adjustedTextOrEditingRect:forBounds:](self, "_adjustedTextOrEditingRect:forBounds:");
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  int64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[SBHSearchTextField _derivedTextAlignment](self, "_derivedTextAlignment");
  -[SBHSearchTextField _calculateEditingRectForBounds:alignment:isRTL:](self, "_calculateEditingRectForBounds:alignment:isRTL:", v8, objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection") == 1, x, y, width, height);
  -[SBHSearchTextField _adjustedTextOrEditingRect:forBounds:](self, "_adjustedTextOrEditingRect:forBounds:");
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (CGRect)clearButtonRectForBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  int64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[SBHSearchTextField _derivedTextAlignment](self, "_derivedTextAlignment");
  if (objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection") == 1)
    -[SBHSearchTextField _frameForLeftViewWithinBounds:alignment:](self, "_frameForLeftViewWithinBounds:alignment:", v8, x, y, width, height);
  else
    -[SBHSearchTextField _frameForRightViewWithinBounds:alignment:](self, "_frameForRightViewWithinBounds:alignment:", v8, x, y, width, height);
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (CGRect)leftViewRectForBounds:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[SBHSearchTextField _frameForLeftViewWithinBounds:alignment:](self, "_frameForLeftViewWithinBounds:alignment:", -[SBHSearchTextField _derivedTextAlignment](self, "_derivedTextAlignment"), a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)rightViewRectForBounds:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[SBHSearchTextField _frameForRightViewWithinBounds:alignment:](self, "_frameForRightViewWithinBounds:alignment:", -[SBHSearchTextField _derivedTextAlignment](self, "_derivedTextAlignment"), a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)updateStyleForPlaceholderView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[SBHSearchTextField _placeholderView](self, "_placeholderView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!-[NSHashTable containsObject:](self->_styledViews, "containsObject:"))
  {
    -[UIView visualStylingProviderForCategory:](self->_backgroundView, "visualStylingProviderForCategory:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "automaticallyUpdateView:withStyle:", v7, 1);

    objc_msgSend(v7, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2EA0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCompositingFilter:", v5);

    -[NSHashTable addObject:](self->_styledViews, "addObject:", v7);
  }
  objc_opt_class();
  SBFSafeCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAdjustsFontSizeToFitWidth:", 1);

}

- (void)updateStyleForLeftView
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  -[SBHSearchTextField leftView](self, "leftView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!-[NSHashTable containsObject:](self->_styledViews, "containsObject:"))
  {
    -[UIView visualStylingProviderForCategory:](self->_backgroundView, "visualStylingProviderForCategory:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "automaticallyUpdateView:withStyle:", v7, 1);

    objc_msgSend(v7, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2EA0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCompositingFilter:", v5);

    objc_msgSend(v7, "setContentMode:", 1);
    -[NSHashTable addObject:](self->_styledViews, "addObject:", v7);

  }
  if (objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection") != 1)
  {
    if (self->_alwaysHideLeadingView)
      v6 = 0;
    else
      v6 = 3;
    -[SBHSearchTextField setLeftViewMode:](self, "setLeftViewMode:", v6);
  }

}

- (void)updateStyleForRightView
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  -[SBHSearchTextField rightView](self, "rightView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!-[NSHashTable containsObject:](self->_styledViews, "containsObject:"))
  {
    -[UIView visualStylingProviderForCategory:](self->_backgroundView, "visualStylingProviderForCategory:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "automaticallyUpdateView:withStyle:", v7, 1);

    objc_msgSend(v7, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2EA0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCompositingFilter:", v5);

    objc_msgSend(v7, "setContentMode:", 1);
    -[NSHashTable addObject:](self->_styledViews, "addObject:", v7);

  }
  if (objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection") == 1)
  {
    if (self->_alwaysHideLeadingView)
      v6 = 0;
    else
      v6 = 3;
    -[SBHSearchTextField setRightViewMode:](self, "setRightViewMode:", v6);
  }

}

- (void)updateStyleForClearButton
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[SBHSearchTextField _clearButton](self, "_clearButton");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!-[NSHashTable containsObject:](self->_styledViews, "containsObject:"))
  {
    -[UIView visualStylingProviderForCategory:](self->_backgroundView, "visualStylingProviderForCategory:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "automaticallyUpdateView:withStyle:", v6, 1);

    objc_msgSend(v6, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2EA0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCompositingFilter:", v5);

    objc_msgSend(v6, "setContentMode:", 1);
    -[NSHashTable addObject:](self->_styledViews, "addObject:", v6);

  }
}

- (void)_setContinuousCornerRadius:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBHSearchTextField;
  -[SBHSearchTextField _setContinuousCornerRadius:](&v5, sel__setContinuousCornerRadius_);
  -[UIView _setContinuousCornerRadius:](self->_backgroundView, "_setContinuousCornerRadius:", a3);
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double Height;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  CGRect v23;

  v6 = a5;
  -[SBHSearchTextField bounds](self, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  Height = v13;
  if (-[SBHSearchTextField _derivedTextAlignment](self, "_derivedTextAlignment") != 1)
  {
    -[SBHSearchTextField editingRectForBounds:](self, "editingRectForBounds:", v8, v10, v12, Height);
    v16 = v15;
    v18 = v17;
    v23.origin.x = v8;
    v23.origin.y = v10;
    v23.size.width = v12;
    v23.size.height = Height;
    Height = CGRectGetHeight(v23);
    v10 = 0.0;
    v8 = v16;
    v12 = v18;
  }
  v19 = (void *)MEMORY[0x1E0DC3B28];
  objc_msgSend(v6, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "regionWithRect:identifier:", v20, v8, v10, v12, Height);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0DC3B30];
  -[SBHSearchTextField font](self, "font", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lineHeight");
  objc_msgSend(v4, "beamWithPreferredLength:axis:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithShape:constrainedAxes:", v6, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CGRect)_frameForLeftViewWithinBounds:(CGRect)a3 alignment:(int64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SBHSearchTextField traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayScale");
  v12 = v11;

  UIRectCenteredYInRectScale();
  if (a4 == 1)
  {
    -[SBHSearchTextField _calculatePlaceholderRectForBounds:alignment:isRTL:](self, "_calculatePlaceholderRectForBounds:alignment:isRTL:", 1, 0, x, y, width, height, v12);
  }
  else
  {
    v13 = x;
    v14 = y;
    v15 = width;
    v16 = height;
  }
  CGRectGetMinX(*(CGRect *)&v13);
  UIRectCenteredYInRectScale();
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGRect)_frameForRightViewWithinBounds:(CGRect)a3 alignment:(int64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SBHSearchTextField traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayScale");
  v12 = v11;

  UIRectCenteredYInRectScale();
  if (a4 == 1)
  {
    -[SBHSearchTextField _calculatePlaceholderRectForBounds:alignment:isRTL:](self, "_calculatePlaceholderRectForBounds:alignment:isRTL:", 1, 1, x, y, width, height, v12);
  }
  else
  {
    v13 = x;
    v14 = y;
    v15 = width;
    v16 = height;
  }
  CGRectGetMaxX(*(CGRect *)&v13);
  UIRectCenteredYInRectScale();
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGRect)_calculateEditingRectForBounds:(CGRect)a3 alignment:(int64_t)a4 isRTL:(BOOL)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  v5 = a3.size.height + -26.0;
  v6 = v5 + 8.0 + 16.0;
  if (v5 < 0.0)
    v6 = 24.0;
  if (self->_alwaysHideLeadingView)
    v6 = 16.0;
  v7 = a3.origin.x + v6;
  v8 = a3.origin.y + 13.0;
  v9 = a3.size.width - (v6 + v6);
  result.size.height = v5;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGRect)_calculateTextRectForBounds:(CGRect)a3 alignment:(int64_t)a4 isRTL:(BOOL)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  if (a4 == 1)
  {
    -[SBHSearchTextField _frameForPlaceholderRectForBounds:alignment:isRTL:willOverflow:](self, "_frameForPlaceholderRectForBounds:alignment:isRTL:willOverflow:", 1, a5, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  }
  else
  {
    v8 = a3.size.height + -26.0;
    v9 = v8 + 8.0 + 16.0;
    if (v8 < 0.0)
      v9 = 24.0;
    if (self->_alwaysHideLeadingView)
      v9 = 16.0;
    v5 = a3.origin.x + v9;
    v6 = a3.origin.y + 13.0;
    v7 = a3.size.width - (v9 + v9);
  }
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)_calculatePlaceholderRectForBounds:(CGRect)a3 alignment:(int64_t)a4 isRTL:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  double y;
  double x;
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
  double v24;
  double v25;
  double MinX;
  double v27;
  uint64_t v28;
  double v32;
  double v33;
  CGRect result;

  v5 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SBHSearchTextField traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "displayScale");

  -[SBHSearchTextField _frameForPlaceholderRectForBounds:alignment:isRTL:willOverflow:](self, "_frameForPlaceholderRectForBounds:alignment:isRTL:willOverflow:", a4, v5, 0, x, y, width, height);
  v15 = v14;
  v17 = v16;
  if (a4 == 1)
  {
    if (height + -26.0 >= 0.0)
      v18 = height + -26.0 + 8.0;
    else
      v18 = 8.0;
    UIRectCenteredXInRectScale();
    v15 = v22;
    v23 = -2.0;
    if (v5)
      v23 = 2.0;
    v24 = v23 + v19;
    v25 = -0.0;
    if (!v5)
      v25 = v18;
    MinX = v25 + v24;
    v17 = v20 - v18;
  }
  else
  {
    v27 = v13;
    -[SBHSearchTextField _calculateTextRectForBounds:alignment:isRTL:](self, "_calculateTextRectForBounds:alignment:isRTL:", a4, v5, x, y, width, height);
    if (v5)
      MinX = CGRectGetMaxX(*(CGRect *)&v28) - (v17 + 8.0);
    else
      MinX = CGRectGetMinX(*(CGRect *)&v28);
    v21 = v27;
  }
  v32 = v15;
  v33 = v17;
  result.size.height = v21;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = MinX;
  return result;
}

- (CGRect)_frameForPlaceholderRectForBounds:(CGRect)a3 alignment:(int64_t)a4 isRTL:(BOOL)a5 willOverflow:(BOOL *)a6
{
  double height;
  double width;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  _QWORD v22[2];
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  v22[1] = *MEMORY[0x1E0C80C00];
  -[SBHSearchTextField traitCollection](self, "traitCollection", a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayScale");

  v11 = height + -26.0;
  if (height + -26.0 < 0.0)
    v11 = 0.0;
  v12 = width - (v11 * 2.0 + 16.0);
  -[SBHSearchTextField placeholder](self, "placeholder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = *MEMORY[0x1E0DC1138];
  -[SBHSearchTextField font](self, "font");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "boundingRectWithSize:options:attributes:context:", 0, v15, 0, width, height);

  BSSizeCeilForScale();
  if (a6)
    *a6 = v16 > v12;
  UIRectCenteredIntegralRectScale();
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

+ (id)borderColorForUserInterfaceStyle:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((unint64_t)a3 > 2)
    return 0;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", dbl_1D01957D8[a3], 0.08, v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)updateBorderVisualStyling
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;

  -[SBHSearchTextField traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  -[UIView layer](self->_backgroundView, "layer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "borderColorForUserInterfaceStyle:", v4);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "setBorderColor:", objc_msgSend(v5, "CGColor"));

}

- (CGRect)_adjustedTextOrEditingRect:(CGRect)a3 forBounds:(CGRect)a4
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  -[SBHSearchTextField traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayScale");

  -[SBHSearchTextField bounds](self, "bounds");
  -[SBHSearchTextField _padding](self, "_padding");
  -[SBHSearchTextField font](self, "font");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lineHeight");

  BSFloatFloorForScale();
  UIRectCenteredYInRectScale();
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (int64_t)alignmentBehavior
{
  return self->_alignmentBehavior;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelButtonImage, 0);
  objc_storeStrong((id *)&self->_magnifyingGlassImage, 0);
  objc_storeStrong((id *)&self->_styledViews, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
