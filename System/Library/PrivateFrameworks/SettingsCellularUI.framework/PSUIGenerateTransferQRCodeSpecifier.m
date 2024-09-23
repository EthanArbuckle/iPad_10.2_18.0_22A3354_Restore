@implementation PSUIGenerateTransferQRCodeSpecifier

+ (id)keyFor:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a3;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@"), objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)specifierWithHostController:(id)a3 iccid:(id)a4 carrierName:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  PSUIGenerateTransferQRCodeSpecifier *v13;
  PSUIGenerateTransferQRCodeSpecifier *v14;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  +[PSUIGenerateTransferQRCodeSpecifier keyFor:](PSUIGenerateTransferQRCodeSpecifier, "keyFor:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSFlowHostCache sharedInstance](SSFlowHostCache, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    v13 = v12;
  else
    v13 = -[PSUIGenerateTransferQRCodeSpecifier initWithHostController:iccid:carrierName:]([PSUIGenerateTransferQRCodeSpecifier alloc], "initWithHostController:iccid:carrierName:", v7, v8, v9);
  v14 = v13;

  return v14;
}

- (PSUIGenerateTransferQRCodeSpecifier)initWithHostController:(id)a3 iccid:(id)a4 carrierName:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PSUIGenerateTransferQRCodeSpecifier *v13;
  PSUIGenerateTransferQRCodeSpecifier *v14;
  id v16;
  id v17;
  objc_super v18;

  v8 = a3;
  v17 = a4;
  v16 = a5;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("GENERATE_TRANSFER_QRCODE"), &stru_24D5028C8, CFSTR("Cellular"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("GENERATE_TRANSFER_QRCODE"), &stru_24D5028C8, CFSTR("Cellular"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v18.receiver = self;
  v18.super_class = (Class)PSUIGenerateTransferQRCodeSpecifier;
  v13 = -[PSUIGenerateTransferQRCodeSpecifier initWithName:target:set:get:detail:cell:edit:](&v18, sel_initWithName_target_set_get_detail_cell_edit_, v10, 0, 0, 0, 0, 13, 0);
  v14 = v13;
  if (v13)
  {
    -[PSUIGenerateTransferQRCodeSpecifier setIdentifier:](v13, "setIdentifier:", v12);
    -[PSUIGenerateTransferQRCodeSpecifier setTarget:](v14, "setTarget:", v14);
    -[PSUIGenerateTransferQRCodeSpecifier setButtonAction:](v14, "setButtonAction:", sel_generateTransferQRCodeCellPressed_);
    objc_storeWeak((id *)&v14->_hostController, v8);
    objc_storeStrong((id *)&v14->_iccid, a4);
    objc_storeStrong((id *)&v14->_carrierName, a5);
  }

  return v14;
}

- (void)generateTransferQRCodeCellPressed:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSString *iccid;
  uint64_t v10;
  TSSIMSetupFlow *v11;
  TSSIMSetupFlow *flow;
  TSSIMSetupFlow *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t buf[8];
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (self->_flow)
  {
    -[PSUIGenerateTransferQRCodeSpecifier getLogger](self, "getLogger");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2161C6000, v6, OS_LOG_TYPE_DEFAULT, "duplicate request to launch SimSetupSupport", buf, 2u);
    }
  }
  else
  {
    objc_msgSend(v4, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
    v18[0] = *MEMORY[0x24BE82B48];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x24BE82B58];
    iccid = self->_iccid;
    v19[0] = v7;
    v19[1] = iccid;
    v10 = *MEMORY[0x24BE82B40];
    v18[1] = v8;
    v18[2] = v10;
    v19[2] = self->_carrierName;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
    v6 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE82B38], "flowWithOptions:", v6);
    v11 = (TSSIMSetupFlow *)objc_claimAutoreleasedReturnValue();
    flow = self->_flow;
    self->_flow = v11;

    -[TSSIMSetupFlow setDelegate:](self->_flow, "setDelegate:", self);
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    v13 = self->_flow;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __73__PSUIGenerateTransferQRCodeSpecifier_generateTransferQRCodeCellPressed___block_invoke;
    v14[3] = &unk_24D5027D8;
    v14[4] = self;
    objc_copyWeak(&v16, (id *)buf);
    v15 = v5;
    -[TSSIMSetupFlow firstViewController:](v13, "firstViewController:", v14);

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }

}

void __73__PSUIGenerateTransferQRCodeSpecifier_generateTransferQRCodeCellPressed___block_invoke(id *a1, void *a2)
{
  id v3;
  NSObject *WeakRetained;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 6);
    objc_msgSend(a1[4], "getLogger");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (WeakRetained)
    {
      if (v6)
      {
        v7 = objc_opt_class();
        -[NSObject iccid](WeakRetained, "iccid");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412546;
        v16 = v7;
        v17 = 2112;
        v18 = v8;
        _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "present %@: for iccid: %@", (uint8_t *)&v15, 0x16u);

      }
      -[NSObject iccid](WeakRetained, "iccid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[PSUIGenerateTransferQRCodeSpecifier keyFor:](PSUIGenerateTransferQRCodeSpecifier, "keyFor:", v9);
      v5 = objc_claimAutoreleasedReturnValue();

      +[SSFlowHostCache sharedInstance](SSFlowHostCache, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", WeakRetained, v5);

      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v3);
      objc_msgSend(v11, "setModalPresentationStyle:", 2);
      -[NSObject hostController](WeakRetained, "hostController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "presentViewController:animated:completion:", v11, 1, 0);

      objc_msgSend(a1[5], "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
    }
    else if (v6)
    {
      v15 = 138412290;
      v16 = (uint64_t)v3;
      _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "invalid specifier. skip present : %@", (uint8_t *)&v15, 0xCu);
    }

  }
  else
  {
    objc_msgSend(a1[4], "getLogger");
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_loadWeakRetained(a1 + 6);
      objc_msgSend(v13, "iccid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = (uint64_t)v14;
      _os_log_impl(&dword_2161C6000, WeakRetained, OS_LOG_TYPE_DEFAULT, "invalid view for qr code with iccid: %@", (uint8_t *)&v15, 0xCu);

    }
  }

}

- (void)showSpinner:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  UIActivityIndicatorView *v6;
  UIActivityIndicatorView *spinner;
  _QWORD block[5];

  v3 = a3;
  if (!self->_spinner)
  {
    v6 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
    spinner = self->_spinner;
    self->_spinner = v6;

    if (v3)
      goto LABEL_3;
LABEL_5:
    -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
    goto LABEL_6;
  }
  if (!a3)
    goto LABEL_5;
LABEL_3:
  -[PSUIGenerateTransferQRCodeSpecifier propertyForKey:](self, "propertyForKey:", *MEMORY[0x24BE75D18]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessoryView:", self->_spinner);

  -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
LABEL_6:
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__PSUIGenerateTransferQRCodeSpecifier_showSpinner___block_invoke;
  block[3] = &unk_24D501660;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __51__PSUIGenerateTransferQRCodeSpecifier_showSpinner___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 216));
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
      -[PSUIGenerateTransferQRCodeSpecifier showSpinner:](self, "showSpinner:", objc_msgSend(v6, "BOOLValue") ^ 1);
  }
  v11.receiver = self;
  v11.super_class = (Class)PSUIGenerateTransferQRCodeSpecifier;
  -[PSUIGenerateTransferQRCodeSpecifier setProperty:forKey:](&v11, sel_setProperty_forKey_, v6, v7);

}

- (void)simSetupFlowCompleted:(unint64_t)a3
{
  _QWORD v5[5];
  id v6[2];
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __61__PSUIGenerateTransferQRCodeSpecifier_simSetupFlowCompleted___block_invoke;
  v5[3] = &unk_24D5019D0;
  objc_copyWeak(v6, &location);
  v5[4] = self;
  v6[1] = (id)a3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);
  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

void __61__PSUIGenerateTransferQRCodeSpecifier_simSetupFlowCompleted___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "hostController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentedViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

    objc_msgSend(*(id *)(a1 + 32), "getLogger");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 48);
      v12 = 134217984;
      v13 = v7;
      _os_log_impl(&dword_2161C6000, v6, OS_LOG_TYPE_DEFAULT, "simSetupFlowCompleted with completionType:%ld", (uint8_t *)&v12, 0xCu);
    }

    v8 = (void *)v3[28];
    v3[28] = 0;

    objc_msgSend(v3, "iccid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSUIGenerateTransferQRCodeSpecifier keyFor:](PSUIGenerateTransferQRCodeSpecifier, "keyFor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    +[SSFlowHostCache sharedInstance](SSFlowHostCache, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectForKey:", v10);

  }
}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("trqr.cp"));
}

- (PSListController)hostController
{
  return (PSListController *)objc_loadWeakRetained((id *)&self->_hostController);
}

- (void)setHostController:(id)a3
{
  objc_storeWeak((id *)&self->_hostController, a3);
}

- (BOOL)popViewControllerOnPlanDeletion
{
  return self->_popViewControllerOnPlanDeletion;
}

- (void)setPopViewControllerOnPlanDeletion:(BOOL)a3
{
  self->_popViewControllerOnPlanDeletion = a3;
}

- (TSSIMSetupFlow)flow
{
  return (TSSIMSetupFlow *)objc_getProperty(self, a2, 224, 1);
}

- (void)setFlow:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (NSString)iccid
{
  return self->_iccid;
}

- (NSString)carrierName
{
  return self->_carrierName;
}

- (UIActivityIndicatorView)spinner
{
  return (UIActivityIndicatorView *)objc_getProperty(self, a2, 248, 1);
}

- (void)setSpinner:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_carrierName, 0);
  objc_storeStrong((id *)&self->_iccid, 0);
  objc_storeStrong((id *)&self->_flow, 0);
  objc_destroyWeak((id *)&self->_hostController);
}

@end
