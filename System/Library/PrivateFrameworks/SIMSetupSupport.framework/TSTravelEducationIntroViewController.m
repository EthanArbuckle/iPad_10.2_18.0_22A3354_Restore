@implementation TSTravelEducationIntroViewController

- (TSTravelEducationIntroViewController)initWithOptions:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  TSTravelEducationIntroViewController *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSDictionary *text;
  dispatch_queue_t v19;
  uint64_t v20;
  CoreTelephonyClient *client;
  objc_super v23;
  _QWORD v24[3];
  _QWORD v25[4];

  v25[3] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("STAY_CONNECTED_TRAVEL_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("STAY_CONNECTED_TRAVEL_BODY"), &stru_24DEF4290, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23.receiver = self;
  v23.super_class = (Class)TSTravelEducationIntroViewController;
  v10 = -[OBTableWelcomeController initWithTitle:detailText:symbolName:adoptTableViewScrollView:](&v23, sel_initWithTitle_detailText_symbolName_adoptTableViewScrollView_, v7, v9, CFSTR("antenna.radiowaves.left.and.right"), 1);

  if (v10)
  {
    objc_storeStrong((id *)&v10->_options, a3);
    v10->_isRoamingTapped = 0;
    v10->_isExistingPlanTapped = 0;
    v10->_isPurchaseLocalPlanTapped = 0;
    v24[0] = CFSTR("showRoamingOption");
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("TRAVEL_DATA_ROAMING_LIST_ITEM"), &stru_24DEF4290, CFSTR("Localizable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v12;
    v24[1] = CFSTR("showLocalPlanOption");
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("TRAVEL_EXISTING_PLAN_LIST_ITEM"), &stru_24DEF4290, CFSTR("Localizable"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v14;
    v24[2] = CFSTR("showPurchaseOption");
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("TRAVEL_PURCHASE_PLAN_LIST_ITEM"), &stru_24DEF4290, CFSTR("Localizable"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25[2] = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
    v17 = objc_claimAutoreleasedReturnValue();
    text = v10->_text;
    v10->_text = (NSDictionary *)v17;

    v19 = dispatch_queue_create(CFSTR("Core Analytics"), 0);
    v20 = objc_msgSend(objc_alloc(MEMORY[0x24BDC2810]), "initWithQueue:", v19);
    client = v10->_client;
    v10->_client = (CoreTelephonyClient *)v20;

  }
  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)TSTravelEducationIntroViewController;
  -[TSOBTableWelcomeController viewDidLoad](&v20, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSTravelEducationIntroViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v3);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelButtonTapped);
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRightBarButtonItem:", v6);

  v8 = objc_alloc(MEMORY[0x24BEBD9F0]);
  v9 = (void *)objc_msgSend(v8, "initWithFrame:style:", 2, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[OBTableWelcomeController setTableView:](self, "setTableView:", v9);

  -[OBTableWelcomeController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[OBTableWelcomeController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDirectionalLayoutMargins:", 1.0, 1.0, 1.0, 1.0);

  -[OBTableWelcomeController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBackgroundColor:", v13);

  -[OBTableWelcomeController tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDataSource:", self);

  -[OBTableWelcomeController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDelegate:", self);

  -[OBTableWelcomeController tableView](self, "tableView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setScrollEnabled:", 1);

  -[OBTableWelcomeController tableView](self, "tableView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAllowsMultipleSelection:", 0);

  -[OBTableWelcomeController tableView](self, "tableView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "reloadData");

  -[OBTableWelcomeController tableView](self, "tableView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "layoutIfNeeded");

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;

  self->_isRoamingTapped = 0;
  self->_isExistingPlanTapped = 0;
  self->_isPurchaseLocalPlanTapped = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSTravelEducationIntroViewController;
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

  -[TSTravelEducationIntroViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

  v6.receiver = self;
  v6.super_class = (Class)TSTravelEducationIntroViewController;
  -[TSTravelEducationIntroViewController updateViewConstraints](&v6, sel_updateViewConstraints);
  v5.receiver = self;
  v5.super_class = (Class)TSTravelEducationIntroViewController;
  -[OBTableWelcomeController viewDidLayoutSubviews](&v5, sel_viewDidLayoutSubviews);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSDictionary count](self->_options, "count", a3, a4);
}

- (id)getCellTextAt:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  __CFString *v7;
  NSDictionary *text;
  void *v9;

  v4 = a3;
  -[TSTravelEducationIntroViewController getDisplayOptions](self, "getDisplayOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "row");
  if (v6 <= objc_msgSend(v5, "count"))
  {
    text = self->_text;
    objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](text, "objectForKeyedSubscript:", v9);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = &stru_24DEF4290;
  }

  return v7;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;

  v6 = a4;
  v7 = a3;
  -[TSTravelEducationIntroViewController getCellTextAt:](self, "getCellTextAt:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE200]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD17C8];
  v11 = objc_msgSend(v6, "section");

  objc_msgSend(v10, "stringWithFormat:", CFSTR("options%ld"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "sizeWithFont:constrainedToSize:lineBreakMode:", v9, 0, 235.0, 3.40282347e38);
  v15 = fmax(v14, 60.0);

  return v15;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v6;
  id v7;
  id v8;
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

  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("options%ld"), objc_msgSend(v7, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dequeueReusableCellWithIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 0, v9);
  objc_msgSend(v10, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLayoutMargins:", 10.0, 0.0, 0.0, 0.0);

  objc_msgSend(v10, "setAccessoryType:", 1);
  objc_msgSend(MEMORY[0x24BEBD4B8], "secondarySystemBackgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v12);

  objc_msgSend(v10, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLineBreakMode:", 0);

  objc_msgSend(v10, "textLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setNumberOfLines:", 0);

  objc_msgSend(v10, "textLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE200]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFont:", v16);

  -[TSTravelEducationIntroViewController getCellTextAt:](self, "getCellTextAt:", v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "textLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setText:", v18);

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  char v9;
  int *v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  id WeakRetained;
  id v16;

  v16 = a4;
  -[TSTravelEducationIntroViewController getDisplayOptions](self, "getDisplayOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTableWelcomeController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v16, 1);

  v7 = objc_msgSend(v16, "row");
  if (v7 <= objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v16, "row"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("showRoamingOption"));

    if ((v9 & 1) != 0)
    {
      v10 = &OBJC_IVAR___TSTravelEducationIntroViewController__isRoamingTapped;
    }
    else
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v16, "row"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("showLocalPlanOption"));

      if ((v12 & 1) != 0)
      {
        v10 = &OBJC_IVAR___TSTravelEducationIntroViewController__isExistingPlanTapped;
      }
      else
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v16, "row"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("showPurchaseOption"));

        if (!v14)
        {
LABEL_9:
          WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(WeakRetained, "viewControllerDidComplete:", self);

          goto LABEL_10;
        }
        v10 = &OBJC_IVAR___TSTravelEducationIntroViewController__isPurchaseLocalPlanTapped;
      }
    }
    *((_BYTE *)&self->super.super.super.super.super.super.super.isa + *v10) = 1;
    goto LABEL_9;
  }
LABEL_10:

}

- (id)getDisplayOptions
{
  void *v3;
  uint64_t v4;
  int v5;
  NSDictionary *options;
  void *v7;
  void *v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", &unk_24DF234B8);
  if (objc_msgSend(v3, "count"))
  {
    v4 = 0;
    v5 = 0;
    do
    {
      options = self->_options;
      objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKey:](options, "objectForKey:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        objc_msgSend(v3, "removeObjectAtIndex:", v4);
        --v5;
      }
      v4 = ++v5;
    }
    while (objc_msgSend(v3, "count") > (unint64_t)v5);
  }
  return v3;
}

- (void)_cancelButtonTapped
{
  CoreTelephonyClient *client;
  void *v4;
  uint64_t v5;

  client = self->_client;
  v5 = 0;
  -[CoreTelephonyClient sendTravelBuddyCAEvent:carrierName:error:](client, "sendTravelBuddyCAEvent:carrierName:error:", CFSTR("Intro View Controller_Cancel"), &stru_24DEF4290, &v5);
  -[TSTravelEducationIntroViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userDidTapCancel");

}

- (TSSIMSetupFlowDelegate)delegate
{
  return (TSSIMSetupFlowDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 1240, 1);
}

- (void)setOptions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1240);
}

- (BOOL)isRoamingTapped
{
  return self->_isRoamingTapped;
}

- (void)setIsRoamingTapped:(BOOL)a3
{
  self->_isRoamingTapped = a3;
}

- (BOOL)isExistingPlanTapped
{
  return self->_isExistingPlanTapped;
}

- (void)setIsExistingPlanTapped:(BOOL)a3
{
  self->_isExistingPlanTapped = a3;
}

- (BOOL)isPurchaseLocalPlanTapped
{
  return self->_isPurchaseLocalPlanTapped;
}

- (void)setIsPurchaseLocalPlanTapped:(BOOL)a3
{
  self->_isPurchaseLocalPlanTapped = a3;
}

- (NSDictionary)text
{
  return (NSDictionary *)objc_getProperty(self, a2, 1248, 1);
}

- (void)setText:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1248);
}

- (CoreTelephonyClient)client
{
  return (CoreTelephonyClient *)objc_getProperty(self, a2, 1256, 1);
}

- (void)setClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1256);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
