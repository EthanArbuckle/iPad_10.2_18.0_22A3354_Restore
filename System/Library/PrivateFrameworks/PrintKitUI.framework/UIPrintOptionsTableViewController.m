@implementation UIPrintOptionsTableViewController

- (UIPrintOptionsTableViewController)initWithTableView:(id)a3 printInfo:(id)a4 printPanelViewController:(id)a5
{
  id v8;
  id v9;
  id v10;
  UIPrintOptionsTableViewController *v11;
  UIPrintOptionsTableViewController *v12;
  void *v13;
  void *v14;
  UIPrintStandardOptionsSection *v15;
  void *v16;
  UIPrintStandardOptionsSection *v17;
  UIPrintMoreOptionsSection *v18;
  void *v19;
  UIPrintMoreOptionsSection *v20;
  UIPrintMediaQualitySection *v21;
  void *v22;
  UIPrintMediaQualitySection *v23;
  UIPrintLayoutSection *v24;
  void *v25;
  UIPrintLayoutSection *v26;
  UIPrintScalingSection *v27;
  void *v28;
  UIPrintScalingSection *v29;
  UIPrintFinishingOptionsSection *v30;
  void *v31;
  UIPrintFinishingOptionsSection *v32;
  void *v33;
  UIPrintAppOptionsSection *v34;
  void *v35;
  void *v36;
  UIPrintAppOptionsSection *v37;
  uint64_t v38;
  objc_class *v39;
  void *v40;
  void *v41;
  void *v42;
  objc_super v44;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v44.receiver = self;
  v44.super_class = (Class)UIPrintOptionsTableViewController;
  v11 = -[UIPrintOptionsTableViewController initWithStyle:](&v44, sel_initWithStyle_, 2);
  v12 = v11;
  if (v11)
  {
    -[UIPrintOptionsTableViewController setPrintPanelViewController:](v11, "setPrintPanelViewController:", v10);
    objc_msgSend(v10, "printInteractionController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appOptionsViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintOptionsTableViewController setAppOptionsViewController:](v12, "setAppOptionsViewController:", v14);

    -[UIPrintOptionsTableViewController setPrintInfo:](v12, "setPrintInfo:", v9);
    -[UIPrintOptionsTableViewController setTableView:](v12, "setTableView:", v8);
    objc_msgSend(v8, "setDelegate:", v12);
    objc_msgSend(v8, "setDataSource:", v12);
    v15 = [UIPrintStandardOptionsSection alloc];
    -[UIPrintOptionsTableViewController printInfo](v12, "printInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[UIPrintStandardOptionsSection initWithPrintInfo:printPanelViewController:](v15, "initWithPrintInfo:printPanelViewController:", v16, v10);
    -[UIPrintOptionsTableViewController setStandardOptionsSection:](v12, "setStandardOptionsSection:", v17);

    v18 = [UIPrintMoreOptionsSection alloc];
    -[UIPrintOptionsTableViewController printInfo](v12, "printInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[UIPrintMoreOptionsSection initWithPrintInfo:printPanelViewController:](v18, "initWithPrintInfo:printPanelViewController:", v19, v10);
    -[UIPrintOptionsTableViewController setMoreOptionsSection:](v12, "setMoreOptionsSection:", v20);

    v21 = [UIPrintMediaQualitySection alloc];
    -[UIPrintOptionsTableViewController printInfo](v12, "printInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[UIPrintMediaQualitySection initWithPrintInfo:printPanelViewController:](v21, "initWithPrintInfo:printPanelViewController:", v22, v10);
    -[UIPrintOptionsTableViewController setMediaQualitySection:](v12, "setMediaQualitySection:", v23);

    v24 = [UIPrintLayoutSection alloc];
    -[UIPrintOptionsTableViewController printInfo](v12, "printInfo");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[UIPrintLayoutSection initWithPrintInfo:printPanelViewController:](v24, "initWithPrintInfo:printPanelViewController:", v25, v10);
    -[UIPrintOptionsTableViewController setLayoutSection:](v12, "setLayoutSection:", v26);

    v27 = [UIPrintScalingSection alloc];
    -[UIPrintOptionsTableViewController printInfo](v12, "printInfo");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[UIPrintScalingSection initWithPrintInfo:printPanelViewController:](v27, "initWithPrintInfo:printPanelViewController:", v28, v10);
    -[UIPrintOptionsTableViewController setScalingSection:](v12, "setScalingSection:", v29);

    v30 = [UIPrintFinishingOptionsSection alloc];
    -[UIPrintOptionsTableViewController printInfo](v12, "printInfo");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[UIPrintFinishingOptionsSection initWithPrintInfo:printPanelViewController:](v30, "initWithPrintInfo:printPanelViewController:", v31, v10);
    -[UIPrintOptionsTableViewController setFinishingOptionsSection:](v12, "setFinishingOptionsSection:", v32);

    -[UIPrintOptionsTableViewController appOptionsViewController](v12, "appOptionsViewController");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      v34 = [UIPrintAppOptionsSection alloc];
      -[UIPrintOptionsTableViewController printInfo](v12, "printInfo");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPrintOptionsTableViewController appOptionsViewController](v12, "appOptionsViewController");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = -[UIPrintAppOptionsSection initWithPrintInfo:printPanelViewController:appOptionsViewController:](v34, "initWithPrintInfo:printPanelViewController:appOptionsViewController:", v35, v10, v36);
      -[UIPrintOptionsTableViewController setAppOptionsSection:](v12, "setAppOptionsSection:", v37);

    }
    -[UIPrintOptionsTableViewController updatePrintSectionList](v12, "updatePrintSectionList");
    objc_msgSend(v8, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("UIPrintOptionCell"));
    objc_msgSend(v8, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("UIPrintOptionListCell"));
    objc_msgSend(v8, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("UIPrintOptionViewCell"));
    v38 = objc_opt_class();
    v39 = (objc_class *)objc_opt_class();
    NSStringFromClass(v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "registerClass:forHeaderFooterViewReuseIdentifier:", v38, v40);

    objc_msgSend(v8, "setSectionFooterHeight:", *MEMORY[0x1E0DC53D8]);
    objc_msgSend(v8, "setEstimatedSectionFooterHeight:", 10.0);
    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v12, sel_dismissKeyboard);
    objc_msgSend(v41, "setCancelsTouchesInView:", 0);
    -[UIPrintOptionsTableViewController view](v12, "view");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addGestureRecognizer:", v41);

  }
  return v12;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[UIPrintOptionsTableViewController currentPrinter](self, "currentPrinter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, 0x1E9D99738);

  v4.receiver = self;
  v4.super_class = (Class)UIPrintOptionsTableViewController;
  -[UIPrintOptionsTableViewController dealloc](&v4, sel_dealloc);
}

- (BOOL)keyboardShowing
{
  void *v2;
  char v3;

  -[UIPrintOptionsTableViewController moreOptionsSection](self, "moreOptionsSection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "keyboardShowing");

  return v3;
}

- (void)dismissKeyboard
{
  id v2;

  -[UIPrintOptionsTableViewController moreOptionsSection](self, "moreOptionsSection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissKeyboard");

}

- (void)updatePrintSectionList
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__UIPrintOptionsTableViewController_updatePrintSectionList__block_invoke;
  block[3] = &unk_1E9D96D90;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __59__UIPrintOptionsTableViewController_updatePrintSectionList__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  char v31;
  int v32;
  void *v33;
  int v34;
  id v35;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v35 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "standardOptionsSection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v2, "updatePrintOptionsList");

  objc_msgSend(*(id *)(a1 + 32), "moreOptionsSection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "updatePrintOptionsList");

  objc_msgSend(*(id *)(a1 + 32), "appOptionsSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "printOptionSections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "mediaQualitySection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "indexOfObject:", v7);
  v9 = v8 == 0x7FFFFFFFFFFFFFFFLL;

  objc_msgSend(*(id *)(a1 + 32), "mediaQualitySection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v10, "shouldShow");

  if ((_DWORD)v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "mediaQualitySection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObject:", v11);

  }
  else
  {
    v9 = v8 != 0x7FFFFFFFFFFFFFFFLL;
  }
  objc_msgSend(*(id *)(a1 + 32), "printOptionSections");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "layoutSection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "indexOfObject:", v13);
  v15 = v14 == 0x7FFFFFFFFFFFFFFFLL;

  objc_msgSend(*(id *)(a1 + 32), "layoutSection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = objc_msgSend(v16, "shouldShow");

  if ((_DWORD)v13)
  {
    objc_msgSend(*(id *)(a1 + 32), "layoutSection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObject:", v17);

  }
  else
  {
    v15 = v14 != 0x7FFFFFFFFFFFFFFFLL;
  }
  objc_msgSend(*(id *)(a1 + 32), "printOptionSections");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "scalingSection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "indexOfObject:", v19);
  v21 = v20 == 0x7FFFFFFFFFFFFFFFLL;

  objc_msgSend(*(id *)(a1 + 32), "scalingSection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v19) = objc_msgSend(v22, "shouldShow");

  if ((_DWORD)v19)
  {
    objc_msgSend(*(id *)(a1 + 32), "scalingSection");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObject:", v23);

  }
  else
  {
    v21 = v20 != 0x7FFFFFFFFFFFFFFFLL;
  }
  v24 = v21 || v15 || v9;
  if (v5)
    v24 = 1;
  v25 = v24 | v4 | v34;
  objc_msgSend(*(id *)(a1 + 32), "printOptionSections");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "finishingOptionsSection");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v26, "indexOfObject:", v27);

  objc_msgSend(*(id *)(a1 + 32), "finishingOptionsSection");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v27) = objc_msgSend(v29, "shouldShow");

  if ((_DWORD)v27)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishingOptionsSection");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObject:", v30);

    if (v28 == 0x7FFFFFFFFFFFFFFFLL)
      v31 = 1;
    else
      v31 = v25;
    objc_msgSend(*(id *)(a1 + 32), "setPrintOptionSections:", v35);
    if ((v31 & 1) == 0)
      goto LABEL_23;
LABEL_22:
    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "reloadData");

    goto LABEL_23;
  }
  if (v28 == 0x7FFFFFFFFFFFFFFFLL)
    v32 = v25;
  else
    v32 = 1;
  objc_msgSend(*(id *)(a1 + 32), "setPrintOptionSections:", v35);
  if (v32 == 1)
    goto LABEL_22;
LABEL_23:

}

- (BOOL)canDismissPrintOptions
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[UIPrintOptionsTableViewController standardOptionsSection](self, "standardOptionsSection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canDismiss");

  if (!v4)
    return 0;
  -[UIPrintOptionsTableViewController moreOptionsSection](self, "moreOptionsSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canDismiss");

  if (!v6)
    return 0;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[UIPrintOptionsTableViewController printOptionSections](self, "printOptionSections", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "canDismiss"))
        {
          v12 = 0;
          goto LABEL_14;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
        continue;
      break;
    }
  }
  v12 = 1;
LABEL_14:

  return v12;
}

- (void)setCurrentPrinter:(id)a3
{
  UIPrinter *v4;
  UIPrinter *currentPrinter;
  UIPrinter *v6;

  v4 = (UIPrinter *)a3;
  -[UIPrinter removeObserver:forKeyPath:](self->_currentPrinter, "removeObserver:forKeyPath:", self, 0x1E9D99738);
  currentPrinter = self->_currentPrinter;
  self->_currentPrinter = v4;
  v6 = v4;

  -[UIPrinter addObserver:forKeyPath:options:context:](self->_currentPrinter, "addObserver:forKeyPath:options:context:", self, 0x1E9D99738, 0, 0);
  -[UIPrintOptionsTableViewController stopPrinterWarningPolling](self, "stopPrinterWarningPolling");
  -[UIPrintOptionsTableViewController setPrinterWarnings:](self, "setPrinterWarnings:", 0);
  -[UIPrintOptionsTableViewController startPrinterWarningPoll](self, "startPrinterWarningPoll");
  -[UIPrintOptionsTableViewController updatePrintSectionList](self, "updatePrintSectionList");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  _QWORD block[5];

  if (objc_msgSend(a3, "isEqualToString:", 0x1E9D99738, a4, a5, a6))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __84__UIPrintOptionsTableViewController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E9D96D90;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __84__UIPrintOptionsTableViewController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updatePrintSectionList");
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v4;
  int64_t v5;
  void *v6;
  uint64_t v7;

  -[UIPrintOptionsTableViewController appOptionsSection](self, "appOptionsSection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIPrintOptionsTableViewController setAppOptionsSectionNum:](self, "setAppOptionsSectionNum:", 2);
    v5 = 3;
  }
  else
  {
    v5 = 2;
  }
  -[UIPrintOptionsTableViewController printOptionSections](self, "printOptionSections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
    -[UIPrintOptionsTableViewController setPrintOptionsSectionNum:](self, "setPrintOptionsSectionNum:", v5++);
  return v5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;

  v6 = a3;
  if (a4 == 1)
  {
    -[UIPrintOptionsTableViewController moreOptionsSection](self, "moreOptionsSection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!a4)
  {
    -[UIPrintOptionsTableViewController standardOptionsSection](self, "standardOptionsSection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v8 = v7;
    objc_msgSend(v7, "printOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

LABEL_10:
    goto LABEL_11;
  }
  if (-[UIPrintOptionsTableViewController appOptionsSectionNum](self, "appOptionsSectionNum") != a4
    || (-[UIPrintOptionsTableViewController appOptionsSection](self, "appOptionsSection"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        !v11))
  {
    -[UIPrintOptionsTableViewController printOptionSections](self, "printOptionSections");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "count");
    goto LABEL_10;
  }
  v10 = 1;
LABEL_11:

  return v10;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  if (a4)
    goto LABEL_2;
  -[UIPrintOptionsTableViewController printerWarnings](self, "printerWarnings");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if (-[UIPrintOptionsTableViewController showingGatheringPrinterInfo](self, "showingGatheringPrinterInfo"))
      goto LABEL_9;
    goto LABEL_2;
  }
  v9 = (void *)v8;
  -[UIPrintOptionsTableViewController printerWarnings](self, "printerWarnings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "length"))
  {
    v11 = -[UIPrintOptionsTableViewController showingGatheringPrinterInfo](self, "showingGatheringPrinterInfo");

    if (v11)
      goto LABEL_9;
LABEL_2:
    v7 = 0;
    goto LABEL_13;
  }

LABEL_9:
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[UIPrintOptionsTableViewController showingGatheringPrinterInfo](self, "showingGatheringPrinterInfo"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Gathering printer information"), CFSTR("Gathering printer information"), CFSTR("Localizable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMessageText:", v15);

  }
  else
  {
    -[UIPrintOptionsTableViewController printerWarnings](self, "printerWarnings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMessageText:", v14);
  }

  objc_msgSend(v7, "setSpinSpinner:", -[UIPrintOptionsTableViewController showingGatheringPrinterInfo](self, "showingGatheringPrinterInfo"));
LABEL_13:

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
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "row");
  v9 = objc_msgSend(v7, "section");

  if (v9 == 1)
  {
    -[UIPrintOptionsTableViewController moreOptionsSection](self, "moreOptionsSection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!v9)
  {
    -[UIPrintOptionsTableViewController standardOptionsSection](self, "standardOptionsSection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v11 = v10;
    objc_msgSend(v10, "printOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndex:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "printOptionTableViewCell");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (v9 == -[UIPrintOptionsTableViewController appOptionsSectionNum](self, "appOptionsSectionNum")
    && (-[UIPrintOptionsTableViewController appOptionsSection](self, "appOptionsSection"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v15,
        v15))
  {
    -[UIPrintOptionsTableViewController appOptionsSection](self, "appOptionsSection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIPrintOptionsTableViewController printOptionSections](self, "printOptionSections");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndex:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("PrintSectionCell"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 3, CFSTR("PrintSectionCell"));
  objc_msgSend(MEMORY[0x1E0DC39A8], "cellConfiguration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "title");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setText:", v18);

  objc_msgSend(v13, "summaryString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setSecondaryText:", v19);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "secondaryTextProperties");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setColor:", v20);

  objc_msgSend(v14, "setContentConfiguration:", v17);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTintColor:", v22);

  objc_msgSend(v13, "setTableViewCell:", v14);
  objc_msgSend(v14, "setAccessoryType:", 1);
  objc_msgSend(v14, "setSelectionStyle:", 3);

LABEL_13:
  return v14;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIPrintOptionsTableViewController;
  -[UIPrintOptionsTableViewController viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  -[UIPrintOptionsTableViewController printPanelViewController](self, "printPanelViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintOptionsTableViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addPrintShareButtonsToNavItem:", v5);

  -[UIPrintOptionsTableViewController printPanelViewController](self, "printPanelViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintOptionsTableViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addCanelButtonToNavItem:", v7);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIPrintOptionsTableViewController;
  -[UIPrintOptionsTableViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[UIPrintOptionsTableViewController startPrinterWarningPoll](self, "startPrinterWarningPoll");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIPrintOptionsTableViewController;
  -[UIPrintOptionsTableViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[UIPrintOptionsTableViewController stopPrinterWarningPolling](self, "stopPrinterWarningPolling");
}

- (id)printOptionAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (objc_msgSend(v4, "section"))
  {
    if (objc_msgSend(v4, "section") != 1)
    {
      v8 = 0;
      goto LABEL_7;
    }
    -[UIPrintOptionsTableViewController moreOptionsSection](self, "moreOptionsSection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIPrintOptionsTableViewController standardOptionsSection](self, "standardOptionsSection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  objc_msgSend(v5, "printOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v4, "row"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  if (objc_msgSend(v10, "section") > 1)
  {
    v6 = objc_msgSend(v10, "section");
    if (v6 == -[UIPrintOptionsTableViewController appOptionsSectionNum](self, "appOptionsSectionNum")
      && (-[UIPrintOptionsTableViewController appOptionsSection](self, "appOptionsSection"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v7,
          v7))
    {
      -[UIPrintOptionsTableViewController appOptionsSection](self, "appOptionsSection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v8;
    }
    else
    {
      -[UIPrintOptionsTableViewController printOptionSections](self, "printOptionSections");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v10, "row"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v5;
    }
    objc_msgSend(v8, "didSelectPrintOptionSection");
  }
  else
  {
    -[UIPrintOptionsTableViewController printOptionAtIndexPath:](self, "printOptionAtIndexPath:", v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didSelectPrintOption");
  }

}

- (void)showGatheringPrinterInfo
{
  void *v3;
  id v4;

  if (-[UIPrintOptionsTableViewController showingGatheringPrinterInfo](self, "showingGatheringPrinterInfo"))
  {
    -[UIPrintOptionsTableViewController tableView](self, "tableView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_reloadSectionHeaderFooters:withRowAnimation:", v3, 100);

  }
}

- (void)hideGatheringPrinterInfo
{
  void *v3;
  id v4;

  if (!-[UIPrintOptionsTableViewController showingGatheringPrinterInfo](self, "showingGatheringPrinterInfo"))
  {
    -[UIPrintOptionsTableViewController tableView](self, "tableView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_reloadSectionHeaderFooters:withRowAnimation:", v3, 100);

  }
}

- (void)setShowingGatheringPrinterInfo:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t (*v5)(uint64_t);
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E58], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_showGatheringPrinterInfo, 0);
  objc_msgSend(MEMORY[0x1E0C99E58], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_hideGatheringPrinterInfo, 0);
  if (self->_showingGatheringPrinterInfo != v3)
  {
    if (v3)
    {
      self->_showingGatheringPrinterInfo = 1;
      v8 = MEMORY[0x1E0C809B0];
      v5 = __68__UIPrintOptionsTableViewController_setShowingGatheringPrinterInfo___block_invoke;
      v6 = &v8;
    }
    else
    {
      self->_showingGatheringPrinterInfo = 0;
      v7 = MEMORY[0x1E0C809B0];
      v5 = __68__UIPrintOptionsTableViewController_setShowingGatheringPrinterInfo___block_invoke_2;
      v6 = &v7;
    }
    v6[1] = 3221225472;
    v6[2] = (uint64_t)v5;
    v6[3] = (uint64_t)&unk_1E9D96D90;
    v6[4] = (uint64_t)self;
    dispatch_async(MEMORY[0x1E0C80D38], v6);
  }
}

uint64_t __68__UIPrintOptionsTableViewController_setShowingGatheringPrinterInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:afterDelay:", sel_showGatheringPrinterInfo, 0, 1.0);
}

uint64_t __68__UIPrintOptionsTableViewController_setShowingGatheringPrinterInfo___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:", sel_hideGatheringPrinterInfo, 0);
}

- (void)setShowContactingPrinter:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (a3)
  {
    -[UIPrintOptionsTableViewController setPrinterWarnings:](self, "setPrinterWarnings:", 0);
    -[UIPrintOptionsTableViewController stopPrinterWarningPolling](self, "stopPrinterWarningPolling");
  }
  else
  {
    -[UIPrintOptionsTableViewController startPrinterWarningPoll](self, "startPrinterWarningPoll");
  }
  -[UIPrintOptionsTableViewController standardOptionsSection](self, "standardOptionsSection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowContactingPrinter:", v3);

}

- (void)updateWarnings:(id)a3 forPrinter:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD block[5];

  v12 = a3;
  v6 = a4;
  -[UIPrintOptionsTableViewController currentPrinter](self, "currentPrinter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 == v6)
  {
    -[UIPrintOptionsTableViewController printerWarnings](self, "printerWarnings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqual:", v12);

    if ((v9 & 1) == 0)
    {
      -[UIPrintOptionsTableViewController setPrinterWarnings:](self, "setPrinterWarnings:", v12);
      if (!-[UIPrintOptionsTableViewController showingGatheringPrinterInfo](self, "showingGatheringPrinterInfo"))
      {
        if (pthread_main_np() == 1)
        {
          -[UIPrintOptionsTableViewController tableView](self, "tableView");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "_reloadSectionHeaderFooters:withRowAnimation:", v11, 1);

        }
        else
        {
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __63__UIPrintOptionsTableViewController_updateWarnings_forPrinter___block_invoke;
          block[3] = &unk_1E9D96D90;
          block[4] = self;
          dispatch_sync(MEMORY[0x1E0C80D38], block);
        }
      }
    }
  }
  else
  {

  }
}

void __63__UIPrintOptionsTableViewController_updateWarnings_forPrinter___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_reloadSectionHeaderFooters:withRowAnimation:", v1, 1);

}

- (void)startPrinterWarningPoll
{
  void *v3;
  void *v4;
  void *v5;
  UIPrinterAttributesService *printerAttributesService;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  -[UIPrintOptionsTableViewController printerAttributesService](self, "printerAttributesService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    +[UIPrinterAttributesService instance](UIPrinterAttributesService, "instance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintOptionsTableViewController setPrinterAttributesService:](self, "setPrinterAttributesService:", v4);

  }
  objc_initWeak(&location, self);
  -[UIPrintOptionsTableViewController currentPrinter](self, "currentPrinter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  printerAttributesService = self->_printerAttributesService;
  objc_msgSend(v5, "_internalPrinter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__UIPrintOptionsTableViewController_startPrinterWarningPoll__block_invoke;
  v9[3] = &unk_1E9D97BF0;
  objc_copyWeak(&v11, &location);
  v8 = v5;
  v10 = v8;
  -[UIPrinterAttributesService startPollForPrinterWarningStatus:completionHandler:](printerAttributesService, "startPollForPrinterWarningStatus:completionHandler:", v7, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __60__UIPrintOptionsTableViewController_startPrinterWarningPoll__block_invoke(uint64_t a1, int a2, void *a3)
{
  id *v4;
  id v5;
  id WeakRetained;

  if (a2)
  {
    v4 = (id *)(a1 + 40);
    v5 = a3;
    WeakRetained = objc_loadWeakRetained(v4);
    objc_msgSend(WeakRetained, "updateWarnings:forPrinter:", v5, *(_QWORD *)(a1 + 32));

  }
}

- (void)stopPrinterWarningPolling
{
  void *v3;
  id v4;

  -[UIPrintOptionsTableViewController printerAttributesService](self, "printerAttributesService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIPrintOptionsTableViewController printerAttributesService](self, "printerAttributesService");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopPrinterWarningPolling");

  }
}

- (UIPrinter)currentPrinter
{
  return self->_currentPrinter;
}

- (UIPrintAppOptionsProtocol)appOptionsViewController
{
  return self->_appOptionsViewController;
}

- (void)setAppOptionsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_appOptionsViewController, a3);
}

- (BOOL)showingGatheringPrinterInfo
{
  return self->_showingGatheringPrinterInfo;
}

- (UIPrintPanelViewController)printPanelViewController
{
  return (UIPrintPanelViewController *)objc_loadWeakRetained((id *)&self->_printPanelViewController);
}

- (void)setPrintPanelViewController:(id)a3
{
  objc_storeWeak((id *)&self->_printPanelViewController, a3);
}

- (UIPrintInfo)printInfo
{
  return self->_printInfo;
}

- (void)setPrintInfo:(id)a3
{
  objc_storeStrong((id *)&self->_printInfo, a3);
}

- (int64_t)appOptionsSectionNum
{
  return self->_appOptionsSectionNum;
}

- (void)setAppOptionsSectionNum:(int64_t)a3
{
  self->_appOptionsSectionNum = a3;
}

- (int64_t)printOptionsSectionNum
{
  return self->_printOptionsSectionNum;
}

- (void)setPrintOptionsSectionNum:(int64_t)a3
{
  self->_printOptionsSectionNum = a3;
}

- (NSArray)printOptionSections
{
  return self->_printOptionSections;
}

- (void)setPrintOptionSections:(id)a3
{
  objc_storeStrong((id *)&self->_printOptionSections, a3);
}

- (UIPrintStandardOptionsSection)standardOptionsSection
{
  return self->_standardOptionsSection;
}

- (void)setStandardOptionsSection:(id)a3
{
  objc_storeStrong((id *)&self->_standardOptionsSection, a3);
}

- (UIPrintMoreOptionsSection)moreOptionsSection
{
  return self->_moreOptionsSection;
}

- (void)setMoreOptionsSection:(id)a3
{
  objc_storeStrong((id *)&self->_moreOptionsSection, a3);
}

- (UIPrintAppOptionsSection)appOptionsSection
{
  return self->_appOptionsSection;
}

- (void)setAppOptionsSection:(id)a3
{
  objc_storeStrong((id *)&self->_appOptionsSection, a3);
}

- (UIPrintMediaQualitySection)mediaQualitySection
{
  return self->_mediaQualitySection;
}

- (void)setMediaQualitySection:(id)a3
{
  objc_storeStrong((id *)&self->_mediaQualitySection, a3);
}

- (UIPrintLayoutSection)layoutSection
{
  return self->_layoutSection;
}

- (void)setLayoutSection:(id)a3
{
  objc_storeStrong((id *)&self->_layoutSection, a3);
}

- (UIPrintScalingSection)scalingSection
{
  return self->_scalingSection;
}

- (void)setScalingSection:(id)a3
{
  objc_storeStrong((id *)&self->_scalingSection, a3);
}

- (UIPrintFinishingOptionsSection)finishingOptionsSection
{
  return self->_finishingOptionsSection;
}

- (void)setFinishingOptionsSection:(id)a3
{
  objc_storeStrong((id *)&self->_finishingOptionsSection, a3);
}

- (UIPrinterAttributesService)printerAttributesService
{
  return self->_printerAttributesService;
}

- (void)setPrinterAttributesService:(id)a3
{
  objc_storeStrong((id *)&self->_printerAttributesService, a3);
}

- (NSString)printerWarnings
{
  return self->_printerWarnings;
}

- (void)setPrinterWarnings:(id)a3
{
  objc_storeStrong((id *)&self->_printerWarnings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_printerWarnings, 0);
  objc_storeStrong((id *)&self->_printerAttributesService, 0);
  objc_storeStrong((id *)&self->_finishingOptionsSection, 0);
  objc_storeStrong((id *)&self->_scalingSection, 0);
  objc_storeStrong((id *)&self->_layoutSection, 0);
  objc_storeStrong((id *)&self->_mediaQualitySection, 0);
  objc_storeStrong((id *)&self->_appOptionsSection, 0);
  objc_storeStrong((id *)&self->_moreOptionsSection, 0);
  objc_storeStrong((id *)&self->_standardOptionsSection, 0);
  objc_storeStrong((id *)&self->_printOptionSections, 0);
  objc_storeStrong((id *)&self->_printInfo, 0);
  objc_destroyWeak((id *)&self->_printPanelViewController);
  objc_storeStrong((id *)&self->_appOptionsViewController, 0);
  objc_storeStrong((id *)&self->_currentPrinter, 0);
}

@end
