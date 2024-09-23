@implementation TSTransferredViewController

- (TSTransferredViewController)initWithTransferredPlan:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  TSTransferredViewController *v22;
  void *v24;
  objc_super v25;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("planItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "phoneNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[TSUtilities formattedPhoneNumber:withCountryCode:](TSUtilities, "formattedPhoneNumber:withCountryCode:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deviceName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  _TSLogDomain();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[TSTransferredViewController initWithTransferredPlan:].cold.1((uint64_t)v4, v10);

  v11 = objc_msgSend(v7, "length");
  v12 = objc_msgSend(v9, "length");
  v13 = v12;
  if (v11)
  {
    v14 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v13)
    {
      objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("PLAN_TRANSFERRED_DETAIL_%@_%@"), &stru_24DEF4290, CFSTR("Localizable"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v9;
    }
    else
    {
      objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("PLAN_TRANSFERRED_DETAIL_NO_DEVICE_NAME_%@"), &stru_24DEF4290, CFSTR("Localizable"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "stringWithFormat:", v17, v7, v24);
  }
  else
  {
    if (!v12)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("PLAN_TRANSFERRED_DETAIL"), &stru_24DEF4290, CFSTR("Localizable"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    v18 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("PLAN_TRANSFERRED_DETAIL_NO_PHONENUMBER_%@"), &stru_24DEF4290, CFSTR("Localizable"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", v17, v9, v24);
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("PLAN_TRANSFERRED_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25.receiver = self;
  v25.super_class = (Class)TSTransferredViewController;
  v22 = -[TSTransferredViewController initWithTitle:detailText:icon:](&v25, sel_initWithTitle_detailText_icon_, v21, v19, 0);

  return v22;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TSTransferredViewController;
  -[TSOBWelcomeController viewDidLoad](&v14, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSTransferredViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v3);

  objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel__doneButtonTapped, 64);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_24DEF4290, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:forState:", v8, 0);

  -[TSTransferredViewController buttonTray](self, "buttonTray");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addButton:", v6);

  objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addTarget:action:forControlEvents:", self, sel__skipButtonTapped, 64);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("NOT_NOW"), &stru_24DEF4290, CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:forState:", v12, 0);

  -[TSTransferredViewController buttonTray](self, "buttonTray");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addButton:", v10);

}

- (void)_skipButtonTapped
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "viewControllerDidComplete:", self);

}

- (void)_doneButtonTapped
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "viewControllerDidComplete:", self);

}

- (TSSIMSetupFlowDelegate)delegate
{
  return (TSSIMSetupFlowDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithTransferredPlan:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = a1;
  v4 = 2080;
  v5 = "-[TSTransferredViewController initWithTransferredPlan:]";
  _os_log_debug_impl(&dword_21B647000, a2, OS_LOG_TYPE_DEBUG, "[Db] transferred plan: %@ @%s", (uint8_t *)&v2, 0x16u);
}

@end
