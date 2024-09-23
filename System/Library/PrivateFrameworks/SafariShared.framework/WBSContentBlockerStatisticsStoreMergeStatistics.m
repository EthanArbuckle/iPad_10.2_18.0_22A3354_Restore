@implementation WBSContentBlockerStatisticsStoreMergeStatistics

void __WBSContentBlockerStatisticsStoreMergeStatistics_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v24 = a1;
    objc_msgSend(v7, "safari_dictionaryByMappingObjectsToKeysUsingBlock:", &__block_literal_global_29);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v25 = v6;
    v11 = v6;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v27 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v16, "domain");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (!v18 || (objc_msgSend(v18, "lastSeen"), v21 = v20, objc_msgSend(v16, "lastSeen"), v21 < v22))
            objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, v17);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v13);
    }

    objc_msgSend(v10, "allValues");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v24 + 32), "setObject:forKeyedSubscript:", v23, v5);

    v6 = v25;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);
  }

}

uint64_t __WBSContentBlockerStatisticsStoreMergeStatistics_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "domain");
}

@end
