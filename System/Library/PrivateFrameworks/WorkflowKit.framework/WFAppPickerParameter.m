@implementation WFAppPickerParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (WFAppPickerParameter)initWithDefinition:(id)a3
{
  id v4;
  WFAppPickerParameter *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  WFAppPickerParameter *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WFAppPickerParameter;
  v5 = -[WFEnumerationParameter initWithDefinition:](&v15, sel_initWithDefinition_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("AppSearchType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_class();
    WFEnforceClass(v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("OpenApp")) & 1) != 0)
    {
      v9 = 0;
    }
    else
    {
      if (!objc_msgSend(v8, "isEqualToString:", CFSTR("OpenIn")))
      {
LABEL_7:
        objc_msgSend(v4, "objectForKey:", CFSTR("UseLegacyIdentifiers"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_opt_class();
        WFEnforceClass(v10, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v5->_useLegacyIdentifiers = objc_msgSend(v12, "BOOLValue");

        -[WFDynamicEnumerationParameter setDataSource:](v5, "setDataSource:", v5);
        v13 = v5;

        goto LABEL_8;
      }
      v9 = 1;
    }
    v5->_appSearchType = v9;
    goto LABEL_7;
  }
LABEL_8:

  return v5;
}

- (BOOL)enumerationShouldProvideValuesForParameterSummaryLocalization:(id)a3
{
  return 0;
}

- (BOOL)preferParameterValuePicker
{
  return 1;
}

- (id)appEnumerator
{
  void *v2;
  void *v3;

  -[WFAppPickerParameter appListProvider](self, "appListProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    WFInstalledAppsEnumerator();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a5;
  dispatch_get_global_queue(25, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __86__WFAppPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke;
  v9[3] = &unk_1E7AF76F0;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, v9);

}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  void *v4;
  void *v5;

  if (a4)
  {
    objc_msgSend(a4, "value", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)enumeration:(id)a3 accessoryIconForPossibleState:(id)a4
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  if (a4)
  {
    v4 = (objc_class *)MEMORY[0x1E0DC7978];
    v5 = a4;
    v6 = [v4 alloc];
    objc_msgSend(v5, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v6, "initWithBundleIdentifier:", v8);

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)enumeration:(id)a3 accessoryImageForPossibleState:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    +[ICAppRegistry sharedRegistry](ICAppRegistry, "sharedRegistry");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appWithIdentifier:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "icon");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)stateForRecord:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  WFAppDescriptorParameterState *v18;

  v4 = (objc_class *)MEMORY[0x1E0CBD728];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithApplicationRecord:", v5);

  if (-[WFAppPickerParameter useLegacyIdentifiers](self, "useLegacyIdentifiers"))
  {
    objc_msgSend(v6, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICAppRegistry legacyAppIdentifierForBundleIdentifier:](ICAppRegistry, "legacyAppIdentifierForBundleIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc(MEMORY[0x1E0CBD728]);
    objc_msgSend(v6, "localizedName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "extensionBundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "counterpartIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "teamIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "supportedIntents");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "documentTypes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v9, "initWithLocalizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:bundleURL:documentTypes:", v10, v8, v11, v12, v13, v14, v15, v16);

    v6 = (void *)v17;
  }
  v18 = -[WFVariableSubstitutableParameterState initWithValue:]([WFAppDescriptorParameterState alloc], "initWithValue:", v6);

  return v18;
}

- (int64_t)appSearchType
{
  return self->_appSearchType;
}

- (BOOL)useLegacyIdentifiers
{
  return self->_useLegacyIdentifiers;
}

- (WFAppListProvider)appListProvider
{
  return (WFAppListProvider *)objc_loadWeakRetained((id *)&self->_appListProvider);
}

- (void)setAppListProvider:(id)a3
{
  objc_storeWeak((id *)&self->_appListProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_appListProvider);
}

void __86__WFAppPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  uint64_t v14;
  const __CFString *v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  __int128 v26;
  uint64_t v27;
  void *v28;
  _QWORD block[4];
  id v30;
  id v31;
  _QWORD v32[5];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  void *v37;
  uint8_t buf[4];
  const char *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v28 = (void *)objc_opt_new();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "appEnumerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v34;
    v7 = 0x1E0C99000uLL;
    v8 = CFSTR("WFShowInternalAppsInOpenApp");
    *(_QWORD *)&v4 = 136315138;
    v26 = v4;
    do
    {
      v9 = 0;
      v27 = v5;
      do
      {
        if (*(_QWORD *)v34 != v6)
          objc_enumerationMutation(v2);
        v10 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v9);
        objc_msgSend(*(id *)(v7 + 3744), "workflowUserDefaults", v26);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "BOOLForKey:", v8);

        if (v12)
        {
          getWFGeneralLogObject();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v26;
            v39 = "-[WFAppPickerParameter loadPossibleStatesForEnumeration:searchTerm:completionHandler:]_block_invoke";
            _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_DEFAULT, "%s Showing internal apps in WFAppPickerParameter because the Show Internal Apps in Open App default is on", buf, 0xCu);
          }

          v14 = 2;
        }
        else
        {
          v14 = 0;
        }
        if (objc_msgSend(v10, "wf_isAvailableInContext:", v14))
        {
          if (objc_msgSend(*(id *)(a1 + 32), "appSearchType") == 1)
          {
            v15 = v8;
            v16 = v7;
            v17 = v2;
            v18 = a1;
            objc_msgSend(v10, "claimRecords");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "allObjects");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "if_flatMap:", &__block_literal_global_26260);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            if (!objc_msgSend(v21, "count") || (objc_msgSend(v21, "isEqualToArray:", &unk_1E7B8D8E0) & 1) != 0)
            {

              a1 = v18;
              v2 = v17;
              v7 = v16;
              v8 = v15;
              v5 = v27;
              goto LABEL_18;
            }

            a1 = v18;
            v2 = v17;
            v7 = v16;
            v8 = v15;
            v5 = v27;
          }
          objc_msgSend(v28, "addObject:", v10);
        }
LABEL_18:
        ++v9;
      }
      while (v5 != v9);
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:selector:", CFSTR("localizedName"), 1, sel_localizedStandardCompare_);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "sortUsingDescriptors:", v23);

  v24 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __86__WFAppPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_2;
  v32[3] = &unk_1E7AF0530;
  v32[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v28, "if_map:", v32);
  block[0] = v24;
  block[1] = 3221225472;
  block[2] = __86__WFAppPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_3;
  block[3] = &unk_1E7AF76F0;
  v30 = (id)objc_claimAutoreleasedReturnValue();
  v31 = *(id *)(a1 + 40);
  v25 = v30;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __86__WFAppPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "stateForRecord:", a2);
}

void __86__WFAppPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_3(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDA10]), "initWithItems:", *(_QWORD *)(a1 + 32));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __86__WFAppPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_113(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "typeIdentifiers");
}

@end
