@implementation QLExtensionManager

- (id)extensionForContentType:(id)a3 allowExtensionsForParentTypes:(BOOL)a4 applicationBundleIdentifier:(id)a5 extensionPath:(id)a6 extensionType:(unint64_t)a7 generationType:(unint64_t)a8 shouldUseRestrictedExtension:(BOOL)a9
{
  uint64_t v10;

  LOBYTE(v10) = a9;
  return -[QLExtensionManager extensionForContentType:allowExtensionsForParentTypes:firstPartyExtension:applicationBundleIdentifier:extensionPath:extensionType:generationType:shouldUseRestrictedExtension:](self, "extensionForContentType:allowExtensionsForParentTypes:firstPartyExtension:applicationBundleIdentifier:extensionPath:extensionType:generationType:shouldUseRestrictedExtension:", a3, a4, 0, a5, a6, a7, a8, v10);
}

- (id)extensionForContentType:(id)a3 allowExtensionsForParentTypes:(BOOL)a4 firstPartyExtension:(BOOL)a5 applicationBundleIdentifier:(id)a6 extensionPath:(id)a7 extensionType:(unint64_t)a8 generationType:(unint64_t)a9 shouldUseRestrictedExtension:(BOOL)a10
{
  void *v10;
  void *v11;
  uint64_t v13;

  LOBYTE(v13) = a10;
  -[QLExtensionManager qlExtensionForContentType:allowExtensionsForParentTypes:firstPartyExtension:applicationBundleIdentifier:extensionPath:extensionType:generationType:shouldUseRestrictedExtension:](self, "qlExtensionForContentType:allowExtensionsForParentTypes:firstPartyExtension:applicationBundleIdentifier:extensionPath:extensionType:generationType:shouldUseRestrictedExtension:", a3, a4, a5, a6, a7, a8, a9, v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "extension");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)qlExtensionForContentType:(id)a3 allowExtensionsForParentTypes:(BOOL)a4 firstPartyExtension:(BOOL)a5 applicationBundleIdentifier:(id)a6 extensionPath:(id)a7 extensionType:(unint64_t)a8 generationType:(unint64_t)a9 shouldUseRestrictedExtension:(BOOL)a10
{
  _BOOL8 v13;
  _BOOL8 v14;
  id v16;
  id v17;
  id v18;
  void *v19;
  BOOL v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v36;
  id v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  void *v48;
  _BYTE v49[128];
  uint64_t v50;

  v13 = a5;
  v14 = a4;
  v50 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v17 = a6;
  v18 = a7;
  v19 = v18;
  v20 = v16 != 0;
  v21 = a9 == 1 && v16 != 0;
  if (a8 != 1)
    v20 = 0;
  if (v20 || v18 || v17 || v21)
  {
    v23 = (void *)objc_opt_new();
    v36 = v16;
    v37 = v17;
    -[QLExtensionManager _addQueryAttributesToExtensionQuery:withContentType:appBundleIdentifier:extensionType:generationType:](self, "_addQueryAttributesToExtensionQuery:withContentType:appBundleIdentifier:extensionType:generationType:", v23, v16, v17, a8, a9);
    v38 = (void *)objc_opt_new();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    -[QLExtensionManager _cachesForExtensionType:shouldUseRestrictedExtension:](self, "_cachesForExtensionType:shouldUseRestrictedExtension:", a8, a10);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v40;
      while (2)
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v40 != v27)
            objc_enumerationMutation(v24);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "extensionWithMatchingAttributes:allowExtensionsForParentTypes:extensionPath:firstPartyExtension:", v23, v14, v19, v13);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            if (!a10)
            {

              goto LABEL_28;
            }
            objc_msgSend(v38, "addObject:", v22);
          }

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
        if (v26)
          continue;
        break;
      }
    }

    if (a10
      && (objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("QLSupportedContentTypes")),
          v29 = (void *)objc_claimAutoreleasedReturnValue(),
          +[QLExtensionManagerCache bestMatchingExtensionsFromSupportingExtensions:includingExtensionsWithSupportingParentTypes:byContentType:](QLExtensionManagerCache, "bestMatchingExtensionsFromSupportingExtensions:includingExtensionsWithSupportingParentTypes:byContentType:", v38, v14, v29), v22 = (void *)objc_claimAutoreleasedReturnValue(), v29, v22))
    {
LABEL_28:
      v31 = _qlsLogHandle;
      if (!_qlsLogHandle)
      {
        QLSInitLogging();
        v31 = _qlsLogHandle;
      }
      v17 = v37;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        v32 = v31;
        objc_msgSend(v22, "extension");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "identifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v44 = v34;
        v45 = 2112;
        v16 = v36;
        v46 = v36;
        v47 = 2112;
        v48 = v37;
        _os_log_impl(&dword_20D4C7000, v32, OS_LOG_TYPE_DEBUG, "Found extension: %@ for content type: %@, bundle identifier: %@. #Remote", buf, 0x20u);

        goto LABEL_34;
      }
    }
    else
    {
      v30 = _qlsLogHandle;
      if (!_qlsLogHandle)
      {
        QLSInitLogging();
        v30 = _qlsLogHandle;
      }
      v17 = v37;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v16 = v36;
        v44 = v36;
        v45 = 2112;
        v46 = v37;
        v47 = 2112;
        v48 = v19;
        _os_log_impl(&dword_20D4C7000, v30, OS_LOG_TYPE_DEBUG, "Did not find any extension matching content type: %@ and application bundle identifier: %@. with specified path %@ #Remote", buf, 0x20u);
        v22 = 0;
LABEL_34:

        goto LABEL_35;
      }
      v22 = 0;
    }
    v16 = v36;
    goto LABEL_34;
  }
  v22 = 0;
LABEL_35:

  return v22;
}

- (id)_cachesForExtensionType:(unint64_t)a3 shouldUseRestrictedExtension:(BOOL)a4
{
  _BOOL4 v4;
  int v6;
  int v7;
  uint64_t *v8;
  void *v9;
  _QWORD block[5];

  v4 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__QLExtensionManager__cachesForExtensionType_shouldUseRestrictedExtension___block_invoke;
  block[3] = &unk_24C71AF10;
  block[4] = self;
  if (_cachesForExtensionType_shouldUseRestrictedExtension__onceToken != -1)
    dispatch_once(&_cachesForExtensionType_shouldUseRestrictedExtension__onceToken, block);
  v6 = _os_feature_enabled_impl();
  v7 = _os_feature_enabled_impl();
  if (a3)
  {
    if (v7 | v6 & v4)
      v8 = &_cachesForExtensionType_shouldUseRestrictedExtension__restrictedThumbnailExtensionCaches;
    else
      v8 = &_cachesForExtensionType_shouldUseRestrictedExtension__thumbnailExtensionCaches;
    v9 = (void *)*v8;
  }
  else
  {
    v9 = (void *)_cachesForExtensionType_shouldUseRestrictedExtension__previewExtensionCaches;
  }
  return v9;
}

- (void)_addQueryAttributesToExtensionQuery:(id)a3 withContentType:(id)a4 appBundleIdentifier:(id)a5 extensionType:(unint64_t)a6 generationType:(unint64_t)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (v12)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("QLSupportedContentTypes"));
  if (!v13)
    goto LABEL_9;
  -[QLExtensionManager _applicationPathForBundleId:](self, "_applicationPathForBundleId:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BDD0C00]);
LABEL_8:

LABEL_9:
    if (a7 == 2)
      objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("QLSupportsSearchableItems"));
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bundlePath");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v15, "bundlePath");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, CFSTR("kQLExtensionFrameworkPath"));

    goto LABEL_8;
  }
  v18 = _qlsLogHandle;
  if (!_qlsLogHandle)
  {
    QLSInitLogging();
    v18 = _qlsLogHandle;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    v19 = 138412290;
    v20 = v13;
    _os_log_impl(&dword_20D4C7000, v18, OS_LOG_TYPE_ERROR, "Could not retrieve application extension because Quick Look could not figure out the path from the bundle identifier: %@. #Remote", (uint8_t *)&v19, 0xCu);
  }

LABEL_11:
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_1);
  return (id)_sharedManager;
}

uint64_t __35__QLExtensionManager_sharedManager__block_invoke()
{
  QLExtensionManager *v0;
  void *v1;

  v0 = objc_alloc_init(QLExtensionManager);
  v1 = (void *)_sharedManager;
  _sharedManager = (uint64_t)v0;

  return objc_msgSend((id)_sharedManager, "_setupCache");
}

+ (void)_setSharedManager:(id)a3
{
  objc_storeStrong((id *)&_sharedManager, a3);
}

+ (void)_resetSharedManager
{
  QLExtensionManager *v2;
  void *v3;

  v2 = objc_alloc_init(QLExtensionManager);
  v3 = (void *)_sharedManager;
  _sharedManager = (uint64_t)v2;

  objc_msgSend((id)_sharedManager, "_setupCache");
}

+ (BOOL)extension:(id)a3 supportsExactType:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v5 = a3;
  v6 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  objc_msgSend(v5, "attributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("QLSupportedContentTypes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __50__QLExtensionManager_extension_supportsExactType___block_invoke;
  v11[3] = &unk_24C71B250;
  v13 = &v14;
  v9 = v6;
  v12 = v9;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v11);
  LOBYTE(v7) = *((_BYTE *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)v7;
}

uint64_t __50__QLExtensionManager_extension_supportsExactType___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "caseInsensitiveCompare:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result == 0;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a4 = 1;
  return result;
}

- (void)_setupCache
{
  QLExtensionManagerCache *v3;
  uint64_t v4;
  void *v5;
  QLExtensionManagerCache *v6;
  QLExtensionManagerCache *previewExtensionCache;
  QLExtensionManagerCache *v8;
  void *v9;
  QLExtensionManagerCache *v10;
  QLExtensionManagerCache *thumbnailExtensionCache;
  QLExtensionManagerCache *v12;
  void *v13;
  QLExtensionManagerCache *v14;
  QLExtensionManagerCache *previewHighMemoryExtensionCache;
  QLExtensionManagerCache *v16;
  void *v17;
  QLExtensionManagerCache *v18;
  QLExtensionManagerCache *thumbnailHighMemoryExtensionCache;
  QLExtensionManagerCache *v20;
  void *v21;
  QLExtensionManagerCache *v22;
  QLExtensionManagerCache *thumbnailSecureExtensionCache;
  uint64_t v24;
  const __CFString *v25;
  uint64_t v26;
  const __CFString *v27;
  uint64_t v28;
  const __CFString *v29;
  uint64_t v30;
  const __CFString *v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v3 = [QLExtensionManagerCache alloc];
  v32 = *MEMORY[0x24BDD0C48];
  v4 = v32;
  v33[0] = CFSTR("com.apple.quicklook.preview");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[QLExtensionManagerCache initWithMatchingAttributes:](v3, "initWithMatchingAttributes:", v5);
  previewExtensionCache = self->_previewExtensionCache;
  self->_previewExtensionCache = v6;

  v8 = [QLExtensionManagerCache alloc];
  v30 = v4;
  v31 = CFSTR("com.apple.quicklook.thumbnail");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[QLExtensionManagerCache initWithMatchingAttributes:](v8, "initWithMatchingAttributes:", v9);
  thumbnailExtensionCache = self->_thumbnailExtensionCache;
  self->_thumbnailExtensionCache = v10;

  v12 = [QLExtensionManagerCache alloc];
  v28 = v4;
  v29 = CFSTR("com.apple.quicklook.preview.highmemory");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[QLExtensionManagerCache initWithMatchingAttributes:](v12, "initWithMatchingAttributes:", v13);
  previewHighMemoryExtensionCache = self->_previewHighMemoryExtensionCache;
  self->_previewHighMemoryExtensionCache = v14;

  v16 = [QLExtensionManagerCache alloc];
  v26 = v4;
  v27 = CFSTR("com.apple.quicklook.thumbnail.highmemory");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[QLExtensionManagerCache initWithMatchingAttributes:](v16, "initWithMatchingAttributes:", v17);
  thumbnailHighMemoryExtensionCache = self->_thumbnailHighMemoryExtensionCache;
  self->_thumbnailHighMemoryExtensionCache = v18;

  v20 = [QLExtensionManagerCache alloc];
  v24 = v4;
  v25 = CFSTR("com.apple.quicklook.thumbnail.secure");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[QLExtensionManagerCache initWithMatchingAttributes:](v20, "initWithMatchingAttributes:", v21);
  thumbnailSecureExtensionCache = self->_thumbnailSecureExtensionCache;
  self->_thumbnailSecureExtensionCache = v22;

  -[QLExtensionManagerCache beginMatchingExtensions](self->_previewExtensionCache, "beginMatchingExtensions");
  -[QLExtensionManagerCache beginMatchingExtensions](self->_thumbnailExtensionCache, "beginMatchingExtensions");
  -[QLExtensionManagerCache beginMatchingExtensions](self->_previewHighMemoryExtensionCache, "beginMatchingExtensions");
  -[QLExtensionManagerCache beginMatchingExtensions](self->_thumbnailHighMemoryExtensionCache, "beginMatchingExtensions");
  -[QLExtensionManagerCache beginMatchingExtensions](self->_thumbnailSecureExtensionCache, "beginMatchingExtensions");
}

void __75__QLExtensionManager__cachesForExtensionType_shouldUseRestrictedExtension___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[3];
  _QWORD v17[3];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "previewExtensionCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v2;
  objc_msgSend(*(id *)(a1 + 32), "previewHighMemoryExtensionCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_cachesForExtensionType_shouldUseRestrictedExtension__previewExtensionCaches;
  _cachesForExtensionType_shouldUseRestrictedExtension__previewExtensionCaches = v4;

  objc_msgSend(*(id *)(a1 + 32), "thumbnailSecureExtensionCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v6;
  objc_msgSend(*(id *)(a1 + 32), "thumbnailExtensionCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v7;
  objc_msgSend(*(id *)(a1 + 32), "thumbnailHighMemoryExtensionCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 3);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)_cachesForExtensionType_shouldUseRestrictedExtension__restrictedThumbnailExtensionCaches;
  _cachesForExtensionType_shouldUseRestrictedExtension__restrictedThumbnailExtensionCaches = v9;

  objc_msgSend(*(id *)(a1 + 32), "thumbnailExtensionCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  objc_msgSend(*(id *)(a1 + 32), "thumbnailHighMemoryExtensionCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v12;
  objc_msgSend(*(id *)(a1 + 32), "thumbnailSecureExtensionCache");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 3);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)_cachesForExtensionType_shouldUseRestrictedExtension__thumbnailExtensionCaches;
  _cachesForExtensionType_shouldUseRestrictedExtension__thumbnailExtensionCaches = v14;

}

- (BOOL)existsExtensionForContentType:(id)a3 allowExtensionsForParentTypes:(BOOL)a4 firstPartyExtension:(BOOL)a5 applicationBundleIdentifier:(id)a6 extensionPath:(id)a7 extensionType:(unint64_t)a8 generationType:(unint64_t)a9
{
  void *v9;
  BOOL v10;
  uint64_t v12;

  LOBYTE(v12) = 0;
  -[QLExtensionManager extensionForContentType:allowExtensionsForParentTypes:firstPartyExtension:applicationBundleIdentifier:extensionPath:extensionType:generationType:shouldUseRestrictedExtension:](self, "extensionForContentType:allowExtensionsForParentTypes:firstPartyExtension:applicationBundleIdentifier:extensionPath:extensionType:generationType:shouldUseRestrictedExtension:", a3, a4, a5, a6, a7, a8, a9, v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 != 0;

  return v10;
}

- (BOOL)existsExtensionForContentType:(id)a3 allowExtensionsForParentTypes:(BOOL)a4 applicationBundleIdentifier:(id)a5 extensionPath:(id)a6 extensionType:(unint64_t)a7 generationType:(unint64_t)a8
{
  return -[QLExtensionManager existsExtensionForContentType:allowExtensionsForParentTypes:firstPartyExtension:applicationBundleIdentifier:extensionPath:extensionType:generationType:](self, "existsExtensionForContentType:allowExtensionsForParentTypes:firstPartyExtension:applicationBundleIdentifier:extensionPath:extensionType:generationType:", a3, a4, 0, a5, a6, a7, a8);
}

- (BOOL)existsExtensionForContentType:(id)a3 allowExtensionsForParentTypes:(BOOL)a4 applicationBundleIdentifier:(id)a5 extensionType:(unint64_t)a6 generationType:(unint64_t)a7
{
  return -[QLExtensionManager existsExtensionForContentType:allowExtensionsForParentTypes:applicationBundleIdentifier:extensionPath:extensionType:generationType:](self, "existsExtensionForContentType:allowExtensionsForParentTypes:applicationBundleIdentifier:extensionPath:extensionType:generationType:", a3, a4, a5, 0, a6, a7);
}

- (void)extensionContextForContentType:(id)a3 allowExtensionsForParentTypes:(BOOL)a4 appBundleIdentifier:(id)a5 extensionPath:(id)a6 extensionType:(unint64_t)a7 generationType:(unint64_t)a8 withCompletionHandler:(id)a9
{
  -[QLExtensionManager extensionContextForContentType:allowExtensionsForParentTypes:firstPartyExtension:appBundleIdentifier:extensionPath:extensionType:generationType:withCompletionHandler:](self, "extensionContextForContentType:allowExtensionsForParentTypes:firstPartyExtension:appBundleIdentifier:extensionPath:extensionType:generationType:withCompletionHandler:", a3, a4, 0, a5, a6, a7, a8, a9);
}

- (void)extensionContextForContentType:(id)a3 allowExtensionsForParentTypes:(BOOL)a4 firstPartyExtension:(BOOL)a5 appBundleIdentifier:(id)a6 extensionPath:(id)a7 extensionType:(unint64_t)a8 generationType:(unint64_t)a9 withCompletionHandler:(id)a10
{
  _BOOL8 v13;
  _BOOL8 v14;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t buf[16];

  v13 = a5;
  v14 = a4;
  v17 = a10;
  LOBYTE(v21) = 0;
  -[QLExtensionManager extensionForContentType:allowExtensionsForParentTypes:firstPartyExtension:applicationBundleIdentifier:extensionPath:extensionType:generationType:shouldUseRestrictedExtension:](self, "extensionForContentType:allowExtensionsForParentTypes:firstPartyExtension:applicationBundleIdentifier:extensionPath:extensionType:generationType:shouldUseRestrictedExtension:", a3, v14, v13, a6, a7, a8, a9, v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (!v18)
  {
LABEL_9:
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v17 + 2))(v17, 0, 0, 0);
    goto LABEL_10;
  }
  if (a8 != 1 && (objc_msgSend(v18, "isGenerationPreview") & 1) == 0)
  {
    v20 = _qlsLogHandle;
    if (!_qlsLogHandle)
    {
      QLSInitLogging();
      v20 = _qlsLogHandle;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D4C7000, v20, OS_LOG_TYPE_ERROR, "Extension contexts can be provided for non-UI extensions only. #Remote", buf, 2u);
    }
    goto LABEL_9;
  }
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __188__QLExtensionManager_extensionContextForContentType_allowExtensionsForParentTypes_firstPartyExtension_appBundleIdentifier_extensionPath_extensionType_generationType_withCompletionHandler___block_invoke;
  v22[3] = &unk_24C71B278;
  v23 = v19;
  v24 = v17;
  objc_msgSend(v23, "beginExtensionRequestWithInputItems:completion:", 0, v22);

LABEL_10:
}

void __188__QLExtensionManager_extensionContextForContentType_allowExtensionsForParentTypes_firstPartyExtension_appBundleIdentifier_extensionPath_extensionType_generationType_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = _qlsLogHandle;
    if (!_qlsLogHandle)
    {
      QLSInitLogging();
      v7 = _qlsLogHandle;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_20D4C7000, v7, OS_LOG_TYPE_FAULT, "Error while instantiating extension's object: %@ #Remote", (uint8_t *)&v9, 0xCu);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_extensionContextForUUID:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)qlExtensionForContentType:(id)a3 allowExtensionsForParentTypes:(BOOL)a4 applicationBundleIdentifier:(id)a5 extensionPath:(id)a6 extensionType:(unint64_t)a7 generationType:(unint64_t)a8 shouldUseRestrictedExtension:(BOOL)a9
{
  uint64_t v10;

  LOBYTE(v10) = a9;
  return -[QLExtensionManager qlExtensionForContentType:allowExtensionsForParentTypes:firstPartyExtension:applicationBundleIdentifier:extensionPath:extensionType:generationType:shouldUseRestrictedExtension:](self, "qlExtensionForContentType:allowExtensionsForParentTypes:firstPartyExtension:applicationBundleIdentifier:extensionPath:extensionType:generationType:shouldUseRestrictedExtension:", a3, a4, 0, a5, a6, a7, a8, v10);
}

- (id)extensionForContentType:(id)a3 allowExtensionsForParentTypes:(BOOL)a4 applicationBundleIdentifier:(id)a5 extensionPath:(id)a6 extensionType:(unint64_t)a7 generationType:(unint64_t)a8
{
  uint64_t v9;

  LOBYTE(v9) = 0;
  return -[QLExtensionManager extensionForContentType:allowExtensionsForParentTypes:firstPartyExtension:applicationBundleIdentifier:extensionPath:extensionType:generationType:shouldUseRestrictedExtension:](self, "extensionForContentType:allowExtensionsForParentTypes:firstPartyExtension:applicationBundleIdentifier:extensionPath:extensionType:generationType:shouldUseRestrictedExtension:", a3, a4, 0, a5, a6, a7, a8, v9);
}

- (id)_extensionPointNameForExtensionType:(unint64_t)a3
{
  if (a3)
    return CFSTR("com.apple.quicklook.thumbnail");
  else
    return CFSTR("com.apple.quicklook.preview");
}

- (id)_applicationPathForBundleId:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v11;

  v3 = a3;
  v11 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 1, &v11);
  v5 = v11;
  if (!v4)
  {
    v6 = MEMORY[0x24BDE5F50];
    v7 = *(NSObject **)(MEMORY[0x24BDE5F50] + 128);
    if (!v7)
    {
      QLTInitLogging();
      v7 = *(NSObject **)(v6 + 128);
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[QLExtensionManager _applicationPathForBundleId:].cold.1((uint64_t)v3, (uint64_t)v5, v7);
  }
  objc_msgSend(v4, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (QLExtensionManagerCache)thumbnailExtensionCache
{
  return self->_thumbnailExtensionCache;
}

- (void)setThumbnailExtensionCache:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailExtensionCache, a3);
}

- (QLExtensionManagerCache)previewExtensionCache
{
  return self->_previewExtensionCache;
}

- (void)setPreviewExtensionCache:(id)a3
{
  objc_storeStrong((id *)&self->_previewExtensionCache, a3);
}

- (QLExtensionManagerCache)previewHighMemoryExtensionCache
{
  return self->_previewHighMemoryExtensionCache;
}

- (void)setPreviewHighMemoryExtensionCache:(id)a3
{
  objc_storeStrong((id *)&self->_previewHighMemoryExtensionCache, a3);
}

- (QLExtensionManagerCache)thumbnailHighMemoryExtensionCache
{
  return self->_thumbnailHighMemoryExtensionCache;
}

- (void)setThumbnailHighMemoryExtensionCache:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailHighMemoryExtensionCache, a3);
}

- (QLExtensionManagerCache)thumbnailSecureExtensionCache
{
  return self->_thumbnailSecureExtensionCache;
}

- (void)setThumbnailSecureExtensionCache:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailSecureExtensionCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailSecureExtensionCache, 0);
  objc_storeStrong((id *)&self->_thumbnailHighMemoryExtensionCache, 0);
  objc_storeStrong((id *)&self->_previewHighMemoryExtensionCache, 0);
  objc_storeStrong((id *)&self->_previewExtensionCache, 0);
  objc_storeStrong((id *)&self->_thumbnailExtensionCache, 0);
}

- (void)_applicationPathForBundleId:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_20D4C7000, log, OS_LOG_TYPE_ERROR, "No application record for %@: %@", (uint8_t *)&v3, 0x16u);
}

@end
