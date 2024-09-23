@implementation PSUITurnOnThisLineSpecifier

- (PSUITurnOnThisLineSpecifier)initWithPlanUniversalReference:(id)a3 cellularPlanManager:(id)a4 planManagerCache:(id)a5 callCache:(id)a6 hostController:(id)a7 isActivating:(BOOL)a8
{
  _BOOL4 v8;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  PSUITurnOnThisLineSpecifier *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  CXCallObserver *v28;
  CXCallObserver *callObserver;
  id v31;
  id v32;
  id v33;
  id v34;
  objc_super v35;
  objc_super v36;
  uint8_t buf[4];
  const __CFString *v38;
  uint64_t v39;

  v8 = a8;
  v39 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v34 = a6;
  v33 = a7;
  -[PSUITurnOnThisLineSpecifier getLogger](self, "getLogger");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = CFSTR("NO");
    if (v8)
      v19 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v38 = v19;
    _os_log_impl(&dword_2161C6000, v18, OS_LOG_TYPE_DEFAULT, "Activating: %@", buf, 0xCu);
  }

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("TURN_ON_THIS_LINE"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v36.receiver = self;
    v36.super_class = (Class)PSUITurnOnThisLineSpecifier;
    v22 = -[PSUITurnOnThisLineSpecifier initWithName:target:set:get:detail:cell:edit:](&v36, sel_initWithName_target_set_get_detail_cell_edit_, v21, self, 0, 0, 0, 3, 0);

    -[PSUITurnOnThisLineSpecifier setProperty:forKey:](v22, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  }
  else
  {
    v31 = v17;
    v32 = v16;
    objc_msgSend(v17, "planFromReference:", v15);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("TURN_ON_THIS_LINE"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v23, "transferredStatus"))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("USE_THIS_LINE"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
      v27 = objc_claimAutoreleasedReturnValue();

      v25 = (void *)v27;
    }
    v35.receiver = self;
    v35.super_class = (Class)PSUITurnOnThisLineSpecifier;
    v22 = -[PSUITurnOnThisLineSpecifier initWithName:target:set:get:detail:cell:edit:](&v35, sel_initWithName_target_set_get_detail_cell_edit_, v25, self, sel_setPlanEnabled_specifier_, sel_isPlanEnabled_, 0, 6, 0);

    v17 = v31;
    v16 = v32;
  }
  if (v22)
  {
    objc_storeStrong((id *)&v22->_planReference, a3);
    objc_storeStrong((id *)&v22->_cellularPlanManager, a4);
    objc_storeStrong((id *)&v22->_planManagerCache, a5);
    objc_storeWeak((id *)&v22->_hostController, v33);
    objc_storeStrong((id *)&v22->_callCache, a6);
    v28 = (CXCallObserver *)objc_alloc_init(MEMORY[0x24BDB7898]);
    callObserver = v22->_callObserver;
    v22->_callObserver = v28;

    -[CXCallObserver setDelegate:queue:](v22->_callObserver, "setDelegate:queue:", v22, 0);
    -[PSUITurnOnThisLineSpecifier setProperty:forKey:](v22, "setProperty:forKey:", v15, *MEMORY[0x24BE75958]);
    -[PSUITurnOnThisLineSpecifier setSwitchEnabled](v22, "setSwitchEnabled");
  }

  return v22;
}

- (void)setSwitchEnabled
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8[16];

  -[PSUICellularPlanManagerCache planFromReference:](self->_planManagerCache, "planFromReference:", self->_planReference);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PSUICoreTelephonyCallCache isAnyCallActive](self->_callCache, "isAnyCallActive")
    || objc_msgSend(v3, "transferredStatus") == 4)
  {
LABEL_7:
    v5 = *MEMORY[0x24BE75A18];
    goto LABEL_8;
  }
  if (-[PSUITurnOnThisLineSpecifier isPlanStatusActivatingPostinstall:](self, "isPlanStatusActivatingPostinstall:", v3))
  {
    -[PSUITurnOnThisLineSpecifier getLogger](self, "getLogger");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_2161C6000, v4, OS_LOG_TYPE_DEFAULT, "Plan status is ActivatingPostinstall", v8, 2u);
    }

    goto LABEL_7;
  }
  v7 = objc_msgSend(v3, "transferredStatus");
  v5 = *MEMORY[0x24BE75A18];
  if (!v7)
  {
    v6 = MEMORY[0x24BDBD1C8];
    goto LABEL_9;
  }
LABEL_8:
  v6 = MEMORY[0x24BDBD1C0];
LABEL_9:
  -[PSUITurnOnThisLineSpecifier setProperty:forKey:](self, "setProperty:forKey:", v6, v5);

}

- (id)isPlanEnabled:(id)a3
{
  void *v3;
  void *v4;

  -[PSUICellularPlanManagerCache planFromReference:](self->_planManagerCache, "planFromReference:", self->_planReference);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v3, "isSelected"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isTransferredPlan:(id)a3
{
  return objc_msgSend(a3, "transferredStatus") != 0;
}

- (BOOL)isPlanStatusActivatingPostinstall:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "plan");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "status") == 14;

  return v4;
}

- (void)setPlanEnabled:(id)a3 specifier:(id)a4
{
  PSUICellularPlanManagerCache *planManagerCache;
  PSUICellularPlanUniversalReference *planReference;
  id v8;
  void *v9;
  uint64_t v10;
  PSUITurnOnThisLineSpecifier *v11;
  id WeakRetained;
  uint64_t v13;
  id v14;

  v14 = a4;
  planManagerCache = self->_planManagerCache;
  planReference = self->_planReference;
  v8 = a3;
  -[PSUICellularPlanManagerCache planFromReference:](planManagerCache, "planFromReference:", planReference);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "BOOLValue");

  if ((_DWORD)v10 == objc_msgSend(v9, "isSelected"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
    objc_msgSend(WeakRetained, "reloadSpecifier:", v14);

    goto LABEL_9;
  }
  if (!-[PSUITurnOnThisLineSpecifier isTransferredPlan:](self, "isTransferredPlan:", v9))
  {
    v11 = self;
    v13 = v10;
LABEL_8:
    -[PSUITurnOnThisLineSpecifier _useLine:forPlan:](v11, "_useLine:forPlan:", v13, v9);
    goto LABEL_9;
  }
  v11 = self;
  if (!(_DWORD)v10)
  {
    v13 = 0;
    goto LABEL_8;
  }
  -[PSUITurnOnThisLineSpecifier _showPromptFor:](self, "_showPromptFor:", v9);
LABEL_9:

}

- (void)callObserver:(id)a3 callChanged:(id)a4
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__PSUITurnOnThisLineSpecifier_callObserver_callChanged___block_invoke;
  block[3] = &unk_24D501660;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __56__PSUITurnOnThisLineSpecifier_callObserver_callChanged___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "hostController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadSpecifiers");

}

- (id)_getAlertMessage:(id)a3 onPad:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;

  v4 = a4;
  v5 = a3;
  v6 = v5;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("USE_THIS_LINE_DETAIL_IPAD"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "phoneNumber");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (v10)
    {
      v11 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("USE_THIS_LINE_DETAIL_WITH_PHONE_NUMBER_%@"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "phoneNumber");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[SettingsCellularUtils formattedPhoneNumber:](SettingsCellularUtils, "formattedPhoneNumber:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", v12, v14);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = objc_msgSend(v6, "type");
      v16 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v17;
      if (v15 == 2)
        v18 = CFSTR("USE_THIS_LINE_DETAIL_CARRIER_ESIM_%@");
      else
        v18 = CFSTR("USE_THIS_LINE_DETAIL_CARRIER_SIM_%@");
      objc_msgSend(v17, "localizedStringForKey:value:table:", v18, &stru_24D5028C8, CFSTR("Gemini-Gemini"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "carrierName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", v12, v19);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v8;
}

- (void)_showPromptFor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD block[5];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id location[2];

  v4 = a3;
  location[0] = 0;
  objc_initWeak(location, self);
  v5 = (void *)MEMORY[0x24BEBD3B0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("USE_THIS_LINE_TITLE"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  -[PSUITurnOnThisLineSpecifier _getAlertMessage:onPad:](self, "_getAlertMessage:onPad:", v4, (v9 & 0xFFFFFFFFFFFFFFFBLL) == 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v7, v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __46__PSUITurnOnThisLineSpecifier__showPromptFor___block_invoke;
  v27[3] = &unk_24D502018;
  objc_copyWeak(&v29, location);
  v16 = v4;
  v28 = v16;
  objc_msgSend(v12, "actionWithTitle:style:handler:", v14, 0, v27);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v17);

  v18 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v15;
  v25[1] = 3221225472;
  v25[2] = __46__PSUITurnOnThisLineSpecifier__showPromptFor___block_invoke_2;
  v25[3] = &unk_24D501790;
  objc_copyWeak(&v26, location);
  objc_msgSend(v18, "actionWithTitle:style:handler:", v20, 0, v25);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v21);

  block[0] = v15;
  block[1] = 3221225472;
  block[2] = __46__PSUITurnOnThisLineSpecifier__showPromptFor___block_invoke_3;
  block[3] = &unk_24D501638;
  block[4] = self;
  v24 = v11;
  v22 = v11;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v29);
  objc_destroyWeak(location);

}

void __46__PSUITurnOnThisLineSpecifier__showPromptFor___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_useLine:forPlan:", 1, *(_QWORD *)(a1 + 32));

}

void __46__PSUITurnOnThisLineSpecifier__showPromptFor___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_turnItOff");

}

void __46__PSUITurnOnThisLineSpecifier__showPromptFor___block_invoke_3(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 240));
  objc_msgSend(WeakRetained, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);

}

- (void)_turnItOff
{
  id WeakRetained;

  -[PSUITurnOnThisLineSpecifier setProperty:forKey:](self, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  objc_msgSend(WeakRetained, "reloadSpecifiers");

}

- (void)_useLine:(BOOL)a3 forPlan:(id)a4
{
  _BOOL8 v4;
  __CFString *v6;
  NSObject *v7;
  const __CFString *v8;
  __CFString *v9;
  NSObject *v10;
  _QWORD block[5];
  uint8_t buf[4];
  const __CFString *v13;
  __int16 v14;
  __CFString *v15;
  uint64_t v16;

  v4 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  v6 = (__CFString *)a4;
  -[PSUITurnOnThisLineSpecifier getLogger](self, "getLogger");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("deselected");
    if (v4)
      v8 = CFSTR("selected");
    *(_DWORD *)buf = 138412546;
    v13 = v8;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_2161C6000, v7, OS_LOG_TYPE_DEFAULT, "%@ plan %@", buf, 0x16u);
  }

  -[CTCellularPlanManager didSelectPlanItem:isEnable:](self->_cellularPlanManager, "didSelectPlanItem:isEnable:", v6, v4);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[PSUITurnOnThisLineSpecifier getLogger](self, "getLogger");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v13 = v6;
      v14 = 2112;
      v15 = v9;
      _os_log_error_impl(&dword_2161C6000, v10, OS_LOG_TYPE_ERROR, "Failed to select plan: %@, error: %@", buf, 0x16u);
    }

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48__PSUITurnOnThisLineSpecifier__useLine_forPlan___block_invoke;
    block[3] = &unk_24D501660;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }

}

void __48__PSUITurnOnThisLineSpecifier__useLine_forPlan___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 240));
  objc_msgSend(WeakRetained, "reloadSpecifier:", *(_QWORD *)(a1 + 32));

}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("TurnOnThisLine"));
}

- (PSUICellularPlanUniversalReference)planReference
{
  return self->_planReference;
}

- (void)setPlanReference:(id)a3
{
  objc_storeStrong((id *)&self->_planReference, a3);
}

- (CTCellularPlanManager)cellularPlanManager
{
  return self->_cellularPlanManager;
}

- (void)setCellularPlanManager:(id)a3
{
  objc_storeStrong((id *)&self->_cellularPlanManager, a3);
}

- (PSUICellularPlanManagerCache)planManagerCache
{
  return self->_planManagerCache;
}

- (void)setPlanManagerCache:(id)a3
{
  objc_storeStrong((id *)&self->_planManagerCache, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callObserver, 0);
  objc_destroyWeak((id *)&self->_hostController);
  objc_storeStrong((id *)&self->_callCache, 0);
  objc_storeStrong((id *)&self->_planManagerCache, 0);
  objc_storeStrong((id *)&self->_cellularPlanManager, 0);
  objc_storeStrong((id *)&self->_planReference, 0);
}

@end
