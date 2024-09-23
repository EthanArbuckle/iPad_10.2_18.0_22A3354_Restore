@implementation PSUICrossPlatformSIMTransferSpecifier

- (PSUICrossPlatformSIMTransferSpecifier)initWithHostController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PSUICrossPlatformSIMTransferSpecifier *v7;
  PSUICrossPlatformSIMTransferSpecifier *v8;
  objc_super v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CROSS_PLATFORM_SIM_TRANSFER_TITLE"), &stru_24D5028C8, CFSTR("Cellular"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10.receiver = self;
  v10.super_class = (Class)PSUICrossPlatformSIMTransferSpecifier;
  v7 = -[PSUICrossPlatformSIMTransferSpecifier initWithName:target:set:get:detail:cell:edit:](&v10, sel_initWithName_target_set_get_detail_cell_edit_, v6, 0, 0, 0, 0, 13, 0);
  v8 = v7;
  if (v7)
  {
    -[PSUICrossPlatformSIMTransferSpecifier setIdentifier:](v7, "setIdentifier:", CFSTR("Transfer SIM via QRCode"));
    -[PSUICrossPlatformSIMTransferSpecifier setTarget:](v8, "setTarget:", v8);
    -[PSUICrossPlatformSIMTransferSpecifier setButtonAction:](v8, "setButtonAction:", sel_cellPressed_);
    objc_storeWeak((id *)&v8->_hostController, v4);
    v8->_isRequestingFirstViewController = 0;
  }

  return v8;
}

- (void)cellPressed:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  BOOL v8;
  NSObject *v9;
  TSSIMSetupFlow *v10;
  TSSIMSetupFlow *flow;
  TSSIMSetupFlow *v12;
  _QWORD v13[5];
  id v14;
  uint64_t v15;
  void *v16;
  _BYTE buf[24];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PSUICrossPlatformSIMTransferSpecifier getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[PSUICrossPlatformSIMTransferSpecifier cellPressed:]";
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (self->_flow
    && (self->_isRequestingFirstViewController
     || (WeakRetained = objc_loadWeakRetained((id *)&self->_hostController),
         objc_msgSend(WeakRetained, "presentedViewController"),
         v7 = (void *)objc_claimAutoreleasedReturnValue(),
         v8 = v7 == 0,
         v7,
         WeakRetained,
         !v8)))
  {
    -[PSUICrossPlatformSIMTransferSpecifier getLogger](self, "getLogger");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2161C6000, v9, OS_LOG_TYPE_ERROR, "duplicate request to launch SimSetupSupport", buf, 2u);
    }
  }
  else
  {
    objc_msgSend(v4, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
    v15 = *MEMORY[0x24BE82B48];
    v16 = &unk_24D51C338;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE82B38], "flowWithOptions:", v9);
    v10 = (TSSIMSetupFlow *)objc_claimAutoreleasedReturnValue();
    flow = self->_flow;
    self->_flow = v10;

    -[TSSIMSetupFlow setDelegate:](self->_flow, "setDelegate:", self);
    self->_isRequestingFirstViewController = 1;
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    v12 = self->_flow;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __53__PSUICrossPlatformSIMTransferSpecifier_cellPressed___block_invoke;
    v13[3] = &unk_24D501810;
    objc_copyWeak(&v14, (id *)buf);
    v13[4] = self;
    -[TSSIMSetupFlow firstViewController:](v12, "firstViewController:", v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }

}

void __53__PSUICrossPlatformSIMTransferSpecifier_cellPressed___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setIsRequestingFirstViewController:", 0);
    objc_msgSend(*(id *)(a1 + 32), "getLogger");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "hostController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "navigationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 134217984;
      v14 = objc_msgSend(v8, "modalPresentationStyle");
      _os_log_impl(&dword_2161C6000, v6, OS_LOG_TYPE_DEFAULT, "modal style:%ld", (uint8_t *)&v13, 0xCu);

    }
    objc_msgSend(v5, "hostController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isInModalPresentation");

    if (v10)
    {
      objc_msgSend(v5, "hostController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "navigationController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "pushViewController:animated:", v3, 1);
    }
    else
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v3);
      objc_msgSend(v11, "setModalPresentationStyle:", 2);
      objc_msgSend(v5, "hostController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "presentViewController:animated:completion:", v11, 1, 0);
    }

    objc_msgSend(v5, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v13 = 138412290;
    v14 = objc_opt_class();
    _os_log_error_impl(&dword_2161C6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "invalid %@", (uint8_t *)&v13, 0xCu);
  }

}

- (void)simSetupFlowCompleted:(unint64_t)a3
{
  NSObject *v4;
  _QWORD block[4];
  id v6;
  uint8_t buf[8];

  -[PSUICrossPlatformSIMTransferSpecifier getLogger](self, "getLogger", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2161C6000, v4, OS_LOG_TYPE_DEFAULT, "finish x sim transfer flow", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__PSUICrossPlatformSIMTransferSpecifier_simSetupFlowCompleted___block_invoke;
  block[3] = &unk_24D5017E8;
  objc_copyWeak(&v6, (id *)buf);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __63__PSUICrossPlatformSIMTransferSpecifier_simSetupFlowCompleted___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "hostController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "navigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

    objc_msgSend(v4, "setFlow:", 0);
    WeakRetained = v4;
  }

}

- (void)showSpinner:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  UIActivityIndicatorView *v6;
  UIActivityIndicatorView *spinner;
  void *v8;
  void *v9;
  id originAccessoryView;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = a3;
  if (self->_spinner)
  {
    v5 = *MEMORY[0x24BE75D18];
  }
  else
  {
    v6 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
    spinner = self->_spinner;
    self->_spinner = v6;

    v5 = *MEMORY[0x24BE75D18];
    -[PSUICrossPlatformSIMTransferSpecifier propertyForKey:](self, "propertyForKey:", *MEMORY[0x24BE75D18]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessoryView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    originAccessoryView = self->_originAccessoryView;
    self->_originAccessoryView = v9;

  }
  -[PSUICrossPlatformSIMTransferSpecifier propertyForKey:](self, "propertyForKey:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if (v3)
    {
      objc_msgSend(v11, "setAccessoryView:", self->_spinner);
      -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
    }
    else
    {
      -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
      objc_msgSend(v12, "setAccessoryView:", self->_originAccessoryView);
    }
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __53__PSUICrossPlatformSIMTransferSpecifier_showSpinner___block_invoke;
    block[3] = &unk_24D501660;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  else
  {
    -[PSUICrossPlatformSIMTransferSpecifier getLogger](self, "getLogger");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2161C6000, v13, OS_LOG_TYPE_ERROR, "invalid table cell", buf, 2u);
    }

  }
}

void __53__PSUICrossPlatformSIMTransferSpecifier_showSpinner___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 232));
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

      if (self->_spinner)
        objc_msgSend(v8, "setAccessoryView:");

    }
  }
  if (objc_msgSend((id)*MEMORY[0x24BE75A18], "isEqualToString:", v7))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PSUICrossPlatformSIMTransferSpecifier showSpinner:](self, "showSpinner:", objc_msgSend(v6, "BOOLValue") ^ 1);
  }
  v11.receiver = self;
  v11.super_class = (Class)PSUICrossPlatformSIMTransferSpecifier;
  -[PSUICrossPlatformSIMTransferSpecifier setProperty:forKey:](&v11, sel_setProperty_forKey_, v6, v7);

}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("xpf.sim.tr"));
}

- (PSListController)hostController
{
  return (PSListController *)objc_loadWeakRetained((id *)&self->_hostController);
}

- (void)setHostController:(id)a3
{
  objc_storeWeak((id *)&self->_hostController, a3);
}

- (UIViewController)firstViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_firstViewController);
}

- (void)setFirstViewController:(id)a3
{
  objc_storeWeak((id *)&self->_firstViewController, a3);
}

- (TSSIMSetupFlow)flow
{
  return (TSSIMSetupFlow *)objc_getProperty(self, a2, 248, 1);
}

- (void)setFlow:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (BOOL)isRequestingFirstViewController
{
  return self->_isRequestingFirstViewController;
}

- (void)setIsRequestingFirstViewController:(BOOL)a3
{
  self->_isRequestingFirstViewController = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flow, 0);
  objc_destroyWeak((id *)&self->_firstViewController);
  objc_destroyWeak((id *)&self->_hostController);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong(&self->_originAccessoryView, 0);
}

@end
