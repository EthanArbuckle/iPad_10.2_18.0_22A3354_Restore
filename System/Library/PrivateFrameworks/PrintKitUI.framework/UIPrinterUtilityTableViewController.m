@implementation UIPrinterUtilityTableViewController

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[UIPrinterUtilityTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("frame"));

  v4.receiver = self;
  v4.super_class = (Class)UIPrinterUtilityTableViewController;
  -[UIPrinterUtilityTableViewController dealloc](&v4, sel_dealloc);
}

- (UIPrinterUtilityTableViewController)initWithPrinter:(id)a3
{
  id v4;
  UIPrinterUtilityTableViewController *v5;
  UIPrinterUtilityTableViewController *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  uint64_t v18;
  objc_class *v19;
  void *v20;
  double v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *);
  void *v27;
  UIPrinterUtilityTableViewController *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id location;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)UIPrinterUtilityTableViewController;
  v5 = -[UIPrinterUtilityTableViewController initWithStyle:](&v33, sel_initWithStyle_, 2);
  v6 = v5;
  if (v5)
  {
    -[UIPrinterUtilityTableViewController setPkPrinter:](v5, "setPkPrinter:", v4);
    -[UIPrinterUtilityTableViewController setPrinterWebPageRow:](v6, "setPrinterWebPageRow:", -1);
    -[UIPrinterUtilityTableViewController setRemoveKeychainItemSection:](v6, "setRemoveKeychainItemSection:", -1);
    -[UIPrinterUtilityTableViewController setPrinterWarning:](v6, "setPrinterWarning:", 0);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Printer Info"), CFSTR("Printer Info"), CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrinterUtilityTableViewController setTitle:](v6, "setTitle:", v8);

    if (v4)
    {
      objc_initWeak(&location, v6);
      v9 = MEMORY[0x1E0C809B0];
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __55__UIPrinterUtilityTableViewController_initWithPrinter___block_invoke;
      v29[3] = &unk_1E9D97B78;
      objc_copyWeak(&v31, &location);
      v10 = v4;
      v30 = v10;
      if (_UIPrinterInfoGetState(v10, v29) == 1)
      {
        _UIPrinterInfoHasInfo(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", CFSTR("PrinterInfoURL"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIPrinterUtilityTableViewController setPrinterWebPageURL:](v6, "setPrinterWebPageURL:", v12);

        objc_msgSend(v11, "objectForKey:", CFSTR("PrinterSuppliesURL"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIPrinterUtilityTableViewController setPrinterSuppliesInfoURL:](v6, "setPrinterSuppliesInfoURL:", v13);

        if (v11)
          v14 = objc_msgSend(v10, "hasIdentifyPrinterOp");
        else
          v14 = 0;
        -[UIPrinterUtilityTableViewController setShowIdentifyPrinterItem:](v6, "setShowIdentifyPrinterItem:", v14);
        v15 = objc_msgSend(v10, "accessState") == 1 || objc_msgSend(v10, "accessState") == 2;
        -[UIPrinterUtilityTableViewController setShowRemoveKeychainItem:](v6, "setShowRemoveKeychainItem:", v15);
        -[UIPrinterUtilityTableViewController reloadPrinterInfoViews](v6, "reloadPrinterInfoViews");

      }
      -[UIPrinterUtilityTableViewController setSuppliesCheckComplete:](v6, "setSuppliesCheckComplete:", 0);
      v24 = v9;
      v25 = 3221225472;
      v26 = __55__UIPrinterUtilityTableViewController_initWithPrinter___block_invoke_3;
      v27 = &unk_1E9D97BA0;
      v28 = v6;
      objc_msgSend(v10, "getSupplyLevels:", &v24);

      objc_destroyWeak(&v31);
      objc_destroyWeak(&location);
    }
    -[UIPrinterUtilityTableViewController tableView](v6, "tableView", v24, v25, v26, v27);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:forKeyPath:options:context:", v6, CFSTR("frame"), 0, 0);

    -[UIPrinterUtilityTableViewController tableView](v6, "tableView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_opt_class();
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "registerClass:forHeaderFooterViewReuseIdentifier:", v18, v20);

    v21 = *MEMORY[0x1E0DC53D8];
    -[UIPrinterUtilityTableViewController tableView](v6, "tableView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setSectionFooterHeight:", v21);

  }
  return v6;
}

void __55__UIPrinterUtilityTableViewController_initWithPrinter___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v5 = a3;
  if (a2 == 1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__UIPrinterUtilityTableViewController_initWithPrinter___block_invoke_2;
    block[3] = &unk_1E9D97B50;
    objc_copyWeak(&v9, (id *)(a1 + 40));
    v7 = v5;
    v8 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v9);
  }

}

void __55__UIPrinterUtilityTableViewController_initWithPrinter___block_invoke_2(id *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _BOOL8 v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(a1[4], "objectForKey:", CFSTR("PrinterInfoURL"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setPrinterWebPageURL:", v2);

  objc_msgSend(a1[4], "objectForKey:", CFSTR("PrinterSuppliesURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setPrinterSuppliesInfoURL:", v3);

  if (a1[4])
    v4 = objc_msgSend(a1[5], "hasIdentifyPrinterOp");
  else
    v4 = 0;
  objc_msgSend(WeakRetained, "setShowIdentifyPrinterItem:", v4);
  v5 = objc_msgSend(a1[5], "accessState") == 1 || objc_msgSend(a1[5], "accessState") == 2;
  objc_msgSend(WeakRetained, "setShowRemoveKeychainItem:", v5);
  objc_msgSend(WeakRetained, "reloadPrinterInfoViews");

}

void __55__UIPrinterUtilityTableViewController_initWithPrinter___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__UIPrinterUtilityTableViewController_initWithPrinter___block_invoke_4;
  v5[3] = &unk_1E9D96E78;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __55__UIPrinterUtilityTableViewController_initWithPrinter___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setSuppliesCheckComplete:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "setSupplyData:", *(_QWORD *)(a1 + 40));
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  _QWORD block[5];

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("frame"), a4, a5, a6))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __86__UIPrinterUtilityTableViewController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E9D96D90;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

void __86__UIPrinterUtilityTableViewController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", objc_msgSend(*(id *)(a1 + 32), "suppliesSection"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadSections:withRowAnimation:", v2, 100);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIPrinterUtilityTableViewController;
  -[UIPrinterUtilityTableViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[UIPrinterUtilityTableViewController startPrinterWarningPoll](self, "startPrinterWarningPoll");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIPrinterUtilityTableViewController;
  -[UIPrinterUtilityTableViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[UIPrinterUtilityTableViewController stopPrinterWarningPolling](self, "stopPrinterWarningPolling");
  -[UIPrinterUtilityTableViewController setPkPrinter:](self, "setPkPrinter:", 0);
}

- (void)reloadPrinterInfoViews
{
  void *v3;
  void *v4;
  id v5;

  if (-[UIPrinterUtilityTableViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[UIPrinterUtilityTableViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[UIPrinterUtilityTableViewController tableView](self, "tableView");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "reloadData");

    }
  }
}

- (void)setSupplyData:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_storeStrong((id *)&self->_supplyData, a3);
  if (-[UIPrinterUtilityTableViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[UIPrinterUtilityTableViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[UIPrinterUtilityTableViewController tableView](self, "tableView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", -[UIPrinterUtilityTableViewController suppliesSection](self, "suppliesSection"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "reloadSections:withRowAnimation:", v8, 100);

    }
  }

}

- (void)startPrinterWarningPoll
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  UIPrinterUtilityTableViewController *v12;
  id v13;
  id location;

  -[UIPrinterUtilityTableViewController printerAttributesService](self, "printerAttributesService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    +[UIPrinterAttributesService instance](UIPrinterAttributesService, "instance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrinterUtilityTableViewController setPrinterAttributesService:](self, "setPrinterAttributesService:", v4);

  }
  objc_initWeak(&location, self);
  -[UIPrinterUtilityTableViewController pkPrinter](self, "pkPrinter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIPrinterUtilityTableViewController printerAttributesService](self, "printerAttributesService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrinterUtilityTableViewController pkPrinter](self, "pkPrinter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__UIPrinterUtilityTableViewController_startPrinterWarningPoll__block_invoke;
  v10[3] = &unk_1E9D97BC8;
  objc_copyWeak(&v13, &location);
  v9 = v6;
  v11 = v9;
  v12 = self;
  objc_msgSend(v7, "startPollForPrinterWarningStatus:completionHandler:", v8, v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __62__UIPrinterUtilityTableViewController_startPrinterWarningPoll__block_invoke(id *a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  if (a2)
  {
    v11 = v5;
    WeakRetained = objc_loadWeakRetained(a1 + 6);
    if (WeakRetained)
    {
      if (objc_msgSend(a1[4], "isEqualToString:", a1[4]))
      {
        objc_msgSend(WeakRetained, "printerWarning");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v11, "compare:", v7);

        if (v8)
        {
          objc_msgSend(WeakRetained, "setPrinterWarning:", v11);
          objc_msgSend(a1[5], "tableView");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "reloadSections:withRowAnimation:", v10, 100);

        }
      }
    }

    v5 = v11;
  }

}

- (void)stopPrinterWarningPolling
{
  void *v3;
  id v4;

  -[UIPrinterUtilityTableViewController printerAttributesService](self, "printerAttributesService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIPrinterUtilityTableViewController printerAttributesService](self, "printerAttributesService");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopPrinterWarningPolling");

  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  -[UIPrinterUtilityTableViewController setPrinterNameAndLocationSection:](self, "setPrinterNameAndLocationSection:", 0);
  -[UIPrinterUtilityTableViewController setSuppliesSection:](self, "setSuppliesSection:", 1);
  if (!-[UIPrinterUtilityTableViewController showRemoveKeychainItem](self, "showRemoveKeychainItem"))
    return 2;
  -[UIPrinterUtilityTableViewController setRemoveKeychainItemSection:](self, "setRemoveKeychainItemSection:", 2);
  return 3;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;

  if (-[UIPrinterUtilityTableViewController printerNameAndLocationSection](self, "printerNameAndLocationSection", a3) == a4)
  {
    -[UIPrinterUtilityTableViewController printerWebPageURL](self, "printerWebPageURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[UIPrinterUtilityTableViewController setPrinterWebPageRow:](self, "setPrinterWebPageRow:", 3);
      return 4;
    }
    else
    {
      return 3;
    }
  }
  else if (-[UIPrinterUtilityTableViewController suppliesSection](self, "suppliesSection") == a4)
  {
    -[UIPrinterUtilityTableViewController supplyData](self, "supplyData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[UIPrinterUtilityTableViewController supplyData](self, "supplyData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v9, "count");

    }
    else
    {
      v7 = 1;
    }

  }
  else
  {
    return 1;
  }
  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
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
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  UIPrintSupplyLevelView *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  UIPrintSupplyLevelView *v61;
  const __CFString *v62;
  _BOOL4 v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v71;
  void *v72;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "section");
  if (v8 == -[UIPrinterUtilityTableViewController printerNameAndLocationSection](self, "printerNameAndLocationSection"))
  {
    v9 = objc_msgSend(v7, "row");
    if (v9 == -[UIPrinterUtilityTableViewController printerWebPageRow](self, "printerWebPageRow"))
    {
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("PrinterUtilityPrinterWebPageTableViewCell"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("PrinterUtilityPrinterWebPageTableViewCell"));
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Show Printer Web Page"), CFSTR("Show Printer Web Page"), CFSTR("Localizable"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "textLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setText:", v12);

      -[UIPrinterUtilityTableViewController view](self, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "tintColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "textLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTextColor:", v15);

      objc_msgSend(v10, "textLabel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setNumberOfLines:", 0);

      objc_msgSend(v10, "textLabel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setLineBreakMode:", 0);
LABEL_19:

      objc_msgSend(v10, "setSelectionStyle:", 3);
      goto LABEL_42;
    }
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("PrinterUtilityPrinterNameTableViewCell"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 1, CFSTR("PrinterUtilityPrinterNameTableViewCell"));
    if (objc_msgSend(v7, "row"))
    {
      if (objc_msgSend(v7, "row") == 1)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Location"), CFSTR("Location"), CFSTR("Localizable"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "textLabel");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setText:", v23);

        -[UIPrinterUtilityTableViewController pkPrinter](self, "pkPrinter");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "location");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "detailTextLabel");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setText:", v26);

        if (-[UIPrinterUtilityTableViewController showIdentifyPrinterItem](self, "showIdentifyPrinterItem"))
          objc_msgSend(v10, "setAccessoryType:", 4);
        goto LABEL_34;
      }
      if (objc_msgSend(v7, "row") != 2)
      {
LABEL_34:
        objc_msgSend(v10, "setSelectionStyle:", 0);
        objc_msgSend(v10, "setHoverStyle:", 0);
        goto LABEL_42;
      }
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "localizedStringForKey:value:table:", CFSTR("Model"), CFSTR("Model"), CFSTR("Localizable"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "textLabel");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "setText:", v56);

      -[UIPrinterUtilityTableViewController pkPrinter](self, "pkPrinter");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "makeAndModel");
      v52 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR("Name"), CFSTR("Name"), CFSTR("Localizable"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "textLabel");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setText:", v49);

      -[UIPrinterUtilityTableViewController pkPrinter](self, "pkPrinter");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "description");
      v52 = objc_claimAutoreleasedReturnValue();
    }
    v58 = (void *)v52;
    objc_msgSend(v10, "detailTextLabel");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setText:", v58);

LABEL_33:
    goto LABEL_34;
  }
  v19 = objc_msgSend(v7, "section");
  if (v19 != -[UIPrinterUtilityTableViewController suppliesSection](self, "suppliesSection"))
  {
    v28 = objc_msgSend(v7, "section");
    if (v28 != -[UIPrinterUtilityTableViewController removeKeychainItemSection](self, "removeKeychainItemSection"))
    {
      v10 = 0;
      goto LABEL_42;
    }
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("PrinterUtilityRemoveKeychainItemTableViewCell"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("PrinterUtilityRemoveKeychainItemTableViewCell"));
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("Forget Username and Password"), CFSTR("Forget Username and Password"), CFSTR("Localizable"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "textLabel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setText:", v30);

    -[UIPrinterUtilityTableViewController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "tintColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "textLabel");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setTextColor:", v32);

    goto LABEL_19;
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 1, 0);
  objc_msgSend(v10, "textLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setNumberOfLines:", 0);

  -[UIPrinterUtilityTableViewController supplyData](self, "supplyData");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {

  }
  else if (!objc_msgSend(v7, "row"))
  {
    v63 = -[UIPrinterUtilityTableViewController suppliesCheckComplete](self, "suppliesCheckComplete");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v64;
    if (v63)
    {
      objc_msgSend(v64, "localizedStringForKey:value:table:", CFSTR("Information Not Available"), CFSTR("Information Not Available"), CFSTR("Localizable"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "textLabel");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "setText:", v66);

      objc_msgSend(v10, "setAccessoryView:", 0);
      goto LABEL_34;
    }
    objc_msgSend(v64, "localizedStringForKey:value:table:", CFSTR("Gathering Supplies Information"), CFSTR("Gathering Supplies Information"), CFSTR("Localizable"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "textLabel");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "setText:", v71);

    v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v10, "setAccessoryView:", v51);
    objc_msgSend(v51, "startAnimating");
    goto LABEL_33;
  }
  -[UIPrinterUtilityTableViewController supplyData](self, "supplyData");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "objectAtIndex:", objc_msgSend(v7, "row"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    objc_msgSend(v35, "name");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "localizedCapitalizedString");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "textLabel");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setText:", v37);

    if ((objc_msgSend(v35, "level") & 0x80000000) != 0)
    {
      v60 = objc_msgSend(v35, "level");
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v61 = (UIPrintSupplyLevelView *)objc_claimAutoreleasedReturnValue();
      v47 = v61;
      if (v60 == -3)
        v62 = CFSTR("Level is OK");
      else
        v62 = CFSTR("Level is unknown");
      -[UIPrintSupplyLevelView localizedStringForKey:value:table:](v61, "localizedStringForKey:value:table:", v62, v62, CFSTR("Localizable"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "detailTextLabel");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "setText:", v68);

    }
    else
    {
      objc_msgSend(v10, "frame");
      v40 = v39;
      -[UIPrinterUtilityTableViewController tableView](self, "tableView");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "frame");
      v43 = v42 * 0.33333;

      objc_msgSend(v35, "colors");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v44, "count") == 1)
        v45 = 20.0;
      else
        v45 = 26.0;

      objc_msgSend(v10, "frame");
      v47 = -[UIPrintSupplyLevelView initWithFrame:supplyInfo:]([UIPrintSupplyLevelView alloc], "initWithFrame:supplyInfo:", v35, v40, (v46 - v45) * 0.5, v43, v45);
      objc_msgSend(v10, "setAccessoryView:", v47);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v47 = (UIPrintSupplyLevelView *)objc_claimAutoreleasedReturnValue();
    -[UIPrintSupplyLevelView localizedStringForKey:value:table:](v47, "localizedStringForKey:value:table:", CFSTR("Information Not Available"), CFSTR("Information Not Available"), CFSTR("Localizable"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "textLabel");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setText:", v53);

  }
  objc_msgSend(v10, "setSelectionStyle:", 0);
  objc_msgSend(v10, "setHoverStyle:", 0);

LABEL_42:
  return v10;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  if (-[UIPrinterUtilityTableViewController suppliesSection](self, "suppliesSection", a3) == a4)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Supply Levels"), CFSTR("Supply Levels"), CFSTR("Localizable"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v5;

  if (-[UIPrinterUtilityTableViewController printerNameAndLocationSection](self, "printerNameAndLocationSection", a3) == a4)
  {
    -[UIPrinterUtilityTableViewController printerWarning](self, "printerWarning");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  if (-[UIPrinterUtilityTableViewController suppliesSection](self, "suppliesSection") == a4)
  {
    -[UIPrinterUtilityTableViewController supplyData](self, "supplyData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIPrinterUtilityTableViewController printerSuppliesInfoURL](self, "printerSuppliesInfoURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPrinterUtilityTableViewController view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "tintColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "updateDisclaimerTextWithInfoURL:tintColor:", v10, v12);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "section");
  if (v7 == -[UIPrinterUtilityTableViewController printerNameAndLocationSection](self, "printerNameAndLocationSection"))
  {
    v8 = objc_msgSend(v6, "row");
    if (v8 == -[UIPrinterUtilityTableViewController printerWebPageRow](self, "printerWebPageRow"))
    {
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPrinterUtilityTableViewController printerWebPageURL](self, "printerWebPageURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "openURL:options:completionHandler:", v10, MEMORY[0x1E0C9AA70], 0);

LABEL_6:
      objc_msgSend(v12, "deselectRowAtIndexPath:animated:", v6, 1);
      goto LABEL_7;
    }
  }
  v11 = objc_msgSend(v6, "section");
  if (v11 == -[UIPrinterUtilityTableViewController removeKeychainItemSection](self, "removeKeychainItemSection"))
  {
    -[UIPrinterUtilityTableViewController pkPrinter](self, "pkPrinter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeCredentialsFromKeychain");
    goto LABEL_6;
  }
LABEL_7:

}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  id v4;

  -[UIPrinterUtilityTableViewController pkPrinter](self, "pkPrinter", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifySelf");

}

- (NSArray)supplyData
{
  return self->_supplyData;
}

- (PKPrinter)pkPrinter
{
  return self->_pkPrinter;
}

- (void)setPkPrinter:(id)a3
{
  self->_pkPrinter = (PKPrinter *)a3;
}

- (NSString)printerWarning
{
  return (NSString *)objc_getProperty(self, a2, 1040, 1);
}

- (void)setPrinterWarning:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1040);
}

- (UIPrinterAttributesService)printerAttributesService
{
  return (UIPrinterAttributesService *)objc_getProperty(self, a2, 1048, 1);
}

- (void)setPrinterAttributesService:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1048);
}

- (int64_t)printerNameAndLocationSection
{
  return self->_printerNameAndLocationSection;
}

- (void)setPrinterNameAndLocationSection:(int64_t)a3
{
  self->_printerNameAndLocationSection = a3;
}

- (int64_t)suppliesSection
{
  return self->_suppliesSection;
}

- (void)setSuppliesSection:(int64_t)a3
{
  self->_suppliesSection = a3;
}

- (int64_t)printerWebPageRow
{
  return self->_printerWebPageRow;
}

- (void)setPrinterWebPageRow:(int64_t)a3
{
  self->_printerWebPageRow = a3;
}

- (int64_t)removeKeychainItemSection
{
  return self->_removeKeychainItemSection;
}

- (void)setRemoveKeychainItemSection:(int64_t)a3
{
  self->_removeKeychainItemSection = a3;
}

- (BOOL)showIdentifyPrinterItem
{
  return self->_showIdentifyPrinterItem;
}

- (void)setShowIdentifyPrinterItem:(BOOL)a3
{
  self->_showIdentifyPrinterItem = a3;
}

- (BOOL)showRemoveKeychainItem
{
  return self->_showRemoveKeychainItem;
}

- (void)setShowRemoveKeychainItem:(BOOL)a3
{
  self->_showRemoveKeychainItem = a3;
}

- (NSURL)printerSuppliesInfoURL
{
  return (NSURL *)objc_getProperty(self, a2, 1088, 1);
}

- (void)setPrinterSuppliesInfoURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1088);
}

- (NSURL)printerWebPageURL
{
  return (NSURL *)objc_getProperty(self, a2, 1096, 1);
}

- (void)setPrinterWebPageURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1096);
}

- (BOOL)suppliesCheckComplete
{
  return self->_suppliesCheckComplete;
}

- (void)setSuppliesCheckComplete:(BOOL)a3
{
  self->_suppliesCheckComplete = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_printerWebPageURL, 0);
  objc_storeStrong((id *)&self->_printerSuppliesInfoURL, 0);
  objc_storeStrong((id *)&self->_printerAttributesService, 0);
  objc_storeStrong((id *)&self->_printerWarning, 0);
  objc_storeStrong((id *)&self->_supplyData, 0);
}

@end
