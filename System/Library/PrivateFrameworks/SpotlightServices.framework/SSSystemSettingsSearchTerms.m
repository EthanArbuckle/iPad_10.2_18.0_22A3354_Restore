@implementation SSSystemSettingsSearchTerms

- (id)consumerLabel
{
  if (consumerLabel_onceToken_1 != -1)
    dispatch_once(&consumerLabel_onceToken_1, &__block_literal_global_25);
  return (id)consumerLabel_label_1;
}

void __44__SSSystemSettingsSearchTerms_consumerLabel__block_invoke()
{
  void *v0;

  v0 = (void *)consumerLabel_label_1;
  consumerLabel_label_1 = (uint64_t)CFSTR("SSSystemSettingsSearchTerms");

}

- (id)stream
{
  void *v2;
  void *v3;
  void *v4;

  BiomeLibrary();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "SystemSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "SearchTerms");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_54_2);
  return (id)sharedInstance_sharedInstance_1;
}

void __45__SSSystemSettingsSearchTerms_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance_1;
  sharedInstance_sharedInstance_1 = v0;

}

- (SSSystemSettingsSearchTerms)init
{
  SSSystemSettingsSearchTerms *v2;
  SSSystemSettingsSearchTerms *v3;
  SSSystemSettingsSearchTerms *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSSystemSettingsSearchTerms;
  v2 = -[SSBaseConsumer init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (BOOL)filterEvent:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "searchResultsClickedOn");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

- (void)handleEvent:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (!-[SSSystemSettingsSearchTerms filterEvent:](self, "filterEvent:", v5))
    {
      objc_msgSend(v5, "searchTerm");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      SSRedactString(v6, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        SSGeneralLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          -[SSBaseConsumer identifier](self, "identifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = 138412546;
          v13 = v9;
          v14 = 2112;
          v15 = v7;
          _os_log_impl(&dword_1B86C5000, v8, OS_LOG_TYPE_DEFAULT, "%@: processing event system settings search: %@", (uint8_t *)&v12, 0x16u);

        }
      }
      v10 = (void *)objc_opt_new();
      -[SSSystemSettingsSearchTerms _itemUpdatesForEvent:bundleToUpdate:timestamp:](self, "_itemUpdatesForEvent:bundleToUpdate:timestamp:", v5, CFSTR("com.apple.Preferences"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "count"))
        -[SSBaseConsumer indexItems:protectionClass:bundleID:](self, "indexItems:protectionClass:bundleID:", v11, CFSTR("Priority"), CFSTR("com.apple.Preferences"));

    }
  }

}

- (id)_itemUpdatesForEvent:(id)a3 bundleToUpdate:(id)a4 timestamp:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v22;
  id v23;
  id v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[2];
  _QWORD v31[2];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v24 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v22 = v7;
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v7, "searchResultsClickedOn");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v27;
    v12 = *MEMORY[0x1E0CA6450];
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v13);
        v15 = objc_alloc_init(MEMORY[0x1E0CA6B48]);
        objc_msgSend(v14, "bundleIDwithAnchor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringByRemovingPercentEncoding");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8 && v17)
        {
          objc_msgSend(v15, "setUniqueIdentifier:", v17);
          objc_msgSend(v15, "setBundleID:", v24);
          objc_msgSend(v15, "setIsUpdate:", 1);
          v18 = objc_alloc(MEMORY[0x1E0CA6B50]);
          v30[0] = CFSTR("_kMDItemLastOutOfSpotlightEngagementDate");
          v30[1] = v12;
          v31[0] = v8;
          v31[1] = v8;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)objc_msgSend(v18, "initWithAttributes:", v19);
          objc_msgSend(v15, "setAttributeSet:", v20);

          objc_msgSend(v23, "addObject:", v15);
        }

        ++v13;
      }
      while (v10 != v13);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v10);
  }

  return v23;
}

@end
