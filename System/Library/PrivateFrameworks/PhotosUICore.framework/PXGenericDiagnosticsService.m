@implementation PXGenericDiagnosticsService

- (id)title
{
  return CFSTR("Generic Diagnostics");
}

- (BOOL)canProvideConsoleDescription
{
  void *v2;
  char v3;

  +[PXDiagnosticsSettings sharedInstance](PXDiagnosticsSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "enableGenericService");

  return v3;
}

- (id)consoleDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  id obj;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[PXDiagnosticsService itemProviders](self, "itemProviders");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v16)
  {
    v15 = *(_QWORD *)v23;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(obj);
        v17 = v4;
        v5 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v4);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        objc_msgSend(v5, "registeredIdentifiers");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v19;
          do
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v19 != v9)
                objc_enumerationMutation(v6);
              v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
              objc_msgSend(v5, "itemForIdentifier:", v11);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v3, "length"))
                objc_msgSend(v3, "appendString:", CFSTR("\n"));
              objc_msgSend(v3, "appendFormat:", CFSTR("%@: %@\n"), v11, v12);

            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v8);
        }

        v4 = v17 + 1;
      }
      while (v17 + 1 != v16);
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v16);
  }

  return v3;
}

- (BOOL)canProvideContextualViewController
{
  void *v2;
  char v3;

  +[PXDiagnosticsSettings sharedInstance](PXDiagnosticsSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "enableGenericService");

  return v3;
}

- (BOOL)canProvideSettingsViewController
{
  return 1;
}

@end
