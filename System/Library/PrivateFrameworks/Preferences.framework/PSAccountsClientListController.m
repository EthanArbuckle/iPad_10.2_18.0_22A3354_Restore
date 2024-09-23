@implementation PSAccountsClientListController

- (PSAccountsClientListController)init
{
  PSAccountsClientListController *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  PSAccountsClientListController *v6;
  uint64_t v7;
  id acObserver;
  _QWORD v10[4];
  PSAccountsClientListController *v11;
  id v12;
  id location;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PSAccountsClientListController;
  v2 = -[PSListController init](&v14, sel_init);
  if (v2)
  {
    objc_initWeak(&location, v2);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x1E0C8F010];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __38__PSAccountsClientListController_init__block_invoke;
    v10[3] = &unk_1E4A67DF8;
    objc_copyWeak(&v12, &location);
    v6 = v2;
    v11 = v6;
    objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v5, 0, v4, v10);
    v7 = objc_claimAutoreleasedReturnValue();
    acObserver = v6->_acObserver;
    v6->_acObserver = (id)v7;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __38__PSAccountsClientListController_init__block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "updateAccountSpecifier");

  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "reloadSpecifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1384));

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self->_acObserver);

  v4.receiver = self;
  v4.super_class = (Class)PSAccountsClientListController;
  -[PSListController dealloc](&v4, sel_dealloc);
}

- (id)_visibleAccountTypeIDs
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[15];

  v10[14] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0C8F058];
  v10[0] = *MEMORY[0x1E0C8F140];
  v10[1] = v2;
  v3 = *MEMORY[0x1E0C8F0D0];
  v10[2] = *MEMORY[0x1E0C8F060];
  v10[3] = v3;
  v4 = *MEMORY[0x1E0C8F080];
  v10[4] = *MEMORY[0x1E0C8F118];
  v10[5] = v4;
  v5 = *MEMORY[0x1E0C8F100];
  v10[6] = *MEMORY[0x1E0C8F0B8];
  v10[7] = v5;
  v6 = *MEMORY[0x1E0C8F160];
  v10[8] = *MEMORY[0x1E0C8F0A8];
  v10[9] = v6;
  v7 = *MEMORY[0x1E0C8F0D8];
  v10[10] = *MEMORY[0x1E0C8F0E0];
  v10[11] = v7;
  v8 = *MEMORY[0x1E0C8F108];
  v10[12] = *MEMORY[0x1E0C8F030];
  v10[13] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 14);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PSAccountsClientListController;
  -[PSListController viewWillAppear:](&v5, sel_viewWillAppear_);
  -[PSAccountsClientListController updateAccountSpecifier](self, "updateAccountSpecifier");
  -[PSListController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", self->_accountSpecifier, v3);
}

- (id)requestedAccountDataclass
{
  return 0;
}

- (void)updateAccountSpecifier
{
  OUTLINED_FUNCTION_0_1(&dword_1A3819000, MEMORY[0x1E0C81028], a3, "updateAccountSpecifier defer", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

void __56__PSAccountsClientListController_updateAccountSpecifier__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  _BOOL8 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  _QWORD v41[4];
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v40 = a3;
  v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
  if (v6)
    __56__PSAccountsClientListController_updateAccountSpecifier__block_invoke_cold_2(v6, v7, v8, v9, v10, v11, v12, v13);
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v14 = v5;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v44;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v44 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v18);
        v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        if (*(_BYTE *)(v20 + 24) || !*(_QWORD *)(a1 + 32))
        {
          *(_BYTE *)(v20 + 24) = 1;
        }
        else
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v18), "provisionedDataclasses", v40);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v21, "containsObject:", *(_QWORD *)(a1 + 32));

        }
        if (!*(_QWORD *)(a1 + 32))
          goto LABEL_26;
        objc_msgSend(v19, "enabledDataclasses");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __56__PSAccountsClientListController_updateAccountSpecifier__block_invoke_27;
        v41[3] = &unk_1E4A67E20;
        v42 = *(id *)(a1 + 32);
        objc_msgSend(v22, "objectsPassingTest:", v41);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = objc_msgSend(v23, "count");
        if (v24)
        {
LABEL_26:
          objc_msgSend(v19, "accountPropertyForKey:", CFSTR("ACUIAccountSimpleDisplayName"), v40);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25
            || (objc_msgSend(v19, "accountDescription"), (v25 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
          {
            if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "length"))
            {
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "stringByAppendingString:", CFSTR(", "));
              v26 = objc_claimAutoreleasedReturnValue();
              v27 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
              v28 = *(void **)(v27 + 40);
              *(_QWORD *)(v27 + 40) = v26;

            }
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "stringByAppendingString:", v25);
            v29 = objc_claimAutoreleasedReturnValue();
            v30 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
            v31 = *(void **)(v30 + 40);
            *(_QWORD *)(v30 + 40) = v29;

          }
        }
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v16);
  }

  v32 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
  if (v32)
    __56__PSAccountsClientListController_updateAccountSpecifier__block_invoke_cold_1(v32, v33, v34, v35, v36, v37, v38, v39);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

uint64_t __56__PSAccountsClientListController_updateAccountSpecifier__block_invoke_27(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  uint64_t v6;

  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = objc_msgSend(v5, "hasPrefix:", *(_QWORD *)(a1 + 32));
  else
    v6 = 0;
  *a3 = v6;

  return v6;
}

uint64_t __56__PSAccountsClientListController_updateAccountSpecifier__block_invoke_45(uint64_t result)
{
  unsigned __int8 *v1;
  unsigned __int8 v2;

  v1 = (unsigned __int8 *)(*(_QWORD *)(result + 32) + 1400);
  do
    v2 = __ldaxr(v1);
  while (__stlxr(v2 & 0x7F, v1));
  return result;
}

uint64_t __56__PSAccountsClientListController_updateAccountSpecifier__block_invoke_47(uint64_t a1)
{
  unsigned __int8 *v1;
  unsigned __int8 v2;

  v1 = (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1400);
  do
    v2 = __ldaxr(v1);
  while (__stlxr(v2 & 0xBF, v1));
  return objc_msgSend(*(id *)(a1 + 32), "updateAccountSpecifier");
}

- (void)setSpecifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  -[PSAccountsClientListController updateAccountSpecifier](self, "updateAccountSpecifier");
  if (self->_accountSpecifier)
  {
    v5 = (void *)MEMORY[0x1E0C99DE8];
    +[PSSpecifier groupSpecifierWithName:](PSSpecifier, "groupSpecifierWithName:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayWithObjects:", v6, self->_accountSpecifier, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "cellType"))
    {
      +[PSSpecifier groupSpecifierWithName:](PSSpecifier, "groupSpecifierWithName:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v9);

    }
    objc_msgSend(v7, "addObjectsFromArray:", v4);

  }
  else
  {
    v7 = (void *)objc_msgSend(v4, "mutableCopy");
  }
  v10.receiver = self;
  v10.super_class = (Class)PSAccountsClientListController;
  -[PSListController setSpecifiers:](&v10, sel_setSpecifiers_, v7);

}

- (id)specifierForID:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  if (!self->_accountSpecifier
    || !-[NSArray count](self->super._specifiers, "count")
    || !-[NSArray containsObject:](self->super._specifiers, "containsObject:", self->_accountSpecifier))
  {
    -[PSAccountsClientListController setSpecifiers:](self, "setSpecifiers:", MEMORY[0x1E0C9AA60]);
  }
  v7.receiver = self;
  v7.super_class = (Class)PSAccountsClientListController;
  -[PSListController specifierForID:](&v7, sel_specifierForID_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_isAccountModificationDisabledByRestrictions
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46ED8]) == 2;

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_acObserver, 0);
  objc_storeStrong((id *)&self->_accountSpecifier, 0);
}

void __56__PSAccountsClientListController_updateAccountSpecifier__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A3819000, MEMORY[0x1E0C81028], a3, "visibleTopLevelAccountsWithAccountTypeIdentifiers signal", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

void __56__PSAccountsClientListController_updateAccountSpecifier__block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A3819000, MEMORY[0x1E0C81028], a3, "visibleTopLevelAccountsWithAccountTypeIdentifiers", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

@end
