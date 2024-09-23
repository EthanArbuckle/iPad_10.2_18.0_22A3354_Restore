@implementation PXKeyAssetHackService

+ (BOOL)keyAssetHackServiceIsEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PXKeyAssetHackServiceEnabled"));

  return v3;
}

- (id)title
{
  return CFSTR("Set as Key Asset - Should be subclassed");
}

- (id)asset
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PXDiagnosticsService itemProviders](self, "itemProviders", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v7, "hasItemForIdentifier:", CFSTR("PXDiagnosticsItemIdentifierAsset")))
        {
          objc_msgSend(v7, "itemForIdentifier:", CFSTR("PXDiagnosticsItemIdentifierAsset"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (BOOL)canPerformAction
{
  void *v3;
  BOOL v4;

  if (!objc_msgSend((id)objc_opt_class(), "keyAssetHackServiceIsEnabled"))
    return 0;
  -[PXKeyAssetHackService asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)performAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  PXKeyAssetHackService *v22;
  id v23;

  -[PXKeyAssetHackService asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "librarySpecificFetchOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsContainingAsset:withType:options:", v4, 6, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v10 = v8;
      v11 = v10;
      do
      {
        objc_msgSend(v9, "addObject:", v11);
        objc_msgSend(MEMORY[0x1E0CD1708], "fetchParentHighlightForHighlight:options:", v11, v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "firstObject");
        v13 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v13;
      }
      while (v13);
      objc_msgSend(MEMORY[0x1E0CD1708], "fetchParentDayGroupHighlightForHighlight:options:", v10, v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
        objc_msgSend(v9, "addObject:", v15);
      objc_msgSend(v4, "photoLibrary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __38__PXKeyAssetHackService_performAction__block_invoke;
      v20[3] = &unk_1E51457C8;
      v21 = v9;
      v22 = self;
      v23 = v4;
      v19 = 0;
      v17 = v9;
      objc_msgSend(v16, "performChangesAndWait:error:", v20, &v19);
      v18 = v19;

    }
  }

}

- (BOOL)shouldSetKeyAssetForHighlight:(id)a3
{
  return 0;
}

void __38__PXKeyAssetHackService_performAction__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(a1 + 40), "shouldSetKeyAssetForHighlight:", v7, (_QWORD)v9))
        {
          objc_msgSend(MEMORY[0x1E0CD1710], "changeRequestForPhotosHighlight:", v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setKeyAssetPrivate:", *(_QWORD *)(a1 + 48));

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

@end
