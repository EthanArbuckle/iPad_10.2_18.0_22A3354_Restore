@implementation XBVolumeMaintainer

+ (void)configure:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__XBVolumeMaintainer_configure___block_invoke;
  block[3] = &unk_24D7F4328;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

void __32__XBVolumeMaintainer_configure___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  _QWORD handler[4];
  id v4;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x24BDAC6B8], 1);
  xpc_dictionary_set_string(v2, (const char *)*MEMORY[0x24BDAC698], (const char *)*MEMORY[0x24BDAC6A0]);
  xpc_dictionary_set_int64(v2, (const char *)*MEMORY[0x24BDAC5F0], *MEMORY[0x24BDAC600]);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __32__XBVolumeMaintainer_configure___block_invoke_2;
  handler[3] = &unk_24D7F48C0;
  v4 = *(id *)(a1 + 32);
  xpc_activity_register("com.apple.SplashBoard", v2, handler);

}

void __32__XBVolumeMaintainer_configure___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  const __CFString *v21;
  XBApplicationSnapshotManifest *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  const __CFString *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateByAddingTimeInterval:", -259200.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v3;
  __32__XBVolumeMaintainer_configure___block_invoke_3((uint64_t)v27, v3, v27);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "recentlyUsedBundleIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  if (v6 >= 0xA)
    v7 = 10;
  else
    v7 = v6;
  v25 = v5;
  objc_msgSend(v5, "subarrayWithRange:", 0, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v24 = (void *)v8;
  objc_msgSend(v9, "addObjectsFromArray:", v8);
  v26 = (void *)v4;
  objc_msgSend(v9, "addObjectsFromArray:", v4);
  objc_msgSend(*(id *)(a1 + 32), "allInstalledApplications");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v9;
  objc_msgSend(v9, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v30 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v17, "bundleIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v11, "containsObject:", v18);
        XBLogPurge();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v21 = CFSTR("uncommon");
          if ((_DWORD)v19)
            v21 = CFSTR("recent");
          v34 = v18;
          v35 = 2114;
          v36 = v21;
          _os_log_impl(&dword_217702000, v20, OS_LOG_TYPE_DEFAULT, "Marking %{public}@ as %{public}@", buf, 0x16u);
        }

        v22 = -[XBApplicationSnapshotManifest initWithApplicationInfo:]([XBApplicationSnapshotManifest alloc], "initWithApplicationInfo:", v17);
        -[XBApplicationSnapshotManifest updateSnapshotsAPFSPurgability:](v22, "updateSnapshotsAPFSPurgability:", v19);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v14);
  }

}

id __32__XBVolumeMaintainer_configure___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  void *context;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  id v52;
  uint8_t v53[128];
  uint8_t buf[4];
  id v55;
  void *v56;
  void *v57;
  _QWORD v58[4];

  v58[2] = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  v42 = MEMORY[0x219A10C5C]();
  v6 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
  v7 = (void *)MEMORY[0x24BDD14C0];
  v8 = (void *)MEMORY[0x24BE1B0F8];
  objc_msgSend(MEMORY[0x24BE1B020], "extensionHostIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateForObjectsWithMetadataKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "notPredicateWithSubpredicate:", v10);
  v11 = objc_claimAutoreleasedReturnValue();

  v43 = v5;
  v44 = v4;
  objc_msgSend(MEMORY[0x24BE1B0F8], "predicateForEventsWithStartInDateRangeFrom:to:", v4, v5);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BDD14C0];
  v40 = (void *)v12;
  v41 = (void *)v11;
  v58[0] = v12;
  v58[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v58, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "andPredicateWithSubpredicates:", v14);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = 0;
  while (1)
  {
    v17 = (void *)MEMORY[0x219A10C5C]();
    v18 = (void *)MEMORY[0x24BE1B088];
    objc_msgSend(MEMORY[0x24BE1B130], "appUsageStream");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v57, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v45;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v56, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v46, v20, v16, 32, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE1B0B0], "knowledgeStore");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 0;
    objc_msgSend(v23, "executeQuery:error:", v22, &v52);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v52;

    if (v25)
      break;
    context = v17;
    v26 = objc_msgSend(v24, "count");
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v15 = v24;
    v27 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v49;
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v49 != v29)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * v30), "stringValue");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (v31)
            objc_msgSend(v6, "addObject:", v31);

          ++v30;
        }
        while (v28 != v30);
        v28 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
      }
      while (v28);
    }
    v16 += v26;

    objc_autoreleasePoolPop(context);
    if (objc_msgSend(v15, "count") != 32)
    {
      objc_msgSend(v6, "array");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v43;
      v33 = v44;
      v36 = v41;
      v35 = (void *)v42;
      v37 = v40;
      goto LABEL_17;
    }
  }
  XBLogPurge();
  v38 = objc_claimAutoreleasedReturnValue();
  v37 = v40;
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v55 = v25;
    _os_log_impl(&dword_217702000, v38, OS_LOG_TYPE_DEFAULT, "Failed to obtain recently used applications with error: %{public}@", buf, 0xCu);
  }

  objc_autoreleasePoolPop(v17);
  v32 = (void *)MEMORY[0x24BDBD1A8];
  v34 = v43;
  v33 = v44;
  v36 = v41;
  v35 = (void *)v42;
LABEL_17:

  objc_autoreleasePoolPop(v35);
  return v32;
}

@end
