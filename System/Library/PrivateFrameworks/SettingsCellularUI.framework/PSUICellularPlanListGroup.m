@implementation PSUICellularPlanListGroup

- (PSUICellularPlanListGroup)initWithListController:(id)a3 groupSpecifier:(id)a4
{
  id v5;
  PSUICellularPlanListGroup *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v5 = a4;
  v10.receiver = self;
  v10.super_class = (Class)PSUICellularPlanListGroup;
  v6 = -[PSUICellularPlanListGroup init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLANS"), &stru_24D5028C8, CFSTR("Cellular"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setName:", v8);

  }
  return v6;
}

- (PSUICellularPlanListGroup)initWithListController:(id)a3 groupSpecifier:(id)a4 isPrivateNetworkPlansList:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  PSUICellularPlanListGroup *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v5 = a5;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PSUICellularPlanListGroup;
  v8 = -[PSUICellularPlanListGroup init](&v14, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v5)
    {
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("NON_PUBLIC_NETWORK_PLANS"), &stru_24D5028C8, CFSTR("Cellular"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setName:", v11);

      v8->_isPrivateNetworkPlansList = 1;
    }
    else
    {
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLANS"), &stru_24D5028C8, CFSTR("Cellular"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setName:", v12);

    }
  }

  return v8;
}

- (id)specifiers
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t k;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v54;
  id v55;
  uint64_t v56;
  void *v57;
  id obj;
  id obja;
  id objb;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  uint8_t v75[128];
  uint8_t buf[4];
  const char *v77;
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v61 = (id)objc_opt_new();
  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "planItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v71;
    obj = (id)*MEMORY[0x24BE75948];
    v54 = *MEMORY[0x24BE75CE8];
    v56 = *MEMORY[0x24BE75958];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v71 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
        if (objc_msgSend(v10, "settingsMode") && objc_msgSend(v10, "settingsMode") != 1)
        {
          if (objc_msgSend(v10, "settingsMode") == 2)
          {
            if (self->_isPrivateNetworkPlansList)
              continue;
          }
          else
          {
            -[PSUICellularPlanListGroup getLogger](self, "getLogger");
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315138;
              v77 = "-[PSUICellularPlanListGroup specifiers]";
              _os_log_error_impl(&dword_2161C6000, v11, OS_LOG_TYPE_ERROR, "%s unexpected settings mode", buf, 0xCu);
            }

          }
        }
        else if (!self->_isPrivateNetworkPlansList)
        {
          continue;
        }
        -[PSUICellularPlanListGroup getLogger](self, "getLogger");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v77 = (const char *)v10;
          _os_log_impl(&dword_2161C6000, v12, OS_LOG_TYPE_DEFAULT, "planItem: %@", buf, 0xCu);
        }

        objc_msgSend(v10, "plan");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "subscriptionStatusOverride");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToNumber:", &unk_24D51C4B8);

        if (v15)
        {
          v16 = (void *)MEMORY[0x24BE75590];
          objc_msgSend(v10, "name");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v17, self, 0, sel_planSpecifierDetailText_, 0, 16, 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else if (objc_msgSend(v10, "isInstalling"))
        {
          v19 = (void *)MEMORY[0x24BE75590];
          objc_msgSend(v10, "name");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v20, self, 0, sel_planSpecifierDetailText_, objc_opt_class(), 3, 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else if (objc_msgSend(v10, "transferredStatus") == 4)
        {
          v21 = (void *)MEMORY[0x24BE75590];
          objc_msgSend(v10, "name");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v22, self, 0, sel_planSpecifierDetailText_, objc_opt_class(), 2, 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "isSelected");
        }
        else
        {
          v23 = objc_msgSend(v10, "transferredStatus");
          v24 = (void *)MEMORY[0x24BE75590];
          objc_msgSend(v10, "name");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v25, self, 0, sel_planSpecifierDetailText_, objc_opt_class(), 2, 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v23)
            objc_msgSend(v10, "isSelected");
        }
        objc_msgSend(v18, "setProperty:forKey:", objc_opt_class(), obj);
        +[PSUICellularPlanUniversalReference referenceFromPlanItem:](PSUICellularPlanUniversalReference, "referenceFromPlanItem:", v10);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setProperty:forKey:", v26, v56);

        +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "subscriptionContextForPlanItem:cachedSubscriptionContexts:", v10, 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setProperty:forKey:", v28, v54);

        objc_msgSend(v61, "addObject:", v18);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
    }
    while (v7);
  }
  v57 = v5;

  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "danglingPlanItems");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v31 = v30;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
  if (!v32)
    goto LABEL_41;
  v33 = v32;
  v34 = *(_QWORD *)v67;
  obja = (id)*MEMORY[0x24BE75948];
  v35 = *MEMORY[0x24BE75958];
  do
  {
    for (j = 0; j != v33; ++j)
    {
      if (*(_QWORD *)v67 != v34)
        objc_enumerationMutation(v31);
      v37 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * j);
      if (self->_isPrivateNetworkPlansList)
      {
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * j), "isPrivateNetworkSim"))
          continue;
        if (self->_isPrivateNetworkPlansList)
          goto LABEL_38;
      }
      if ((objc_msgSend(v37, "isPrivateNetworkSim") & 1) == 0)
      {
LABEL_38:
        objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, self, 0, sel_danglingPlanSpecifierDetailText_, 0, 3, 0);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setProperty:forKey:", objc_opt_class(), obja);
        +[PSUICellularPlanUniversalReference referenceFromDanglingPlanItem:](PSUICellularPlanUniversalReference, "referenceFromDanglingPlanItem:", v37);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setProperty:forKey:", v39, v35);

        objc_msgSend(v38, "setButtonAction:", sel_danglingPlanPressed_);
        objc_msgSend(v61, "addObject:", v38);

      }
    }
    v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
  }
  while (v33);
LABEL_41:

  if (!self->_isPrivateNetworkPlansList)
  {
    v55 = v31;
    +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "plansPendingTransfer");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    objb = v41;
    v42 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v63;
      v45 = *MEMORY[0x24BE75948];
      v46 = *MEMORY[0x24BE75958];
      do
      {
        for (k = 0; k != v43; ++k)
        {
          if (*(_QWORD *)v63 != v44)
            objc_enumerationMutation(objb);
          v48 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * k);
          v49 = (void *)MEMORY[0x24BE75590];
          objc_msgSend(v48, "carrierName");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v50, self, 0, 0, objc_opt_class(), 2, 0);
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          if ((unint64_t)objc_msgSend(v48, "status") <= 3)
            objc_msgSend(v51, "setProperty:forKey:", objc_opt_class(), v45);
          +[PSUICellularPlanUniversalReference referenceFromCellularPlanPendingTransfer:](PSUICellularPlanUniversalReference, "referenceFromCellularPlanPendingTransfer:", v48);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "setProperty:forKey:", v52, v46);

          objc_msgSend(v61, "addObject:", v51);
        }
        v43 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
      }
      while (v43);
    }

    v31 = v55;
  }

  return v61;
}

- (id)planSpecifierDetailText:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  int v13;
  const __CFString *v14;
  void *v15;
  int v16;

  objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75958]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "planFromReferenceSafe:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "transferredStatus"))
  {
    objc_msgSend(v5, "plan");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "status") == 14)
    {
      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "sf_isiPhone");

      if (v8)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        v11 = CFSTR("ACTIVATING");
LABEL_10:
        v14 = CFSTR("Gemini-Gemini");
LABEL_16:
        objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_24D5028C8, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_17;
      }
    }
    else
    {

    }
  }
  if (!objc_msgSend(v5, "transferredStatus"))
  {
    v16 = objc_msgSend(v5, "isSelected");
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v16)
      v11 = CFSTR("ON_SINGLE_CELLULAR_PLAN");
    else
      v11 = CFSTR("OFF_SINGLE_CELLULAR_PLAN");
    v14 = CFSTR("Cellular");
    goto LABEL_16;
  }
  if (objc_msgSend(v5, "isCheckingCellularConnectivity"))
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "sf_isiPhone");

    if (v13)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = CFSTR("CHECKING");
      goto LABEL_10;
    }
  }
  v15 = 0;
LABEL_17:

  return v15;
}

- (id)danglingPlanSpecifierDetailText:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("NO_SIM"), &stru_24D5028C8, CFSTR("Cellular"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)danglingPlanPressed:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75958]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "danglingPlanFromReference:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didSelectDanglingPlan:", v4);

}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("PlanListGroup"));
}

- (BOOL)isPrivateNetworkPlansList
{
  return self->_isPrivateNetworkPlansList;
}

- (void)setIsPrivateNetworkPlansList:(BOOL)a3
{
  self->_isPrivateNetworkPlansList = a3;
}

@end
