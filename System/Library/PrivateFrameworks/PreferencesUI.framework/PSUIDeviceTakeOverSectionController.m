@implementation PSUIDeviceTakeOverSectionController

- (PSUIDeviceTakeOverSectionController)init
{
  PSUIDeviceTakeOverSectionController *v2;
  uint64_t v3;
  PSUIDeviceTakeOverController *dtoController;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PSUIDeviceTakeOverSectionController;
  v2 = -[PSUIDeviceTakeOverSectionController init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    dtoController = v2->_dtoController;
    v2->_dtoController = (PSUIDeviceTakeOverController *)v3;

    -[PSUIDeviceTakeOverSectionController setUpFindMyEnablementStatus](v2, "setUpFindMyEnablementStatus");
  }
  return v2;
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  objc_class *v11;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = (objc_class *)objc_opt_new();
    -[PSUIDeviceTakeOverSectionController getSpecifiersForToggleGroup:](self, "getSpecifiersForToggleGroup:", CFSTR("DTO_TOGGLE_GROUP_ID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIDeviceTakeOverSectionController addSpecifiers:toExistingSpecifiers:atIndex:](self, "addSpecifiers:toExistingSpecifiers:atIndex:", v6, v5, 0);
    -[PSUIDeviceTakeOverSectionController getStatus](self, "getStatus");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

    if (v8)
    {
      -[PSUIDeviceTakeOverSectionController getSpecifiersForSecurityOptionsGroup:](self, "getSpecifiersForSecurityOptionsGroup:", CFSTR("DTO_SECURITY_OPTIONS_GROUP_ID"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSUIDeviceTakeOverSectionController addSpecifiers:toExistingSpecifiers:atIndex:](self, "addSpecifiers:toExistingSpecifiers:atIndex:", v9, v5, objc_msgSend(v6, "count"));

    }
    v10 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v5;
    v11 = v5;

    -[PSUIDeviceTakeOverSectionController printSpecifiersDescription:](self, "printSpecifiersDescription:", v11);
    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)reloadEntirePane
{
  NSObject *v3;
  uint8_t v4[16];

  PSUILogForCategory(1uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_22E0C8000, v3, OS_LOG_TYPE_DEFAULT, "DTO: Reloading the pane", v4, 2u);
  }

  -[PSUIDeviceTakeOverSectionController reloadSpecifiers](self, "reloadSpecifiers");
}

- (void)printSpecifiersDescription:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", CFSTR("DTO Summary: "));
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (!v6)
  {
    v8 = 0;
    goto LABEL_29;
  }
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v34;
  v31 = *MEMORY[0x24BE75C20];
  do
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v34 != v9)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v10);
      objc_msgSend(v11, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("DTO_TOGGLE_GROUP_ID"));

      if (v13)
      {
        v14 = v4;
        v15 = CFSTR("| Group 1: Toggle");
LABEL_8:
        objc_msgSend(v14, "appendString:", v15);
        goto LABEL_13;
      }
      objc_msgSend(v11, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("DTO_TOGGLE_ID"));

      if (v17)
      {
        -[PSUIDeviceTakeOverSectionController getStatus](self, "getStatus");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendFormat:", CFSTR(" -> Toggled [%@]"), v18);

      }
      else
      {
        objc_msgSend(v11, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("DTO_SECURITY_OPTIONS_GROUP_ID"));

        if (!v20)
        {
          objc_msgSend(v11, "identifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("DTO_SECURITY_OPTION_ALWAYS_FAMILIAR_ID"));

          if (v26)
          {
            if (v8 && objc_msgSend(v8, "isEqualToSpecifier:", v11))
            {
              v14 = v4;
              v15 = CFSTR(" -> i. Familiar only [Checked]");
            }
            else
            {
              v14 = v4;
              v15 = CFSTR(" -> i. Familiar only");
            }
          }
          else
          {
            objc_msgSend(v11, "identifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("DTO_SECURITY_OPTION_ALWAYS_ID"));

            if (v28)
            {
              if (v8 && objc_msgSend(v8, "isEqualToSpecifier:", v11))
              {
                v14 = v4;
                v15 = CFSTR(" -> ii. Always [Checked]");
              }
              else
              {
                v14 = v4;
                v15 = CFSTR(" -> ii. Always");
              }
            }
            else
            {
              v14 = v4;
              v15 = CFSTR(" *** Unknown ***");
            }
          }
          goto LABEL_8;
        }
        v21 = (void *)MEMORY[0x24BDD16E0];
        -[PSUIDeviceTakeOverSectionController dtoController](self, "dtoController");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "numberWithBool:", objc_msgSend(v22, "isStrictModeEnabled"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendFormat:", CFSTR("| Group 2: Options (Strict Mode = %@)"), v23);

        objc_msgSend(v11, "objectForKeyedSubscript:", v31);
        v24 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v24;
      }
LABEL_13:
      ++v10;
    }
    while (v7 != v10);
    v29 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    v7 = v29;
  }
  while (v29);
LABEL_29:

  PSUILogForCategory(1uLL);
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v4;
    _os_log_impl(&dword_22E0C8000, v30, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

}

- (void)addSpecifiers:(id)a3 toExistingSpecifiers:(id)a4 atIndex:(unint64_t)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  v8 = objc_msgSend(v10, "count");
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", a5, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertObjects:atIndexes:", v10, v9);

  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v5;
  id v6;

  v5 = -[PSUIDeviceTakeOverSectionController indexForIndexPath:](self, "indexForIndexPath:", a4);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "objectAtIndex:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PSUIDeviceTakeOverSectionController userUpdatedSecurityOptionTo:](self, "userUpdatedSecurityOptionTo:", v6);

}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  id v10;
  __int16 v12;
  __int16 v13;

  v5 = a4;
  -[PSUIDeviceTakeOverSectionController specifierAtIndex:](self, "specifierAtIndex:", -[PSUIDeviceTakeOverSectionController indexForIndexPath:](self, "indexForIndexPath:", v5));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PSUIDeviceTakeOverSectionController shouldIgnoreToggleGroupRowSelectionFor:](self, "shouldIgnoreToggleGroupRowSelectionFor:", v6))
  {
    PSUILogForCategory(1uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 0;
      v8 = "DTO: User tapped on Toggle row, ignoring";
      v9 = (uint8_t *)&v13;
LABEL_7:
      _os_log_impl(&dword_22E0C8000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    }
  }
  else
  {
    if (!-[PSUIDeviceTakeOverSectionController shouldIgnoreSecurityOptionsGroupRowSelectionFor:](self, "shouldIgnoreSecurityOptionsGroupRowSelectionFor:", v6))
    {
      v10 = v5;
      goto LABEL_10;
    }
    PSUILogForCategory(1uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 0;
      v8 = "DTO: User tapped on already currently check marked security option, ignoring";
      v9 = (uint8_t *)&v12;
      goto LABEL_7;
    }
  }

  v10 = 0;
LABEL_10:

  return v10;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PSUIDeviceTakeOverSectionController;
  -[PSUIDeviceTakeOverSectionController tableView:cellForRowAtIndexPath:](&v6, sel_tableView_cellForRowAtIndexPath_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelectionStyle:", 0);
  return v4;
}

- (id)getSpecifiersForToggleGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_24F9E4F80, self, 0, 0, 0, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIdentifier:", v4);

  v7 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v6, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75B28]);
  -[PSUIDeviceTakeOverSectionController updateFooterForToggleGroupSpecifier:](self, "updateFooterForToggleGroupSpecifier:", v6);
  objc_msgSend(v5, "addObject:", v6);
  v8 = (void *)MEMORY[0x24BE75590];
  PSUI_LocalizedStringForPasscodeDimpleKey(CFSTR("DTO_STATUS_LABEL_DESCRIPTION"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v9, self, sel_toggleStatusTo_, sel_getStatus, 0, 6, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setIdentifier:", CFSTR("DTO_TOGGLE_ID"));
  objc_msgSend(v10, "setProperty:forKey:", v7, *MEMORY[0x24BE75868]);
  objc_msgSend(v5, "addObject:", v10);

  return v5;
}

- (void)updateFooterForToggleGroupSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSRange v12;

  v4 = a3;
  PSUI_LocalizedStringForPasscodeDimpleKey(CFSTR("DTO_GROUP_FOOTER_DESCRIPTION"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  PSUI_LocalizedStringForPasscodeDimpleKey(CFSTR("DTO_GROUP_FOOTER_DESCRIPTION_SUFFIX_LINK"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v11, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v8, *MEMORY[0x24BE75A30]);

  objc_msgSend(v4, "setProperty:forKey:", v6, *MEMORY[0x24BE75A58]);
  v12.location = objc_msgSend(v6, "rangeOfString:", v5);
  NSStringFromRange(v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v9, *MEMORY[0x24BE75A40]);

  objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v10, *MEMORY[0x24BE75A50]);

  objc_msgSend(v4, "setProperty:forKey:", CFSTR("openLearnMoreLink"), *MEMORY[0x24BE75A38]);
}

- (id)getStatus
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD16E0];
  -[PSUIDeviceTakeOverSectionController dtoController](self, "dtoController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "isRatchetEnabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)toggleStatusTo:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PSUILogForCategory(1uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_22E0C8000, v5, OS_LOG_TYPE_DEFAULT, "DTO: User toggled to state [%@]", (uint8_t *)&v6, 0xCu);
  }

  if (objc_msgSend(v4, "BOOLValue"))
    -[PSUIDeviceTakeOverSectionController proceedToEnableDTO](self, "proceedToEnableDTO");
  else
    -[PSUIDeviceTakeOverSectionController proceedToDisableDTO](self, "proceedToDisableDTO");

}

- (void)proceedToEnableDTO
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __57__PSUIDeviceTakeOverSectionController_proceedToEnableDTO__block_invoke;
  v2[3] = &unk_24F9E3F98;
  v2[4] = self;
  -[PSUIDeviceTakeOverSectionController performPreEnableDTOChecksWithCompletion:](self, "performPreEnableDTOChecksWithCompletion:", v2);
}

void __57__PSUIDeviceTakeOverSectionController_proceedToEnableDTO__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  char v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  PSUILogForCategory(1uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v10 = v5;
    _os_log_impl(&dword_22E0C8000, v4, OS_LOG_TYPE_DEFAULT, "DTO: Turn On Protection [Prechecks: %@]", buf, 0xCu);

  }
  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __57__PSUIDeviceTakeOverSectionController_proceedToEnableDTO__block_invoke_65;
  v6[3] = &unk_24F9E4190;
  objc_copyWeak(&v7, (id *)buf);
  v8 = a2;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void __57__PSUIDeviceTakeOverSectionController_proceedToEnableDTO__block_invoke_65(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_BYTE *)(a1 + 40))
      objc_msgSend(WeakRetained, "enableDTO");
    else
      objc_msgSend(WeakRetained, "reloadSpecifiersPostStatusToggle");
  }
  else
  {
    PSUILogForCategory(1uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __57__PSUIDeviceTakeOverSectionController_proceedToEnableDTO__block_invoke_65_cold_1();

  }
}

- (void)enableDTO
{
  void *v3;
  _QWORD v4[5];

  -[PSUIDeviceTakeOverSectionController dtoController](self, "dtoController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __48__PSUIDeviceTakeOverSectionController_enableDTO__block_invoke;
  v4[3] = &unk_24F9E4898;
  v4[4] = self;
  objc_msgSend(v3, "enableRatchetWithCompletion:", v4);

}

void __48__PSUIDeviceTakeOverSectionController_enableDTO__block_invoke(uint64_t a1, void *a2)
{
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  id v7[2];
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  PSUILogForCategory(1uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v9 = v5;
    _os_log_impl(&dword_22E0C8000, v4, OS_LOG_TYPE_DEFAULT, "DTO: Turn On Protection [%@]", buf, 0xCu);

  }
  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__PSUIDeviceTakeOverSectionController_enableDTO__block_invoke_68;
  v6[3] = &unk_24F9E4870;
  objc_copyWeak(v7, (id *)buf);
  v7[1] = a2;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);
  objc_destroyWeak(v7);
  objc_destroyWeak((id *)buf);
}

void __48__PSUIDeviceTakeOverSectionController_enableDTO__block_invoke_68(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 40) != 1)
      objc_msgSend(WeakRetained, "showDTOAlertForFailureToToggleToState:withRatchetError:", 1);
    objc_msgSend(v3, "reloadSpecifiersPostStatusToggle");
  }
  else
  {
    PSUILogForCategory(1uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __57__PSUIDeviceTakeOverSectionController_proceedToEnableDTO__block_invoke_65_cold_1();

  }
}

- (void)proceedToDisableDTO
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "DTO: Turn Off Protection [Failed] - was not on!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __58__PSUIDeviceTakeOverSectionController_proceedToDisableDTO__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4[2];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __58__PSUIDeviceTakeOverSectionController_proceedToDisableDTO__block_invoke_2;
  v3[3] = &unk_24F9E4870;
  objc_copyWeak(v4, (id *)(a1 + 32));
  v4[1] = a2;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
  objc_destroyWeak(v4);
}

void __58__PSUIDeviceTakeOverSectionController_proceedToDisableDTO__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 40);
    PSUILogForCategory(1uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3 == 2)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        __58__PSUIDeviceTakeOverSectionController_proceedToDisableDTO__block_invoke_2_cold_2();

      objc_msgSend(WeakRetained, "reloadSpecifiersPostStatusToggle");
    }
    else
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_22E0C8000, v5, OS_LOG_TYPE_DEFAULT, "DTO: Turn Off Protection [Proceeding]", v7, 2u);
      }

      objc_msgSend(WeakRetained, "disableDTO");
    }
  }
  else
  {
    PSUILogForCategory(1uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __58__PSUIDeviceTakeOverSectionController_proceedToDisableDTO__block_invoke_2_cold_1();

  }
}

- (void)disableDTO
{
  void *v3;
  _QWORD v4[5];

  -[PSUIDeviceTakeOverSectionController dtoController](self, "dtoController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __49__PSUIDeviceTakeOverSectionController_disableDTO__block_invoke;
  v4[3] = &unk_24F9E4898;
  v4[4] = self;
  objc_msgSend(v3, "disableRatchetWithCompletion:", v4);

}

void __49__PSUIDeviceTakeOverSectionController_disableDTO__block_invoke(uint64_t a1, void *a2)
{
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  id v7[2];
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  PSUILogForCategory(1uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v9 = v5;
    _os_log_impl(&dword_22E0C8000, v4, OS_LOG_TYPE_DEFAULT, "DTO: Turn Off Protection [%@]", buf, 0xCu);

  }
  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__PSUIDeviceTakeOverSectionController_disableDTO__block_invoke_70;
  v6[3] = &unk_24F9E4870;
  objc_copyWeak(v7, (id *)buf);
  v7[1] = a2;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);
  objc_destroyWeak(v7);
  objc_destroyWeak((id *)buf);
}

void __49__PSUIDeviceTakeOverSectionController_disableDTO__block_invoke_70(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 40) != 1)
      objc_msgSend(WeakRetained, "showDTOAlertForFailureToToggleToState:withRatchetError:", 0);
    objc_msgSend(v3, "reloadSpecifiersPostStatusToggle");
  }
  else
  {
    PSUILogForCategory(1uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __58__PSUIDeviceTakeOverSectionController_proceedToDisableDTO__block_invoke_2_cold_1();

  }
}

- (BOOL)shouldIgnoreToggleGroupRowSelectionFor:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[PSUIDeviceTakeOverSectionController getGroupSpecifierForSpecifier:](self, "getGroupSpecifierForSpecifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("DTO_TOGGLE_GROUP_ID"));

  return v5;
}

- (void)openLearnMoreLink
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t v5[16];

  PSUILogForCategory(1uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_22E0C8000, v2, OS_LOG_TYPE_DEFAULT, "DTO: User clicked on support link.", v5, 2u);
  }

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://support.apple.com/kb/HT212510"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openURL:withCompletionHandler:", v4, &__block_literal_global_6);

}

void __56__PSUIDeviceTakeOverSectionController_openLearnMoreLink__block_invoke(uint64_t a1, char a2)
{
  NSObject *v2;

  if ((a2 & 1) == 0)
  {
    PSUILogForCategory(1uLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __56__PSUIDeviceTakeOverSectionController_openLearnMoreLink__block_invoke_cold_1();

  }
}

- (void)setUpFindMyEnablementStatus
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BE31CC0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __66__PSUIDeviceTakeOverSectionController_setUpFindMyEnablementStatus__block_invoke;
  v3[3] = &unk_24F9E4908;
  objc_copyWeak(&v4, &location);
  objc_msgSend(v2, "fmipStateWithCompletion:", v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __66__PSUIDeviceTakeOverSectionController_setUpFindMyEnablementStatus__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    PSUILogForCategory(1uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __66__PSUIDeviceTakeOverSectionController_setUpFindMyEnablementStatus__block_invoke_cold_2(v5, v6);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setIsFindMyEnabled:", a2 == 1);
    PSUILogForCategory(1uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v8, "isFindMyEnabled"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_22E0C8000, v9, OS_LOG_TYPE_DEFAULT, "Find My Device: %@", (uint8_t *)&v11, 0xCu);

    }
  }
  else
  {
    PSUILogForCategory(1uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __66__PSUIDeviceTakeOverSectionController_setUpFindMyEnablementStatus__block_invoke_cold_1();
  }

}

- (void)ensureAccountSecurityIsSufficientWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t);
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  void (**v21)(id, uint64_t);
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, uint64_t))a3;
  v5 = PSUsedByHSA2Account();
  v6 = PSJoinedCDPCircleAccount();
  PSUILogForCategory(1uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v5 && (v6 & 1) != 0)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22E0C8000, v7, OS_LOG_TYPE_DEFAULT, "Account security: No need to Upgrade", buf, 2u);
    }

    v4[2](v4, 1);
  }
  else
  {
    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v23 = v9;
      v24 = 2112;
      v25 = v10;
      _os_log_impl(&dword_22E0C8000, v7, OS_LOG_TYPE_DEFAULT, "Account security: Upgrading since HSA2 [%@] CDPCircle [%@]", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "aa_primaryAppleAccount");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "aa_altDSID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1AA20]), "initWithAltDSID:", v13);
      objc_msgSend(v14, "setDeviceToDeviceEncryptionUpgradeUIStyle:", 0);
      objc_msgSend(v14, "setDeviceToDeviceEncryptionUpgradeType:", 0);
      PSUI_LocalizedStringForPasscodeDimpleKey(CFSTR("DTO_ALERT_MUST_UPGRADE_ACCOUNT_SECURITY"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setFeatureName:", v15);

      objc_msgSend(v14, "setPresentingViewController:", self);
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1AA28]), "initWithContext:", v14);
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __87__PSUIDeviceTakeOverSectionController_ensureAccountSecurityIsSufficientWithCompletion___block_invoke;
      v20[3] = &unk_24F9E40F0;
      v21 = v4;
      objc_msgSend(v16, "performDeviceToDeviceEncryptionStateRepairWithCompletion:", v20);

    }
    else
    {
      PSUILogForCategory(1uLL);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[PSUIDeviceTakeOverSectionController ensureAccountSecurityIsSufficientWithCompletion:].cold.1(v17, v18, v19);

      -[PSUIDeviceTakeOverSectionController showDTOAlertForFailureToToggleToState:withRatchetError:](self, "showDTOAlertForFailureToToggleToState:withRatchetError:", 1, 2);
      v4[2](v4, 0);
    }

  }
}

void __87__PSUIDeviceTakeOverSectionController_ensureAccountSecurityIsSufficientWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = PSUsedByHSA2Account();
  v7 = PSJoinedCDPCircleAccount();
  PSUILogForCategory(1uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((_DWORD)v6 && (v7 & 1) != 0)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v10;
      _os_log_impl(&dword_22E0C8000, v9, OS_LOG_TYPE_DEFAULT, "Account security: Upgrading [Success] - Repaired: %@", (uint8_t *)&v15, 0xCu);

    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "description");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138413058;
    v16 = v11;
    v17 = 2112;
    v18 = v12;
    v19 = 2112;
    v20 = v13;
    v21 = 2112;
    v22 = v14;
    _os_log_error_impl(&dword_22E0C8000, v9, OS_LOG_TYPE_ERROR, "Account security: Upgrading [Failed] since HSA2 [%@] CDPCircle [%@] - Repaired: %@ Error: %@", (uint8_t *)&v15, 0x2Au);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)performPreEnableDTOChecksWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[16];

  v4 = a3;
  PSUILogForCategory(1uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22E0C8000, v5, OS_LOG_TYPE_DEFAULT, "DTO: Turn On Protection [Performing prechecks]", buf, 2u);
  }

  if (-[PSUIDeviceTakeOverSectionController isFindMyEnabled](self, "isFindMyEnabled"))
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __79__PSUIDeviceTakeOverSectionController_performPreEnableDTOChecksWithCompletion___block_invoke;
    v6[3] = &unk_24F9E4630;
    v7 = v4;
    -[PSUIDeviceTakeOverSectionController ensureAccountSecurityIsSufficientWithCompletion:](self, "ensureAccountSecurityIsSufficientWithCompletion:", v6);

  }
  else
  {
    -[PSUIDeviceTakeOverSectionController showAlertForFindMyIsDisabledWithCompletion:](self, "showAlertForFindMyIsDisabledWithCompletion:", v4);
  }

}

uint64_t __79__PSUIDeviceTakeOverSectionController_performPreEnableDTOChecksWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)showAlertForFindMyIsDisabledWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint8_t v13[8];
  _QWORD v14[4];
  id v15;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BEBD3B0];
  PSUI_LocalizedStringForPasscodeDimpleKey(CFSTR("DTO_ALERT_MUST_TURN_ON_FIND_MY_TITLE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", 0, v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BEBD3A8];
  PSUI_LocalizedStringForPasscodeDimpleKey(CFSTR("DTO_ALERT_OK_BUTTON"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __82__PSUIDeviceTakeOverSectionController_showAlertForFindMyIsDisabledWithCompletion___block_invoke;
  v14[3] = &unk_24F9E3EE0;
  v15 = v4;
  v10 = v4;
  objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 0, v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v11);

  PSUILogForCategory(1uLL);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_22E0C8000, v12, OS_LOG_TYPE_DEFAULT, "Find My: Alert [Shown]", v13, 2u);
  }

  -[PSUIDeviceTakeOverSectionController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
}

uint64_t __82__PSUIDeviceTakeOverSectionController_showAlertForFindMyIsDisabledWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  PSUILogForCategory(1uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_22E0C8000, v2, OS_LOG_TYPE_DEFAULT, "Find My: Alert [Dismissed]", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)showDTOAlertForFailureToToggleToState:(BOOL)a3 withRatchetError:(unint64_t)a4
{
  _BOOL4 v4;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  const __CFString *v19;
  _QWORD v20[4];
  BOOL v21;
  _QWORD v22[4];
  id v23;
  BOOL v24;
  id location[4];

  v4 = a3;
  location[3] = *(id *)MEMORY[0x24BDAC8D0];
  v6 = (void *)MEMORY[0x24BEBD3B0];
  v7 = MEMORY[0x24BDAC760];
  if (a4 == 3)
  {
    if (PSSupportsMesa())
      v8 = CFSTR("DTO_ALERT_TOUCH_ID_REQUIRED_TO_ENABLE");
    else
      v8 = CFSTR("DTO_ALERT_FACE_ID_REQUIRED_TO_ENABLE");
    PSUI_LocalizedStringForPasscodeDimpleKey(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", 0, v9, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(location, self);
    v11 = (void *)MEMORY[0x24BEBD3A8];
    PSUI_LocalizedStringForPasscodeDimpleKey(CFSTR("DTO_ALERT_COULD_NOT_TOGGLE_LEARN_MORE_BUTTON"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v7;
    v22[1] = 3221225472;
    v22[2] = __94__PSUIDeviceTakeOverSectionController_showDTOAlertForFailureToToggleToState_withRatchetError___block_invoke;
    v22[3] = &unk_24F9E4930;
    v24 = v4;
    objc_copyWeak(&v23, location);
    objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 0, v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAction:", v13);

    objc_destroyWeak(&v23);
    objc_destroyWeak(location);
  }
  else
  {
    if (a3)
      PSUI_LocalizedStringForPasscodeDimpleKey(CFSTR("DTO_ALERT_COULD_NOT_TOGGLE_TO_ON_TITLE"));
    else
      PSUI_LocalizedStringForPasscodeDimpleKey(CFSTR("DTO_ALERT_COULD_NOT_TOGGLE_TO_OFF_TITLE"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", 0, v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v15 = (void *)MEMORY[0x24BEBD3A8];
  PSUI_LocalizedStringForPasscodeDimpleKey(CFSTR("DTO_ALERT_OK_BUTTON"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v7;
  v20[1] = 3221225472;
  v20[2] = __94__PSUIDeviceTakeOverSectionController_showDTOAlertForFailureToToggleToState_withRatchetError___block_invoke_104;
  v20[3] = &__block_descriptor_33_e23_v16__0__UIAlertAction_8l;
  v21 = v4;
  objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 0, v20);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAction:", v17);

  PSUILogForCategory(1uLL);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = CFSTR("Off");
    if (v4)
      v19 = CFSTR("On");
    LODWORD(location[0]) = 138412290;
    *(id *)((char *)location + 4) = (id)v19;
    _os_log_impl(&dword_22E0C8000, v18, OS_LOG_TYPE_DEFAULT, "DTO: Turn %@ Protection [Failed] - Alert [Shown]", (uint8_t *)location, 0xCu);
  }

  -[PSUIDeviceTakeOverSectionController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);
}

void __94__PSUIDeviceTakeOverSectionController_showDTOAlertForFailureToToggleToState_withRatchetError___block_invoke(uint64_t a1)
{
  NSObject *v2;
  const __CFString *v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  PSUILogForCategory(1uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(a1 + 40))
      v3 = CFSTR("On");
    else
      v3 = CFSTR("Off");
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_22E0C8000, v2, OS_LOG_TYPE_DEFAULT, "DTO: Turn %@ Protection [Failed] - Alert [Dismissed - Learn More]", (uint8_t *)&v7, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "openLearnMoreLink");
  }
  else
  {
    PSUILogForCategory(1uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __94__PSUIDeviceTakeOverSectionController_showDTOAlertForFailureToToggleToState_withRatchetError___block_invoke_cold_1();

  }
}

void __94__PSUIDeviceTakeOverSectionController_showDTOAlertForFailureToToggleToState_withRatchetError___block_invoke_104(uint64_t a1)
{
  NSObject *v2;
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  PSUILogForCategory(1uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(a1 + 32))
      v3 = CFSTR("On");
    else
      v3 = CFSTR("Off");
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_22E0C8000, v2, OS_LOG_TYPE_DEFAULT, "DTO: Turn %@ Protection [Failed] - Alert [Dismissed]", (uint8_t *)&v4, 0xCu);
  }

}

- (id)getSpecifiersForSecurityOptionsGroup:(id)a3
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
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)MEMORY[0x24BE75590];
  PSUI_LocalizedStringForPasscodeDimpleKey(CFSTR("DTO_SECURITY_DELAY_OPTIONS_GROUP_HEADER_DESCRIPTION"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v7, self, 0, 0, 0, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setIdentifier:", v4);
  v9 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v8, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75B28]);
  -[PSUIDeviceTakeOverSectionController updateFooterForSecurityOptionsGroupSpecifier:](self, "updateFooterForSecurityOptionsGroupSpecifier:", v8);
  objc_msgSend(v5, "addObject:", v8);
  v10 = (void *)MEMORY[0x24BE75590];
  PSUI_LocalizedStringForPasscodeDimpleKey(CFSTR("DTO_SECURITY_DELAY_OPTION_AWAY_FAMILIAR_LOCATIONS_ONLY"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v11, self, 0, 0, 0, 3, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setIdentifier:", CFSTR("DTO_SECURITY_OPTION_ALWAYS_FAMILIAR_ID"));
  v13 = *MEMORY[0x24BE75868];
  objc_msgSend(v12, "setProperty:forKey:", v9, *MEMORY[0x24BE75868]);
  objc_msgSend(v5, "addObject:", v12);
  v14 = (void *)MEMORY[0x24BE75590];
  PSUI_LocalizedStringForPasscodeDimpleKey(CFSTR("DTO_SECURITY_DELAY_OPTION_AWAY_ALWAYS"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v15, self, 0, 0, 0, 3, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setIdentifier:", CFSTR("DTO_SECURITY_OPTION_ALWAYS_ID"));
  objc_msgSend(v16, "setProperty:forKey:", v9, v13);
  objc_msgSend(v5, "addObject:", v16);
  -[PSUIDeviceTakeOverSectionController dtoController](self, "dtoController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isStrictModeEnabled");

  PSUILogForCategory(1uLL);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v24 = v20;
    _os_log_impl(&dword_22E0C8000, v19, OS_LOG_TYPE_DEFAULT, "DTO: Strict Mode [%@]", buf, 0xCu);

  }
  if ((_DWORD)v18)
    v21 = v16;
  else
    v21 = v12;
  objc_msgSend(v8, "setProperty:forKey:", v21, *MEMORY[0x24BE75C20]);

  return v5;
}

- (void)updateFooterForSecurityOptionsGroupSpecifier:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  PSUI_LocalizedStringForPasscodeDimpleKey(CFSTR("DTO_SECURITY_DELAY_OPTIONS_GROUP_FOOTER_DESCRIPTION_FAMILIAR_LOCATIONS_ONLY"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUIDeviceTakeOverSectionController dtoController](self, "dtoController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isStrictModeEnabled");

  if (v6)
  {
    PSUI_LocalizedStringForPasscodeDimpleKey(CFSTR("DTO_SECURITY_DELAY_OPTIONS_GROUP_FOOTER_DESCRIPTION_ALWAYS"));
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }
  objc_msgSend(v8, "setProperty:forKey:", v4, *MEMORY[0x24BE75A68]);

}

- (void)toggleToStrictMode:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v3 = a3;
  objc_initWeak(&location, self);
  -[PSUIDeviceTakeOverSectionController dtoController](self, "dtoController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58__PSUIDeviceTakeOverSectionController_toggleToStrictMode___block_invoke;
  v6[3] = &unk_24F9E4978;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "toggleToStrictMode:withCompletion:", v3, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __58__PSUIDeviceTakeOverSectionController_toggleToStrictMode___block_invoke(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __58__PSUIDeviceTakeOverSectionController_toggleToStrictMode___block_invoke_2;
  v3[3] = &unk_24F9E4190;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  v5 = a2;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
  objc_destroyWeak(&v4);
}

void __58__PSUIDeviceTakeOverSectionController_toggleToStrictMode___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_BYTE *)(a1 + 40))
      objc_msgSend(WeakRetained, "reloadEntirePane");
    else
      objc_msgSend(WeakRetained, "showAlertForFailedToUpdateSecurityDelay");
  }
  else
  {
    PSUILogForCategory(1uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __58__PSUIDeviceTakeOverSectionController_toggleToStrictMode___block_invoke_2_cold_1();

  }
}

- (void)userUpdatedSecurityOptionTo:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id buf[2];

  v4 = a3;
  -[PSUIDeviceTakeOverSectionController dtoController](self, "dtoController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRatchetEnabled");

  if ((v6 & 1) != 0)
  {
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("DTO_SECURITY_OPTION_ALWAYS_ID"));

    if (v8)
    {
      PSUILogForCategory(1uLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_22E0C8000, v9, OS_LOG_TYPE_DEFAULT, "DTO: User upgraded security option to Always", (uint8_t *)buf, 2u);
      }

      -[PSUIDeviceTakeOverSectionController toggleToStrictMode:](self, "toggleToStrictMode:", 1);
    }
    else
    {
      objc_msgSend(v4, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("DTO_SECURITY_OPTION_ALWAYS_FAMILIAR_ID"));

      if (v12)
      {
        PSUILogForCategory(1uLL);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl(&dword_22E0C8000, v13, OS_LOG_TYPE_DEFAULT, "DTO: User downgraded security option to Familiar Locations only", (uint8_t *)buf, 2u);
        }

        objc_initWeak(buf, self);
        -[PSUIDeviceTakeOverSectionController dtoController](self, "dtoController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = MEMORY[0x24BDAC760];
        v15[1] = 3221225472;
        v15[2] = __67__PSUIDeviceTakeOverSectionController_userUpdatedSecurityOptionTo___block_invoke;
        v15[3] = &unk_24F9E48C0;
        objc_copyWeak(&v16, buf);
        objc_msgSend(v14, "gateWithRatchetForOperation:forPresentingVC:completion:", 10, self, v15);

        objc_destroyWeak(&v16);
        objc_destroyWeak(buf);
      }
    }
  }
  else
  {
    PSUILogForCategory(1uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[PSUIDeviceTakeOverSectionController userUpdatedSecurityOptionTo:].cold.1();

  }
}

void __67__PSUIDeviceTakeOverSectionController_userUpdatedSecurityOptionTo___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;

  if (a2 == 2)
  {
    PSUILogForCategory(1uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __67__PSUIDeviceTakeOverSectionController_userUpdatedSecurityOptionTo___block_invoke_cold_1();

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __67__PSUIDeviceTakeOverSectionController_userUpdatedSecurityOptionTo___block_invoke_115;
    block[3] = &unk_24F9E3978;
    objc_copyWeak(&v8, (id *)(a1 + 32));
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    objc_destroyWeak(&v8);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v5 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "toggleToStrictMode:", 0);
    }
    else
    {
      PSUILogForCategory(1uLL);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __67__PSUIDeviceTakeOverSectionController_userUpdatedSecurityOptionTo___block_invoke_cold_2();

    }
  }
}

void __67__PSUIDeviceTakeOverSectionController_userUpdatedSecurityOptionTo___block_invoke_115(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "reloadEntirePane");
  }
  else
  {
    PSUILogForCategory(1uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __67__PSUIDeviceTakeOverSectionController_userUpdatedSecurityOptionTo___block_invoke_115_cold_1();

  }
}

- (BOOL)shouldIgnoreSecurityOptionsGroupRowSelectionFor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  -[PSUIDeviceTakeOverSectionController getGroupSpecifierForSpecifier:](self, "getGroupSpecifierForSpecifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("DTO_SECURITY_OPTIONS_GROUP_ID")))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE75C20]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToSpecifier:", v4);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)showAlertForFailedToUpdateSecurityDelay
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];

  v3 = (void *)MEMORY[0x24BEBD3B0];
  PSUI_LocalizedStringForPasscodeDimpleKey(CFSTR("DTO_ALERT_COULD_NOT_UPDATE_SECURITY_DELAY"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", 0, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BEBD3A8];
  PSUI_LocalizedStringForPasscodeDimpleKey(CFSTR("DTO_ALERT_OK_BUTTON"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 0, &__block_literal_global_118);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v8);

  PSUILogForCategory(1uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_22E0C8000, v9, OS_LOG_TYPE_DEFAULT, "Security options: Alert [Shown]", v10, 2u);
  }

  -[PSUIDeviceTakeOverSectionController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
}

void __78__PSUIDeviceTakeOverSectionController_showAlertForFailedToUpdateSecurityDelay__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  PSUILogForCategory(1uLL);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_22E0C8000, v0, OS_LOG_TYPE_DEFAULT, "Security options: Alert [Dismissed]", v1, 2u);
  }

}

- (PSUIDeviceTakeOverController)dtoController
{
  return self->_dtoController;
}

- (void)setDtoController:(id)a3
{
  objc_storeStrong((id *)&self->_dtoController, a3);
}

- (BOOL)isFindMyEnabled
{
  return self->_isFindMyEnabled;
}

- (void)setIsFindMyEnabled:(BOOL)a3
{
  self->_isFindMyEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dtoController, 0);
}

void __57__PSUIDeviceTakeOverSectionController_proceedToEnableDTO__block_invoke_65_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "DTO: Turn On Protection [Failed] - No instance (self)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __58__PSUIDeviceTakeOverSectionController_proceedToDisableDTO__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "DTO: Turn Off Protection [Failed] - No instance (self)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __58__PSUIDeviceTakeOverSectionController_proceedToDisableDTO__block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "DTO: Turn Off Protection [Failed] as we are Ratcheted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __56__PSUIDeviceTakeOverSectionController_openLearnMoreLink__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "DTO: Failed to open support link.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __66__PSUIDeviceTakeOverSectionController_setUpFindMyEnablementStatus__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "Find My Device: Failed to set property - No instance (self)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __66__PSUIDeviceTakeOverSectionController_setUpFindMyEnablementStatus__block_invoke_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_3(&dword_22E0C8000, a2, v4, "Find My Device: Failed to retrieve state: %@", (uint8_t *)&v5);

}

- (void)ensureAccountSecurityIsSufficientWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = 0;
  OUTLINED_FUNCTION_3(&dword_22E0C8000, a1, a3, "Account security: Upgrading [Failed] - %@", (uint8_t *)&v3);
}

void __94__PSUIDeviceTakeOverSectionController_showDTOAlertForFailureToToggleToState_withRatchetError___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "DTO: Could not open Learn More - No instance (self)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __58__PSUIDeviceTakeOverSectionController_toggleToStrictMode___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "DTO: Unable to toggle Security Options UI - missing instance (self)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)userUpdatedSecurityOptionTo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "DTO: Will not toggle security options - DTO is off", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __67__PSUIDeviceTakeOverSectionController_userUpdatedSecurityOptionTo___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "DTO: Not downgrading security option to Familiar Locations only as we are Ratcheted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __67__PSUIDeviceTakeOverSectionController_userUpdatedSecurityOptionTo___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "DTO: Unable to toggle security option to non-Strict mode - missing instance (self)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __67__PSUIDeviceTakeOverSectionController_userUpdatedSecurityOptionTo___block_invoke_115_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "DTO: Unable to refresh Security Options UI - missing instance (self)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
