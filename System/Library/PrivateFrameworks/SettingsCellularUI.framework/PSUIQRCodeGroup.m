@implementation PSUIQRCodeGroup

- (PSUIQRCodeGroup)init
{
  objc_exception_throw((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE88]), "initWithName:reason:userInfo:", CFSTR("Unsupported initializer called"), CFSTR("Unsupported initializer called"), 0));
}

- (PSUIQRCodeGroup)initWithListController:(id)a3 groupSpecifier:(id)a4
{
  id v6;
  id v7;
  PSUIQRCodeGroup *v8;
  PSUIQRCodeGroup *v9;
  PSSpecifier *groupSpecifier;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PSUIQRCodeGroup;
  v8 = -[PSUIQRCodeGroup init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_listController, v6);
    objc_storeStrong((id *)&v9->_groupSpecifier, a4);
    groupSpecifier = v9->_groupSpecifier;
    v11 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("USE_QR_CODE_FOOTER"), &stru_24D5028C8, CFSTR("Cellular"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setProperty:forKey:](groupSpecifier, "setProperty:forKey:", v14, *MEMORY[0x24BE75A68]);

  }
  return v9;
}

- (id)specifiers
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("USE_QR_CODE"), &stru_24D5028C8, CFSTR("Cellular"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, self, 0, 0, 0, 13, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setButtonAction:", sel_scanQRCodePressed_);
  objc_msgSend(v3, "addObject:", v7);

  return v3;
}

- (void)simSetupFlowCompleted:(unint64_t)a3
{
  NSObject *v4;
  _QWORD block[4];
  id v6;
  _BYTE buf[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[PSUIQRCodeGroup getLogger](self, "getLogger", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[PSUIQRCodeGroup simSetupFlowCompleted:]";
    _os_log_impl(&dword_2161C6000, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__PSUIQRCodeGroup_simSetupFlowCompleted___block_invoke;
  block[3] = &unk_24D5017E8;
  objc_copyWeak(&v6, (id *)buf);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __41__PSUIQRCodeGroup_simSetupFlowCompleted___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained[3];
    WeakRetained[3] = 0;
    v4 = WeakRetained;

    v3 = objc_loadWeakRetained(v4 + 2);
    objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

    WeakRetained = v4;
  }

}

- (void)scanQRCodePressed:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  TSSIMSetupFlow *v9;
  TSSIMSetupFlow *flow;
  TSSIMSetupFlow *v11;
  _QWORD v12[5];
  id v13;
  id location;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  objc_msgSend(WeakRetained, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", 0);

  v15 = *MEMORY[0x24BE82B48];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 22);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE82B38], "flowWithOptions:", v8);
  v9 = (TSSIMSetupFlow *)objc_claimAutoreleasedReturnValue();
  flow = self->_flow;
  self->_flow = v9;

  -[TSSIMSetupFlow setDelegate:](self->_flow, "setDelegate:", self);
  location = 0;
  objc_initWeak(&location, self);
  v11 = self->_flow;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __37__PSUIQRCodeGroup_scanQRCodePressed___block_invoke;
  v12[3] = &unk_24D501810;
  objc_copyWeak(&v13, &location);
  v12[4] = self;
  -[TSSIMSetupFlow firstViewController:](v11, "firstViewController:", v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __37__PSUIQRCodeGroup_scanQRCodePressed___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id *v5;
  id v6;
  int v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint8_t v12[16];

  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained(WeakRetained + 2);
    v7 = objc_msgSend(v6, "isInModalPresentation");

    if (v7)
    {
      v8 = objc_loadWeakRetained(v5 + 2);
      objc_msgSend(v8, "navigationController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pushViewController:animated:", v3, 1);
    }
    else
    {
      v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v3);
      objc_msgSend(v8, "setModalPresentationStyle:", 2);
      v9 = objc_loadWeakRetained(v5 + 2);
      objc_msgSend(v9, "presentViewController:animated:completion:", v8, 1, 0);
    }

    v10 = objc_loadWeakRetained(v5 + 2);
    -[NSObject view](v10, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setUserInteractionEnabled:", 1);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "getLogger");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_2161C6000, v10, OS_LOG_TYPE_ERROR, "Invalid PSUIQRCodeGroup", v12, 2u);
    }
  }

}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("QRCodeGroup"));
}

- (PSSpecifier)groupSpecifier
{
  return self->_groupSpecifier;
}

- (void)setGroupSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_groupSpecifier, a3);
}

- (PSListController)listController
{
  return (PSListController *)objc_loadWeakRetained((id *)&self->_listController);
}

- (void)setListController:(id)a3
{
  objc_storeWeak((id *)&self->_listController, a3);
}

- (TSSIMSetupFlow)flow
{
  return (TSSIMSetupFlow *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFlow:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flow, 0);
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong((id *)&self->_groupSpecifier, 0);
}

@end
