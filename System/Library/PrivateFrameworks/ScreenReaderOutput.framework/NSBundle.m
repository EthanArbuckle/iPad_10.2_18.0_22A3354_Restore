@implementation NSBundle

void __50__NSBundle_SCROBundleExtras__brailleDriverBundles__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  const __CFString *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("/System/Library/ScreenReader"), "stringByAppendingPathComponent:", CFSTR("BrailleDrivers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  v34 = v2;
  objc_msgSend(v2, "reverseObjectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v4;
  objc_msgSend(v4, "nextObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    v8 = CFSTR("brailledriver");
    do
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 0;
      objc_msgSend(v9, "contentsOfDirectoryAtPath:error:", v7, &v44);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v44;

      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v11 = v10;
      v39 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      if (v39)
      {
        v12 = *(_QWORD *)v41;
        v38 = *(_QWORD *)v41;
        do
        {
          for (i = 0; i != v39; ++i)
          {
            if (*(_QWORD *)v41 != v12)
              objc_enumerationMutation(v11);
            v14 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
            objc_msgSend(v14, "pathExtension");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isEqualToString:", v8);

            if (v16)
            {
              v17 = *(void **)(a1 + 32);
              objc_msgSend(v7, "stringByAppendingPathComponent:", v14);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "bundleWithPath:", v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v19, "bundleIdentifier");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v20, "length"))
              {
                objc_msgSend(v5, "objectForKey:", v20);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = v21;
                if (v21)
                {
                  objc_msgSend(v21, "bundlePath");
                  v23 = v11;
                  v24 = v8;
                  v25 = v7;
                  v26 = a1;
                  v27 = v5;
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  NSLog(CFSTR("Duplicate Braille driver.  Using: %@"), v28);

                  v5 = v27;
                  a1 = v26;
                  v7 = v25;
                  v8 = v24;
                  v11 = v23;
                  v12 = v38;
                }
                else
                {
                  objc_msgSend(v5, "setObject:forKey:", v19, v20);
                  objc_msgSend(v37, "addObject:", v19);
                }

              }
            }
          }
          v39 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
        }
        while (v39);
      }

      objc_msgSend(v35, "nextObject");
      v29 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v29;
    }
    while (v29);
  }
  v30 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithDictionary:", v5);
  v31 = (void *)_DriverBundleDictionary;
  _DriverBundleDictionary = v30;

  v32 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:", v37);
  v33 = (void *)_DriverBundleArray;
  _DriverBundleArray = v32;

}

void __50__NSBundle_SCROBundleExtras___brailleTableBundles__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  const __CFString *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  id v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("/System/Library/ScreenReader"), "stringByAppendingPathComponent:", CFSTR("BrailleTables"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  v32 = v2;
  objc_msgSend(v2, "reverseObjectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v35 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v33 = v4;
  objc_msgSend(v4, "nextObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    v8 = CFSTR("brailletable");
    do
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 0;
      objc_msgSend(v9, "contentsOfDirectoryAtPath:error:", v7, &v42);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v42;

      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v11 = v10;
      v37 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      if (v37)
      {
        v12 = *(_QWORD *)v39;
        v36 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v37; ++i)
          {
            if (*(_QWORD *)v39 != v12)
              objc_enumerationMutation(v11);
            v14 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
            objc_msgSend(v14, "pathExtension");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isEqualToString:", v8);

            if (v16)
            {
              v17 = *(void **)(a1 + 32);
              objc_msgSend(v7, "stringByAppendingPathComponent:", v14);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "bundleWithPath:", v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v19, "bundleIdentifier");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v20, "length"))
              {
                objc_msgSend(v5, "objectForKey:", v20);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = v21;
                if (v21)
                {
                  objc_msgSend(v21, "bundlePath");
                  v23 = v11;
                  v24 = v8;
                  v25 = v7;
                  v26 = v5;
                  v27 = a1;
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  NSLog(CFSTR("Duplicate Braille table. Using: %@"), v28);

                  a1 = v27;
                  v5 = v26;
                  v7 = v25;
                  v8 = v24;
                  v11 = v23;
                  v12 = v36;
                }
                else
                {
                  objc_msgSend(v5, "setObject:forKey:", v19, v20);
                  objc_msgSend(v35, "addObject:", v19);
                }

              }
            }
          }
          v37 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
        }
        while (v37);
      }

      objc_msgSend(v33, "nextObject");
      v29 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v29;
    }
    while (v29);
  }
  v30 = objc_msgSend(v35, "copy");
  v31 = (void *)_TableBundleArray;
  _TableBundleArray = v30;

}

@end
