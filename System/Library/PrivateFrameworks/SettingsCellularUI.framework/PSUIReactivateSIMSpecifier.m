@implementation PSUIReactivateSIMSpecifier

- (PSUIReactivateSIMSpecifier)initWithPlanUniversalReference:(id)a3 hostController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  PSUIReactivateSIMSpecifier *v15;
  PSUIReactivateSIMSpecifier *v16;
  void *v17;
  uint64_t v18;
  id planItem;
  void *v20;
  void *v21;
  NSObject *v22;
  objc_super v24;
  uint8_t buf[4];
  PSUIReactivateSIMSpecifier *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (_MergedGlobals_1_0 != -1)
    dispatch_once(&_MergedGlobals_1_0, &__block_literal_global_3);
  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "planFromReference:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "type");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
    v13 = CFSTR("ACTIVATE_ESIM");
  else
    v13 = CFSTR("CHECK_CELLULAR_CONNECTION");
  objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_24D5028C8, CFSTR("Cellular"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v24.receiver = self;
  v24.super_class = (Class)PSUIReactivateSIMSpecifier;
  v15 = -[PSUIReactivateSIMSpecifier initWithName:target:set:get:detail:cell:edit:](&v24, sel_initWithName_target_set_get_detail_cell_edit_, v14, 0, 0, 0, 0, 13, 0);
  v16 = v15;
  if (v15)
  {
    -[PSUIReactivateSIMSpecifier setIdentifier:](v15, "setIdentifier:", CFSTR("ACTIVATE_SIM"));
    -[PSUIReactivateSIMSpecifier setTarget:](v16, "setTarget:", v16);
    -[PSUIReactivateSIMSpecifier setButtonAction:](v16, "setButtonAction:", sel__activateSIMPressed_);
    objc_storeWeak((id *)&v16->_hostController, v7);
    if (v9)
    {
      objc_storeStrong(&v16->_planItem, v9);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && objc_msgSend(v16->_planItem, "isCheckingCellularConnectivity"))
      {
        -[PSUIReactivateSIMSpecifier setProperty:forKey:](v16, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
      }
    }
    else
    {
      +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "danglingPlanFromReference:", v6);
      v18 = objc_claimAutoreleasedReturnValue();

      planItem = v16->_planItem;
      v16->_planItem = (id)v18;

    }
    objc_msgSend(v16->_planItem, "iccid");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)qword_253E970F0, "objectForKey:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      -[PSUIReactivateSIMSpecifier getLogger](v16, "getLogger");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v16;
        _os_log_impl(&dword_2161C6000, v22, OS_LOG_TYPE_DEFAULT, "update delegate to %@", buf, 0xCu);
      }

      objc_msgSend(v21, "setDelegate:", v16);
    }

  }
  return v16;
}

void __76__PSUIReactivateSIMSpecifier_initWithPlanUniversalReference_hostController___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)qword_253E970F0;
  qword_253E970F0 = v0;

}

- (void)transferBackCanceled:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x24BE75A18];
  v5 = a3;
  -[PSUIReactivateSIMSpecifier setProperty:forKey:](self, "setProperty:forKey:", MEMORY[0x24BDBD1C8], v4);
  v6 = (void *)qword_253E970F0;
  objc_msgSend(v5, "iccid");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "removeObjectForKey:", v7);
}

- (void)transferBackFailed:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[PSUIReactivateSIMSpecifier getLogger](self, "getLogger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v7;
      _os_log_error_impl(&dword_2161C6000, v8, OS_LOG_TYPE_ERROR, "transfer back failed : %@", (uint8_t *)&v11, 0xCu);
    }

  }
  -[PSUIReactivateSIMSpecifier setProperty:forKey:](self, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
  v9 = (void *)qword_253E970F0;
  objc_msgSend(v6, "iccid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObjectForKey:", v10);

}

- (void)transferBackSuccessFrom:(id)a3 to:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id WeakRetained;

  v5 = (void *)qword_253E970F0;
  objc_msgSend(a3, "iccid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v6);

  WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  objc_msgSend(WeakRetained, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "popViewControllerAnimated:", 1);

}

- (void)setProperty:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  int v8;
  objc_super v9;

  v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PSUIReactivateSIMSpecifier;
  v7 = a4;
  -[PSUIReactivateSIMSpecifier setProperty:forKey:](&v9, sel_setProperty_forKey_, v6, v7);
  v8 = objc_msgSend((id)*MEMORY[0x24BE75A18], "isEqualToString:", v7, v9.receiver, v9.super_class);

  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v6, "BOOLValue"))
        -[PSUIReactivateSIMSpecifier _hideSpinner](self, "_hideSpinner");
      else
        -[PSUIReactivateSIMSpecifier _showSpinner](self, "_showSpinner");
    }
  }

}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("reactivate.sim"));
}

- (void)_activateSIMPressed:(id)a3
{
  NSObject *v4;
  id planItem;
  void *v6;
  void *v7;
  NSObject *WeakRetained;
  TransferBackPlanCache *v9;
  void *v10;
  TransferBackPlanCache *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[PSUIReactivateSIMSpecifier getLogger](self, "getLogger", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    planItem = self->_planItem;
    v12 = 138412290;
    v13 = planItem;
    _os_log_impl(&dword_2161C6000, v4, OS_LOG_TYPE_DEFAULT, "transfer back : %@", (uint8_t *)&v12, 0xCu);
  }

  -[PSUIReactivateSIMSpecifier setProperty:forKey:](self, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
  objc_msgSend(self->_planItem, "iccid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_253E970F0, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[PSUIReactivateSIMSpecifier getLogger](self, "getLogger");
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      _os_log_error_impl(&dword_2161C6000, WeakRetained, OS_LOG_TYPE_ERROR, "this should not happen.", (uint8_t *)&v12, 2u);
    }
  }
  else
  {
    v9 = [TransferBackPlanCache alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
    -[NSObject navigationController](WeakRetained, "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[TransferBackPlanCache initWithDelegate:navigationController:transferBackPlan:](v9, "initWithDelegate:navigationController:transferBackPlan:", self, v10, self->_planItem);
    objc_msgSend((id)qword_253E970F0, "setObject:forKeyedSubscript:", v11, v6);

  }
}

- (void)_showSpinner
{
  uint64_t v3;
  UIActivityIndicatorView *v4;
  UIActivityIndicatorView *spinner;
  void *v6;
  void *v7;
  id originAccessoryView;
  void *v9;
  void *v10;
  NSObject *v11;
  uint8_t v12[16];

  if (self->_spinner)
  {
    v3 = *MEMORY[0x24BE75D18];
  }
  else
  {
    v4 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
    spinner = self->_spinner;
    self->_spinner = v4;

    v3 = *MEMORY[0x24BE75D18];
    -[PSUIReactivateSIMSpecifier propertyForKey:](self, "propertyForKey:", *MEMORY[0x24BE75D18]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessoryView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    originAccessoryView = self->_originAccessoryView;
    self->_originAccessoryView = v7;

  }
  -[PSUIReactivateSIMSpecifier propertyForKey:](self, "propertyForKey:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "setAccessoryView:", self->_spinner);
    -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
  }
  else
  {
    -[PSUIReactivateSIMSpecifier getLogger](self, "getLogger");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_2161C6000, v11, OS_LOG_TYPE_ERROR, "invalid table cell", v12, 2u);
    }

  }
}

- (void)_hideSpinner
{
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  -[PSUIReactivateSIMSpecifier propertyForKey:](self, "propertyForKey:", *MEMORY[0x24BE75D18]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
    objc_msgSend(v3, "setAccessoryView:", self->_originAccessoryView);
  }
  else
  {
    -[PSUIReactivateSIMSpecifier getLogger](self, "getLogger");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_2161C6000, v4, OS_LOG_TYPE_ERROR, "invalid table cell", v5, 2u);
    }

  }
}

- (PSListController)hostController
{
  return (PSListController *)objc_loadWeakRetained((id *)&self->_hostController);
}

- (void)setHostController:(id)a3
{
  objc_storeWeak((id *)&self->_hostController, a3);
}

- (id)planItem
{
  return objc_getProperty(self, a2, 216, 1);
}

- (void)setPlanItem:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (id)originAccessoryView
{
  return objc_getProperty(self, a2, 224, 1);
}

- (void)setOriginAccessoryView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (UIActivityIndicatorView)spinner
{
  return (UIActivityIndicatorView *)objc_getProperty(self, a2, 232, 1);
}

- (void)setSpinner:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong(&self->_originAccessoryView, 0);
  objc_storeStrong(&self->_planItem, 0);
  objc_destroyWeak((id *)&self->_hostController);
}

@end
