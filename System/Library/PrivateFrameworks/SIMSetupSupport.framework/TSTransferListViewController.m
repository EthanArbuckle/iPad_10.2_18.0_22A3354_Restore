@implementation TSTransferListViewController

- (TSTransferListViewController)initWithPendingInstallItems:(id)a3
{
  uint64_t v4;

  LOBYTE(v4) = 1;
  return -[TSTransferListViewController initWithTransferItems:confirmCellularPlanTransfer:isActivationPolicyMismatch:isDualeSIMCapabilityLoss:pendingInstallItems:carrierSetupItems:showOtherOptions:](self, "initWithTransferItems:confirmCellularPlanTransfer:isActivationPolicyMismatch:isDualeSIMCapabilityLoss:pendingInstallItems:carrierSetupItems:showOtherOptions:", 0, 0, 0, 0, a3, 0, v4);
}

- (TSTransferListViewController)initWithTransferItems:(id)a3 confirmCellularPlanTransfer:(BOOL)a4 isActivationPolicyMismatch:(BOOL)a5 isDualeSIMCapabilityLoss:(BOOL)a6 showOtherOptions:(BOOL)a7
{
  uint64_t v8;

  LOBYTE(v8) = a7;
  return -[TSTransferListViewController initWithTransferItems:confirmCellularPlanTransfer:isActivationPolicyMismatch:isDualeSIMCapabilityLoss:pendingInstallItems:carrierSetupItems:showOtherOptions:](self, "initWithTransferItems:confirmCellularPlanTransfer:isActivationPolicyMismatch:isDualeSIMCapabilityLoss:pendingInstallItems:carrierSetupItems:showOtherOptions:", a3, a4, a5, a6, 0, 0, v8);
}

- (TSTransferListViewController)initWithTransferItems:(id)a3 confirmCellularPlanTransfer:(BOOL)a4 isActivationPolicyMismatch:(BOOL)a5 isDualeSIMCapabilityLoss:(BOOL)a6 pendingInstallItems:(id)a7 carrierSetupItems:(id)a8 showOtherOptions:(BOOL)a9
{
  uint64_t v10;

  LOWORD(v10) = a9;
  return -[TSTransferListViewController initWithTransferItems:confirmCellularPlanTransfer:isActivationPolicyMismatch:isDualeSIMCapabilityLoss:pendingInstallItems:carrierSetupItems:showOtherOptions:isStandaloneProximityFlow:](self, "initWithTransferItems:confirmCellularPlanTransfer:isActivationPolicyMismatch:isDualeSIMCapabilityLoss:pendingInstallItems:carrierSetupItems:showOtherOptions:isStandaloneProximityFlow:", a3, a4, a5, a6, a7, a8, v10);
}

- (TSTransferListViewController)initWithTransferItems:(id)a3 confirmCellularPlanTransfer:(BOOL)a4 isActivationPolicyMismatch:(BOOL)a5 isDualeSIMCapabilityLoss:(BOOL)a6 pendingInstallItems:(id)a7 carrierSetupItems:(id)a8 showOtherOptions:(BOOL)a9 isStandaloneProximityFlow:(BOOL)a10
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  uint64_t v33;
  void *v34;
  BOOL v35;
  TSTransferListViewController *v36;
  BOOL v37;
  uint64_t v38;
  NSMutableArray *chosenUseIndexPaths;
  void *v40;
  void *v41;
  NSArray *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  NSArray *transferItems;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  char v56;
  id obj;
  id v58;
  void *v62;
  id v63;
  objc_super v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  obj = a7;
  v14 = a7;
  v58 = a8;
  v63 = a8;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("SET_UP_CELLULAR"), &stru_24DEF4290, CFSTR("Localizable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v17 = v13;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v66 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("planItem"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v22, "isPhysical"))
          objc_msgSend(v22, "isTransferablePlan");

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
    }
    while (v19);
  }

  v62 = v14;
  if (objc_msgSend(v17, "count"))
  {
    objc_msgSend(v14, "plans");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");

    if (v24)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      v27 = CFSTR("TRANSFER_PLAN_LIST_DETAIL_BOTH");
LABEL_17:
      objc_msgSend(v25, "localizedStringForKey:value:table:", v27, &stru_24DEF4290, CFSTR("Localizable"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 0;
LABEL_21:

      v29 = v16;
      goto LABEL_22;
    }
  }
  v28 = objc_msgSend(v17, "count");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (!v28)
  {
    v27 = CFSTR("TRANSFER_PLAN_LIST_DETAIL_NEW");
    goto LABEL_17;
  }
  objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("MULTI_TRANSFER_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("TRANSFER_PLAN_LIST_DETAIL_TRANSFER"), &stru_24DEF4290, CFSTR("Localizable"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v63, "plans");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v26, "count"))
  {
    v32 = 0;
LABEL_20:
    v16 = v29;
    goto LABEL_21;
  }
  v33 = objc_msgSend(v17, "count");

  if (v33 == 1)
  {
    objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("planItem"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = objc_msgSend(v26, "isPhysical");
    goto LABEL_20;
  }
  v32 = 0;
LABEL_22:
  v35 = a9;
  v64.receiver = self;
  v64.super_class = (Class)TSTransferListViewController;
  v36 = -[OBTableWelcomeController initWithTitle:detailText:symbolName:adoptTableViewScrollView:](&v64, sel_initWithTitle_detailText_symbolName_adoptTableViewScrollView_, v29, v31, CFSTR("antenna.radiowaves.left.and.right"), 1);
  if (v36)
  {
    v37 = a10;
    v36->_inBuddy = +[TSUtilities inBuddy](TSUtilities, "inBuddy");
    v38 = objc_opt_new();
    chosenUseIndexPaths = v36->_chosenUseIndexPaths;
    v36->_chosenUseIndexPaths = (NSMutableArray *)v38;

    if (objc_msgSend(v17, "count"))
    {
      v56 = v32;
      v40 = (void *)MEMORY[0x24BDBCEB8];
      objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "arrayWithObjects:", v41, 0);
      v42 = (NSArray *)objc_claimAutoreleasedReturnValue();

      if ((unint64_t)objc_msgSend(v17, "count") >= 2)
      {
        v43 = 1;
        while (1)
        {
          objc_msgSend(v17, "objectAtIndexedSubscript:", v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("planItem"));
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v45, "phoneNumber");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v46, "length"))
            break;
          v47 = objc_msgSend(v45, "isTransferIneligiblePlan");

          if ((v47 & 1) != 0)
            goto LABEL_30;
          objc_msgSend(v17, "objectAtIndexedSubscript:", v43);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray insertObject:atIndex:](v42, "insertObject:atIndex:", v48, 0);
LABEL_31:

          if (objc_msgSend(v17, "count") <= (unint64_t)++v43)
            goto LABEL_32;
        }

LABEL_30:
        objc_msgSend(v17, "objectAtIndexedSubscript:", v43);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v42, "addObject:", v48);
        goto LABEL_31;
      }
LABEL_32:
      transferItems = v36->_transferItems;
      v36->_transferItems = v42;

      v32 = v56;
      v35 = a9;
      v37 = a10;
    }
    objc_storeStrong((id *)&v36->_pendingInstallItems, obj);
    objc_storeStrong((id *)&v36->_carrierSetupItems, v58);
    v36->_receivedPendingInstallItems = 1;
    v36->_receivedTransferItems = 1;
    v36->_continueButtonTappedOnce = 0;
    v36->_confirmCellularPlanTransfer = a4;
    v36->_isActivationPolicyMismatch = a5;
    v36->_isDualeSIMCapabilityLoss = a6;
    v36->_isSinglePhysicalSIMTransfer = v32;
    -[CTDisplayPlanList plans](v36->_pendingInstallItems, "plans");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "count");
    -[CTDisplayPlanList plans](v36->_carrierSetupItems, "plans");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v36->_numNonRemotePlanItems = objc_msgSend(v52, "count") + v51;

    v36->_installingTransferPlan = 0;
    v36->_isStandaloneProximityFlow = v37;
    v36->_backToSelfOption = 0;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "addObserver:selector:name:object:", v36, sel__transferConsentOnSource, CFSTR("transfer.consent.on.source"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "addObserver:selector:name:object:", v36, sel__cancelTransferringPlan, CFSTR("ss.user.canceled"), 0);

  }
  v36->_showOtherOptions = v35;

  return v36;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  SSOBBoldTrayButton *v7;
  SSOBBoldTrayButton *continueButton;
  SSOBBoldTrayButton *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  id v15;
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
  NSLayoutConstraint *v30;
  NSLayoutConstraint *tableHeightAnchor;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *WeakRetained;
  void *v40;
  objc_super v41;

  v41.receiver = self;
  v41.super_class = (Class)TSTransferListViewController;
  -[TSOBTableWelcomeController viewDidLoad](&v41, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__updateTrayButtonText_, CFSTR("esim.install.state.changed"), 0);

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSTransferListViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v4);

  +[OBBoldTrayButton boldButton](SSOBBoldTrayButton, "boldButton");
  v7 = (SSOBBoldTrayButton *)objc_claimAutoreleasedReturnValue();
  continueButton = self->_continueButton;
  self->_continueButton = v7;

  -[SSOBBoldTrayButton addTarget:action:forControlEvents:](self->_continueButton, "addTarget:action:forControlEvents:", self, sel__continueButtonTapped, 64);
  LODWORD(v6) = self->_isSinglePhysicalSIMTransfer;
  v9 = self->_continueButton;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((_DWORD)v6)
    v12 = CFSTR("CONVERT_TO_ESIM");
  else
    v12 = CFSTR("CONTINUE");
  objc_msgSend(v10, "localizedStringForKey:value:table:", v12, &stru_24DEF4290, CFSTR("Localizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSOBBoldTrayButton setTitle:forState:](v9, "setTitle:forState:", v13, 0);

  -[OBBoldTrayButton setEnabled:](self->_continueButton, "setEnabled:", 0);
  -[TSTransferListViewController buttonTray](self, "buttonTray");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addButton:", self->_continueButton);

  v15 = objc_alloc(MEMORY[0x24BEBD9F0]);
  v16 = (void *)objc_msgSend(v15, "initWithFrame:style:", 2, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[OBTableWelcomeController setTableView:](self, "setTableView:", v16);

  -[OBTableWelcomeController tableView](self, "tableView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[OBTableWelcomeController tableView](self, "tableView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setRowHeight:", *MEMORY[0x24BEBE770]);

  -[OBTableWelcomeController tableView](self, "tableView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setEstimatedRowHeight:", 1.0);

  -[OBTableWelcomeController tableView](self, "tableView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAllowsMultipleSelection:", 0);

  -[OBTableWelcomeController tableView](self, "tableView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setScrollEnabled:", 1);

  -[OBTableWelcomeController tableView](self, "tableView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setShowsVerticalScrollIndicator:", 0);

  -[OBTableWelcomeController tableView](self, "tableView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setBackgroundColor:", v24);

  -[OBTableWelcomeController tableView](self, "tableView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setDataSource:", self);

  -[OBTableWelcomeController tableView](self, "tableView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setDelegate:", self);

  -[OBTableWelcomeController tableView](self, "tableView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "reloadData");

  -[OBTableWelcomeController tableView](self, "tableView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "heightAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSTransferListViewController _heightAnchorConstant](self, "_heightAnchorConstant");
  objc_msgSend(v29, "constraintEqualToConstant:");
  v30 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  tableHeightAnchor = self->_tableHeightAnchor;
  self->_tableHeightAnchor = v30;

  -[NSLayoutConstraint setActive:](self->_tableHeightAnchor, "setActive:", 1);
  if (!self->_inBuddy && self->_showOtherOptions)
  {
    objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("OTHER_OPTIONS"), &stru_24DEF4290, CFSTR("Localizable"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setTitle:forState:", v34, 0);

    objc_msgSend(v32, "addTarget:action:forControlEvents:", self, sel__otherButtonTapped, 64);
    -[TSTransferListViewController buttonTray](self, "buttonTray");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addButton:", v32);

  }
  -[TSTransferListViewController updateFooterView](self, "updateFooterView");
  if (!+[TSUtilities inBuddy](TSUtilities, "inBuddy"))
  {
    -[TSTransferListViewController navigationController](self, "navigationController");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "navigationBar");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setBackgroundColor:", v38);

  }
  if (+[TSUtilities inBuddy](TSUtilities, "inBuddy"))
  {
    -[TSTransferListViewController navigationController](self, "navigationController");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "navigationItem");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setHidesBackButton:", 0);

LABEL_14:
    return;
  }
  if (!+[TSUtilities inBuddy](TSUtilities, "inBuddy") || self->_isStandaloneProximityFlow)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "setDefaultNavigationItems:", self);
    goto LABEL_14;
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  SSOBBoldTrayButton *continueButton;
  _BOOL8 continueButtonTappedOnce;
  void *v6;
  void *v7;
  BOOL v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSTransferListViewController;
  -[OBTableWelcomeController viewWillAppear:](&v9, sel_viewWillAppear_, a3);
  if (self->_inBuddy)
  {
    -[OBBoldTrayButton setEnabled:](self->_continueButton, "setEnabled:", self->_continueButtonTappedOnce);
    continueButton = self->_continueButton;
    continueButtonTappedOnce = self->_continueButtonTappedOnce;
LABEL_3:
    -[SSOBBoldTrayButton setUserInteractionEnabled:](continueButton, "setUserInteractionEnabled:", continueButtonTappedOnce);
    return;
  }
  -[OBTableWelcomeController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathsForSelectedRows");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "count"))
  {

    return;
  }
  v8 = -[TSTransferListViewController customizeSpinner](self, "customizeSpinner");

  if (!v8)
  {
    -[OBBoldTrayButton setEnabled:](self->_continueButton, "setEnabled:", 1);
    continueButton = self->_continueButton;
    continueButtonTappedOnce = 1;
    goto LABEL_3;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSTransferListViewController;
  -[OBBaseWelcomeController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  self->_isOtherButtonTapped = 0;
  self->_requireDelayBluetoothConnection = 0;
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSTransferListViewController;
  -[TSTransferListViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[TSTransferListViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "receivedResponse");

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  objc_super v4;

  -[TSTransferListViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

  v4.receiver = self;
  v4.super_class = (Class)TSTransferListViewController;
  -[OBTableWelcomeController viewDidLayoutSubviews](&v4, sel_viewDidLayoutSubviews);
}

- (void)updateFooterView
{
  id v3;
  UITableViewCell *v4;
  UITableViewCell *sectionFooter;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  if (self->_isActivationPolicyMismatch)
  {
    v3 = objc_alloc(MEMORY[0x24BEBD9F8]);
    v4 = (UITableViewCell *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    sectionFooter = self->_sectionFooter;
    self->_sectionFooter = v4;

    -[UITableViewCell textLabel](self->_sectionFooter, "textLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1E0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFont:", v7);

    -[UITableViewCell textLabel](self->_sectionFooter, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLineBreakMode:", 0);

    -[UITableViewCell textLabel](self->_sectionFooter, "textLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNumberOfLines:", 0);

    -[UITableViewCell textLabel](self->_sectionFooter, "textLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("TRANSFER_PLAN_LABELS_SECTION_FOOTER_CARRIER_UNLOCK"), &stru_24DEF4290, CFSTR("Localizable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v12);

    -[UITableViewCell textLabel](self->_sectionFooter, "textLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTextAlignment:", 1);

    -[UITableViewCell textLabel](self->_sectionFooter, "textLabel");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTextColor:", v14);

  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return self->_sectionFooter;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  UITableViewCell *sectionFooter;
  void *v5;
  double v6;
  double v7;
  double v8;

  sectionFooter = self->_sectionFooter;
  -[OBTableWelcomeController tableView](self, "tableView", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  -[UITableViewCell sizeThatFits:](sectionFooter, "sizeThatFits:", v6, 1.79769313e308);
  v8 = v7;

  return v8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return self->_numNonRemotePlanItems + -[NSArray count](self->_transferItems, "count", a3, a4);
}

- (id)getRemoteDeviceDisplayName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a3;
  objc_msgSend(v3, "modelName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4 || !objc_msgSend(v4, "length"))
  {
    objc_msgSend(v3, "deviceName");
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  TSCellularPlanItemCell *v6;
  void *v7;
  void *v8;
  int v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  unint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  TSCellularPlanItemCell *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  unint64_t v45;
  unint64_t v46;
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
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  unint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  unint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  TSCellularPlanItemCell *v78;
  void *v80;
  void *v81;
  unint64_t v82;
  void *v83;
  void *v84;
  void *v85;

  v5 = a4;
  v6 = -[TSCellularPlanItemCell initWithStyle:reuseIdentifier:]([TSCellularPlanItemCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("device"));
  -[TSCellularPlanItemCell setSelectedBackgroundView:](v6, "setSelectedBackgroundView:", 0);
  -[TSCellularPlanItemCell setSelectionStyle:](v6, "setSelectionStyle:", 0);
  -[OBTableWelcomeController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexPathsForSelectedRows");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v5);

  if (v9)
    -[TSCellularPlanItemCell setAccessoryType:](v6, "setAccessoryType:", 3);
  if (-[NSMutableArray containsObject:](self->_chosenUseIndexPaths, "containsObject:", v5))
  {
    -[TSCellularPlanItemCell setAccessoryType:](v6, "setAccessoryType:", 3);
    -[TSCellularPlanItemCell setDisable](v6, "setDisable");
  }
  v10 = objc_msgSend(v5, "row");
  -[CTDisplayPlanList plans](self->_pendingInstallItems, "plans");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  -[CTDisplayPlanList plans](self->_pendingInstallItems, "plans");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10 < v12)
  {
    objc_msgSend(v13, "objectAtIndexedSubscript:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[TSCellularPlanItemCell setIcon:](v6, "setIcon:", objc_msgSend(v15, "isPhysical"));
    objc_msgSend(v15, "carrierName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v15, "carrierName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[TSCellularPlanItemCell title](v6, "title");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setText:", v17);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("NEW_CELLULAR_PLAN_NO_CARRIER_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[TSCellularPlanItemCell title](v6, "title");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setText:", v18);

    }
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    v28 = CFSTR("ESIM");
    goto LABEL_14;
  }
  v19 = v10 - objc_msgSend(v13, "count");

  -[CTDisplayPlanList plans](self->_carrierSetupItems, "plans");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  -[CTDisplayPlanList plans](self->_carrierSetupItems, "plans");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v19 < v21)
  {
    objc_msgSend(v22, "objectAtIndexedSubscript:", v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[TSCellularPlanItemCell setIcon:](v6, "setIcon:", objc_msgSend(v15, "isPhysical"));
    objc_msgSend(v15, "carrierName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularPlanItemCell title](v6, "title");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setText:", v24);

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    v28 = CFSTR("CELLULAR_PLAN_DETAIL");
LABEL_14:
    objc_msgSend(v26, "localizedStringForKey:value:table:", v28, &stru_24DEF4290, CFSTR("Localizable"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularPlanItemCell planInfo](v6, "planInfo");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setText:", v35);

    v37 = v6;
    goto LABEL_39;
  }
  v29 = v19 - objc_msgSend(v22, "count");

  -[NSArray objectAtIndex:](self->_transferItems, "objectAtIndex:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("planItem"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "phoneNumber");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[TSUtilities formattedPhoneNumber:withCountryCode:](TSUtilities, "formattedPhoneNumber:withCountryCode:", v31, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  -[TSCellularPlanItemCell setIcon:](v6, "setIcon:", objc_msgSend(v15, "isPhysical"));
  v85 = v32;
  if (objc_msgSend(v32, "length"))
  {
    -[TSCellularPlanItemCell title](v6, "title");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setText:", v32);
  }
  else
  {
    objc_msgSend(v15, "carrierName");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v33, "length"))
    {
      -[TSCellularPlanItemCell title](v6, "title");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setText:", v33);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("TRANSFER_PLAN_ITEM_TITLE_NO_PHONENUMBER"), &stru_24DEF4290, CFSTR("Localizable"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[TSCellularPlanItemCell title](v6, "title");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setText:", v39);

    }
  }

  -[NSArray objectAtIndex:](self->_transferItems, "objectAtIndex:", v29);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("deviceInfo"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSTransferListViewController getRemoteDeviceDisplayName:](self, "getRemoteDeviceDisplayName:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "label");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v15, "transferCapability");
  v46 = v45;
  if (v45 <= 0xE)
  {
    if (((1 << v45) & 0x7F17) != 0)
    {
      if (objc_msgSend(v43, "length") && objc_msgSend(v44, "length"))
      {
        v47 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR("TRANSFER_PLAN_ITEM_DETAIL_WITH_LABEL_%@_%@"), &stru_24DEF4290, CFSTR("Localizable"));
        v82 = v46;
        v49 = v44;
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "stringWithFormat:", v50, v49, v43);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[TSCellularPlanItemCell planInfo](v6, "planInfo");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "setText:", v51);

        v44 = v49;
        v46 = v82;
      }
      else
      {
        if (objc_msgSend(v43, "length"))
        {
          v53 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "localizedStringForKey:value:table:", CFSTR("TRANSFER_PLAN_ITEM_DETAIL_%@"), &stru_24DEF4290, CFSTR("Localizable"));
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "stringWithFormat:", v54, v43);
        }
        else
        {
          if (!objc_msgSend(v44, "length"))
          {
            objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR("TRANSFER_PLAN_ITEM_DETAIL_NO_DEVICE_NAME"), &stru_24DEF4290, CFSTR("Localizable"));
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            -[TSCellularPlanItemCell planInfo](v6, "planInfo");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "setText:", v80);

            goto LABEL_30;
          }
          v59 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "localizedStringForKey:value:table:", CFSTR("TRANSFER_PLAN_ITEM_DETAIL_WITH_LABEL_NO_DEVICE_NAME_%@"), &stru_24DEF4290, CFSTR("Localizable"));
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "stringWithFormat:", v54, v44);
        }
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        -[TSCellularPlanItemCell planInfo](v6, "planInfo");
        v61 = v43;
        v62 = v46;
        v63 = v44;
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "setText:", v60);

        v44 = v63;
        v46 = v62;
        v43 = v61;
        v48 = v83;

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "localizedStringForKey:value:table:", CFSTR("TRANSFER_PLAN_ITEM_DETAIL_ALREADY_TRANSFERRED"), &stru_24DEF4290, CFSTR("Localizable"));
      v56 = v44;
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[TSCellularPlanItemCell planInfo](v6, "planInfo");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "setText:", v57);

      v44 = v56;
      -[TSCellularPlanItemCell setAccessoryType:](v6, "setAccessoryType:", 3);
      objc_msgSend(MEMORY[0x24BEBD4B8], "grayColor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[TSCellularPlanItemCell setTintColor:](v6, "setTintColor:", v48);
    }
LABEL_30:

  }
  if (+[TSUtilities isPad](TSUtilities, "isPad"))
  {
    objc_msgSend(v15, "carrierName");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularPlanItemCell title](v6, "title");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setText:", v65);

    -[TSCellularPlanItemCell planInfo](v6, "planInfo");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setText:", 0);

    if (objc_msgSend(v43, "length"))
    {
      v68 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "localizedStringForKey:value:table:", CFSTR("USED_ON_%@"), &stru_24DEF4290, CFSTR("Localizable"));
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "stringWithFormat:", v69, v43);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      -[TSCellularPlanItemCell planInfo](v6, "planInfo");
      v71 = v43;
      v72 = v46;
      v73 = v44;
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "setText:", v70);

      v44 = v73;
      v46 = v72;
      v43 = v71;

    }
  }
  if ((objc_msgSend(v15, "isTransferIneligiblePlan") & 1) != 0 || v46 == 8 && self->_inBuddy)
  {
    -[TSCellularPlanItemCell setDisable](v6, "setDisable");
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "localizedStringForKey:value:table:", CFSTR("TRANSFER_PLAN_ITEM_DETAIL_NOT_SUPPORTED"), &stru_24DEF4290, CFSTR("Localizable"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularPlanItemCell planInfo](v6, "planInfo");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "setText:", v76);

  }
  v78 = v6;

LABEL_39:
  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  SSOBBoldTrayButton *continueButton;
  id v7;
  id v8;
  id v9;

  continueButton = self->_continueButton;
  v7 = a4;
  v8 = a3;
  -[OBBoldTrayButton setEnabled:](continueButton, "setEnabled:", 1);
  -[SSOBBoldTrayButton setUserInteractionEnabled:](self->_continueButton, "setUserInteractionEnabled:", 1);
  objc_msgSend(v8, "cellForRowAtIndexPath:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setAccessoryType:", 3);
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(v10, "indexPathsForSelectedRows");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (!v8)
  {
    -[OBBoldTrayButton setEnabled:](self->_continueButton, "setEnabled:", 0);
    -[SSOBBoldTrayButton setUserInteractionEnabled:](self->_continueButton, "setUserInteractionEnabled:", 0);
  }
  objc_msgSend(v10, "cellForRowAtIndexPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessoryType:", 0);

}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  unint64_t v6;
  unint64_t numNonRemotePlanItems;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v5 = a4;
  v6 = objc_msgSend(v5, "row");
  numNonRemotePlanItems = self->_numNonRemotePlanItems;
  if (v6 < numNonRemotePlanItems)
    goto LABEL_4;
  -[NSArray objectAtIndex:](self->_transferItems, "objectAtIndex:", v6 - numNonRemotePlanItems);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("planItem"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "plan");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "transferAttributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "transferCapability");

  if ((unint64_t)(v12 - 3) >= 5)
    goto LABEL_4;
  if (((0x1Du >> (v12 - 3)) & 1) != 0)
    v13 = 0;
  else
LABEL_4:
    v13 = v5;

  return v13;
}

- (double)_heightAnchorConstant
{
  void *v2;
  double v3;
  double v4;

  -[TSTransferListViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3 * 0.42;

  return v4;
}

- (void)_otherButtonTapped
{
  void *v3;
  id v4;
  _BOOL8 inBuddy;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;

  +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BDC27B8]);
  inBuddy = self->_inBuddy;
  v6 = +[TSUtilities transferablePlans:](TSUtilities, "transferablePlans:", self->_transferItems);
  -[CTDisplayPlanList plans](self->_pendingInstallItems, "plans");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithInBuddy:transferablePlans:selectedTransferablePlans:alsPlans:selectedAlsPlans:odaPlans:", inBuddy, v6, 0, objc_msgSend(v7, "count"), 0, +[TSUtilities odaPlans:](TSUtilities, "odaPlans:", self->_transferItems));
  objc_msgSend(v3, "submitSimSetupUsage:", v8);

  self->_isOtherButtonTapped = 1;
  -[TSTransferListViewController delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewControllerDidComplete:", self);

}

- (id)_calculatePlanSelection
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v25 = +[TSUtilities transferablePlans:](TSUtilities, "transferablePlans:", self->_transferItems);
  -[CTDisplayPlanList plans](self->_pendingInstallItems, "plans");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v3, "count");

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[OBTableWelcomeController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathsForSelectedRows");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v26 = 0;
    v9 = *(_QWORD *)v30;
    do
    {
      v10 = 0;
      v27 = v7;
      do
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v10);
        -[NSMutableArray addObject:](self->_chosenUseIndexPaths, "addObject:", v11, v24);
        v12 = objc_msgSend(v11, "row");
        -[CTDisplayPlanList plans](self->_pendingInstallItems, "plans");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count");

        if (v12 >= v14)
        {
          -[CTDisplayPlanList plans](self->_pendingInstallItems, "plans");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v12 - objc_msgSend(v15, "count");

          -[CTDisplayPlanList plans](self->_carrierSetupItems, "plans");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "count");

          if (v16 >= v18)
          {
            -[CTDisplayPlanList plans](self->_carrierSetupItems, "plans");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v16 - objc_msgSend(v19, "count");

            -[NSArray objectAtIndex:](self->_transferItems, "objectAtIndex:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("planItem"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            v26 += objc_msgSend(v22, "isTransferablePlan");
          }
          v7 = v27;
        }
        else
        {
          ++v8;
        }
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
    v26 = 0;
  }

  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDC27B8]), "initWithInBuddy:transferablePlans:selectedTransferablePlans:alsPlans:selectedAlsPlans:odaPlans:", self->_inBuddy, v25, v26, v24, v8, +[TSUtilities odaPlans:](TSUtilities, "odaPlans:", self->_transferItems));
}

- (void)_continueButtonTapped
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  _QWORD v30[5];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  const char *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  _TSLogDomain();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[OBTableWelcomeController tableView](self, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "indexPathsForSelectedRows");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v37 = v5;
    v38 = 2080;
    v39 = "-[TSTransferListViewController _continueButtonTapped]";
    _os_log_impl(&dword_21B647000, v3, OS_LOG_TYPE_DEFAULT, "selected item row: %@ @%s", buf, 0x16u);

  }
  if (!self->_continueButtonTappedOnce)
  {
    +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSTransferListViewController _calculatePlanSelection](self, "_calculatePlanSelection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "submitSimSetupUsage:", v7);

    self->_continueButtonTappedOnce = 1;
    if (self->_isDualeSIMCapabilityLoss)
    {
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      -[OBTableWelcomeController tableView](self, "tableView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "indexPathsForSelectedRows");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v32;
        while (2)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v32 != v12)
              objc_enumerationMutation(v9);
            if (objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "row") >= self->_numNonRemotePlanItems)
            {

              v14 = (void *)MEMORY[0x24BEBD3B0];
              objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("DUAL_ESIM_LOSS_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("DUAL_ESIM_LOSS_MESSAGE"), &stru_24DEF4290, CFSTR("Localizable"));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "alertControllerWithTitle:message:preferredStyle:", v16, v18, 1);
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              v20 = (void *)MEMORY[0x24BEBD3A8];
              objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24DEF4290, CFSTR("Localizable"));
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = MEMORY[0x24BDAC760];
              v30[0] = MEMORY[0x24BDAC760];
              v30[1] = 3221225472;
              v30[2] = __53__TSTransferListViewController__continueButtonTapped__block_invoke;
              v30[3] = &unk_24DEF2F40;
              v30[4] = self;
              objc_msgSend(v20, "actionWithTitle:style:handler:", v22, 1, v30);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "addAction:", v24);

              v25 = (void *)MEMORY[0x24BEBD3A8];
              objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_24DEF4290, CFSTR("Localizable"));
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v29[0] = v23;
              v29[1] = 3221225472;
              v29[2] = __53__TSTransferListViewController__continueButtonTapped__block_invoke_2;
              v29[3] = &unk_24DEF2F40;
              v29[4] = self;
              objc_msgSend(v25, "actionWithTitle:style:handler:", v27, 0, v29);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "addAction:", v28);

              -[TSTransferListViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v19, 1, 0);
              return;
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
          if (v11)
            continue;
          break;
        }
      }

    }
    -[TSTransferListViewController _installSelectedPlans](self, "_installSelectedPlans");
  }
}

void __53__TSTransferListViewController__continueButtonTapped__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "userDidTapCancel");

}

uint64_t __53__TSTransferListViewController__continueButtonTapped__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_installSelectedPlans");
}

- (void)_installSelectedPlans
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  NSString *v15;
  NSString *carrierNameForSelectedItem;
  void *v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  _BOOL4 v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSString *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  void *v42;
  void *v43;
  char v44;
  BOOL confirmCellularPlanTransfer;
  _BOOL8 speedBumper;
  __int128 v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id obj;
  _QWORD v53[5];
  id v54;
  id v55;
  id v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t v66[128];
  uint8_t buf[4];
  const char *v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v48 = (void *)objc_opt_new();
  v51 = (void *)objc_opt_new();
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  -[OBTableWelcomeController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForSelectedRows");
  obj = (id)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
  if (v4)
  {
    v49 = 0;
    v50 = 0;
    v6 = *(_QWORD *)v63;
    *(_QWORD *)&v5 = 136315138;
    v47 = v5;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v63 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
        -[NSMutableArray addObject:](self->_chosenUseIndexPaths, "addObject:", v8, v47);
        v9 = objc_msgSend(v8, "row");
        -[CTDisplayPlanList plans](self->_pendingInstallItems, "plans");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v9 < objc_msgSend(v10, "count");

        -[CTDisplayPlanList plans](self->_pendingInstallItems, "plans");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v11)
        {
          objc_msgSend(v12, "objectAtIndexedSubscript:", v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "carrierName");
          v15 = (NSString *)objc_claimAutoreleasedReturnValue();
          carrierNameForSelectedItem = self->_carrierNameForSelectedItem;
          self->_carrierNameForSelectedItem = v15;

          objc_msgSend(v14, "plan");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "addObject:", v17);

        }
        else
        {
          v18 = objc_msgSend(v12, "count");

          -[CTDisplayPlanList plans](self->_carrierSetupItems, "plans");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v9 - v18;
          v21 = v9 - v18 < objc_msgSend(v19, "count");

          if (v21)
          {
            _TSLogDomain();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v47;
              v68 = "-[TSTransferListViewController _installSelectedPlans]";
              _os_log_impl(&dword_21B647000, v22, OS_LOG_TYPE_DEFAULT, "selected carrier setup item @%s", buf, 0xCu);
            }

            self->_isCarrierSetupItemSelected = 1;
          }
          else
          {
            -[CTDisplayPlanList plans](self->_carrierSetupItems, "plans");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "count");

            v25 = v20 - v24;
            -[NSArray objectAtIndex:](self->_transferItems, "objectAtIndex:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("planItem"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            -[NSArray objectAtIndex:](self->_transferItems, "objectAtIndex:", v25);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("deviceInfo"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "deviceID");
            v30 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v27, "plan");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "addObject:", v31);

            objc_msgSend(v27, "phoneNumber");
            v32 = objc_claimAutoreleasedReturnValue();

            v49 = (void *)v32;
            v50 = (void *)v30;
          }
        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
    }
    while (v4);
  }
  else
  {
    v49 = 0;
    v50 = 0;
  }

  if ((unint64_t)objc_msgSend(v51, "count") >= 2)
  {
    v33 = self->_carrierNameForSelectedItem;
    self->_carrierNameForSelectedItem = 0;

  }
  v34 = objc_msgSend(v48, "count");
  v35 = objc_msgSend(v51, "count");
  -[CTDisplayPlanList plans](self->_carrierSetupItems, "plans");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v35) = v35 + v34 + objc_msgSend(v36, "count") == 0;

  if ((v35 & 1) == 0)
  {
    -[OBTableWelcomeController tableView](self, "tableView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setUserInteractionEnabled:", 0);

    -[OBBoldTrayButton setEnabled:](self->_continueButton, "setEnabled:", 0);
    -[SSOBBoldTrayButton setUserInteractionEnabled:](self->_continueButton, "setUserInteractionEnabled:", 0);
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v38 = v48;
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
    if (v39)
    {
      v40 = *(_QWORD *)v59;
      while (2)
      {
        for (j = 0; j != v39; ++j)
        {
          if (*(_QWORD *)v59 != v40)
            objc_enumerationMutation(v38);
          v42 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v42, "transferAttributes");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = objc_msgSend(v43, "isSecuredFlow");
            confirmCellularPlanTransfer = 1;
            if ((v44 & 1) == 0)
              confirmCellularPlanTransfer = self->_confirmCellularPlanTransfer;
            self->_followDirections = confirmCellularPlanTransfer;
            self->_speedBumper = 1;

            goto LABEL_32;
          }
        }
        v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
        if (v39)
          continue;
        break;
      }
    }
LABEL_32:

    objc_initWeak((id *)buf, self);
    speedBumper = self->_speedBumper;
    v53[0] = MEMORY[0x24BDAC760];
    v53[1] = 3221225472;
    v53[2] = __53__TSTransferListViewController__installSelectedPlans__block_invoke;
    v53[3] = &unk_24DEF3120;
    v53[4] = self;
    v54 = v38;
    v55 = v51;
    objc_copyWeak(&v57, (id *)buf);
    v56 = v50;
    -[TSTransferListViewController _maybeDisplayPhysicalPlanConversionAlert:phoneNumber:completion:](self, "_maybeDisplayPhysicalPlanConversionAlert:phoneNumber:completion:", speedBumper, v49, v53);

    objc_destroyWeak(&v57);
    objc_destroyWeak((id *)buf);
  }

}

void __53__TSTransferListViewController__installSelectedPlans__block_invoke(uint64_t a1, char a2)
{
  _QWORD *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = *(id *)(a1 + 32);
  if (v4)
  {
    if ((a2 & 1) != 0)
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2788]), "initWithPlans:", *(_QWORD *)(a1 + 40));
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2788]), "initWithPlans:", *(_QWORD *)(a1 + 48));
      if (objc_msgSend(*(id *)(a1 + 40), "count"))
      {
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
        objc_msgSend(WeakRetained, "_startPlanTransfer:withDeviceID:", v5, *(_QWORD *)(a1 + 56));

      }
      if (objc_msgSend(*(id *)(a1 + 48), "count"))
        objc_msgSend(v4, "_startPendingInstall:", v6);
      v8 = (void *)v4[158];
      if (v8)
      {
        objc_msgSend(v8, "plans");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "count");

        if (v10)
          objc_msgSend(v4, "_dismissSelf");
      }

    }
    else
    {
      _TSLogDomain();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136315138;
        v13 = "-[TSTransferListViewController _installSelectedPlans]_block_invoke";
        _os_log_impl(&dword_21B647000, v11, OS_LOG_TYPE_DEFAULT, "transfer is canceled by user @%s", (uint8_t *)&v12, 0xCu);
      }

      objc_msgSend(v4, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "userDidTapCancel");
    }

  }
}

- (void)_maybeDisplayConsent:(BOOL)a3 phoneNumber:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _BOOL4 confirmCellularPlanTransfer;
  _BOOL4 v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t (*__ptr32 *v36)();
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  void *v43;
  _QWORD block[5];
  id v45;
  id v46;
  _QWORD v47[5];
  _QWORD v48[6];

  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (!a3)
  {
    (*((void (**)(id))v9 + 2))(v9);
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("TRANSFER_TARGET_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[TSUtilities formattedPhoneNumber:withCountryCode:](TSUtilities, "formattedPhoneNumber:withCountryCode:", v8, 0);
  v13 = objc_claimAutoreleasedReturnValue();

  confirmCellularPlanTransfer = self->_confirmCellularPlanTransfer;
  v15 = +[TSUtilities isPad](TSUtilities, "isPad");
  v42 = (void *)v13;
  if (!confirmCellularPlanTransfer)
  {
    if (v15)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      v18 = CFSTR("TRANSFER_REQUEST_CONFIRMATION");
      goto LABEL_8;
    }
    v22 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("TRANSFER_REQUEST_CONFIRMATION_%@"), &stru_24DEF4290, CFSTR("Localizable"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", v21, v13, v41);
LABEL_11:
    v19 = objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  if (!v15)
  {
    v20 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("TRANSFER_REQUEST_CONFIRMATION_CLOUD_%@_%@"), &stru_24DEF4290, CFSTR("Localizable"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", v21, v13, v13);
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  v18 = CFSTR("TRANSFER_REQUEST_CONFIRMATION_CLOUD");
LABEL_8:
  objc_msgSend(v16, "localizedStringForKey:value:table:", v18, &stru_24DEF4290, CFSTR("Localizable"));
  v19 = objc_claimAutoreleasedReturnValue();
LABEL_12:

  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v12, v19, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = self->_confirmCellularPlanTransfer;
  v25 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  v43 = (void *)v19;
  if (v24)
  {
    v28 = MEMORY[0x24BDAC760];
    objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24DEF4290, CFSTR("Localizable"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v28;
    v48[1] = 3221225472;
    v48[2] = __76__TSTransferListViewController__maybeDisplayConsent_phoneNumber_completion___block_invoke;
    v48[3] = &unk_24DEF2F40;
    v48[4] = self;
    objc_msgSend(v25, "actionWithTitle:style:handler:", v29, 1, v48);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addAction:", v30);

    v31 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("OTHER_OPTIONS"), &stru_24DEF4290, CFSTR("Localizable"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = MEMORY[0x24BDAC760];
    v47[0] = MEMORY[0x24BDAC760];
    v47[1] = 3221225472;
    v47[2] = __76__TSTransferListViewController__maybeDisplayConsent_phoneNumber_completion___block_invoke_116;
    v47[3] = &unk_24DEF2F40;
    v47[4] = self;
    objc_msgSend(v31, "actionWithTitle:style:handler:", v33, 0, v47);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addAction:", v35);

    v36 = &off_21B6BD000;
    v8 = v42;
    v37 = v34;
  }
  else
  {
    v36 = &off_21B6BD000;
    objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24DEF4290, CFSTR("Localizable"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "actionWithTitle:style:handler:", v38, 0, &__block_literal_global_4);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addAction:", v39);

    v8 = v42;
    v37 = MEMORY[0x24BDAC760];
  }
  block[0] = v37;
  block[1] = *((_QWORD *)v36 + 55);
  block[2] = __76__TSTransferListViewController__maybeDisplayConsent_phoneNumber_completion___block_invoke_2;
  block[3] = &unk_24DEF2D10;
  block[4] = self;
  v45 = v23;
  v46 = v10;
  v40 = v23;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

LABEL_16:
}

void __76__TSTransferListViewController__maybeDisplayConsent_phoneNumber_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  _TSLogDomain();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[TSTransferListViewController _maybeDisplayConsent:phoneNumber:completion:]_block_invoke";
    _os_log_impl(&dword_21B647000, v2, OS_LOG_TYPE_DEFAULT, "cancel transfer. start over @%s", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_cancelTransferringPlan");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userDidTapCancel");

}

uint64_t __76__TSTransferListViewController__maybeDisplayConsent_phoneNumber_completion___block_invoke_116(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  _TSLogDomain();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[TSTransferListViewController _maybeDisplayConsent:phoneNumber:completion:]_block_invoke";
    _os_log_impl(&dword_21B647000, v2, OS_LOG_TYPE_DEFAULT, "Don't have other device, maybe show intro @%s", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_cancelTransferringPlan");
  return objc_msgSend(*(id *)(a1 + 32), "_otherButtonTapped");
}

uint64_t __76__TSTransferListViewController__maybeDisplayConsent_phoneNumber_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, *(_QWORD *)(a1 + 48));
}

- (id)getLocalizedStringIf:(id)a3 then:(id)a4 otherwise:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7 && objc_msgSend(v7, "length"))
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", v8, &stru_24DEF4290, CFSTR("Localizable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v12, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", v9, &stru_24DEF4290, CFSTR("Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (void)_maybeDisplayPhysicalPlanConversionAlert:(BOOL)a3 phoneNumber:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  const __CFString *v16;
  const __CFString *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  id v50;
  _BYTE v51[128];
  _QWORD v52[4];

  v52[2] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("TRANSFER_SPEED_BUMP_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (+[TSUtilities isPad](TSUtilities, "isPad"))
    {
      v42 = v8;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("TRANSFER_TO_ESIM_DETAIL"), &stru_24DEF4290, CFSTR("Localizable"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[TSUtilities formattedPhoneNumber:withCountryCode:](TSUtilities, "formattedPhoneNumber:withCountryCode:", v8, 0);
      v13 = objc_claimAutoreleasedReturnValue();

      +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "deviceSupportsHydra");

      if ((v15 & 1) != 0)
      {
        v16 = CFSTR("TRANSFER_TO_ESIM_DETAIL_%@");
        v17 = CFSTR("TRANSFER_TO_ESIM_DETAIL");
      }
      else
      {
        v16 = CFSTR("TRANSFER_TO_ESIM_DETAIL_WITH_DSDS_WARNING_%@");
        v17 = CFSTR("TRANSFER_TO_ESIM_DETAIL_WITH_DSDS_WARNING");
      }
      -[TSTransferListViewController getLocalizedStringIf:then:otherwise:](self, "getLocalizedStringIf:then:otherwise:", v13, v16, v17);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (id)v13;
    }
    v18 = +[TSUtilities isPad](TSUtilities, "isPad");
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v18)
      v21 = CFSTR("TRANSFER_ACTION");
    else
      v21 = CFSTR("TRANSFER_NUM");
    objc_msgSend(v19, "localizedStringForKey:value:table:", v21, &stru_24DEF4290, CFSTR("Localizable"));
    v22 = objc_claimAutoreleasedReturnValue();

    v23 = (void *)MEMORY[0x24BEBD3A8];
    v24 = MEMORY[0x24BDAC760];
    v49[0] = MEMORY[0x24BDAC760];
    v49[1] = 3221225472;
    v49[2] = __96__TSTransferListViewController__maybeDisplayPhysicalPlanConversionAlert_phoneNumber_completion___block_invoke;
    v49[3] = &unk_24DEF2C08;
    v25 = v10;
    v50 = v25;
    v40 = (void *)v22;
    objc_msgSend(v23, "actionWithTitle:style:handler:", v22, 0, v49);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v26;
    v27 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24DEF4290, CFSTR("Localizable"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v24;
    v47[1] = 3221225472;
    v47[2] = __96__TSTransferListViewController__maybeDisplayPhysicalPlanConversionAlert_phoneNumber_completion___block_invoke_2;
    v47[3] = &unk_24DEF2C08;
    v48 = v25;
    objc_msgSend(v27, "actionWithTitle:style:handler:", v29, 1, v47);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v52[1] = v30;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v41, v39, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v33 = v31;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v44 != v36)
            objc_enumerationMutation(v33);
          objc_msgSend(v32, "addAction:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i));
        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
      }
      while (v35);
    }

    objc_msgSend(v33, "objectAtIndex:", 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setPreferredAction:", v38);

    -[TSTransferListViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v32, 1, 0);
    v8 = v42;
  }
  else
  {
    (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
  }

}

uint64_t __96__TSTransferListViewController__maybeDisplayPhysicalPlanConversionAlert_phoneNumber_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __96__TSTransferListViewController__maybeDisplayPhysicalPlanConversionAlert_phoneNumber_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_startPlanTransfer:(id)a3 withDeviceID:(id)a4
{
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  NSObject *v21;
  void *v22;
  char *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  CTRemotePlan *transferPlan;
  void *v30;
  _BOOL8 followDirections;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  id v41;
  void *v42;
  TSTransferListViewController *v43;
  id obj;
  id obja;
  _QWORD v46[5];
  id v47;
  id v48;
  id v49;
  _QWORD v50[5];
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  id location;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  const char *v60;
  __int16 v61;
  const char *v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v41 = a3;
  v40 = a4;
  v43 = self;
  objc_initWeak(&location, self);
  v42 = (void *)objc_opt_new();
  objc_msgSend(v41, "plans");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = (unint64_t)objc_msgSend(v6, "count") > 1;

  if ((_DWORD)self)
  {
    _TSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    obj = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[TSTransferListViewController _startPlanTransfer:withDeviceID:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    v15 = 0;
LABEL_29:

  }
  else
  {
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    objc_msgSend(v41, "plans");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v53;
      while (2)
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v53 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v21 = v20;
            -[NSObject phoneNumber](v21, "phoneNumber");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            -[NSObject transferAttributes](v21, "transferAttributes");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v22, "transferCapability") == 8)
            {
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                objc_msgSend(v22, "performSelector:", sel_transferEndpoint);
                v23 = (char *)objc_claimAutoreleasedReturnValue();
                if (!v23)
                {
                  _TSLogDomain();
                  v32 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                    -[TSTransferListViewController _startPlanTransfer:withDeviceID:].cold.2(v32, v33, v34, v35, v36, v37, v38, v39);

                  goto LABEL_29;
                }
                _TSLogDomain();
                v24 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
                {
                  -[NSObject iccid](v21, "iccid");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  v58 = v25;
                  v59 = 2112;
                  v60 = v23;
                  v61 = 2080;
                  v62 = "-[TSTransferListViewController _startPlanTransfer:withDeviceID:]";
                  _os_log_impl(&dword_21B647000, v24, OS_LOG_TYPE_DEFAULT, "Carrier direct auth flow plan: [%@], url: %@ @%s", buf, 0x20u);

                }
                objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v23);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v50[0] = MEMORY[0x24BDAC760];
                v50[1] = 3221225472;
                v50[2] = __64__TSTransferListViewController__startPlanTransfer_withDeviceID___block_invoke;
                v50[3] = &unk_24DEF2930;
                objc_copyWeak(&v51, &location);
                v50[4] = v43;
                objc_msgSend(v26, "openURL:options:completionHandler:", v27, MEMORY[0x24BDBD1B8], v50);

                objc_destroyWeak(&v51);
              }

            }
            else
            {
              -[NSObject planID](v21, "planID");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "addObject:", v28);

              transferPlan = v43->_transferPlan;
              v43->_transferPlan = (CTRemotePlan *)v21;
              v21 = v21;

            }
            v16 = v15;
          }
          else
          {
            _TSLogDomain();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v58 = v20;
              v59 = 2080;
              v60 = "-[TSTransferListViewController _startPlanTransfer:withDeviceID:]";
              _os_log_error_impl(&dword_21B647000, v21, OS_LOG_TYPE_ERROR, "[E]plan [%@] is not instance of CTRemotePlan @%s", buf, 0x16u);
            }
          }

        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
        if (v17)
          continue;
        break;
      }
    }

    if (objc_msgSend(v42, "count"))
    {
      v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC27A0]), "initWithPlanIdentifiers:", v42);
      followDirections = v43->_followDirections;
      v46[0] = MEMORY[0x24BDAC760];
      v46[1] = 3221225472;
      v46[2] = __64__TSTransferListViewController__startPlanTransfer_withDeviceID___block_invoke_141;
      v46[3] = &unk_24DEF2EC8;
      objc_copyWeak(&v49, &location);
      v46[4] = v43;
      v47 = v40;
      obja = v30;
      v48 = obja;
      -[TSTransferListViewController _maybeDisplayConsent:phoneNumber:completion:](v43, "_maybeDisplayConsent:phoneNumber:completion:", followDirections, v16, v46);

      objc_destroyWeak(&v49);
      v15 = v16;

    }
    else
    {
      v15 = v16;
    }
  }

  objc_destroyWeak(&location);
}

void __64__TSTransferListViewController__startPlanTransfer_withDeviceID___block_invoke(uint64_t a1, char a2)
{
  id *WeakRetained;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if ((a2 & 1) == 0)
  {
    _TSLogDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __64__TSTransferListViewController__startPlanTransfer_withDeviceID___block_invoke_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setUserInteractionEnabled:", 1);

  objc_msgSend(WeakRetained[156], "setEnabled:", 1);
  objc_msgSend(WeakRetained[156], "setUserInteractionEnabled:", 1);
  *((_BYTE *)WeakRetained + 1229) = 0;

}

void __64__TSTransferListViewController__startPlanTransfer_withDeviceID___block_invoke_141(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_dismissSelf");

  objc_msgSend(*(id *)(a1 + 32), "_showButtonTraySpinnerWithBusyText:", &stru_24DEF4290);
  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "setInstallingTransferPlan:", 1);

  v5 = *(_QWORD *)(a1 + 40);
  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "setTransferPlanDeviceID:", v5);

  v7 = objc_loadWeakRetained(v2);
  objc_msgSend(v7, "setBackToSelfOption:", 2);

  +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __64__TSTransferListViewController__startPlanTransfer_withDeviceID___block_invoke_2;
  v11[3] = &unk_24DEF3188;
  objc_copyWeak(&v12, v2);
  objc_msgSend(v8, "transferPlansWithIdentifier:fromDevice:completionHandler:", v9, v10, v11);

  objc_destroyWeak(&v12);
}

void __64__TSTransferListViewController__startPlanTransfer_withDeviceID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  dispatch_time_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = dispatch_time(0, 100000000);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __64__TSTransferListViewController__startPlanTransfer_withDeviceID___block_invoke_3;
  v6[3] = &unk_24DEF2B00;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  v7 = v3;
  v5 = v3;
  dispatch_after(v4, MEMORY[0x24BDAC9B8], v6);

  objc_destroyWeak(&v8);
}

void __64__TSTransferListViewController__startPlanTransfer_withDeviceID___block_invoke_3(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  void *v5;
  id v6;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setInstallingTransferPlan:", 0);

  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", 1);

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("transfer.failed"), *(_QWORD *)(a1 + 32));

  }
}

- (void)_startPendingInstall:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _TSLogDomain();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v12 = v4;
    v13 = 2080;
    v14 = "-[TSTransferListViewController _startPendingInstall:]";
    _os_log_impl(&dword_21B647000, v5, OS_LOG_TYPE_DEFAULT, "plans: %@ @%s", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CONTINUE_BUTTON_STATE_INSTALLING"), &stru_24DEF4290, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController _showButtonTraySpinnerWithBusyText:](self, "_showButtonTraySpinnerWithBusyText:", v7);

  +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __53__TSTransferListViewController__startPendingInstall___block_invoke;
  v9[3] = &unk_24DEF2EA0;
  objc_copyWeak(&v10, (id *)buf);
  v9[4] = self;
  objc_msgSend(v8, "installPendingPlanList:completion:", v4, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);

}

void __53__TSTransferListViewController__startPendingInstall___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD block[4];
  id v7;
  uint64_t v8;
  id v9;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__TSTransferListViewController__startPendingInstall___block_invoke_2;
  block[3] = &unk_24DEF2E28;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v9);
}

void __53__TSTransferListViewController__startPendingInstall___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  _BYTE *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
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
  _QWORD v21[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = *(_BYTE **)(a1 + 40);
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v3, "setShowSIMSetup:", 0);
    _TSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __53__TSTransferListViewController__startPendingInstall___block_invoke_2_cold_1(a1 + 32, v4, v5, v6, v7, v8, v9, v10);

    v11 = (void *)MEMORY[0x24BEBD3B0];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("ERROR_GENERIC_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("ERROR_TRY_AGAIN_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "alertControllerWithTitle:message:preferredStyle:", v13, v15, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("ERROR_OK"), &stru_24DEF4290, CFSTR("Localizable"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __53__TSTransferListViewController__startPendingInstall___block_invoke_151;
    v21[3] = &unk_24DEF2F40;
    v21[4] = WeakRetained;
    objc_msgSend(v17, "actionWithTitle:style:handler:", v19, 1, v21);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addAction:", v20);

    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v16, 1, 0);
  }
  else
  {
    if (!v3[1224])
      objc_msgSend(v3, "setShowSIMSetup:", 1);
    objc_msgSend(WeakRetained, "_dismissSelf");
  }

}

void __53__TSTransferListViewController__startPendingInstall___block_invoke_151(uint64_t a1)
{
  _BYTE *v1;
  id v2;

  v1 = *(_BYTE **)(a1 + 32);
  if (!v1[1284])
  {
    objc_msgSend(v1, "delegate");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "attemptFailed");

  }
}

- (void)_maybeUpdateTableView
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (self->_receivedPendingInstallItems && self->_receivedTransferItems)
  {
    -[OBTableWelcomeController tableView](self, "tableView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reloadData");

    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[OBTableWelcomeController tableView](self, "tableView", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "visibleCells");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          if ((objc_msgSend(v10, "isUserInteractionEnabled") & 1) != 0 || objc_msgSend(v10, "accessoryType") != 3)
          {

            return;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v7)
          continue;
        break;
      }
    }

    -[OBBoldTrayButton setEnabled:](self->_continueButton, "setEnabled:", 1);
    -[SSOBBoldTrayButton setUserInteractionEnabled:](self->_continueButton, "setUserInteractionEnabled:", 1);
  }
}

- (void)_dismissSelf
{
  id v3;

  -[TSTransferListViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewControllerDidComplete:", self);

}

- (BOOL)_isCarrierSetupItemSelected:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  BOOL v7;
  void *v8;
  unint64_t v9;
  void *v10;

  -[CTDisplayPlanList plans](self->_pendingInstallItems, "plans");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 > a3)
    return 0;
  -[CTDisplayPlanList plans](self->_pendingInstallItems, "plans");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = a3 - objc_msgSend(v8, "count");

  -[CTDisplayPlanList plans](self->_carrierSetupItems, "plans");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v9 < objc_msgSend(v10, "count");

  return v7;
}

- (void)_transferConsentOnSource
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CONTINUE_BUTTON_STATE_INSTALLING"), &stru_24DEF4290, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController _showButtonTraySpinnerWithBusyText:](self, "_showButtonTraySpinnerWithBusyText:", v4);

  -[TSTransferListViewController presentedViewController](self, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[TSTransferListViewController presentedViewController](self, "presentedViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (void)_cancelTransferringPlan
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[TSTransferListViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelNextPane");

  self->_requireDelayBluetoothConnection = 1;
  +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelTransferPlan:fromDevice:completionHandler:", self->_transferPlan, self->_transferPlanDeviceID, &__block_literal_global_152);

  -[OBWelcomeController _hideButtonTraySpinner](self, "_hideButtonTraySpinner");
  self->_continueButtonTappedOnce = 0;
  -[OBTableWelcomeController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", 1);

  -[NSMutableArray removeAllObjects](self->_chosenUseIndexPaths, "removeAllObjects");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[OBTableWelcomeController tableView](self, "tableView", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathsForSelectedRows");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11);
        -[OBTableWelcomeController tableView](self, "tableView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "deselectRowAtIndexPath:animated:", v12, 1);

        -[OBTableWelcomeController tableView](self, "tableView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[TSTransferListViewController tableView:didDeselectRowAtIndexPath:](self, "tableView:didDeselectRowAtIndexPath:", v14, v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

}

void __55__TSTransferListViewController__cancelTransferringPlan__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  if (v2)
  {
    _TSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __55__TSTransferListViewController__cancelTransferringPlan__block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

  }
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (BOOL)customizeSpinner
{
  return self->_animating;
}

- (int64_t)backOption
{
  return self->_backToSelfOption;
}

- (BOOL)animating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (NSArray)cachedButtons
{
  return (NSArray *)objc_getProperty(self, a2, 1296, 1);
}

- (void)setCachedButtons:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1296);
}

- (SSSpinner)spinner
{
  return (SSSpinner *)objc_getProperty(self, a2, 1304, 1);
}

- (void)setSpinner:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1304);
}

- (UIView)spinnerContainer
{
  return (UIView *)objc_getProperty(self, a2, 1312, 1);
}

- (void)setSpinnerContainer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1312);
}

- (TSSIMSetupFlowDelegate)delegate
{
  return (TSSIMSetupFlowDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)carrierNameForSelectedItem
{
  return (NSString *)objc_getProperty(self, a2, 1328, 1);
}

- (void)setCarrierNameForSelectedItem:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1328);
}

- (BOOL)isOtherButtonTapped
{
  return self->_isOtherButtonTapped;
}

- (void)setIsOtherButtonTapped:(BOOL)a3
{
  self->_isOtherButtonTapped = a3;
}

- (BOOL)installingTransferPlan
{
  return self->_installingTransferPlan;
}

- (void)setInstallingTransferPlan:(BOOL)a3
{
  self->_installingTransferPlan = a3;
}

- (BOOL)requireDelayBluetoothConnection
{
  return self->_requireDelayBluetoothConnection;
}

- (void)setRequireDelayBluetoothConnection:(BOOL)a3
{
  self->_requireDelayBluetoothConnection = a3;
}

- (BOOL)showSIMSetup
{
  return self->_showSIMSetup;
}

- (void)setShowSIMSetup:(BOOL)a3
{
  self->_showSIMSetup = a3;
}

- (BOOL)isCarrierSetupItemSelected
{
  return self->_isCarrierSetupItemSelected;
}

- (void)setIsCarrierSetupItemSelected:(BOOL)a3
{
  self->_isCarrierSetupItemSelected = a3;
}

- (int64_t)backToSelfOption
{
  return self->_backToSelfOption;
}

- (void)setBackToSelfOption:(int64_t)a3
{
  self->_backToSelfOption = a3;
}

- (BOOL)isStandaloneProximityFlow
{
  return self->_isStandaloneProximityFlow;
}

- (void)setIsStandaloneProximityFlow:(BOOL)a3
{
  self->_isStandaloneProximityFlow = a3;
}

- (BOOL)followDirections
{
  return self->_followDirections;
}

- (void)setFollowDirections:(BOOL)a3
{
  self->_followDirections = a3;
}

- (NSArray)transferItems
{
  return (NSArray *)objc_getProperty(self, a2, 1344, 1);
}

- (void)setTransferItems:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1344);
}

- (NSLayoutConstraint)heightAnchor
{
  return self->_heightAnchor;
}

- (void)setHeightAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_heightAnchor, a3);
}

- (UITableViewCell)sectionFooter
{
  return (UITableViewCell *)objc_getProperty(self, a2, 1360, 1);
}

- (void)setSectionFooter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1360);
}

- (NSMutableArray)chosenUseIndexPaths
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1368, 1);
}

- (void)setChosenUseIndexPaths:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1368);
}

- (CTRemotePlan)transferPlan
{
  return (CTRemotePlan *)objc_getProperty(self, a2, 1376, 1);
}

- (void)setTransferPlan:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1376);
}

- (CTDeviceIdentifier)transferPlanDeviceID
{
  return (CTDeviceIdentifier *)objc_getProperty(self, a2, 1384, 1);
}

- (void)setTransferPlanDeviceID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1384);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transferPlanDeviceID, 0);
  objc_storeStrong((id *)&self->_transferPlan, 0);
  objc_storeStrong((id *)&self->_chosenUseIndexPaths, 0);
  objc_storeStrong((id *)&self->_sectionFooter, 0);
  objc_storeStrong((id *)&self->_heightAnchor, 0);
  objc_storeStrong((id *)&self->_transferItems, 0);
  objc_storeStrong((id *)&self->_carrierNameForSelectedItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_spinnerContainer, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_cachedButtons, 0);
  objc_storeStrong((id *)&self->_carrierSetupItems, 0);
  objc_storeStrong((id *)&self->_pendingInstallItems, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_tableHeightAnchor, 0);
}

- (void)_startPlanTransfer:(uint64_t)a3 withDeviceID:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]more than one plan is selected to transfer. NOT supported @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_startPlanTransfer:(uint64_t)a3 withDeviceID:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Carrier direct autu flow with no carrier endpoint @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __64__TSTransferListViewController__startPlanTransfer_withDeviceID___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Fail to launch the direct carrier auth flow @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __53__TSTransferListViewController__startPendingInstall___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21B647000, a2, a3, "[E]error: %@ @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __55__TSTransferListViewController__cancelTransferringPlan__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21B647000, a2, a3, "[E]Failed %@ @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
