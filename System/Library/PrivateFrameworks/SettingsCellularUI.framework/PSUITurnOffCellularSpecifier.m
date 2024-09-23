@implementation PSUITurnOffCellularSpecifier

- (PSUITurnOffCellularSpecifier)initWithContext:(id)a3 callCache:(id)a4 hostController:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  PSUITurnOffCellularSpecifier *v14;
  CXCallObserver *v15;
  CXCallObserver *callObserver;
  void *v17;
  void *v18;
  uint64_t v19;
  NSNumber *cellularOff;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("TURN_OFF_CELLULAR"), &stru_24D5028C8, CFSTR("Cellular"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22.receiver = self;
  v22.super_class = (Class)PSUITurnOffCellularSpecifier;
  v14 = -[PSUITurnOffCellularSpecifier initWithName:target:set:get:detail:cell:edit:](&v22, sel_initWithName_target_set_get_detail_cell_edit_, v13, self, sel_setCellularOff_specifier_, sel_isCellularOff_, 0, 6, 0);

  if (v14)
  {
    objc_storeWeak((id *)&v14->_hostController, v11);
    objc_storeStrong((id *)&v14->_subscriptionContext, a3);
    objc_storeStrong((id *)&v14->_callCache, a4);
    v15 = (CXCallObserver *)objc_alloc_init(MEMORY[0x24BDB7898]);
    callObserver = v14->_callObserver;
    v14->_callObserver = v15;

    -[CXCallObserver setDelegate:queue:](v14->_callObserver, "setDelegate:queue:", v14, 0);
    -[PSUITurnOffCellularSpecifier setSwitchEnabled](v14, "setSwitchEnabled");
    v17 = (void *)MEMORY[0x24BDD16E0];
    +[PSUICoreTelephonyCapabilitiesCache sharedInstance](PSUICoreTelephonyCapabilitiesCache, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "numberWithBool:", objc_msgSend(v18, "getTurnOffCellular:", v9));
    v19 = objc_claimAutoreleasedReturnValue();
    cellularOff = v14->_cellularOff;
    v14->_cellularOff = (NSNumber *)v19;

  }
  return v14;
}

- (void)setSwitchEnabled
{
  uint64_t v3;

  if (-[PSUICoreTelephonyCallCache isAnyCallActive](self->_callCache, "isAnyCallActive"))
    v3 = MEMORY[0x24BDBD1C0];
  else
    v3 = MEMORY[0x24BDBD1C8];
  -[PSUITurnOffCellularSpecifier setProperty:forKey:](self, "setProperty:forKey:", v3, *MEMORY[0x24BE75A18]);
}

- (void)setCellularOff:(id)a3 specifier:(id)a4
{
  int v6;
  void *v7;
  int v8;
  id WeakRetained;
  id v10;

  v10 = a4;
  v6 = objc_msgSend(a3, "BOOLValue");
  -[PSUITurnOffCellularSpecifier cellularOff](self, "cellularOff");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if (v6 == v8)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
    objc_msgSend(WeakRetained, "reloadSpecifier:", v10);

  }
  else if (v6)
  {
    -[PSUITurnOffCellularSpecifier _showPopup](self, "_showPopup");
  }
  else
  {
    -[PSUITurnOffCellularSpecifier _disableCellular:](self, "_disableCellular:", 0);
  }

}

- (void)callObserver:(id)a3 callChanged:(id)a4
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__PSUITurnOffCellularSpecifier_callObserver_callChanged___block_invoke;
  block[3] = &unk_24D501660;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __57__PSUITurnOffCellularSpecifier_callObserver_callChanged___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "hostController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadSpecifiers");

}

- (void)_showPopup
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
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD block[5];
  id v21;
  _QWORD v22[5];
  _QWORD v23[4];
  id v24;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x24BEBD3B0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("TURN_OFF_CELLULAR_TITLE"), &stru_24D5028C8, CFSTR("Cellular"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SFLocalizableWAPIStringKeyForKey();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", v7, &stru_24D5028C8, CFSTR("Cellular"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v5, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_24D5028C8, CFSTR("Cellular"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __42__PSUITurnOffCellularSpecifier__showPopup__block_invoke;
  v23[3] = &unk_24D501790;
  objc_copyWeak(&v24, &location);
  objc_msgSend(v10, "actionWithTitle:style:handler:", v12, 0, v23);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v14);

  v15 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24D5028C8, CFSTR("Cellular"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v13;
  v22[1] = 3221225472;
  v22[2] = __42__PSUITurnOffCellularSpecifier__showPopup__block_invoke_2;
  v22[3] = &unk_24D5017B8;
  v22[4] = self;
  objc_msgSend(v15, "actionWithTitle:style:handler:", v17, 0, v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v18);

  block[0] = v13;
  block[1] = 3221225472;
  block[2] = __42__PSUITurnOffCellularSpecifier__showPopup__block_invoke_3;
  block[3] = &unk_24D501638;
  block[4] = self;
  v21 = v9;
  v19 = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __42__PSUITurnOffCellularSpecifier__showPopup__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_disableCellular:", 1);

}

void __42__PSUITurnOffCellularSpecifier__showPopup__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 224));
  objc_msgSend(WeakRetained, "reloadSpecifiers");

}

void __42__PSUITurnOffCellularSpecifier__showPopup__block_invoke_3(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 224));
  objc_msgSend(WeakRetained, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);

}

- (void)_disableCellular:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  id WeakRetained;

  v3 = a3;
  if (a3)
    v5 = MEMORY[0x24BDBD1C8];
  else
    v5 = MEMORY[0x24BDBD1C0];
  -[PSUITurnOffCellularSpecifier setCellularOff:](self, "setCellularOff:", v5);
  +[PSUICoreTelephonyCapabilitiesCache sharedInstance](PSUICoreTelephonyCapabilitiesCache, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUITurnOffCellularSpecifier subscriptionContext](self, "subscriptionContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTurnOffCellular:enabled:", v7, v3);

  WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  objc_msgSend(WeakRetained, "reloadSpecifiers");

}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("TurnOffCellular"));
}

- (CTXPCServiceSubscriptionContext)subscriptionContext
{
  return self->_subscriptionContext;
}

- (void)setSubscriptionContext:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionContext, a3);
}

- (PSUICoreTelephonyCallCache)callCache
{
  return self->_callCache;
}

- (void)setCallCache:(id)a3
{
  objc_storeStrong((id *)&self->_callCache, a3);
}

- (PSListController)hostController
{
  return (PSListController *)objc_loadWeakRetained((id *)&self->_hostController);
}

- (void)setHostController:(id)a3
{
  objc_storeWeak((id *)&self->_hostController, a3);
}

- (CXCallObserver)callObserver
{
  return self->_callObserver;
}

- (void)setCallObserver:(id)a3
{
  objc_storeStrong((id *)&self->_callObserver, a3);
}

- (NSNumber)cellularOff
{
  return self->_cellularOff;
}

- (void)setCellularOff:(id)a3
{
  objc_storeStrong((id *)&self->_cellularOff, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellularOff, 0);
  objc_storeStrong((id *)&self->_callObserver, 0);
  objc_destroyWeak((id *)&self->_hostController);
  objc_storeStrong((id *)&self->_callCache, 0);
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
}

@end
