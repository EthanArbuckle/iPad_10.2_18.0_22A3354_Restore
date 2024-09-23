@implementation TSSetupAssistantSIMSetupFlow

+ (void)needsToRun:(id)a3
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  if (v3)
  {
    if (+[TSUtilities hasCellularBaseband](TSUtilities, "hasCellularBaseband"))
    {
      +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = __43__TSSetupAssistantSIMSetupFlow_needsToRun___block_invoke;
      v5[3] = &unk_24DEF30D0;
      v6 = v3;
      objc_msgSend(v4, "planItemsWithCompletion:", v5);

    }
    else
    {
      (*((void (**)(id, _QWORD))v3 + 2))(v3, 0);
    }
  }

}

void __43__TSSetupAssistantSIMSetupFlow_needsToRun___block_invoke(uint64_t a1)
{
  id v2;

  +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shouldShowPlanSetupWithCompletion:", *(_QWORD *)(a1 + 32));

}

- (TSSetupAssistantSIMSetupFlow)init
{
  TSSetupAssistantSIMSetupFlow *v2;
  NSObject *v3;
  _BOOL4 inBuddy;
  void *v5;
  objc_super v7;
  uint8_t buf[4];
  _BOOL4 v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7.receiver = self;
  v7.super_class = (Class)TSSetupAssistantSIMSetupFlow;
  v2 = -[TSSIMSetupFlow init](&v7, sel_init);
  if (v2)
  {
    v2->_inBuddy = BYSetupAssistantNeedsToRun();
    _TSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      inBuddy = v2->_inBuddy;
      *(_DWORD *)buf = 67109378;
      v9 = inBuddy;
      v10 = 2080;
      v11 = "-[TSSetupAssistantSIMSetupFlow init]";
      _os_log_impl(&dword_21B647000, v3, OS_LOG_TYPE_DEFAULT, "_inBuddy:%d @%s", buf, 0x12u);
    }

    +[TSUserInPurchaseFlowAssertion sharedInstance](TSUserInPurchaseFlowAssertion, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertUserInPurchaseFlowStartOver:caller:", 0, v2);

  }
  return v2;
}

- (TSSetupAssistantSIMSetupFlow)initWithIccid:(id)a3 showAddPlan:(BOOL)a4 forceDualSIMSetup:(BOOL)a5 allowDismiss:(BOOL)a6
{
  _BOOL4 v6;
  id v11;
  NSObject *v12;
  TSSetupAssistantSIMSetupFlow *v13;
  TSSetupAssistantSIMSetupFlow *v14;
  uint64_t v15;
  UIBarButtonItem *cancelButton;
  void *v17;
  _DWORD v19[2];
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v6 = a6;
  v22 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  _TSLogDomain();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v19[0] = 67109378;
    v19[1] = v6;
    v20 = 2080;
    v21 = "-[TSSetupAssistantSIMSetupFlow initWithIccid:showAddPlan:forceDualSIMSetup:allowDismiss:]";
    _os_log_impl(&dword_21B647000, v12, OS_LOG_TYPE_DEFAULT, "allowDismiss: %d @%s", (uint8_t *)v19, 0x12u);
  }

  v13 = -[TSSetupAssistantSIMSetupFlow init](self, "init");
  v14 = v13;
  if (v13)
  {
    v13->_showAddPlan = a4;
    objc_storeStrong((id *)&v13->_iccid, a3);
    v14->_forceDualSIMSetup = a5;
    if (v6)
    {
      v15 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, v14, sel_userDidTapCancel);
      cancelButton = v14->_cancelButton;
      v14->_cancelButton = (UIBarButtonItem *)v15;

    }
    +[TSUserInPurchaseFlowAssertion sharedInstance](TSUserInPurchaseFlowAssertion, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "assertUserInPurchaseFlowStartOver:caller:", 0, v14);

  }
  return v14;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[TSUserInPurchaseFlowAssertion sharedInstance](TSUserInPurchaseFlowAssertion, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deassertUserInPurchaseFlowWithForce:caller:", 0, self);

  v4.receiver = self;
  v4.super_class = (Class)TSSetupAssistantSIMSetupFlow;
  -[TSSetupAssistantSIMSetupFlow dealloc](&v4, sel_dealloc);
}

- (id)firstViewController
{
  TSAddCellularPlanViewController *v3;
  NSObject *v4;
  id v5;
  int v7;
  id v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = -[TSAddCellularPlanViewController initWithType:allowDismiss:]([TSAddCellularPlanViewController alloc], "initWithType:allowDismiss:", !self->_showAddPlan, self->_cancelButton != 0);
  -[TSAddCellularPlanViewController setDelegate:](v3, "setDelegate:", self);
  _TSLogDomain();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412546;
    v8 = (id)objc_opt_class();
    v9 = 2080;
    v10 = "-[TSSetupAssistantSIMSetupFlow firstViewController]";
    v5 = v8;
    _os_log_impl(&dword_21B647000, v4, OS_LOG_TYPE_DEFAULT, "first view: %@ @%s", (uint8_t *)&v7, 0x16u);

  }
  -[TSSIMSetupFlow setTopViewController:](self, "setTopViewController:", v3);
  return v3;
}

- (void)firstViewController:(id)a3
{
  id v5;
  id v6;

  if (a3)
  {
    v5 = a3;
    -[TSSetupAssistantSIMSetupFlow firstViewController](self, "firstViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))a3 + 2))(v5, v6);

  }
}

- (id)nextViewControllerFrom:(id)a3
{
  id v4;
  TSCellularPlanLabelsViewController *v5;
  TSCellularPlanUsesViewController *v6;
  uint64_t v7;
  _BOOL8 v8;
  TSCellularPlanLabelsViewController *v9;
  uint64_t v11;
  TSCellularPlanRemapViewController *v12;
  _BOOL8 v13;
  void *v14;
  TSCellularPlanRemapViewController *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSMutableArray *v20;
  NSMutableArray *danglingPlanItems;
  TSCellularPlanUsesViewController *v22;
  TSCellularPlanRemapViewController *v23;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = [TSCellularPlanUsesViewController alloc];
      v7 = 0;
LABEL_5:
      v8 = 0;
LABEL_6:
      v5 = -[TSCellularPlanUsesViewController initWithType:withDoneButton:](v6, "initWithType:withDoneButton:", v7, v8);
      goto LABEL_7;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = objc_msgSend(v4, "usesType");
      if (v11 == 2)
      {
        v17 = (void *)MEMORY[0x24BDBCEB8];
        +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "getDanglingPlanItems");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "arrayWithArray:", v19);
        v20 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        danglingPlanItems = self->_danglingPlanItems;
        self->_danglingPlanItems = v20;

        v22 = [TSCellularPlanUsesViewController alloc];
        if (-[NSMutableArray count](self->_danglingPlanItems, "count"))
          v8 = 0;
        else
          v8 = self->_cancelButton != 0;
        v6 = v22;
        v7 = 1;
        goto LABEL_6;
      }
      if (v11 != 1)
      {
        if (!v11)
        {
          v6 = [TSCellularPlanUsesViewController alloc];
          v7 = 2;
          goto LABEL_5;
        }
LABEL_22:
        v9 = 0;
        goto LABEL_8;
      }
      if (!-[NSMutableArray count](self->_danglingPlanItems, "count"))
        goto LABEL_22;
      v23 = [TSCellularPlanRemapViewController alloc];
      v13 = (unint64_t)-[NSMutableArray count](self->_danglingPlanItems, "count") > 1;
      -[NSMutableArray objectAtIndex:](self->_danglingPlanItems, "objectAtIndex:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v23;
      v16 = 1;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (unint64_t)-[NSMutableArray count](self->_danglingPlanItems, "count") < 2)
      {
        goto LABEL_22;
      }
      -[NSMutableArray removeObjectAtIndex:](self->_danglingPlanItems, "removeObjectAtIndex:", 0);
      v12 = [TSCellularPlanRemapViewController alloc];
      v13 = (unint64_t)-[NSMutableArray count](self->_danglingPlanItems, "count") > 1;
      -[NSMutableArray objectAtIndex:](self->_danglingPlanItems, "objectAtIndex:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v12;
      v16 = 0;
    }
    v9 = -[TSCellularPlanRemapViewController initWithBackButton:continueButton:danglingPlanItem:](v15, "initWithBackButton:continueButton:danglingPlanItem:", v16, v13, v14);

    goto LABEL_8;
  }
  v5 = -[TSCellularPlanLabelsViewController initWithIccid:forceDualSIMSetup:allowDismiss:]([TSCellularPlanLabelsViewController alloc], "initWithIccid:forceDualSIMSetup:allowDismiss:", self->_iccid, self->_forceDualSIMSetup, self->_cancelButton != 0);
LABEL_7:
  v9 = v5;
LABEL_8:

  return v9;
}

- (BOOL)_needCustomizeBackAction:(id)a3
{
  return 0;
}

- (void)setDefaultNavigationItems:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (self->_cancelButton)
  {
    objc_msgSend(v9, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidesBackButton:animated:", 1, 0);

    objc_msgSend(v9, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLeftBarButtonItem:", self->_cancelButton);

  }
  if (!+[TSUtilities inBuddy](TSUtilities, "inBuddy"))
  {
    objc_msgSend(v9, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "navigationBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v8);

  }
}

- (NSMutableArray)currentItemsForIMessage
{
  return (NSMutableArray *)objc_getProperty(self, a2, 128, 1);
}

- (void)setCurrentItemsForIMessage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (BOOL)inBuddy
{
  return self->_inBuddy;
}

- (void)setInBuddy:(BOOL)a3
{
  self->_inBuddy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentItemsForIMessage, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_iccid, 0);
  objc_storeStrong((id *)&self->_danglingPlanItems, 0);
}

@end
