@implementation UIPrinterBrowserViewController

- (UIPrinterBrowserViewController)initWithOwnerViewController:(id)a3 printInfo:(id)a4
{
  id v6;
  id v7;
  UIPrinterBrowserViewController *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)UIPrinterBrowserViewController;
  v8 = -[UIPrinterBrowserViewController initWithStyle:](&v19, sel_initWithStyle_, 2);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Printer"), CFSTR("Printer"), CFSTR("Localizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrinterBrowserViewController setTitle:](v8, "setTitle:", v10);

    v11 = *MEMORY[0x1E0DC53D8];
    -[UIPrinterBrowserViewController tableView](v8, "tableView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setRowHeight:", v11);

    -[UIPrinterBrowserViewController setOwnerPanelViewController:](v8, "setOwnerPanelViewController:", v6);
    v13 = (void *)objc_msgSend(v7, "copy");
    -[UIPrinterBrowserViewController setPrintInfoForBrowser:](v8, "setPrintInfoForBrowser:", v13);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrinterBrowserViewController setICloudPrinters:](v8, "setICloudPrinters:", v14);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrinterBrowserViewController setAvailablePrinters:](v8, "setAvailablePrinters:", v15);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrinterBrowserViewController setFilteredOutPrinters:](v8, "setFilteredOutPrinters:", v16);

    -[UIPrinterBrowserViewController setShouldFilterPrinters:](v8, "setShouldFilterPrinters:", objc_msgSend(v6, "filtersPrinters"));
    -[UIPrinterBrowserViewController setMaximumPopoverHeight:](v8, "setMaximumPopoverHeight:", 1.79769313e308);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v8, sel_stopPrinterBrowser, *MEMORY[0x1E0DC4768], 0);
    objc_msgSend(v17, "addObserver:selector:name:object:", v8, sel_willEnterForeground, *MEMORY[0x1E0DC4860], 0);
    objc_msgSend(v17, "addObserver:selector:name:object:", v8, sel_didChangePreferredContentSize, *MEMORY[0x1E0DC48E8], 0);
    objc_msgSend(v17, "addObserver:selector:name:object:", v8, sel_iCloudPrintersListChanged, CFSTR("com.apple.printkit.iCloudPrintersChanged.notification"), 0);

  }
  return v8;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[UIPrinterBrowserViewController printerBrowser](self, "printerBrowser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIPrinterBrowserViewController printerBrowser](self, "printerBrowser");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", 0);

    -[UIPrinterBrowserViewController setPrinterBrowser:](self, "setPrinterBrowser:", 0);
  }
  v6.receiver = self;
  v6.super_class = (Class)UIPrinterBrowserViewController;
  -[UIPrinterBrowserViewController dealloc](&v6, sel_dealloc);
}

- (void)selectPrinter:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIPrinterBrowserViewController ownerPanelViewController](self, "ownerPanelViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPrinter:", v4);

}

- (void)printerInfoButtonTapped:(id)a3
{
  UIPrinterUtilityTableViewController *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "printer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[UIPrinterUtilityTableViewController initWithPrinter:]([UIPrinterUtilityTableViewController alloc], "initWithPrinter:", v6);
  -[UIPrinterBrowserViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pushViewController:animated:", v4, 1);

}

- (void)adjustPopoverSize
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
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;

  -[UIPrinterBrowserViewController popoverPresentationController](self, "popoverPresentationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIPrinterBrowserViewController tableView](self, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "numberOfSections") <= 0)
    {
      v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }
    else
    {
      -[UIPrinterBrowserViewController tableView](self, "tableView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPrinterBrowserViewController tableView](self, "tableView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "rectForSection:", objc_msgSend(v6, "numberOfSections") - 1);
      v8 = v7;

    }
    -[UIPrinterBrowserViewController navigationController](self, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "viewControllers");
    v20 = (id)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v20, "count") < 2)
    {
      v17 = 320.0;
    }
    else
    {
      objc_msgSend(v20, "objectAtIndex:", objc_msgSend(v20, "count") - 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "frame");
      v13 = v12;

      if (v8 < v13)
        v8 = v13;
      objc_msgSend(v10, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "frame");
      v16 = v15;

      v17 = fmax(v16, 320.0);
    }
    -[UIPrinterBrowserViewController maximumPopoverHeight](self, "maximumPopoverHeight");
    if (v8 < v18)
      v18 = v8;
    v19 = 161.0;
    if (v18 >= 161.0)
      v19 = v18;
    -[UIPrinterBrowserViewController setPreferredContentSize:](self, "setPreferredContentSize:", v17, v19);

  }
}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIPrinterBrowserViewController;
  -[UIPrinterBrowserViewController loadView](&v3, sel_loadView);
  -[UIPrinterBrowserViewController adjustPopoverSize](self, "adjustPopoverSize");
}

- (void)updateViewConstraints
{
  uint64_t v3;
  void *v4;
  BOOL v5;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;

  -[UIPrinterBrowserViewController searchingView](self, "searchingView");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = -[UIPrinterBrowserViewController searchingViewConstraintsSet](self, "searchingViewConstraintsSet");

    if (!v5)
    {
      -[UIPrinterBrowserViewController view](self, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0CB3718];
      -[UIPrinterBrowserViewController searchingView](self, "searchingView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPrinterBrowserViewController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8, 8, 0, v9, 8, 1.0, 0.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addConstraint:", v10);

      -[UIPrinterBrowserViewController view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0CB3718];
      -[UIPrinterBrowserViewController searchingView](self, "searchingView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPrinterBrowserViewController view](self, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v13, 7, 0, v14, 7, 1.0, 0.0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addConstraint:", v15);

      -[UIPrinterBrowserViewController view](self, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x1E0CB3718];
      -[UIPrinterBrowserViewController searchingView](self, "searchingView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPrinterBrowserViewController view](self, "view");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v18, 9, 0, v19, 9, 1.0, 0.0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addConstraint:", v20);

      -[UIPrinterBrowserViewController view](self, "view");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x1E0CB3718];
      -[UIPrinterBrowserViewController searchingView](self, "searchingView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPrinterBrowserViewController view](self, "view");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v23, 10, 0, v24, 10, 1.0, 0.0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addConstraint:", v25);

      -[UIPrinterBrowserViewController setSearchingViewConstraintsSet:](self, "setSearchingViewConstraintsSet:", 1);
    }
  }
  v26.receiver = self;
  v26.super_class = (Class)UIPrinterBrowserViewController;
  -[UIPrinterBrowserViewController updateViewConstraints](&v26, sel_updateViewConstraints);
}

- (void)startPrinterBrowser
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  -[UIPrinterBrowserViewController printerBrowser](self, "printerBrowser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[UIPrinterBrowserViewController printInfoForBrowser](self, "printInfoForBrowser");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D80A70], "browserWithDelegate:infoDictionary:", self, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrinterBrowserViewController setPrinterBrowser:](self, "setPrinterBrowser:", v6);

  }
  objc_msgSend(MEMORY[0x1E0D80A50], "iCloudPrinters");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__UIPrinterBrowserViewController_startPrinterBrowser__block_invoke;
  v8[3] = &unk_1E9D96DE0;
  v8[4] = self;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);

}

uint64_t __53__UIPrinterBrowserViewController_startPrinterBrowser__block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__UIPrinterBrowserViewController_startPrinterBrowser__block_invoke_2;
  v3[3] = &unk_1E9D96DB8;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x1E0D80A68], "printerWithiCloudPrinter:discoveryTime:completionHandler:", a2, v3, 5.0);
}

uint64_t __53__UIPrinterBrowserViewController_startPrinterBrowser__block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "addPrinter:moreComing:", a2, 0);
  return result;
}

- (void)stopPrinterBrowser
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD block[5];

  -[UIPrinterBrowserViewController printerBrowser](self, "printerBrowser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIPrinterBrowserViewController printerBrowser](self, "printerBrowser");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDelegate:", 0);

    -[UIPrinterBrowserViewController setPrinterBrowser:](self, "setPrinterBrowser:", 0);
    -[UIPrinterBrowserViewController iCloudPrinters](self, "iCloudPrinters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAllObjects");

    -[UIPrinterBrowserViewController availablePrinters](self, "availablePrinters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeAllObjects");

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__UIPrinterBrowserViewController_stopPrinterBrowser__block_invoke;
    block[3] = &unk_1E9D96D90;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __52__UIPrinterBrowserViewController_stopPrinterBrowser__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

  return objc_msgSend(*(id *)(a1 + 32), "setLoaded:", 0);
}

- (void)didChangePreferredContentSize
{
  id v2;

  -[UIPrinterBrowserViewController searchingView](self, "searchingView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateFont");

}

- (void)iCloudPrintersListChanged
{
  -[UIPrinterBrowserViewController stopPrinterBrowser](self, "stopPrinterBrowser");
  -[UIPrinterBrowserViewController startPrinterBrowser](self, "startPrinterBrowser");
}

- (void)updateSearching
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__UIPrinterBrowserViewController_updateSearching__block_invoke;
  block[3] = &unk_1E9D96D90;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __49__UIPrinterBrowserViewController_updateSearching__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _BOOL8 v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  UIPrinterSearchingView *v9;
  void *v10;
  UIPrinterSearchingView *v11;
  void *v12;
  void *v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "iCloudPrinters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");
  v4 = v3 == 0;
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "availablePrinters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      v4 = 0;
      goto LABEL_7;
    }
    objc_msgSend(*(id *)(a1 + 32), "searchingView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v4 = 1;
      goto LABEL_7;
    }
    v9 = [UIPrinterSearchingView alloc];
    objc_msgSend(*(id *)(a1 + 32), "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    v11 = -[UIPrinterSearchingView initWithFrame:](v9, "initWithFrame:");
    objc_msgSend(*(id *)(a1 + 32), "setSearchingView:", v11);

    objc_msgSend(*(id *)(a1 + 32), "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "searchingView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v13);

    objc_msgSend(*(id *)(a1 + 32), "view");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setNeedsUpdateConstraints");
  }

LABEL_7:
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBounces:", v4 ^ 1);

  objc_msgSend(*(id *)(a1 + 32), "searchingView");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSearching:", v4);

}

- (void)willEnterForeground
{
  void *v3;

  -[UIPrinterBrowserViewController startPrinterBrowser](self, "startPrinterBrowser");
  -[UIPrinterBrowserViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

  -[UIPrinterBrowserViewController updateSearching](self, "updateSearching");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIPrinterBrowserViewController;
  -[UIPrinterBrowserViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[UIPrinterBrowserViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

  -[UIPrinterBrowserViewController startPrinterBrowser](self, "startPrinterBrowser");
  -[UIPrinterBrowserViewController updateSearching](self, "updateSearching");
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIPrinterBrowserViewController;
  -[UIPrinterBrowserViewController viewDidDisappear:](&v7, sel_viewDidDisappear_, a3);
  -[UIPrinterBrowserViewController lockedPrinter](self, "lockedPrinter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIPrinterBrowserViewController lockedPrinter](self, "lockedPrinter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancelUnlock");

    -[UIPrinterBrowserViewController setLockedPrinter:](self, "setLockedPrinter:", 0);
  }
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_updateSearching, 0);
  -[UIPrinterBrowserViewController stopPrinterBrowser](self, "stopPrinterBrowser");
  -[UIPrinterBrowserViewController ownerPanelViewController](self, "ownerPanelViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "printerBrowserViewDidDisappear");

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  void *v4;

  -[UIPrinterBrowserViewController ownerPanelViewController](self, "ownerPanelViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "shouldAutorotateToInterfaceOrientation:", a3);

  return a3;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  unint64_t v3;

  -[UIPrinterBrowserViewController ownerPanelViewController](self, "ownerPanelViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportedInterfaceOrientations");

  return v3;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  -[UIPrinterBrowserViewController iCloudPrinters](self, "iCloudPrinters", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  -[UIPrinterBrowserViewController availablePrinters](self, "availablePrinters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  v8 = v5 != 0;
  v9 = 1;
  if (v5)
    v9 = 2;
  if (v7)
    v8 = v9;
  if (v8 <= 1)
    return 1;
  else
    return v8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  id v7;
  void *v8;
  int64_t v9;
  void *v10;

  v7 = a3;
  if (!a4)
  {
    -[UIPrinterBrowserViewController iCloudPrinters](self, "iCloudPrinters");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      -[UIPrinterBrowserViewController iCloudPrinters](self, "iCloudPrinters");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v10, "count");

LABEL_6:
      goto LABEL_7;
    }
  }
  -[UIPrinterBrowserViewController availablePrinters](self, "availablePrinters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (!a4)
    goto LABEL_6;
LABEL_7:

  return v9;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  -[UIPrinterBrowserViewController iCloudPrinters](self, "iCloudPrinters", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (a4)
      v9 = CFSTR("Other Printers");
    else
      v9 = CFSTR("Known Printers");
    objc_msgSend(v7, "localizedStringForKey:value:table:", v9, v9, CFSTR("Localizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)printerAtIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v4 = a3;
  v5 = objc_msgSend(v4, "row");
  if (objc_msgSend(v4, "section")
    || (-[UIPrinterBrowserViewController iCloudPrinters](self, "iCloudPrinters"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "count"),
        v8,
        !v9))
  {
    -[UIPrinterBrowserViewController availablePrinters](self, "availablePrinters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 < objc_msgSend(v6, "count"))
    {
      -[UIPrinterBrowserViewController availablePrinters](self, "availablePrinters");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      v10 = v7;
      objc_msgSend(v7, "objectAtIndexedSubscript:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
  }
  else
  {
    -[UIPrinterBrowserViewController iCloudPrinters](self, "iCloudPrinters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 < objc_msgSend(v6, "count"))
    {
      -[UIPrinterBrowserViewController iCloudPrinters](self, "iCloudPrinters");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
  }
  v11 = 0;
LABEL_9:

  if (!v11)
  {
    v12 = objc_msgSend(v4, "section");
    v13 = objc_msgSend(v4, "row");
    -[UIPrinterBrowserViewController iCloudPrinters](self, "iCloudPrinters");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");
    -[UIPrinterBrowserViewController availablePrinters](self, "availablePrinters");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Invalid printer selected (section: %ld, row: %ld).  We have %ld recent and %ld others."), v12, v13, v15, objc_msgSend(v16, "count"));

  }
  return v11;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  UIPrinterTableViewCell *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("PrinterBrowserTableViewCell"));
  v7 = (UIPrinterTableViewCell *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = -[UIPrinterTableViewCell initWithStyle:reuseIdentifier:]([UIPrinterTableViewCell alloc], "initWithStyle:reuseIdentifier:", 3, CFSTR("PrinterBrowserTableViewCell"));
  -[UIPrinterBrowserViewController ownerPanelViewController](self, "ownerPanelViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "printer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIPrinterBrowserViewController printerAtIndexPath:](self, "printerAtIndexPath:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIPrinterTableViewCell setPrinter:](v7, "setPrinter:", v10);
  objc_msgSend(v10, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqualToString:", v12))
  {
    -[UIPrinterTableViewCell setChecked:](v7, "setChecked:", 1);
  }
  else
  {
    objc_msgSend(v10, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrinterTableViewCell setChecked:](v7, "setChecked:", objc_msgSend(v13, "isEqualToString:", v14));

  }
  -[UIPrinterTableViewCell setDelegate:](v7, "setDelegate:", self);
  -[UIPrinterBrowserViewController lockedPrinter](self, "lockedPrinter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = 4;
  }
  else
  {
    v17 = objc_msgSend(v10, "accessState") - 1;
    if (v17 > 2)
      v16 = 0;
    else
      v16 = dword_1D81AB0D8[v17];
  }
  -[UIPrinterTableViewCell setPrinterState:](v7, "setPrinterState:", v16);
  -[UIPrinterTableViewCell layoutIfNeeded](v7, "layoutIfNeeded");

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  UIPrinterBrowserViewController *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  UIPrinterBrowserViewController *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;

  v6 = a3;
  v7 = a4;
  -[UIPrinterBrowserViewController printerAtIndexPath:](self, "printerAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrinterBrowserViewController ownerPanelViewController](self, "ownerPanelViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "accessState") == 1)
  {
    -[UIPrinterBrowserViewController setLockedPrinter:](self, "setLockedPrinter:", v8);
    objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPrinterState:", 4);
    -[UIPrinterBrowserViewController lockedPrinter](self, "lockedPrinter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __68__UIPrinterBrowserViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    v22[3] = &unk_1E9D96E08;
    v22[4] = self;
    v23 = v9;
    v24 = v10;
    v25 = v6;
    v12 = v10;
    objc_msgSend(v11, "unlockWithCompletionHandler:", v22);

LABEL_3:
    goto LABEL_12;
  }
  if (!objc_msgSend(v8, "accessState") || objc_msgSend(v8, "accessState") == 2)
  {
    objc_msgSend(v9, "setPrinter:", v8);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v9, "setUserSelectedPrinter:", 1);
    -[UIPrinterBrowserViewController navigationController](self, "navigationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "viewControllers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
    v15 = (UIPrinterBrowserViewController *)objc_claimAutoreleasedReturnValue();

    if (v15 == self)
    {
      objc_msgSend(v9, "dismissAnimated:", 1);
      goto LABEL_12;
    }
    -[UIPrinterBrowserViewController navigationController](self, "navigationController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "viewControllers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrinterBrowserViewController navigationController](self, "navigationController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "viewControllers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndexedSubscript:", objc_msgSend(v19, "count") - 1);
    v20 = (UIPrinterBrowserViewController *)objc_claimAutoreleasedReturnValue();

    if (v20 == self)
    {
      -[UIPrinterBrowserViewController navigationController](self, "navigationController");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v21 = (id)objc_msgSend(v12, "popViewControllerAnimated:", 1);
      goto LABEL_3;
    }
  }
LABEL_12:

}

void __68__UIPrinterBrowserViewController_tableView_didSelectRowAtIndexPath___block_invoke(id *a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;

  objc_msgSend(a1[4], "lockedPrinter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (a2 == 2)
    {
      objc_msgSend(a1[4], "lockedPrinter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "setPrinter:", v5);

      objc_msgSend(a1[6], "setPrinterState:", 2);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(a1[5], "setUserSelectedPrinter:", 1);
      objc_msgSend(a1[4], "navigationController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "viewControllers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v9 = a1[4];

      if (v8 == v9)
      {
        objc_msgSend(a1[5], "dismissAnimated:", 1);
      }
      else
      {
        objc_msgSend(a1[4], "navigationController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "viewControllers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[4], "navigationController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "viewControllers");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v13, "count") - 1);
        v14 = (id)objc_claimAutoreleasedReturnValue();
        v15 = a1[4];

        if (v14 == v15)
        {
          objc_msgSend(a1[4], "navigationController");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (id)objc_msgSend(v16, "popViewControllerAnimated:", 1);

        }
      }
    }
    else
    {
      objc_msgSend(a1[6], "setPrinterState:", 1);
      objc_msgSend(a1[7], "_deselectAllNonMultiSelectRowsAnimated:notifyDelegate:", 1, 0);
    }
    objc_msgSend(a1[4], "setLockedPrinter:", 0);
  }
}

- (void)addPrinter:(id)a3 moreComing:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  BOOL v10;

  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__UIPrinterBrowserViewController_addPrinter_moreComing___block_invoke;
  block[3] = &unk_1E9D96E50;
  block[4] = self;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __56__UIPrinterBrowserViewController_addPrinter_moreComing___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  _BOOL8 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  _BOOL8 v33;
  void *v34;
  void *v35;
  unint64_t v36;
  void *v37;
  void *v38;
  id v39;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "discoveredPrinterWithUUID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "ownerPanelViewController");
    v39 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 32), "shouldFilterPrinters")
      && (objc_opt_respondsToSelector() & 1) != 0
      && (objc_msgSend(v39, "shouldShowPrinter:", *(_QWORD *)(a1 + 40)) & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "filteredOutPrinters");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "addObject:", *(_QWORD *)(a1 + 40));

LABEL_23:
      return;
    }
    v5 = objc_msgSend(*(id *)(a1 + 40), "isiCloudPrinter");
    v6 = *(void **)(a1 + 32);
    if (v5)
    {
      objc_msgSend(v6, "iCloudPrinters");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", *(_QWORD *)(a1 + 40));

      objc_msgSend(*(id *)(a1 + 32), "iCloudPrinters");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "indexOfObject:", *(_QWORD *)(a1 + 40));

      objc_msgSend(*(id *)(a1 + 32), "iCloudPrinters");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      if (v11 == 1)
        goto LABEL_11;
      objc_msgSend(*(id *)(a1 + 32), "tableView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0C99D20];
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v9, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v13;
    }
    else
    {
      objc_msgSend(v6, "availablePrinters");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", *(_QWORD *)(a1 + 40));

      objc_msgSend(*(id *)(a1 + 32), "iCloudPrinters");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

      objc_msgSend(*(id *)(a1 + 32), "availablePrinters");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "sortUsingComparator:", &__block_literal_global);

      objc_msgSend(*(id *)(a1 + 32), "availablePrinters");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "indexOfObject:", *(_QWORD *)(a1 + 40));

      objc_msgSend(*(id *)(a1 + 32), "availablePrinters");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count");

      if (v23 == 1)
        goto LABEL_11;
      v24 = v18 != 0;
      objc_msgSend(*(id *)(a1 + 32), "tableView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)MEMORY[0x1E0C99D20];
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v21, v24);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v25;
    }
    objc_msgSend(v15, "arrayWithObject:", v14);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "insertRowsAtIndexPaths:withRowAnimation:", v26, 0);

    if ((objc_msgSend(*(id *)(a1 + 32), "loaded") & 1) != 0)
    {
LABEL_12:
      if (*(_BYTE *)(a1 + 48))
        goto LABEL_22;
      objc_msgSend(*(id *)(a1 + 32), "adjustPopoverSize");
      if ((objc_msgSend(*(id *)(a1 + 32), "loaded") & 1) != 0)
        goto LABEL_22;
      objc_msgSend(v39, "printer");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "iCloudPrinters");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "indexOfObject:", v28);

      if (v30 == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(*(id *)(a1 + 32), "availablePrinters");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v31, "indexOfObject:", v28);

        objc_msgSend(*(id *)(a1 + 32), "iCloudPrinters");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "count") != 0;

        if (v30 == 0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_21:
          objc_msgSend(*(id *)(a1 + 32), "setLoaded:", 1);

LABEL_22:
          objc_msgSend(*(id *)(a1 + 32), "updateSearching");
          goto LABEL_23;
        }
      }
      else
      {
        v33 = 0;
      }
      objc_msgSend(*(id *)(a1 + 32), "tableView");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "numberOfRowsInSection:", v33);

      if (v30 < v36)
      {
        objc_msgSend(*(id *)(a1 + 32), "tableView");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v30, v33);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "scrollToRowAtIndexPath:atScrollPosition:animated:", v38, 2, 0);

      }
      goto LABEL_21;
    }
LABEL_11:
    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "reloadData");

    goto LABEL_12;
  }
}

uint64_t __56__UIPrinterBrowserViewController_addPrinter_moreComing___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedStandardCompare:", v6);
  return v7;
}

- (void)removePrinter:(id)a3 moreGoing:(BOOL)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__UIPrinterBrowserViewController_removePrinter_moreGoing___block_invoke;
  v7[3] = &unk_1E9D96E78;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __58__UIPrinterBrowserViewController_removePrinter_moreGoing___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;

  objc_msgSend(*(id *)(a1 + 32), "iCloudPrinters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "indexOfObject:", *(_QWORD *)(a1 + 40));

  v4 = *(void **)(a1 + 32);
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v4, "iCloudPrinters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObject:", *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "iCloudPrinters");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v12)
    {
      v13 = 0;
LABEL_8:
      objc_msgSend(*(id *)(a1 + 32), "tableView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x1E0C99D20];
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v3, v13);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "arrayWithObject:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "deleteRowsAtIndexPaths:withRowAnimation:", v20, 0);

      goto LABEL_10;
    }
LABEL_9:
    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reloadData");
    goto LABEL_10;
  }
  objc_msgSend(v4, "availablePrinters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "indexOfObject:", *(_QWORD *)(a1 + 40));

  v6 = *(void **)(a1 + 32);
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v6, "availablePrinters");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeObject:", *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "iCloudPrinters");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v15, "count") != 0;

    objc_msgSend(*(id *)(a1 + 32), "availablePrinters");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    if (v17)
      goto LABEL_8;
    goto LABEL_9;
  }
  objc_msgSend(v6, "filteredOutPrinters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", *(_QWORD *)(a1 + 40));

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "filteredOutPrinters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", *(_QWORD *)(a1 + 40));
LABEL_10:

  }
  return objc_msgSend(*(id *)(a1 + 32), "updateSearching");
}

- (void)showCancelButton
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_alloc(MEMORY[0x1E0DC34F0]);
  -[UIPrinterBrowserViewController ownerPanelViewController](self, "ownerPanelViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "initWithBarButtonSystemItem:target:action:", 1, v6, sel_cancelPrinting);
  -[UIPrinterBrowserViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLeftBarButtonItem:", v4);

}

- (id)discoveredPrinterWithUUID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v4 = a3;
  -[UIPrinterBrowserViewController iCloudPrinters](self, "iCloudPrinters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __60__UIPrinterBrowserViewController_discoveredPrinterWithUUID___block_invoke;
  v20[3] = &unk_1E9D96EA0;
  v7 = v4;
  v21 = v7;
  v8 = objc_msgSend(v5, "indexOfObjectPassingTest:", v20);

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[UIPrinterBrowserViewController availablePrinters](self, "availablePrinters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v6;
    v16 = 3221225472;
    v17 = __60__UIPrinterBrowserViewController_discoveredPrinterWithUUID___block_invoke_2;
    v18 = &unk_1E9D96EA0;
    v19 = v7;
    v10 = objc_msgSend(v9, "indexOfObjectPassingTest:", &v15);

    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = 0;
    }
    else
    {
      -[UIPrinterBrowserViewController availablePrinters](self, "availablePrinters", v15, v16, v17, v18);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndex:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v12 = v19;
  }
  else
  {
    -[UIPrinterBrowserViewController iCloudPrinters](self, "iCloudPrinters");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndex:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

uint64_t __60__UIPrinterBrowserViewController_discoveredPrinterWithUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

uint64_t __60__UIPrinterBrowserViewController_discoveredPrinterWithUUID___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

- (double)maximumPopoverHeight
{
  return self->_maximumPopoverHeight;
}

- (void)setMaximumPopoverHeight:(double)a3
{
  self->_maximumPopoverHeight = a3;
}

- (UIPrinterBrowserOwner)ownerPanelViewController
{
  return (UIPrinterBrowserOwner *)objc_loadWeakRetained((id *)&self->_ownerPanelViewController);
}

- (void)setOwnerPanelViewController:(id)a3
{
  objc_storeWeak((id *)&self->_ownerPanelViewController, a3);
}

- (PKPrinterBrowser)printerBrowser
{
  return self->_printerBrowser;
}

- (void)setPrinterBrowser:(id)a3
{
  objc_storeStrong((id *)&self->_printerBrowser, a3);
}

- (UIPrinterSearchingView)searchingView
{
  return self->_searchingView;
}

- (void)setSearchingView:(id)a3
{
  objc_storeStrong((id *)&self->_searchingView, a3);
}

- (UIPrintInfo)printInfoForBrowser
{
  return self->_printInfoForBrowser;
}

- (void)setPrintInfoForBrowser:(id)a3
{
  objc_storeStrong((id *)&self->_printInfoForBrowser, a3);
}

- (PKPrinter)lockedPrinter
{
  return self->_lockedPrinter;
}

- (void)setLockedPrinter:(id)a3
{
  objc_storeStrong((id *)&self->_lockedPrinter, a3);
}

- (BOOL)loaded
{
  return self->_loaded;
}

- (void)setLoaded:(BOOL)a3
{
  self->_loaded = a3;
}

- (BOOL)searchingViewConstraintsSet
{
  return self->_searchingViewConstraintsSet;
}

- (void)setSearchingViewConstraintsSet:(BOOL)a3
{
  self->_searchingViewConstraintsSet = a3;
}

- (NSMutableArray)iCloudPrinters
{
  return self->_iCloudPrinters;
}

- (void)setICloudPrinters:(id)a3
{
  objc_storeStrong((id *)&self->_iCloudPrinters, a3);
}

- (NSMutableArray)availablePrinters
{
  return self->_availablePrinters;
}

- (void)setAvailablePrinters:(id)a3
{
  objc_storeStrong((id *)&self->_availablePrinters, a3);
}

- (BOOL)shouldFilterPrinters
{
  return self->_shouldFilterPrinters;
}

- (void)setShouldFilterPrinters:(BOOL)a3
{
  self->_shouldFilterPrinters = a3;
}

- (NSMutableArray)filteredOutPrinters
{
  return self->_filteredOutPrinters;
}

- (void)setFilteredOutPrinters:(id)a3
{
  objc_storeStrong((id *)&self->_filteredOutPrinters, a3);
}

- (UIBarButtonItem)iCloudPrintersButton
{
  return self->_iCloudPrintersButton;
}

- (void)setICloudPrintersButton:(id)a3
{
  objc_storeStrong((id *)&self->_iCloudPrintersButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iCloudPrintersButton, 0);
  objc_storeStrong((id *)&self->_filteredOutPrinters, 0);
  objc_storeStrong((id *)&self->_availablePrinters, 0);
  objc_storeStrong((id *)&self->_iCloudPrinters, 0);
  objc_storeStrong((id *)&self->_lockedPrinter, 0);
  objc_storeStrong((id *)&self->_printInfoForBrowser, 0);
  objc_storeStrong((id *)&self->_searchingView, 0);
  objc_storeStrong((id *)&self->_printerBrowser, 0);
  objc_destroyWeak((id *)&self->_ownerPanelViewController);
}

@end
