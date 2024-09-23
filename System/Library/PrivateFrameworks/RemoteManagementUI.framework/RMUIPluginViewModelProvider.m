@implementation RMUIPluginViewModelProvider

- (RMUIPluginViewModelProvider)init
{
  RMUIPluginViewModelProvider *v2;
  uint64_t v3;
  NSMutableArray *pluginSectionViewModels;
  uint64_t v5;
  NSMutableArray *pluginViewModels;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RMUIPluginViewModelProvider;
  v2 = -[RMUIPluginViewModelProvider init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    pluginSectionViewModels = v2->_pluginSectionViewModels;
    v2->_pluginSectionViewModels = (NSMutableArray *)v3;

    v5 = objc_opt_new();
    pluginViewModels = v2->_pluginViewModels;
    v2->_pluginViewModels = (NSMutableArray *)v5;

  }
  return v2;
}

- (void)_updateViewModelsWithDeclarations:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _QWORD v45[3];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[RMUIPluginViewModelProvider pluginSectionViewModels](self, "pluginSectionViewModels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  -[RMUIPluginViewModelProvider pluginViewModels](self, "pluginViewModels");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  v7 = (void *)objc_opt_new();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v41 != v11)
          objc_enumerationMutation(v8);
        -[RMUIPluginViewModelProvider _modelForDeclarationInfo:](self, "_modelForDeclarationInfo:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[RMUIPluginViewModelProvider _addModel:toSection:](self, "_addModel:toSection:", v13, v7);
        -[RMUIPluginViewModelProvider pluginViewModels](self, "pluginViewModels");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    }
    while (v10);
  }
  v34 = v8;

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("declarationType"), 1);
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:selector:", CFSTR("title"), 1, sel_localizedCaseInsensitiveCompare_);
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("declarationIdentifier"), 1);
  v17 = objc_claimAutoreleasedReturnValue();
  v32 = (void *)v16;
  v33 = (void *)v15;
  v45[0] = v15;
  v45[1] = v16;
  v31 = (void *)v17;
  v45[2] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v45, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMUIPluginViewModelProvider pluginViewModels](self, "pluginViewModels");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sortUsingDescriptors:", v18);

  objc_msgSend(v7, "allKeys");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v21;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v37 != v24)
          objc_enumerationMutation(obj);
        v26 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j);
        objc_msgSend(v7, "objectForKeyedSubscript:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "sortedArrayUsingDescriptors:", v18);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = +[RMUIPluginSectionViewModel newPluginSectionViewModelWithHeading:viewModels:](RMUIPluginSectionViewModel, "newPluginSectionViewModelWithHeading:viewModels:", v26, v28);

        -[RMUIPluginViewModelProvider pluginSectionViewModels](self, "pluginSectionViewModels");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addObject:", v29);

      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    }
    while (v23);
  }

}

- (id)_modelForDeclarationInfo:(id)a3
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
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  RMUIKeyValueDetailViewModel *v19;
  NSObject *v20;
  void *v21;
  RMUIKeyValueDetailViewModel *v22;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v6);

  objc_msgSend(v4, "declarationType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSymbol:", -[RMUIPluginViewModelProvider _symbolForDeclarationType:](self, "_symbolForDeclarationType:", v7));

  objc_msgSend(v4, "declarationIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDeclarationIdentifier:", v8);

  objc_msgSend(v4, "declarationServerToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDeclarationServerToken:", v9);

  objc_msgSend(v4, "declarationType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDeclarationType:", v10);

  objc_msgSend(v4, "details");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v25 = v5;
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v11, "count"));
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v24 = v11;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v27 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          if (objc_msgSend(v18, "count") == 2)
          {
            v19 = [RMUIKeyValueDetailViewModel alloc];
            objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
            v20 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectAtIndexedSubscript:", 1);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = -[RMUIKeyValueDetailViewModel initWithTitle:value:](v19, "initWithTitle:value:", v20, v21);
            objc_msgSend(v12, "addObject:", v22);

          }
          else
          {
            +[RMUILog pluginViewModelProvider](RMUILog, "pluginViewModelProvider");
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v31 = v18;
              _os_log_error_impl(&dword_218DA5000, v20, OS_LOG_TYPE_ERROR, "Cannot load details for non-tuple: %@", buf, 0xCu);
            }
          }

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      }
      while (v15);
    }

    v5 = v25;
    objc_msgSend(v25, "setDetailViewModels:", v12);

    v11 = v24;
  }

  return v5;
}

- (void)_addModel:(id)a3 toSection:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(v10, "declarationType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMUIPluginViewModelProvider _sectionNameForDeclarationType:](self, "_sectionNameForDeclarationType:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, v8);
  }
  objc_msgSend(v9, "addObject:", v10);

}

- (void)loadPluginsFromConfigurationsWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  void (**v11)(_QWORD, _QWORD);
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __82__RMUIPluginViewModelProvider_loadPluginsFromConfigurationsWithCompletionHandler___block_invoke;
  v12[3] = &unk_24DA086F8;
  objc_copyWeak(&v14, &location);
  v6 = v4;
  v13 = v6;
  v7 = (void (**)(_QWORD, _QWORD))MEMORY[0x219A22AA0](v12);
  -[RMUIPluginViewModelProvider observerStore](self, "observerStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __82__RMUIPluginViewModelProvider_loadPluginsFromConfigurationsWithCompletionHandler___block_invoke_64;
    v10[3] = &unk_24DA08788;
    v10[4] = self;
    v11 = v7;
    objc_msgSend(v8, "displayPropertiesForConfigurationsWithCompletionHandler:", v10);

  }
  else
  {
    +[RMUILog pluginViewModelProvider](RMUILog, "pluginViewModelProvider");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[RMUIPluginViewModelProvider loadPluginsFromConfigurationsWithCompletionHandler:].cold.1(v9);

    v7[2](v7, MEMORY[0x24BDBD1A8]);
  }

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __82__RMUIPluginViewModelProvider_loadPluginsFromConfigurationsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
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
  block[2] = __82__RMUIPluginViewModelProvider_loadPluginsFromConfigurationsWithCompletionHandler___block_invoke_2;
  block[3] = &unk_24DA086D0;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v8);
}

void __82__RMUIPluginViewModelProvider_loadPluginsFromConfigurationsWithCompletionHandler___block_invoke_2(uint64_t a1)
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

void __82__RMUIPluginViewModelProvider_loadPluginsFromConfigurationsWithCompletionHandler___block_invoke_64(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  RMUIDeclarationInfo *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id obj;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  +[RMUILog pluginViewModelProvider](RMUILog, "pluginViewModelProvider");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    v26 = v6;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __82__RMUIPluginViewModelProvider_loadPluginsFromConfigurationsWithCompletionHandler___block_invoke_64_cold_2(v5, v8);

    v30 = (void *)objc_opt_new();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v27 = v5;
    obj = v5;
    v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    if (v32)
    {
      v31 = *(_QWORD *)v34;
      v29 = a1;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v34 != v31)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v10, "declarationIdentifier", v26);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "filterDeclarationIdentifiers");
          v12 = objc_claimAutoreleasedReturnValue();
          if (v12
            && (v13 = (void *)v12,
                objc_msgSend(*(id *)(a1 + 32), "filterDeclarationIdentifiers"),
                v14 = (void *)objc_claimAutoreleasedReturnValue(),
                v15 = objc_msgSend(v14, "containsObject:", v11),
                v14,
                v13,
                (v15 & 1) == 0))
          {
            +[RMUILog pluginViewModelProvider](RMUILog, "pluginViewModelProvider");
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v38 = v11;
              _os_log_debug_impl(&dword_218DA5000, v23, OS_LOG_TYPE_DEBUG, "Ignoring configuration: %@", buf, 0xCu);
            }
          }
          else
          {
            v16 = [RMUIDeclarationInfo alloc];
            objc_msgSend(v10, "declarationServerToken");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "declarationType");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "declarationDetails");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "titleUI");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "declarationDetails");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "descriptionUI");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = -[RMUIDeclarationInfo initWithDeclarationIdentifier:declarationServerToken:declarationType:label:descriptor:](v16, "initWithDeclarationIdentifier:declarationServerToken:declarationType:label:descriptor:", v11, v17, v18, v20, v22);

            objc_msgSend(v10, "declarationDetails");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "detailsUI");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setDetails:](v23, "setDetails:", v25);

            a1 = v29;
            objc_msgSend(v30, "addObject:", v23);
          }

        }
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      }
      while (v32);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v6 = v26;
    v5 = v27;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __82__RMUIPluginViewModelProvider_loadPluginsFromConfigurationsWithCompletionHandler___block_invoke_64_cold_1((uint64_t)v6, v8);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (signed)_symbolForDeclarationType:(id)a3
{
  id v3;
  id v4;
  signed __int16 v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  __int16 v13;

  v3 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 1;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__RMUIPluginViewModelProvider__symbolForDeclarationType___block_invoke;
  v7[3] = &unk_24DA087B0;
  v4 = v3;
  v8 = v4;
  v9 = &v10;
  objc_msgSend(&unk_24DA0B070, "enumerateKeysAndObjectsUsingBlock:", v7);
  v5 = *((_WORD *)v11 + 12);

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __57__RMUIPluginViewModelProvider__symbolForDeclarationType___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v7;

  v7 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "hasPrefix:", a2))
  {
    *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v7, "intValue");
    *a4 = 1;
  }

}

- (id)_sectionNameForDeclarationType:(id)a3
{
  id v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v3 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  +[RMUILocalizable string:](RMUILocalizable, "string:", CFSTR("RMUI_SECTION_OTHERS"));
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __62__RMUIPluginViewModelProvider__sectionNameForDeclarationType___block_invoke;
  v7[3] = &unk_24DA087D8;
  v4 = v3;
  v8 = v4;
  v9 = &v10;
  objc_msgSend(&unk_24DA0B098, "enumerateKeysAndObjectsUsingBlock:", v7);
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __62__RMUIPluginViewModelProvider__sectionNameForDeclarationType___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "hasPrefix:", a2))
  {
    +[RMUILocalizable string:](RMUILocalizable, "string:", v10);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    *a4 = 1;
  }

}

- (NSMutableArray)pluginSectionViewModels
{
  return self->_pluginSectionViewModels;
}

- (void)setPluginSectionViewModels:(id)a3
{
  objc_storeStrong((id *)&self->_pluginSectionViewModels, a3);
}

- (NSMutableArray)pluginViewModels
{
  return self->_pluginViewModels;
}

- (void)setPluginViewModels:(id)a3
{
  objc_storeStrong((id *)&self->_pluginViewModels, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterDeclarationIdentifiers, 0);
  objc_storeStrong((id *)&self->_observerStore, 0);
  objc_storeStrong((id *)&self->_pluginViewModels, 0);
  objc_storeStrong((id *)&self->_pluginSectionViewModels, 0);
}

- (void)loadPluginsFromConfigurationsWithCompletionHandler:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_218DA5000, log, OS_LOG_TYPE_ERROR, "Cannot loadPlugins without an observerStore", v1, 2u);
}

void __82__RMUIPluginViewModelProvider_loadPluginsFromConfigurationsWithCompletionHandler___block_invoke_64_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_218DA5000, a2, OS_LOG_TYPE_ERROR, "Failed to find plugin properties: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __82__RMUIPluginViewModelProvider_loadPluginsFromConfigurationsWithCompletionHandler___block_invoke_64_cold_2(void *a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 134217984;
  v4 = objc_msgSend(a1, "count");
  _os_log_debug_impl(&dword_218DA5000, a2, OS_LOG_TYPE_DEBUG, "Found configuration properties: %lu", (uint8_t *)&v3, 0xCu);
}

@end
