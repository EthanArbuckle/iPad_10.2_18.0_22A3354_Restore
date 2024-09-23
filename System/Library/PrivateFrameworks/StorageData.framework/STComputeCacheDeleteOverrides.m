@implementation STComputeCacheDeleteOverrides

void __STComputeCacheDeleteOverrides_block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(a3, "includeCacheDeleteKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = v6;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v7)
    {
      v8 = v7;
      v24 = v5;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      v12 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(a1[4], "objectForKey:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v9 += objc_msgSend(v15, "longLongValue");
          objc_msgSend(a1[5], "objectForKey:", v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v10 += objc_msgSend(v11, "longLongValue");
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v8);

      v5 = v24;
    }
    else
    {
      v9 = 0;
      v10 = 0;
    }

    if (v9 | v10)
    {
      if ((objc_msgSend(a1[6], "hasKey:", v5) & 1) == 0)
        STLog(1, CFSTR("Adding %@ because of CacheDeleteOverride"), v16, v17, v18, v19, v20, v21, (uint64_t)v5);
      +[STSizeVector docsAndData:purgeable:](STSizeVector, "docsAndData:purgeable:", v9, v10);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[6], "addSize:toKey:", v22, v5);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CacheDeleteOverride %@"), v5);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      STLogSizeVector(v22, v23);

    }
  }

}

@end
