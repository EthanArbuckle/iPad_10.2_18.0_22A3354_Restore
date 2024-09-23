@implementation PXPeopleNamePickerViewController

- (PXPeopleNamePickerViewController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleNamePickerViewController.m"), 35, CFSTR("invalid initializer"));

  return 0;
}

- (PXPeopleNamePickerViewController)initWithCoder:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleNamePickerViewController.m"), 41, CFSTR("invalid initializer"));

  return 0;
}

- (PXPeopleNamePickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleNamePickerViewController.m"), 47, CFSTR("invalid initializer"));

  return 0;
}

- (PXPeopleNamePickerViewController)initWithPerson:(id)a3
{
  id v5;
  PXPeopleNamePickerViewController *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleNamePickerViewController.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("person"));

  }
  v6 = -[PXPeopleNamePickerViewController initWithPerson:orFace:](self, "initWithPerson:orFace:", v5, 0);

  return v6;
}

- (PXPeopleNamePickerViewController)initWithFace:(id)a3
{
  id v5;
  PXPeopleNamePickerViewController *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleNamePickerViewController.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("face"));

  }
  v6 = -[PXPeopleNamePickerViewController initWithPerson:orFace:](self, "initWithPerson:orFace:", 0, v5);

  return v6;
}

- (PXPeopleNamePickerViewController)initWithPerson:(id)a3 orFace:(id)a4
{
  unint64_t v7;
  unint64_t v8;
  PXPeopleNamePickerViewController *v9;
  PXPeopleNamePickerTitleView *v10;
  uint64_t v11;
  PXPeopleNamePickerTitleView *titleView;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  PXPeopleNamePickerResultsTableViewController *v26;
  PXPeopleNamePickerResultsTableViewController *resultsController;
  void *v28;
  void *v29;
  void *v31;
  objc_super v32;
  _QWORD v33[2];
  _QWORD v34[2];
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v7 = (unint64_t)a3;
  v8 = (unint64_t)a4;
  if (!(v7 | v8))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleNamePickerViewController.m"), 63, CFSTR("Both person and face are nil"));

  }
  v32.receiver = self;
  v32.super_class = (Class)PXPeopleNamePickerViewController;
  v9 = -[PXPeopleNamePickerViewController initWithNibName:bundle:](&v32, sel_initWithNibName_bundle_, 0, 0);
  if (v9)
  {
    v10 = [PXPeopleNamePickerTitleView alloc];
    if (v7)
      v11 = -[PXPeopleNamePickerTitleView initWithFrame:person:](v10, "initWithFrame:person:", v7, 0.0, 0.0, 0.0, 35.0);
    else
      v11 = -[PXPeopleNamePickerTitleView initWithFrame:face:](v10, "initWithFrame:face:", v8, 0.0, 0.0, 0.0, 35.0);
    titleView = v9->_titleView;
    v9->_titleView = (PXPeopleNamePickerTitleView *)v11;

    -[PXPeopleNamePickerTitleView setAutoresizingMask:](v9->_titleView, "setAutoresizingMask:", 2);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0DC1358];
    v35 = *MEMORY[0x1E0DC13B8];
    v36[0] = *MEMORY[0x1E0DC4A88];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fontDescriptorWithFontAttributes:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend(v13, "pointSize");
    objc_msgSend(v17, "fontWithDescriptor:size:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleNamePickerTitleView setNameFont:](v9->_titleView, "setNameFont:", v13);
    v19 = *MEMORY[0x1E0DC1140];
    v33[0] = *MEMORY[0x1E0DC1138];
    v33[1] = v19;
    v34[0] = v18;
    -[PXPeopleNamePickerTitleView tintColor](v9->_titleView, "tintColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = objc_alloc(MEMORY[0x1E0CB3498]);
    PXLocalizedStringFromTable(CFSTR("PXPeopleAddNameNoPlus"), CFSTR("PhotosUICore"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v22, "initWithString:attributes:", v23, v21);

    -[PXPeopleNamePickerTitleView nameField](v9->_titleView, "nameField");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setAttributedPlaceholder:", v24);
    objc_msgSend(v25, "setDelegate:", v9);
    v26 = -[PXPeopleNamePickerResultsTableViewController initWithStyle:person:face:]([PXPeopleNamePickerResultsTableViewController alloc], "initWithStyle:person:face:", 0, v7, v8);
    resultsController = v9->_resultsController;
    v9->_resultsController = v26;

    -[PXPeopleNamePickerResultsTableViewController tableView](v9->_resultsController, "tableView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setDelegate:", v9);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObserver:selector:name:object:", v9, sel__applicationDidEnterBackground, *MEMORY[0x1E0DC4768], 0);
    objc_msgSend(v29, "addObserver:selector:name:object:", v9, sel__keyboardDidShow_, *MEMORY[0x1E0DC4E70], 0);
    objc_msgSend(v29, "addObserver:selector:name:object:", v9, sel__keyboardWillHide_, *MEMORY[0x1E0DC4FE0], 0);

  }
  return v9;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXPeopleNamePickerViewController;
  -[PXPeopleNamePickerViewController viewDidLoad](&v10, sel_viewDidLoad);
  -[PXPeopleNamePickerViewController resultsController](self, "resultsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bottomAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleNamePickerViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeAreaLayoutGuide");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bottomAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:constant:", v8, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleNamePickerViewController setResultsViewBottomConstraint:](self, "setResultsViewBottomConstraint:", v9);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXPeopleNamePickerViewController;
  -[PXPeopleNamePickerViewController viewDidLayoutSubviews](&v5, sel_viewDidLayoutSubviews);
  -[PXPeopleNamePickerViewController titleView](self, "titleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nameField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateIntrinsicContentSize");

}

- (void)_keyboardWillHide:(id)a3
{
  id v3;

  -[PXPeopleNamePickerViewController resultsViewBottomConstraint](self, "resultsViewBottomConstraint", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setConstant:", 0.0);

}

- (void)_keyboardDidShow:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double height;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  id v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  objc_msgSend(a3, "userInfo");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectForKey:", *MEMORY[0x1E0DC4E90]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "CGRectValue");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[PXPeopleNamePickerViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "convertRect:fromView:", 0, v6, v8, v10, v12);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  objc_msgSend(v13, "frame");
  v33.origin.x = v15;
  v33.origin.y = v17;
  v33.size.width = v19;
  v33.size.height = v21;
  v32 = CGRectIntersection(v31, v33);
  height = v32.size.height;
  -[PXPeopleNamePickerViewController tabBarController](self, "tabBarController", v32.origin.x, v32.origin.y, v32.size.width);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "tabBar");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "frame");
  v26 = v25;

  objc_msgSend(v13, "safeAreaInsets");
  v28 = v26 - height + v27;
  -[PXPeopleNamePickerViewController resultsViewBottomConstraint](self, "resultsViewBottomConstraint");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setConstant:", v28);

}

- (double)_titleViewMaxWidthForEditing:(BOOL)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double MaxX;
  double v14;
  CGRect v16;
  CGRect v17;

  -[PXPeopleNamePickerViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "frame");
  v7 = v6;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "userInterfaceLayoutDirection");

    if (v9 == 1)
    {
      objc_msgSend(v5, "currentRightView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "currentLeftView");
    }
    else
    {
      objc_msgSend(v5, "currentLeftView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "currentRightView");
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0.0;
    MaxX = 0.0;
    if (v10)
    {
      objc_msgSend(v10, "frame");
      MaxX = CGRectGetMaxX(v16);
    }
    if (v11)
    {
      objc_msgSend(v11, "frame");
      v12 = v7 - CGRectGetMinX(v17);
    }
    if (MaxX >= v12)
      v14 = MaxX;
    else
      v14 = v12;
    v7 = v7 + v14 * -2.0;

  }
  return v7;
}

- (void)_showResultsView
{
  void *v3;
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
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  -[PXPeopleNamePickerViewController resultsController](self, "resultsController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);
  -[PXPeopleNamePickerViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
    objc_msgSend(v4, "addSubview:", v3);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v16 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v3, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeAreaLayoutGuide");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleNamePickerViewController yOffset](self, "yOffset");
  objc_msgSend(v19, "constraintEqualToAnchor:constant:", v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v17;
  objc_msgSend(v3, "leadingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeAreaLayoutGuide");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v7;
  objc_msgSend(v3, "trailingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeAreaLayoutGuide");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v11;
  -[PXPeopleNamePickerViewController resultsViewBottomConstraint](self, "resultsViewBottomConstraint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "activateConstraints:", v13);

}

- (void)_hideResultsView
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  -[PXPeopleNamePickerViewController resultsController](self, "resultsController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPeopleNamePickerViewController presentedViewController](self, "presentedViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == v6)
  {
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 0, 0);
  }
  else
  {
    -[PXPeopleNamePickerViewController resultsController](self, "resultsController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setHidden:", 1);
  }

}

- (void)_changePlaceholderTextOfTextField:(id)a3 toColor:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "attributedPlaceholder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "addAttribute:value:range:", *MEMORY[0x1E0DC1140], v5, 0, objc_msgSend(v8, "length"));
  objc_msgSend(v6, "setAttributedPlaceholder:", v8);

}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  void *v4;
  void *v5;

  -[PXPeopleNamePickerViewController resultsController](self, "resultsController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateItemsForSearchString:", &stru_1E5149688);
  if (objc_msgSend(v4, "hasResults"))
    -[PXPeopleNamePickerViewController _showResultsView](self, "_showResultsView");
  else
    -[PXPeopleNamePickerViewController _hideResultsView](self, "_hideResultsView");
  -[PXPeopleNamePickerViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "namePickerControllerDidStartEditing:", self);

  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPeopleNamePickerViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "namePickerController:didPickString:", self, v6);

  return 1;
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  void *v4;

  objc_msgSend(a3, "resignFirstResponder");
  -[PXPeopleNamePickerViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "namePickerControllerDidEndEditing:", self);

  return 1;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  length = a4.length;
  location = a4.location;
  v9 = a5;
  objc_msgSend(a3, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", location, length, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPeopleNamePickerViewController resultsController](self, "resultsController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateItemsForSearchString:", v11);
  if (objc_msgSend(v12, "hasResults"))
    -[PXPeopleNamePickerViewController _showResultsView](self, "_showResultsView");
  else
    -[PXPeopleNamePickerViewController _hideResultsView](self, "_hideResultsView");
  -[PXPeopleNamePickerViewController delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v13, "namePickerControllerWillChangeText:", self);

  return 1;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0DC3658];
  v5 = a3;
  objc_msgSend(v4, "placeholderTextColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPeopleNamePickerViewController _changePlaceholderTextOfTextField:toColor:](self, "_changePlaceholderTextOfTextField:toColor:", v5, v6);

}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PXPeopleNamePickerViewController titleView](self, "titleView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleNamePickerViewController _changePlaceholderTextOfTextField:toColor:](self, "_changePlaceholderTextOfTextField:toColor:", v4, v5);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  -[PXPeopleNamePickerViewController resultsController](self, "resultsController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "personAtIndexPath:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[PXPeopleNamePickerViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "namePickerController:didPickPerson:", self, v6);
  }
  else
  {
    objc_msgSend(v5, "contactAtIndexPath:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[PXPeopleNamePickerViewController delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "namePickerController:didPickContact:", self, v7);

    }
  }

}

- (PXPeopleNamePickerTitleView)titleView
{
  return self->_titleView;
}

- (PXPeopleNamePickerViewControllerDelegate)delegate
{
  return (PXPeopleNamePickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)savedRightBarItems
{
  return self->_savedRightBarItems;
}

- (void)setSavedRightBarItems:(id)a3
{
  objc_storeStrong((id *)&self->_savedRightBarItems, a3);
}

- (double)yOffset
{
  return self->_yOffset;
}

- (void)setYOffset:(double)a3
{
  self->_yOffset = a3;
}

- (NSLayoutConstraint)resultsViewBottomConstraint
{
  return self->_resultsViewBottomConstraint;
}

- (void)setResultsViewBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_resultsViewBottomConstraint, a3);
}

- (PXPeopleNamePickerResultsTableViewController)resultsController
{
  return self->_resultsController;
}

- (void)setResultsController:(id)a3
{
  objc_storeStrong((id *)&self->_resultsController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultsController, 0);
  objc_storeStrong((id *)&self->_resultsViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_savedRightBarItems, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_titleView, 0);
}

@end
