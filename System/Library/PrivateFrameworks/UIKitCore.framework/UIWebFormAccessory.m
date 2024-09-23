@implementation UIWebFormAccessory

+ (id)toolbarWithItems:(id)a3
{
  id v3;
  UIToolbar *v4;

  v3 = a3;
  v4 = objc_alloc_init(UIToolbar);
  -[UIToolbar setBarStyle:](v4, "setBarStyle:", 0);
  -[UIToolbar setTranslucent:](v4, "setTranslucent:", 1);
  -[UIView setAutoresizingMask:](v4, "setAutoresizingMask:", 18);
  -[UIToolbar setItems:](v4, "setItems:", v3);

  return v4;
}

- (void)initForUCB:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  UIBarButtonItem *v8;
  UIBarButtonItem *autofill;
  UIBarButtonItem *v10;
  void *v11;
  UIBarButtonItem *v12;
  UIBarButtonItem *previousItem;
  void *v14;
  UIBarButtonItem *v15;
  void *v16;
  UIBarButtonItem *v17;
  UIBarButtonItem *nextItem;
  void *v19;
  UIBarButtonItemGroup *v20;
  void *v21;
  UIBarButtonItemGroup *v22;
  UIBarButtonItemGroup *buttonGroupAutoFill;
  UIBarButtonItemGroup *v24;
  UIBarButtonItem *v25;
  void *v26;
  UIBarButtonItemGroup *v27;
  UIBarButtonItemGroup *buttonGroupNavigation;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  _QWORD v36[2];
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v35 = a3;
  +[UIButton buttonWithType:](UIButton, "buttonWithType:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addTarget:action:forControlEvents:", self, sel_autoFill_, 64);
  -[UIView bounds](self, "bounds");
  v6 = v5;
  objc_msgSend(v4, "setFrame:", 0.0, 0.0, 0.0);
  +[UIColor labelColor](UIColor, "labelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTintColor:", v7);

  objc_msgSend(v4, "titleLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setFrame:", 0.0, 0.0, 0.0, v6);
  objc_msgSend(v34, "setNumberOfLines:", 2);
  v8 = -[UIBarButtonItem initWithCustomView:]([UIBarButtonItem alloc], "initWithCustomView:", v4);
  autofill = self->_autofill;
  self->_autofill = v8;

  v10 = [UIBarButtonItem alloc];
  +[UIImage kitImageNamed:](UIImage, "kitImageNamed:", CFSTR("UIButtonBarArrowUp"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[UIBarButtonItem initWithImage:style:target:action:](v10, "initWithImage:style:target:action:", v11, 0, self, sel__previousTapped_);
  previousItem = self->_previousItem;
  self->_previousItem = v12;

  +[UIColor blackColor](UIColor, "blackColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem setTintColor:](self->_previousItem, "setTintColor:", v14);

  -[UIBarButtonItem setEnabled:](self->_previousItem, "setEnabled:", 0);
  v15 = [UIBarButtonItem alloc];
  +[UIImage kitImageNamed:](UIImage, "kitImageNamed:", CFSTR("UIButtonBarArrowDown"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[UIBarButtonItem initWithImage:style:target:action:](v15, "initWithImage:style:target:action:", v16, 0, self, sel__nextTapped_);
  nextItem = self->_nextItem;
  self->_nextItem = v17;

  +[UIColor blackColor](UIColor, "blackColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem setTintColor:](self->_nextItem, "setTintColor:", v19);

  -[UIBarButtonItem setEnabled:](self->_nextItem, "setEnabled:", 0);
  v20 = [UIBarButtonItemGroup alloc];
  v37[0] = self->_autofill;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[UIBarButtonItemGroup initWithBarButtonItems:representativeItem:](v20, "initWithBarButtonItems:representativeItem:", v21, 0);
  buttonGroupAutoFill = self->_buttonGroupAutoFill;
  self->_buttonGroupAutoFill = v22;

  -[UIBarButtonItemGroup setHidden:](self->_buttonGroupAutoFill, "setHidden:", 1);
  v24 = [UIBarButtonItemGroup alloc];
  v25 = self->_nextItem;
  v36[0] = self->_previousItem;
  v36[1] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[UIBarButtonItemGroup initWithBarButtonItems:representativeItem:](v24, "initWithBarButtonItems:representativeItem:", v26, 0);
  buttonGroupNavigation = self->_buttonGroupNavigation;
  self->_buttonGroupNavigation = v27;

  v29 = v35;
  objc_msgSend(v29, "leadingBarButtonGroups");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v30, "mutableCopy");

  objc_msgSend(v31, "addObject:", self->_buttonGroupAutoFill);
  objc_msgSend(v29, "setLeadingBarButtonGroups:", v31);
  objc_msgSend(v29, "trailingBarButtonGroups");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v32, "mutableCopy");

  objc_msgSend(v33, "addObject:", self->_buttonGroupNavigation);
  objc_msgSend(v29, "setTrailingBarButtonGroups:", v33);

}

- (UIWebFormAccessory)initWithInputAssistantItem:(id)a3
{
  id v4;
  UIWebFormAccessory *v5;
  void *v6;
  UIBarButtonItem *v7;
  UIBarButtonItem *previousItem;
  UIBarButtonItem *v9;
  UIBarButtonItem *nextPreviousSpacer;
  UIBarButtonItem *v11;
  UIBarButtonItem *nextItem;
  UIBarButtonItem *v13;
  UIBarButtonItem *flexibleSpaceItem;
  UIBarButtonItem *v15;
  UIBarButtonItem *autofillSpacer;
  UIBarButtonItem *v17;
  UIBarButtonItem *doneButton;
  uint64_t v19;
  UIToolbar *leftToolbar;
  void *v21;
  uint64_t v22;
  UIToolbar *rightToolbar;
  void *v24;
  void *v25;
  UIWebFormAccessory *v26;
  UIWebFormAccessory *v27;

  v4 = a3;
  v5 = -[UIView init](self, "init");
  if (v5)
  {
    if (UIWebCurrentUserInterfaceIdiomIsSmallScreen())
    {
      -[UIInputView setContentRatio:](v5, "setContentRatio:", 1.0);
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[UIBarButtonItem initWithBarButtonSystemItem:target:action:]([UIBarButtonItem alloc], "initWithBarButtonSystemItem:target:action:", 103, v5, sel__previousTapped_);
      previousItem = v5->_previousItem;
      v5->_previousItem = v7;

      -[UIBarButtonItem setEnabled:](v5->_previousItem, "setEnabled:", 0);
      objc_msgSend(v6, "addObject:", v5->_previousItem);
      v9 = -[UIBarButtonItem initWithBarButtonSystemItem:target:action:]([UIBarButtonItem alloc], "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
      nextPreviousSpacer = v5->_nextPreviousSpacer;
      v5->_nextPreviousSpacer = v9;

      -[UIBarButtonItem setWidth:](v5->_nextPreviousSpacer, "setWidth:", 6.0);
      objc_msgSend(v6, "addObject:", v5->_nextPreviousSpacer);
      v11 = -[UIBarButtonItem initWithBarButtonSystemItem:target:action:]([UIBarButtonItem alloc], "initWithBarButtonSystemItem:target:action:", 104, v5, sel__nextTapped_);
      nextItem = v5->_nextItem;
      v5->_nextItem = v11;

      -[UIBarButtonItem setEnabled:](v5->_nextItem, "setEnabled:", 0);
      objc_msgSend(v6, "addObject:", v5->_nextItem);
      v13 = -[UIBarButtonItem initWithBarButtonSystemItem:target:action:]([UIBarButtonItem alloc], "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
      flexibleSpaceItem = v5->_flexibleSpaceItem;
      v5->_flexibleSpaceItem = v13;

      v15 = -[UIBarButtonItem initWithBarButtonSystemItem:target:action:]([UIBarButtonItem alloc], "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
      autofillSpacer = v5->_autofillSpacer;
      v5->_autofillSpacer = v15;

      -[UIBarButtonItem setWidth:](v5->_autofillSpacer, "setWidth:", 6.0);
      v17 = -[UIBarButtonItem initWithBarButtonSystemItem:target:action:]([UIBarButtonItem alloc], "initWithBarButtonSystemItem:target:action:", 0, v5, sel_done_);
      doneButton = v5->_doneButton;
      v5->_doneButton = v17;

      objc_msgSend(v6, "addObject:", v5->_flexibleSpaceItem);
      objc_msgSend(v6, "addObject:", v5->_doneButton);
      +[UIWebFormAccessory toolbarWithItems:](UIWebFormAccessory, "toolbarWithItems:", v6);
      v19 = objc_claimAutoreleasedReturnValue();
      leftToolbar = v5->_leftToolbar;
      v5->_leftToolbar = (UIToolbar *)v19;

      -[UIInputView leftContentView](v5, "leftContentView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addSubview:", v5->_leftToolbar);

      +[UIWebFormAccessory toolbarWithItems:](UIWebFormAccessory, "toolbarWithItems:", MEMORY[0x1E0C9AA60]);
      v22 = objc_claimAutoreleasedReturnValue();
      rightToolbar = v5->_rightToolbar;
      v5->_rightToolbar = (UIToolbar *)v22;

      -[UIInputView rightContentView](v5, "rightContentView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addSubview:", v5->_rightToolbar);

      -[UIWebFormAccessory _updateFrame](v5, "_updateFrame");
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addObserver:selector:name:object:", v5, sel__orientationDidChange_, CFSTR("UIApplicationDidChangeStatusBarOrientationNotification"), 0);

      v26 = v5;
    }
    else
    {
      v5->_usesUCB = 1;
      -[UIWebFormAccessory initForUCB:](v5, "initForUCB:", v4);
      v27 = v5;
    }
  }

  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIApplicationDidChangeStatusBarOrientationNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)UIWebFormAccessory;
  -[UIView dealloc](&v4, sel_dealloc);
}

- (void)_setRenderConfig:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v4 = objc_alloc(MEMORY[0x1E0C99E08]);
  objc_msgSend(off_1E167A828, "defaultFontForTextStyle:", CFSTR("UICTFontTextStyleEmphasizedSubhead"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)off_1E1678D90;
  v12 = (id)objc_msgSend(v4, "initWithObjectsAndKeys:", v5, *(_QWORD *)off_1E1678D90, 0);

  v7 = objc_alloc(MEMORY[0x1E0C99E08]);
  otherButtonFont();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithObjectsAndKeys:", v8, v6, 0);

  v10 = 0;
  if (!-[UIView _lightStyleRenderConfig](self, "_lightStyleRenderConfig"))
  {
    +[UIColor whiteColor](UIColor, "whiteColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)off_1E1678D98;
    objc_msgSend(v12, "setObject:forKey:", v10, *(_QWORD *)off_1E1678D98);
    objc_msgSend(v9, "setObject:forKey:", v10, v11);
  }
  -[UIView setTintColor:](self, "setTintColor:", v10);
  -[UIBarButtonItem setTitleTextAttributes:forState:](self->_doneButton, "setTitleTextAttributes:forState:", v12, 0);
  -[UIBarButtonItem setTitleTextAttributes:forState:](self->_clearButton, "setTitleTextAttributes:forState:", v9, 0);

}

- (void)_updateFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[UIView frame](self, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  -[UIToolbar sizeThatFits:](self->_leftToolbar, "sizeThatFits:", v7, v9);
  -[UIInputView setFrame:](self, "setFrame:", v4, v6, v8, v10);
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIWebFormAccessory;
  -[UIView layoutSubviews](&v5, sel_layoutSubviews);
  if (!self->_usesUCB || !-[UIBarButtonItemGroup isHidden](self->_buttonGroupAutoFill, "isHidden"))
  {
    if (self->_autofill)
    {
      -[UIWebFormAccessory _refreshAutofillPresentation](self, "_refreshAutofillPresentation");
      -[UIWebFormAccessory _applyTreatmentToAutoFillLabel](self, "_applyTreatmentToAutoFillLabel");
      -[UIWebFormAccessory _autoFillButton](self, "_autoFillButton");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "frame");
      -[UIBarButtonItem setWidth:](self->_autofill, "setWidth:", v4);

    }
  }
}

- (void)done:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  objc_msgSend(WeakRetained, "accessoryDone");

}

- (void)_previousTapped:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  objc_msgSend(WeakRetained, "accessoryTab:", 0);

}

- (void)_nextTapped:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  objc_msgSend(WeakRetained, "accessoryTab:", 1);

}

- (void)autoFill:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  objc_msgSend(WeakRetained, "accessoryAutoFill");

}

- (void)clear:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  objc_msgSend(WeakRetained, "accessoryClear");

}

- (id)_autoFillButton
{
  return -[UIBarButtonItem customView](self->_autofill, "customView");
}

- (void)_refreshAutofillPresentation
{
  void *v3;
  double MaxX;
  void *v5;
  double MinX;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  CGRect v12;
  CGRect v13;

  if (self->_autofill)
  {
    -[UIInputView leftContentView](self, "leftContentView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "frame");
    MaxX = CGRectGetMaxX(v12);
    -[UIInputView rightContentView](self, "rightContentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    MinX = CGRectGetMinX(v13);

    -[UIToolbar items](self->_leftToolbar, "items");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v7, "mutableCopy");

    -[UIToolbar items](self->_rightToolbar, "items");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v11, "removeObject:", self->_autofillSpacer);
    objc_msgSend(v11, "removeObject:", self->_autofill);
    objc_msgSend(v9, "removeObject:", self->_flexibleSpaceItem);
    objc_msgSend(v9, "removeObject:", self->_autofill);
    if (MaxX == MinX)
    {
      v10 = objc_msgSend(v11, "indexOfObject:", self->_nextItem);
      objc_msgSend(v11, "insertObject:atIndex:", self->_autofillSpacer, v10 + 1);
      objc_msgSend(v11, "insertObject:atIndex:", self->_autofill, v10 + 2);
    }
    else
    {
      objc_msgSend(v9, "insertObject:atIndex:", self->_flexibleSpaceItem, 0);
      objc_msgSend(v9, "addObject:", self->_autofill);
    }
    -[UIToolbar setItems:](self->_leftToolbar, "setItems:", v11);
    -[UIToolbar setItems:](self->_rightToolbar, "setItems:", v9);

  }
}

- (void)_applyTreatmentToAutoFillLabel
{
  void *v3;
  id v4;
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
  void *v16;
  void *v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  -[UIWebFormAccessory _autoFillButton](self, "_autoFillButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__92;
  v29 = __Block_byref_object_dispose__92;
  v30 = 0;
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __52__UIWebFormAccessory__applyTreatmentToAutoFillLabel__block_invoke;
  v22 = &unk_1E16BACE0;
  v24 = &v25;
  v4 = v3;
  v23 = v4;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", &v19);
  objc_msgSend((id)v26[5], "frame", v19, v20, v21, v22);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  otherButtonFont();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v26[5], "setFont:", v11);

  -[UIView traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "horizontalSizeClass");

  if (v13 == 1)
    v14 = 180.0;
  else
    v14 = 200.0;
  objc_msgSend((id)v26[5], "sizeThatFits:", 1.79769313e308, v10);
  if (v15 > v14)
  {
    objc_msgSend(off_1E167A830, "defaultFontDescriptorWithTextStyle:", CFSTR("UICTFontTextStyleFootnote"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E167A828, "fontWithDescriptor:size:", v16, 0.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)v26[5], "setFont:", v17);
  }
  objc_msgSend((id)v26[5], "sizeThatFits:", v14, 1.79769313e308);
  objc_msgSend((id)v26[5], "setFrame:", v6, v8, v18, v10);
  objc_msgSend(v4, "frame");
  objc_msgSend(v4, "setFrame:");

  _Block_object_dispose(&v25, 8);
}

void __52__UIWebFormAccessory__applyTreatmentToAutoFillLabel__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "titleLabel");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)hideAutoFillButton
{
  void *v3;
  UIBarButtonItem *autofill;
  id v5;

  if (self->_autofill)
  {
    -[UIToolbar items](self->_leftToolbar, "items");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v3, "mutableCopy");

    objc_msgSend(v5, "removeObject:", self->_autofill);
    -[UIToolbar setItems:](self->_leftToolbar, "setItems:", v5);
    if (self->_usesUCB)
    {
      -[UIBarButtonItemGroup setHidden:](self->_buttonGroupAutoFill, "setHidden:", 1);
    }
    else
    {
      autofill = self->_autofill;
      self->_autofill = 0;

    }
  }
}

- (void)showAutoFillButtonWithTitle:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  UIBarButtonItem *v8;
  UIBarButtonItem *autofill;
  void *v10;
  char v11;
  id v12;

  v12 = a3;
  -[UIBarButtonItem customView](self->_autofill, "customView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[UIButton buttonWithType:](UIButton, "buttonWithType:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addTarget:action:forControlEvents:", self, sel_autoFill_, 64);
    -[UIView bounds](self, "bounds");
    v6 = v5;
    objc_msgSend(v4, "setFrame:", 0.0, 0.0, 0.0);
    objc_msgSend(v4, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFrame:", 0.0, 0.0, 0.0, v6);
    objc_msgSend(v7, "setNumberOfLines:", 2);
    v8 = -[UIBarButtonItem initWithCustomView:]([UIBarButtonItem alloc], "initWithCustomView:", v4);
    autofill = self->_autofill;
    self->_autofill = v8;

  }
  objc_msgSend(v4, "titleForState:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v12, "isEqualToString:", v10);

  if ((v11 & 1) == 0)
    objc_msgSend(v4, "setTitle:forState:", v12, 0);
  if (self->_usesUCB)
    -[UIBarButtonItemGroup setHidden:](self->_buttonGroupAutoFill, "setHidden:", 0);
  -[UIView setNeedsLayout](self, "setNeedsLayout");

}

- (void)showAutoFillButton
{
  if (self->_usesUCB || !self->_autofill)
    -[UIWebFormAccessory showAutoFillButtonWithTitle:](self, "showAutoFillButtonWithTitle:", &stru_1E16EDF20);
}

- (void)setClearVisible:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  UIBarButtonItem *v8;
  UIBarButtonItem *clearButton;
  id v10;

  if ((((self->_clearButton == 0) ^ a3) & 1) == 0)
  {
    -[UIToolbar items](self->_leftToolbar, "items");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v4, "mutableCopy");

    if (self->_clearButton)
    {
      v5 = objc_msgSend(v10, "indexOfObject:");
      -[UIWebFormAccessory set_clearButton:](self, "set_clearButton:", 0);
      objc_msgSend(v10, "removeObjectAtIndex:", v5);
    }
    else
    {
      v6 = objc_msgSend(v10, "indexOfObject:", self->_doneButton);
      _UINSLocalizedStringWithDefaultValue(CFSTR("Clear"), CFSTR("Clear"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[UIBarButtonItem initWithTitle:style:target:action:]([UIBarButtonItem alloc], "initWithTitle:style:target:action:", v7, 0, self, sel_clear_);
      clearButton = self->_clearButton;
      self->_clearButton = v8;

      objc_msgSend(v10, "insertObject:atIndex:", self->_clearButton, v6);
    }
    -[UIToolbar setItems:](self->_leftToolbar, "setItems:", v10);

  }
}

- (void)setNextPreviousItemsVisible:(BOOL)a3
{
  _BOOL4 v3;
  int v5;
  int v6;
  int v7;
  int v8;
  BOOL v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a3;
  if (self->_usesUCB)
  {
    -[UIBarButtonItemGroup setHidden:](self->_buttonGroupNavigation, "setHidden:", !a3);
    return;
  }
  -[UIToolbar items](self->_leftToolbar, "items");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v12, "containsObject:", self->_previousItem);
  v6 = objc_msgSend(v12, "containsObject:", self->_nextPreviousSpacer);
  v7 = objc_msgSend(v12, "containsObject:", self->_nextItem);
  v8 = v7;
  if (!v3 || (v5 ? (v9 = v6 == 0) : (v9 = 1), v9 || (v7 & 1) == 0))
  {
    if ((v3 | v5 | v6 | v7) == 1)
    {
      v10 = (void *)objc_msgSend(v12, "mutableCopy");
      v11 = v10;
      if (v3)
      {
        if ((v8 & 1) != 0)
        {
          if ((v6 & 1) != 0)
            goto LABEL_13;
        }
        else
        {
          objc_msgSend(v10, "insertObject:atIndex:", self->_nextItem, 0);
          if ((v6 & 1) != 0)
          {
LABEL_13:
            if ((v5 & 1) != 0)
              goto LABEL_25;
            goto LABEL_21;
          }
        }
        objc_msgSend(v11, "insertObject:atIndex:", self->_nextPreviousSpacer, 0);
        if ((v5 & 1) != 0)
        {
LABEL_25:
          -[UIToolbar setItems:](self->_leftToolbar, "setItems:", v11);
          -[UIView setNeedsLayout](self, "setNeedsLayout");

          goto LABEL_26;
        }
LABEL_21:
        objc_msgSend(v11, "insertObject:atIndex:", self->_previousItem, 0);
        goto LABEL_25;
      }
      if (v5)
      {
        objc_msgSend(v10, "removeObject:", self->_previousItem);
        if (!v6)
        {
LABEL_17:
          if (!v8)
            goto LABEL_25;
          goto LABEL_24;
        }
      }
      else if (!v6)
      {
        goto LABEL_17;
      }
      objc_msgSend(v11, "removeObject:", self->_nextPreviousSpacer);
      if (!v8)
        goto LABEL_25;
LABEL_24:
      objc_msgSend(v11, "removeObject:", self->_nextItem);
      goto LABEL_25;
    }
  }
LABEL_26:

}

- (void)setNextEnabled:(BOOL)a3
{
  -[UIBarButtonItem setEnabled:](self->_nextItem, "setEnabled:", a3);
}

- (BOOL)isNextEnabled
{
  return -[UIBarButtonItem isEnabled](self->_nextItem, "isEnabled");
}

- (void)setPreviousEnabled:(BOOL)a3
{
  -[UIBarButtonItem setEnabled:](self->_previousItem, "setEnabled:", a3);
}

- (BOOL)isPreviousEnabled
{
  return -[UIBarButtonItem isEnabled](self->_previousItem, "isEnabled");
}

- (UISegmentedControl)_tab
{
  return self->_tab;
}

- (void)set_tab:(id)a3
{
  objc_storeStrong((id *)&self->_tab, a3);
}

- (UIBarButtonItem)_autofill
{
  return self->_autofill;
}

- (void)set_autofill:(id)a3
{
  objc_storeStrong((id *)&self->_autofill, a3);
}

- (UIBarButtonItem)_clearButton
{
  return self->_clearButton;
}

- (void)set_clearButton:(id)a3
{
  objc_storeStrong((id *)&self->_clearButton, a3);
}

- (UIWebFormAccessoryDelegate)delegate
{
  return (UIWebFormAccessoryDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_clearButton, 0);
  objc_storeStrong((id *)&self->_autofill, 0);
  objc_storeStrong((id *)&self->_tab, 0);
  objc_storeStrong((id *)&self->_buttonGroupNavigation, 0);
  objc_storeStrong((id *)&self->_buttonGroupAutoFill, 0);
  objc_storeStrong((id *)&self->_autofillSpacer, 0);
  objc_storeStrong((id *)&self->_nextPreviousSpacer, 0);
  objc_storeStrong((id *)&self->_nextItem, 0);
  objc_storeStrong((id *)&self->_previousItem, 0);
  objc_storeStrong((id *)&self->_flexibleSpaceItem, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_rightToolbar, 0);
  objc_storeStrong((id *)&self->_leftToolbar, 0);
}

@end
