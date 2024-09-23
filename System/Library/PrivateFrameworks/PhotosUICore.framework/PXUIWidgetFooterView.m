@implementation PXUIWidgetFooterView

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateRespondsTo.didSelectDisclosure = objc_opt_respondsToSelector() & 1;
  }

}

- (void)setDisclosureTitle:(id)a3
{
  NSString *v4;
  NSString *v5;
  NSString *v6;
  char v7;
  NSString *v8;
  NSString *disclosureTitle;
  _QWORD v10[5];

  v4 = (NSString *)a3;
  v5 = self->_disclosureTitle;
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
      disclosureTitle = self->_disclosureTitle;
      self->_disclosureTitle = v8;

      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __43__PXUIWidgetFooterView_setDisclosureTitle___block_invoke;
      v10[3] = &unk_1E5149198;
      v10[4] = self;
      -[PXUIWidgetFooterView performChanges:](self, "performChanges:", v10);
    }
  }

}

- (void)setFont:(id)a3
{
  UIFont *v5;
  UIFont *v6;
  UIFont *v7;
  char v8;
  _QWORD v9[5];

  v5 = (UIFont *)a3;
  v6 = self->_font;
  if (v6 == v5)
  {

  }
  else
  {
    v7 = v6;
    v8 = -[UIFont isEqual:](v5, "isEqual:", v6);

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_font, a3);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __32__PXUIWidgetFooterView_setFont___block_invoke;
      v9[3] = &unk_1E5149198;
      v9[4] = self;
      -[PXUIWidgetFooterView performChanges:](self, "performChanges:", v9);
    }
  }

}

- (void)setLayoutStyle:(int64_t)a3
{
  _QWORD v4[5];

  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    -[PXUIWidgetFooterView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __39__PXUIWidgetFooterView_setLayoutStyle___block_invoke;
    v4[3] = &unk_1E5149198;
    v4[4] = self;
    -[PXUIWidgetFooterView performChanges:](self, "performChanges:", v4);
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
    -[PXUIWidgetFooterView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)updateConstraints
{
  void *v3;
  uint64_t v4;
  id v5;
  void (**v6)(void *, void *, void *, double);
  id v7;
  void (**v8)(void *, void *, void *, double);
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
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  objc_super v40;
  _QWORD v41[4];
  id v42;
  _QWORD aBlock[4];
  id v44;
  _QWORD v45[3];
  _QWORD v46[5];

  v46[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__PXUIWidgetFooterView_updateConstraints__block_invoke;
  aBlock[3] = &unk_1E511A3D8;
  v5 = v3;
  v44 = v5;
  v6 = (void (**)(void *, void *, void *, double))_Block_copy(aBlock);
  v41[0] = v4;
  v41[1] = 3221225472;
  v41[2] = __41__PXUIWidgetFooterView_updateConstraints__block_invoke_2;
  v41[3] = &unk_1E511A3D8;
  v7 = v5;
  v42 = v7;
  v8 = (void (**)(void *, void *, void *, double))_Block_copy(v41);
  if (-[PXUIWidgetFooterView _hasContent](self, "_hasContent"))
  {
    -[PXUIWidgetFooterView _disclosureButton](self, "_disclosureButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXUIWidgetFooterView _leadingSeparator](self, "_leadingSeparator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXUIWidgetFooterView _trailingSeparator](self, "_trailingSeparator");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXUIWidgetFooterView contentInsets](self, "contentInsets");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v19 = v10;
    _NSDictionaryOfVariableBindings(CFSTR("leadingSeparator, button, trailingSeparator"), v10, v9, v38, 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = CFSTR("leadingMargin");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v20;
    v45[1] = CFSTR("trailingMargin");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v45[2] = CFSTR("padding");
    v46[1] = v21;
    v46[2] = &unk_1E53F10D8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-leadingMargin-[leadingSeparator(trailingSeparator)]-padding-[button(>=200)]-padding-[trailingSeparator(<=885@249)]-trailingMargin-|"), 1024, v22, v39);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v23);

    objc_msgSend(v9, "topAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXUIWidgetFooterView topAnchor](self, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v24, v25, v12);

    objc_msgSend(v19, "centerYAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXUIWidgetFooterView centerYAnchor](self, "centerYAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v26, v27, 0.0);

    objc_msgSend(v9, "centerYAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXUIWidgetFooterView centerYAnchor](self, "centerYAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v28, v29, 0.0);

    objc_msgSend(v38, "centerYAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXUIWidgetFooterView centerYAnchor](self, "centerYAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v30, v31, 0.0);

    objc_msgSend(v19, "heightAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToConstant:", 2.0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setActive:", 1);

    objc_msgSend(v38, "heightAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToConstant:", 2.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setActive:", 1);

    -[PXUIWidgetFooterView bottomAnchor](self, "bottomAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bottomAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v36, v37, v16);

  }
  -[PXUIWidgetFooterView _setConstraints:](self, "_setConstraints:", v7);
  v40.receiver = self;
  v40.super_class = (Class)PXUIWidgetFooterView;
  -[PXUIWidgetFooterView updateConstraints](&v40, sel_updateConstraints);

}

- (void)tintColorDidChange
{
  _QWORD v3[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXUIWidgetFooterView;
  -[PXUIWidgetFooterView tintColorDidChange](&v4, sel_tintColorDidChange);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__PXUIWidgetFooterView_tintColorDidChange__block_invoke;
  v3[3] = &unk_1E5149198;
  v3[4] = self;
  -[PXUIWidgetFooterView performChanges:](self, "performChanges:", v3);
}

- (id)_disclosureButtonCreateIfNeeded:(BOOL)a3
{
  UIButton *disclosureButton;
  BOOL v5;
  UIButton *v6;
  UIButton *v7;

  disclosureButton = self->__disclosureButton;
  if (disclosureButton)
    v5 = 1;
  else
    v5 = !a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v6 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v7 = self->__disclosureButton;
    self->__disclosureButton = v6;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->__disclosureButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton addTarget:action:forControlEvents:](self->__disclosureButton, "addTarget:action:forControlEvents:", self, sel__handleDisclosureButton_, 0x2000);
    -[PXUIWidgetFooterView addSubview:](self, "addSubview:", self->__disclosureButton);
    disclosureButton = self->__disclosureButton;
  }
  return disclosureButton;
}

- (id)_leadingSeparatorCreateIfNeeded:(BOOL)a3
{
  UIView *leadingSeparator;
  BOOL v5;
  UIView *v6;
  UIView *v7;

  leadingSeparator = self->__leadingSeparator;
  if (leadingSeparator)
    v5 = 1;
  else
    v5 = !a3;
  if (!v5)
  {
    v6 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    v7 = self->__leadingSeparator;
    self->__leadingSeparator = v6;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->__leadingSeparator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PXUIWidgetFooterView addSubview:](self, "addSubview:", self->__leadingSeparator);
    leadingSeparator = self->__leadingSeparator;
  }
  return leadingSeparator;
}

- (id)_trailingSeparatorCreateIfNeeded:(BOOL)a3
{
  UIView *trailingSeparator;
  BOOL v5;
  UIView *v6;
  UIView *v7;

  trailingSeparator = self->__trailingSeparator;
  if (trailingSeparator)
    v5 = 1;
  else
    v5 = !a3;
  if (!v5)
  {
    v6 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    v7 = self->__trailingSeparator;
    self->__trailingSeparator = v6;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->__trailingSeparator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PXUIWidgetFooterView addSubview:](self, "addSubview:", self->__trailingSeparator);
    trailingSeparator = self->__trailingSeparator;
  }
  return trailingSeparator;
}

- (id)_focusGuideCreateIfNeeded:(BOOL)a3
{
  UIFocusGuide *focusGuide;
  BOOL v5;
  UIFocusGuide *v6;
  UIFocusGuide *v7;
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

  focusGuide = self->__focusGuide;
  if (focusGuide)
    v5 = 1;
  else
    v5 = !a3;
  if (!v5)
  {
    v6 = (UIFocusGuide *)objc_alloc_init(MEMORY[0x1E0DC37D0]);
    v7 = self->__focusGuide;
    self->__focusGuide = v6;

    -[PXUIWidgetFooterView addLayoutGuide:](self, "addLayoutGuide:", self->__focusGuide);
    -[UIFocusGuide leftAnchor](self->__focusGuide, "leftAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXUIWidgetFooterView leftAnchor](self, "leftAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setActive:", 1);

    -[UIFocusGuide topAnchor](self->__focusGuide, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXUIWidgetFooterView topAnchor](self, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setActive:", 1);

    -[UIFocusGuide bottomAnchor](self->__focusGuide, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXUIWidgetFooterView bottomAnchor](self, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setActive:", 1);

    -[UIFocusGuide rightAnchor](self->__focusGuide, "rightAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXUIWidgetFooterView rightAnchor](self, "rightAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setActive:", 1);

    focusGuide = self->__focusGuide;
  }
  return focusGuide;
}

- (void)_setHasContent:(BOOL)a3
{
  _QWORD v4[5];

  if (self->__hasContent != a3)
  {
    self->__hasContent = a3;
    -[PXUIWidgetFooterView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __39__PXUIWidgetFooterView__setHasContent___block_invoke;
    v4[3] = &unk_1E5149198;
    v4[4] = self;
    -[PXUIWidgetFooterView performChanges:](self, "performChanges:", v4);
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

- (void)_handleDisclosureButton:(id)a3
{
  id v4;
  id v5;

  if (self->_delegateRespondsTo.didSelectDisclosure)
  {
    v4 = a3;
    -[PXUIWidgetFooterView delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "widgetFooterView:didSelectDisclosure:", self, v4);

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
    -[PXUIWidgetFooterView _updateIfNeeded](self, "_updateIfNeeded");
    v4 = v6;
  }

}

- (void)_updateIfNeeded
{
  BOOL isPerformingUpdates;
  id v5;

  if (-[PXUIWidgetFooterView _needsUpdate](self, "_needsUpdate"))
  {
    isPerformingUpdates = self->_isPerformingUpdates;
    self->_isPerformingUpdates = 1;
    -[PXUIWidgetFooterView _updateHasContentIfNeeded](self, "_updateHasContentIfNeeded");
    -[PXUIWidgetFooterView _updateDisclosureIfNeeded](self, "_updateDisclosureIfNeeded");
    -[PXUIWidgetFooterView _updateSeparatorsIfNeeded](self, "_updateSeparatorsIfNeeded");
    -[PXUIWidgetFooterView _updateFocusGuideIfNeeded](self, "_updateFocusGuideIfNeeded");
    self->_isPerformingUpdates = isPerformingUpdates;
    if (-[PXUIWidgetFooterView _needsUpdate](self, "_needsUpdate"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUIWidgetFooterView.m"), 246, CFSTR("update still needed after update pass"));

    }
  }
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.hasContent
      || self->_needsUpdateFlags.disclosure
      || self->_needsUpdateFlags.separators
      || self->_needsUpdateFlags.focusGuide;
}

- (void)_setNeedsUpdate
{
  id v4;

  if (!self->_isPerformingChanges && !self->_isPerformingUpdates)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUIWidgetFooterView.m"), 259, CFSTR("not inside -performChanges: or _updateIfNeeded"));

  }
}

- (void)_invalidateHasContent
{
  self->_needsUpdateFlags.hasContent = 1;
  -[PXUIWidgetFooterView _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateHasContentIfNeeded
{
  void *v3;
  _BOOL8 v4;

  if (self->_needsUpdateFlags.hasContent)
  {
    self->_needsUpdateFlags.hasContent = 0;
    -[PXUIWidgetFooterView disclosureTitle](self, "disclosureTitle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "length") != 0;

    -[PXUIWidgetFooterView _setHasContent:](self, "_setHasContent:", v4);
  }
}

- (void)_invalidateDisclosure
{
  self->_needsUpdateFlags.disclosure = 1;
  -[PXUIWidgetFooterView _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateDisclosureIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  if (self->_needsUpdateFlags.disclosure)
  {
    self->_needsUpdateFlags.disclosure = 0;
    -[PXUIWidgetFooterView disclosureTitle](self, "disclosureTitle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "length");
    -[PXUIWidgetFooterView _disclosureButtonCreateIfNeeded:](self, "_disclosureButtonCreateIfNeeded:", v4 != 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      if (-[PXUIWidgetFooterView layoutStyle](self, "layoutStyle") != 1)
      {
        -[PXUIWidgetFooterView font](self, "font");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
        {
          v10 = v8;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
          v10 = (id)objc_claimAutoreleasedReturnValue();
        }
        v11 = v10;

        if (v3)
        {
          v12 = objc_alloc(MEMORY[0x1E0CB3498]);
          v14 = *MEMORY[0x1E0DC1138];
          v15[0] = v11;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = (void *)objc_msgSend(v12, "initWithString:attributes:", v3, v13);

        }
        else
        {
          v7 = 0;
        }

        v6 = 0;
        goto LABEL_14;
      }
      v6 = v3;
    }
    else
    {
      v6 = 0;
    }
    v7 = 0;
LABEL_14:
    objc_msgSend(v5, "px_setTitle:orAttributedTitle:forState:", v6, v7, 0);
    objc_msgSend(v5, "setHidden:", v4 == 0);

  }
}

- (void)_invalidateSeparators
{
  self->_needsUpdateFlags.separators = 1;
  -[PXUIWidgetFooterView _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateSeparatorsIfNeeded
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void (**v9)(void *, void *);
  _QWORD v10[4];
  id v11;
  BOOL v12;

  if (self->_needsUpdateFlags.separators)
  {
    self->_needsUpdateFlags.separators = 0;
    v3 = 0;
    if (-[PXUIWidgetFooterView _hasContent](self, "_hasContent"))
      v3 = -[PXUIWidgetFooterView layoutStyle](self, "layoutStyle") == 1;
    -[PXUIWidgetFooterView _leadingSeparatorCreateIfNeeded:](self, "_leadingSeparatorCreateIfNeeded:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXUIWidgetFooterView _trailingSeparatorCreateIfNeeded:](self, "_trailingSeparatorCreateIfNeeded:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.349999994, 0.600000024);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXUIWidgetFooterView _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __49__PXUIWidgetFooterView__updateSeparatorsIfNeeded__block_invoke;
    v10[3] = &unk_1E511A400;
    v12 = v3;
    v11 = v7;
    v8 = v7;
    v9 = (void (**)(void *, void *))_Block_copy(v10);
    v9[2](v9, v4);
    v9[2](v9, v5);

  }
}

- (void)_invalidateFocusGuide
{
  self->_needsUpdateFlags.focusGuide = 1;
  -[PXUIWidgetFooterView _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateFocusGuideIfNeeded
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (self->_needsUpdateFlags.focusGuide)
  {
    self->_needsUpdateFlags.focusGuide = 0;
    if (-[PXUIWidgetFooterView _hasContent](self, "_hasContent"))
    {
      v3 = -[PXUIWidgetFooterView layoutStyle](self, "layoutStyle");
      -[PXUIWidgetFooterView _focusGuideCreateIfNeeded:](self, "_focusGuideCreateIfNeeded:", v3 == 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3 == 1)
      {
        -[PXUIWidgetFooterView _disclosureButton](self, "_disclosureButton");
        v5 = objc_claimAutoreleasedReturnValue();
        if (v5)
        {
          v6 = (void *)v5;
          v8[0] = v5;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setPreferredFocusEnvironments:", v7);

LABEL_8:
          return;
        }
      }
    }
    else
    {
      -[PXUIWidgetFooterView _focusGuideCreateIfNeeded:](self, "_focusGuideCreateIfNeeded:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "setPreferredFocusEnvironments:", MEMORY[0x1E0C9AA60]);
    goto LABEL_8;
  }
}

- (PXUIWidgetFooterViewDelegate)delegate
{
  return (PXUIWidgetFooterViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSString)disclosureTitle
{
  return self->_disclosureTitle;
}

- (UIFont)font
{
  return self->_font;
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

- (BOOL)_hasContent
{
  return self->__hasContent;
}

- (NSArray)_constraints
{
  return self->__constraints;
}

- (UIButton)_disclosureButton
{
  return self->__disclosureButton;
}

- (UIView)_leadingSeparator
{
  return self->__leadingSeparator;
}

- (UIView)_trailingSeparator
{
  return self->__trailingSeparator;
}

- (UIFocusGuide)_focusGuide
{
  return self->__focusGuide;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__focusGuide, 0);
  objc_storeStrong((id *)&self->__trailingSeparator, 0);
  objc_storeStrong((id *)&self->__leadingSeparator, 0);
  objc_storeStrong((id *)&self->__disclosureButton, 0);
  objc_storeStrong((id *)&self->__constraints, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_disclosureTitle, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __49__PXUIWidgetFooterView__updateSeparatorsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  id v5;

  v3 = a2;
  v5 = v3;
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(v3, "setBackgroundColor:", *(_QWORD *)(a1 + 32));
    v3 = v5;
    v4 = *(_BYTE *)(a1 + 40) == 0;
  }
  else
  {
    v4 = 1;
  }
  objc_msgSend(v3, "setHidden:", v4);

}

uint64_t __39__PXUIWidgetFooterView__setHasContent___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateSeparators");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateFocusGuide");
}

uint64_t __42__PXUIWidgetFooterView_tintColorDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateSeparators");
}

void __41__PXUIWidgetFooterView_updateConstraints__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v3;
  id v4;

  if (a2)
  {
    if (a3)
    {
      v3 = *(void **)(a1 + 32);
      objc_msgSend(a2, "constraintEqualToAnchor:constant:");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v4);

    }
  }
}

void __41__PXUIWidgetFooterView_updateConstraints__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v3;
  id v4;

  if (a2)
  {
    if (a3)
    {
      v3 = *(void **)(a1 + 32);
      objc_msgSend(a2, "constraintGreaterThanOrEqualToAnchor:constant:");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v4);

    }
  }
}

uint64_t __39__PXUIWidgetFooterView_setLayoutStyle___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateSeparators");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateFocusGuide");
}

uint64_t __32__PXUIWidgetFooterView_setFont___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateDisclosure");
}

uint64_t __43__PXUIWidgetFooterView_setDisclosureTitle___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateHasContent");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateDisclosure");
}

@end
