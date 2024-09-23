@implementation PKMAEntitlementTemplateManager

- (PKMAEntitlementTemplateManager)init
{
  PKMAEntitlementTemplateManager *v2;
  uint64_t v3;
  PKMobileAssetManager *mobileAssetManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKMAEntitlementTemplateManager;
  v2 = -[PKMAEntitlementTemplateManager init](&v6, sel_init);
  if (v2)
  {
    +[PKMobileAssetManager sharedInstance](PKMobileAssetManager, "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    mobileAssetManager = v2->_mobileAssetManager;
    v2->_mobileAssetManager = (PKMobileAssetManager *)v3;

  }
  return v2;
}

- (id)cachedEntitlementTemplates
{
  void *v3;
  void *v4;

  -[PKMobileAssetManager cachedDynamicAssetWithIdentifier:parameters:](self->_mobileAssetManager, "cachedDynamicAssetWithIdentifier:parameters:", CFSTR("EntitlementTemplates.General"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMAEntitlementTemplateManager _templatesFromAssetBundle:](self, "_templatesFromAssetBundle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)entitlementTemplates:(id)a3
{
  id v4;
  PKMobileAssetManager *mobileAssetManager;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  mobileAssetManager = self->_mobileAssetManager;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__PKMAEntitlementTemplateManager_entitlementTemplates___block_invoke;
  v7[3] = &unk_1E2AC16F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[PKMobileAssetManager dynamicAssetWithIdentifier:parameters:timeout:completion:](mobileAssetManager, "dynamicAssetWithIdentifier:parameters:timeout:completion:", CFSTR("EntitlementTemplates.General"), 0, 20, v7);

}

void __55__PKMAEntitlementTemplateManager_entitlementTemplates___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    PKLogFacilityTypeGetObject(0xAuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v7;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Failed to get entitlement templates: %@", (uint8_t *)&v11, 0xCu);
    }

    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
      (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v7);
  }
  else if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_templatesFromAssetBundle:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

- (id)_templatesFromAssetBundle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  BOOL v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  id v26;
  void *v27;
  void *v28;
  PKPassEntitlementTemplate *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  uint64_t v34;
  id v35;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  id v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    v6 = 0;
    goto LABEL_35;
  }
  objc_msgSend(v3, "URLsForResourcesWithExtension:subdirectory:", CFSTR("json"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
  if (!v8)
    goto LABEL_33;
  v9 = v8;
  v10 = *(_QWORD *)v48;
  v11 = 0x1E0C99000uLL;
  v12 = 0x1E0C99000uLL;
  v34 = *(_QWORD *)v48;
  v35 = v7;
  do
  {
    v13 = 0;
    v36 = v9;
    do
    {
      if (*(_QWORD *)v48 != v10)
        objc_enumerationMutation(v7);
      v40 = v13;
      v14 = (void *)objc_msgSend(objc_alloc(*(Class *)(v11 + 3408)), "initWithContentsOfURL:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * v13));
      if (v14)
      {
        v46 = 0;
        v39 = v14;
        objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v14, 0, &v46);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v46;
        v38 = v16;
        if (v15)
          v17 = v16 == 0;
        else
          v17 = 0;
        if (v17)
        {
          v44 = 0u;
          v45 = 0u;
          v42 = 0u;
          v43 = 0u;
          v37 = v15;
          v18 = v15;
          v20 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v43;
            do
            {
              v23 = 0;
              v41 = v21;
              do
              {
                if (*(_QWORD *)v43 != v22)
                  objc_enumerationMutation(v18);
                v24 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v23);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v25 = v18;
                  v26 = v24;
                  objc_msgSend(v26, "PKStringForKey:", CFSTR("entitlementTemplateType"));
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v6, "objectForKeyedSubscript:", v27);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v28)
                  {
                    PKLogFacilityTypeGetObject(0x20uLL);
                    v29 = (PKPassEntitlementTemplate *)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(&v29->super, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412546;
                      v52 = v27;
                      v53 = 2112;
                      v54 = v26;
                      _os_log_impl(&dword_18FC92000, &v29->super, OS_LOG_TYPE_DEFAULT, "PKMAEntitlementTemplateManager: Warning: Template with type %@ already exists. Skipping: %@", buf, 0x16u);
                    }
                  }
                  else
                  {
                    v29 = -[PKPassEntitlementTemplate initWithDictionary:bundle:]([PKPassEntitlementTemplate alloc], "initWithDictionary:bundle:", v26, v4);
                    objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("entitlementTemplateType"));
                    v30 = v12;
                    v31 = v4;
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v6, "setValue:forKey:", v29, v32);

                    v4 = v31;
                    v12 = v30;
                  }

                  v18 = v25;
                  v21 = v41;
                }
                ++v23;
              }
              while (v21 != v23);
              v21 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
            }
            while (v21);
            v10 = v34;
            v7 = v35;
            v11 = 0x1E0C99000;
          }
          v9 = v36;
          v15 = v37;
        }
        else
        {
          PKLogFacilityTypeGetObject(0x20uLL);
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v19 = v38;
            v52 = v38;
            _os_log_impl(&dword_18FC92000, v18, OS_LOG_TYPE_DEFAULT, "PKMAEntitlementTemplateManager: Failed to serialize template. %@", buf, 0xCu);
LABEL_30:

            v14 = v39;
            goto LABEL_31;
          }
        }
        v19 = v38;
        goto LABEL_30;
      }
LABEL_31:

      v13 = v40 + 1;
    }
    while (v40 + 1 != v9);
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
  }
  while (v9);
LABEL_33:

LABEL_35:
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobileAssetManager, 0);
}

@end
