@implementation PSUICellularPlanConvertedController

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  PSUICellularPlanConvertedController *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  -[PSUICellularPlanConvertedController getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_debug_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEBUG, "dealloc : %@", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)PSUICellularPlanConvertedController;
  -[PSUICellularPlanConvertedController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  PSUICellularPlanUniversalReference *v4;
  PSUICellularPlanUniversalReference *planReference;
  void *v6;
  CTCellularPlanItem *v7;
  CTCellularPlanItem *planItem;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PSUICellularPlanConvertedController;
  -[PSUICellularPlanConvertedController viewDidLoad](&v10, sel_viewDidLoad);
  -[PSUICellularPlanConvertedController specifier](self, "specifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "propertyForKey:", *MEMORY[0x24BE75958]);
  v4 = (PSUICellularPlanUniversalReference *)objc_claimAutoreleasedReturnValue();
  planReference = self->_planReference;
  self->_planReference = v4;

  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "planFromReferenceSafe:", self->_planReference);
  v7 = (CTCellularPlanItem *)objc_claimAutoreleasedReturnValue();
  planItem = self->_planItem;
  self->_planItem = v7;

  -[PSUICellularPlanConvertedController _updatePlanStatus:](self, "_updatePlanStatus:", self->_planItem);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__cellularPlanChanged_, CFSTR("PSUICellularPlanChanged"), 0);

}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  PSUICellularPlanUniversalReference *v8;
  PSUICellularPlanUniversalReference *planReference;
  void *v10;
  CTCellularPlanItem *v11;
  CTCellularPlanItem *planItem;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint8_t v23[16];
  uint8_t buf[16];

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    -[PSUICellularPlanConvertedController getLogger](self, "getLogger");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "(re)loading specifiers", buf, 2u);
    }

    v6 = (void *)objc_opt_new();
    if (!self->_planReference)
    {
      -[PSUICellularPlanConvertedController specifier](self, "specifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "propertyForKey:", *MEMORY[0x24BE75958]);
      v8 = (PSUICellularPlanUniversalReference *)objc_claimAutoreleasedReturnValue();
      planReference = self->_planReference;
      self->_planReference = v8;

      +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "planFromReferenceSafe:", self->_planReference);
      v11 = (CTCellularPlanItem *)objc_claimAutoreleasedReturnValue();
      planItem = self->_planItem;
      self->_planItem = v11;

    }
    -[PSUICellularPlanConvertedController _removeSIMSpecifier](self, "_removeSIMSpecifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSpecifier:", v13);

    objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSpecifier:", v14);

    if (self->_planItem)
    {
      -[PSUICellularPlanConvertedController _simTypeSpecifier](self, "_simTypeSpecifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addSpecifier:", v15);

      -[PSUICellularPlanConvertedController _statusSpecifier](self, "_statusSpecifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addSpecifier:", v16);

      -[PSUICellularPlanConvertedController _labelSpecifier](self, "_labelSpecifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addSpecifier:", v17);

      -[PSUICellularPlanConvertedController _phoneNumberSpecifier](self, "_phoneNumberSpecifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addSpecifier:", v18);

      if (-[CTCellularPlanItem transferredStatus](self->_planItem, "transferredStatus") == 4)
        -[PSUICellularPlanConvertedController _turnOnThisLineSpecifier](self, "_turnOnThisLineSpecifier");
      else
        -[PSUICellularPlanConvertedController _reactivateSIMSpecifier](self, "_reactivateSIMSpecifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addSpecifier:", v20);

      -[PSUICellularPlanConvertedController _maybeAddRemoveCellularPlanSpecifier:](self, "_maybeAddRemoveCellularPlanSpecifier:", v6);
    }
    else
    {
      -[PSUICellularPlanConvertedController getLogger](self, "getLogger");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_2161C6000, v19, OS_LOG_TYPE_DEFAULT, "No plan with the given plan reference", v23, 2u);
      }

    }
    objc_msgSend(MEMORY[0x24BE856B8], "logSpecifiers:origin:", v6, CFSTR("[PSUICellularPlanConvertedController specifiers] end"));
    v21 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v6;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)_planLabel:(id)a3
{
  void *v3;
  void *v4;

  -[CTCellularPlanItem userLabel](self->_planItem, "userLabel", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_status:(id)a3
{
  return self->_planStatus;
}

- (id)_phoneNumber:(id)a3
{
  void *v3;
  void *v4;

  -[CTCellularPlanItem phoneNumber](self->_planItem, "phoneNumber", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SettingsCellularUtils formattedPhoneNumber:](SettingsCellularUtils, "formattedPhoneNumber:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_removeSIMSpecifier
{
  return -[PSUIRemoveSIMWarningSpecifier initWithPlanUniversalReference:]([PSUIRemoveSIMWarningSpecifier alloc], "initWithPlanUniversalReference:", self->_planReference);
}

- (id)_simTypeSpecifier
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("CARRIER_NAME"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CTCellularPlanItem type](self->_planItem, "type");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    v7 = CFSTR("eSIM");
  else
    v7 = CFSTR("SIM");
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_24D5028C8, CFSTR("Cellular"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setName:", v8);

  return v3;
}

- (id)_statusSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("STATUS"), &stru_24D5028C8, CFSTR("Cellular"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, self, 0, sel__status_, 0, 4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
  objc_storeWeak((id *)&self->_weakStatusSpecifier, v6);
  return v6;
}

- (id)_labelSpecifier
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLAN_LABEL"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v8, self, 0, sel__planLabel_, 0, 4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
  }
  return v5;
}

- (id)_phoneNumberSpecifier
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1
    || (-[CTCellularPlanItem phoneNumber](self->_planItem, "phoneNumber"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "length"),
        v5,
        !v6))
  {
    v10 = 0;
  }
  else
  {
    v7 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("MY_NUMBER"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v9, self, 0, sel__phoneNumber_, 0, 4, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
  }
  return v10;
}

- (id)_turnOnThisLineSpecifier
{
  PSUITurnOnThisLineSpecifier *v3;
  PSUICellularPlanUniversalReference *planReference;
  void *v5;
  void *v6;
  void *v7;
  PSUITurnOnThisLineSpecifier *v8;

  if (-[CTCellularPlanItem isSelectable](self->_planItem, "isSelectable"))
  {
    v3 = [PSUITurnOnThisLineSpecifier alloc];
    planReference = self->_planReference;
    objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSUICoreTelephonyCallCache sharedInstance](PSUICoreTelephonyCallCache, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PSUITurnOnThisLineSpecifier initWithPlanUniversalReference:cellularPlanManager:planManagerCache:callCache:hostController:isActivating:](v3, "initWithPlanUniversalReference:cellularPlanManager:planManagerCache:callCache:hostController:isActivating:", planReference, v5, v6, v7, self, 0);

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)_reactivateSIMSpecifier
{
  PSUIReactivateSIMSpecifier *v3;

  v3 = -[PSUIReactivateSIMSpecifier initWithPlanUniversalReference:hostController:]([PSUIReactivateSIMSpecifier alloc], "initWithPlanUniversalReference:hostController:", self->_planReference, self);
  objc_storeWeak((id *)&self->_weakReactivateSpecifier, v3);
  return v3;
}

- (void)_maybeAddRemoveCellularPlanSpecifier:(id)a3
{
  void *v4;
  PSUIRemoveCellularPlanSpecifier *v5;
  PSUICellularPlanUniversalReference *planReference;
  void *v7;
  void *v8;
  PSUIRemoveCellularPlanSpecifier *v9;
  id v10;

  v10 = a3;
  if (-[CTCellularPlanItem type](self->_planItem, "type") == 2)
  {
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("BOTTOM_SPACER_GROUP"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v4);

    v5 = [PSUIRemoveCellularPlanSpecifier alloc];
    planReference = self->_planReference;
    objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PSUIRemoveCellularPlanSpecifier initWithPlanUniversalReference:cellularPlanManager:planManagerCache:hostController:popViewControllerOnPlanDeletion:](v5, "initWithPlanUniversalReference:cellularPlanManager:planManagerCache:hostController:popViewControllerOnPlanDeletion:", planReference, v7, v8, self, 1);

    objc_msgSend(v10, "addObject:", v9);
  }

}

- (void)_cellularPlanChanged:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "planItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "iccid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTCellularPlanItem iccid](self->_planItem, "iccid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqualToString:", v12);

        if (v13)
        {
          objc_storeStrong((id *)&self->_planItem, v10);
          -[PSUICellularPlanConvertedController _updatePlanStatus:](self, "_updatePlanStatus:", v10);
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)_updatePlanStatus:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PSUICellularPlanConvertedController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __57__PSUICellularPlanConvertedController__updatePlanStatus___block_invoke;
  v6[3] = &unk_24D501638;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __57__PSUICellularPlanConvertedController__updatePlanStatus___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v2 = objc_msgSend(*(id *)(a1 + 32), "transferredStatus");
  v3 = *(void **)(a1 + 40);
  if (v2)
  {
    objc_msgSend(v3, "_updateStatusSpecifier:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "_updateReactivateSpecifier:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(v3, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "visibleViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 40);

    if (v5 == v6)
    {
      objc_msgSend(*(id *)(a1 + 40), "navigationController");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v7 = (id)objc_msgSend(v8, "popViewControllerAnimated:", 1);

    }
  }
}

- (void)_updateStatusSpecifier:(id)a3
{
  int v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *planStatus;
  id WeakRetained;
  void *v10;
  void *v11;
  NSObject *v12;
  uint8_t v13[16];

  v4 = objc_msgSend(a3, "isCheckingCellularConnectivity");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CHECKING"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
  else
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("INACTIVE"), &stru_24D5028C8, CFSTR("Cellular"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  planStatus = self->_planStatus;
  self->_planStatus = v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_weakStatusSpecifier);
  v10 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "propertyForKey:", *MEMORY[0x24BE75D18]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setValue:", self->_planStatus);

  }
  else
  {
    -[PSUICellularPlanConvertedController getLogger](self, "getLogger");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_error_impl(&dword_2161C6000, v12, OS_LOG_TYPE_ERROR, "invalid status specifier", v13, 2u);
    }

  }
}

- (void)_updateReactivateSpecifier:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint8_t v13[16];

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_weakReactivateSpecifier);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "propertyForKey:", *MEMORY[0x24BE75D18]);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "isCheckingCellularConnectivity");
    v9 = *MEMORY[0x24BE75A18];
    if (v8)
    {
      objc_msgSend(v6, "setProperty:forKey:", MEMORY[0x24BDBD1C0], v9);
      -[NSObject titleLabel](v7, "titleLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = 0;
    }
    else
    {
      objc_msgSend(v6, "setProperty:forKey:", MEMORY[0x24BDBD1C8], v9);
      -[NSObject titleLabel](v7, "titleLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = 1;
    }
    objc_msgSend(v10, "setEnabled:", v12);

  }
  else
  {
    -[PSUICellularPlanConvertedController getLogger](self, "getLogger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_error_impl(&dword_2161C6000, v7, OS_LOG_TYPE_ERROR, "invalid status specifier", v13, 2u);
    }
  }

}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("CellularPlanConvertedController"));
}

- (CTCellularPlanItem)planItem
{
  return self->_planItem;
}

- (void)setPlanItem:(id)a3
{
  objc_storeStrong((id *)&self->_planItem, a3);
}

- (PSUICellularPlanUniversalReference)planReference
{
  return self->_planReference;
}

- (void)setPlanReference:(id)a3
{
  objc_storeStrong((id *)&self->_planReference, a3);
}

- (PSSpecifier)weakStatusSpecifier
{
  return (PSSpecifier *)objc_loadWeakRetained((id *)&self->_weakStatusSpecifier);
}

- (void)setWeakStatusSpecifier:(id)a3
{
  objc_storeWeak((id *)&self->_weakStatusSpecifier, a3);
}

- (PSSpecifier)weakReactivateSpecifier
{
  return (PSSpecifier *)objc_loadWeakRetained((id *)&self->_weakReactivateSpecifier);
}

- (void)setWeakReactivateSpecifier:(id)a3
{
  objc_storeWeak((id *)&self->_weakReactivateSpecifier, a3);
}

- (NSString)planStatus
{
  return (NSString *)objc_getProperty(self, a2, 1408, 1);
}

- (void)setPlanStatus:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1408);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_planStatus, 0);
  objc_destroyWeak((id *)&self->_weakReactivateSpecifier);
  objc_destroyWeak((id *)&self->_weakStatusSpecifier);
  objc_storeStrong((id *)&self->_planReference, 0);
  objc_storeStrong((id *)&self->_planItem, 0);
}

@end
