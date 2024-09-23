@implementation PSUIRemoveCellularPlanSpecifier

- (PSUIRemoveCellularPlanSpecifier)initWithPlanUniversalReference:(id)a3 cellularPlanManager:(id)a4 planManagerCache:(id)a5 hostController:(id)a6 popViewControllerOnPlanDeletion:(BOOL)a7
{
  id v13;
  id v14;
  char isKindOfClass;
  void *v16;
  void *v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v20;
  PSUIRemoveCellularPlanSpecifier *v21;
  PSUIRemoveCellularPlanSpecifier *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v36;
  id v37;
  id v38;
  objc_super v39;

  v13 = a3;
  v38 = a4;
  v37 = a5;
  v14 = a6;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if ((isKindOfClass & 1) != 0)
  {
    v18 = CFSTR("DELETE");
    v19 = CFSTR("Cellular");
  }
  else
  {
    v18 = CFSTR("DELETE_ESIM");
    v19 = CFSTR("Gemini-Gemini");
  }
  objc_msgSend(v16, "localizedStringForKey:value:table:", v18, &stru_24D5028C8, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v39.receiver = self;
  v39.super_class = (Class)PSUIRemoveCellularPlanSpecifier;
  v21 = -[PSUIRemoveCellularPlanSpecifier initWithName:target:set:get:detail:cell:edit:](&v39, sel_initWithName_target_set_get_detail_cell_edit_, v20, self, 0, 0, 0, 13, 0);
  v22 = v21;
  if (v21)
  {
    v36 = v13;
    objc_storeStrong((id *)&v21->_planReference, a3);
    objc_storeStrong((id *)&v22->_cellularPlanManager, a4);
    objc_storeStrong((id *)&v22->_planManagerCache, a5);
    objc_storeWeak((id *)&v22->_hostController, v14);
    v22->_popViewControllerOnPlanDeletion = a7;
    -[PSUIRemoveCellularPlanSpecifier setProperty:forKey:](v22, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
    -[PSUIRemoveCellularPlanSpecifier setIdentifier:](v22, "setIdentifier:", CFSTR("REMOVE_PLAN_BUTTON_ID"));
    -[PSUICellularPlanManagerCache planFromReference:](v22->_planManagerCache, "planFromReference:", v22->_planReference);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "plan");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "carrierName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "phoneNumber");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("DELETE_ESIM"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSConfirmationSpecifier setTitle:](v22, "setTitle:", v28);

    if (objc_msgSend(v25, "length") && objc_msgSend(v26, "length"))
    {
      v29 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("DELETE_ESIM_MESSAGE_CARRIER_%@_%@"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stringWithFormat:", v31, v26, v25);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSConfirmationSpecifier setPrompt:](v22, "setPrompt:", v32);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("DELETE_ESIM_MESSAGE"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSConfirmationSpecifier setPrompt:](v22, "setPrompt:", v31);
    }

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSConfirmationSpecifier setCancelButton:](v22, "setCancelButton:", v34);

    -[PSUIRemoveCellularPlanSpecifier setProperty:forKey:](v22, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75978]);
    -[PSUIRemoveCellularPlanSpecifier setConfirmationAction:](v22, "setConfirmationAction:", sel_removeCellularPlan_);

    v13 = v36;
  }

  return v22;
}

- (void)alignLeft
{
  -[PSUIRemoveCellularPlanSpecifier setProperty:forKey:](self, "setProperty:forKey:", &unk_24D51C458, *MEMORY[0x24BE75860]);
}

- (void)removeCellularPlan:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id WeakRetained;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[PSUIRemoveCellularPlanSpecifier getLogger](self, "getLogger", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[PSUIRemoveCellularPlanSpecifier removeCellularPlan:]";
    _os_log_impl(&dword_2161C6000, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BE754D0], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, self, 0, 0, 0, 13, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DELETE_ESIM"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v7);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("DELETE_ESIM_CONFIRMATION"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPrompt:", v9);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCancelButton:", v11);

  objc_msgSend(v5, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75978]);
  objc_msgSend(v5, "setConfirmationAction:", sel_removeCellularPlanConfirmed_);
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  objc_msgSend(WeakRetained, "showConfirmationViewForSpecifier:", v5);

}

- (void)removeCellularPlanConfirmed:(id)a3
{
  id v4;
  NSObject *v5;
  CTCellularPlanManager *cellularPlanManager;
  uint64_t v7;
  _QWORD v8[6];
  id v9;
  id location;
  __int128 buf;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PSUIRemoveCellularPlanSpecifier getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[PSUIRemoveCellularPlanSpecifier removeCellularPlanConfirmed:]";
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__2;
  v14 = __Block_byref_object_dispose__2;
  v15 = 0;
  -[PSUICellularPlanManagerCache planFromReference:](self->_planManagerCache, "planFromReference:", self->_planReference);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  location = 0;
  objc_initWeak(&location, self);
  cellularPlanManager = self->_cellularPlanManager;
  v7 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __63__PSUIRemoveCellularPlanSpecifier_removeCellularPlanConfirmed___block_invoke;
  v8[3] = &unk_24D502350;
  v8[4] = self;
  v8[5] = &buf;
  objc_copyWeak(&v9, &location);
  -[CTCellularPlanManager didDeletePlanItem:completion:](cellularPlanManager, "didDeletePlanItem:completion:", v7, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  _Block_object_dispose(&buf, 8);

}

void __63__PSUIRemoveCellularPlanSpecifier_removeCellularPlanConfirmed___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id WeakRetained;
  char v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD block[4];
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((a2 & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v7 = objc_msgSend(WeakRetained, "popViewControllerOnPlanDeletion");

    v8 = MEMORY[0x24BDAC760];
    if ((v7 & 1) == 0)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __63__PSUIRemoveCellularPlanSpecifier_removeCellularPlanConfirmed___block_invoke_28;
      block[3] = &unk_24D5017E8;
      objc_copyWeak(&v17, (id *)(a1 + 48));
      dispatch_async(MEMORY[0x24BDAC9B8], block);
      objc_destroyWeak(&v17);
    }
    v9 = objc_loadWeakRetained((id *)(a1 + 48));
    v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = __63__PSUIRemoveCellularPlanSpecifier_removeCellularPlanConfirmed___block_invoke_2;
    v14[3] = &unk_24D5017E8;
    objc_copyWeak(&v15, (id *)(a1 + 48));
    objc_msgSend(v9, "prepareToShowRemap:completion:", v10, v14);

    objc_destroyWeak(&v15);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "getLogger");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      v19 = v12;
      v20 = 2112;
      v21 = v5;
      _os_log_impl(&dword_2161C6000, v11, OS_LOG_TYPE_DEFAULT, "Failed to remove plan item %@. Error: %@", buf, 0x16u);
    }

    v13 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v13, "_didRemoveSessionComplete");

  }
}

void __63__PSUIRemoveCellularPlanSpecifier_removeCellularPlanConfirmed___block_invoke_28(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "hostController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadSpecifiers");

}

void __63__PSUIRemoveCellularPlanSpecifier_removeCellularPlanConfirmed___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didRemoveSessionComplete");

}

- (void)_didRemoveSessionComplete
{
  _QWORD v3[4];
  id v4;
  id location;

  if (-[PSUIRemoveCellularPlanSpecifier popViewControllerOnPlanDeletion](self, "popViewControllerOnPlanDeletion"))
  {
    location = 0;
    objc_initWeak(&location, self);
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __60__PSUIRemoveCellularPlanSpecifier__didRemoveSessionComplete__block_invoke;
    v3[3] = &unk_24D5017E8;
    objc_copyWeak(&v4, &location);
    dispatch_async(MEMORY[0x24BDAC9B8], v3);
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

void __60__PSUIRemoveCellularPlanSpecifier__didRemoveSessionComplete__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "hostController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "popViewControllerAnimated:", 1);

}

- (void)prepareToShowRemap:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  PSUIRemoveCellularPlanSpecifier *v21;
  void (**v22)(_QWORD);
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  -[PSUIRemoveCellularPlanSpecifier getLogger](self, "getLogger");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v29 = "-[PSUIRemoveCellularPlanSpecifier prepareToShowRemap:completion:]";
    _os_log_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[PSUICellularPlanManagerCache planItems](self->_planManagerCache, "planItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11 == 1)
    goto LABEL_17;
  v21 = self;
  v22 = v7;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[PSUICellularPlanManagerCache planItems](self->_planManagerCache, "planItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (objc_msgSend(v17, "isSelected"))
        {
          objc_msgSend(v6, "iccid");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "iccid");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v18, "isEqualToString:", v19);

          if ((v20 & 1) == 0)
            objc_msgSend(v9, "addObject:", v17);
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v14);
  }

  if (!objc_msgSend(v9, "count"))
  {
    v7 = v22;
LABEL_17:
    v7[2](v7);
    goto LABEL_18;
  }
  v7 = v22;
  -[PSUIRemoveCellularPlanSpecifier showRemapFor:withList:completion:](v21, "showRemapFor:withList:completion:", v6, v9, v22);
LABEL_18:

}

- (void)showRemapFor:(id)a3 withList:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  uint64_t v27;
  id v28;
  char *__ptr32 *v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  _QWORD block[5];
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t);
  void *v62;
  id v63;
  _QWORD v64[5];
  id v65;
  void *v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _QWORD v72[5];
  id v73;
  id v74;
  id v75;
  uint8_t v76[128];
  uint8_t buf[4];
  const char *v78;
  __int16 v79;
  uint64_t v80;
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v55 = a5;
  -[PSUIRemoveCellularPlanSpecifier getLogger](self, "getLogger");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v78 = "-[PSUIRemoveCellularPlanSpecifier showRemapFor:withList:completion:]";
    v79 = 2048;
    v80 = objc_msgSend(v9, "count");
    _os_log_impl(&dword_2161C6000, v10, OS_LOG_TYPE_DEFAULT, "%s active plans is  %lu", buf, 0x16u);
  }

  v11 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("REMAP_DETAIL_MESSAGE"), &stru_24D5028C8, CFSTR("Cellular"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", v13);
  v14 = objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x24BEBD3B0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("REMAP"), &stru_24D5028C8, CFSTR("Cellular"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "alertControllerWithTitle:message:preferredStyle:", v17, v14, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend(v9, "count");
  v20 = MEMORY[0x24BDAC760];
  v50 = (void *)v14;
  v51 = v9;
  if (v19 == 1)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("REMAP_TO_SINGLE_SIM"), &stru_24D5028C8, CFSTR("Cellular"));
    v22 = objc_claimAutoreleasedReturnValue();

    v23 = (void *)MEMORY[0x24BEBD3A8];
    v72[0] = v20;
    v72[1] = 3221225472;
    v72[2] = __68__PSUIRemoveCellularPlanSpecifier_showRemapFor_withList_completion___block_invoke;
    v72[3] = &unk_24D502378;
    v72[4] = self;
    v73 = v8;
    v74 = v9;
    v24 = v55;
    v75 = v55;
    objc_msgSend(v23, "actionWithTitle:style:handler:", v22, 0, v72);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addAction:", v25);

    v26 = 0x24BDD1000;
    v27 = v20;
    v28 = (id)v22;
    v29 = &off_216246000;
  }
  else
  {
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v28 = v9;
    v26 = 0x24BDD1000uLL;
    v56 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
    if (v56)
    {
      v52 = *(_QWORD *)v69;
      v53 = v28;
      v54 = v18;
      do
      {
        for (i = 0; i != v56; ++i)
        {
          v31 = v8;
          if (*(_QWORD *)v69 != v52)
            objc_enumerationMutation(v28);
          v32 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
          v33 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(*(id *)(v26 + 1160), "bundleForClass:", objc_opt_class());
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("REMAP_TO_SIM_%@"), &stru_24D5028C8, CFSTR("Cellular"));
          v35 = v26;
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "userLabel");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "label");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "stringWithFormat:", v36, v38, v50, v51);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          v40 = (void *)MEMORY[0x24BEBD3A8];
          v64[0] = MEMORY[0x24BDAC760];
          v64[1] = 3221225472;
          v64[2] = __68__PSUIRemoveCellularPlanSpecifier_showRemapFor_withList_completion___block_invoke_2;
          v64[3] = &unk_24D502378;
          v64[4] = self;
          v8 = v31;
          v65 = v31;
          v66 = v32;
          v67 = v55;
          v41 = v40;
          v26 = v35;
          objc_msgSend(v41, "actionWithTitle:style:handler:", v39, 0, v64);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v54;
          objc_msgSend(v54, "addAction:", v42);

          v28 = v53;
        }
        v56 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
      }
      while (v56);
      v24 = v55;
      v27 = MEMORY[0x24BDAC760];
      v29 = &off_216246000;
    }
    else
    {
      v24 = v55;
      v27 = MEMORY[0x24BDAC760];
      v29 = &off_216246000;
    }
  }

  v43 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(*(id *)(v26 + 1160), "bundleForClass:", objc_opt_class());
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24D5028C8, CFSTR("Cellular"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v27;
  v60 = *((_QWORD *)v29 + 211);
  v46 = v60;
  v61 = __68__PSUIRemoveCellularPlanSpecifier_showRemapFor_withList_completion___block_invoke_3;
  v62 = &unk_24D5023A0;
  v63 = v24;
  v47 = v24;
  objc_msgSend(v43, "actionWithTitle:style:handler:", v45, 1, &v59);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addAction:", v48);

  block[0] = v27;
  block[1] = v46;
  block[2] = __68__PSUIRemoveCellularPlanSpecifier_showRemapFor_withList_completion___block_invoke_4;
  block[3] = &unk_24D501638;
  block[4] = self;
  v58 = v18;
  v49 = v18;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __68__PSUIRemoveCellularPlanSpecifier_showRemapFor_withList_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remap:to:completion:", v3, v4, *(_QWORD *)(a1 + 56));

}

uint64_t __68__PSUIRemoveCellularPlanSpecifier_showRemapFor_withList_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "remap:to:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __68__PSUIRemoveCellularPlanSpecifier_showRemapFor_withList_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __68__PSUIRemoveCellularPlanSpecifier_showRemapFor_withList_completion___block_invoke_4(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 280));
  objc_msgSend(WeakRetained, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);

}

- (void)remap:(id)a3 to:(id)a4 completion:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  CTCellularPlanManager *cellularPlanManager;
  PSUIRemoveCellularPlanSpecifier *v22;
  void (**v23)(_QWORD);
  id v24;
  _QWORD v25[4];
  void (**v26)(_QWORD);
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v24 = a4;
  v23 = (void (**)(_QWORD))a5;
  -[PSUIRemoveCellularPlanSpecifier getLogger](self, "getLogger");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v33 = "-[PSUIRemoveCellularPlanSpecifier remap:to:completion:]";
    _os_log_impl(&dword_2161C6000, v9, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v22 = self;
  -[CTCellularPlanManager danglingPlanItemsShouldUpdate:](self->_cellularPlanManager, "danglingPlanItemsShouldUpdate:", 0);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v15, "iccid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "iccid");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "isEqualToString:", v17);

        if (v18)
        {
          v19 = v23;
          cellularPlanManager = v22->_cellularPlanManager;
          v25[0] = MEMORY[0x24BDAC760];
          v25[1] = 3221225472;
          v25[2] = __55__PSUIRemoveCellularPlanSpecifier_remap_to_completion___block_invoke;
          v25[3] = &unk_24D5023C8;
          v26 = v23;
          v20 = v24;
          -[CTCellularPlanManager remapSimLabel:to:completion:](cellularPlanManager, "remapSimLabel:to:completion:", v15, v24, v25);

          goto LABEL_13;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v12)
        continue;
      break;
    }
  }

  v19 = v23;
  v23[2](v23);
  v20 = v24;
LABEL_13:

}

uint64_t __55__PSUIRemoveCellularPlanSpecifier_remap_to_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("RemoveCellularPlanSpecifier"));
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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hostController);
  objc_storeStrong((id *)&self->_planManagerCache, 0);
  objc_storeStrong((id *)&self->_cellularPlanManager, 0);
  objc_storeStrong((id *)&self->_planReference, 0);
}

@end
