@implementation STUsageBundleRegistry

- (STUsageBundleRegistry)init
{
  STUsageBundleRegistry *v2;
  STUsageBundleRegistry *v3;
  uint64_t v4;
  NSDictionary *reporters;
  uint64_t v6;
  NSDictionary *usageApps;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)STUsageBundleRegistry;
  v2 = -[STUsageBundleRegistry init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    -[STUsageBundleRegistry loadReporters](v2, "loadReporters");
    v4 = objc_claimAutoreleasedReturnValue();
    reporters = v3->_reporters;
    v3->_reporters = (NSDictionary *)v4;

    -[STUsageBundleRegistry loadBundlesForReporters:](v3, "loadBundlesForReporters:", v3->_reporters);
    v6 = objc_claimAutoreleasedReturnValue();
    usageApps = v3->_usageApps;
    v3->_usageApps = (NSDictionary *)v6;

  }
  return v3;
}

- (id)loadReporters
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  objc_class *v23;
  id v24;
  id v25;
  unint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v42 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", CFSTR("/System/Library/UsageBundles"), 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (STStorageIsInternalInstall())
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/AppleInternal/Library/UsageBundles"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v4, 0, 6, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/System/Cryptexes/App/System/Library/UsageBundles"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v2;
  objc_msgSend(v2, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v7, 0, 6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
  v45 = (id)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v47;
    v14 = 0x24C75E000uLL;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v47 != v13)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v16, "pathExtension");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("bundle"));

        if (v18)
        {
          objc_msgSend(v16, "lastPathComponent");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v14 + 3704), "overridesFor:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "ignore");

          if ((v21 & 1) == 0)
          {
            objc_msgSend(MEMORY[0x24BDD1488], "bundleWithURL:", v16);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = (objc_class *)objc_msgSend(v22, "principalClass");
            if (-[objc_class conformsToProtocol:](v23, "conformsToProtocol:", &unk_2549C8B20))
            {
              v24 = objc_alloc_init(v23);
              if (v24)
              {
                objc_msgSend(v16, "lastPathComponent");
                v25 = v10;
                v26 = v14;
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                STLog(1, CFSTR("Listing app bundle reporter for %@"), v28, v29, v30, v31, v32, v33, (uint64_t)v27);

                v14 = v26;
                v10 = v25;
                objc_msgSend(v45, "setObject:forKey:", v24, v16);
              }

            }
          }

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    }
    while (v12);
  }

  v34 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  STLog(1, CFSTR("%0.3f secs: load usage reporters"), v35, v36, v37, v38, v39, v40, COERCE__INT64((double)(v34 - v42) / 1000000000.0));

  return v45;
}

- (id)loadBundlesForReporters:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  double v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __uint64_t v46;
  void *v47;
  id obj;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  void *v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v46 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  +[STAppOverrides overrides](STAppOverrides, "overrides");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  objc_msgSend(v4, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v64;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v64 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "usageBundleOverride");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, v14);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
    }
    while (v9);
  }
  v47 = v4;

  objc_msgSend(v50, "allKeys");
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
  if (v51)
  {
    v49 = *(_QWORD *)v60;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v60 != v49)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v15);
        objc_msgSend(v16, "lastPathComponent");
        v17 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "objectForKey:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[STUsageBundleOverrides overridesFor:](STUsageBundleOverrides, "overridesFor:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "replaceWithZeroSizeApp");
        v20 = objc_claimAutoreleasedReturnValue();

        v53 = (void *)v17;
        v54 = v15;
        v52 = (void *)v20;
        if (v20)
        {
          LODWORD(v21) = 0;
          objc_msgSend(MEMORY[0x24BE75628], "usageBundleAppForBundleWithIdentifier:withTotalSize:", v20, v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = v22;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v68, 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(v18, "usageBundleApps");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        v24 = v23;
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v56;
          do
          {
            for (j = 0; j != v26; ++j)
            {
              if (*(_QWORD *)v56 != v27)
                objc_enumerationMutation(v24);
              v29 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * j);
              objc_msgSend(v29, "setUsageBundleStorageReporter:", v18);
              objc_msgSend(v29, "bundleIdentifier");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "objectForKeyedSubscript:", v30);
              v31 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v31)
              {
                objc_msgSend(v29, "bundleIdentifier");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
              }
              STLog(1, CFSTR("Listing app bundle : %@"), v32, v33, v34, v35, v36, v37, (uint64_t)v31);
              objc_msgSend(v5, "setObject:forKey:", v29, v31);

            }
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
          }
          while (v26);
        }

        v15 = v54 + 1;
      }
      while (v54 + 1 != v51);
      v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
    }
    while (v51);
  }
  v38 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  STLog(1, CFSTR("%0.3f secs: load usage bundles"), v39, v40, v41, v42, v43, v44, COERCE__INT64((double)(v38 - v46) / 1000000000.0));

  return v5;
}

- (id)usageBundleForIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("com.apple.")))
  {
    -[NSDictionary objectForKey:](self->_usageApps, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)allAppsWithUsageBundles
{
  return -[NSDictionary allKeys](self->_usageApps, "allKeys");
}

- (NSDictionary)reporters
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setReporters:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSDictionary)usageApps
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUsageApps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageApps, 0);
  objc_storeStrong((id *)&self->_reporters, 0);
}

@end
