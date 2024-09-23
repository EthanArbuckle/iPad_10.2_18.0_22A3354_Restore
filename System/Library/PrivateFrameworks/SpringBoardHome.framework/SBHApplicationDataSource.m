@implementation SBHApplicationDataSource

- (SBHApplicationDataSource)init
{
  return -[SBHApplicationDataSource initWithOptions:](self, "initWithOptions:", 3);
}

- (SBHApplicationDataSource)initWithOptions:(unint64_t)a3
{
  SBHApplicationDataSource *v4;
  id v5;
  void *v6;
  uint64_t v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *applications;
  NSMutableDictionary *v10;
  NSMutableDictionary *applicationPlaceholders;
  uint64_t v12;
  FBSApplicationLibrary *appLibrary;
  FBSApplicationLibrary *v14;
  uint64_t v15;
  FBSALOToken *addApplicationsObservationToken;
  FBSApplicationLibrary *v17;
  uint64_t v18;
  FBSALOToken *replaceApplicationsObservationToken;
  FBSApplicationLibrary *v20;
  uint64_t v21;
  FBSALOToken *updateApplicationsObservationToken;
  FBSApplicationLibrary *v23;
  uint64_t v24;
  FBSALOToken *removeApplicationsObservationToken;
  FBSApplicationLibrary *v26;
  uint64_t v27;
  FBSALOToken *demoteApplicationsObservationToken;
  FBSApplicationLibrary *v29;
  uint64_t v30;
  uint64_t v31;
  FBSALOToken *addPlaceholdersObservationToken;
  FBSApplicationLibrary *v33;
  uint64_t v34;
  FBSALOToken *removedPlaceholdersObservationToken;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  id v50;
  id location;
  _QWORD v52[5];
  objc_super v53;

  v53.receiver = self;
  v53.super_class = (Class)SBHApplicationDataSource;
  v4 = -[SBHApplicationDataSource init](&v53, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0D23080]);
    objc_msgSend(v5, "setAllowConcurrentLoading:", 1);
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setApplicationInfoClass:", v6);

    v7 = MEMORY[0x1E0C809B0];
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __44__SBHApplicationDataSource_initWithOptions___block_invoke;
    v52[3] = &__block_descriptor_40_e28_B16__0__LSApplicationProxy_8l;
    v52[4] = a3;
    objc_msgSend(v5, "setInstalledApplicationFilter:", v52);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    applications = v4->_applications;
    v4->_applications = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    applicationPlaceholders = v4->_applicationPlaceholders;
    v4->_applicationPlaceholders = v10;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0D23078]), "initWithConfiguration:", v5);
    appLibrary = v4->_appLibrary;
    v4->_appLibrary = (FBSApplicationLibrary *)v12;

    objc_initWeak(&location, v4);
    v14 = v4->_appLibrary;
    v49[0] = v7;
    v49[1] = 3221225472;
    v49[2] = __44__SBHApplicationDataSource_initWithOptions___block_invoke_2;
    v49[3] = &unk_1E8D8D9B8;
    objc_copyWeak(&v50, &location);
    -[FBSApplicationLibrary observeDidAddApplicationsWithBlock:](v14, "observeDidAddApplicationsWithBlock:", v49);
    v15 = objc_claimAutoreleasedReturnValue();
    addApplicationsObservationToken = v4->_addApplicationsObservationToken;
    v4->_addApplicationsObservationToken = (FBSALOToken *)v15;

    v17 = v4->_appLibrary;
    v47[0] = v7;
    v47[1] = 3221225472;
    v47[2] = __44__SBHApplicationDataSource_initWithOptions___block_invoke_4;
    v47[3] = &unk_1E8D8D9E0;
    objc_copyWeak(&v48, &location);
    -[FBSApplicationLibrary observeDidReplaceApplicationsWithBlock:](v17, "observeDidReplaceApplicationsWithBlock:", v47);
    v18 = objc_claimAutoreleasedReturnValue();
    replaceApplicationsObservationToken = v4->_replaceApplicationsObservationToken;
    v4->_replaceApplicationsObservationToken = (FBSALOToken *)v18;

    v20 = v4->_appLibrary;
    v45[0] = v7;
    v45[1] = 3221225472;
    v45[2] = __44__SBHApplicationDataSource_initWithOptions___block_invoke_6;
    v45[3] = &unk_1E8D8D9E0;
    objc_copyWeak(&v46, &location);
    -[FBSApplicationLibrary observeDidUpdateApplicationsWithBlock:](v20, "observeDidUpdateApplicationsWithBlock:", v45);
    v21 = objc_claimAutoreleasedReturnValue();
    updateApplicationsObservationToken = v4->_updateApplicationsObservationToken;
    v4->_updateApplicationsObservationToken = (FBSALOToken *)v21;

    v23 = v4->_appLibrary;
    v43[0] = v7;
    v43[1] = 3221225472;
    v43[2] = __44__SBHApplicationDataSource_initWithOptions___block_invoke_8;
    v43[3] = &unk_1E8D8D9B8;
    objc_copyWeak(&v44, &location);
    -[FBSApplicationLibrary observeDidRemoveApplicationsWithBlock:](v23, "observeDidRemoveApplicationsWithBlock:", v43);
    v24 = objc_claimAutoreleasedReturnValue();
    removeApplicationsObservationToken = v4->_removeApplicationsObservationToken;
    v4->_removeApplicationsObservationToken = (FBSALOToken *)v24;

    v26 = v4->_appLibrary;
    v41[0] = v7;
    v41[1] = 3221225472;
    v41[2] = __44__SBHApplicationDataSource_initWithOptions___block_invoke_10;
    v41[3] = &unk_1E8D8D9B8;
    objc_copyWeak(&v42, &location);
    -[FBSApplicationLibrary observeDidDemoteApplicationsWithBlock:](v26, "observeDidDemoteApplicationsWithBlock:", v41);
    v27 = objc_claimAutoreleasedReturnValue();
    demoteApplicationsObservationToken = v4->_demoteApplicationsObservationToken;
    v4->_demoteApplicationsObservationToken = (FBSALOToken *)v27;

    v29 = v4->_appLibrary;
    v30 = v7;
    v39[0] = v7;
    v39[1] = 3221225472;
    v39[2] = __44__SBHApplicationDataSource_initWithOptions___block_invoke_12;
    v39[3] = &unk_1E8D8D9B8;
    objc_copyWeak(&v40, &location);
    -[FBSApplicationLibrary observeDidAddPlaceholdersWithBlock:](v29, "observeDidAddPlaceholdersWithBlock:", v39);
    v31 = objc_claimAutoreleasedReturnValue();
    addPlaceholdersObservationToken = v4->_addPlaceholdersObservationToken;
    v4->_addPlaceholdersObservationToken = (FBSALOToken *)v31;

    v33 = v4->_appLibrary;
    v37[0] = v30;
    v37[1] = 3221225472;
    v37[2] = __44__SBHApplicationDataSource_initWithOptions___block_invoke_14;
    v37[3] = &unk_1E8D8D9B8;
    objc_copyWeak(&v38, &location);
    -[FBSApplicationLibrary observeDidCancelPlaceholdersWithBlock:](v33, "observeDidCancelPlaceholdersWithBlock:", v37);
    v34 = objc_claimAutoreleasedReturnValue();
    removedPlaceholdersObservationToken = v4->_removedPlaceholdersObservationToken;
    v4->_removedPlaceholdersObservationToken = (FBSALOToken *)v34;

    objc_destroyWeak(&v38);
    objc_destroyWeak(&v40);
    objc_destroyWeak(&v42);
    objc_destroyWeak(&v44);
    objc_destroyWeak(&v46);
    objc_destroyWeak(&v48);
    objc_destroyWeak(&v50);
    objc_destroyWeak(&location);

  }
  return v4;
}

uint64_t __44__SBHApplicationDataSource_initWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(v3, "appTags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", CFSTR("hidden"));

  if ((v5 & 1) == 0)
  {
    objc_msgSend(v3, "applicationType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = *(_QWORD *)(a1 + 32);
    if ((v9 & 1) != 0)
    {
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("User")) & 1) != 0)
        goto LABEL_11;
      v9 = *(_QWORD *)(a1 + 32);
    }
    if ((v9 & 2) != 0)
    {
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("System")) & 1) != 0)
        goto LABEL_11;
      v9 = *(_QWORD *)(a1 + 32);
    }
    if ((v9 & 4) == 0 || (objc_msgSend(v8, "isEqualToString:", CFSTR("Internal")) & 1) == 0)
    {
      v6 = 0;
      goto LABEL_13;
    }
LABEL_11:
    v6 = 1;
LABEL_13:

    goto LABEL_14;
  }
  v6 = 0;
LABEL_14:

  return v6;
}

void __44__SBHApplicationDataSource_initWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  v4 = v3;
  BSDispatchMain();

  objc_destroyWeak(&v5);
}

void __44__SBHApplicationDataSource_initWithOptions___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_didAddApplicationsInfo:", *(_QWORD *)(a1 + 32));

}

void __44__SBHApplicationDataSource_initWithOptions___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  v4 = v3;
  BSDispatchMain();

  objc_destroyWeak(&v5);
}

void __44__SBHApplicationDataSource_initWithOptions___block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_didReplaceApplicationsInfo:", *(_QWORD *)(a1 + 32));

}

void __44__SBHApplicationDataSource_initWithOptions___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  v4 = v3;
  BSDispatchMain();

  objc_destroyWeak(&v5);
}

void __44__SBHApplicationDataSource_initWithOptions___block_invoke_7(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_didReplaceApplicationsInfo:", *(_QWORD *)(a1 + 32));

}

void __44__SBHApplicationDataSource_initWithOptions___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  v4 = v3;
  BSDispatchMain();

  objc_destroyWeak(&v5);
}

void __44__SBHApplicationDataSource_initWithOptions___block_invoke_9(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_didRemoveApplicationsInfo:", *(_QWORD *)(a1 + 32));

}

void __44__SBHApplicationDataSource_initWithOptions___block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  v4 = v3;
  BSDispatchMain();

  objc_destroyWeak(&v5);
}

void __44__SBHApplicationDataSource_initWithOptions___block_invoke_11(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_didRemoveApplicationsInfo:", *(_QWORD *)(a1 + 32));

}

void __44__SBHApplicationDataSource_initWithOptions___block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  v4 = v3;
  BSDispatchMain();

  objc_destroyWeak(&v5);
}

void __44__SBHApplicationDataSource_initWithOptions___block_invoke_13(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_didAddPlaceholders:", *(_QWORD *)(a1 + 32));

}

void __44__SBHApplicationDataSource_initWithOptions___block_invoke_14(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  v4 = v3;
  BSDispatchMain();

  objc_destroyWeak(&v5);
}

void __44__SBHApplicationDataSource_initWithOptions___block_invoke_15(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_didRemovePlaceholders:", *(_QWORD *)(a1 + 32));

}

- (void)dealloc
{
  objc_super v3;

  if (self->_addApplicationsObservationToken)
    -[FBSApplicationLibrary removeObserverForToken:](self->_appLibrary, "removeObserverForToken:");
  if (self->_replaceApplicationsObservationToken)
    -[FBSApplicationLibrary removeObserverForToken:](self->_appLibrary, "removeObserverForToken:");
  if (self->_updateApplicationsObservationToken)
    -[FBSApplicationLibrary removeObserverForToken:](self->_appLibrary, "removeObserverForToken:");
  if (self->_removeApplicationsObservationToken)
    -[FBSApplicationLibrary removeObserverForToken:](self->_appLibrary, "removeObserverForToken:");
  if (self->_demoteApplicationsObservationToken)
    -[FBSApplicationLibrary removeObserverForToken:](self->_appLibrary, "removeObserverForToken:");
  if (self->_addPlaceholdersObservationToken)
    -[FBSApplicationLibrary removeObserverForToken:](self->_appLibrary, "removeObserverForToken:");
  if (self->_removedPlaceholdersObservationToken)
    -[FBSApplicationLibrary removeObserverForToken:](self->_appLibrary, "removeObserverForToken:");
  v3.receiver = self;
  v3.super_class = (Class)SBHApplicationDataSource;
  -[SBHApplicationDataSource dealloc](&v3, sel_dealloc);
}

- (id)applicationWithBundleIdentifier:(id)a3
{
  id v4;
  SBHSimpleApplication *v5;
  void *v6;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_applications, "objectForKey:", v4);
  v5 = (SBHSimpleApplication *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[FBSApplicationLibrary applicationInfoForBundleIdentifier:](self->_appLibrary, "applicationInfoForBundleIdentifier:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v5 = -[SBHSimpleApplication initWithApplicationInfo:]([SBHSimpleApplication alloc], "initWithApplicationInfo:", v6);
      -[SBHSimpleApplication setIconModelApplicationDataSource:](v5, "setIconModelApplicationDataSource:", self);
      -[NSMutableDictionary setObject:forKey:](self->_applications, "setObject:forKey:", v5, v4);
    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (id)applicationPlaceholderWithBundleIdentifier:(id)a3
{
  id v4;
  SBHProxiedApplicationPlaceholder *v5;
  void *v6;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_applicationPlaceholders, "objectForKey:", v4);
  v5 = (SBHProxiedApplicationPlaceholder *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[FBSApplicationLibrary placeholderWithBundleIdentifier:](self->_appLibrary, "placeholderWithBundleIdentifier:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v5 = -[SBHProxiedApplicationPlaceholder initWithPlaceholderProxy:]([SBHProxiedApplicationPlaceholder alloc], "initWithPlaceholderProxy:", v6);
      -[NSMutableDictionary setObject:forKey:](self->_applicationPlaceholders, "setObject:forKey:", v5, v4);
    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (void)uninstallApplicationWithBundleIdentifier:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v7;
  objc_class *v8;
  id v9;
  id v10;
  FBSApplicationLibrary *appLibrary;
  id v12;
  _QWORD v13[4];
  id v14;

  v7 = a5;
  v8 = (objc_class *)MEMORY[0x1E0D23088];
  v9 = a3;
  v10 = objc_alloc_init(v8);
  objc_msgSend(v10, "setUserInitiated:", 1);
  appLibrary = self->_appLibrary;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __88__SBHApplicationDataSource_uninstallApplicationWithBundleIdentifier_options_completion___block_invoke;
  v13[3] = &unk_1E8D85A58;
  v14 = v7;
  v12 = v7;
  -[FBSApplicationLibrary uninstallApplication:withOptions:completion:](appLibrary, "uninstallApplication:withOptions:completion:", v9, v10, v13);

}

void __88__SBHApplicationDataSource_uninstallApplicationWithBundleIdentifier_options_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __88__SBHApplicationDataSource_uninstallApplicationWithBundleIdentifier_options_completion___block_invoke_2;
  v5[3] = &unk_1E8D84D28;
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __88__SBHApplicationDataSource_uninstallApplicationWithBundleIdentifier_options_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, *(_QWORD *)(a1 + 32) == 0);
  return result;
}

- (id)applicationsForApplicationsInfo:(id)a3
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
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "bundleIdentifier", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBHApplicationDataSource applicationWithBundleIdentifier:](self, "applicationWithBundleIdentifier:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v5, "addObject:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)applicationPlaceholdersForFrontBoardPlaceholders:(id)a3
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
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "bundleIdentifier", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBHApplicationDataSource applicationPlaceholderWithBundleIdentifier:](self, "applicationPlaceholderWithBundleIdentifier:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v5, "addObject:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)_didAddApplicationsInfo:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[SBHApplicationDataSource applicationsForApplicationsInfo:](self, "applicationsForApplicationsInfo:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "iconModelApplicationDataSource:applicationsAdded:", self, v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_didReplaceApplicationsInfo:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v11, "bundleIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary removeObjectForKey:](self->_applications, "removeObjectForKey:", v12);
        objc_msgSend(v6, "objectForKey:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v5, "addObject:", v13);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v8);
  }

  -[SBHApplicationDataSource applicationsForApplicationsInfo:](self, "applicationsForApplicationsInfo:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v15 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v20, "iconModelApplicationDataSource:applicationsUpdated:", self, v14);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v17);
  }

}

- (void)_didRemoveApplicationsInfo:(id)a3
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBHApplicationDataSource applicationsForApplicationsInfo:](self, "applicationsForApplicationsInfo:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v10), "bundleIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary removeObjectForKey:](self->_applications, "removeObjectForKey:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v12 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v16);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v17, "iconModelApplicationDataSource:applicationsRemoved:", self, v5);
          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v14);
    }

  }
}

- (void)_didAddPlaceholders:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[SBHApplicationDataSource applicationPlaceholdersForFrontBoardPlaceholders:](self, "applicationPlaceholdersForFrontBoardPlaceholders:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "iconModelApplicationDataSource:applicationPlaceholdersAdded:", self, v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_didRemovePlaceholders:(id)a3
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBHApplicationDataSource applicationPlaceholdersForFrontBoardPlaceholders:](self, "applicationPlaceholdersForFrontBoardPlaceholders:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v10), "bundleIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary removeObjectForKey:](self->_applicationPlaceholders, "removeObjectForKey:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v12 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v16);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v17, "iconModelApplicationDataSource:applicationPlaceholdersRemoved:", self, v5);
          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v14);
    }

  }
}

- (id)allApplicationsForIconModel:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[FBSApplicationLibrary allInstalledApplications](self->_appLibrary, "allInstalledApplications", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "bundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBHApplicationDataSource applicationWithBundleIdentifier:](self, "applicationWithBundleIdentifier:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v4, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)iconModel:(id)a3 applicationWithBundleIdentifier:(id)a4
{
  return -[SBHApplicationDataSource applicationWithBundleIdentifier:](self, "applicationWithBundleIdentifier:", a4);
}

- (id)allApplicationPlaceholdersForIconModel:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[FBSApplicationLibrary allPlaceholders](self->_appLibrary, "allPlaceholders", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "bundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBHApplicationDataSource applicationPlaceholderWithBundleIdentifier:](self, "applicationPlaceholderWithBundleIdentifier:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v4, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)addIconModelApplicationDataSourceObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  observers = self->_observers;
  v8 = v4;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_observers;
    self->_observers = v6;

    v4 = v8;
    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v4);

}

- (void)removeIconModelApplicationDataSourceObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)uninstallApplicationWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __80__SBHApplicationDataSource_uninstallApplicationWithBundleIdentifier_completion___block_invoke;
  v8[3] = &unk_1E8D876D8;
  v9 = v6;
  v7 = v6;
  -[SBHApplicationDataSource uninstallApplicationWithBundleIdentifier:options:completion:](self, "uninstallApplicationWithBundleIdentifier:options:completion:", a3, 0, v8);

}

uint64_t __80__SBHApplicationDataSource_uninstallApplicationWithBundleIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 == 1);
  return result;
}

- (FBSApplicationLibrary)appLibrary
{
  return self->_appLibrary;
}

- (FBSALOToken)addApplicationsObservationToken
{
  return self->_addApplicationsObservationToken;
}

- (FBSALOToken)replaceApplicationsObservationToken
{
  return self->_replaceApplicationsObservationToken;
}

- (FBSALOToken)updateApplicationsObservationToken
{
  return self->_updateApplicationsObservationToken;
}

- (FBSALOToken)removeApplicationsObservationToken
{
  return self->_removeApplicationsObservationToken;
}

- (FBSALOToken)demoteApplicationsObservationToken
{
  return self->_demoteApplicationsObservationToken;
}

- (FBSALOToken)addPlaceholdersObservationToken
{
  return self->_addPlaceholdersObservationToken;
}

- (FBSALOToken)removedPlaceholdersObservationToken
{
  return self->_removedPlaceholdersObservationToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedPlaceholdersObservationToken, 0);
  objc_storeStrong((id *)&self->_addPlaceholdersObservationToken, 0);
  objc_storeStrong((id *)&self->_demoteApplicationsObservationToken, 0);
  objc_storeStrong((id *)&self->_removeApplicationsObservationToken, 0);
  objc_storeStrong((id *)&self->_updateApplicationsObservationToken, 0);
  objc_storeStrong((id *)&self->_replaceApplicationsObservationToken, 0);
  objc_storeStrong((id *)&self->_addApplicationsObservationToken, 0);
  objc_storeStrong((id *)&self->_appLibrary, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_applicationPlaceholders, 0);
  objc_storeStrong((id *)&self->_applications, 0);
}

@end
