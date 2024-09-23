@implementation STAllowanceProgressGroupSpecifierProvider

- (STAllowanceProgressGroupSpecifierProvider)init
{
  void *v3;
  STAllowanceProgressGroupSpecifierProvider *v4;

  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[STAllowanceProgressGroupSpecifierProvider initWithBudgetedIdentifiers:usageItem:](self, "initWithBudgetedIdentifiers:usageItem:", v3, 0);

  return v4;
}

- (STAllowanceProgressGroupSpecifierProvider)initWithBudgetedIdentifiers:(id)a3 usageItem:(id)a4
{
  id v6;
  id v7;
  STAllowanceProgressGroupSpecifierProvider *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSSet *budgetedIdentifiers;
  void *v15;
  uint64_t v16;
  PSSpecifier *addAllowanceSpecifier;
  objc_class *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)STAllowanceProgressGroupSpecifierProvider;
  v8 = -[STGroupSpecifierProvider init](&v22, sel_init);
  if (v8)
  {
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("AllowancesGroupName"), &stru_24DB8A1D0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "groupSpecifierWithName:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[STGroupSpecifierProvider setGroupSpecifier:](v8, "setGroupSpecifier:", v12);

    -[STGroupSpecifierProvider setIsHidden:](v8, "setIsHidden:", 1);
    v13 = objc_msgSend(v6, "copy");
    budgetedIdentifiers = v8->_budgetedIdentifiers;
    v8->_budgetedIdentifiers = (NSSet *)v13;

    objc_storeStrong((id *)&v8->_usageItem, a4);
    if (v7)
    {
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("AddLimitSpecifierName"), &stru_24DB8A1D0, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v15, v8, 0, 0, 0, 13, objc_opt_class());
      v16 = objc_claimAutoreleasedReturnValue();
      addAllowanceSpecifier = v8->_addAllowanceSpecifier;
      v8->_addAllowanceSpecifier = (PSSpecifier *)v16;

      -[PSSpecifier setButtonAction:](v8->_addAllowanceSpecifier, "setButtonAction:", sel__showAllowanceSetupListController_);
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifier setObject:forKeyedSubscript:](v8->_addAllowanceSpecifier, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BE75C60]);

      -[PSSpecifier setObject:forKeyedSubscript:](v8->_addAllowanceSpecifier, "setObject:forKeyedSubscript:", &unk_24DBBE670, *MEMORY[0x24BE75E18]);
      -[PSSpecifier setObject:forKeyedSubscript:](v8->_addAllowanceSpecifier, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], 0x24DB91010);
      if (objc_msgSend(MEMORY[0x24BEBD3C8], "isRunningInStoreDemoMode"))
        -[PSSpecifier setButtonAction:](v8->_addAllowanceSpecifier, "setButtonAction:", sel_showStoreDemoAlert);
      -[STGroupSpecifierProvider mutableSpecifiers](v8, "mutableSpecifiers");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObject:", v8->_addAllowanceSpecifier);

    }
  }

  return v8;
}

- (void)setCoordinator:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[STUsageGroupSpecifierProvider coordinator](self, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("timeAllowancesCoordinator.viewModel.allowancesByIdentifier"), "KVOContextAllowanceProgressGroupSpecifierProvider");
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("usageDetailsCoordinator.viewModel.hasUsageData"), "KVOContextAllowanceProgressGroupSpecifierProvider");
  v6.receiver = self;
  v6.super_class = (Class)STAllowanceProgressGroupSpecifierProvider;
  -[STUsageGroupSpecifierProvider setCoordinator:](&v6, sel_setCoordinator_, v4);
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("timeAllowancesCoordinator.viewModel.allowancesByIdentifier"), 7, "KVOContextAllowanceProgressGroupSpecifierProvider");
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("usageDetailsCoordinator.viewModel.hasUsageData"), 5, "KVOContextAllowanceProgressGroupSpecifierProvider");

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v10 = a3;
  v11 = a5;
  if (a6 == "KVOContextAllowanceProgressGroupSpecifierProvider")
  {
    -[STUsageGroupSpecifierProvider coordinator](self, "coordinator");

    if (objc_msgSend(v10, "isEqualToString:", CFSTR("timeAllowancesCoordinator.viewModel.allowancesByIdentifier")))
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 == v13)
      {

        v12 = 0;
      }
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14 == v15)
      {

        v14 = 0;
      }
      -[STAllowanceProgressGroupSpecifierProvider _allowancesByIdentifierDidChangeFrom:to:](self, "_allowancesByIdentifierDidChangeFrom:to:", v12, v14);
    }
    else
    {
      -[STUsageGroupSpecifierProvider coordinator](self, "coordinator");

      if (!objc_msgSend(v10, "isEqualToString:", CFSTR("usageDetailsCoordinator.viewModel.hasUsageData")))
        goto LABEL_16;
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 == v16)
      {

        v12 = 0;
      }
      if ((objc_msgSend(v12, "BOOLValue") & 1) == 0)
      {
        -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", 1);
        goto LABEL_10;
      }
      -[STGroupSpecifierProvider specifiers](self, "specifiers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", objc_msgSend(v14, "count") == 0);
    }

LABEL_10:
    goto LABEL_16;
  }
  v17.receiver = self;
  v17.super_class = (Class)STAllowanceProgressGroupSpecifierProvider;
  -[STAllowanceProgressGroupSpecifierProvider observeValueForKeyPath:ofObject:change:context:](&v17, sel_observeValueForKeyPath_ofObject_change_context_, v10, a4, v11, a6);
LABEL_16:

}

- (void)_allowancesByIdentifierDidChangeFrom:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  uint64_t v39;
  uint64_t m;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t n;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t ii;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  id obj;
  id obja;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  void *v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  _QWORD v108[4];
  id v109;
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  _BYTE v114[128];
  _BYTE v115[128];
  uint64_t v116;

  v116 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[STAllowanceProgressGroupSpecifierProvider budgetedIdentifiers](self, "budgetedIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v9 = (void *)MEMORY[0x24BDD1758];
    v108[0] = MEMORY[0x24BDAC760];
    v108[1] = 3221225472;
    v108[2] = __85__STAllowanceProgressGroupSpecifierProvider__allowancesByIdentifierDidChangeFrom_to___block_invoke;
    v108[3] = &unk_24DB866B8;
    v109 = v8;
    objc_msgSend(v9, "predicateWithBlock:", v108);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allValues");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "filteredArrayUsingPredicate:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "allValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "filteredArrayUsingPredicate:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v6, "allValues");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allValues");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v12 != v14 && (objc_msgSend(v12, "isEqual:", v14) & 1) == 0)
  {
    v69 = v8;
    v70 = v7;
    v76 = v6;
    v71 = v12;
    v15 = (void *)objc_msgSend(v12, "mutableCopy");
    v104 = 0u;
    v105 = 0u;
    v106 = 0u;
    v107 = 0u;
    v68 = v14;
    v16 = v14;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v104, v115, 16);
    v83 = v15;
    if (v17)
    {
      v18 = v17;
      v19 = 0;
      v20 = *(_QWORD *)v105;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v105 != v20)
            objc_enumerationMutation(v16);
          v22 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * i);
          if (v15
            && (v23 = objc_msgSend(v15, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * i)),
                v23 != 0x7FFFFFFFFFFFFFFFLL))
          {
            objc_msgSend(v15, "removeObjectAtIndex:", v23);
          }
          else
          {
            if (v19)
            {
              objc_msgSend(v22, "bundleIdentifiers");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "addObjectsFromArray:", v24);
            }
            else
            {
              v25 = objc_alloc(MEMORY[0x24BDBCEF0]);
              objc_msgSend(v22, "bundleIdentifiers");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = v25;
              v15 = v83;
              v19 = (void *)objc_msgSend(v26, "initWithArray:", v24);
            }

          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v104, v115, 16);
      }
      while (v18);
    }
    else
    {
      v19 = 0;
    }

    objc_msgSend(MEMORY[0x24BE844B8], "sharedCache");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v16, "mutableCopy");
    v100 = 0u;
    v101 = 0u;
    v102 = 0u;
    v103 = 0u;
    obj = v12;
    v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v114, 16);
    v77 = v28;
    if (v29)
    {
      v30 = v29;
      v80 = *(_QWORD *)v101;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v101 != v80)
            objc_enumerationMutation(obj);
          v32 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * j);
          if (v28
            && (v33 = objc_msgSend(v28, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v100 + 1) + 8 * j)),
                v33 != 0x7FFFFFFFFFFFFFFFLL))
          {
            objc_msgSend(v28, "removeObjectAtIndex:", v33);
          }
          else
          {
            v98 = 0u;
            v99 = 0u;
            v96 = 0u;
            v97 = 0u;
            objc_msgSend(v32, "bundleIdentifiers");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v96, v113, 16);
            if (v35)
            {
              v36 = v35;
              v37 = *(_QWORD *)v97;
              do
              {
                for (k = 0; k != v36; ++k)
                {
                  if (*(_QWORD *)v97 != v37)
                    objc_enumerationMutation(v34);
                  v39 = *(_QWORD *)(*((_QWORD *)&v96 + 1) + 8 * k);
                  if ((objc_msgSend(v19, "containsObject:", v39) & 1) != 0)
                    objc_msgSend(v19, "removeObject:", v39);
                  else
                    objc_msgSend(v27, "removeObserver:bundleIdentifier:", self, v39);
                }
                v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v96, v113, 16);
              }
              while (v36);
            }

            v15 = v83;
            v28 = v77;
          }
        }
        v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v114, 16);
      }
      while (v30);
    }

    v72 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v15, "count"));
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    v95 = 0u;
    -[STGroupSpecifierProvider specifiers](self, "specifiers");
    v75 = (id)objc_claimAutoreleasedReturnValue();
    v81 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v92, v112, 16);
    if (v81)
    {
      obja = *(id *)v93;
      do
      {
        for (m = 0; m != v81; ++m)
        {
          if (*(id *)v93 != obja)
            objc_enumerationMutation(v75);
          v41 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * m);
          objc_msgSend(v41, "userInfo");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          if (v42)
          {
            objc_msgSend(v28, "removeObject:", v42);
            objc_msgSend(v42, "identifier");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "objectForKeyedSubscript:", v43);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = objc_msgSend(v83, "containsObject:", v44);

            if (v45)
            {
              objc_msgSend(v28, "firstObject");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              if (v46)
              {
                objc_msgSend(v28, "removeObject:", v46);
                objc_msgSend(v41, "setUserInfo:", v46);
                v73 = (void *)MEMORY[0x24BE84510];
                objc_msgSend(v46, "categoryIdentifiers");
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "bundleIdentifiers");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "webDomains");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v73, "displayNameForUsageLimitWithCategoryIdentifiers:bundleIdentifiers:webDomains:", v74, v47, v48);
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "setName:", v49);

                v28 = v77;
                -[STGroupSpecifierProvider reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v41, 1);
              }
              else
              {
                objc_msgSend(v72, "addObject:", v41);
              }

            }
          }

        }
        v81 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v92, v112, 16);
      }
      while (v81);
    }

    v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v28, "count"));
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    v51 = v28;
    v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v88, v111, 16);
    if (v52)
    {
      v53 = v52;
      v54 = *(_QWORD *)v89;
      do
      {
        for (n = 0; n != v53; ++n)
        {
          if (*(_QWORD *)v89 != v54)
            objc_enumerationMutation(v51);
          -[STAllowanceProgressGroupSpecifierProvider _specifierForAllowance:](self, "_specifierForAllowance:", *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * n));
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "addObject:", v56);

        }
        v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v88, v111, 16);
      }
      while (v53);
    }

    -[STGroupSpecifierProvider mutableSpecifiers](self, "mutableSpecifiers");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "removeObjectsInArray:", v72);
    -[STAllowanceProgressGroupSpecifierProvider addAllowanceSpecifier](self, "addAllowanceSpecifier");
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    if (v58)
    {
      v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD15E0]), "initWithIndexesInRange:", objc_msgSend(v57, "count") - 1, objc_msgSend(v50, "count"));
      objc_msgSend(v57, "insertObjects:atIndexes:", v50, v59);

    }
    else
    {
      objc_msgSend(v57, "addObjectsFromArray:", v50);
    }
    v82 = v57;
    if (objc_msgSend(v57, "count"))
    {
      -[STUsageGroupSpecifierProvider coordinator](self, "coordinator");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "usageDetailsCoordinator");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "viewModel");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", objc_msgSend(v62, "hasUsageData") ^ 1);

    }
    else
    {
      -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", 1);
    }
    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    v63 = v19;
    v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v84, v110, 16);
    if (v64)
    {
      v65 = v64;
      v66 = *(_QWORD *)v85;
      do
      {
        for (ii = 0; ii != v65; ++ii)
        {
          if (*(_QWORD *)v85 != v66)
            objc_enumerationMutation(v63);
          objc_msgSend(v27, "addObserver:selector:bundleIdentifier:", self, sel__didFetchAppInfo_, *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * ii));
        }
        v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v84, v110, 16);
      }
      while (v65);
    }

    v6 = v76;
    v8 = v69;
    v7 = v70;
    v12 = v71;
    v14 = v68;
  }

}

uint64_t __85__STAllowanceProgressGroupSpecifierProvider__allowancesByIdentifierDidChangeFrom_to___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "bundleIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  v6 = v4;
  v7 = v5;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v29;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v29 != v11)
        objc_enumerationMutation(v8);
      if ((objc_msgSend(v7, "containsObject:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v12), (_QWORD)v28) & 1) != 0)
        goto LABEL_26;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

  objc_msgSend(v3, "webDomains");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(void **)(a1 + 32);
  v15 = v13;
  v7 = v14;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v8 = v15;
  v16 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v29;
LABEL_11:
    v19 = 0;
    while (1)
    {
      if (*(_QWORD *)v29 != v18)
        objc_enumerationMutation(v8);
      if ((objc_msgSend(v7, "containsObject:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v19)) & 1) != 0)
        break;
      if (v17 == ++v19)
      {
        v17 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v17)
          goto LABEL_11;
        goto LABEL_17;
      }
    }
LABEL_26:

    v24 = 1;
    goto LABEL_27;
  }
LABEL_17:

  objc_msgSend(v3, "categoryIdentifiers");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = *(void **)(a1 + 32);
  v22 = v20;
  v23 = v21;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v8 = v22;
  v24 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v29 != v25)
          objc_enumerationMutation(v8);
        if ((objc_msgSend(v23, "containsObject:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i)) & 1) != 0)
        {
          v24 = 1;
          goto LABEL_29;
        }
      }
      v24 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v24)
        continue;
      break;
    }
  }
LABEL_29:

LABEL_27:
  return v24;
}

- (id)_specifierForAllowance:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;

  v4 = (void *)MEMORY[0x24BE84510];
  v5 = a3;
  objc_msgSend(v5, "categoryIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "webDomains");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayNameForUsageLimitWithCategoryIdentifiers:bundleIdentifiers:webDomains:", v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v9, self, 0, sel__allowanceDetailText_, 0, 2, objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUserInfo:", v5);

  objc_msgSend(v10, "setControllerLoadAction:", sel__showAllowanceDetailListController_);
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE75C60]);

  objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_24DBBE670, *MEMORY[0x24BE75E18]);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], 0x24DB91010);

  return v10;
}

- (id)_allowanceDetailText:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "timeByDay");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("AllowanceCustomScheduleDetailText"), &stru_24DB8A1D0, 0);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD14F8], "st_sharedShortDynamicDateFormatter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "time");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[STAllowance timeIntervalForAllowanceDateComponents:](STAllowance, "timeIntervalForAllowanceDateComponents:", v8);
      objc_msgSend(v6, "stringFromTimeInterval:");
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v7 = 0;
  }
  if (v7)
    v9 = v7;
  else
    v9 = &stru_24DB8A1D0;
  v10 = v9;

  return v10;
}

- (void)_showAllowanceDetailListController:(id)a3
{
  id v4;
  STAllowanceDetailListController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  STAllowanceDetailListController *v10;

  v4 = a3;
  v5 = [STAllowanceDetailListController alloc];
  -[STUsageGroupSpecifierProvider coordinator](self, "coordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[STAllowanceDetailListController initWithCoordinator:](v5, "initWithCoordinator:", v6);

  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STAllowanceDetailListController setAllowance:](v10, "setAllowance:", v7);

  -[STAllowanceDetailListController setDelegate:](v10, "setDelegate:", self);
  -[STGroupSpecifierProvider delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STAllowanceDetailListController setParentController:](v10, "setParentController:", v8);
  objc_msgSend(v8, "rootController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STAllowanceDetailListController setRootController:](v10, "setRootController:", v9);

  -[STAllowanceDetailListController setSpecifier:](v10, "setSpecifier:", v4);
  -[STGroupSpecifierProvider showController:animated:](self, "showController:animated:", v10, 1);

}

- (void)_showAllowanceSetupListController:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  STAllowanceDetailListController *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[STAllowanceProgressGroupSpecifierProvider usageItem](self, "usageItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUsageGroupSpecifierProvider coordinator](self, "coordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setBehaviorType:", objc_msgSend(v7, "isPasscodeEnabled"));
  switch(objc_msgSend(v6, "itemType"))
  {
    case 1:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STAllowanceProgressGroupSpecifierProvider.m"), 279, CFSTR("Unexpected usage item: @"), v6);

      break;
    case 2:
    case 5:
    case 6:
      objc_msgSend(v6, "budgetItemIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v9;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setBundleIdentifiers:", v10);
      goto LABEL_6;
    case 3:
      objc_msgSend(v6, "budgetItemIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v9;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setCategoryIdentifiers:", v10);
      goto LABEL_6;
    case 4:
      objc_msgSend(v6, "budgetItemIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v9;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v15, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setWebDomains:", v10);
LABEL_6:

      break;
    default:
      break;
  }
  v12 = -[STAllowanceDetailListController initWithCoordinator:]([STAllowanceDetailListController alloc], "initWithCoordinator:", v7);
  -[STAllowanceDetailListController setAllowance:](v12, "setAllowance:", v8);
  -[STAllowanceDetailListController setDelegate:](v12, "setDelegate:", self);
  -[STAllowanceDetailListController setIsSetupController:](v12, "setIsSetupController:", 1);
  -[STAllowanceDetailListController setCreatingNewAllowance:](v12, "setCreatingNewAllowance:", 1);
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setSpecifier:", v5);

  objc_msgSend(v13, "showController:", v12);
  -[STGroupSpecifierProvider showController:animated:](self, "showController:animated:", v13, 1);

}

- (void)allowanceDetailController:(id)a3 didSaveAllowance:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  STAllowanceProgressGroupSpecifierProvider *v13;

  v6 = a3;
  v7 = a4;
  -[STUsageGroupSpecifierProvider coordinator](self, "coordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeAllowancesCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __88__STAllowanceProgressGroupSpecifierProvider_allowanceDetailController_didSaveAllowance___block_invoke;
  v11[3] = &unk_24DB86690;
  v12 = v6;
  v13 = self;
  v10 = v6;
  objc_msgSend(v9, "saveAllowance:completionHandler:", v7, v11);

}

void __88__STAllowanceProgressGroupSpecifierProvider_allowanceDetailController_didSaveAllowance___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  if (v3)
  {
    +[STUILog persistence](STUILog, "persistence");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __88__STAllowanceProgressGroupSpecifierProvider_allowanceDetailController_didSaveAllowance___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "isSetupController"))
    objc_msgSend(*(id *)(a1 + 40), "dismissViewControllerAnimated:", 1);

}

- (void)allowanceDetailController:(id)a3 didDeleteAllowance:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v5 = a4;
  -[STUsageGroupSpecifierProvider coordinator](self, "coordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeAllowancesCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __90__STAllowanceProgressGroupSpecifierProvider_allowanceDetailController_didDeleteAllowance___block_invoke;
  v8[3] = &unk_24DB866E0;
  v8[4] = self;
  objc_msgSend(v7, "deleteAllowance:completionHandler:", v5, v8);

}

void __90__STAllowanceProgressGroupSpecifierProvider_allowanceDetailController_didDeleteAllowance___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  if (v3)
  {
    +[STUILog persistence](STUILog, "persistence");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __90__STAllowanceProgressGroupSpecifierProvider_allowanceDetailController_didDeleteAllowance___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  }
  objc_msgSend(*(id *)(a1 + 32), "popToViewControllerAnimated:", 1);

}

- (void)allowanceDetailControllerDidCancel:(id)a3
{
  -[STGroupSpecifierProvider dismissViewControllerAnimated:](self, "dismissViewControllerAnimated:", 1);
}

- (void)_didFetchAppInfo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  STAllowanceProgressGroupSpecifierProvider *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE84778]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = self;
  -[STGroupSpecifierProvider specifiers](self, "specifiers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v11, "userInfo");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "bundleIdentifiers");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "containsObject:", v6))
        {
          v14 = (void *)MEMORY[0x24BE84510];
          objc_msgSend(v12, "categoryIdentifiers");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "webDomains");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "displayNameForUsageLimitWithCategoryIdentifiers:bundleIdentifiers:webDomains:", v15, v13, v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setName:", v17);

          -[STGroupSpecifierProvider reloadSpecifier:animated:](v18, "reloadSpecifier:animated:", v11, 1);
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

}

- (NSSet)budgetedIdentifiers
{
  return self->_budgetedIdentifiers;
}

- (STUsageItem)usageItem
{
  return self->_usageItem;
}

- (PSSpecifier)addAllowanceSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addAllowanceSpecifier, 0);
  objc_storeStrong((id *)&self->_usageItem, 0);
  objc_storeStrong((id *)&self->_budgetedIdentifiers, 0);
}

void __88__STAllowanceProgressGroupSpecifierProvider_allowanceDetailController_didSaveAllowance___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_219AB4000, a2, a3, "Failed to save edited allowance: %{public}@", a5, a6, a7, a8, 2u);
}

void __90__STAllowanceProgressGroupSpecifierProvider_allowanceDetailController_didDeleteAllowance___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_219AB4000, a2, a3, "Failed to delete allowance: %{public}@", a5, a6, a7, a8, 2u);
}

@end
