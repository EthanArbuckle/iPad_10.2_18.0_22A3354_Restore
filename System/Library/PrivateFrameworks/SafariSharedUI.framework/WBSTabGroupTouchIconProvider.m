@implementation WBSTabGroupTouchIconProvider

- (BOOL)canHandleRequest:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)iconForTabGroup:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSBookmarkFolderTouchIconProvider cachedImageForFolderUUID:](self, "cachedImageForFolderUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)configuration
{
  if (defaultConfiguration_onceToken_0 != -1)
    dispatch_once(&defaultConfiguration_onceToken_0, &__block_literal_global_44);
  return (id)defaultConfiguration_configuration_0;
}

- (id)defaultFolderIconForRequest:(id)a3
{
  return 0;
}

- (id)backgroundColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "safari_colorWithRGBColorComponents:", &unk_1E547C270);
}

- (BOOL)canProvideUpdatesForRequest:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "tabGroupUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") != 0;

  return v4;
}

- (id)folderUUIDForRequest:(id)a3
{
  return (id)objc_msgSend(a3, "tabGroupUUID");
}

- (id)subrequestsForRequest:(id)a3 maximumNumberOfSubrequests:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[6];
  _QWORD v10[4];

  v5 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0;
  objc_msgSend(v5, "tabs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __81__WBSTabGroupTouchIconProvider_subrequestsForRequest_maximumNumberOfSubrequests___block_invoke;
  v9[3] = &unk_1E5446AC0;
  v9[4] = v10;
  v9[5] = a4;
  objc_msgSend(v6, "safari_mapAndFilterObjectsWithOptions:usingBlock:", 0, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v10, 8);
  return v7;
}

id __81__WBSTabGroupTouchIconProvider_subrequestsForRequest_maximumNumberOfSubrequests___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a2;
  objc_msgSend(v6, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "host");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) >= *(_QWORD *)(a1 + 40))
      *a4 = 1;
    objc_msgSend(v6, "bookmark");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v9, "address");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "safari_URLWithUserTypedString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBSTouchIconRequest requestWithTitle:url:minimumIconSize:maximumIconSize:](WBSTouchIconRequest, "requestWithTitle:url:minimumIconSize:maximumIconSize:", v10, v13, 32.0, 32.0, 64.0, 64.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)tabGroupManager:(id)a3 didUpdateTabsInTabGroupWithUUID:(id)a4
{
  -[WBSBookmarkFolderTouchIconProvider contentOfFolderDidUpdateWithUUID:](self, "contentOfFolderDidUpdateWithUUID:", a4);
}

- (void)tabGroupManager:(id)a3 didRemoveTabGroupWithUUID:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v5 = (void *)MEMORY[0x1E0C99D20];
  v6 = a4;
  objc_msgSend(v5, "arrayWithObjects:count:", &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[WBSBookmarkFolderTouchIconProvider requestsWithFolderUUIDsDidBecomeInvalid:](self, "requestsWithFolderUUIDsDidBecomeInvalid:", v7, v8, v9);
}

@end
