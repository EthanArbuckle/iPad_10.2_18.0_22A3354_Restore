@implementation UIKBAutoFillTestArchiveMaker

+ (id)archiveMakerWithViewControllerToSnapshot:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithViewControllerToSnapshot:", v4);

  return v5;
}

- (UIKBAutoFillTestArchiveMaker)initWithViewControllerToSnapshot:(id)a3
{
  id v5;
  UIKBAutoFillTestArchiveMaker *v6;
  UIKBAutoFillTestArchiveMaker *v7;
  UIKBAutoFillTestArchiveMaker *v8;

  v5 = a3;
  v6 = -[UIKBAutoFillTestArchiveMaker init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewControllerToSnapshot, a3);
    v8 = v7;
  }

  return v7;
}

- (id)makeArchive
{
  UIKBAutoFillTestArchive *testArchive;
  UIKBAutoFillTestArchive *v3;
  UIKBAutoFillTestArchive *v5;
  UIKBAutoFillTestArchive *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UIViewController *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  UIViewController *viewControllerToSnapshot;
  id v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;

  testArchive = self->_testArchive;
  if (!testArchive)
  {
    v5 = objc_alloc_init(UIKBAutoFillTestArchive);
    v6 = self->_testArchive;
    self->_testArchive = v5;

    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBAutoFillTestArchive setViewControllerClassName:](self->_testArchive, "setViewControllerClassName:", v8);

    -[UIViewController title](self->_viewControllerToSnapshot, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBAutoFillTestArchive setViewControllerTitle:](self->_testArchive, "setViewControllerTitle:", v9);

    -[UIViewController navigationItem](self->_viewControllerToSnapshot, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBAutoFillTestArchiveMaker _cloneNavigationItem:](self, "_cloneNavigationItem:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBAutoFillTestArchive setViewControllerNavigationItem:](self->_testArchive, "setViewControllerNavigationItem:", v11);

    -[UIViewController navigationController](self->_viewControllerToSnapshot, "navigationController");
    v12 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[UIKBAutoFillTestArchive setRequiresNavigationControllerNesting:](self->_testArchive, "setRequiresNavigationControllerNesting:", 1);
      -[UIViewController navigationController](self->_viewControllerToSnapshot, "navigationController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBAutoFillTestArchive setNavigationControllerClassName:](self->_testArchive, "setNavigationControllerClassName:", v15);

      -[UIViewController presentingViewController](v12, "presentingViewController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        viewControllerToSnapshot = v12;
        goto LABEL_9;
      }
    }
    else
    {
      -[UIViewController presentingViewController](self->_viewControllerToSnapshot, "presentingViewController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        viewControllerToSnapshot = self->_viewControllerToSnapshot;
LABEL_9:
        -[UIViewController parentViewController](viewControllerToSnapshot, "parentViewController");
        v18 = (id)objc_claimAutoreleasedReturnValue();
        if (!v18)
        {
LABEL_11:
          -[UIViewController view](self->_viewControllerToSnapshot, "view");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIKBAutoFillTestArchiveMaker _cloneViewHierarchyFromRootView:](self, "_cloneViewHierarchyFromRootView:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v22, "setAutoresizingMask:", 0);
          -[UIKBAutoFillTestArchive setSnapshotView:](self->_testArchive, "setSnapshotView:", v22);
          v3 = self->_testArchive;

          return v3;
        }
LABEL_10:
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKBAutoFillTestArchive setPresentingViewControllerClassName:](self->_testArchive, "setPresentingViewControllerClassName:", v20);

        goto LABEL_11;
      }
    }
    v18 = v16;

    goto LABEL_10;
  }
  v3 = testArchive;
  return v3;
}

- (id)_cloneView:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UIKBAutoFillTestArchiveMaker _cloneTextField:](self, "_cloneTextField:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[UIKBAutoFillTestArchiveMaker _cloneTextView:](self, "_cloneTextView:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[UIKBAutoFillTestArchiveMaker _cloneLabel:](self, "_cloneLabel:", v4);
        v5 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          -[UIKBAutoFillTestArchiveMaker _cloneButton:](self, "_cloneButton:", v4);
        else
          -[UIKBAutoFillTestArchiveMaker _cloneGenericView:](self, "_cloneGenericView:", v4);
        v5 = objc_claimAutoreleasedReturnValue();
      }
    }
  }
  v6 = (void *)v5;

  return v6;
}

- (void)_applyPropertiesFromView:(id)a3 toView:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _OWORD v9[3];
  __int128 v10;
  __int128 v11;
  __int128 v12;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    objc_msgSend(v5, "transform");
  }
  else
  {
    v11 = 0u;
    v12 = 0u;
    v10 = 0u;
  }
  v9[0] = v10;
  v9[1] = v11;
  v9[2] = v12;
  objc_msgSend(v6, "setTransform:", v9);
  objc_msgSend(v5, "backgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v7);

  objc_msgSend(v6, "setOpaque:", objc_msgSend(v5, "isOpaque"));
  objc_msgSend(v6, "setHidden:", objc_msgSend(v5, "isHidden"));
  objc_msgSend(v6, "setUserInteractionEnabled:", objc_msgSend(v5, "isUserInteractionEnabled"));
  objc_msgSend(v5, "alpha");
  objc_msgSend(v6, "setAlpha:");
  objc_msgSend(v6, "setContentMode:", objc_msgSend(v5, "contentMode"));
  objc_msgSend(v5, "tintColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTintColor:", v8);

}

- (void)_applyPropertiesFromLabel:(id)a3 toLabel:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[UIKBAutoFillTestArchiveMaker _applyPropertiesFromView:toView:](self, "_applyPropertiesFromView:toView:", v13, v6);
  objc_msgSend(v13, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v7);

  objc_msgSend(v6, "setTextAlignment:", objc_msgSend(v13, "textAlignment"));
  objc_msgSend(v13, "shadowColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShadowColor:", v8);

  objc_msgSend(v13, "shadowOffset");
  objc_msgSend(v6, "setShadowOffset:");
  objc_msgSend(v6, "setNumberOfLines:", objc_msgSend(v13, "numberOfLines"));
  objc_msgSend(v6, "setBaselineAdjustment:", objc_msgSend(v13, "baselineAdjustment"));
  objc_msgSend(v6, "setAdjustsFontSizeToFitWidth:", objc_msgSend(v13, "adjustsFontSizeToFitWidth"));
  objc_msgSend(v6, "setLineBreakMode:", objc_msgSend(v13, "lineBreakMode"));
  objc_msgSend(v13, "minimumScaleFactor");
  objc_msgSend(v6, "setMinimumScaleFactor:");
  objc_msgSend(v13, "textColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v9);

  objc_msgSend(v13, "attributedText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v13, "attributedText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAttributedText:", v11);

  }
  objc_msgSend(v13, "font");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v12);

}

- (id)_cloneLabel:(id)a3
{
  id v4;
  UILabel *v5;
  UILabel *v6;

  v4 = a3;
  v5 = [UILabel alloc];
  objc_msgSend(v4, "frame");
  v6 = -[UILabel initWithFrame:](v5, "initWithFrame:");
  -[UIKBAutoFillTestArchiveMaker _applyPropertiesFromLabel:toLabel:](self, "_applyPropertiesFromLabel:toLabel:", v4, v6);

  return v6;
}

- (id)_cloneTextField:(id)a3
{
  id v4;
  UITextField *v5;
  UITextField *v6;
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

  v4 = a3;
  v5 = [UITextField alloc];
  objc_msgSend(v4, "frame");
  v6 = -[UITextField initWithFrame:](v5, "initWithFrame:");
  ++self->_currentTextFieldTag;
  -[UIView setTag:](v6, "setTag:");
  -[UIKBAutoFillTestArchiveMaker _applyPropertiesFromView:toView:](self, "_applyPropertiesFromView:toView:", v4, v6);
  -[UITextField setAutocapitalizationType:](v6, "setAutocapitalizationType:", objc_msgSend(v4, "autocapitalizationType"));
  -[UITextField setAutocorrectionType:](v6, "setAutocorrectionType:", objc_msgSend(v4, "autocorrectionType"));
  -[UITextField setSpellCheckingType:](v6, "setSpellCheckingType:", objc_msgSend(v4, "spellCheckingType"));
  -[UITextField setKeyboardType:](v6, "setKeyboardType:", objc_msgSend(v4, "keyboardType"));
  -[UITextField setKeyboardAppearance:](v6, "setKeyboardAppearance:", objc_msgSend(v4, "keyboardAppearance"));
  -[UITextField setReturnKeyType:](v6, "setReturnKeyType:", objc_msgSend(v4, "returnKeyType"));
  -[UITextField setSecureTextEntry:](v6, "setSecureTextEntry:", objc_msgSend(v4, "isSecureTextEntry"));
  objc_msgSend(v4, "textContentType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setTextContentType:](v6, "setTextContentType:", v7);

  objc_msgSend(v4, "passwordRules");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setPasswordRules:](v6, "setPasswordRules:", v8);

  -[UITextField setTextAlignment:](v6, "setTextAlignment:", objc_msgSend(v4, "textAlignment"));
  -[UITextField setBorderStyle:](v6, "setBorderStyle:", objc_msgSend(v4, "borderStyle"));
  objc_msgSend(v4, "font");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setFont:](v6, "setFont:", v9);

  -[UITextField setAdjustsFontSizeToFitWidth:](v6, "setAdjustsFontSizeToFitWidth:", objc_msgSend(v4, "adjustsFontSizeToFitWidth"));
  objc_msgSend(v4, "textColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setTextColor:](v6, "setTextColor:", v10);

  objc_msgSend(v4, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setText:](v6, "setText:", v11);

  objc_msgSend(v4, "attributedText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v4, "attributedText");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setAttributedText:](v6, "setAttributedText:", v13);

  }
  objc_msgSend(v4, "placeholder");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setPlaceholder:](v6, "setPlaceholder:", v14);

  objc_msgSend(v4, "attributedPlaceholder");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v4, "attributedPlaceholder");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setAttributedPlaceholder:](v6, "setAttributedPlaceholder:", v16);

  }
  return v6;
}

- (id)_cloneTextView:(id)a3
{
  id v4;
  UITextView *v5;
  UITextView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = [UITextView alloc];
  objc_msgSend(v4, "frame");
  v6 = -[UITextView initWithFrame:](v5, "initWithFrame:");
  ++self->_currentTextFieldTag;
  -[UIView setTag:](v6, "setTag:");
  -[UIKBAutoFillTestArchiveMaker _applyPropertiesFromView:toView:](self, "_applyPropertiesFromView:toView:", v4, v6);
  -[UITextView setAutocapitalizationType:](v6, "setAutocapitalizationType:", objc_msgSend(v4, "autocapitalizationType"));
  -[UITextView setAutocorrectionType:](v6, "setAutocorrectionType:", objc_msgSend(v4, "autocorrectionType"));
  -[UITextView setSpellCheckingType:](v6, "setSpellCheckingType:", objc_msgSend(v4, "spellCheckingType"));
  -[UITextView setKeyboardType:](v6, "setKeyboardType:", objc_msgSend(v4, "keyboardType"));
  -[UITextView setKeyboardAppearance:](v6, "setKeyboardAppearance:", objc_msgSend(v4, "keyboardAppearance"));
  -[UITextView setReturnKeyType:](v6, "setReturnKeyType:", objc_msgSend(v4, "returnKeyType"));
  -[UITextView setSecureTextEntry:](v6, "setSecureTextEntry:", objc_msgSend(v4, "isSecureTextEntry"));
  objc_msgSend(v4, "textContentType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setTextContentType:](v6, "setTextContentType:", v7);

  -[UITextView setTextAlignment:](v6, "setTextAlignment:", objc_msgSend(v4, "textAlignment"));
  objc_msgSend(v4, "passwordRules");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setPasswordRules:](v6, "setPasswordRules:", v8);

  objc_msgSend(v4, "font");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setFont:](v6, "setFont:", v9);

  objc_msgSend(v4, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setText:](v6, "setText:", v10);

  objc_msgSend(v4, "textColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setTextColor:](v6, "setTextColor:", v11);

  objc_msgSend(v4, "attributedText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v4, "attributedText");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setAttributedText:](v6, "setAttributedText:", v13);

  }
  return v6;
}

- (id)_cloneButton:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  +[UIButton buttonWithType:](UIButton, "buttonWithType:", objc_msgSend(v4, "buttonType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBAutoFillTestArchiveMaker _applyPropertiesFromView:toView:](self, "_applyPropertiesFromView:toView:", v4, v5);
  objc_msgSend(v4, "frame");
  objc_msgSend(v5, "setFrame:");
  objc_msgSend(v4, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBAutoFillTestArchiveMaker _applyPropertiesFromLabel:toLabel:](self, "_applyPropertiesFromLabel:toLabel:", v6, v7);

  objc_msgSend(v4, "titleForState:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:forState:", v8, 0);

  objc_msgSend(v4, "titleColorForState:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitleColor:forState:", v9, 0);

  objc_msgSend(v4, "attributedTitleForState:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v5, "setAttributedTitle:forState:", v10, 0);
  objc_msgSend(v4, "backgroundImageForState:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundImage:forState:", v11, 0);

  objc_msgSend(v4, "imageForState:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:forState:", v12, 0);

  return v5;
}

- (id)_cloneGenericView:(id)a3
{
  id v4;
  UIView *v5;
  UIView *v6;

  v4 = a3;
  v5 = [UIView alloc];
  objc_msgSend(v4, "frame");
  v6 = -[UIView initWithFrame:](v5, "initWithFrame:");
  -[UIKBAutoFillTestArchiveMaker _applyPropertiesFromView:toView:](self, "_applyPropertiesFromView:toView:", v4, v6);

  return v6;
}

- (id)_cloneTableView:(id)a3
{
  id v4;
  UITableView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UITableView *v10;
  int64_t currentTableViewTag;
  UIKBAutoFillTestTableViewDataSource *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  UITableViewCell *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  UITableViewCell *v30;
  void *v31;
  UIKBTestAutoFillTableViewCellData *v32;
  UIKBTestAutoFillTableViewCellData *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  char v37;
  char v38;
  char v39;
  char v40;
  uint64_t v41;
  char v42;
  char v43;
  double v44;
  double v45;
  uint64_t v46;
  uint64_t v47;
  UIKBAutoFillTestTableViewHeaderFooterData *v48;
  double v49;
  double v50;
  uint64_t v51;
  uint64_t v52;
  UIKBAutoFillTestTableViewHeaderFooterData *v53;
  UITableView *v55;
  int64_t v56;
  char v57;
  uint64_t v58;
  void *v59;
  id obj;
  char obja;
  UIKBAutoFillTestArchiveMaker *v62;
  id v63;
  UIKBAutoFillTestTableViewDataSource *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  uint64_t v70;
  CGRect v71;

  v70 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [UITableView alloc];
  objc_msgSend(v4, "frame");
  v10 = -[UITableView initWithFrame:style:](v5, "initWithFrame:style:", objc_msgSend(v4, "style"), v6, v7, v8, v9);
  currentTableViewTag = self->_currentTableViewTag;
  v62 = self;
  self->_currentTableViewTag = currentTableViewTag + 1;
  v55 = v10;
  v56 = currentTableViewTag + 1;
  -[UIView setTag:](v10, "setTag:");
  v12 = objc_alloc_init(UIKBAutoFillTestTableViewDataSource);
  v13 = objc_msgSend(v4, "numberOfSections");
  if (v13 >= 1)
  {
    for (i = 0; i != v13; ++i)
      -[UIKBAutoFillTestTableViewDataSource setNumberOfRows:forSection:](v12, "setNumberOfRows:forSection:", objc_msgSend(v4, "numberOfRowsInSection:", i), i);
  }
  v58 = v13;
  v64 = v12;
  objc_msgSend(v4, "indexPathsForVisibleRows");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v59 = v16;
  obj = (id)objc_msgSend(v16, "copy");
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
  v63 = v4;
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v66;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v66 != v19)
          objc_enumerationMutation(obj);
        v21 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * j);
        objc_msgSend(v4, "cellForRowAtIndexPath:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if (v22)
        {
          objc_msgSend(v22, "contentView");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIKBAutoFillTestArchiveMaker _makeCopyOfObject:](v62, "_makeCopyOfObject:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          v26 = [UITableViewCell alloc];
          v27 = objc_msgSend(v23, "style");
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "UUIDString");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = -[UITableViewCell initWithStyle:reuseIdentifier:](v26, "initWithStyle:reuseIdentifier:", v27, v29);

          objc_msgSend(v23, "frame");
          -[UITableViewCell setFrame:](v30, "setFrame:");
          -[UITableViewCell contentView](v30, "contentView");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "addSubview:", v25);

          v32 = [UIKBTestAutoFillTableViewCellData alloc];
          objc_msgSend(v23, "frame");
          v33 = -[UIKBTestAutoFillTableViewCellData initWithCell:height:](v32, "initWithCell:height:", v30, CGRectGetHeight(v71));
          -[UIKBAutoFillTestTableViewDataSource setCellData:forRowAtIndexPath:](v64, "setCellData:forRowAtIndexPath:", v33, v21);

          v4 = v63;
        }
        else
        {
          objc_msgSend(v59, "removeObject:", v21);
        }

      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
    }
    while (v18);
  }

  objc_msgSend(v4, "delegate");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSource");
  v35 = objc_claimAutoreleasedReturnValue();
  obja = objc_opt_respondsToSelector();
  v36 = (void *)v35;
  v57 = objc_opt_respondsToSelector();
  v37 = objc_opt_respondsToSelector();
  v38 = objc_opt_respondsToSelector();
  v39 = objc_opt_respondsToSelector();
  v40 = objc_opt_respondsToSelector();
  if (v58 >= 1)
  {
    v41 = 0;
    v42 = v37 & v39;
    v43 = v38 & v40;
    do
    {
      if ((v42 & 1) != 0)
      {
        objc_msgSend(v34, "tableView:heightForHeaderInSection:", v4, v41);
        v45 = v44;
        if (v44 <= 0.0)
        {
          v46 = 0;
        }
        else
        {
          objc_msgSend(v34, "tableView:viewForHeaderInSection:", v4, v41);
          v46 = objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v46 = 0;
        v45 = 0.0;
      }
      if ((obja & 1) != 0)
      {
        objc_msgSend(v36, "tableView:titleForHeaderInSection:", v4, v41);
        v47 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v47 = 0;
      }
      if (v46 | v47)
      {
        v48 = -[UIKBAutoFillTestTableViewHeaderFooterData initWithTitle:view:height:]([UIKBAutoFillTestTableViewHeaderFooterData alloc], "initWithTitle:view:height:", v47, v46, v45);
        -[UIKBAutoFillTestTableViewDataSource setHeaderData:forSection:](v64, "setHeaderData:forSection:", v48, v41);

        v4 = v63;
      }
      if ((v43 & 1) != 0)
      {
        objc_msgSend(v34, "tableView:heightForFooterInSection:", v4, v41);
        v50 = v49;
        if (v49 <= 0.0)
        {
          v51 = 0;
        }
        else
        {
          objc_msgSend(v34, "tableView:viewForFooterInSection:", v4, v41);
          v51 = objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v51 = 0;
        v50 = 0.0;
      }
      if ((v57 & 1) != 0)
      {
        objc_msgSend(v36, "tableView:titleForFooterInSection:", v4, v41);
        v52 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v52 = 0;
      }
      if (v51 | v52)
      {
        v53 = -[UIKBAutoFillTestTableViewHeaderFooterData initWithTitle:view:height:]([UIKBAutoFillTestTableViewHeaderFooterData alloc], "initWithTitle:view:height:", v52, v51, v50);
        -[UIKBAutoFillTestTableViewDataSource setFooterData:forSection:](v64, "setFooterData:forSection:", v53, v41);

        v4 = v63;
      }

      ++v41;
    }
    while (v58 != v41);
  }
  -[UIKBAutoFillTestArchive setTableViewDataSource:forTableViewWithTag:](v62->_testArchive, "setTableViewDataSource:forTableViewWithTag:", v64, v56);

  return v55;
}

- (id)_cloneViewHierarchyFromRootView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UIKBAutoFillTestArchiveMaker _cloneTableView:](self, "_cloneTableView:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIKBAutoFillTestArchiveMaker _cloneView:](self, "_cloneView:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isMemberOfClass:", objc_opt_class()))
    {
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      objc_msgSend(v4, "subviews", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v14;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v14 != v9)
              objc_enumerationMutation(v6);
            -[UIKBAutoFillTestArchiveMaker _cloneViewHierarchyFromRootView:](self, "_cloneViewHierarchyFromRootView:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addSubview:", v11);

            ++v10;
          }
          while (v8 != v10);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v8);
      }

    }
  }

  return v5;
}

- (id)_cloneBarButtonItem:(id)a3
{
  id v4;
  UIBarButtonItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = objc_alloc_init(UIBarButtonItem);
  objc_msgSend(v4, "largeContentSizeImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem setLargeContentSizeImage:](v5, "setLargeContentSizeImage:", v6);

  objc_msgSend(v4, "largeContentSizeImageInsets");
  -[UIBarButtonItem setLargeContentSizeImageInsets:](v5, "setLargeContentSizeImageInsets:");
  -[UIBarButtonItem setEnabled:](v5, "setEnabled:", objc_msgSend(v4, "isEnabled"));
  if (objc_msgSend(v4, "isSystemItem"))
  {
    -[UIBarButtonItem _setSystemItem:](v5, "_setSystemItem:", objc_msgSend(v4, "systemItem"));
  }
  else if (objc_msgSend(v4, "isCustomViewItem"))
  {
    objc_msgSend(v4, "customView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBAutoFillTestArchiveMaker _makeCopyOfObject:](self, "_makeCopyOfObject:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setCustomView:](v5, "setCustomView:", v8);

  }
  objc_msgSend(v4, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem setTitle:](v5, "setTitle:", v9);

  objc_msgSend(v4, "_width");
  if (v10 != 0.0)
  {
    objc_msgSend(v4, "_width");
    -[UIBarButtonItem _setWidth:](v5, "_setWidth:");
  }
  objc_msgSend(v4, "image");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem setImage:](v5, "setImage:", v11);

  objc_msgSend(v4, "imageInsets");
  -[UIBarButtonItem setImageInsets:](v5, "setImageInsets:");
  objc_msgSend(v4, "landscapeImagePhone");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem setLandscapeImagePhone:](v5, "setLandscapeImagePhone:", v12);

  objc_msgSend(v4, "landscapeImagePhoneInsets");
  -[UIBarButtonItem setLandscapeImagePhoneInsets:](v5, "setLandscapeImagePhoneInsets:");
  objc_msgSend(v4, "tintColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem setTintColor:](v5, "setTintColor:", v13);

  return v5;
}

- (id)_cloneNavigationItem:(id)a3
{
  id v4;
  UINavigationItem *v5;
  void *v6;
  UINavigationItem *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  v5 = [UINavigationItem alloc];
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UINavigationItem initWithTitle:](v5, "initWithTitle:", v6);

  objc_msgSend(v4, "prompt");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationItem setPrompt:](v7, "setPrompt:", v8);

  objc_msgSend(v4, "backButtonTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationItem setBackButtonTitle:](v7, "setBackButtonTitle:", v9);

  objc_msgSend(v4, "backBarButtonItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationItem setBackBarButtonItem:](v7, "setBackBarButtonItem:", v10);

  objc_msgSend(v4, "leftBarButtonItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    -[UIKBAutoFillTestArchiveMaker _makeCopyOfObject:](self, "_makeCopyOfObject:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationItem setLeftBarButtonItems:](v7, "setLeftBarButtonItems:", v12);
  }
  else
  {
    objc_msgSend(v4, "leftBarButtonItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBAutoFillTestArchiveMaker _makeCopyOfObject:](self, "_makeCopyOfObject:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationItem setLeftBarButtonItem:](v7, "setLeftBarButtonItem:", v13);

  }
  objc_msgSend(v4, "titleView");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[UIKBAutoFillTestArchiveMaker _makeCopyOfObject:](self, "_makeCopyOfObject:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[UINavigationItem setTitleView:](v7, "setTitleView:", v16);
  }
  objc_msgSend(v4, "rightBarButtonItems");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "count"))
  {
    -[UIKBAutoFillTestArchiveMaker _makeCopyOfObject:](self, "_makeCopyOfObject:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationItem setRightBarButtonItems:](v7, "setRightBarButtonItems:", v18);
  }
  else
  {
    objc_msgSend(v4, "rightBarButtonItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBAutoFillTestArchiveMaker _makeCopyOfObject:](self, "_makeCopyOfObject:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationItem setRightBarButtonItem:](v7, "setRightBarButtonItem:", v19);

  }
  if (dyld_program_sdk_at_least())
    -[UINavigationItem setLargeTitleDisplayMode:](v7, "setLargeTitleDisplayMode:", objc_msgSend(v4, "largeTitleDisplayMode"));

  return v7;
}

- (id)_makeCopyOfObject:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;

  if (!a3)
    return 0;
  v4 = (objc_class *)MEMORY[0x1E0CB36F8];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initRequiringSecureCoding:", 0);
  objc_msgSend(v6, "setDelegate:", self);
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("Object"));

  objc_msgSend(v6, "encodedData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v7, &v11);
  objc_msgSend(v8, "setRequiresSecureCoding:", 0);
  objc_msgSend(v8, "decodeObjectForKey:", CFSTR("Object"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)archiver:(id)a3 willEncodeObject:(id)a4
{
  id v5;
  uint64_t v6;
  objc_class *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  char isKindOfClass;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = objc_opt_class();
  if (v6)
  {
    v7 = (objc_class *)v6;
    if (!isUIKitClass_UIKitBundle)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)isUIKitClass_UIKitBundle;
      isUIKitClass_UIKitBundle = v8;

    }
    NSStringFromClass(v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend((id)isUIKitClass_UIKitBundle, "classNamed:", v10);

    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        ++self->_currentTextFieldTag;
        objc_msgSend(v5, "setTag:");
      }
      v12 = v5;
      goto LABEL_13;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UIKBAutoFillTestArchiveMaker _cloneNavigationItem:](self, "_cloneNavigationItem:", v5);
    v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:
    v13 = v12;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UIKBAutoFillTestArchiveMaker _cloneBarButtonItem:](self, "_cloneBarButtonItem:", v5);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v16 = v5;
  v17 = v16;
  if ((isKindOfClass & 1) != 0)
  {
    -[UIKBAutoFillTestArchiveMaker _cloneView:](self, "_cloneView:", v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isMemberOfClass:", objc_opt_class()))
    {
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      objc_msgSend(v17, "subviews", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v33 != v21)
              objc_enumerationMutation(v18);
            v23 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
            objc_msgSend(v23, "frame");
            v25 = v24;
            v27 = v26;
            v29 = v28;
            v31 = v30;
            objc_msgSend(v23, "removeFromSuperview");
            objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
            objc_msgSend(v23, "setFrame:", v25, v27, v29, v31);
            objc_msgSend(v13, "addSubview:", v23);
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        }
        while (v20);
      }

    }
  }
  else
  {
    v13 = v16;
  }
LABEL_14:

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllerToSnapshot, 0);
  objc_storeStrong((id *)&self->_testArchive, 0);
}

@end
