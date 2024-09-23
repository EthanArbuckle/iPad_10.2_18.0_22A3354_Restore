@implementation WBSSearchProviderShortNameForProviderIdentifier

void __WBSSearchProviderShortNameForProviderIdentifier_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  WBSSearchProviderDefinitions();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v12 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SearchEngineIdentifier"), (_QWORD)v11);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ShortName"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v0, "setObject:forKeyedSubscript:", v8, v7);

      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v3);
  }

  v9 = objc_msgSend(v0, "copy");
  v10 = (void *)WBSSearchProviderShortNameForProviderIdentifier_identifiersToShortNames;
  WBSSearchProviderShortNameForProviderIdentifier_identifiersToShortNames = v9;

}

@end
