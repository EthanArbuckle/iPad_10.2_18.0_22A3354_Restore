@implementation OBTableWelcomeController

- (OBTableWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  OBTableWelcomeController *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OBTableWelcomeController;
  result = -[OBWelcomeController initWithTitle:detailText:icon:contentLayout:](&v6, sel_initWithTitle_detailText_icon_contentLayout_, a3, a4, a5, 3);
  if (result)
    result->_adoptTableViewScrollView = 0;
  return result;
}

- (OBTableWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5
{
  OBTableWelcomeController *v5;
  OBTableWelcomeController *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OBTableWelcomeController;
  v5 = -[OBWelcomeController initWithTitle:detailText:symbolName:](&v8, sel_initWithTitle_detailText_symbolName_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[OBWelcomeController setContentViewLayout:](v5, "setContentViewLayout:", 3);
    v6->_adoptTableViewScrollView = 0;
  }
  return v6;
}

- (OBTableWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  OBTableWelcomeController *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OBTableWelcomeController;
  result = -[OBWelcomeController initWithTitle:detailText:icon:contentLayout:](&v8, sel_initWithTitle_detailText_icon_contentLayout_, a3, a4, a5, 3);
  if (result)
    result->_adoptTableViewScrollView = a6;
  return result;
}

- (OBTableWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  OBTableWelcomeController *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OBTableWelcomeController;
  result = -[OBWelcomeController initWithTitle:detailText:symbolName:contentLayout:](&v8, sel_initWithTitle_detailText_symbolName_contentLayout_, a3, a4, a5, 3);
  if (result)
    result->_adoptTableViewScrollView = a6;
  return result;
}

- (void)setTableView:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[OBTableWelcomeController isViewLoaded](self, "isViewLoaded") & 1) != 0)
    -[OBTableWelcomeController _setTableView:](self, "_setTableView:", v5);
  else
    objc_storeStrong((id *)&self->_tableView, a3);

}

- (void)updateDirectionalLayoutMargins
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OBTableWelcomeController;
  -[OBWelcomeController updateDirectionalLayoutMargins](&v3, sel_updateDirectionalLayoutMargins);
  -[OBTableWelcomeController _updateDirectionalLayoutMarginsForTableView](self, "_updateDirectionalLayoutMarginsForTableView");
}

- (void)_updateDirectionalLayoutMarginsForTableView
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;

  -[OBBaseWelcomeController directionalLayoutMargins](self, "directionalLayoutMargins");
  v4 = v3;
  v6 = v5;
  -[OBTableWelcomeController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDirectionalLayoutMargins:", 0.0, v4, 0.0, v6);

  +[OBDevice currentDevice](OBDevice, "currentDevice");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "type") == 2)
  {
    -[OBTableWelcomeController tableView](self, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "style");

    if (v9)
      return;
    -[OBTableWelcomeController tableView](self, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "separatorInset");
    v12 = v11;
    v14 = v13;

    -[OBTableWelcomeController tableView](self, "tableView");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setSeparatorInset:", v12, v4, v14, v6);
  }

}

- (void)_setTableViewNonHeaderFooterDonation:(id)a3
{
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
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];

  v29[4] = *MEMORY[0x1E0C80C00];
  objc_storeStrong((id *)&self->_tableView, a3);
  v20 = a3;
  -[OBTableWelcomeController _updateDirectionalLayoutMarginsForTableView](self, "_updateDirectionalLayoutMarginsForTableView");
  -[OBWelcomeController contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v20);

  v18 = (void *)MEMORY[0x1E0CB3718];
  -[OBWelcomeController contentView](self, "contentView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "topAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTableWelcomeController tableView](self, "tableView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v24;
  -[OBWelcomeController contentView](self, "contentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTableWelcomeController tableView](self, "tableView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v17;
  -[OBWelcomeController contentView](self, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "trailingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTableWelcomeController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "trailingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v9;
  -[OBWelcomeController contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTableWelcomeController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "activateConstraints:", v15);

}

- (id)scrollView
{
  void *v3;
  objc_super v5;

  if (-[OBTableWelcomeController adoptTableViewScrollView](self, "adoptTableViewScrollView"))
  {
    -[OBTableWelcomeController tableView](self, "tableView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)OBTableWelcomeController;
    -[OBWelcomeController scrollView](&v5, sel_scrollView);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)loadView
{
  OBTableHeaderFooterView *v3;
  OBTableHeaderFooterView *v4;
  void *v5;
  void *v6;
  objc_super v7;

  if (-[OBTableWelcomeController adoptTableViewScrollView](self, "adoptTableViewScrollView"))
  {
    v3 = -[OBTableHeaderFooterView initWithLayout:]([OBTableHeaderFooterView alloc], "initWithLayout:", 0);
    -[OBTableWelcomeController setHeaderContainer:](self, "setHeaderContainer:", v3);

    v4 = -[OBTableHeaderFooterView initWithLayout:]([OBTableHeaderFooterView alloc], "initWithLayout:", 1);
    -[OBTableWelcomeController setFooterContainer:](self, "setFooterContainer:", v4);

    -[OBTableWelcomeController headerContainer](self, "headerContainer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeController headerView](self, "headerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setInternalContentView:", v6);

  }
  v7.receiver = self;
  v7.super_class = (Class)OBTableWelcomeController;
  -[OBWelcomeController loadView](&v7, sel_loadView);
}

- (void)viewDidLoad
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)OBTableWelcomeController;
  -[OBBaseWelcomeController viewDidLoad](&v11, sel_viewDidLoad);
  -[OBTableWelcomeController _insertPendingTableView](self, "_insertPendingTableView");
  -[OBBaseWelcomeController directionalLayoutMargins](self, "directionalLayoutMargins");
  v4 = v3;
  v6 = v5;
  -[OBTableWelcomeController headerContainer](self, "headerContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController _headerTopOffset](self, "_headerTopOffset");
  v9 = v8;
  -[OBTableWelcomeController headerViewBottomToTableViewTopPadding](self, "headerViewBottomToTableViewTopPadding");
  objc_msgSend(v7, "setInternalContentPadding:", v9, v4, v10, v6);

}

- (void)_updateHeaderTopOffsetConstraint
{
  objc_super v3;

  if (!-[OBTableWelcomeController adoptTableViewScrollView](self, "adoptTableViewScrollView"))
  {
    v3.receiver = self;
    v3.super_class = (Class)OBTableWelcomeController;
    -[OBWelcomeController _updateHeaderTopOffsetConstraint](&v3, sel__updateHeaderTopOffsetConstraint);
  }
}

- (void)_setTableViewWithHeaderFooterDonation:(id)a3
{
  UITableView **p_tableView;
  id v6;
  id v7;
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
  void *v40;
  void *v41;
  _QWORD v42[4];

  v42[3] = *MEMORY[0x1E0C80C00];
  p_tableView = &self->_tableView;
  objc_storeStrong((id *)&self->_tableView, a3);
  v6 = a3;
  -[UITableView setDelegate:](*p_tableView, "setDelegate:", self);
  v7 = v6;
  v39 = v6;
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[OBTableWelcomeController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v7);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTableWelcomeController view](self, "view");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "leadingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTableWelcomeController tableView](self, "tableView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "leadingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v34;
  -[OBTableWelcomeController view](self, "view");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "trailingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTableWelcomeController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v11;
  -[OBTableWelcomeController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTableWelcomeController tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "addObjectsFromArray:", v17);

  -[OBTableWelcomeController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "safeAreaLayoutGuide");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTableWelcomeController tableView](self, "tableView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "addObjectsFromArray:", v24);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v40);
  -[OBTableWelcomeController headerContainer](self, "headerContainer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTableWelcomeController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bounds");
  objc_msgSend(v25, "setFrame:", 0.0, 0.0);

  -[OBTableWelcomeController headerContainer](self, "headerContainer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setNeedsLayout");

  -[OBTableWelcomeController headerContainer](self, "headerContainer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "layoutIfNeeded");

  -[OBWelcomeController headerView](self, "headerView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTableWelcomeController view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bounds");
  objc_msgSend(v29, "setFrame:", 0.0, 0.0);

  -[OBTableWelcomeController headerContainer](self, "headerContainer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setTableHeaderView:", v31);

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OBTableWelcomeController;
  -[OBWelcomeController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[OBTableWelcomeController _updateHeaderFooterViewSizeIfNeeded](self, "_updateHeaderFooterViewSizeIfNeeded");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OBTableWelcomeController;
  -[OBWelcomeController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[OBTableWelcomeController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

  -[OBTableWelcomeController _updateHeaderFooterViewSizeIfNeeded](self, "_updateHeaderFooterViewSizeIfNeeded");
}

- (void)setTableFooterView:(id)a3
{
  -[OBTableWelcomeController setHostedTableFooterView:](self, "setHostedTableFooterView:", a3);
  -[OBTableWelcomeController _layoutButtonTray](self, "_layoutButtonTray");
}

- (void)setTableHeaderView:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  -[OBTableWelcomeController setHostedTableHeaderView:](self, "setHostedTableHeaderView:", a3);
  -[OBBaseWelcomeController directionalLayoutMargins](self, "directionalLayoutMargins");
  v5 = v4;
  v7 = v6;
  -[OBTableWelcomeController headerContainer](self, "headerContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTableWelcomeController hostedTableHeaderView](self, "hostedTableHeaderView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHostedView:", v9);

  -[OBTableWelcomeController headerContainer](self, "headerContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHostedViewPadding:", 0.0, v5, 0.0, v7);

  -[OBTableWelcomeController headerContainer](self, "headerContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layoutIfNeeded");

  -[OBTableWelcomeController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTableWelcomeController headerContainer](self, "headerContainer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTableHeaderView:", v13);

  -[OBTableWelcomeController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setNeedsLayout");

  -[OBTableWelcomeController view](self, "view");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layoutIfNeeded");

}

- (double)headerViewBottomToTableViewTopPadding
{
  void *v2;
  uint64_t v3;

  +[OBDevice currentDevice](OBDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "templateType");

  if ((unint64_t)(v3 - 2) > 7)
    return 57.0;
  else
    return dbl_19A01F0B8[v3 - 2];
}

- (void)_layoutButtonTray
{
  void *v3;
  objc_super v4;

  if (!-[OBTableWelcomeController adoptTableViewScrollView](self, "adoptTableViewScrollView")
    || (-[OBTableWelcomeController tableView](self, "tableView"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    v4.receiver = self;
    v4.super_class = (Class)OBTableWelcomeController;
    -[OBWelcomeController _layoutButtonTray](&v4, sel__layoutButtonTray);
  }
}

- (void)_floatButtonTray
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  if (-[OBTableWelcomeController adoptTableViewScrollView](self, "adoptTableViewScrollView"))
  {
    -[OBTableWelcomeController footerContainer](self, "footerContainer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBTableWelcomeController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    objc_msgSend(v3, "setFrame:", 0.0, 0.0);

    -[OBTableWelcomeController hostedTableFooterView](self, "hostedTableFooterView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {

    }
    else
    {
      -[OBWelcomeController buttonTray](self, "buttonTray");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isHidden");

      if ((v7 & 1) != 0)
      {
        v8 = *MEMORY[0x1E0C9D648];
        v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
        v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
        v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
        -[OBTableWelcomeController footerContainer](self, "footerContainer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setFrame:", v8, v9, v10, v11);

        -[OBTableWelcomeController footerContainer](self, "footerContainer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setAutoresizingMask:", 0);

LABEL_7:
        -[OBTableWelcomeController tableView](self, "tableView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[OBTableWelcomeController footerContainer](self, "footerContainer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setTableFooterView:", v15);

        goto LABEL_8;
      }
    }
    -[OBTableWelcomeController _layoutFooterContainerFloatButtonTray](self, "_layoutFooterContainerFloatButtonTray");
    goto LABEL_7;
  }
LABEL_8:
  v16.receiver = self;
  v16.super_class = (Class)OBTableWelcomeController;
  -[OBWelcomeController _floatButtonTray](&v16, sel__floatButtonTray);
}

- (void)_inlineButtonTray
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  if (-[OBTableWelcomeController adoptTableViewScrollView](self, "adoptTableViewScrollView"))
  {
    -[OBTableWelcomeController footerContainer](self, "footerContainer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBTableWelcomeController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    objc_msgSend(v3, "setFrame:", 0.0, 0.0);

    -[OBTableWelcomeController footerContainer](self, "footerContainer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAutoresizingMask:", 16);

    -[OBTableWelcomeController _layoutFooterContainerInlineButtonTray](self, "_layoutFooterContainerInlineButtonTray");
    -[OBTableWelcomeController tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBTableWelcomeController footerContainer](self, "footerContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTableFooterView:", v7);

    -[OBTableWelcomeController _updateButtonTrayTableFooterContainerSizeIfNeeded](self, "_updateButtonTrayTableFooterContainerSizeIfNeeded");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)OBTableWelcomeController;
    -[OBWelcomeController _inlineButtonTray](&v8, sel__inlineButtonTray);
  }
}

- (BOOL)_buttonTrayInlined
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  objc_super v9;

  if (-[OBTableWelcomeController adoptTableViewScrollView](self, "adoptTableViewScrollView")
    && (-[OBTableWelcomeController tableView](self, "tableView"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    -[OBWelcomeController buttonTray](self, "buttonTray");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBTableWelcomeController footerContainer](self, "footerContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5 == v6;

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)OBTableWelcomeController;
    return -[OBWelcomeController _buttonTrayInlined](&v9, sel__buttonTrayInlined);
  }
  return v7;
}

- (BOOL)contentViewUnderButtonTray
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double MaxY;
  void *v8;
  double v9;
  BOOL v10;
  objc_super v12;
  CGRect v13;

  if (-[OBTableWelcomeController adoptTableViewScrollView](self, "adoptTableViewScrollView"))
  {
    -[OBTableWelcomeController scrollView](self, "scrollView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "contentSize");
    v5 = v4;
    -[OBTableWelcomeController scrollView](self, "scrollView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    MaxY = CGRectGetMaxY(v13);
    -[OBWelcomeController buttonTray](self, "buttonTray");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "intrinsicContentSize");
    v10 = v5 >= MaxY - v9;

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)OBTableWelcomeController;
    return -[OBWelcomeController contentViewUnderButtonTray](&v12, sel_contentViewUnderButtonTray);
  }
  return v10;
}

- (BOOL)_scrollViewContentIsUnderTray
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  BOOL v7;
  objc_super v8;

  -[OBTableWelcomeController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "style") == 1)
  {
    if (!-[OBTableWelcomeController _buttonTrayInlined](self, "_buttonTrayInlined"))
    {
      v4 = -[OBTableWelcomeController adoptTableViewScrollView](self, "adoptTableViewScrollView");

      if (v4)
        return -[OBTableWelcomeController _scrollContentUnderButtonTrayForGroupedStyle](self, "_scrollContentUnderButtonTrayForGroupedStyle");
LABEL_9:
      v8.receiver = self;
      v8.super_class = (Class)OBTableWelcomeController;
      return -[OBWelcomeController _scrollViewContentIsUnderTray](&v8, sel__scrollViewContentIsUnderTray);
    }
LABEL_8:

    goto LABEL_9;
  }
  -[OBTableWelcomeController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "style") != 2 || -[OBTableWelcomeController _buttonTrayInlined](self, "_buttonTrayInlined"))
  {

    goto LABEL_8;
  }
  v7 = -[OBTableWelcomeController adoptTableViewScrollView](self, "adoptTableViewScrollView");

  if (!v7)
    goto LABEL_9;
  return -[OBTableWelcomeController _scrollContentUnderButtonTrayForGroupedStyle](self, "_scrollContentUnderButtonTrayForGroupedStyle");
}

- (BOOL)_scrollContentUnderButtonTrayForGroupedStyle
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  BOOL v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;

  -[OBTableWelcomeController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  -[OBWelcomeController buttonTray](self, "buttonTray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;

  v9 = 0;
  if (v5 != 0.0 && v8 != 0.0)
  {
    -[OBTableWelcomeController tableView](self, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contentSize");
    v12 = v11;
    -[OBTableWelcomeController tableView](self, "tableView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "contentOffset");
    v15 = v12 - v14;
    -[OBWelcomeController keyboardFrame](self, "keyboardFrame");
    v9 = v15 > v5 - v8 - v16;

  }
  return v9;
}

- (void)_updateButtonTrayTableFooterContainerSizeIfNeeded
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;

  -[OBTableWelcomeController footerContainer](self, "footerContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

  -[OBBaseWelcomeController directionalLayoutMargins](self, "directionalLayoutMargins");
  v5 = v4;
  v7 = v6;
  -[OBTableWelcomeController footerContainer](self, "footerContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInternalContentPadding:", 0.0, v5, 0.0, v7);

  -[OBTableWelcomeController footerContainer](self, "footerContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTableWelcomeController footerContainer](self, "footerContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v12 = v11;
  -[OBTableWelcomeController footerContainer](self, "footerContainer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  v15 = v14;
  -[OBTableWelcomeController tableView](self, "tableView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  v18 = v17;
  -[OBTableWelcomeController footerContainer](self, "footerContainer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "intrinsicContentSize");
  objc_msgSend(v9, "setFrame:", v12, v15, v18, v20);

  -[OBTableWelcomeController tableView](self, "tableView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTableWelcomeController footerContainer](self, "footerContainer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTableFooterView:", v22);

  -[OBWelcomeController _updateButtonTrayBackdrop](self, "_updateButtonTrayBackdrop");
}

- (void)_updateTableHeaderViewSizeIfNeeded
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  id v24;

  if (-[OBTableWelcomeController adoptTableViewScrollView](self, "adoptTableViewScrollView"))
  {
    -[OBBaseWelcomeController directionalLayoutMargins](self, "directionalLayoutMargins");
    v4 = v3;
    v6 = v5;
    -[OBTableWelcomeController headerContainer](self, "headerContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeController _headerTopOffset](self, "_headerTopOffset");
    v9 = v8;
    -[OBTableWelcomeController headerViewBottomToTableViewTopPadding](self, "headerViewBottomToTableViewTopPadding");
    objc_msgSend(v7, "setInternalContentPadding:", v9, v4, v10, v6);

    -[OBTableWelcomeController headerContainer](self, "headerContainer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layoutIfNeeded");

    -[OBTableWelcomeController headerContainer](self, "headerContainer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    v14 = v13;
    v16 = v15;
    v18 = v17;

    -[OBTableWelcomeController headerContainer](self, "headerContainer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "intrinsicContentSize");
    v21 = v20;

    -[OBTableWelcomeController headerContainer](self, "headerContainer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setFrame:", v14, v16, v18, v21);

    -[OBTableWelcomeController tableView](self, "tableView");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    -[OBTableWelcomeController headerContainer](self, "headerContainer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTableHeaderView:", v23);

  }
}

- (void)_setupScrollView
{
  objc_super v3;

  if (!-[OBTableWelcomeController adoptTableViewScrollView](self, "adoptTableViewScrollView"))
  {
    v3.receiver = self;
    v3.super_class = (Class)OBTableWelcomeController;
    -[OBWelcomeController _setupScrollView](&v3, sel__setupScrollView);
  }
}

- (void)_layoutFooterContainerInlineButtonTray
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  id v15;

  -[OBTableWelcomeController hostedTableFooterView](self, "hostedTableFooterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[OBTableWelcomeController footerContainer](self, "footerContainer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeController buttonTray](self, "buttonTray");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setInternalContentView:", v5);

    -[OBTableWelcomeController footerContainer](self, "footerContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBBaseWelcomeController directionalLayoutMargins](self, "directionalLayoutMargins");
    v8 = v7;
    -[OBBaseWelcomeController directionalLayoutMargins](self, "directionalLayoutMargins");
    objc_msgSend(v6, "setInternalContentPadding:", 0.0, v8, 0.0);

    -[OBTableWelcomeController footerContainer](self, "footerContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBTableWelcomeController hostedTableFooterView](self, "hostedTableFooterView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHostedView:", v10);

    -[OBTableWelcomeController footerContainer](self, "footerContainer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBBaseWelcomeController directionalLayoutMargins](self, "directionalLayoutMargins");
    v13 = v12;
    -[OBBaseWelcomeController directionalLayoutMargins](self, "directionalLayoutMargins");
    objc_msgSend(v11, "setHostedViewPadding:", 0.0, v13, 0.0);

  }
  -[OBTableWelcomeController footerContainer](self, "footerContainer");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController buttonTray](self, "buttonTray");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setInternalContentView:", v14);

}

- (void)_layoutFooterContainerFloatButtonTray
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  id v13;

  -[OBTableWelcomeController hostedTableFooterView](self, "hostedTableFooterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[OBTableWelcomeController footerContainer](self, "footerContainer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setInternalContentView:", 0);

    -[OBTableWelcomeController footerContainer](self, "footerContainer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBBaseWelcomeController directionalLayoutMargins](self, "directionalLayoutMargins");
    v7 = v6;
    -[OBBaseWelcomeController directionalLayoutMargins](self, "directionalLayoutMargins");
    objc_msgSend(v5, "setInternalContentPadding:", 0.0, v7, 0.0);

    -[OBTableWelcomeController footerContainer](self, "footerContainer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBTableWelcomeController hostedTableFooterView](self, "hostedTableFooterView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHostedView:", v9);

    -[OBTableWelcomeController footerContainer](self, "footerContainer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBBaseWelcomeController directionalLayoutMargins](self, "directionalLayoutMargins");
    v12 = v11;
    -[OBBaseWelcomeController directionalLayoutMargins](self, "directionalLayoutMargins");
    objc_msgSend(v10, "setHostedViewPadding:", 0.0, v12, 0.0);

  }
  -[OBTableWelcomeController footerContainer](self, "footerContainer");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setInternalContentView:", 0);

}

- (void)_updateHeaderFooterViewSizeIfNeeded
{
  if (-[OBTableWelcomeController adoptTableViewScrollView](self, "adoptTableViewScrollView"))
  {
    -[OBTableWelcomeController _updateTableHeaderViewSizeIfNeeded](self, "_updateTableHeaderViewSizeIfNeeded");
    -[OBTableWelcomeController _updateButtonTrayTableFooterContainerSizeIfNeeded](self, "_updateButtonTrayTableFooterContainerSizeIfNeeded");
  }
}

- (void)_insertPendingTableView
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[OBTableWelcomeController tableView](self, "tableView");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[OBTableWelcomeController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[OBTableWelcomeController tableView](self, "tableView");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[OBTableWelcomeController _setTableView:](self, "_setTableView:", v7);

    }
  }
}

- (void)_setTableView:(id)a3
{
  void *v4;
  OBScrollViewWeakLayoutObserver *v5;
  id v6;

  v6 = a3;
  -[OBTableWelcomeController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setLayoutObserver:", 0);

  v5 = -[OBScrollViewWeakLayoutObserver initWithLayoutObserver:]([OBScrollViewWeakLayoutObserver alloc], "initWithLayoutObserver:", self);
  objc_msgSend(v6, "_setLayoutObserver:", v5);

  if (-[OBTableWelcomeController adoptTableViewScrollView](self, "adoptTableViewScrollView"))
    -[OBTableWelcomeController _setTableViewWithHeaderFooterDonation:](self, "_setTableViewWithHeaderFooterDonation:", v6);
  else
    -[OBTableWelcomeController _setTableViewNonHeaderFooterDonation:](self, "_setTableViewNonHeaderFooterDonation:", v6);

}

- (void)_scrollViewDidLayoutSubviews:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OBTableWelcomeController;
  -[OBWelcomeController _scrollViewDidLayoutSubviews:](&v4, sel__scrollViewDidLayoutSubviews_, a3);
  -[OBWelcomeController updateNavigationBarAnimated:](self, "updateNavigationBarAnimated:", 1);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (OBTableHeaderFooterView)headerContainer
{
  return self->_headerContainer;
}

- (void)setHeaderContainer:(id)a3
{
  objc_storeStrong((id *)&self->_headerContainer, a3);
}

- (OBTableHeaderFooterView)footerContainer
{
  return self->_footerContainer;
}

- (void)setFooterContainer:(id)a3
{
  objc_storeStrong((id *)&self->_footerContainer, a3);
}

- (BOOL)adoptTableViewScrollView
{
  return self->_adoptTableViewScrollView;
}

- (void)setAdoptTableViewScrollView:(BOOL)a3
{
  self->_adoptTableViewScrollView = a3;
}

- (UIView)hostedTableFooterView
{
  return self->_hostedTableFooterView;
}

- (void)setHostedTableFooterView:(id)a3
{
  objc_storeStrong((id *)&self->_hostedTableFooterView, a3);
}

- (UIView)hostedTableHeaderView
{
  return self->_hostedTableHeaderView;
}

- (void)setHostedTableHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_hostedTableHeaderView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostedTableHeaderView, 0);
  objc_storeStrong((id *)&self->_hostedTableFooterView, 0);
  objc_storeStrong((id *)&self->_footerContainer, 0);
  objc_storeStrong((id *)&self->_headerContainer, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
