@implementation STComputeFSOverrides

void __STComputeFSOverrides_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  STMSizeCacheEntry *v12;
  STMSizeCacheEntry *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(a3, "includeFsPaths");
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v34 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "itemForPath:", v10);
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = (STMSizeCacheEntry *)v11;
          objc_msgSend(*(id *)(a1 + 32), "updateSizeOfItem:synchronous:", v11, 1);
        }
        else
        {
          v13 = [STMSizeCacheEntry alloc];
          objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = -[STMSizeCacheEntry initWithURL:](v13, "initWithURL:", v14);

          objc_msgSend(*(id *)(a1 + 32), "addItem:andComputeSizeSynchronously:", v12, 1);
        }
        -[STMSizeCacheEntry itemSize](v12, "itemSize");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          if ((objc_msgSend(*(id *)(a1 + 40), "hasKey:", v5) & 1) == 0)
            STLog(1, CFSTR("Adding %@ because of FSOverride"), v22, v23, v24, v25, v26, v27, (uint64_t)v5);
          v28 = *(void **)(a1 + 40);
          +[STSizeVector docsAndData:](STSizeVector, "docsAndData:", objc_msgSend(v21, "longLongValue"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addSize:toKey:", v29, v5);

          v30 = objc_msgSend(v21, "longLongValue");
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("FSOverride: %@ in %@"), v5, v10);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          STLogSize(v30, v31);

        }
        else
        {
          STLog(2, CFSTR("No size for app %@ in %@"), v15, v16, v17, v18, v19, v20, (uint64_t)v5);
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v7);
  }

}

@end
