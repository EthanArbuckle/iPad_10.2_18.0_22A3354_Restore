@implementation UIRecentsInputViewController

- (void)didSelectButtonAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "section"))
  {
    if (-[UIRecentsInputViewController canManageList](self, "canManageList") && !objc_msgSend(v11, "row"))
    {
      objc_msgSend(v4, "clearRecentInput");
      -[UIRecentsInputViewController setRecentInputs:](self, "setRecentInputs:", 0);
    }
    if (-[UIRecentsInputViewController canManageList](self, "canManageList") && objc_msgSend(v11, "row") == 1
      || !-[UIRecentsInputViewController canManageList](self, "canManageList") && !objc_msgSend(v11, "row"))
    {
      +[_UIStatistics recentsInputViewNewEntryCount](_UIStatistics, "recentsInputViewNewEntryCount");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "incrementValueBy:", 1);

    }
    -[UIRecentsInputViewController recentInputDelegate](self, "recentInputDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "switchToKeyboard");
  }
  else
  {
    -[UILexicon entries](self->_recentInputs, "entries");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v11, "row"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userInput");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "handleClearWithInsertBeforeAdvance:", v6);
    -[UIRecentsInputViewController recentInputDelegate](self, "recentInputDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "didSelectRecentInput");

    +[_UIStatistics recentsInputViewItemSelectedCount](_UIStatistics, "recentsInputViewItemSelectedCount");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "incrementValueBy:", 1);

  }
}

- (void)ensureConstraints
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
  id v14;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[UIRecentsInputViewController widthConstraint](self, "widthConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)MEMORY[0x1E0D156E0];
    -[UITableViewController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 7, 0, 0, 0, 0.0, 0.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIRecentsInputViewController setWidthConstraint:](self, "setWidthConstraint:", v6);

    -[UIRecentsInputViewController widthConstraint](self, "widthConstraint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v7);

  }
  -[UIRecentsInputViewController heightConstraint](self, "heightConstraint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = (void *)MEMORY[0x1E0D156E0];
    -[UITableViewController tableView](self, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v10, 8, 0, 0, 0, 0.0, 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIRecentsInputViewController setHeightConstraint:](self, "setHeightConstraint:", v11);

    -[UIRecentsInputViewController heightConstraint](self, "heightConstraint");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v12);

  }
  -[UITableViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addConstraints:", v14);

}

- (void)updateTableViewWidth
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double *v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  uint64_t v28;
  double *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  -[UIRecentsInputViewController ensureConstraints](self, "ensureConstraints");
  v32 = *(_QWORD *)off_1E1678D90;
  objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleHeadline"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0;
  v29 = (double *)&v28;
  v30 = 0x2020000000;
  v31 = 0;
  -[UILexicon entries](self->_recentInputs, "entries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __52__UIRecentsInputViewController_updateTableViewWidth__block_invoke;
  v25[3] = &unk_1E16CD7C8;
  v6 = v4;
  v26 = v6;
  v27 = &v28;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v25);

  -[UIRecentsInputViewController previouslyUsedString](self, "previouslyUsedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeWithAttributes:", v6);
  v9 = v8;

  if (v9 > v29[3])
    v29[3] = v9;
  -[UIRecentsInputViewController clearAllString](self, "clearAllString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sizeWithAttributes:", v6);
  v12 = v11;

  if (v12 > v29[3])
    v29[3] = v12;
  -[UIRecentsInputViewController enterNewString](self, "enterNewString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sizeWithAttributes:", v6);
  v15 = v14;

  v16 = v29;
  v17 = v29[3];
  if (v15 > v17)
  {
    v29[3] = v15;
    v17 = v15;
  }
  v16[3] = v17 + 80.0;
  -[UITableViewController tableView](self, "tableView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "layoutMargins");
  v20 = v19;
  v22 = v21;

  if (v20 + v22 + v29[3] <= 960.0)
    v23 = v20 + v22 + v29[3];
  else
    v23 = 960.0;
  v29[3] = v23;
  -[UIRecentsInputViewController widthConstraint](self, "widthConstraint");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setConstant:", v23);

  _Block_object_dispose(&v28, 8);
}

void __52__UIRecentsInputViewController_updateTableViewWidth__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  uint64_t v6;

  objc_msgSend(a2, "userInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeWithAttributes:", *(_QWORD *)(a1 + 32));
  v5 = v4;

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (v5 > *(double *)(v6 + 24))
    *(double *)(v6 + 24) = v5;
}

- (void)setRecentInputs:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_storeStrong((id *)&self->_recentInputs, a3);
  +[_UIStatistics recentsInputViewNumberOfItems](_UIStatistics, "recentsInputViewNumberOfItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILexicon entries](self->_recentInputs, "entries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordDistributionValue:", (double)(unint64_t)objc_msgSend(v6, "count"));

  -[UIRecentsInputViewController updateTableViewWidth](self, "updateTableViewWidth");
  -[UITableViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadData");

  objc_msgSend(v11, "entries");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (!v9)
  {
    -[UIRecentsInputViewController recentInputDelegate](self, "recentInputDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "switchToKeyboard");

  }
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
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _UIRecentsAccessoryDefaultView *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  UIView *v29;
  void *v30;
  UIViewController *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  objc_super v57;
  _QWORD v58[5];

  v58[4] = *MEMORY[0x1E0C80C00];
  v57.receiver = self;
  v57.super_class = (Class)UIRecentsInputViewController;
  -[UIViewController viewDidLoad](&v57, sel_viewDidLoad);
  -[UIRecentsInputViewController ensureConstraints](self, "ensureConstraints");
  if (-[UIRecentsInputViewController canManageList](self, "canManageList"))
  {
    -[UIRecentsInputViewController clearAllString](self, "clearAllString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      _UINSLocalizedStringWithDefaultValue(CFSTR("Clear All"), CFSTR("Clear All"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIRecentsInputViewController setClearAllString:](self, "setClearAllString:", v4);

    }
  }
  -[UIRecentsInputViewController enterNewString](self, "enterNewString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    _UINSLocalizedStringWithDefaultValue(CFSTR("Enter New…"), CFSTR("Enter New…"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIRecentsInputViewController setEnterNewString:](self, "setEnterNewString:", v6);

  }
  -[UIRecentsInputViewController previouslyUsedString](self, "previouslyUsedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    _UINSLocalizedStringWithDefaultValue(CFSTR("Previously-Used Emails"), CFSTR("Previously-Used Emails"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIRecentsInputViewController setPreviouslyUsedString:](self, "setPreviouslyUsedString:", v8);

  }
  -[UITableViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMaskView:", 0);

  -[UITableViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[UITableViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("recentInputCell"));

  -[UIRecentsInputViewController customHeaderView](self, "customHeaderView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[UIRecentsInputViewController customHeaderView](self, "customHeaderView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIRecentsInputViewController setHeaderView:](self, "setHeaderView:", v13);
  }
  else
  {
    v14 = objc_alloc_init(_UIRecentsAccessoryDefaultView);
    -[UIRecentsInputViewController setHeaderView:](self, "setHeaderView:", v14);

    -[UIRecentsInputViewController previouslyUsedString](self, "previouslyUsedString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIRecentsInputViewController headerView](self, "headerView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "titleLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setText:", v15);

    -[UIRecentsInputViewController headerView](self, "headerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "intrinsicContentSize");
    v19 = v18;
    -[UIRecentsInputViewController headerView](self, "headerView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "intrinsicContentSize");
    v22 = v21;
    -[UIRecentsInputViewController headerView](self, "headerView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setFrame:", 0.0, 0.0, v19, v22);

  }
  -[UIRecentsInputViewController headerView](self, "headerView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "frame");
  v26 = v25;
  v28 = v27;

  v29 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", 0.0, 0.0, v26, v28);
  -[UIRecentsInputViewController setHeaderContainerView:](self, "setHeaderContainerView:", v29);

  -[UIRecentsInputViewController headerContainerView](self, "headerContainerView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setClipsToBounds:", 0);

  v31 = objc_alloc_init(UIViewController);
  -[UIRecentsInputViewController headerContainerView](self, "headerContainerView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController setView:](v31, "setView:", v32);

  -[UIRecentsInputViewController setHeaderContainerViewController:](self, "setHeaderContainerViewController:", v31);
  -[UIRecentsInputViewController headerContainerViewController](self, "headerContainerViewController");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController addChildViewController:](self, "addChildViewController:", v33);

  -[UIRecentsInputViewController headerContainerViewController](self, "headerContainerViewController");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewController tableView](self, "tableView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setTableHeaderView:", v35);

  -[UIRecentsInputViewController headerContainerViewController](self, "headerContainerViewController");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "didMoveToParentViewController:", self);

  -[UIRecentsInputViewController headerView](self, "headerView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[UIRecentsInputViewController headerContainerView](self, "headerContainerView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIRecentsInputViewController headerView](self, "headerView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addSubview:", v40);

  v41 = (void *)MEMORY[0x1E0D156E0];
  -[UIRecentsInputViewController headerView](self, "headerView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIRecentsInputViewController headerContainerView](self, "headerContainerView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v42, 9, 0, v43, 9, 1.0, 0.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = (void *)MEMORY[0x1E0D156E0];
  -[UIRecentsInputViewController headerView](self, "headerView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIRecentsInputViewController headerContainerView](self, "headerContainerView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v46, 4, 0, v47, 4, 1.0, 0.0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = (void *)MEMORY[0x1E0D156E0];
  -[UIRecentsInputViewController headerView](self, "headerView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v50, 7, 0, 0, 0, 0.0, v26);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = (void *)MEMORY[0x1E0D156E0];
  -[UIRecentsInputViewController headerView](self, "headerView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v53, 8, 0, 0, 0, 0.0, v28);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  v55 = (void *)MEMORY[0x1E0D156E0];
  v58[0] = v44;
  v58[1] = v48;
  v58[2] = v51;
  v58[3] = v54;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 4);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "activateConstraints:", v56);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[UIRecentsInputViewController _overrideTraitCollectionForHeaderViewController](self, "_overrideTraitCollectionForHeaderViewController");
  v5.receiver = self;
  v5.super_class = (Class)UIRecentsInputViewController;
  -[UITableViewController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIRecentsInputViewController;
  -[UITableViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  +[_UIStatistics recentsInputViewPresentationCount](_UIStatistics, "recentsInputViewPresentationCount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "incrementValueBy:", 1);

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  int64_t v9;

  v6 = a3;
  if (a4 == 1)
  {
    if (-[UIRecentsInputViewController canManageList](self, "canManageList"))
      v9 = 2;
    else
      v9 = 1;
  }
  else if (a4)
  {
    v9 = 0;
  }
  else
  {
    -[UIRecentsInputViewController recentInputs](self, "recentInputs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "entries");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

  }
  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UILongPressGestureRecognizer *v16;
  uint64_t v17;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("recentInputCell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFocusStyle:", 1);
  -[UIRecentsInputViewController recentInputDelegate](self, "recentInputDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textInputTraits");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextInputTraits:", v9);

  if (!objc_msgSend(v6, "section"))
  {
    -[UIRecentsInputViewController recentInputs](self, "recentInputs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "entries");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndex:", objc_msgSend(v6, "row"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "userInput");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[UIRecentsInputViewController canManageList](self, "canManageList"))
    {
      v16 = -[UILongPressGestureRecognizer initWithTarget:action:]([UILongPressGestureRecognizer alloc], "initWithTarget:action:", self, sel__delete_);
      -[UILongPressGestureRecognizer setMinimumPressDuration:](v16, "setMinimumPressDuration:", 2.0);
      objc_msgSend(v7, "addGestureRecognizer:", v16);

    }
    if (v15)
      goto LABEL_15;
    goto LABEL_16;
  }
  if (objc_msgSend(v6, "section") != 1)
    goto LABEL_16;
  v10 = -[UIRecentsInputViewController canManageList](self, "canManageList");
  v11 = objc_msgSend(v6, "row");
  if (!v10)
  {
    if (v11)
      goto LABEL_16;
    goto LABEL_12;
  }
  if (v11)
  {
    if (objc_msgSend(v6, "row") != 1)
      goto LABEL_16;
LABEL_12:
    -[UIRecentsInputViewController enterNewString](self, "enterNewString");
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  -[UIRecentsInputViewController clearAllString](self, "clearAllString");
  v17 = objc_claimAutoreleasedReturnValue();
LABEL_14:
  v15 = (void *)v17;
  if (v17)
  {
LABEL_15:
    objc_msgSend(v7, "setInputText:withBlurStyle:", v15, -[UIRecentsInputViewController containingEffectStyle](self, "containingEffectStyle"));

  }
LABEL_16:

  return v7;
}

- (id)indexPathForPreferredFocusedViewInTableView:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  -[UIRecentsInputViewController didSelectButtonAtIndexPath:](self, "didSelectButtonAtIndexPath:", a4);
}

- (BOOL)tableView:(id)a3 canFocusRowAtIndexPath:(id)a4
{
  return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result;

  result = 22.0;
  if (!a4)
    return 16.0;
  return result;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return CFSTR(" ");
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)scrollViewDidChangeContentSize:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;

  objc_msgSend(v4, "contentSize");
  v9 = v8;

  if (v9 <= v7)
    v7 = v9;
  -[UIRecentsInputViewController heightConstraint](self, "heightConstraint");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setConstant:", v7);

}

- (void)_delete:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v4 = a3;
  if (objc_msgSend(v4, "state") == 1)
  {
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatingLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v7, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    _UINSLocalizedStringWithDefaultValue(CFSTR("Delete"), CFSTR("Delete"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __40__UIRecentsInputViewController__delete___block_invoke;
    v14[3] = &unk_1E16CD818;
    objc_copyWeak(&v16, &location);
    v10 = v7;
    v15 = v10;
    +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v9, 2, v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "addAction:", v11);
    _UINSLocalizedStringWithDefaultValue(CFSTR("Cancel"), CFSTR("Cancel"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v12, 1, &__block_literal_global_314);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "addAction:", v13);
    -[UIViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, &__block_literal_global_112_1);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);

  }
}

void __40__UIRecentsInputViewController__delete___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__UIRecentsInputViewController__delete___block_invoke_2;
  v5[3] = &unk_1E16CD7F0;
  v5[4] = WeakRetained;
  objc_msgSend(v3, "removeRecentInput:completionHandler:", v4, v5);

}

uint64_t __40__UIRecentsInputViewController__delete___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setRecentInputs:", a2);
}

- (void)_overrideTraitCollectionForHeaderViewController
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  -[UIRecentsInputViewController recentInputDelegate](self, "recentInputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textInputTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "keyboardAppearance");

  v6 = 2;
  if (v5 != 1 && v5 != 9)
  {
    if (v5 != 2)
      return;
    v6 = 1;
  }
  +[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[UIRecentsInputViewController headerContainerViewController](self, "headerContainerViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController setOverrideTraitCollection:forChildViewController:](self, "setOverrideTraitCollection:forChildViewController:", v8, v7);

}

- (UIRecentsInputViewControllerDelegate)recentInputDelegate
{
  return (UIRecentsInputViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_recentInputDelegate);
}

- (void)setRecentInputDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_recentInputDelegate, a3);
}

- (UILexicon)recentInputs
{
  return self->_recentInputs;
}

- (int64_t)containingEffectStyle
{
  return self->_containingEffectStyle;
}

- (void)setContainingEffectStyle:(int64_t)a3
{
  self->_containingEffectStyle = a3;
}

- (BOOL)canManageList
{
  return self->_canManageList;
}

- (void)setCanManageList:(BOOL)a3
{
  self->_canManageList = a3;
}

- (UIView)customHeaderView
{
  return self->_customHeaderView;
}

- (void)setCustomHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_customHeaderView, a3);
}

- (NSLayoutConstraint)widthConstraint
{
  return self->_widthConstraint;
}

- (void)setWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_widthConstraint, a3);
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_heightConstraint, a3);
}

- (NSString)previouslyUsedString
{
  return self->_previouslyUsedString;
}

- (void)setPreviouslyUsedString:(id)a3
{
  objc_storeStrong((id *)&self->_previouslyUsedString, a3);
}

- (NSString)clearAllString
{
  return self->_clearAllString;
}

- (void)setClearAllString:(id)a3
{
  objc_storeStrong((id *)&self->_clearAllString, a3);
}

- (NSString)enterNewString
{
  return self->_enterNewString;
}

- (void)setEnterNewString:(id)a3
{
  objc_storeStrong((id *)&self->_enterNewString, a3);
}

- (UIView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (UIView)headerContainerView
{
  return self->_headerContainerView;
}

- (void)setHeaderContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_headerContainerView, a3);
}

- (UIViewController)headerContainerViewController
{
  return self->_headerContainerViewController;
}

- (void)setHeaderContainerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_headerContainerViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerContainerViewController, 0);
  objc_storeStrong((id *)&self->_headerContainerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_enterNewString, 0);
  objc_storeStrong((id *)&self->_clearAllString, 0);
  objc_storeStrong((id *)&self->_previouslyUsedString, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_customHeaderView, 0);
  objc_storeStrong((id *)&self->_recentInputs, 0);
  objc_destroyWeak((id *)&self->_recentInputDelegate);
}

@end
