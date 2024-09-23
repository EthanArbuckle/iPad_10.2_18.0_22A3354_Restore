@implementation PSUsageBundleManager

- (void)_loadUsageBundlesWithHandler:(id)a3
{
  uint64_t (**v4)(id, void *);
  NSMutableArray *storageReporters;
  NSMutableArray *v6;
  NSMutableArray *v7;
  NSDictionary *v8;
  __int128 v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  char v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  int v34;
  NSObject *v35;
  NSDictionary *bundleMap;
  NSDictionary *v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  id v42;
  uint64_t v43;
  PSUsageBundleManager *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  id obj;
  void *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  id v67;
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v4 = (uint64_t (**)(id, void *))a3;
  v44 = self;
  storageReporters = self->_storageReporters;
  if (!storageReporters)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_storageReporters;
    self->_storageReporters = v6;

    storageReporters = self->_storageReporters;
  }
  -[NSMutableArray removeAllObjects](storageReporters, "removeAllObjects");
  v8 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v41 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v40 = objc_msgSend(&unk_1E4A92DF0, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
  v10 = 0;
  if (v40)
  {
    v39 = *(_QWORD *)v61;
    *(_QWORD *)&v9 = 138412546;
    v38 = v9;
LABEL_5:
    v11 = 0;
    v12 = v10;
    while (1)
    {
      if (*(_QWORD *)v61 != v39)
        objc_enumerationMutation(&unk_1E4A92DF0);
      v43 = v11;
      v13 = *(id *)(*((_QWORD *)&v60 + 1) + 8 * v11);
      SFRuntimeAbsoluteFilePathForPath();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringByAppendingPathComponent:", CFSTR("UsageBundles"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v55 = v12;
      objc_msgSend(v41, "contentsOfDirectoryAtPath:error:", v15, &v55);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v55;

      obj = v16;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
      if (v17)
      {
        v18 = v17;
        v42 = v10;
        v19 = *(_QWORD *)v57;
        v45 = v15;
        v46 = *(_QWORD *)v57;
        do
        {
          v20 = 0;
          v47 = v18;
          do
          {
            if (*(_QWORD *)v57 != v19)
              objc_enumerationMutation(obj);
            objc_msgSend(v15, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * v20), v38);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            _PSLoggingFacility();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v65 = v21;
              _os_log_impl(&dword_1A3819000, v22, OS_LOG_TYPE_DEFAULT, "Loading usage bundle %@", buf, 0xCu);
            }

            objc_msgSend(v21, "pathExtension");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("bundle"));

            if ((v24 & 1) != 0)
            {
              v50 = v21;
              v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB34D0]), "initWithPath:", v21);
              v25 = objc_alloc_init((Class)objc_msgSend(v49, "principalClass"));
              objc_msgSend(v25, "usageBundleApps");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v26, "count"))
                -[NSMutableArray addObject:](v44->_storageReporters, "addObject:", v25);
              v53 = 0u;
              v54 = 0u;
              v51 = 0u;
              v52 = 0u;
              v27 = v26;
              v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v51, v68, 16);
              if (v28)
              {
                v29 = v28;
                v30 = *(_QWORD *)v52;
                while (2)
                {
                  for (i = 0; i != v29; ++i)
                  {
                    if (*(_QWORD *)v52 != v30)
                      objc_enumerationMutation(v27);
                    v32 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
                    objc_msgSend(v32, "setUsageBundleStorageReporter:", v25);
                    objc_msgSend(v32, "bundleIdentifier");
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSDictionary setValue:forKey:](v8, "setValue:forKey:", v32, v33);

                    if (v4 && (v4[2](v4, v32) & 1) == 0)
                    {

                      v34 = 0;
                      v8 = 0;
                      goto LABEL_30;
                    }
                  }
                  v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v51, v68, 16);
                  if (v29)
                    continue;
                  break;
                }
                v34 = 1;
LABEL_30:
                v15 = v45;
              }
              else
              {
                v34 = 1;
              }

              if (!v34)
                goto LABEL_37;
              v19 = v46;
              v18 = v47;
            }
            else
            {

            }
            ++v20;
          }
          while (v20 != v18);
          v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
        }
        while (v18);
        v34 = 1;
LABEL_37:
        v10 = v42;
      }
      else
      {
        v34 = 1;
      }

      if (v10)
      {
        _PSLoggingFacility();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v38;
          v65 = v15;
          v66 = 2112;
          v67 = v10;
          _os_log_impl(&dword_1A3819000, v35, OS_LOG_TYPE_DEFAULT, "Error loading usage bundles from %@: %@", buf, 0x16u);
        }

      }
      if (!v34)
        break;
      v11 = v43 + 1;
      v12 = v10;
      if (v43 + 1 == v40)
      {
        v40 = objc_msgSend(&unk_1E4A92DF0, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
        if (v40)
          goto LABEL_5;
        break;
      }
    }
  }
  bundleMap = v44->_bundleMap;
  v44->_bundleMap = v8;
  v37 = v8;

}

- (id)allUsageBundleApps
{
  NSDictionary *bundleMap;

  bundleMap = self->_bundleMap;
  if (!bundleMap)
  {
    -[PSUsageBundleManager _loadUsageBundlesWithHandler:](self, "_loadUsageBundlesWithHandler:", 0);
    bundleMap = self->_bundleMap;
  }
  return -[NSDictionary allValues](bundleMap, "allValues");
}

- (void)vendUsageBundleAppsWithHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  NSDictionary *bundleMap;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  bundleMap = self->_bundleMap;
  if (bundleMap)
  {
    if (v4)
    {
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      -[NSDictionary allValues](bundleMap, "allValues", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v12;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v12 != v9)
              objc_enumerationMutation(v6);
            v4[2](v4, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
          }
          while (v8 != v10);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        }
        while (v8);
      }

    }
  }
  else
  {
    -[PSUsageBundleManager _loadUsageBundlesWithHandler:](self, "_loadUsageBundlesWithHandler:", v4);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageReporters, 0);
  objc_storeStrong((id *)&self->_usageBundleApps, 0);
  objc_storeStrong((id *)&self->_bundleMap, 0);
}

@end
