@implementation ICApp

- (ICApp)initWithIdentifier:(id)a3 definition:(id)a4
{
  id v7;
  id v8;
  ICApp *v9;
  uint64_t v10;
  NSString *identifier;
  uint64_t v12;
  NSDictionary *definition;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *stateAccessQueue;
  ICApp *v17;
  void *v19;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICApp.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  v9 = -[ICApp init](self, "init");
  if (v9)
  {
    v10 = objc_msgSend(v7, "copy");
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v10;

    v12 = objc_msgSend(v8, "copy");
    definition = v9->_definition;
    v9->_definition = (NSDictionary *)v12;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("com.apple.WorkflowKit.ICApp.stateAccessQueue", v14);
    stateAccessQueue = v9->_stateAccessQueue;
    v9->_stateAccessQueue = (OS_dispatch_queue *)v15;

    v17 = v9;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  ICApp *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;

  v4 = (ICApp *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[ICApp identifier](self, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICApp identifier](v4, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isEqualToString:", v6))
      {
        -[ICApp definition](self, "definition");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICApp definition](v4, "definition");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v7;
        v10 = v8;
        v11 = v10;
        if (v9 == v10)
        {
          v12 = 1;
        }
        else
        {
          v12 = 0;
          if (v9 && v10)
            v12 = objc_msgSend(v9, "isEqualToDictionary:", v10);
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[ICApp identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[ICApp definition](self, "definition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)ICApp;
  -[ICApp description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICApp localizedName](self, "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICApp identifier](self, "identifier");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (self->_checkedInstallStatus)
  {
    if (self->_installed)
      v8 = CFSTR("Installed");
    else
      v8 = CFSTR("Not Installed");
  }
  else
  {
    v8 = CFSTR("Undetermined Install Status");
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@ [%@] (%@)"), v4, v5, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)bundleIdentifiersByIdiom
{
  void *v2;
  void *v3;

  -[ICApp definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("BundleIdentifiers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSArray)allBundleIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[ICApp bundleIdentifiersByIdiom](self, "bundleIdentifiersByIdiom");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    -[ICApp bundleIdentifiersByIdiom](self, "bundleIdentifiersByIdiom");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allValues");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ICApp identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return (NSArray *)v7;
}

- (NSString)bundleIdentifier
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  -[ICApp bundleIdentifiersByIdiom](self, "bundleIdentifiersByIdiom");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[ICApp bundleIdentifiersByIdiom](self, "bundleIdentifiersByIdiom");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICApp identifierFromDictionaryForCurrentIdiom:](self, "identifierFromDictionaryForCurrentIdiom:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      -[ICApp identifier](self, "identifier");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;

  }
  else
  {
    -[ICApp identifier](self, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v10;
}

- (NSString)localizedName
{
  void *v3;
  void *v4;

  +[WFActionLocalizationContext defaultContext](WFActionLocalizationContext, "defaultContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICApp localizedNameWithContext:](self, "localizedNameWithContext:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)localizedNameWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  -[ICApp definition](self, "definition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("Name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v4, "localize:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
LABEL_7:

  return v8;
}

- (NSString)localizedShortName
{
  void *v3;
  void *v4;
  void *v5;

  -[ICApp definition](self, "definition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("ShortName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(v4, "localize");
  else
    -[ICApp localizedName](self, "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)iTunesIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[ICApp definition](self, "definition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("iTunesIdentifiers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ICApp identifierFromDictionaryForCurrentIdiom:](self, "identifierFromDictionaryForCurrentIdiom:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ICApp definition](self, "definition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("iTunesIdentifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v5;
}

- (WFImage)icon
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__9647;
  v11 = __Block_byref_object_dispose__9648;
  v12 = 0;
  -[ICApp stateAccessQueue](self, "stateAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __13__ICApp_icon__block_invoke;
  v6[3] = &unk_1E7AF92E8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (WFImage *)v4;
}

- (void)setIcon:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ICApp stateAccessQueue](self, "stateAccessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __17__ICApp_setIcon___block_invoke;
  v7[3] = &unk_1E7AF92C0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (NSArray)schemes
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__9647;
  v11 = __Block_byref_object_dispose__9648;
  v12 = 0;
  -[ICApp stateAccessQueue](self, "stateAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __16__ICApp_schemes__block_invoke;
  v6[3] = &unk_1E7AF92E8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (id)schemeNamed:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ICApp schemes](self, "schemes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectMatchingKey:value:", CFSTR("scheme"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)exportedFileTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0DC7B30];
  -[ICApp definition](self, "definition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("ExportedTypes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "typesFromStrings:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (NSArray)documentTypes
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  -[ICApp definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("DocumentTypes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("com.apple.maps.directionsrequest"), CFSTR("com.appcubby.launchpro.lcpbackup"), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __22__ICApp_documentTypes__block_invoke;
    v8[3] = &unk_1E7AEEE10;
    v9 = v4;
    v5 = v4;
    objc_msgSend(v3, "if_compactMap:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }

  return (NSArray *)v6;
}

- (NSArray)documentActions
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[ICApp definition](self, "definition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("DocumentActions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __24__ICApp_documentActions__block_invoke;
    v7[3] = &unk_1E7AF1B80;
    v7[4] = self;
    objc_msgSend(v4, "if_compactMap:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return (NSArray *)v5;
}

- (NSArray)metadata
{
  void *v2;
  void *v3;
  void *v4;
  NSArray *v5;

  -[ICApp definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("Metadata"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

- (NSString)iconName
{
  void *v2;
  void *v3;

  -[ICApp definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("Icon"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isRestricted
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  char v9;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0CA5870]);
  -[ICApp bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v5 = (void *)objc_msgSend(v3, "initWithBundleIdentifier:allowPlaceholder:error:", v4, 0, &v11);
  v6 = v11;

  if (v6)
  {
    getWFInterchangeLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[ICApp bundleIdentifier](self, "bundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v13 = "-[ICApp isRestricted]";
      v14 = 2114;
      v15 = v8;
      v16 = 2114;
      v17 = v6;
      _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_ERROR, "%s Unable to get app record for %{public}@, %{public}@", buf, 0x20u);

    }
    v9 = 0;
  }
  else
  {
    objc_msgSend(v5, "applicationState");
    v7 = objc_claimAutoreleasedReturnValue();
    v9 = -[NSObject isRestricted](v7, "isRestricted");
  }

  return v9;
}

- (INAppInfo)appInfo
{
  INAppInfo *appInfo;
  INAppInfo *v3;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  INAppInfo *v12;
  INAppInfo *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  appInfo = self->_appInfo;
  if (appInfo)
    goto LABEL_2;
  v5 = objc_alloc(MEMORY[0x1E0CA5870]);
  -[ICApp bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v7 = (void *)objc_msgSend(v5, "initWithBundleIdentifier:allowPlaceholder:error:", v6, 0, &v14);
  v8 = v14;

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CBD730], "appInfoWithApplicationRecord:", v7);
    v12 = (INAppInfo *)objc_claimAutoreleasedReturnValue();
    v13 = self->_appInfo;
    self->_appInfo = v12;

    appInfo = self->_appInfo;
LABEL_2:
    v3 = appInfo;
    return v3;
  }
  getWFInterchangeLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    -[ICApp bundleIdentifier](self, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v16 = "-[ICApp appInfo]";
    v17 = 2114;
    v18 = v10;
    v19 = 2114;
    v20 = v8;
    _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_ERROR, "%s Unable to get app record for %{public}@, %{public}@", buf, 0x20u);

  }
  v3 = 0;
  return v3;
}

- (BOOL)isCurrentlyInstalled
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  v2 = (void *)MEMORY[0x1E0CA5860];
  -[ICApp bundleIdentifier](self, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applicationProxyForIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isInstalled");

  return v6;
}

- (void)resetInstalledStatus
{
  NSObject *v3;
  _QWORD block[5];

  -[ICApp stateAccessQueue](self, "stateAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__ICApp_resetInstalledStatus__block_invoke;
  block[3] = &unk_1E7AF94B0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)updateInstalledStatus
{
  NSObject *v3;
  _QWORD block[5];

  -[ICApp stateAccessQueue](self, "stateAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__ICApp_updateInstalledStatus__block_invoke;
  block[3] = &unk_1E7AF94B0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (BOOL)isInstalled
{
  ICApp *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[ICApp stateAccessQueue](self, "stateAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __20__ICApp_isInstalled__block_invoke;
  v5[3] = &unk_1E7AF92E8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)openFile:(id)a3 completionHandler:(id)a4
{
  -[ICApp openFile:withAnnotation:completionHandler:](self, "openFile:withAnnotation:completionHandler:", a3, 0, a4);
}

- (void)openFile:(id)a3 withAnnotation:(id)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  id v10;

  v8 = a5;
  +[DCDocument documentWithURL:annotation:](DCDocument, "documentWithURL:annotation:", a3, a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[ICApp bundleIdentifier](self, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "openWithAppBundleIdentifier:completionHandler:", v9, v8);

}

- (id)identifierFromDictionaryForCurrentIdiom:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("Phone"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("Pad"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "idiom");

  if (v5)
    v8 = v5;
  else
    v8 = v4;
  if (v7 == 1)
    v9 = v8;
  else
    v9 = v4;
  v10 = v9;

  return v10;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDictionary)definition
{
  return self->_definition;
}

- (BOOL)checkedInstallStatus
{
  return self->_checkedInstallStatus;
}

- (void)setCheckedInstallStatus:(BOOL)a3
{
  self->_checkedInstallStatus = a3;
}

- (OS_dispatch_queue)stateAccessQueue
{
  return self->_stateAccessQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateAccessQueue, 0);
  objc_storeStrong((id *)&self->_definition, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_appInfo, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_schemes, 0);
}

_BYTE *__20__ICApp_isInstalled__block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (!result[9])
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = objc_msgSend(result, "isCurrentlyInstalled");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 1;
    result = *(_BYTE **)(a1 + 32);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result[8];
  return result;
}

uint64_t __30__ICApp_updateInstalledStatus__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCurrentlyInstalled");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = result;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 1;
  return result;
}

uint64_t __29__ICApp_resetInstalledStatus__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 9) = 0;
  return result;
}

id __24__ICApp_documentActions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSString *v4;
  objc_class *v5;
  void *v6;

  v3 = a2;
  objc_msgSend(v3, "objectForKey:", CFSTR("ActionClass"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  v5 = NSClassFromString(v4);
  if (!v5)
    v5 = (objc_class *)objc_opt_class();
  v6 = (void *)objc_msgSend([v5 alloc], "initWithDefinition:app:", v3, *(_QWORD *)(a1 + 32));

  return v6;
}

id __22__ICApp_documentTypes__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC7B30], "typeWithString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

void __16__ICApp_schemes__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  ICScheme *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  ICScheme *v12;
  ICScheme *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (v2)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
    return;
  }
  v3 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "definition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("URLSchemes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = v5;
    v7 = -[ICScheme countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          v12 = [ICScheme alloc];
          v13 = -[ICScheme initWithDefinition:app:](v12, "initWithDefinition:app:", v11, *(_QWORD *)(a1 + 32), (_QWORD)v17);
          objc_msgSend(v3, "addObject:", v13);

        }
        v8 = -[ICScheme countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);
    }
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = -[ICScheme initWithDefinition:app:]([ICScheme alloc], "initWithDefinition:app:", v5, *(_QWORD *)(a1 + 32));
    objc_msgSend(v3, "addObject:", v6);
LABEL_14:

  }
  v14 = (void *)objc_msgSend(v3, "copy", (_QWORD)v17);
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), v14);
}

void __17__ICApp_setIcon___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
}

void __13__ICApp_icon__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[3];
  if (v3)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = v3;
    v6 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v5;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0DC7B70];
    objc_msgSend(v2, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "applicationIconImageForBundleIdentifier:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "iconName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v13 = (void *)MEMORY[0x1E0DC7B70];
        objc_msgSend(*(id *)(a1 + 32), "iconName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "workflowKitImageNamed:", v14);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v17 = *(void **)(v16 + 40);
        *(_QWORD *)(v16 + 40) = v15;

      }
    }
    v18 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "copy");
    v19 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v19 + 24);
    *(_QWORD *)(v19 + 24) = v18;
  }

}

+ (void)loadIconWithBundleIdentifier:(id)a3 desiredSize:(CGSize)a4 completionHandler:(id)a5
{
  objc_msgSend(MEMORY[0x1E0DC7980], "loadIconWithBundleIdentifier:desiredSize:completionHandler:", a3, a5, a4.width, a4.height);
}

@end
