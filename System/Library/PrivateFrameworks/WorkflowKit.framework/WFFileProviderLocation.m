@implementation WFFileProviderLocation

- (WFFileProviderLocation)initWithFileProviderDomainID:(id)a3 crossDeviceItemID:(id)a4 appContainerBundleIdentifier:(id)a5 relativeSubpath:(id)a6
{
  id v11;
  id v12;
  id v13;
  WFFileProviderLocation *v14;
  WFFileProviderLocation *v15;
  WFFileProviderLocation *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)WFFileProviderLocation;
  v14 = -[WFFileLocation initWithRelativeSubpath:](&v18, sel_initWithRelativeSubpath_, a6);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_fileProviderDomainID, a3);
    objc_storeStrong((id *)&v15->_crossDeviceItemID, a4);
    objc_storeStrong((id *)&v15->_appContainerBundleIdentifier, a5);
    v16 = v15;
  }

  return v15;
}

- (WFFileProviderLocation)initWithURL:(id)a3
{
  id v5;
  WFFileProviderLocation *v6;
  int v7;
  NSString *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSString *crossDeviceItemID;
  NSString *v14;
  uint64_t v15;
  NSString *fileProviderDomainID;
  uint64_t v17;
  NSString *appContainerBundleIdentifier;
  WFFileProviderLocation *v19;
  void *v21;
  objc_super v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFFileProviderLocation.m"), 70, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("URL"));

  }
  v22.receiver = self;
  v22.super_class = (Class)WFFileProviderLocation;
  v6 = -[WFFileLocation initWithURL:](&v22, sel_initWithURL_, v5);
  if (v6)
  {
    v7 = objc_msgSend(v5, "startAccessingSecurityScopedResource");
    FPCreateCrossDeviceItemIDForItemAtURL();
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    if (!v8)
    {
      getWFFilesLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v24 = "-[WFFileProviderLocation initWithURL:]";
        v25 = 2112;
        v26 = v9;
        _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_ERROR, "%s Could not create cross device item id with error: %@", buf, 0x16u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CAAC80], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "itemForURL:error:", v5, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      objc_msgSend(v5, "stopAccessingSecurityScopedResource");
    crossDeviceItemID = v6->_crossDeviceItemID;
    v6->_crossDeviceItemID = v8;
    v14 = v8;

    objc_msgSend(v12, "providerDomainID");
    v15 = objc_claimAutoreleasedReturnValue();
    fileProviderDomainID = v6->_fileProviderDomainID;
    v6->_fileProviderDomainID = (NSString *)v15;

    +[WFFileLocationUtilities bundleIdentifierForItem:](WFFileLocationUtilities, "bundleIdentifierForItem:", v12);
    v17 = objc_claimAutoreleasedReturnValue();
    appContainerBundleIdentifier = v6->_appContainerBundleIdentifier;
    v6->_appContainerBundleIdentifier = (NSString *)v17;

    v19 = v6;
  }

  return v6;
}

- (id)resolveCrossDeviceItemIDWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[WFFileProviderLocation crossDeviceItemID](self, "crossDeviceItemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0DC7958], "standardClient");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFFileProviderLocation crossDeviceItemID](self, "crossDeviceItemID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resolveCrossDeviceItemID:error:", v7, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)resolveLocationWithError:(id *)a3
{
  void *v4;
  dispatch_semaphore_t v5;
  WFFPItemResolver *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  WFFPItemResolver *v10;
  dispatch_time_t v11;
  id v12;
  _QWORD v14[4];
  NSObject *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__36775;
  v21 = __Block_byref_object_dispose__36776;
  -[WFFileProviderLocation resolveCrossDeviceItemIDWithError:](self, "resolveCrossDeviceItemIDWithError:", a3);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)v18[5];
  if (!v4)
  {
    v5 = dispatch_semaphore_create(0);
    v6 = [WFFPItemResolver alloc];
    -[WFFileProviderLocation fileProviderDomainID](self, "fileProviderDomainID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFFileLocation relativeSubpath](self, "relativeSubpath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __51__WFFileProviderLocation_resolveLocationWithError___block_invoke;
    v14[3] = &unk_1E7AF26C0;
    v16 = &v17;
    v9 = v5;
    v15 = v9;
    v10 = -[WFFPItemResolver initWithDomainID:relativeSubpath:completionHandler:](v6, "initWithDomainID:relativeSubpath:completionHandler:", v7, v8, v14);

    if (!v10)
    {

      v12 = 0;
      goto LABEL_5;
    }
    v11 = dispatch_time(0, 10000000000);
    dispatch_semaphore_wait(v9, v11);

    v4 = (void *)v18[5];
  }
  v12 = v4;
LABEL_5:
  _Block_object_dispose(&v17, 8);

  return v12;
}

- (id)resolveLocationFromProviderDomainID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[WFFileProviderLocation fileProviderDomainID](self, "fileProviderDomainID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFFileLocationUtilities fetchRootItemURLForDomainWithID:](WFFileLocationUtilities, "fetchRootItemURLForDomainWithID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFFileLocation relativeSubpath](self, "relativeSubpath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLByAppendingPathComponent:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isSupportedOnCurrentPlatform
{
  return 1;
}

- (BOOL)shouldShowUsersDuringDisplay:(id)a3
{
  return 0;
}

- (WFFileProviderLocation)initWithCoder:(id)a3
{
  id v4;
  WFFileProviderLocation *v5;
  uint64_t v6;
  NSString *fileProviderDomainID;
  uint64_t v8;
  NSString *crossDeviceItemID;
  WFFileProviderLocation *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFFileProviderLocation;
  v5 = -[WFFileLocation initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fileProviderDomainID"));
    v6 = objc_claimAutoreleasedReturnValue();
    fileProviderDomainID = v5->_fileProviderDomainID;
    v5->_fileProviderDomainID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("crossDeviceItemID"));
    v8 = objc_claimAutoreleasedReturnValue();
    crossDeviceItemID = v5->_crossDeviceItemID;
    v5->_crossDeviceItemID = (NSString *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFFileProviderLocation;
  v4 = a3;
  -[WFFileLocation encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[WFFileProviderLocation fileProviderDomainID](self, "fileProviderDomainID", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("fileProviderDomainID"));

  -[WFFileProviderLocation crossDeviceItemID](self, "crossDeviceItemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("crossDeviceItemID"));

}

- (id)serializedRepresentation
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WFFileProviderLocation;
  -[WFFileLocation serializedRepresentation](&v10, sel_serializedRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  -[WFFileProviderLocation fileProviderDomainID](self, "fileProviderDomainID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v6, CFSTR("fileProviderDomainID"));

  -[WFFileProviderLocation crossDeviceItemID](self, "crossDeviceItemID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v7, CFSTR("crossDeviceItemID"));

  -[WFFileProviderLocation appContainerBundleIdentifier](self, "appContainerBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v8, CFSTR("appContainerBundleIdentifier"));

  return v5;
}

- (NSString)fileProviderDomainID
{
  return self->_fileProviderDomainID;
}

- (NSString)crossDeviceItemID
{
  return self->_crossDeviceItemID;
}

- (NSString)appContainerBundleIdentifier
{
  return self->_appContainerBundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appContainerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_crossDeviceItemID, 0);
  objc_storeStrong((id *)&self->_fileProviderDomainID, 0);
}

void __51__WFFileProviderLocation_resolveLocationWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC7958], "standardClient");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    objc_msgSend(v4, "fetchURLForFPItem:error:", v3, &v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v10;

    if (!v5)
    {
      getWFFilesLogObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v12 = "-[WFFileProviderLocation resolveLocationWithError:]_block_invoke";
        v13 = 2112;
        v14 = v6;
        _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_ERROR, "%s Could not fetch URL for FPItem with error: %@", buf, 0x16u);
      }

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v5);
    getWFFilesLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v12 = "-[WFFileProviderLocation resolveLocationWithError:]_block_invoke";
      v13 = 2112;
      v14 = v3;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_DEBUG, "%s Found item: %@ with fetched URL: %@", buf, 0x20u);
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  else
  {
    getWFFilesLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[WFFileProviderLocation resolveLocationWithError:]_block_invoke";
      _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_ERROR, "%s WFFPItemResolver found no item", buf, 0xCu);
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }

}

+ (id)locationWithSerializedRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("fileProviderDomainID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("crossDeviceItemID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("relativeSubpath"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("appContainerBundleIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFileProviderDomainID:crossDeviceItemID:appContainerBundleIdentifier:relativeSubpath:", v5, v6, v8, v7);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (Class)supportedClassForURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  _QWORD v25[8];

  v25[7] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  v25[2] = objc_opt_class();
  v25[3] = objc_opt_class();
  v25[4] = objc_opt_class();
  v25[5] = objc_opt_class();
  v25[6] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  +[WFFileLocationUtilities itemForURL:error:](WFFileLocationUtilities, "itemForURL:error:", v3, &v18);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v18;
  if (!v5)
  {
    getWFFilesLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v20 = "+[WFFileProviderLocation supportedClassForURL:]";
      v21 = 2112;
      v22 = v3;
      v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_DEBUG, "%s Could not create item from URL: %@ with error: %@", buf, 0x20u);
    }

  }
  +[WFFileLocationUtilities parentItemsForItem:](WFFileLocationUtilities, "parentItemsForItem:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __47__WFFileProviderLocation_supportedClassForURL___block_invoke;
  v14[3] = &unk_1E7AF2698;
  v15 = v3;
  v16 = v5;
  v17 = v8;
  v9 = v8;
  v10 = v5;
  v11 = v3;
  objc_msgSend(v4, "if_firstObjectPassingTest:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v12;
}

+ (BOOL)canRepresentURL:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  char v11;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "startAccessingSecurityScopedResource");
  objc_msgSend(MEMORY[0x1E0CAAC80], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v6, "itemForURL:error:", v4, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;

  if (v5)
    objc_msgSend(v4, "stopAccessingSecurityScopedResource");
  if (!v7)
  {
    getWFFilesLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v15 = "+[WFFileProviderLocation canRepresentURL:]";
      v16 = 2112;
      v17 = v4;
      v18 = 2112;
      v19 = v8;
      _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_DEBUG, "%s Could not create item from URL: %@ with error: %@", buf, 0x20u);
    }

  }
  +[WFFileLocationUtilities parentItemsForItem:](WFFileLocationUtilities, "parentItemsForItem:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(a1, "canRepresentURL:item:parentItems:", v4, v7, v10);

  return v11;
}

+ (BOOL)canRepresentURL:(id)a3 item:(id)a4 parentItems:(id)a5
{
  return a4 != 0;
}

+ (id)subpathFromURL:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CAAC80];
  v5 = a3;
  objc_msgSend(v4, "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemForURL:error:", v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "subpathFromURL:item:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)subpathFromURL:(id)a3 item:(id)a4
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

  if (a4)
  {
    v4 = a4;
    +[WFFileLocationUtilities parentItemsForItem:](WFFileLocationUtilities, "parentItemsForItem:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reverseObjectEnumerator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v8, "arrayByAddingObject:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "if_compactMap:", &__block_literal_global_36803);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR("/"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByStandardizingPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

uint64_t __46__WFFileProviderLocation_subpathFromURL_item___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "filename");
}

uint64_t __47__WFFileProviderLocation_supportedClassForURL___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "canRepresentURL:item:parentItems:", a1[4], a1[5], a1[6]);
}

@end
