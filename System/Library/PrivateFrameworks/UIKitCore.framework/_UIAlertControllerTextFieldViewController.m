@implementation _UIAlertControllerTextFieldViewController

- (_UIAlertControllerTextFieldViewController)init
{
  UICollectionViewFlowLayout *v3;
  _UIAlertControllerTextFieldViewController *v4;
  _UIAlertControllerTextFieldViewController *v5;
  id *p_collectionViewLayout;
  void *v7;
  NSMutableArray *v8;
  NSMutableArray *textFieldViews;
  NSMutableArray *v10;
  NSMutableArray *textFields;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v3 = objc_alloc_init(UICollectionViewFlowLayout);
  v18.receiver = self;
  v18.super_class = (Class)_UIAlertControllerTextFieldViewController;
  v4 = -[UICollectionViewController initWithCollectionViewLayout:](&v18, sel_initWithCollectionViewLayout_, v3);
  v5 = v4;
  if (v4)
  {
    p_collectionViewLayout = (id *)&v4->_collectionViewLayout;
    objc_storeStrong((id *)&v4->_collectionViewLayout, v3);
    objc_msgSend(*p_collectionViewLayout, "setMinimumLineSpacing:", 0.0);
    -[UICollectionViewController collectionView](v5, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCollectionViewLayout:", *p_collectionViewLayout);

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    textFieldViews = v5->textFieldViews;
    v5->textFieldViews = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    textFields = v5->textFields;
    v5->textFields = v10;

    -[UICollectionViewController collectionView](v5, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("UIAlertTextFieldTableIdentifier"));

    -[UICollectionViewController collectionView](v5, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAllowsSelection:", 0);

    -[UICollectionViewController collectionView](v5, "collectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundColor:", 0);

    -[UICollectionViewController collectionView](v5, "collectionView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setScrollEnabled:", 0);

    -[UICollectionViewController collectionView](v5, "collectionView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_setFirstResponderKeyboardAvoidanceEnabled:", 0);

    v5->_textFieldsCanBecomeFirstResponder = 1;
  }

  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIAlertControllerTextFieldViewController;
  -[UIViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[UIViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UIAlertControllerTextFieldViewController;
  -[UICollectionViewController viewWillAppear:](&v10, sel_viewWillAppear_, a3);
  -[UICollectionViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAlertControllerVisualStyle textFieldContentInset](self->_visualStyle, "textFieldContentInset");
  objc_msgSend(v4, "setContentInset:");

  -[NSMutableArray firstObject](self->textFields, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_UIAlertControllerTextFieldViewController textFieldsCanBecomeFirstResponder](self, "textFieldsCanBecomeFirstResponder")&& !+[UISystemInputViewController canUseSystemInputViewControllerForResponder:](UISystemInputViewController, "canUseSystemInputViewControllerForResponder:", v5))
  {
    -[UIViewController transitionCoordinator](self, "transitionCoordinator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[UIViewController transitionCoordinator](self, "transitionCoordinator");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __60___UIAlertControllerTextFieldViewController_viewWillAppear___block_invoke;
      v8[3] = &unk_1E16B2150;
      v9 = v5;
      objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

    }
    else
    {
      objc_msgSend(v5, "becomeFirstResponder");
    }
  }

}

- (void)viewWillLayoutSubviews
{
  UICollectionViewFlowLayout *collectionViewLayout;
  void *v4;
  objc_super v5;
  CGRect v6;

  collectionViewLayout = self->_collectionViewLayout;
  -[UIViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[UICollectionViewFlowLayout setEstimatedItemSize:](collectionViewLayout, "setEstimatedItemSize:", CGRectGetWidth(v6), 24.0);

  v5.receiver = self;
  v5.super_class = (Class)_UIAlertControllerTextFieldViewController;
  -[UIViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
}

- (void)setVisualStyle:(id)a3
{
  objc_storeStrong((id *)&self->_visualStyle, a3);
  -[_UIAlertControllerTextFieldViewController updateTextFieldStyle](self, "updateTextFieldStyle");
}

- (UIAlertControllerVisualStyle)visualStyle
{
  return self->_visualStyle;
}

- (double)_bottomMarginForTextFields
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  objc_msgSend(off_1E167A830, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", CFSTR("UICTFontTextStyleHeadline"), 0, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E167A828, "fontWithDescriptor:size:", v3, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_scaledValueForValue:", 24.0);
  -[UIViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToViewScale(v5);
  v7 = v6;

  return v7;
}

- (id)addTextFieldWithPlaceholder:(id)a3
{
  NSMutableArray *textFieldViews;
  id v5;
  void *v6;
  _UIAlertControllerTextFieldView *v7;
  _UIAlertControllerTextFieldView *v8;
  void *v9;
  void *v10;

  textFieldViews = self->textFieldViews;
  v5 = a3;
  if (-[NSMutableArray count](textFieldViews, "count"))
  {
    -[NSMutableArray lastObject](self->textFieldViews, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContainerView:", 0);

  }
  v7 = [_UIAlertControllerTextFieldView alloc];
  v8 = -[_UIAlertControllerTextFieldView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[_UIAlertControllerTextFieldView textField](v8, "textField");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAutocorrectionType:", 1);
  objc_msgSend(v9, "setAutocapitalizationType:", 0);
  objc_msgSend(v9, "setSmartQuotesType:", 1);
  objc_msgSend(v9, "setSmartDashesType:", 1);
  objc_msgSend(v9, "setPlaceholder:", v5);

  objc_msgSend(v9, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v9, "addTarget:action:forControlEvents:", self, sel__returnKeyPressedInTextField_, 0x80000);
  -[NSMutableArray addObject:](self->textFieldViews, "addObject:", v8);
  -[NSMutableArray addObject:](self->textFields, "addObject:", v9);
  -[_UIAlertControllerTextFieldViewController updateTextFieldStyle](self, "updateTextFieldStyle");
  -[UICollectionViewController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reloadData");

  return v9;
}

- (void)_returnKeyPressedInTextField:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[_UIAlertControllerTextFieldViewController container](self, "container");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_shouldSupportReturnKeyPresses");

  v6 = v12;
  if (v5)
  {
    objc_msgSend(v12, "textFieldView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[NSMutableArray indexOfObject:](self->textFieldViews, "indexOfObject:", v7);
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = v8 + 1;
      if (v8 + 1 <= (unint64_t)(-[NSMutableArray count](self->textFieldViews, "count") - 1))
      {
        -[NSMutableArray objectAtIndex:](self->textFieldViews, "objectAtIndex:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "textField");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "becomeFirstResponder");

      }
      else
      {
        -[_UIAlertControllerTextFieldViewController container](self, "container");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_returnKeyPressedInLastTextField");
      }

    }
    v6 = v12;
  }

}

- (void)setHidden:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  self->_hidden = a3;
  if (-[_UIAlertControllerTextFieldViewController isHidden](self, "isHidden"))
  {
    -[UIViewController setPreferredContentSize:](self, "setPreferredContentSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    -[UIViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4;
    v5 = 1;
  }
  else
  {
    -[_UIAlertControllerTextFieldViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
    -[UIViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4;
    v5 = 0;
  }
  objc_msgSend(v4, "setHidden:", v5);

}

- (void)_updatePreferredContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;

  v4 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (-[NSMutableArray count](self->textFieldViews, "count"))
  {
    -[UIAlertControllerVisualStyle textFieldContentInset](self->_visualStyle, "textFieldContentInset");
    v6 = v5;
    v8 = v7;
    -[NSMutableArray objectAtIndex:](self->textFieldViews, "objectAtIndex:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "systemLayoutSizeFittingSize:", v4, v3);
    v11 = v10 * (double)-[_UIAlertControllerTextFieldViewController numberOfTextFields](self, "numberOfTextFields");
    -[_UIAlertControllerTextFieldViewController _bottomMarginForTextFields](self, "_bottomMarginForTextFields");
    v3 = v11 + v8 + v6 + v12;

    v4 = 0.0;
  }
  -[UIViewController setPreferredContentSize:](self, "setPreferredContentSize:", v4, v3);
}

- (id)textFieldAtIndex:(int64_t)a3
{
  void *v3;
  void *v4;

  -[NSMutableArray objectAtIndex:](self->textFieldViews, "objectAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)textFieldContainerViews
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->textFieldViews;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "containerView", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v9, "containerView");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v11);

        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (int64_t)numberOfTextFields
{
  return -[NSMutableArray count](self->textFieldViews, "count");
}

- (void)removeAllTextFields
{
  id v3;

  -[NSMutableArray removeAllObjects](self->textFieldViews, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->textFields, "removeAllObjects");
  -[UICollectionViewController collectionView](self, "collectionView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

- (void)setTextFieldsCanBecomeFirstResponder:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;

  if (self->_textFieldsCanBecomeFirstResponder != a3)
  {
    v3 = a3;
    self->_textFieldsCanBecomeFirstResponder = a3;
    -[NSMutableArray firstObject](self->textFields, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3)
      objc_msgSend(v4, "becomeFirstResponder");
    else
      objc_msgSend(v4, "resignFirstResponder");

  }
}

- (BOOL)textFieldsCanBecomeFirstResponder
{
  return self->_textFieldsCanBecomeFirstResponder;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  NSMutableArray *textFieldViews;
  id v7;
  id v8;
  void *v9;
  void *v10;

  textFieldViews = self->textFieldViews;
  v7 = a4;
  v8 = a3;
  -[NSMutableArray objectAtIndex:](textFieldViews, "objectAtIndex:", objc_msgSend(v7, "row"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("UIAlertTextFieldTableIdentifier"), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setBackgroundColor:", 0);
  -[UIAlertControllerVisualStyle textFieldHorizontalMargin](self->_visualStyle, "textFieldHorizontalMargin");
  objc_msgSend(v10, "setTextField:horizontalMargin:", v9);

  return v10;
}

- (void)updateTextFieldStyle
{
  uint64_t v3;
  NSMutableArray *textFieldViews;
  _QWORD v5[6];

  v3 = -[NSMutableArray count](self->textFieldViews, "count");
  textFieldViews = self->textFieldViews;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65___UIAlertControllerTextFieldViewController_updateTextFieldStyle__block_invoke;
  v5[3] = &unk_1E16B2510;
  v5[4] = self;
  v5[5] = v3;
  -[NSMutableArray enumerateObjectsUsingBlock:](textFieldViews, "enumerateObjectsUsingBlock:", v5);
  -[_UIAlertControllerTextFieldViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
}

- (BOOL)resignFirstResponder
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  char v10;
  unsigned __int8 v11;
  objc_super v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = self->textFields;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v7);
      if ((objc_msgSend(v8, "isFirstResponder") & 1) != 0)
        break;
      if (v5 == ++v7)
      {
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v9 = v8;

    if (!v9)
      goto LABEL_12;
    v10 = objc_msgSend(v9, "resignFirstResponder");
  }
  else
  {
LABEL_9:

    v9 = 0;
LABEL_12:
    v10 = 1;
  }
  v13.receiver = self;
  v13.super_class = (Class)_UIAlertControllerTextFieldViewController;
  v11 = -[UIResponder resignFirstResponder](&v13, sel_resignFirstResponder);

  return v11 & v10;
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NSArray)textFields
{
  return (NSArray *)objc_getProperty(self, a2, 1016, 1);
}

- (_UIAlertControllerTextFieldViewControllerContaining)container
{
  return (_UIAlertControllerTextFieldViewControllerContaining *)objc_loadWeakRetained((id *)&self->_container);
}

- (void)setContainer:(id)a3
{
  objc_storeWeak((id *)&self->_container, a3);
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_container);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_storeStrong((id *)&self->_visualStyle, 0);
  objc_storeStrong((id *)&self->textFields, 0);
  objc_storeStrong((id *)&self->textFieldViews, 0);
}

@end
