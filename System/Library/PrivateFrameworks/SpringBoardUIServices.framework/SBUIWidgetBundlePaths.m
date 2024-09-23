@implementation SBUIWidgetBundlePaths

void ___SBUIWidgetBundlePaths_block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t i;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t m;
  void *v29;
  void *v30;
  void *v31;
  id obj;
  id v33;
  id v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1A85A133C]();
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 1);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
  if (v1)
  {
    v2 = v1;
    v33 = *(id *)v49;
    do
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(id *)v49 != v33)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        if (objc_msgSend(v4, "length"))
        {
          objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("WeeAppPlugins"));
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "stringByAppendingPathComponent:", v5);
          v6 = (void *)objc_claimAutoreleasedReturnValue();

          v46 = 0u;
          v47 = 0u;
          v44 = 0u;
          v45 = 0u;
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "contentsOfDirectoryAtPath:error:", v6, 0);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
          if (v9)
          {
            v10 = v9;
            v11 = *(_QWORD *)v45;
            do
            {
              for (j = 0; j != v10; ++j)
              {
                if (*(_QWORD *)v45 != v11)
                  objc_enumerationMutation(v8);
                v13 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
                if (objc_msgSend(v13, "length"))
                {
                  objc_msgSend(v6, "stringByAppendingPathComponent:", v13);
                  v14 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v0, "addObject:", v14);

                }
              }
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
            }
            while (v10);
          }

        }
      }
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
    }
    while (v2);
  }
  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 2uLL, 1);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v34 = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v41;
    do
    {
      for (k = 0; k != v16; ++k)
      {
        if (*(_QWORD *)v41 != v17)
          objc_enumerationMutation(v34);
        v19 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * k);
        if (objc_msgSend(v19, "length"))
        {
          objc_msgSend(v19, "stringByAppendingPathComponent:", CFSTR("WeeAppPlugins"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(CFSTR("/AppleInternal"), "stringByAppendingPathComponent:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "stringByAppendingPathComponent:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v38 = 0u;
          v39 = 0u;
          v36 = 0u;
          v37 = 0u;
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "contentsOfDirectoryAtPath:error:", v22, 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v36, v52, 16);
          if (v25)
          {
            v26 = v25;
            v27 = *(_QWORD *)v37;
            do
            {
              for (m = 0; m != v26; ++m)
              {
                if (*(_QWORD *)v37 != v27)
                  objc_enumerationMutation(v24);
                v29 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * m);
                if (objc_msgSend(v29, "length"))
                {
                  objc_msgSend(v22, "stringByAppendingPathComponent:", v29);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v0, "addObject:", v30);

                }
              }
              v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v36, v52, 16);
            }
            while (v26);
          }

        }
      }
      v16 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
    }
    while (v16);
  }
  v31 = (void *)_SBUIWidgetBundlePaths___widgetBundlePaths;
  _SBUIWidgetBundlePaths___widgetBundlePaths = (uint64_t)v0;

}

@end
