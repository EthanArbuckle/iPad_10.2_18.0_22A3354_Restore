@implementation PXDebugDictionaryDiagnosticsService

- (id)title
{
  return CFSTR("Debug Dictionary Diagnostics");
}

- (BOOL)canProvideConsoleDescription
{
  return 1;
}

- (id)consoleDescription
{
  void *v2;
  void *v3;

  -[PXDebugDictionaryDiagnosticsService _debugDictionary](self, "_debugDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
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
  v4 = objc_msgSend(v3, "enableDebugDictionaryService");

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
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "hasItemForIdentifier:", CFSTR("PXDiagnosticsItemIdentifierDebugDictionary"), (_QWORD)v12) & 1) != 0)
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
  void *v2;
  PXDebugDictionaryViewController *v3;

  -[PXDebugDictionaryDiagnosticsService _debugDictionary](self, "_debugDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[PXDebugDictionaryViewController initWithDebugDictionary:]([PXDebugDictionaryViewController alloc], "initWithDebugDictionary:", v2);

  return v3;
}

- (id)_debugDictionary
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[PXDiagnosticsService itemProviders](self, "itemProviders");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    v6 = (void *)MEMORY[0x1E0C9AA70];
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "hasItemForIdentifier:", CFSTR("PXDiagnosticsItemIdentifierDebugDictionary"), (_QWORD)v10))
        {
          objc_msgSend(v8, "itemForIdentifier:", CFSTR("PXDiagnosticsItemIdentifierDebugDictionary"));
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_12;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA70];
  }
LABEL_12:

  return v6;
}

@end
