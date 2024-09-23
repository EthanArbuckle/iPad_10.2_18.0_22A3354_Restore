@implementation SSCellularPlanCarrierAppsViewController

- (SSCellularPlanCarrierAppsViewController)initWithCarrierApps:(id)a3 country:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  SSCellularPlanCarrierAppsViewController *v16;
  SSCellularPlanCarrierAppsViewController *v17;
  id v20;
  objc_super v21;

  v20 = a3;
  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = (void *)MEMORY[0x24BDD1488];
  v8 = a4;
  objc_msgSend(v7, "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SET_UP_ESIM_TITLE_%@"), &stru_24DEF4290, CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("SET_UP_ESIM_DETAIL_%@"), &stru_24DEF4290, CFSTR("Localizable"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", v14, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v21.receiver = self;
  v21.super_class = (Class)SSCellularPlanCarrierAppsViewController;
  v16 = -[OBTableWelcomeController initWithTitle:detailText:symbolName:adoptTableViewScrollView:](&v21, sel_initWithTitle_detailText_symbolName_adoptTableViewScrollView_, v11, v15, CFSTR("antenna.radiowaves.left.and.right"), 1);
  v17 = v16;
  if (v16)
    objc_storeStrong(&v16->_carrierApps, a3);

  return v17;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
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
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)SSCellularPlanCarrierAppsViewController;
  -[TSOBTableWelcomeController viewDidLoad](&v29, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSCellularPlanCarrierAppsViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v3);

  if (!+[TSUtilities inBuddy](TSUtilities, "inBuddy"))
  {
    -[SSCellularPlanCarrierAppsViewController navigationController](self, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "viewControllers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v10, "count") < 2)
    {

    }
    else
    {
      v11 = +[TSUtilities isBackAllowed:](TSUtilities, "isBackAllowed:", self);

      if (v11)
      {
        -[OBBaseWelcomeController navigationItem](self, "navigationItem");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        v8 = 0;
        goto LABEL_7;
      }
    }
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__userDidTapCancel);
    -[OBBaseWelcomeController navigationItem](self, "navigationItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLeftBarButtonItem:", v7);

    goto LABEL_10;
  }
  if (!+[TSUtilities isBackAllowed:](TSUtilities, "isBackAllowed:", self))
  {
    -[OBBaseWelcomeController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 1;
LABEL_7:
    objc_msgSend(v6, "setHidesBackButton:animated:", v8, 0);
LABEL_10:

  }
  -[SSCellularPlanCarrierAppsViewController navigationController](self, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "navigationBar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBackgroundColor:", v15);

  v16 = objc_alloc(MEMORY[0x24BEBD9F0]);
  v17 = (void *)objc_msgSend(v16, "initWithFrame:style:", 2, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[OBTableWelcomeController setTableView:](self, "setTableView:", v17);

  -[OBTableWelcomeController tableView](self, "tableView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[OBTableWelcomeController tableView](self, "tableView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setDirectionalLayoutMargins:", 1.0, 1.0, 1.0, 1.0);

  -[OBTableWelcomeController tableView](self, "tableView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setBackgroundColor:", v21);

  -[OBTableWelcomeController tableView](self, "tableView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setDataSource:", self);

  -[OBTableWelcomeController tableView](self, "tableView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setDelegate:", self);

  -[OBTableWelcomeController tableView](self, "tableView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setScrollEnabled:", 1);

  -[OBTableWelcomeController tableView](self, "tableView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setAllowsSelection:", 0);

  -[OBTableWelcomeController tableView](self, "tableView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "reloadData");

  -[OBTableWelcomeController tableView](self, "tableView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "layoutIfNeeded");

  -[OBTableWelcomeController tableView](self, "tableView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("AppCell"));

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSCellularPlanCarrierAppsViewController;
  -[OBTableWelcomeController viewWillAppear:](&v3, sel_viewWillAppear_, a3);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;
  objc_super v6;

  -[OBTableWelcomeController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

  -[SSCellularPlanCarrierAppsViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

  v6.receiver = self;
  v6.super_class = (Class)SSCellularPlanCarrierAppsViewController;
  -[SSCellularPlanCarrierAppsViewController updateViewConstraints](&v6, sel_updateViewConstraints);
  v5.receiver = self;
  v5.super_class = (Class)SSCellularPlanCarrierAppsViewController;
  -[OBTableWelcomeController viewDidLayoutSubviews](&v5, sel_viewDidLayoutSubviews);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return objc_msgSend(self->_carrierApps, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  SSRecommendedCarrierAppCell *v8;
  void *v9;

  v6 = a3;
  v7 = objc_msgSend(a4, "row");
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("AppCell"));
  v8 = (SSRecommendedCarrierAppCell *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    v8 = -[SSRecommendedCarrierAppCell initWithStyle:reuseIdentifier:]([SSRecommendedCarrierAppCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("AppCell"));
  objc_msgSend(self->_carrierApps, "objectAtIndexedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSRecommendedCarrierAppCell setLockupRequest:withDelegate:](v8, "setLockupRequest:withDelegate:", v9, self);

  return v8;
}

- (BOOL)userInteractionEnabled
{
  return 1;
}

- (void)_userDidTapCancel
{
  id v2;

  -[SSCellularPlanCarrierAppsViewController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userDidTapCancel");

}

- (TSSIMSetupFlowDelegate)delegate
{
  return (TSSIMSetupFlowDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_carrierApps, 0);
}

@end
