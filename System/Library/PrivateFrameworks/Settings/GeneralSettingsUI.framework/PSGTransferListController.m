@implementation PSGTransferListController

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PSGTransferListController;
  -[PSGTransferListController viewDidLoad](&v2, sel_viewDidLoad);
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("PreBuddyText"), self, 0, 0, 0, -1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x24BE75948]);
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "effectiveBoolValueForSetting:", *MEMORY[0x24BE63770]);

    v9 = objc_alloc_init(MEMORY[0x24BDB4398]);
    objc_msgSend(v9, "aa_primaryAppleAccount");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = PSUsedByManagedAccount();
    v12 = (void *)MEMORY[0x24BE75590];
    PSG_LocalizedStringForReset(CFSTR("GET_STARTED"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v13, self, 0, 0, 0, 13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setProperty:forKey:", CFSTR("prebuddyBegin"), *MEMORY[0x24BE75AC0]);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", &unk_24F9D43C8, *MEMORY[0x24BE75860]);
    objc_msgSend(v14, "setButtonAction:", sel_beginPrebuddy_);
    v15 = v8 == 2 && v10 == 0;
    if (v15 || v11)
      objc_msgSend(v14, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
    objc_msgSend(v5, "addObject:", v6);
    objc_msgSend(v5, "addObject:", v14);
    v16 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)beginPrebuddy:(id)a3
{
  void *v4;
  _QWORD v5[5];

  objc_msgSend(MEMORY[0x24BE66C48], "sharedManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __43__PSGTransferListController_beginPrebuddy___block_invoke;
  v5[3] = &unk_24F9C8BF0;
  v5[4] = self;
  objc_msgSend(v4, "followupAction:", v5);

}

void __43__PSGTransferListController_beginPrebuddy___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[4];
  id v12;
  id buf[2];

  v3 = a2;
  _PSGLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_22E024000, v4, OS_LOG_TYPE_DEFAULT, "Initializing followup object", (uint8_t *)buf, 2u);
  }

  v5 = objc_alloc(MEMORY[0x24BE1B410]);
  objc_msgSend(MEMORY[0x24BE66C48], "baseFollowupItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithItem:", v6);

  objc_initWeak(buf, *(id *)(a1 + 32));
  v8 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __43__PSGTransferListController_beginPrebuddy___block_invoke_18;
  v11[3] = &unk_24F9C8BA0;
  objc_copyWeak(&v12, buf);
  objc_msgSend(v7, "setExtensionRequestedViewControllerPresentation:", v11);
  v9[0] = v8;
  v9[1] = 3221225472;
  v9[2] = __43__PSGTransferListController_beginPrebuddy___block_invoke_2;
  v9[3] = &unk_24F9C8BC8;
  objc_copyWeak(&v10, buf);
  v9[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v7, "handleExtensionBasedAction:completionWithUserInfo:", v3, v9);
  objc_msgSend(*(id *)(a1 + 32), "setPrebuddyActionHandler:", v7);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(buf);

}

void __43__PSGTransferListController_beginPrebuddy___block_invoke_18(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v3, 1, 0);

}

void __43__PSGTransferListController_beginPrebuddy___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id WeakRetained;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t v17[16];
  uint8_t buf[16];

  v4 = a3;
  _PSGLoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22E024000, v5, OS_LOG_TYPE_DEFAULT, "followup handler completion block", buf, 2u);
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE66C30]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "BOOLValue");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v9 = WeakRetained;
  if (v7)
  {
    _PSGLoggingFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_22E024000, v10, OS_LOG_TYPE_DEFAULT, "followup handler finished", v17, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "viewControllers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "table");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_scrollToTopIfPossible:", 0);

    v16 = (id)objc_msgSend(v12, "popToRootViewControllerAnimated:", 1);
  }
  else
  {
    objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);
  }
  objc_msgSend(v9, "setPrebuddyActionHandler:", 0);

}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("path"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("exitBuddy")) & 1) != 0
      || objc_msgSend(v8, "isEqualToString:", CFSTR("exitBuddyUpSellTradeIn")))
    {
      -[PSGTransferListController presentExitBuddyWithUpsellTradeIn:withCompletion:](self, "presentExitBuddyWithUpsellTradeIn:withCompletion:", objc_msgSend(v8, "isEqualToString:", CFSTR("exitBuddyUpSellTradeIn")), v7);
    }
    else
    {
      -[PSGTransferListController handleURL:withCompletion:](&v10, sel_handleURL_withCompletion_, v6, v7, v9.receiver, v9.super_class, self, PSGTransferListController);
    }
  }
  else
  {
    -[PSGTransferListController handleURL:withCompletion:](&v9, sel_handleURL_withCompletion_, v6, v7, self, PSGTransferListController, v10.receiver, v10.super_class);
  }

}

- (void)deviceFullErase:(id)a3
{
  -[PSGTransferListController presentExitBuddyWithUpsellTradeIn:withCompletion:](self, "presentExitBuddyWithUpsellTradeIn:withCompletion:", 0, 0);
}

- (void)presentExitBuddyWithUpsellTradeIn:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v6 = (void *)MEMORY[0x24BE2CFE8];
  v7 = a4;
  objc_msgSend(v6, "defaultConfiguration");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUpsellTradeIn:", v4);
  objc_msgSend(MEMORY[0x24BE2CFF0], "presentUsingParentViewController:configuration:completion:", self, v8, v7);

}

- (FLFollowUpActionHandler)prebuddyActionHandler
{
  return self->_prebuddyActionHandler;
}

- (void)setPrebuddyActionHandler:(id)a3
{
  objc_storeStrong((id *)&self->_prebuddyActionHandler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prebuddyActionHandler, 0);
}

@end
