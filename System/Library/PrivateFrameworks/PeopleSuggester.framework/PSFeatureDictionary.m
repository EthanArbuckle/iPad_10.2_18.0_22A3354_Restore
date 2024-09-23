@implementation PSFeatureDictionary

void __44___PSFeatureDictionary__removeObjectForKey___block_invoke(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;
  void *v9;
  id v10;

  v10 = a2;
  v8 = a3;
  objc_msgSend(v8, "objectForKeyedSubscript:", a1[4]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, a1[4]);
    if (!objc_msgSend(v8, "count"))
      objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a2);
    --*(_QWORD *)(a1[5] + 24);
    *a4 = 1;
  }

}

void __44___PSFeatureDictionary_mutableCopyWithZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a2;
  v7 = (id)objc_msgSend(a3, "mutableCopy");
  -[_PSFeatureDictionary _timeBucketsCreateIfNeeded](*(_QWORD **)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, v5);

}

void __59___PSFeatureDictionary_addEntriesFromDictionary_overwrite___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v18 = v5;
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          if (!*(_BYTE *)(a1 + 40))
          {
            objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15)
              continue;
          }
          ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
          objc_msgSend(v8, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v10);
    }

    v5 = v18;
  }
  else
  {
    v16 = (void *)objc_msgSend(v6, "mutableCopy");
    -[_PSFeatureDictionary _timeBucketsCreateIfNeeded](*(_QWORD **)(a1 + 32));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v5);

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) += objc_msgSend(v6, "count");
  }

}

@end
