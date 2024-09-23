@implementation RMUILegacyProfilesViewModelProvider

- (RMUILegacyProfilesViewModelProvider)initWithScope:(int64_t)a3
{
  RMUILegacyProfilesViewModelProvider *v4;
  uint64_t v5;
  NSMutableArray *profileViewModels;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RMUILegacyProfilesViewModelProvider;
  v4 = -[RMUILegacyProfilesViewModelProvider init](&v8, sel_init);
  if (v4)
  {
    v5 = objc_opt_new();
    profileViewModels = v4->_profileViewModels;
    v4->_profileViewModels = (NSMutableArray *)v5;

    v4->_scope = a3;
  }
  return v4;
}

- (void)_updateViewModelsWithDeclarations:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[RMUILegacyProfilesViewModelProvider profileViewModels](self, "profileViewModels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v10);
        v12 = (void *)objc_opt_new();
        objc_msgSend(v11, "label", (_QWORD)v21);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setTitle:", v13);

        objc_msgSend(v11, "profileIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setProfileIdentifier:", v14);

        objc_msgSend(v11, "declaration");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setDeclaration:", v15);

        objc_msgSend(v12, "setSymbol:", 1);
        objc_msgSend(v12, "setIsInteractiveProfile:", objc_msgSend(v11, "isRequired") ^ 1);
        if (objc_msgSend(v12, "isInteractiveProfile"))
        {
          objc_msgSend(v11, "label");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "toggleViewModel");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setTitle:", v16);

          v18 = objc_msgSend(v11, "isActive");
          objc_msgSend(v11, "profileIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setInteractiveProfileActive:profileIdentifier:", v18, v19);

        }
        -[RMUILegacyProfilesViewModelProvider profileViewModels](self, "profileViewModels");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addObject:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

}

- (void)loadProfilesFromConfigurationsWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  void (**v12)(_QWORD, _QWORD);
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __91__RMUILegacyProfilesViewModelProvider_loadProfilesFromConfigurationsWithCompletionHandler___block_invoke;
  v13[3] = &unk_24DA086F8;
  objc_copyWeak(&v15, &location);
  v6 = v4;
  v14 = v6;
  v7 = (void (**)(_QWORD, _QWORD))MEMORY[0x219A22AA0](v13);
  -[RMUILegacyProfilesViewModelProvider observerStore](self, "observerStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __91__RMUILegacyProfilesViewModelProvider_loadProfilesFromConfigurationsWithCompletionHandler___block_invoke_8;
    v10[3] = &unk_24DA08720;
    v12 = v7;
    v10[4] = self;
    v11 = v8;
    objc_msgSend(v11, "displayableProfileConfigurationsWithCompletionHandler:", v10);

  }
  else
  {
    +[RMUILog profilesViewModelProvider](RMUILog, "profilesViewModelProvider");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[RMUILegacyProfilesViewModelProvider loadProfilesFromConfigurationsWithCompletionHandler:].cold.1(v9);

    v7[2](v7, MEMORY[0x24BDBD1A8]);
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __91__RMUILegacyProfilesViewModelProvider_loadProfilesFromConfigurationsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __91__RMUILegacyProfilesViewModelProvider_loadProfilesFromConfigurationsWithCompletionHandler___block_invoke_2;
  block[3] = &unk_24DA086D0;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v8);
}

void __91__RMUILegacyProfilesViewModelProvider_loadProfilesFromConfigurationsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateViewModelsWithDeclarations:", *(_QWORD *)(a1 + 32));
    v3 = v5;
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
    {
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
      v3 = v5;
    }
  }

}

void __91__RMUILegacyProfilesViewModelProvider_loadProfilesFromConfigurationsWithCompletionHandler___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  RMUIDeclarationInfo *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  RMUIDeclarationInfo *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  NSObject *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  +[RMUILog profilesViewModelProvider](RMUILog, "profilesViewModelProvider");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    v33 = v6;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __91__RMUILegacyProfilesViewModelProvider_loadProfilesFromConfigurationsWithCompletionHandler___block_invoke_8_cold_2(v5, v8);

    v37 = (void *)objc_msgSend(MEMORY[0x24BE7EC78], "newProfileControllerWithPrefix:scope:", *MEMORY[0x24BE7EC48], objc_msgSend(*(id *)(a1 + 32), "scope"));
    objc_msgSend(v37, "installedProfileIdentifiers");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(MEMORY[0x24BE7EC78], "newProfileControllerWithPrefix:scope:", *MEMORY[0x24BE7EC50], objc_msgSend(*(id *)(a1 + 32), "scope"));
    objc_msgSend(v9, "installedProfileIdentifiers");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)objc_opt_new();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v34 = v5;
    v10 = v5;
    v11 = v9;
    obj = v10;
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          v16 = v11;
          if (*(_QWORD *)v41 != v14)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_msgSend(v17, "declarationIdentifier", v33);
          v18 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "filterDeclarationIdentifiers");
          v19 = objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            v20 = (void *)v19;
            objc_msgSend(*(id *)(a1 + 32), "filterDeclarationIdentifiers");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "containsObject:", v18);

            if ((v22 & 1) == 0)
            {
              +[RMUILog profilesViewModelProvider](RMUILog, "profilesViewModelProvider");
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v45 = v18;
                _os_log_debug_impl(&dword_218DA5000, v23, OS_LOG_TYPE_DEBUG, "Ignoring configuration: %@", buf, 0xCu);
              }
              v11 = v16;
              goto LABEL_24;
            }
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v11 = v16;
            objc_msgSend(v16, "profileIdentifierForDeclaration:store:", v17, *(_QWORD *)(a1 + 40));
            v23 = objc_claimAutoreleasedReturnValue();
            if (!v23
              || (objc_msgSend(v16, "profileNameForProfileIdentifier:", v23),
                  (v24 = objc_claimAutoreleasedReturnValue()) == 0))
            {
              +[RMUILog profilesViewModelProvider](RMUILog, "profilesViewModelProvider");
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v45 = v23;
                _os_log_error_impl(&dword_218DA5000, v25, OS_LOG_TYPE_ERROR, "Error fetching name from legacy profile %{public}@", buf, 0xCu);
              }
              goto LABEL_23;
            }
            v25 = v24;
            v26 = objc_msgSend(v35, "containsObject:", v23);
            v27 = [RMUIDeclarationInfo alloc];
            v28 = v17;
            v29 = v25;
            v30 = v23;
            v31 = 1;
          }
          else
          {
            objc_opt_class();
            v11 = v16;
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_25;
            objc_msgSend(v37, "profileIdentifierForDeclaration:store:", v17, *(_QWORD *)(a1 + 40));
            v23 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "payloadVisibleName");
            v25 = objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v36, "containsObject:", v23);
            v27 = [RMUIDeclarationInfo alloc];
            v28 = v17;
            v29 = v25;
            v30 = v23;
            v31 = 0;
          }
          v32 = -[RMUIDeclarationInfo initWithProfileDeclaration:label:profileIdentifier:isRequired:isActive:](v27, "initWithProfileDeclaration:label:profileIdentifier:isRequired:isActive:", v28, v29, v30, v31, v26);
          objc_msgSend(v38, "addObject:", v32);

          v11 = v16;
LABEL_23:

LABEL_24:
LABEL_25:

        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      }
      while (v13);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v6 = v33;
    v5 = v34;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __91__RMUILegacyProfilesViewModelProvider_loadProfilesFromConfigurationsWithCompletionHandler___block_invoke_8_cold_1((uint64_t)v6, v8);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (NSMutableArray)profileViewModels
{
  return self->_profileViewModels;
}

- (void)setProfileViewModels:(id)a3
{
  objc_storeStrong((id *)&self->_profileViewModels, a3);
}

- (RMObserverStore)observerStore
{
  return self->_observerStore;
}

- (void)setObserverStore:(id)a3
{
  objc_storeStrong((id *)&self->_observerStore, a3);
}

- (NSSet)filterDeclarationIdentifiers
{
  return self->_filterDeclarationIdentifiers;
}

- (void)setFilterDeclarationIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_filterDeclarationIdentifiers, a3);
}

- (int64_t)scope
{
  return self->_scope;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterDeclarationIdentifiers, 0);
  objc_storeStrong((id *)&self->_observerStore, 0);
  objc_storeStrong((id *)&self->_profileViewModels, 0);
}

- (void)loadProfilesFromConfigurationsWithCompletionHandler:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_218DA5000, log, OS_LOG_TYPE_ERROR, "Cannot loadProfiles without an observerStore", v1, 2u);
}

void __91__RMUILegacyProfilesViewModelProvider_loadProfilesFromConfigurationsWithCompletionHandler___block_invoke_8_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_218DA5000, a2, OS_LOG_TYPE_ERROR, "Failed to find RMConfigurationTypeLegacyProfiles & RMConfigurationTypeLegacyInteractiveProfiles configurations: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __91__RMUILegacyProfilesViewModelProvider_loadProfilesFromConfigurationsWithCompletionHandler___block_invoke_8_cold_2(void *a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 134217984;
  v4 = objc_msgSend(a1, "count");
  _os_log_debug_impl(&dword_218DA5000, a2, OS_LOG_TYPE_DEBUG, "Found RMConfigurationTypeLegacyProfiles & RMConfigurationTypeLegacyInteractiveProfiles configurations: %lu", (uint8_t *)&v3, 0xCu);
}

@end
