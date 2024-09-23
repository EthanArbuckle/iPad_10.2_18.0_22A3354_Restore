@implementation STAllowanceDetailListController

- (STAllowanceDetailListController)initWithCoordinator:(id)a3
{
  id v5;
  STAllowanceDetailListController *v6;
  STAllowanceDetailListController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STAllowanceDetailListController;
  v6 = -[STAllowanceDetailListController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_coordinator, a3);

  return v7;
}

- (BOOL)canBeShownFromSuspendedState
{
  return 0;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STAllowanceDetailListController;
  -[STAllowanceDetailListController loadView](&v8, sel_loadView);
  if (-[STAllowanceDetailListController isSetupController](self, "isSetupController"))
  {
    -[STAllowanceDetailListController navigationItem](self, "navigationItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[STAllowanceDetailListController useBackButton](self, "useBackButton"))
    {
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelButtonTapped_);
      objc_msgSend(v3, "setLeftBarButtonItem:", v4);

    }
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("AllowanceAddBarButtonItemTitle"), &stru_24DB8A1D0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithTitle:style:target:action:", v6, 2, self, sel_saveButtonTapped_);
    objc_msgSend(v3, "setRightBarButtonItem:", v7);

  }
}

- (int64_t)tableViewStyle
{
  return 2;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)STAllowanceDetailListController;
  -[STAllowanceDetailListController viewDidLoad](&v10, sel_viewDidLoad);
  -[STAllowanceDetailListController allowance](self, "allowance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BE84510];
  objc_msgSend(v3, "categoryIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "webDomains");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayNameForUsageLimitWithCategoryIdentifiers:bundleIdentifiers:webDomains:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STAllowanceDetailListController setTitle:](self, "setTitle:", v8);

  -[STAllowanceDetailListController updateSaveButton](self, "updateSaveButton");
  -[STAllowanceDetailListController showOrHideCustomizeDaysSpecifier](self, "showOrHideCustomizeDaysSpecifier");
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STAllowanceDetailListController.viewDidLoad", v9, 2u);
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)STAllowanceDetailListController;
  -[STAllowanceDetailListController viewDidAppear:](&v10, sel_viewDidAppear_, a3);
  -[STAllowanceDetailListController defaultTimeCellDetailTextColor](self, "defaultTimeCellDetailTextColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[STAllowanceDetailListController timeSpecifier](self, "timeSpecifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE75D18]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "detailTextLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[STAllowanceDetailListController setDefaultTimeCellDetailTextColor:](self, "setDefaultTimeCellDetailTextColor:", v8);

  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STAllowanceDetailListController.viewDidAppear", v9, 2u);
  }
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (id)specifiers
{
  uint64_t v3;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_class *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  void *v47;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v3 = (int)*MEMORY[0x24BE756E0];
  if (!*(Class *)((char *)&self->super.super.super.super.super.isa + v3))
  {
    v54 = (int)*MEMORY[0x24BE756E0];
    -[STAllowanceDetailListController setSelectedTimeSpecifier:](self, "setSelectedTimeSpecifier:", 0);
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75590], "st_emptyGroupSpecifier");
    v62 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AllowanceEnableAllowanceSpecifierName"), &stru_24DB8A1D0, 0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);
    v64 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75590], "st_emptyGroupSpecifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[STAllowanceDetailListController timeFooterText](self, "timeFooterText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = *MEMORY[0x24BE75A68];
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6);

    -[STAllowanceDetailListController setTimeGroupSpecifier:](self, "setTimeGroupSpecifier:", v5);
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AllowanceTimeSpecifierName"), &stru_24DB8A1D0, 0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[STAllowanceDetailListController setTimeSpecifier:](self, "setTimeSpecifier:", v7);
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_24DB8A1D0, self, 0, 0, 0, 4, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setIdentifier:", v10);

    v11 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BE754D8], "preferredHeight");
    objc_msgSend(v11, "numberWithDouble:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE75D10]);

    objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x24BE75948]);
    v55 = v8;
    -[STAllowanceDetailListController setTimePickerSpecifier:](self, "setTimePickerSpecifier:", v8);
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AllowanceCustomizeDaysSpecifierName"), &stru_24DB8A1D0, 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setControllerLoadAction:", sel_showCustomizeDaysController_);
    v53 = v13;
    -[STAllowanceDetailListController setCustomizeDaysSpecifier:](self, "setCustomizeDaysSpecifier:", v13);
    v14 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CategoriesAppsWebsitesGroupSpecifierName"), &stru_24DB8A1D0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "groupSpecifierWithName:", v15);
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    -[STAllowanceDetailListController createBudgetedItemSpecifiers](self, "createBudgetedItemSpecifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[STAllowanceDetailListController setBudgetedItemSpecifiers:](self, "setBudgetedItemSpecifiers:");
    v17 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AllowanceDeleteSpecifierName"), &stru_24DB8A1D0, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "deleteButtonSpecifierWithName:target:action:", v18, self, sel_confirmDeletion_);
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v17) = -[STAllowanceDetailListController creatingNewAllowance](self, "creatingNewAllowance");
    v19 = objc_alloc(MEMORY[0x24BDBCEB8]);
    if ((_DWORD)v17)
    {
      v20 = (void *)objc_msgSend(v19, "initWithObjects:", v5, v7, 0);
      v21 = (void *)v62;
    }
    else
    {
      v21 = (void *)v62;
      v20 = (void *)objc_msgSend(v19, "initWithObjects:", v62, v64, v5, v7, 0);
    }
    v22 = v5;
    -[STAllowanceDetailListController coordinator](self, "coordinator");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v7;
    v61 = v5;
    if (objc_msgSend(v58, "isPasscodeEnabled"))
    {
      objc_msgSend(MEMORY[0x24BE75590], "st_emptyGroupSpecifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[STAllowanceDetailListController atEndOfLimitFooterText](self, "atEndOfLimitFooterText");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v24, v49);

      objc_msgSend(v20, "addObject:", v23);
      objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("BlockAtEndOfLimit"), &stru_24DB8A1D0, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v25, self, sel__setAskForMoreTime_specifier_, sel__askForMoreTime_, 0, 6, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObject:", v26);

      v22 = v5;
      v7 = v60;
    }
    objc_msgSend(v20, "addObject:", v63);
    objc_msgSend(v20, "addObjectsFromArray:", v16);
    -[STAllowanceDetailListController allowance](self, "allowance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[STAllowanceDetailListController useBackButton](self, "useBackButton"))
    {
      objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("EditListSpecifierName"), &stru_24DB8A1D0, 0);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v50, self, 0, 0, 0, 13, 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setButtonAction:", sel__editListButtonPressed_);
      objc_msgSend(MEMORY[0x24BE84828], "sharedCache");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "blankSpaceImageWithSize:", 29.0, 29.0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v30, *MEMORY[0x24BE75AC8]);

      v22 = v61;
      v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v32, *MEMORY[0x24BE75C60]);

      objc_msgSend(v27, "bundleIdentifiers");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v33, 0x24DB8A510);

      objc_msgSend(v27, "webDomains");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v34, 0x24DB8A530);

      objc_msgSend(v27, "categoryIdentifiers");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v35, 0x24DB8A550);

      objc_msgSend(v28, "setObject:forKeyedSubscript:", v58, 0x24DB91230);
      objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AllowanceAddBarButtonItemTitle"), &stru_24DB8A1D0, 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v36, 0x24DB8A570);
      objc_msgSend(v20, "addObject:", v28);

      v7 = v60;
    }
    objc_msgSend(MEMORY[0x24BE75590], "st_emptyGroupSpecifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v37);

    v38 = (void *)v64;
    if (!-[STAllowanceDetailListController isSetupController](self, "isSetupController"))
      objc_msgSend(v20, "addObject:", v59);
    if ((objc_msgSend(v27, "shouldAllowEditing") & 1) == 0)
    {
      v51 = v4;
      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      v39 = v20;
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
      if (v40)
      {
        v41 = v40;
        v42 = *(_QWORD *)v66;
        v43 = *MEMORY[0x24BE75A18];
        v44 = MEMORY[0x24BDBD1C0];
        do
        {
          for (i = 0; i != v41; ++i)
          {
            if (*(_QWORD *)v66 != v42)
              objc_enumerationMutation(v39);
            objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * i), "setObject:forKeyedSubscript:", v44, v43);
          }
          v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
        }
        while (v41);
      }

      v4 = v51;
      v22 = v61;
      v21 = (void *)v62;
      v38 = (void *)v64;
      v7 = v60;
    }
    v3 = v54;
    v46 = *(Class *)((char *)&self->super.super.super.super.super.isa + v54);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v54) = (Class)v20;

  }
  if (!-[STAllowanceDetailListController hasSetBudgetTimeOrCustomSchedule](self, "hasSetBudgetTimeOrCustomSchedule"))
  {
    -[STAllowanceDetailListController timeSpecifier](self, "timeSpecifier");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[STAllowanceDetailListController _showOrHidePickerSpecifierForSpecifier:highlight:](self, "_showOrHidePickerSpecifierForSpecifier:highlight:", v47, 0);

  }
  return *(id *)((char *)&self->super.super.super.super.super.isa + v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[16];

  v3 = a3;
  -[STAllowanceDetailListController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[STAllowanceDetailListController isSetupController](self, "isSetupController")
    && !-[STAllowanceDetailListController didDeleteAllowance](self, "didDeleteAllowance")
    && -[STAllowanceDetailListController hasSetBudgetTimeOrCustomSchedule](self, "hasSetBudgetTimeOrCustomSchedule")
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[STAllowanceDetailListController allowance](self, "allowance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allowanceDetailController:didSaveAllowance:", self, v6);

  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STAllowanceDetailListController.viewDidAppear", buf, 2u);
  }
  v7.receiver = self;
  v7.super_class = (Class)STAllowanceDetailListController;
  -[STAllowanceDetailListController viewWillDisappear:](&v7, sel_viewWillDisappear_, v3);

}

- (void)willResignActive
{
  void *v3;
  void *v4;
  objc_super v5;

  -[STAllowanceDetailListController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[STAllowanceDetailListController isSetupController](self, "isSetupController")
    && !-[STAllowanceDetailListController didDeleteAllowance](self, "didDeleteAllowance")
    && -[STAllowanceDetailListController hasSetBudgetTimeOrCustomSchedule](self, "hasSetBudgetTimeOrCustomSchedule")
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[STAllowanceDetailListController allowance](self, "allowance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "allowanceDetailController:didSaveAllowance:", self, v4);

  }
  v5.receiver = self;
  v5.super_class = (Class)STAllowanceDetailListController;
  -[STAllowanceDetailListController willResignActive](&v5, sel_willResignActive);

}

- (void)saveButtonTapped:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  +[STUILog persistence](STUILog, "persistence", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_219AB4000, v4, OS_LOG_TYPE_INFO, "User saved edited allowance", v7, 2u);
  }

  -[STAllowanceDetailListController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[STAllowanceDetailListController allowance](self, "allowance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allowanceDetailController:didSaveAllowance:", self, v6);

  }
}

- (void)updateSaveButton
{
  _BOOL8 v3;
  void *v4;
  id v5;

  if (-[STAllowanceDetailListController isSetupController](self, "isSetupController"))
  {
    -[STAllowanceDetailListController navigationItem](self, "navigationItem");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v3 = -[STAllowanceDetailListController hasSetBudgetTimeOrCustomSchedule](self, "hasSetBudgetTimeOrCustomSchedule");
    objc_msgSend(v5, "rightBarButtonItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEnabled:", v3);

  }
}

- (void)showOrHideCustomizeDaysSpecifier
{
  void *v3;
  int v4;
  _BOOL4 v5;
  id v6;

  -[STAllowanceDetailListController customizeDaysSpecifier](self, "customizeDaysSpecifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[STAllowanceDetailListController timePickerSpecifier](self, "timePickerSpecifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[STAllowanceDetailListController containsSpecifier:](self, "containsSpecifier:", v6);
  v5 = -[STAllowanceDetailListController hasSetBudgetTimeOrCustomSchedule](self, "hasSetBudgetTimeOrCustomSchedule");
  if (!v5 || (v4 & 1) != 0)
  {
    if (((v5 | v4 ^ 1) & 1) == 0)
      -[STAllowanceDetailListController removeSpecifier:animated:](self, "removeSpecifier:animated:", v6, 1);
  }
  else
  {
    -[STAllowanceDetailListController insertSpecifier:afterSpecifier:animated:](self, "insertSpecifier:afterSpecifier:animated:", v6, v3, 1);
  }

}

- (BOOL)hasSetBudgetTime
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[STAllowanceDetailListController allowance](self, "allowance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "time");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[STAllowance timeIntervalForAllowanceDateComponents:](STAllowance, "timeIntervalForAllowanceDateComponents:", v3);
  v5 = v4;

  return v5 > 0.0;
}

- (BOOL)hasSetBudgetTimeOrCustomSchedule
{
  BOOL v3;
  void *v4;
  void *v5;

  if (-[STAllowanceDetailListController hasSetBudgetTime](self, "hasSetBudgetTime"))
    return 1;
  -[STAllowanceDetailListController allowance](self, "allowance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeByDay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v5 != 0;

  return v3;
}

- (void)cancelButtonTapped:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  +[STUILog persistence](STUILog, "persistence", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_219AB4000, v4, OS_LOG_TYPE_INFO, "User cancelled editing allowance", v6, 2u);
  }

  -[STAllowanceDetailListController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "allowanceDetailControllerDidCancel:", self);

}

- (void)_showOrHidePickerSpecifierForSpecifier:(id)a3 highlight:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v4 = a4;
  v28 = a3;
  -[STAllowanceDetailListController selectedTimeSpecifier](self, "selectedTimeSpecifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v28)
  {
    if (-[STAllowanceDetailListController hasSetBudgetTime](self, "hasSetBudgetTime"))
    {
      -[STAllowanceDetailListController allowance](self, "allowance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "timeByDay");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        objc_msgSend(v28, "objectForKeyedSubscript:", *MEMORY[0x24BE75D18]);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BEBD4B8], "tableCellGrayTextColor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "detailTextLabel");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setTextColor:", v22);

      }
    }
    -[STAllowanceDetailListController timePickerSpecifier](self, "timePickerSpecifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[STAllowanceDetailListController removeSpecifier:animated:](self, "removeSpecifier:animated:", v24, 1);

    -[STAllowanceDetailListController customizeDaysSpecifier](self, "customizeDaysSpecifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[STAllowanceDetailListController removeSpecifier:animated:](self, "removeSpecifier:animated:", v25, 1);

    if (v4)
    {
      -[STAllowanceDetailListController selectedTimeSpecifier](self, "selectedTimeSpecifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "identifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[STAllowanceDetailListController highlightSpecifierWithID:](self, "highlightSpecifierWithID:", v27);

    }
    -[STAllowanceDetailListController setSelectedTimeSpecifier:](self, "setSelectedTimeSpecifier:", 0);
  }
  else
  {
    -[STAllowanceDetailListController setSelectedTimeSpecifier:](self, "setSelectedTimeSpecifier:");
    if (-[STAllowanceDetailListController hasSetBudgetTime](self, "hasSetBudgetTime"))
    {
      -[STAllowanceDetailListController allowance](self, "allowance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeByDay");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        -[STAllowanceDetailListController timeSpecifier](self, "timeSpecifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE75D18]);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BEBD4B8], "tableCellBlueTextColor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "detailTextLabel");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setTextColor:", v11);

      }
    }
    -[STAllowanceDetailListController timePickerSpecifier](self, "timePickerSpecifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[STAllowanceDetailListController timeSpecifier](self, "timeSpecifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[STAllowanceDetailListController insertSpecifier:afterSpecifier:animated:](self, "insertSpecifier:afterSpecifier:animated:", v13, v14, 1);

    -[STAllowanceDetailListController customizeDaysSpecifier](self, "customizeDaysSpecifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[STAllowanceDetailListController timePickerSpecifier](self, "timePickerSpecifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[STAllowanceDetailListController insertSpecifier:afterSpecifier:animated:](self, "insertSpecifier:afterSpecifier:animated:", v15, v16, 1);

    if (v4)
    {
      -[STAllowanceDetailListController selectedTimeSpecifier](self, "selectedTimeSpecifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[STAllowanceDetailListController highlightSpecifierWithID:](self, "highlightSpecifierWithID:", v18);

    }
  }

}

- (id)budgetTime
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;

  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STAllowanceDetailListController allowance](self, "allowance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeByDay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = CFSTR("AllowanceCustomScheduleDetailText");
LABEL_6:
    objc_msgSend(v3, "localizedStringForKey:value:table:", v6, &stru_24DB8A1D0, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  -[STAllowanceDetailListController allowance](self, "allowance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "time");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[STAllowance timeIntervalForAllowanceDateComponents:](STAllowance, "timeIntervalForAllowanceDateComponents:", v8);
  v10 = v9;

  if (v10 <= 0.0)
  {
    v6 = CFSTR("AllowanceSetTimeDetailText");
    goto LABEL_6;
  }
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setFormattingContext:", 1);
  objc_msgSend(v11, "setUnitsStyle:", 2);
  objc_msgSend(v11, "stringFromTimeInterval:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("AppLimitEveryDayFormat"), &stru_24DB8A1D0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithFormat:locale:", v13, v15, v12);

LABEL_7:
  return v16;
}

- (id)timeFooterText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  const __CFString *v15;

  -[STAllowanceDetailListController coordinator](self, "coordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "me");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v5, "isRemoteUser");
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!(_DWORD)v4)
  {
    -[STAllowanceDetailListController coordinator](self, "coordinator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "viewModel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isCloudSyncEnabled");

    if (!v14)
    {
      v15 = CFSTR("AllowanceTimeFooterTextLocal");
      goto LABEL_7;
    }
LABEL_5:
    v15 = CFSTR("AllowanceTimeFooterTextCloud");
LABEL_7:
    objc_msgSend(v6, "localizedStringForKey:value:table:", v15, &stru_24DB8A1D0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  objc_msgSend(v5, "givenName");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_5;
  v8 = (void *)v7;
  v9 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("AllowanceTimeFooterTextRemote"), &stru_24DB8A1D0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringWithFormat:", v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v11;
}

- (void)showCustomizeDaysController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v11 = (id)objc_opt_new();
  -[STAllowanceDetailListController allowance](self, "allowance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeByDay");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[STAllowanceDetailListController allowance](self, "allowance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    objc_msgSend(v7, "timeByDay");
  else
    objc_msgSend(v7, "defaultTimeByDay");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTimeByDay:", v9);

  objc_msgSend(v11, "setDelegate:", self);
  objc_msgSend(v11, "setParentController:", self);
  -[STAllowanceDetailListController rootController](self, "rootController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRootController:", v10);

  objc_msgSend(v11, "setSpecifier:", v4);
  -[STAllowanceDetailListController showController:animate:](self, "showController:animate:", v11, 1);

}

- (void)_editListButtonPressed:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *, void *, void *);
  void *v13;
  STAllowanceDetailListController *v14;
  id v15;

  v4 = a3;
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __58__STAllowanceDetailListController__editListButtonPressed___block_invoke;
  v13 = &unk_24DB863F0;
  v14 = self;
  v15 = v4;
  v5 = v4;
  v6 = _Block_copy(&v10);
  v7 = _Block_copy(v6);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, 0x24DB8A590, v10, v11, v12, v13, v14);

  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setParentController:", self);
  -[STAllowanceDetailListController rootController](self, "rootController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRootController:", v9);

  objc_msgSend(v8, "setSpecifier:", v5);
  objc_msgSend(v8, "setupController");
  -[STAllowanceDetailListController showController:animate:](self, "showController:animate:", v8, 1);

}

void __58__STAllowanceDetailListController__editListButtonPressed___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v9 = *(void **)(a1 + 32);
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = a2;
  objc_msgSend(v9, "allowance");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setBundleIdentifiers:", v12);
  objc_msgSend(v23, "setWebDomains:", v11);
  objc_msgSend(v23, "setCategoryIdentifiers:", v10);
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v12, 0x24DB8A510);

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v11, 0x24DB8A530);
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v10, 0x24DB8A550);

  objc_msgSend(*(id *)(a1 + 32), "createBudgetedItemSpecifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(void **)(a1 + 32);
  objc_msgSend(v15, "budgetedItemSpecifiers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "replaceContiguousSpecifiers:withSpecifiers:animated:", v16, v14, 1);

  objc_msgSend(*(id *)(a1 + 32), "setBudgetedItemSpecifiers:", v14);
  v17 = (void *)MEMORY[0x24BE84510];
  objc_msgSend(v23, "categoryIdentifiers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bundleIdentifiers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "webDomains");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "displayNameForUsageLimitWithCategoryIdentifiers:bundleIdentifiers:webDomains:", v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setTitle:", v21);

  objc_msgSend(v13, "dismissViewControllerAnimated:completion:", 1, 0);
  objc_msgSend(v13, "specifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "removePropertyForKey:", 0x24DB8A590);
}

- (void)confirmDeletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_opt_new();
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = *MEMORY[0x24BE75990];
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("AllowanceDeleteSpecifierName"), &stru_24DB8A1D0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  v13[1] = *MEMORY[0x24BE75988];
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("AllowanceDeletionPrompt"), &stru_24DB8A1D0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  v13[2] = *MEMORY[0x24BE75980];
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "sf_isiPad"))
    v9 = CFSTR("ConfirmationTitleDelete");
  else
    v9 = CFSTR("AllowanceDeleteSpecifierName");
  objc_msgSend(v5, "localizedStringForKey:value:table:", v9, &stru_24DB8A1D0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v10;
  v13[3] = *MEMORY[0x24BE75970];
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("ConfirmationButtonCancel"), &stru_24DB8A1D0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setupWithDictionary:", v12);

  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75978]);
  objc_msgSend(v4, "setTarget:", self);
  objc_msgSend(v4, "setConfirmationAction:", sel_deleteAllowance_);
  -[STAllowanceDetailListController showConfirmationViewForSpecifier:](self, "showConfirmationViewForSpecifier:", v4);

}

- (void)deleteAllowance:(id)a3
{
  void *v4;
  id v5;

  -[STAllowanceDetailListController delegate](self, "delegate", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[STAllowanceDetailListController setDidDeleteAllowance:](self, "setDidDeleteAllowance:", 1);
    -[STAllowanceDetailListController allowance](self, "allowance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allowanceDetailController:didDeleteAllowance:", self, v4);

  }
}

- (id)createBudgetedItemSpecifiers
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  uint64_t k;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  const __CFString *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  id obj;
  id obja;
  id objb;
  STAllowanceDetailListController *v73;
  void *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  _BYTE v88[128];
  uint8_t v89[128];
  uint8_t v90[4];
  uint64_t v91;
  uint8_t buf[4];
  id v93;
  __int16 v94;
  id v95;
  uint64_t v96;

  v96 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  -[STAllowanceDetailListController allowance](self, "allowance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x24BDBCF00]);
  v62 = v4;
  objc_msgSend(v4, "categoryIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithArray:", v6);

  v8 = objc_alloc(MEMORY[0x24BDBCF20]);
  STAvailableCategoriesExcludingSystemCategories();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "initWithArray:", v9);

  objc_msgSend(v7, "set");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (void *)v10;
  LODWORD(v9) = objc_msgSend(v11, "isEqualToSet:", v10);

  v73 = self;
  v74 = v3;
  v61 = v7;
  if ((_DWORD)v9)
  {
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("AllAppsAndCategoriesSpecifierName"), &stru_24DB8A1D0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v13, self, 0, 0, 0, 3, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE84828], "sharedCache");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "imageForCategoryIdentifier:", *MEMORY[0x24BE847F8]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, *MEMORY[0x24BE75AC8]);

    objc_msgSend(v3, "addObject:", v14);
  }
  else
  {
    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    obj = v7;
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v89, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v84;
      v20 = *MEMORY[0x24BE75AC8];
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v84 != v19)
            objc_enumerationMutation(obj);
          v22 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * i);
          STCategoryNameWithIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v23, v73, 0, sel__categoryDetailText_, 0, 4, 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setUserInfo:", v22);
          objc_msgSend(MEMORY[0x24BE84828], "sharedCache");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "imageForCategoryIdentifier:", v22);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setObject:forKeyedSubscript:", v26, v20);

          objc_msgSend(v74, "addObject:", v24);
        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v89, 16);
      }
      while (v18);
    }

    self = v73;
  }
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  objc_msgSend(v62, "bundleIdentifiers");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v79, v88, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v80;
    v68 = *MEMORY[0x24BE84700];
    v64 = (const __CFString *)*MEMORY[0x24BE75B70];
    v66 = *MEMORY[0x24BE75B88];
    v30 = *MEMORY[0x24BE75948];
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v80 != v29)
          objc_enumerationMutation(obja);
        v32 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x24BE844B8], "sharedCache");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "appInfoForBundleIdentifier:", v32);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v34, "bundleIdentifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "displayName");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v36, self, 0, 0, 0, 3, 0);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setIdentifier:", v35);
        objc_msgSend(v37, "setUserInfo:", v35);
        if (objc_msgSend(v34, "source") == 2 && (objc_msgSend(v35, "isEqualToString:", v68) & 1) == 0)
        {
          objc_msgSend(v37, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v66);
          v38 = v64;
        }
        else
        {
          objc_msgSend(v37, "setObject:forKeyedSubscript:", objc_opt_class(), v30);
          v38 = CFSTR("STAppBundleID");
        }
        objc_msgSend(v37, "setObject:forKeyedSubscript:", v35, v38);
        objc_msgSend(v74, "addObject:", v37);

        self = v73;
      }
      v28 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v79, v88, 16);
    }
    while (v28);
  }

  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  objc_msgSend(v62, "webDomains");
  v63 = (id)objc_claimAutoreleasedReturnValue();
  v39 = v74;
  v69 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v75, v87, 16);
  if (v69)
  {
    v67 = *(_QWORD *)v76;
    v65 = *MEMORY[0x24BE75AC8];
    do
    {
      for (k = 0; k != v69; ++k)
      {
        if (*(_QWORD *)v76 != v67)
          objc_enumerationMutation(v63);
        v41 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * k);
        objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v41, self, 0, 0, 0, 3, 0);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setUserInfo:", v41);
        objc_msgSend(MEMORY[0x24BEBDAB0], "currentTraitCollection");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "userInterfaceStyle");

        v45 = v41;
        if (objc_msgSend(v45, "length"))
        {
          objb = (id)v44;
          v46 = (void *)objc_opt_new();
          objc_msgSend(v46, "setScheme:", CFSTR("https"));
          objc_msgSend(v46, "setHost:", v45);
          objc_msgSend(v46, "URL");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "_lp_highLevelDomain");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "host");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "URL");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = v48;
          v52 = v49;
          v53 = v50;
          if (objc_msgSend(v51, "length"))
          {
            objc_msgSend(v51, "substringToIndex:", 1);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "uppercaseString");
            v55 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            objc_msgSend(v52, "substringToIndex:", 1);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "uppercaseString");
            v55 = (void *)objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v93 = v53;
              v94 = 2112;
              v95 = v52;
              _os_log_error_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to extract high level domain for URL: %@. Creating initial for host instead: %@", buf, 0x16u);
            }
          }
          v39 = v74;

          v44 = (uint64_t)objb;
          self = v73;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[STAllowanceDetailListController createBudgetedItemSpecifiers].cold.1(v90, (uint64_t)v45, &v91);
          v55 = 0;
        }

        objc_msgSend(MEMORY[0x24BE84828], "sharedCache");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "monogramImageForInitial:useDarkColors:", v55, v44 == 2);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setObject:forKeyedSubscript:", v58, v65);

        objc_msgSend(v39, "addObject:", v42);
      }
      v69 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v75, v87, 16);
    }
    while (v69);
  }

  return v39;
}

- (id)_categoryDetailText:(id)a3
{
  void *v3;
  void *v4;

  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("AllItemsSelectedDetailText"), &stru_24DB8A1D0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_setAskForMoreTime:(id)a3 specifier:(id)a4
{
  uint64_t v5;
  id v6;

  v5 = objc_msgSend(a3, "BOOLValue");
  -[STAllowanceDetailListController allowance](self, "allowance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBehaviorType:", v5);

}

- (id)_askForMoreTime:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD16E0];
  -[STAllowanceDetailListController allowance](self, "allowance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithInt:", objc_msgSend(v4, "behaviorType") == 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_setAllowanceEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v5;
  id v6;

  v5 = objc_msgSend(a3, "BOOLValue");
  -[STAllowanceDetailListController allowance](self, "allowance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAllowanceEnabled:", v5);

}

- (id)_allowanceEnabled:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD16E0];
  -[STAllowanceDetailListController allowance](self, "allowance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "allowanceEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)atEndOfLimitFooterText
{
  void *v2;
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
  void *v14;
  const __CFString *v15;

  -[STAllowanceDetailListController coordinator](self, "coordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "me");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isRemoteUser") & 1) == 0)
  {
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v14;
    v15 = CFSTR("AtAllowanceLocalFooterText");
LABEL_8:
    objc_msgSend(v14, "localizedStringForKey:value:table:", v15, &stru_24DB8A1D0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
LABEL_7:
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v14;
    v15 = CFSTR("AtAllowanceRemoteGenericFooterText");
    goto LABEL_8;
  }
  v6 = (void *)objc_opt_new();
  objc_msgSend(v4, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "personNameComponentsFromString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "givenName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "length"))
  {

    goto LABEL_7;
  }
  v10 = (void *)MEMORY[0x24BDD17C8];
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("AtAllowanceRemoteFooterText"), &stru_24DB8A1D0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringWithFormat:", v12, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v13;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)STAllowanceDetailListController;
  v6 = a4;
  -[STAllowanceDetailListController tableView:cellForRowAtIndexPath:](&v13, sel_tableView_cellForRowAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[STAllowanceDetailListController indexForIndexPath:](self, "indexForIndexPath:", v6, v13.receiver, v13.super_class);

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "objectAtIndexedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[STAllowanceDetailListController budgetedItemSpecifiers](self, "budgetedItemSpecifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "containsObject:", v9);

    if (v11)
      objc_msgSend(v7, "setSelectionStyle:", 0);
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v8 = -[STAllowanceDetailListController indexForIndexPath:](self, "indexForIndexPath:", v7);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "objectAtIndexedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[STAllowanceDetailListController timeSpecifier](self, "timeSpecifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 == v10)
    -[STAllowanceDetailListController _showOrHidePickerSpecifierForSpecifier:highlight:](self, "_showOrHidePickerSpecifierForSpecifier:highlight:", v9, 1);
  v11.receiver = self;
  v11.super_class = (Class)STAllowanceDetailListController;
  -[STAllowanceDetailListController tableView:didSelectRowAtIndexPath:](&v11, sel_tableView_didSelectRowAtIndexPath_, v6, v7);

}

- (void)datePickerChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  objc_msgSend(v4, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "components:fromDate:", 96, v6);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[STAllowanceDetailListController allowance](self, "allowance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTime:", v14);

  -[STAllowanceDetailListController allowance](self, "allowance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTimeByDay:", 0);

  -[STAllowanceDetailListController timeSpecifier](self, "timeSpecifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STAllowanceDetailListController reloadSpecifier:](self, "reloadSpecifier:", v9);

  -[STAllowanceDetailListController selectedTimeSpecifier](self, "selectedTimeSpecifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BE75D18]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[STAllowanceDetailListController hasSetBudgetTime](self, "hasSetBudgetTime"))
    objc_msgSend(MEMORY[0x24BEBD4B8], "tableCellBlueTextColor");
  else
    -[STAllowanceDetailListController defaultTimeCellDetailTextColor](self, "defaultTimeCellDetailTextColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "detailTextLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTextColor:", v12);

  -[STAllowanceDetailListController updateSaveButton](self, "updateSaveButton");
  -[STAllowanceDetailListController showOrHideCustomizeDaysSpecifier](self, "showOrHideCustomizeDaysSpecifier");

}

- (id)datePickerForSpecifier:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v4 = (objc_class *)MEMORY[0x24BEBD520];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = (void *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v7, "setPreferredDatePickerStyle:", 1);
  objc_msgSend(v7, "setDatePickerMode:", 3);
  objc_msgSend(v7, "_setAllowsZeroCountDownDuration:", 1);
  v8 = (void *)objc_opt_new();
  -[STAllowanceDetailListController timePickerSpecifier](self, "timePickerSpecifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v5)
  {
    -[STAllowanceDetailListController allowance](self, "allowance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "time");
    v12 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v12;
  }
  else
  {
    +[STUILog persistence](STUILog, "persistence");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[STAllowanceDetailListController datePickerForSpecifier:].cold.1(v10);

  }
  objc_msgSend(v7, "calendar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dateFromComponents:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDate:animated:", v14, 1);

  return v7;
}

- (void)customizeDaysListController:(id)a3 didFinishEditingTimeByDay:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v5 = a4;
  v6 = (void *)MEMORY[0x24BDBCF20];
  v21 = v5;
  objc_msgSend(v5, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count") == 1)
  {
    objc_msgSend(v8, "anyObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[STAllowanceDetailListController allowance](self, "allowance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTime:", v9);

    -[STAllowanceDetailListController allowance](self, "allowance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = 0;
  }
  else
  {
    -[STAllowanceDetailListController allowance](self, "allowance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = v21;
  }
  objc_msgSend(v11, "setTimeByDay:", v13);

  -[STAllowanceDetailListController timePickerSpecifier](self, "timePickerSpecifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[STAllowanceDetailListController removeSpecifier:animated:](self, "removeSpecifier:animated:", v14, 1);

  -[STAllowanceDetailListController customizeDaysSpecifier](self, "customizeDaysSpecifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[STAllowanceDetailListController removeSpecifier:animated:](self, "removeSpecifier:animated:", v15, 1);

  -[STAllowanceDetailListController selectedTimeSpecifier](self, "selectedTimeSpecifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x24BE75D18]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[STAllowanceDetailListController defaultTimeCellDetailTextColor](self, "defaultTimeCellDetailTextColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "detailTextLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTextColor:", v18);

  -[STAllowanceDetailListController setSelectedTimeSpecifier:](self, "setSelectedTimeSpecifier:", 0);
  -[STAllowanceDetailListController timeSpecifier](self, "timeSpecifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[STAllowanceDetailListController reloadSpecifier:](self, "reloadSpecifier:", v20);

  -[STAllowanceDetailListController updateSaveButton](self, "updateSaveButton");
  -[STAllowanceDetailListController showOrHideCustomizeDaysSpecifier](self, "showOrHideCustomizeDaysSpecifier");

}

- (STAllowanceDetailListControllerDelegate)delegate
{
  return (STAllowanceDetailListControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (STAllowance)allowance
{
  return self->_allowance;
}

- (void)setAllowance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1392);
}

- (BOOL)isSetupController
{
  return self->_isSetupController;
}

- (void)setIsSetupController:(BOOL)a3
{
  self->_isSetupController = a3;
}

- (BOOL)useBackButton
{
  return self->_useBackButton;
}

- (void)setUseBackButton:(BOOL)a3
{
  self->_useBackButton = a3;
}

- (BOOL)creatingNewAllowance
{
  return self->_creatingNewAllowance;
}

- (void)setCreatingNewAllowance:(BOOL)a3
{
  self->_creatingNewAllowance = a3;
}

- (STRootViewModelCoordinator)coordinator
{
  return self->_coordinator;
}

- (PSSpecifier)timeGroupSpecifier
{
  return self->_timeGroupSpecifier;
}

- (void)setTimeGroupSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_timeGroupSpecifier, a3);
}

- (PSSpecifier)timeSpecifier
{
  return self->_timeSpecifier;
}

- (void)setTimeSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_timeSpecifier, a3);
}

- (PSSpecifier)timePickerSpecifier
{
  return self->_timePickerSpecifier;
}

- (void)setTimePickerSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_timePickerSpecifier, a3);
}

- (PSSpecifier)customizeDaysSpecifier
{
  return self->_customizeDaysSpecifier;
}

- (void)setCustomizeDaysSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_customizeDaysSpecifier, a3);
}

- (PSSpecifier)selectedTimeSpecifier
{
  return self->_selectedTimeSpecifier;
}

- (void)setSelectedTimeSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_selectedTimeSpecifier, a3);
}

- (NSArray)budgetedItemSpecifiers
{
  return self->_budgetedItemSpecifiers;
}

- (void)setBudgetedItemSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_budgetedItemSpecifiers, a3);
}

- (BOOL)didDeleteAllowance
{
  return self->_didDeleteAllowance;
}

- (void)setDidDeleteAllowance:(BOOL)a3
{
  self->_didDeleteAllowance = a3;
}

- (UIColor)defaultTimeCellDetailTextColor
{
  return self->_defaultTimeCellDetailTextColor;
}

- (void)setDefaultTimeCellDetailTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_defaultTimeCellDetailTextColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultTimeCellDetailTextColor, 0);
  objc_storeStrong((id *)&self->_budgetedItemSpecifiers, 0);
  objc_storeStrong((id *)&self->_selectedTimeSpecifier, 0);
  objc_storeStrong((id *)&self->_customizeDaysSpecifier, 0);
  objc_storeStrong((id *)&self->_timePickerSpecifier, 0);
  objc_storeStrong((id *)&self->_timeSpecifier, 0);
  objc_storeStrong((id *)&self->_timeGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_allowance, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)createBudgetedItemSpecifiers
{
  *(_DWORD *)buf = 138412290;
  *a3 = a2;
  _os_log_error_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Web domain name must have at least one character for monogram: %@", buf, 0xCu);
}

- (void)datePickerForSpecifier:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_219AB4000, log, OS_LOG_TYPE_ERROR, "Trying to get date picker for invalid specifier.", v1, 2u);
}

@end
