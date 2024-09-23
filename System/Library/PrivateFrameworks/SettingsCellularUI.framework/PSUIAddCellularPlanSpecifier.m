@implementation PSUIAddCellularPlanSpecifier

- (PSUIAddCellularPlanSpecifier)initWithHostController:(id)a3 isEmbeddedInCarrierList:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  void *v8;
  PSUIAddCellularPlanSpecifier *v9;

  v4 = a4;
  v6 = (void *)MEMORY[0x24BE15900];
  v7 = a3;
  objc_msgSend(v6, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PSUIAddCellularPlanSpecifier initWithHostController:isEmbeddedInCarrierList:planManager:](self, "initWithHostController:isEmbeddedInCarrierList:planManager:", v7, v4, v8);

  return v9;
}

- (PSUIAddCellularPlanSpecifier)initWithHostController:(id)a3 isEmbeddedInCarrierList:(BOOL)a4 planManager:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  const __CFString *v20;
  PSUIAddCellularPlanSpecifier *v21;
  PSUIAddCellularPlanSpecifier *v22;
  void *v23;
  void *v24;
  objc_super v26;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = CFSTR("CELLULAR_CHOOSE_NETWORK_OTHER");
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CELLULAR_CHOOSE_NETWORK_OTHER"), &stru_24D5028C8, CFSTR("Cellular"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 3;
  }
  else
  {
    +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "planItems");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "sf_isiPad") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      v19 = CFSTR("ADD_CELLULAR_PLAN");
      v20 = CFSTR("Gemini-Gemini");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v16 <= 0)
        v19 = CFSTR("SETUP_CELLULAR");
      else
        v19 = CFSTR("ADD_ESIM");
      v20 = CFSTR("Cellular");
    }
    objc_msgSend(v17, "localizedStringForKey:value:table:", v19, &stru_24D5028C8, v20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = CFSTR("ADD_CELLULAR_PLAN");
    v13 = 13;
  }

  v26.receiver = self;
  v26.super_class = (Class)PSUIAddCellularPlanSpecifier;
  v21 = -[PSUIAddCellularPlanSpecifier initWithName:target:set:get:detail:cell:edit:](&v26, sel_initWithName_target_set_get_detail_cell_edit_, v12, 0, 0, 0, 0, v13, 0);
  v22 = v21;
  if (v21)
  {
    -[PSUIAddCellularPlanSpecifier setIdentifier:](v21, "setIdentifier:", v11);
    -[PSUIAddCellularPlanSpecifier setTarget:](v22, "setTarget:", v22);
    -[PSUIAddCellularPlanSpecifier setButtonAction:](v22, "setButtonAction:", sel_addCellularPlanCellPressed_);
    objc_storeWeak((id *)&v22->_hostController, v8);
    objc_storeStrong((id *)&v22->_planManager, a5);
    v22->_isRequestingFirstViewController = 0;
    v22->_isEmbeddedInCarrierList = v6;
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObserver:selector:name:object:", v22, sel_setUpeSIMNeeded, CFSTR("PSUICellularPlanSetUpNeeded"), 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addObserver:selector:name:object:", v22, sel_cellularPlanChanged, CFSTR("PSUICellularPlanChanged"), 0);

  return v22;
}

- (void)setUpeSIMNeeded
{
  NSObject *v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  -[PSUIAddCellularPlanSpecifier getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = CFSTR("PSUICellularPlanSetUpNeeded");
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "Received notification %@", (uint8_t *)&v4, 0xCu);
  }

  -[PSUIAddCellularPlanSpecifier addCellularPlanCellPressed:](self, "addCellularPlanCellPressed:", self);
}

- (void)addCellularPlanCellPressed:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  BOOL v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  int v12;
  const char *v13;
  void *v14;
  void *v15;
  TSSIMSetupFlow *v16;
  TSSIMSetupFlow *flow;
  TSSIMSetupFlow *v18;
  _QWORD v19[5];
  id v20;
  uint64_t v21;
  void *v22;
  _BYTE buf[24];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PSUIAddCellularPlanSpecifier getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[PSUIAddCellularPlanSpecifier addCellularPlanCellPressed:]";
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
    -[PSUIAddCellularPlanSpecifier getLogger](self, "getLogger");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2161C6000, v9, OS_LOG_TYPE_ERROR, "duplicate request to launch SimSetupSupport", buf, 2u);
    }

  }
  else if (+[SettingsCellularUtils noDataConnectivityAvailable](SettingsCellularUtils, "noDataConnectivityAvailable"))
  {
    -[PSUIAddCellularPlanSpecifier getLogger](self, "getLogger");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "sf_isiPhone");
      v13 = "iPad";
      if (v12)
        v13 = "iPhone";
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v13;
      _os_log_impl(&dword_2161C6000, v10, OS_LOG_TYPE_DEFAULT, "Data connectivity is not available to set up eSIM(s) on %s", buf, 0xCu);

    }
    -[PSUIAddCellularPlanSpecifier _showWifiAlert](self, "_showWifiAlert");
  }
  else
  {
    objc_msgSend(v4, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
    v21 = *MEMORY[0x24BE82B48];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE82B38], "flowWithOptions:", v15);
    v16 = (TSSIMSetupFlow *)objc_claimAutoreleasedReturnValue();
    flow = self->_flow;
    self->_flow = v16;

    -[TSSIMSetupFlow setDelegate:](self->_flow, "setDelegate:", self);
    self->_isRequestingFirstViewController = 1;
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    v18 = self->_flow;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __59__PSUIAddCellularPlanSpecifier_addCellularPlanCellPressed___block_invoke;
    v19[3] = &unk_24D501810;
    objc_copyWeak(&v20, (id *)buf);
    v19[4] = self;
    -[TSSIMSetupFlow firstViewController:](v18, "firstViewController:", v19);
    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);

  }
}

void __59__PSUIAddCellularPlanSpecifier_addCellularPlanCellPressed___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id *v5;
  id v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  uint8_t v12[16];
  uint8_t buf[16];
  uint8_t v14[16];

  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setFirstViewController:", v3);
    objc_msgSend(v5, "setIsRequestingFirstViewController:", 0);
    v6 = objc_loadWeakRetained(v5 + 30);
    v7 = objc_msgSend(v6, "isModalInPresentation");

    objc_msgSend(*(id *)(a1 + 32), "getLogger");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEFAULT, "presented inline", buf, 2u);
      }

      objc_msgSend(v5, "hostController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "navigationController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "pushViewController:animated:", v3, 1);
    }
    else
    {
      if (v9)
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEFAULT, "present in sheet", v12, 2u);
      }

      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v3);
      objc_msgSend(v10, "setModalPresentationStyle:", 2);
      objc_msgSend(v5, "hostController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "presentViewController:animated:completion:", v10, 1, 0);
    }

    objc_msgSend(v5, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v14 = 0;
    _os_log_error_impl(&dword_2161C6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "invalid PSUIAddCellularPlanSpecifier", v14, 2u);
  }

}

- (void)cellularPlanChanged
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[PSUIAddCellularPlanSpecifier getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315394;
    v14 = "-[PSUIAddCellularPlanSpecifier cellularPlanChanged]";
    v15 = 2112;
    v16 = CFSTR("PSUICellularPlanChanged");
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "%s received notification %@", (uint8_t *)&v13, 0x16u);
  }

  if (-[PSUIAddCellularPlanSpecifier isEmbeddedInCarrierList](self, "isEmbeddedInCarrierList"))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CELLULAR_CHOOSE_NETWORK_OTHER"), &stru_24D5028C8, CFSTR("Cellular"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIAddCellularPlanSpecifier setName:](self, "setName:", v5);
  }
  else
  {
    +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "planItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "sf_isiPad") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v9;
      v10 = CFSTR("ADD_CELLULAR_PLAN");
      v11 = CFSTR("Gemini-Gemini");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v9;
      if (v8 <= 0)
        v10 = CFSTR("SETUP_CELLULAR");
      else
        v10 = CFSTR("ADD_ESIM");
      v11 = CFSTR("Cellular");
    }
    objc_msgSend(v9, "localizedStringForKey:value:table:", v10, &stru_24D5028C8, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIAddCellularPlanSpecifier setName:](self, "setName:", v12);

  }
}

- (void)simSetupFlowCompleted:(unint64_t)a3
{
  NSObject *v4;
  _QWORD v5[5];
  id v6;
  uint8_t buf[8];

  -[PSUIAddCellularPlanSpecifier getLogger](self, "getLogger", a3);
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
  v5[2] = __54__PSUIAddCellularPlanSpecifier_simSetupFlowCompleted___block_invoke;
  v5[3] = &unk_24D501A20;
  objc_copyWeak(&v6, (id *)buf);
  v5[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __54__PSUIAddCellularPlanSpecifier_simSetupFlowCompleted___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v3 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 240));
    objc_msgSend(v3, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 256);
    *(_QWORD *)(v5 + 256) = 0;

    WeakRetained = v7;
  }

}

- (int64_t)userConsentResponse
{
  return 2;
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
    -[PSUIAddCellularPlanSpecifier propertyForKey:](self, "propertyForKey:", *MEMORY[0x24BE75D18]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessoryView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    originAccessoryView = self->_originAccessoryView;
    self->_originAccessoryView = v9;

  }
  -[PSUIAddCellularPlanSpecifier propertyForKey:](self, "propertyForKey:", v5);
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
    block[2] = __44__PSUIAddCellularPlanSpecifier_showSpinner___block_invoke;
    block[3] = &unk_24D501660;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  else
  {
    -[PSUIAddCellularPlanSpecifier getLogger](self, "getLogger");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2161C6000, v13, OS_LOG_TYPE_ERROR, "invalid table cell", buf, 2u);
    }

  }
}

void __44__PSUIAddCellularPlanSpecifier_showSpinner___block_invoke(uint64_t a1)
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

      if (self->_spinner)
        objc_msgSend(v8, "setAccessoryView:");

    }
  }
  if (objc_msgSend((id)*MEMORY[0x24BE75A18], "isEqualToString:", v7))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PSUIAddCellularPlanSpecifier showSpinner:](self, "showSpinner:", objc_msgSend(v6, "BOOLValue") ^ 1);
  }
  v11.receiver = self;
  v11.super_class = (Class)PSUIAddCellularPlanSpecifier;
  -[PSUIAddCellularPlanSpecifier setProperty:forKey:](&v11, sel_setProperty_forKey_, v6, v7);

}

- (void)_showWifiAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id WeakRetained;
  _QWORD v23[5];

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("NOT_CONNECTED_TO_INTERNET"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v5, "sf_isiPhone");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((_DWORD)v3)
    v8 = CFSTR("TURN_ON_WIFI_TO_SETUP_ESIM");
  else
    v8 = CFSTR("TURN_ON_WIFI_TO_SETUP_ESIM_IPAD");
  objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_24D5028C8, CFSTR("Gemini-Gemini"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v4, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "sf_isChinaRegionCellularDevice");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
    v15 = CFSTR("CHOOSE_WLAN");
  else
    v15 = CFSTR("CHOOSE_WIFI");
  objc_msgSend(v13, "localizedStringForKey:value:table:", v15, &stru_24D5028C8, CFSTR("Gemini-Gemini"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v16, 0, &__block_literal_global_23);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAction:", v17);
  v18 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __46__PSUIAddCellularPlanSpecifier__showWifiAlert__block_invoke_2;
  v23[3] = &unk_24D5017B8;
  v23[4] = self;
  objc_msgSend(v18, "actionWithTitle:style:handler:", v20, 1, v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addAction:", v21);
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v10, 1, 0);

}

void __46__PSUIAddCellularPlanSpecifier__showWifiAlert__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=WIFI"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "openSensitiveURL:withOptions:", v0, 0);

}

void __46__PSUIAddCellularPlanSpecifier__showWifiAlert__block_invoke_2(uint64_t a1)
{
  NSObject *v1;
  uint8_t v2[16];

  objc_msgSend(*(id *)(a1 + 32), "getLogger");
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_2161C6000, v1, OS_LOG_TYPE_DEFAULT, "user canceled setting up eSIM", v2, 2u);
  }

}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("add.cp"));
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
  return (TSSIMSetupFlow *)objc_getProperty(self, a2, 256, 1);
}

- (void)setFlow:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (BOOL)isRequestingFirstViewController
{
  return self->_isRequestingFirstViewController;
}

- (void)setIsRequestingFirstViewController:(BOOL)a3
{
  self->_isRequestingFirstViewController = a3;
}

- (BOOL)isEmbeddedInCarrierList
{
  return self->_isEmbeddedInCarrierList;
}

- (void)setIsEmbeddedInCarrierList:(BOOL)a3
{
  self->_isEmbeddedInCarrierList = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flow, 0);
  objc_destroyWeak((id *)&self->_firstViewController);
  objc_destroyWeak((id *)&self->_hostController);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong(&self->_originAccessoryView, 0);
  objc_storeStrong((id *)&self->_planManager, 0);
}

@end
