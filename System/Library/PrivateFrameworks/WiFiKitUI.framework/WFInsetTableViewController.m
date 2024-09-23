@implementation WFInsetTableViewController

- (WFInsetTableViewController)init
{
  WFInsetTableViewController *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFInsetTableViewController;
  v2 = -[WFInsetTableViewController init](&v4, sel_init);
  -[WFInsetTableViewController setReloadDataOnUpdateSectionContentInset:](v2, "setReloadDataOnUpdateSectionContentInset:", 1);
  return v2;
}

- (void)loadView
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFInsetTableViewController;
  -[WFInsetTableViewController loadView](&v4, sel_loadView);
  -[WFInsetTableViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLayoutMarginsFollowReadableWidth:", 1);

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFInsetTableViewController;
  -[WFInsetTableViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[WFInsetTableViewController _updateSectionContentInsetWithAnimation:](self, "_updateSectionContentInsetWithAnimation:", 1);
}

- (void)_updateSectionContentInsetWithAnimation:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  double *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v22;
  id v23;
  _QWORD v24[9];

  v3 = a3;
  v5 = -[WFInsetTableViewController _isRegularWidth](self, "_isRegularWidth");
  v6 = (double *)MEMORY[0x24BEBE770];
  if (v5)
  {
    -[WFInsetTableViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layoutMargins");
    v9 = v8;

    -[WFInsetTableViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safeAreaInsets");
    v12 = v11;

    v13 = 0.0;
    if (v12 <= 0.0)
    {
      -[WFInsetTableViewController view](self, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "layoutMargins");
      v13 = v15;

    }
  }
  else
  {
    v13 = *MEMORY[0x24BEBE770];
    v9 = *MEMORY[0x24BEBE770];
  }
  -[WFInsetTableViewController tableView](self, "tableView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_sectionContentInset");
  v18 = v17;
  v20 = v19;

  if (v9 != v18 || v13 != v20)
  {
    v22 = *v6;
    if (v3 && self->_sectionContentInsetInitialized)
    {
      -[WFInsetTableViewController tableView](self, "tableView");
      v23 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "_setSectionContentInset:", v22, v9, v22, v13);

    }
    else
    {
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __70__WFInsetTableViewController__updateSectionContentInsetWithAnimation___block_invoke;
      v24[3] = &unk_24DB379E8;
      v24[4] = self;
      *(double *)&v24[5] = v22;
      *(double *)&v24[6] = v9;
      *(double *)&v24[7] = v22;
      *(double *)&v24[8] = v13;
      objc_msgSend(MEMORY[0x24BEBDB00], "performWithoutAnimation:", v24);
      self->_sectionContentInsetInitialized = 1;
    }
  }
}

void __70__WFInsetTableViewController__updateSectionContentInsetWithAnimation___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  id v7;

  v2 = *(double *)(a1 + 40);
  v3 = *(double *)(a1 + 48);
  v4 = *(double *)(a1 + 56);
  v5 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setSectionContentInset:", v2, v3, v4, v5);

  if (objc_msgSend(*(id *)(a1 + 32), "reloadDataOnUpdateSectionContentInset"))
  {
    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reloadData");

  }
}

- (BOOL)_isRegularWidth
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x24BEBDAB0], "traitCollectionWithHorizontalSizeClass:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFInsetTableViewController splitViewController](self, "splitViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsTraitsInCollection:", v3);

  return v6;
}

- (BOOL)reloadDataOnUpdateSectionContentInset
{
  return self->_reloadDataOnUpdateSectionContentInset;
}

- (void)setReloadDataOnUpdateSectionContentInset:(BOOL)a3
{
  self->_reloadDataOnUpdateSectionContentInset = a3;
}

@end
