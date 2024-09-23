@implementation PXCMMDiagnosticsService

- (id)title
{
  return CFSTR("Complete My Moment Diagnostics");
}

- (BOOL)canProvideConsoleDescription
{
  return 0;
}

- (BOOL)canProvideContextualViewController
{
  void *v3;
  int v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  +[PXDiagnosticsSettings sharedInstance](PXDiagnosticsSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "enableCompleteMyMomentService");

  if (!v4)
    return 0;
  -[PXDiagnosticsService itemProviders](self, "itemProviders");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "hasItemForIdentifier:", CFSTR("PXDiagnosticsItemIdentifierSharingSuggestion"), (_QWORD)v12) & 1) != 0)
        {
          v10 = 1;
          goto LABEL_13;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_13:

  return v10;
}

- (id)contextualViewController
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  PXCMMDebugSharingSuggestionViewController *v11;
  NSObject *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[PXDiagnosticsService itemProviders](self, "itemProviders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (!v4)
  {
    v6 = 0;
LABEL_14:
    PLSharingGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      -[PXDiagnosticsService itemProviders](self, "itemProviders");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = v13;
      _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "Diagnosis Error: No item providers can be used (%@)", buf, 0xCu);

    }
    v11 = 0;
    goto LABEL_17;
  }
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v16;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v16 != v7)
        objc_enumerationMutation(v3);
      v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
      if (objc_msgSend(v9, "hasItemForIdentifier:", CFSTR("PXDiagnosticsItemIdentifierSharingSuggestion")))
      {
        objc_msgSend(v9, "itemForIdentifier:", CFSTR("PXDiagnosticsItemIdentifierSharingSuggestion"));
        v10 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v10;
      }
    }
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  }
  while (v5);
  if (!v6)
    goto LABEL_14;
  v11 = -[PXCMMDebugSharingSuggestionViewController initWithSharingSuggestion:]([PXCMMDebugSharingSuggestionViewController alloc], "initWithSharingSuggestion:", v6);
  if (!v11)
    goto LABEL_14;
LABEL_17:

  return v11;
}

- (BOOL)canProvideSettingsViewController
{
  return 0;
}

- (id)settingsViewController
{
  return 0;
}

@end
