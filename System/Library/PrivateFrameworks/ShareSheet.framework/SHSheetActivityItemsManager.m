@implementation SHSheetActivityItemsManager

- (SHSheetActivityItemsManager)initWithActivityItems:(id)a3 activityViewController:(id)a4 delegate:(id)a5 collaborationDelegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SHSheetActivityItemsManager *v14;
  uint64_t v15;
  NSArray *activityItems;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SHSheetActivityItemsManager;
  v14 = -[SHSheetActivityItemsManager init](&v18, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    activityItems = v14->_activityItems;
    v14->_activityItems = (NSArray *)v15;

    objc_storeWeak((id *)&v14->_activityViewController, v11);
    objc_storeWeak((id *)&v14->_delegate, v12);
    objc_storeWeak((id *)&v14->_collaborationDelegate, v13);
    -[SHSheetActivityItemsManager _updateURLRequests](v14, "_updateURLRequests");
    -[SHSheetActivityItemsManager _updateLinkMetadataValues](v14, "_updateLinkMetadataValues");
    -[SHSheetActivityItemsManager _loadGroupActivityMetadataIfNeeded](v14, "_loadGroupActivityMetadataIfNeeded");
  }

  return v14;
}

- (NSArray)linkMetadataValues
{
  if (-[SHSheetActivityItemsManager linkMetadataValuesNeedsUpdate](self, "linkMetadataValuesNeedsUpdate"))
    -[SHSheetActivityItemsManager _updateLinkMetadataValues](self, "_updateLinkMetadataValues");
  return (NSArray *)(id)-[NSArray copy](self->_linkMetadataValues, "copy");
}

- (void)setIsContentManaged:(BOOL)a3
{
  if (self->_isContentManaged != a3)
  {
    self->_isContentManaged = a3;
    -[SHSheetActivityItemsManager _updateIsContentManagedForURLs](self, "_updateIsContentManagedForURLs");
  }
}

- (void)invalidateCache
{
  NSObject *v3;
  uint8_t v4[16];

  share_sheet_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19E419000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating current cache result.", v4, 2u);
  }

  -[SHSheetActivityItemsManager setCacheResult:](self, "setCacheResult:", 0);
}

- (void)_updateIsContentManagedForURLs
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[SHSheetActivityItemsManager cacheResult](self, "cacheResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activityItemURLValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  share_sheet_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[SHSheetActivityItemsManager isContentManaged](self, "isContentManaged");
    NSStringFromBOOL();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v18 = v4;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_19E419000, v5, OS_LOG_TYPE_DEFAULT, "Update URLs:%@ with contentManaged:%@", buf, 0x16u);

  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "ui_setIsContentManaged:", -[SHSheetActivityItemsManager isContentManaged](self, "isContentManaged", (_QWORD)v12));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (id)activityItemValuesForActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SHSheetActivityItemsManager _updateCacheResultForActivity:](self, "_updateCacheResultForActivity:", v4);
  -[SHSheetActivityItemsManager cacheResult](self, "cacheResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activityItemValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SHSheetActivityItemsManager collaborationDelegate](self, "collaborationDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[SHSheetActivityItemsManager collaborationDelegate](self, "collaborationDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "activityItemsManager:collaborationActivityItemValuesForActivityItemValue:activity:", self, v6, v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        share_sheet_log();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v13 = 138412290;
          v14 = v9;
          _os_log_impl(&dword_19E419000, v10, OS_LOG_TYPE_DEFAULT, "Overidding activityItemValues with collaborative item values:%@", (uint8_t *)&v13, 0xCu);
        }

        v11 = v9;
        v6 = v11;
      }

    }
  }

  return v6;
}

- (NSArray)suggestionAssetIdentifiers
{
  void *v3;
  void *v4;

  -[SHSheetActivityItemsManager _updateCacheResultForActivity:](self, "_updateCacheResultForActivity:", 0);
  -[SHSheetActivityItemsManager cacheResult](self, "cacheResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "suggestionAssetIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (id)activityItemURLValuesForActivity:(id)a3
{
  void *v4;
  void *v5;

  -[SHSheetActivityItemsManager _updateCacheResultForActivity:](self, "_updateCacheResultForActivity:", a3);
  -[SHSheetActivityItemsManager cacheResult](self, "cacheResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activityItemURLValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)suggestedImageDataFromActivityItem:(id)a3
{
  void *v4;
  void *v5;

  -[SHSheetActivityItemsManager _updateCacheResultForActivity:](self, "_updateCacheResultForActivity:", a3);
  -[SHSheetActivityItemsManager cacheResult](self, "cacheResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestedImageData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)securityScopedURLsForActivity:(id)a3
{
  void *v4;
  void *v5;

  -[SHSheetActivityItemsManager _updateCacheResultForActivity:](self, "_updateCacheResultForActivity:", a3);
  -[SHSheetActivityItemsManager cacheResult](self, "cacheResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "securityScopedURLs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)initialSocialTextForActivity:(id)a3
{
  void *v4;
  void *v5;

  -[SHSheetActivityItemsManager _updateCacheResultForActivity:](self, "_updateCacheResultForActivity:", a3);
  -[SHSheetActivityItemsManager cacheResult](self, "cacheResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "initialSocialText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)subjectForActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  -[SHSheetActivityItemsManager _updateCacheResultForActivity:](self, "_updateCacheResultForActivity:", v4);
  -[SHSheetActivityItemsManager collaborationDelegate](self, "collaborationDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activityItemsManager:subjectForActivity:", self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
  }
  else
  {
    -[SHSheetActivityItemsManager cacheResult](self, "cacheResult");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "subject");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)recipientsHandlesForActivity:(id)a3
{
  void *v4;
  void *v5;

  -[SHSheetActivityItemsManager _updateCacheResultForActivity:](self, "_updateCacheResultForActivity:", a3);
  -[SHSheetActivityItemsManager cacheResult](self, "cacheResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recipientsHandles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)recipientsForActivity:(id)a3
{
  void *v4;
  void *v5;

  -[SHSheetActivityItemsManager _updateCacheResultForActivity:](self, "_updateCacheResultForActivity:", a3);
  -[SHSheetActivityItemsManager cacheResult](self, "cacheResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recipients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_updateCacheResultForActivity:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  -[SHSheetActivityItemsManager cacheResult](self, "cacheResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v9)
  {
    objc_msgSend(v4, "activity");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 != v9)
    {
      -[SHSheetActivityItemsManager _resolveActivityItemsForActivity:](self, "_resolveActivityItemsForActivity:");
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v8 = (void *)v7;

      v5 = v8;
    }
  }
  else if ((objc_msgSend(v4, "isPlaceholder") & 1) == 0)
  {
    -[SHSheetActivityItemsManager _resolvePlaceholderActivityItems](self, "_resolvePlaceholderActivityItems");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  -[SHSheetActivityItemsManager setCacheResult:](self, "setCacheResult:", v5);

}

- (void)_configureContentManagedForActivityItem:(id)a3 activityItemValue:(id)a4 outURLs:(id)a5 outScopedURLs:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _BOOL8 v14;
  void *v15;
  char isKindOfClass;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = -[SHSheetActivityItemsManager isContentManaged](self, "isContentManaged");
  if (v14)
    v15 = (void *)MEMORY[0x1E0C9AAB0];
  else
    v15 = (void *)MEMORY[0x1E0C9AAA0];
  objc_setAssociatedObject(v11, &__UIIsContentManagedReferenceKey, v15, (void *)1);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SHSheetActivityItemsManager activityViewController](self, "activityViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activityViewControllerSuggestionFileURL:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    share_sheet_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138412290;
      v24 = v18;
      _os_log_impl(&dword_19E419000, v19, OS_LOG_TYPE_DEFAULT, "enrich suggestions with suggestionFileURL:%@", (uint8_t *)&v23, 0xCu);
    }

  }
  else
  {
    v18 = 0;
  }
  if (isKindOfClass & 1 | (v18 != 0))
  {
    if ((isKindOfClass & 1) != 0)
      v20 = v11;
    else
      v20 = v18;
    v21 = v20;
    objc_msgSend(v21, "ui_setIsContentManaged:", v14);
    objc_msgSend(v12, "addObject:", v21);
    +[UISUISecurityScopedResource scopedResourceWithURL:allowedAccess:](UISUISecurityScopedResource, "scopedResourceWithURL:allowedAccess:", v21, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      +[UISUISecurityScopedResource scopedResourceWithURL:allowedAccess:](UISUISecurityScopedResource, "scopedResourceWithURL:allowedAccess:", v21, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v13, "addObject:", v22);

  }
}

+ (id)placeholderActivityItemValuesForActivityItem:(id)a3 activityViewController:(id)a4
{
  return +[SHSheetActivityItemsManager _placeholderActivityItemValuesForActivityItem:activityViewController:shouldUpdateMappings:](SHSheetActivityItemsManager, "_placeholderActivityItemValuesForActivityItem:activityViewController:shouldUpdateMappings:", a3, a4, 1);
}

+ (id)_placeholderActivityItemValuesForActivityItem:(id)a3 activityViewController:(id)a4 shouldUpdateMappings:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  _UIActivityPlaceholderItemProxy *v20;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _QWORD v28[3];

  v5 = a5;
  v28[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "activityViewControllerPlaceholderItems:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      goto LABEL_11;
LABEL_8:
    v12 = v9;
    goto LABEL_23;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "activityViewControllerPlaceholderItem:", v8);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
    {
      v28[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = (void *)MEMORY[0x1E0C9AA60];
    }

    if (v5)
      goto LABEL_11;
    goto LABEL_8;
  }
  v9 = (void *)MEMORY[0x1E0C9AA60];
  if (!v5)
    goto LABEL_8;
LABEL_11:
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v22 = v9;
  v14 = v9;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (v19)
        {
          v20 = -[_UIActivityPlaceholderItemProxy initWithPlaceholderItem:]([_UIActivityPlaceholderItemProxy alloc], "initWithPlaceholderItem:", v19);
          if (v20)
          {
            objc_msgSend(v13, "addObject:", v20);
            +[_UIActivityItemMapping _addActivityItem:activityViewController:originalActivityItem:](_UIActivityItemMapping, "_addActivityItem:activityViewController:originalActivityItem:", v20, v8, v7);
          }

        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v16);
  }

  v12 = (id)objc_msgSend(v13, "copy");
  v9 = v22;
LABEL_23:

  return v12;
}

- (id)placeholderActivityItemValuesForActivityItem:(id)a3 activityViewController:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  +[SHSheetActivityItemsManager _placeholderActivityItemValuesForActivityItem:activityViewController:shouldUpdateMappings:](SHSheetActivityItemsManager, "_placeholderActivityItemValuesForActivityItem:activityViewController:shouldUpdateMappings:", a3, a4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") == 1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v6, "canLoadObjectOfClass:", objc_opt_class()))
      {
        -[SHSheetActivityItemsManager _delegateLoadedURLs](self, "_delegateLoadedURLs");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "count"))
        {
          v8 = v7;

          v5 = v8;
        }

      }
    }
  }

  return v5;
}

- (id)_delegateLoadedURLs
{
  void *v3;
  void *v4;
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
  -[SHSheetActivityItemsManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "urlRequestsForActivityItemsManager:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
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
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "URL", (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

    v12 = (void *)objc_msgSend(v5, "copy");
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v12;
}

- (id)_resolvePlaceholderActivityItems
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  _UIActivityPlaceholderItemProxy *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  int v32;
  NSObject *v33;
  _BOOL4 v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  const char *v39;
  SHSheetActivityItemsResult *v40;
  UISUISecurityContext *v41;
  void *v43;
  void *v44;
  id obj;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t buf[4];
  uint64_t v63;
  __int16 v64;
  void *v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v52 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetActivityItemsManager collaborationDelegate](self, "collaborationDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collaborationPlaceholderActivityItemsForActivityItemsManager:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = v5;
  if (objc_msgSend(v5, "count"))
  {
    v6 = v5;
  }
  else
  {
    -[SHSheetActivityItemsManager activityItems](self, "activityItems");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = v6;
  v7 = (void *)v52;
  v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
  if (v48)
  {
    v49 = 0;
    v46 = *(_QWORD *)v59;
    v47 = 0;
    do
    {
      for (i = 0; i != v48; ++i)
      {
        if (*(_QWORD *)v59 != v46)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
        -[SHSheetActivityItemsManager activityViewController](self, "activityViewController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SHSheetActivityItemsManager placeholderActivityItemValuesForActivityItem:activityViewController:](self, "placeholderActivityItemValuesForActivityItem:activityViewController:", v9, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v11, "count"))
        {
          v50 = v11;
          v51 = i;
          v56 = 0u;
          v57 = 0u;
          v54 = 0u;
          v55 = 0u;
          v12 = v11;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v55;
            do
            {
              for (j = 0; j != v14; ++j)
              {
                if (*(_QWORD *)v55 != v15)
                  objc_enumerationMutation(v12);
                v17 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * j);
                if (v17)
                {
                  v18 = -[_UIActivityPlaceholderItemProxy initWithPlaceholderItem:]([_UIActivityPlaceholderItemProxy alloc], "initWithPlaceholderItem:", v17);
                  if (v18)
                  {
                    -[SHSheetActivityItemsManager _configureContentManagedForActivityItem:activityItemValue:outURLs:outScopedURLs:](self, "_configureContentManagedForActivityItem:activityItemValue:outURLs:outScopedURLs:", v9, v18, v3, v7);
                    objc_msgSend(v53, "addObject:", v18);
                    -[SHSheetActivityItemsManager activityViewController](self, "activityViewController");
                    v19 = v3;
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    +[_UIActivityItemMapping _addActivityItem:activityViewController:originalActivityItem:](_UIActivityItemMapping, "_addActivityItem:activityViewController:originalActivityItem:", v18, v20, v9);

                    v3 = v19;
                    v7 = (void *)v52;
                  }

                }
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
            }
            while (v14);
          }

          v11 = v50;
          i = v51;
        }
        else if (v9)
        {
          -[SHSheetActivityItemsManager _configureContentManagedForActivityItem:activityItemValue:outURLs:outScopedURLs:](self, "_configureContentManagedForActivityItem:activityItemValue:outURLs:outScopedURLs:", v9, v9, v3, v7);
          objc_msgSend(v53, "addObject:", v9);
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[SHSheetActivityItemsManager activityViewController](self, "activityViewController");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "activityViewControllerSuggestionFaceRecognitionData:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          share_sheet_log();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            v24 = objc_msgSend(v22, "length");
            *(_DWORD *)buf = 134217984;
            v63 = v24;
            _os_log_impl(&dword_19E419000, v23, OS_LOG_TYPE_DEFAULT, "enrich suggestions with face recognition data:%lu", buf, 0xCu);
          }

          v47 = v22;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[SHSheetActivityItemsManager activityViewController](self, "activityViewController");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "activityViewControllerSuggestionAssetLocalIdentifier:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26)
          {
            objc_msgSend(v44, "addObject:", v26);
            share_sheet_log();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v63 = (uint64_t)v26;
              _os_log_impl(&dword_19E419000, v27, OS_LOG_TYPE_DEFAULT, "enrich suggestions with assetIdentifier:%@", buf, 0xCu);
            }

          }
        }
        if (!objc_msgSend(v49, "count") && (objc_opt_respondsToSelector() & 1) != 0)
        {
          -[SHSheetActivityItemsManager activityViewController](self, "activityViewController");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "activityViewControllerShareRecipients:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v29, "count"))
          {
            v30 = v29;

            share_sheet_log();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v63 = (uint64_t)v30;
              _os_log_impl(&dword_19E419000, v31, OS_LOG_TYPE_DEFAULT, "provided recipients:%@", buf, 0xCu);
            }

            v49 = v30;
          }

        }
      }
      v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
    }
    while (v48);
  }
  else
  {
    v47 = 0;
    v49 = 0;
  }

  v32 = IsAppleInternalBuild();
  share_sheet_log();
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
  if (v32)
  {
    if (!v34)
      goto LABEL_51;
    -[SHSheetActivityItemsManager activityItems](self, "activityItems");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    SFFilterStringsFromList();
    v36 = v3;
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    SFFilterStringsFromList();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138478083;
    v63 = (uint64_t)v37;
    v64 = 2113;
    v65 = v38;
    v39 = "Resolved placeholder activity item types:%{private}@ to:%{private}@";
  }
  else
  {
    if (!v34)
      goto LABEL_51;
    -[SHSheetActivityItemsManager activityItems](self, "activityItems");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    SFGenerateTypeList();
    v36 = v3;
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    SFGenerateTypeList();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v63 = (uint64_t)v37;
    v64 = 2114;
    v65 = v38;
    v39 = "Resolved placeholder activity item types:%{public}@ to:%{public}@";
  }
  _os_log_impl(&dword_19E419000, v33, OS_LOG_TYPE_DEFAULT, v39, buf, 0x16u);

  v3 = v36;
  v7 = (void *)v52;
LABEL_51:

  v40 = -[SHSheetActivityItemsResult initWithActivity:activityItemValues:]([SHSheetActivityItemsResult alloc], "initWithActivity:activityItemValues:", 0, v53);
  if (objc_msgSend(v3, "count"))
    -[SHSheetActivityItemsResult setActivityItemURLValues:](v40, "setActivityItemURLValues:", v3);
  if (objc_msgSend(v7, "count"))
  {
    v41 = -[UISUISecurityContext initWithSecurityScopedResources:]([UISUISecurityContext alloc], "initWithSecurityScopedResources:", v7);
    -[SHSheetActivityItemsResult setSecurityScopedURLs:](v40, "setSecurityScopedURLs:", v41);

  }
  if (objc_msgSend(v44, "count"))
    -[SHSheetActivityItemsResult setSuggestionAssetIdentifiers:](v40, "setSuggestionAssetIdentifiers:", v44);
  -[SHSheetActivityItemsResult setSuggestedImageData:](v40, "setSuggestedImageData:", v47);
  -[SHSheetActivityItemsResult setRecipients:](v40, "setRecipients:", v49);

  return v40;
}

- (id)_resolveActivityItemsForActivity:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  char isKindOfClass;
  id v30;
  void *v31;
  uint64_t v32;
  UIActivityItemURLRep *v33;
  void *v34;
  int v35;
  NSObject *v36;
  _BOOL4 v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  const char *v43;
  SHSheetActivityItemsResult *v44;
  UISUISecurityContext *v45;
  __int128 v47;
  id obj;
  uint64_t v49;
  id v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  __int128 v57;
  id v58;
  void *v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  uint8_t v70[128];
  _BYTE buf[24];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if (!WebPrivacyLibraryCore_frameworkLibrary)
  {
    *(_OWORD *)buf = xmmword_1E4003F98;
    *(_QWORD *)&buf[16] = 0;
    WebPrivacyLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  v6 = WebPrivacyLibraryCore_frameworkLibrary;
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  -[SHSheetActivityItemsManager activityItems](self, "activityItems");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
  if (v51)
  {
    v52 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v49 = *(_QWORD *)v66;
    *(_QWORD *)&v7 = 138412290;
    v47 = v7;
    v50 = v4;
    do
    {
      v11 = 0;
      v12 = v9;
      v13 = v10;
      do
      {
        if (*(_QWORD *)v66 != v49)
        {
          v14 = v11;
          objc_enumerationMutation(obj);
          v11 = v14;
        }
        v53 = v11;
        v15 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v11);
        -[SHSheetActivityItemsManager _requestThumbnailForActivityItem:activity:](self, "_requestThumbnailForActivityItem:activity:", v15, v4, v47);
        *((_QWORD *)&v57 + 1) = objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&v57 = -[SHSheetActivityItemsManager _requestAttachmentURLItemDataForActivityItem:activity:](self, "_requestAttachmentURLItemDataForActivityItem:activity:", v15, v4);
        -[SHSheetActivityItemsManager _requestInitialSocialTextForActivityItem:activity:](self, "_requestInitialSocialTextForActivityItem:activity:", v15, v4);
        v55 = objc_claimAutoreleasedReturnValue();

        -[SHSheetActivityItemsManager _requestSubjectForActivityItem:activity:](self, "_requestSubjectForActivityItem:activity:", v15, v4);
        v16 = objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v8, "count"))
        {
          -[SHSheetActivityItemsManager _requestRecipientsHandlesForActivityItem:activity:](self, "_requestRecipientsHandlesForActivityItem:activity:", v15, v4);
          v17 = objc_claimAutoreleasedReturnValue();

          v8 = (void *)v17;
        }
        v56 = v8;
        v54 = (void *)v16;
        if (!objc_msgSend(v52, "count") && (objc_opt_respondsToSelector() & 1) != 0)
        {
          -[SHSheetActivityItemsManager activityViewController](self, "activityViewController");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "activityViewControllerShareRecipients:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v19, "count"))
          {
            v20 = v19;

            share_sheet_log();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v47;
              *(_QWORD *)&buf[4] = v20;
              _os_log_impl(&dword_19E419000, v21, OS_LOG_TYPE_DEFAULT, "provided recipients:%@", buf, 0xCu);
            }

            v52 = v20;
          }

        }
        -[SHSheetActivityItemsManager _requestItemsForActivityItem:activity:](self, "_requestItemsForActivityItem:activity:", v15, v4);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        v64 = 0u;
        v58 = v22;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v62;
          do
          {
            for (i = 0; i != v24; ++i)
            {
              v27 = v5;
              if (*(_QWORD *)v62 != v25)
                objc_enumerationMutation(v58);
              v28 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
              objc_opt_class();
              isKindOfClass = objc_opt_isKindOfClass();
              v30 = v28;
              v31 = v30;
              if ((isKindOfClass & 1) != 0)
              {
                if (v6)
                {
                  objc_msgSend(v30, "_wp_urlByRemovingTrackingInformation");
                  v32 = objc_claimAutoreleasedReturnValue();

                  v31 = (void *)v32;
                }
                if (v57 == 0)
                {
                  v33 = v31;
                }
                else
                {
                  v33 = objc_alloc_init(UIActivityItemURLRep);
                  -[UIActivityItemURLRep setURL:](v33, "setURL:", v31);
                  -[UIActivityItemURLRep setThumbnail:](v33, "setThumbnail:", *((_QWORD *)&v57 + 1));
                  -[UIActivityItemURLRep setAttachmentURLType:](v33, "setAttachmentURLType:", (_QWORD)v57);
                }

                v31 = v33;
              }
              if (v6)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  objc_msgSend(v31, "_wp_removeTrackingInformationFromURLRepresentation");
              }
              -[SHSheetActivityItemsManager activityViewController](self, "activityViewController");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              +[_UIActivityItemMapping _addActivityItem:activityViewController:originalActivityItem:](_UIActivityItemMapping, "_addActivityItem:activityViewController:originalActivityItem:", v31, v34, v15);

              v5 = v27;
              -[SHSheetActivityItemsManager _configureContentManagedForActivityItem:activityItemValue:outURLs:outScopedURLs:](self, "_configureContentManagedForActivityItem:activityItemValue:outURLs:outScopedURLs:", v15, v31, v27, v59);
              objc_msgSend(v60, "addObject:", v31);

            }
            v24 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
          }
          while (v24);
        }

        v9 = v54;
        v11 = v53 + 1;
        v12 = v54;
        v10 = (void *)v55;
        v8 = v56;
        v13 = (void *)v55;
        v4 = v50;
      }
      while (v53 + 1 != v51);
      v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
    }
    while (v51);
  }
  else
  {
    v52 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
  }

  v35 = IsAppleInternalBuild();
  share_sheet_log();
  v36 = objc_claimAutoreleasedReturnValue();
  v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
  if (v35)
  {
    if (!v37)
      goto LABEL_44;
    -[SHSheetActivityItemsManager activityItems](self, "activityItems");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    SFFilterStringsFromList();
    v39 = v9;
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    SFFilterStringsFromList();
    v41 = v5;
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138478083;
    *(_QWORD *)&buf[4] = v40;
    *(_WORD *)&buf[12] = 2113;
    *(_QWORD *)&buf[14] = v42;
    v43 = "Resolved activity item types:%{private}@ to:%{private}@";
  }
  else
  {
    if (!v37)
      goto LABEL_44;
    -[SHSheetActivityItemsManager activityItems](self, "activityItems");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    SFGenerateTypeList();
    v39 = v9;
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    SFGenerateTypeList();
    v41 = v5;
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v40;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v42;
    v43 = "Resolved activity item types:%{public}@ to:%{public}@";
  }
  _os_log_impl(&dword_19E419000, v36, OS_LOG_TYPE_DEFAULT, v43, buf, 0x16u);

  v5 = v41;
  v9 = v39;
LABEL_44:

  v44 = -[SHSheetActivityItemsResult initWithActivity:activityItemValues:]([SHSheetActivityItemsResult alloc], "initWithActivity:activityItemValues:", v4, v60);
  if (objc_msgSend(v5, "count"))
    -[SHSheetActivityItemsResult setActivityItemURLValues:](v44, "setActivityItemURLValues:", v5);
  if (objc_msgSend(v59, "count"))
  {
    v45 = -[UISUISecurityContext initWithSecurityScopedResources:]([UISUISecurityContext alloc], "initWithSecurityScopedResources:", v59);
    -[SHSheetActivityItemsResult setSecurityScopedURLs:](v44, "setSecurityScopedURLs:", v45);

  }
  -[SHSheetActivityItemsResult setInitialSocialText:](v44, "setInitialSocialText:", v10);
  -[SHSheetActivityItemsResult setSubject:](v44, "setSubject:", v9);
  -[SHSheetActivityItemsResult setRecipientsHandles:](v44, "setRecipientsHandles:", v8);
  -[SHSheetActivityItemsResult setRecipients:](v44, "setRecipients:", v52);

  return v44;
}

- (void)_updateURLRequests
{
  void *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  SHSheetActivityItemsManager *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  id v44;
  id v45;
  uint64_t v46;
  void *v47;
  _QWORD v48[4];
  void (**v49)(_QWORD, _QWORD);
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[4];
  id v59;
  id v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __49__SHSheetActivityItemsManager__updateURLRequests__block_invoke;
  v58[3] = &unk_1E4003E90;
  v45 = v3;
  v59 = v45;
  v44 = v4;
  v60 = v44;
  v5 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A1AE9514](v58);
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  -[SHSheetActivityItemsManager activityItems](self, "activityItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v55;
    v42 = *MEMORY[0x1E0DC32B8];
    v46 = *(_QWORD *)v55;
    v47 = v6;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v55 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          ((void (**)(_QWORD, void *))v5)[2](v5, v11);
          goto LABEL_37;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v12)
          {
            objc_msgSend(v12, "scheme");
            v14 = objc_claimAutoreleasedReturnValue();
            if (v14)
            {
              v15 = (void *)v14;
              objc_msgSend(v13, "host");
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              if (v16)
                ((void (**)(_QWORD, void *))v5)[2](v5, v13);
            }
          }

        }
        else if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v17 = self;
          -[SHSheetActivityItemsManager activityViewController](self, "activityViewController");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "activityViewControllerPlaceholderItems:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          v52 = 0u;
          v53 = 0u;
          v50 = 0u;
          v51 = 0u;
          v20 = v19;
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v51;
            do
            {
              for (i = 0; i != v22; ++i)
              {
                if (*(_QWORD *)v51 != v23)
                  objc_enumerationMutation(v20);
                v25 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  v5[2](v5, v25);
              }
              v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
            }
            while (v22);
          }

          self = v17;
          v9 = v46;
          v6 = v47;
        }
        else if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          -[SHSheetActivityItemsManager activityViewController](self, "activityViewController");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "activityViewControllerPlaceholderItem:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[SHSheetActivityItemsManager activityViewController](self, "activityViewController");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "activityViewController:itemForActivityType:", v28, CFSTR("com.apple.UIKit.activity.CopyToPasteboard"));
            v29 = (id)objc_claimAutoreleasedReturnValue();

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v30 = v29;
            else
              v30 = v27;
            ((void (**)(_QWORD, id))v5)[2](v5, v30);
            goto LABEL_32;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[SHSheetActivityItemsManager activityViewController](self, "activityViewController");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "activityViewController:itemForActivityType:", v31, CFSTR("com.apple.UIKit.activity.CopyToPasteboard"));
            v29 = (id)objc_claimAutoreleasedReturnValue();

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              ((void (**)(_QWORD, id))v5)[2](v5, v29);
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v29);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = v32;
                if (v32)
                {
                  objc_msgSend(v32, "scheme");
                  v34 = objc_claimAutoreleasedReturnValue();
                  if (v34)
                  {
                    v41 = (void *)v34;
                    objc_msgSend(v33, "host");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v43)
                      ((void (**)(_QWORD, void *))v5)[2](v5, v33);
                  }
                }

              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v29 = v29;
                  v35 = objc_msgSend(v29, "length");
                  v48[0] = MEMORY[0x1E0C809B0];
                  v48[1] = 3221225472;
                  v48[2] = __49__SHSheetActivityItemsManager__updateURLRequests__block_invoke_2;
                  v48[3] = &unk_1E4003EB8;
                  v49 = v5;
                  objc_msgSend(v29, "enumerateAttribute:inRange:options:usingBlock:", v42, 0, v35, 0, v48);

                }
              }
            }
LABEL_32:

          }
        }
LABEL_37:
        ++v10;
      }
      while (v10 != v8);
      v36 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
      v8 = v36;
    }
    while (v36);
  }

  -[SHSheetActivityItemsManager delegate](self, "delegate");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "urlRequestsForActivityItemsManager:", self);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v45, "count") && objc_msgSend(v38, "count"))
    objc_msgSend(v45, "addObjectsFromArray:", v38);
  v39 = (void *)objc_msgSend(v45, "copy");
  -[SHSheetActivityItemsManager setUrlRequests:](self, "setUrlRequests:", v39);

  v40 = (void *)objc_msgSend(v44, "copy");
  -[SHSheetActivityItemsManager setUrlSandboxExtensions:](self, "setUrlSandboxExtensions:", v40);

}

void __49__SHSheetActivityItemsManager__updateURLRequests__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!WebPrivacyLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E4003F98;
    v8 = 0;
    WebPrivacyLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (WebPrivacyLibraryCore_frameworkLibrary)
  {
    objc_msgSend(v3, "_wp_urlByRemovingTrackingInformation");
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v4;
  }
  objc_msgSend(MEMORY[0x1E0CB37A8], "requestWithURL:", v3, v7, v8, v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setNonAppInitiated:", 1);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  objc_msgSend(v3, "issueSandboxExtensionData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

void __49__SHSheetActivityItemsManager__updateURLRequests__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v7;

  v7 = a2;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      *a5 = 1;
    }
  }

}

- (void)_updateLinkMetadataValues
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  SHSheetActivityItemsManager *v15;
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetActivityItemsManager activityItems](self, "activityItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __56__SHSheetActivityItemsManager__updateLinkMetadataValues__block_invoke;
  v14 = &unk_1E4003EE0;
  v15 = self;
  v6 = v4;
  v16 = v6;
  v7 = v3;
  v17 = v7;
  v18 = &v19;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v11);

  if (*((_BYTE *)v20 + 24)
    || (-[SHSheetActivityItemsManager urlRequests](self, "urlRequests", v11, v12, v13, v14, v15, v16),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "count"),
        v8,
        v9))
  {
    objc_msgSend(v6, "removeObjectsAtIndexes:", v7, v11, v12, v13, v14, v15);
  }
  v10 = (void *)objc_msgSend(v6, "copy");
  -[SHSheetActivityItemsManager setLinkMetadataValues:](self, "setLinkMetadataValues:", v10);

  _Block_object_dispose(&v19, 8);
}

void __56__SHSheetActivityItemsManager__updateLinkMetadataValues__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "activityViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIActivityItemMapping _loadMetadataForActivityItem:activityViewController:](_UIActivityItemMapping, "_loadMetadataForActivityItem:activityViewController:", v5, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 48), "addIndex:", objc_msgSend(*(id *)(a1 + 40), "count") - 1);
    else
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }

}

- (void)_loadGroupActivityMetadataIfNeeded
{
  NSArray *urlRequests;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  _BYTE buf[24];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  urlRequests = self->_urlRequests;
  if (urlRequests)
  {
    if (self->_linkMetadataValues)
    {
      if (!-[NSArray count](urlRequests, "count"))
      {
        if (!-[NSArray count](self->_linkMetadataValues, "count")
          || (-[NSArray objectAtIndexedSubscript:](self->_linkMetadataValues, "objectAtIndexedSubscript:", 0),
              v4 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v4, "title"),
              v5 = (void *)objc_claimAutoreleasedReturnValue(),
              v5,
              v4,
              !v5))
        {
          share_sheet_log();
          v6 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19E419000, v6, OS_LOG_TYPE_DEFAULT, "No metadata or URLs were found for the given activity items. Beginning attempted load of group activity metadata...", buf, 2u);
          }

          -[SHSheetActivityItemsManager activityItemValuesForActivity:](self, "activityItemValuesForActivity:", 0);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          +[SHSheetActivityItemUtilities itemProvidersFromActivityItems:](SHSheetActivityItemUtilities, "itemProvidersFromActivityItems:", v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          share_sheet_log();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v8;
            _os_log_impl(&dword_19E419000, v9, OS_LOG_TYPE_DEFAULT, "Found these item providers from the given activity items: %@", buf, 0xCu);
          }

          *(_QWORD *)buf = 0;
          objc_initWeak((id *)buf, self);
          v10[0] = MEMORY[0x1E0C809B0];
          v10[1] = 3221225472;
          v10[2] = __65__SHSheetActivityItemsManager__loadGroupActivityMetadataIfNeeded__block_invoke;
          v10[3] = &unk_1E4003F30;
          objc_copyWeak(&v11, (id *)buf);
          +[SHSheetActivityItemUtilities loadMetadataFromGroupActivityItemProviders:completion:](SHSheetActivityItemUtilities, "loadMetadataFromGroupActivityItemProviders:completion:", v8, v10);
          objc_destroyWeak(&v11);
          objc_destroyWeak((id *)buf);

        }
      }
    }
  }
}

void __65__SHSheetActivityItemsManager__loadGroupActivityMetadataIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5 && objc_msgSend(v5, "count"))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __65__SHSheetActivityItemsManager__loadGroupActivityMetadataIfNeeded__block_invoke_97;
    v9[3] = &unk_1E4003F08;
    objc_copyWeak(&v11, (id *)(a1 + 32));
    v10 = v5;
    sh_dispatch_on_main_queue(v9);

    objc_destroyWeak(&v11);
  }
  else
  {
    share_sheet_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "localizedDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v13 = v8;
      _os_log_impl(&dword_19E419000, v7, OS_LOG_TYPE_DEFAULT, "Could not load group activity metadata: %@", buf, 0xCu);

    }
  }

}

void __65__SHSheetActivityItemsManager__loadGroupActivityMetadataIfNeeded__block_invoke_97(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_didLoadGroupActivityMetadata:", *(_QWORD *)(a1 + 32));

}

- (void)_didLoadGroupActivityMetadata:(id)a3
{
  NSArray *v4;
  NSObject *v5;
  NSArray *linkMetadataValues;
  void *v7;
  int v8;
  NSArray *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = (NSArray *)a3;
  share_sheet_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_19E419000, v5, OS_LOG_TYPE_DEFAULT, "Successfully loaded group activity metadata: %@", (uint8_t *)&v8, 0xCu);
  }

  linkMetadataValues = self->_linkMetadataValues;
  self->_linkMetadataValues = v4;

  -[SHSheetActivityItemsManager delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activityItemsManagerLinkMetadataValuesDidChange:", self);

}

- (void)loadItemProvidersForRequest:(id)a3 activity:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD v20[4];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v8, "maxPreviews");
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 0;
  -[SHSheetActivityItemsManager activityItemValuesForActivity:](self, "activityItemValuesForActivity:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __79__SHSheetActivityItemsManager_loadItemProvidersForRequest_activity_completion___block_invoke;
  v15[3] = &unk_1E4003F58;
  v13 = v8;
  v18 = v20;
  v19 = v11;
  v16 = v13;
  v14 = v10;
  v17 = v14;
  objc_msgSend(v9, "_loadItemProvidersFromActivityItems:completion:", v12, v15);

  _Block_object_dispose(v20, 8);
}

void __79__SHSheetActivityItemsManager_loadItemProvidersForRequest_activity_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UISDActivityItemData *v10;
  uint64_t v11;
  const __CFData *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFData *v21;
  UISUISecurityContext *v22;
  NSObject *v23;
  void *v24;
  UISUISecurityContext *v25;
  void *v26;
  void *v27;
  CGImageSource *v28;
  CGImageSource *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id obj;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[16];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v32 = v3;
  __ItemsFromUIActivityItems(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "thumbnailSize");
  v7 = v6;
  v9 = v8;
  v10 = objc_alloc_init(UISDActivityItemData);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_opt_new();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v4;
  v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v38)
  {
    v37 = *(_QWORD *)v40;
    v34 = a1;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v40 != v37)
          objc_enumerationMutation(obj);
        v12 = *(const __CFData **)(*((_QWORD *)&v39 + 1) + 8 * v11);
        +[_UIActivityItemMapping _attachmentNameForActivityItem:activityType:](_UIActivityItemMapping, "_attachmentNameForActivityItem:activityType:", v12, v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          -[UISDActivityItemData addAttachmentName:forItem:](v10, "addAttachmentName:forItem:", v13, v12);
        +[_UIActivityItemMapping _subjectForActivityItem:activityType:](_UIActivityItemMapping, "_subjectForActivityItem:activityType:", v12, v5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          -[UISDActivityItemData addSubject:forItem:](v10, "addSubject:forItem:", v14, v12);
        v15 = *(_QWORD *)(a1 + 56);
        v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v17 = *(_QWORD *)(v16 + 24);
        if (v15 < 1 || v15 > v17)
        {
          *(_QWORD *)(v16 + 24) = v17 + 1;
          +[_UIActivityItemMapping _thumbnailImageDataForActivityItem:thumbnailSize:activityType:](_UIActivityItemMapping, "_thumbnailImageDataForActivityItem:thumbnailSize:activityType:", v12, v5, v7, v9);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
            -[UISDActivityItemData addPreviewImageData:forItem:](v10, "addPreviewImageData:forItem:", v18, v12);
          +[_UIActivityItemMapping _thumbnailImageForActivityItem:thumbnailSize:activityType:](_UIActivityItemMapping, "_thumbnailImageForActivityItem:thumbnailSize:activityType:", v12, v5, v7, v9);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
            -[UISDActivityItemData addPreviewImage:forItem:](v10, "addPreviewImage:forItem:", v19, v12);

        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          +[_UIActivityItemMapping _dataTypeIdentifierForActivityItem:activityType:](_UIActivityItemMapping, "_dataTypeIdentifierForActivityItem:activityType:", v12, v5);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20
            || (v28 = CGImageSourceCreateWithData(v12, 0)) != 0
            && (v29 = v28,
                CGImageSourceGetType(v28),
                v20 = (void *)objc_claimAutoreleasedReturnValue(),
                CFRelease(v29),
                v20))
          {
            -[UISDActivityItemData addDataType:forItem:](v10, "addDataType:forItem:", v20, v12);

          }
        }
        if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.UIKit.activity.AirDrop")))
        {
          +[SHSheetActivityItemUtilities urlForActivityItem:](SHSheetActivityItemUtilities, "urlForActivityItem:", v12);
          v21 = (const __CFData *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            +[UIAirDropExtensionItemDataSource _airdropSupplementalSecurityContextForURL:](UIAirDropExtensionItemDataSource, "_airdropSupplementalSecurityContextForURL:", v21);
            v22 = (UISUISecurityContext *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "addObject:", v22);
LABEL_31:

          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_33;
          v21 = v12;
          if (-[__CFData isFileURL](v21, "isFileURL"))
          {
            v21 = v21;
            +[UISUISecurityScopedResource scopedResourceWithFileURL:allowedAccess:](UISUIOpenInByCopySecurityScopedResource, "scopedResourceWithFileURL:allowedAccess:", v21, 2);
            v23 = objc_claimAutoreleasedReturnValue();
            if (v23
              || (+[UISUISecurityScopedResource scopedResourceWithFileURL:allowedAccess:](UISUIOpenInByCopySecurityScopedResource, "scopedResourceWithFileURL:allowedAccess:", v21, 1), (v23 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              -[__CFData ui_bookmarkForExportWithError:](v21, "ui_bookmarkForExportWithError:", 0);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject setBookmarkExportDataEncodedAsString:](v23, "setBookmarkExportDataEncodedAsString:", v24);

              v25 = [UISUISecurityContext alloc];
              *(_QWORD *)buf = v23;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 1);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = -[UISUISecurityContext initWithSecurityScopedResources:](v25, "initWithSecurityScopedResources:", v26);

            }
            else
            {
              share_sheet_log();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v21;
                _os_log_impl(&dword_19E419000, v23, OS_LOG_TYPE_DEFAULT, "Security Scope can't be resolved for URL:%@", buf, 0xCu);
              }
              v22 = 0;
            }

            objc_msgSend(v35, "addObject:", v22);
            +[_UIActivityItemMapping _openURLAnnotationForActivityItem:activityType:](_UIActivityItemMapping, "_openURLAnnotationForActivityItem:activityType:", v21, v5);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if (v27)
              objc_msgSend(v33, "setObject:forKeyedSubscript:", v27, v21);

            a1 = v34;
            goto LABEL_31;
          }
        }

LABEL_33:
        ++v11;
      }
      while (v38 != v11);
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      v38 = v30;
    }
    while (v30);
  }

  v31 = (void *)objc_msgSend(v35, "copy");
  -[UISDActivityItemData setSecurityContexts:](v10, "setSecurityContexts:", v31);

  -[UISDActivityItemData setOpenURLAnnotationsByURL:](v10, "setOpenURLAnnotationsByURL:", v33);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)_requestThumbnailForActivityItem:(id)a3 activity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "_wantsThumbnailItemData") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SHSheetActivityItemsManager activityViewController](self, "activityViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activityType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activityViewController:thumbnailForActivityType:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (int64_t)_requestAttachmentURLItemDataForActivityItem:(id)a3 activity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int64_t v10;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "_wantsAttachmentURLItemData") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SHSheetActivityItemsManager activityViewController](self, "activityViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activityType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v6, "activityViewController:attachmentULRTypeForActivityType:", v8, v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_requestInitialSocialTextForActivityItem:(id)a3 activity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "_wantsInitialSocialText") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SHSheetActivityItemsManager activityViewController](self, "activityViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activityType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activityViewController:initialSocialTextForActivityType:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_requestSubjectForActivityItem:(id)a3 activity:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;

  v6 = a3;
  objc_msgSend(a4, "activityType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.UIKit.activity.Mail")))
  {
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) == 0)
    {
      v9 = 0;
      goto LABEL_7;
    }
    -[SHSheetActivityItemsManager activityViewController](self, "activityViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activityViewControllerSubject:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

LABEL_7:
  return v9;
}

- (id)_requestRecipientsHandlesForActivityItem:(id)a3 activity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "activityType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.UIKit.activity.Message")) & 1) != 0)
  {
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(v7, "activityType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.UIKit.activity.Mail")) & 1) == 0)
    {

      v10 = 0;
      goto LABEL_8;
    }
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
LABEL_3:
      -[SHSheetActivityItemsManager activityViewController](self, "activityViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "activityViewControllerRecipients:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

      goto LABEL_9;
    }
  }
  v10 = 0;
LABEL_9:

  return v10;
}

- (id)_requestItemsForActivityItem:(id)a3 activity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = -[SHSheetActivityItemsManager _supportsWebpagesForActivity:](self, "_supportsWebpagesForActivity:", v7);
    -[SHSheetActivityItemsManager activityViewController](self, "activityViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activityType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activityViewController:itemsForActivityType:supportsWebpages:", v10, v11, v9);
    v12 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v12;
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SHSheetActivityItemsManager activityViewController](self, "activityViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activityType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activityViewController:itemsForActivityType:", v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v15;
  }
  else
  {
    v16 = v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[SHSheetActivityItemsManager activityViewController](self, "activityViewController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "activityType");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "activityViewController:itemForActivityType:", v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        -[SHSheetActivityItemsManager activityViewController](self, "activityViewController");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[_UIActivityItemMapping _addActivityItem:activityViewController:originalActivityItem:](_UIActivityItemMapping, "_addActivityItem:activityViewController:originalActivityItem:", v19, v20, v16);

      }
      v21 = v16;
    }
    else
    {
      -[SHSheetActivityItemsManager activityViewController](self, "activityViewController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UIActivityItemMapping _addActivityItem:activityViewController:originalActivityItem:](_UIActivityItemMapping, "_addActivityItem:activityViewController:originalActivityItem:", v16, v21, 0);
      v19 = v16;
    }

    if (v19)
    {
      v24[0] = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
      v22 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v22;
    }

  }
  return v8;
}

- (BOOL)_supportsWebpagesForActivity:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v16;
  const __CFString *v17;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36C8]), "initWithItem:typeIdentifier:", 0, 0);
    objc_msgSend(v4, "registerItemForTypeIdentifier:loadHandler:", CFSTR("public.url"), &__block_literal_global_51);
    objc_msgSend(v4, "registerItemForTypeIdentifier:loadHandler:", CFSTR("com.apple.active-webpage"), &__block_literal_global_124);
    v5 = objc_alloc_init(MEMORY[0x1E0CB35E8]);
    v19[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAttachments:", v6);

    v17 = CFSTR("extensionItems");
    v7 = v3;
    objc_msgSend(v5, "_matchingDictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "applicationExtension");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "attributes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("NSExtensionActivationRule"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(MEMORY[0x1E0CB35D8], "evaluateActivationRule:withExtensionItemsRepresentation:", v13, v10);
  }
  else
  {
    v14 = 1;
  }

  return v14;
}

void __60__SHSheetActivityItemsManager__supportsWebpagesForActivity___block_invoke(uint64_t a1, void (**a2)(_QWORD, _QWORD, _QWORD))
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0C99E98];
  v4 = a2;
  NSTemporaryDirectory();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPath:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, _QWORD))a2)[2](v4, v5, 0);

}

void __60__SHSheetActivityItemsManager__supportsWebpagesForActivity___block_invoke_2(uint64_t a1, void (**a2)(_QWORD, _QWORD, _QWORD))
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0C99E98];
  v4 = a2;
  NSTemporaryDirectory();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPath:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, _QWORD))a2)[2](v4, v5, 0);

}

- (void)enumerateBackgroundOperationsForActivity:(id)a3 enumerator:(id)a4
{
  id v6;
  void (**v7)(id, void *, id, _BYTE *);
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  uint64_t v22;
  SHSheetActivityItemsManager *v23;
  void (**v24)(id, void *, id, _BYTE *);
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  char v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, id, _BYTE *))a4;
  -[SHSheetActivityItemsManager collaborationDelegate](self, "collaborationDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "activityItemsManagerIsCollaborative:", self);

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[SHSheetActivityItemsManager activityItems](self, "activityItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v33;
    v28 = *(_QWORD *)v33;
    v29 = v10;
    do
    {
      v14 = 0;
      v30 = v12;
      do
      {
        if (*(_QWORD *)v33 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v14);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (v16 = v15) != 0)
        {
          if ((v9 & 1) != 0)
            goto LABEL_9;
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {
            if ((v9 & 1) != 0)
            {
LABEL_17:
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v15, "ui_isUnfulfilledPromiseURL"))
                goto LABEL_26;
              -[SHSheetActivityItemsManager collaborationDelegate](self, "collaborationDelegate");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v18, "activityItemsManager:collaborationSupportsPromiseURLsForActivity:", self, v6);

              if ((v19 & 1) != 0)
                goto LABEL_20;
            }
            else
            {
LABEL_21:
              if ((objc_msgSend(v6, "_activitySupportsPromiseURLs") & 1) != 0
                || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {
LABEL_26:
                v16 = 0;
                goto LABEL_27;
              }
              if (!objc_msgSend(v15, "ui_isUnfulfilledPromiseURL"))
              {
LABEL_20:
                v16 = 0;
                v12 = v30;
                goto LABEL_27;
              }
            }
            -[SHSheetActivityItemsManager activityViewController](self, "activityViewController");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "viewIfLoaded");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "window");
            v22 = v9;
            v23 = self;
            v24 = v7;
            v25 = v6;
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "windowScene");
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            v6 = v25;
            v7 = v24;
            self = v23;
            v9 = v22;
            v13 = v28;

            objc_msgSend(v15, "ui_downloadOperationForActivity:inScene:", v6, v27);
            v16 = (id)objc_claimAutoreleasedReturnValue();

            v10 = v29;
            v12 = v30;
            if (!v16)
              goto LABEL_27;
            goto LABEL_14;
          }
          -[SHSheetActivityItemsManager activityViewController](self, "activityViewController");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "activityViewControllerOperation:", v17);
          v16 = (id)objc_claimAutoreleasedReturnValue();

          v12 = v30;
          if ((v9 & 1) != 0)
          {
LABEL_9:
            if (!v16)
              goto LABEL_17;
            goto LABEL_14;
          }
        }
        if (!v16)
          goto LABEL_21;
LABEL_14:
        v31 = 0;
        v7[2](v7, v15, v16, &v31);
        if (v31)
        {

          goto LABEL_29;
        }
LABEL_27:

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v12);
  }
LABEL_29:

}

- (NSArray)activityItems
{
  return self->_activityItems;
}

- (UIActivityViewController)activityViewController
{
  return (UIActivityViewController *)objc_loadWeakRetained((id *)&self->_activityViewController);
}

- (SHSheetActivityItemsManagerDelegate)delegate
{
  return (SHSheetActivityItemsManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SHSheetActivityItemsManagerCollaborationDelegate)collaborationDelegate
{
  return (SHSheetActivityItemsManagerCollaborationDelegate *)objc_loadWeakRetained((id *)&self->_collaborationDelegate);
}

- (void)setCollaborationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_collaborationDelegate, a3);
}

- (BOOL)isContentManaged
{
  return self->_isContentManaged;
}

- (void)setLinkMetadataValues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)urlRequests
{
  return self->_urlRequests;
}

- (void)setUrlRequests:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)urlSandboxExtensions
{
  return self->_urlSandboxExtensions;
}

- (void)setUrlSandboxExtensions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (SHSheetActivityItemsResult)cacheResult
{
  return self->_cacheResult;
}

- (void)setCacheResult:(id)a3
{
  objc_storeStrong((id *)&self->_cacheResult, a3);
}

- (BOOL)linkMetadataValuesNeedsUpdate
{
  return self->_linkMetadataValuesNeedsUpdate;
}

- (void)setLinkMetadataValuesNeedsUpdate:(BOOL)a3
{
  self->_linkMetadataValuesNeedsUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheResult, 0);
  objc_storeStrong((id *)&self->_urlSandboxExtensions, 0);
  objc_storeStrong((id *)&self->_urlRequests, 0);
  objc_storeStrong((id *)&self->_linkMetadataValues, 0);
  objc_destroyWeak((id *)&self->_collaborationDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_activityViewController);
  objc_storeStrong((id *)&self->_activityItems, 0);
}

@end
