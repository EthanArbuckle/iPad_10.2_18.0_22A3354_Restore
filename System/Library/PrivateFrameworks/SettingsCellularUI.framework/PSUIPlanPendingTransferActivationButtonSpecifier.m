@implementation PSUIPlanPendingTransferActivationButtonSpecifier

- (PSUIPlanPendingTransferActivationButtonSpecifier)initWithListController:(id)a3 planPendingTransfer:(id)a4
{
  id v6;
  id v7;
  PSUIPlanPendingTransferActivationButtonSpecifier *v8;
  PSUIPlanPendingTransferActivationButtonSpecifier *v9;
  void *v10;
  uint64_t v11;
  CTCellularPlanManager *cellularPlanManager;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PSUIPlanPendingTransferActivationButtonSpecifier;
  v8 = -[PSUIPlanPendingTransferActivationButtonSpecifier initWithName:target:set:get:detail:cell:edit:](&v14, sel_initWithName_target_set_get_detail_cell_edit_, 0, self, 0, 0, 0, 13, 0);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_hostController, v6);
    objc_msgSend(v6, "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v9->_navigationController, v10);

    objc_storeStrong((id *)&v9->_plan, a4);
    objc_storeWeak((id *)&v9->_hostController, v6);
    objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
    v11 = objc_claimAutoreleasedReturnValue();
    cellularPlanManager = v9->_cellularPlanManager;
    v9->_cellularPlanManager = (CTCellularPlanManager *)v11;

    -[PSUIPlanPendingTransferActivationButtonSpecifier setSpecifierProperties](v9, "setSpecifierProperties");
    -[PSUIPlanPendingTransferActivationButtonSpecifier setButtonAction:](v9, "setButtonAction:", sel_activatePlanPendingTransfer_);
  }

  return v9;
}

- (void)setSpecifierProperties
{
  unint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = -[CTCellularPlanPendingTransfer status](self->_plan, "status");
  if (v3 >= 2)
  {
    if (v3 != 2)
      return;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ACTIVATING"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x24BDBD1C0];
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ACTIVATE_CELLULAR_PLAN"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x24BDBD1C8];
  }
  -[PSUIPlanPendingTransferActivationButtonSpecifier setName:](self, "setName:", v5);

  -[PSUIPlanPendingTransferActivationButtonSpecifier setProperty:forKey:](self, "setProperty:forKey:", v6, *MEMORY[0x24BE75A18]);
}

- (void)activatePlanPendingTransfer:(id)a3
{
  id v4;
  NSObject *v5;
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
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  PSUIPlanPendingTransferActivationButtonSpecifier *v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PSUIPlanPendingTransferActivationButtonSpecifier getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[PSUIPlanPendingTransferActivationButtonSpecifier activatePlanPendingTransfer:]";
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  objc_msgSend(v4, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
  v6 = (void *)MEMORY[0x24BEBD3B0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("TRANSFER_TARGET_TITLE"), &stru_24D5028C8, CFSTR("Cellular"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("TRANSFER_REQUEST_CONFIRMATION"), &stru_24D5028C8, CFSTR("Cellular"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v8, v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("OK_BUTTON"), &stru_24D5028C8, CFSTR("Cellular"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __80__PSUIPlanPendingTransferActivationButtonSpecifier_activatePlanPendingTransfer___block_invoke;
  v21 = &unk_24D501B58;
  v22 = self;
  v23 = v4;
  v15 = v4;
  objc_msgSend(v12, "actionWithTitle:style:handler:", v14, 2, &v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addAction:", v16, v18, v19, v20, v21, v22);
  -[PSUIPlanPendingTransferActivationButtonSpecifier hostController](self, "hostController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "presentViewController:animated:completion:", v11, 1, 0);

}

void __80__PSUIPlanPendingTransferActivationButtonSpecifier_activatePlanPendingTransfer___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "getLogger");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "plan");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v11 = v3;
    _os_log_impl(&dword_2161C6000, v2, OS_LOG_TYPE_DEFAULT, "Triggered activation of pending transfer item: %@", buf, 0xCu);

  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(void **)(v4 + 248);
  v7 = *(_QWORD *)(v4 + 232);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __80__PSUIPlanPendingTransferActivationButtonSpecifier_activatePlanPendingTransfer___block_invoke_20;
  v8[3] = &unk_24D502598;
  v8[4] = v4;
  v9 = v5;
  objc_msgSend(v6, "activatePlanPendingTransfer:completion:", v7, v8);

}

void __80__PSUIPlanPendingTransferActivationButtonSpecifier_activatePlanPendingTransfer___block_invoke_20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  _QWORD *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  uint64_t v19;
  void *v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a5;
  objc_msgSend(*(id *)(a1 + 32), "getLogger");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v6;
    _os_log_impl(&dword_2161C6000, v7, OS_LOG_TYPE_DEFAULT, "activate pending plan callback with error: %@", buf, 0xCu);
  }

  if (objc_msgSend(v6, "code") == 49 || objc_msgSend(v6, "code") == 51)
  {
    v8 = *(_QWORD **)(a1 + 32);
    if (v8[32])
    {
      objc_msgSend(v8, "getLogger");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_2161C6000, v9, OS_LOG_TYPE_ERROR, "duplicate request to launch SimSetupSupport", buf, 2u);
      }
    }
    else
    {
      v19 = *MEMORY[0x24BE82B48];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
      v9 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BE82B38], "flowWithOptions:", v9);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(void **)(v12 + 256);
      *(_QWORD *)(v12 + 256) = v11;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "setDelegate:");
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(void **)(a1 + 40);
      v16 = *(void **)(v14 + 256);
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __80__PSUIPlanPendingTransferActivationButtonSpecifier_activatePlanPendingTransfer___block_invoke_24;
      v17[3] = &unk_24D502570;
      v17[4] = v14;
      v18 = v15;
      objc_msgSend(v16, "firstViewController:", v17);

    }
  }

}

void __80__PSUIPlanPendingTransferActivationButtonSpecifier_activatePlanPendingTransfer___block_invoke_24(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "getLogger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = objc_opt_class();
    _os_log_impl(&dword_2161C6000, v4, OS_LOG_TYPE_DEFAULT, "present %@", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v3);
  objc_msgSend(v5, "setModalPresentationStyle:", 2);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 224));
  objc_msgSend(WeakRetained, "topViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 264), v7);

  v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 224));
  objc_msgSend(v8, "topViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentViewController:animated:completion:", v5, 1, 0);

}

- (void)showSpinner:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  UIActivityIndicatorView *v6;
  UIActivityIndicatorView *spinner;
  void *v8;
  void *v9;
  id originAccessoryView;
  void *v11;
  _QWORD block[5];

  v3 = a3;
  if (!self->_spinner)
  {
    v6 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
    spinner = self->_spinner;
    self->_spinner = v6;

    -[PSUIPlanPendingTransferActivationButtonSpecifier propertyForKey:](self, "propertyForKey:", *MEMORY[0x24BE75D18]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessoryView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    originAccessoryView = self->_originAccessoryView;
    self->_originAccessoryView = v9;

    if (v3)
      goto LABEL_3;
LABEL_5:
    -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
    -[PSUIPlanPendingTransferActivationButtonSpecifier propertyForKey:](self, "propertyForKey:", *MEMORY[0x24BE75D18]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAccessoryView:", self->_originAccessoryView);

    goto LABEL_6;
  }
  if (!a3)
    goto LABEL_5;
LABEL_3:
  -[PSUIPlanPendingTransferActivationButtonSpecifier propertyForKey:](self, "propertyForKey:", *MEMORY[0x24BE75D18]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessoryView:", self->_spinner);

  -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
LABEL_6:
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__PSUIPlanPendingTransferActivationButtonSpecifier_showSpinner___block_invoke;
  block[3] = &unk_24D501660;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __64__PSUIPlanPendingTransferActivationButtonSpecifier_showSpinner___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 240));
  objc_msgSend(WeakRetained, "reloadSpecifier:", *(_QWORD *)(a1 + 32));

}

- (void)setProperty:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend((id)*MEMORY[0x24BE75D18], "isEqualToString:", v7))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v6;
      objc_msgSend(v8, "textLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setNumberOfLines:", 0);

      objc_msgSend(v8, "textLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "setLineBreakMode:", 0);
    }
  }
  if (objc_msgSend((id)*MEMORY[0x24BE75A18], "isEqualToString:", v7))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PSUIPlanPendingTransferActivationButtonSpecifier showSpinner:](self, "showSpinner:", objc_msgSend(v6, "BOOLValue") ^ 1);
  }
  v11.receiver = self;
  v11.super_class = (Class)PSUIPlanPendingTransferActivationButtonSpecifier;
  -[PSUIPlanPendingTransferActivationButtonSpecifier setProperty:forKey:](&v11, sel_setProperty_forKey_, v6, v7);

}

- (void)simSetupFlowCompleted:(unint64_t)a3
{
  NSObject *v4;
  _QWORD v5[5];
  id v6;
  uint8_t buf[8];

  -[PSUIPlanPendingTransferActivationButtonSpecifier getLogger](self, "getLogger", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2161C6000, v4, OS_LOG_TYPE_DEFAULT, "finish activation flow", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __74__PSUIPlanPendingTransferActivationButtonSpecifier_simSetupFlowCompleted___block_invoke;
  v5[3] = &unk_24D501A20;
  objc_copyWeak(&v6, (id *)buf);
  v5[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __74__PSUIPlanPendingTransferActivationButtonSpecifier_simSetupFlowCompleted___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v3 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 224));
    objc_msgSend(v3, "topViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentedViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 256);
    *(_QWORD *)(v6 + 256) = 0;

    WeakRetained = v8;
  }

}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("PlanPendingTransferActivationButton"));
}

- (CTCellularPlanPendingTransfer)plan
{
  return self->_plan;
}

- (void)setPlan:(id)a3
{
  objc_storeStrong((id *)&self->_plan, a3);
}

- (PSListController)hostController
{
  return (PSListController *)objc_loadWeakRetained((id *)&self->_hostController);
}

- (void)setHostController:(id)a3
{
  objc_storeWeak((id *)&self->_hostController, a3);
}

- (CTCellularPlanManager)cellularPlanManager
{
  return self->_cellularPlanManager;
}

- (void)setCellularPlanManager:(id)a3
{
  objc_storeStrong((id *)&self->_cellularPlanManager, a3);
}

- (TSSIMSetupFlow)flow
{
  return (TSSIMSetupFlow *)objc_getProperty(self, a2, 256, 1);
}

- (void)setFlow:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_spinner, a3);
}

- (UIViewController)topViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_topViewController);
}

- (void)setTopViewController:(id)a3
{
  objc_storeWeak((id *)&self->_topViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_topViewController);
  objc_storeStrong((id *)&self->_flow, 0);
  objc_storeStrong((id *)&self->_cellularPlanManager, 0);
  objc_destroyWeak((id *)&self->_hostController);
  objc_storeStrong((id *)&self->_plan, 0);
  objc_destroyWeak((id *)&self->_navigationController);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong(&self->_originAccessoryView, 0);
}

@end
