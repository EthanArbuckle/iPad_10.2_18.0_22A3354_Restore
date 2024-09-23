@implementation STMutableStatusBarOverridesStatusDomainData(ArchiveRecordApplying)

- (void)_sbApplySystemStatusStatusBarOverridesArchiveRecord:()ArchiveRecordApplying
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "statusBarData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(MEMORY[0x1E0DB0970], "entryKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v5, "entryForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "setEntry:forKey:", v12, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v8);
  }
  while (1)
  {

    objc_msgSend(a1, "suppressedBackgroundActivityIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (!v15)
      break;
    objc_msgSend(a1, "suppressedBackgroundActivityIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "anyObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "stopSuppressingBackgroundActivityWithIdentifier:", v13);

  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v4, "suppressedBackgroundActivityIdentifiers", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(a1, "suppressBackgroundActivityWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j));
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v18);
  }

}

@end
