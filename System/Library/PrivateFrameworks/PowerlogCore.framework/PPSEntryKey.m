@implementation PPSEntryKey

uint64_t __38__PPSEntryKey_allBaseKeysForEntryKey___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (BOOL)PPSEnabled:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_sync_enter(CFSTR("++entryKeyObjectsSync++"));
  objc_msgSend((id)_metricsByEntryKey, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(CFSTR("++entryKeyObjectsSync++"));
  return v4 != 0;
}

+ (id)categoryForEntryKey:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[PPSEntryKey anyMetricsForEntryKey:](PPSEntryKey, "anyMetricsForEntryKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "category");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)subsystemForEntryKey:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[PPSEntryKey anyMetricsForEntryKey:](PPSEntryKey, "anyMetricsForEntryKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "subsystem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)anyMetricsForEntryKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;

  v3 = a3;
  objc_sync_enter(CFSTR("++entryKeyObjectsSync++"));
  objc_msgSend((id)_metricsByEntryKey, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend((id)_metricsByEntryKey, "objectForKeyedSubscript:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v5, "mutableCopy");

    objc_msgSend(v4, "objectForKey:", CFSTR("__PPSDynamic__"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = CFSTR("__PPSDynamic__");
LABEL_6:
      objc_msgSend(v4, "objectForKeyedSubscript:", v7);
      v9 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v9;
      goto LABEL_7;
    }
    objc_msgSend(v4, "objectForKey:", CFSTR("__PPSArray__"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v7 = CFSTR("__PPSArray__");
      goto LABEL_6;
    }
  }
LABEL_7:
  objc_sync_exit(CFSTR("++entryKeyObjectsSync++"));

  return v4;
}

+ (id)allBaseKeysForEntryKey:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "baseMetricsForEntryKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_22_0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)baseMetricsForEntryKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_sync_enter(CFSTR("++entryKeyObjectsSync++"));
  objc_msgSend((id)_metricsByEntryKey, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend((id)_metricsByEntryKey, "objectForKeyedSubscript:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v5, "mutableCopy");

    objc_msgSend(v4, "removeObjectForKey:", CFSTR("__PPSDynamic__"));
    objc_msgSend(v4, "removeObjectForKey:", CFSTR("__PPSArray__"));
  }
  objc_sync_exit(CFSTR("++entryKeyObjectsSync++"));

  return v4;
}

+ (BOOL)hasDynamicKeys:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  if (v3)
  {
    objc_sync_enter(CFSTR("++entryKeyObjectsSync++"));
    objc_msgSend((id)_metricsByEntryKey, "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("__PPSDynamic__"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

    objc_sync_exit(CFSTR("++entryKeyObjectsSync++"));
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)hasArrayKeys:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  if (v3)
  {
    objc_sync_enter(CFSTR("++entryKeyObjectsSync++"));
    objc_msgSend((id)_metricsByEntryKey, "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("__PPSArray__"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

    objc_sync_exit(CFSTR("++entryKeyObjectsSync++"));
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)filterEntryLoggingForEntryKey:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  +[PPSEntryKey baseMetricsForEntryKey:](PPSEntryKey, "baseMetricsForEntryKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    objc_msgSend(v3, "allValues", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v5);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "filterEntryLogging") & 1) != 0)
          {
            LOBYTE(v6) = 1;
            goto LABEL_12;
          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

+ (id)entryKeyForMetric:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (v3)
  {
    +[PPSEntryKey entrySelectorForMetric:](PPSEntryKey, "entrySelectorForMetric:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(CFSTR("++entryKeyObjectsSync++"));
    objc_msgSend((id)_entryKeyByMetadata, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(CFSTR("++entryKeyObjectsSync++"));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)entrySelectorForMetric:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __38__PPSEntryKey_entrySelectorForMetric___block_invoke;
  v10[3] = &unk_1E6A525B0;
  v11 = v3;
  v5 = v4;
  v12 = v5;
  v6 = v3;
  objc_msgSend(&unk_1E6AF5E58, "enumerateObjectsUsingBlock:", v10);
  v7 = v12;
  v8 = v5;

  return v8;
}

void __38__PPSEntryKey_entrySelectorForMetric___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

+ (int)storageForEntryKey:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;

  +[PPSEntryKey anyMetricsForEntryKey:](PPSEntryKey, "anyMetricsForEntryKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "storage");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (void)setupEntryKeyForMetric:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  v5 = v4;
  if (setupEntryKeyForMetric__onceToken == -1)
  {
    if (!v4)
      goto LABEL_12;
  }
  else
  {
    v16 = v4;
    dispatch_once(&setupEntryKeyForMetric__onceToken, &__block_literal_global_6);
    v5 = v16;
    if (!v16)
      goto LABEL_12;
  }
  v15 = v5;
  v6 = +[PPSCoreUtilities shouldSetupMetric:](PPSCoreUtilities, "shouldSetupMetric:");
  v5 = v15;
  if (v6)
  {
    +[PPSEntryKey entrySelectorForMetric:](PPSEntryKey, "entrySelectorForMetric:", v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(CFSTR("++entryKeyObjectsSync++"));
    objc_msgSend((id)_entryKeyByMetadata, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      +[PPSEntryKey entryKeyFromSelector:](PPSEntryKey, "entryKeyFromSelector:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)_entryKeyByMetadata, "setObject:forKeyedSubscript:", v9, v7);

    }
    objc_msgSend((id)_entryKeyByMetadata, "objectForKeyedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)_metricsByEntryKey, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v12 = (void *)objc_opt_new();
      objc_msgSend((id)_metricsByEntryKey, "setObject:forKeyedSubscript:", v12, v10);

    }
    if (objc_msgSend(v15, "auxiliaryType") == 1)
    {
      objc_msgSend((id)_metricsByEntryKey, "objectForKeyedSubscript:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, v14);

    }
    else
    {
      objc_msgSend(a1, "addAuxiliaryType:withEntryKey:", v15, v10);
    }

    objc_sync_exit(CFSTR("++entryKeyObjectsSync++"));
    v5 = v15;
  }
LABEL_12:

}

uint64_t __38__PPSEntryKey_setupEntryKeyForMetric___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_sync_enter(CFSTR("++entryKeyObjectsSync++"));
  v0 = objc_opt_new();
  v1 = (void *)_entryKeyByMetadata;
  _entryKeyByMetadata = v0;

  v2 = objc_opt_new();
  v3 = (void *)_metricsByEntryKey;
  _metricsByEntryKey = v2;

  return objc_sync_exit(CFSTR("++entryKeyObjectsSync++"));
}

+ (void)addAuxiliaryType:(id)a3 withEntryKey:(id)a4
{
  id v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v5 = a4;
  v6 = objc_msgSend(v20, "auxiliaryType");
  if (v6 == 3)
  {
    objc_msgSend((id)_metricsByEntryKey, "objectForKeyedSubscript:", v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("__PPSArray__"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      v16 = (void *)objc_opt_new();
      objc_msgSend((id)_metricsByEntryKey, "objectForKeyedSubscript:", v5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, CFSTR("__PPSArray__"));

    }
    objc_msgSend((id)_metricsByEntryKey, "objectForKeyedSubscript:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = CFSTR("__PPSArray__");
    goto LABEL_9;
  }
  if (v6 == 2)
  {
    objc_msgSend((id)_metricsByEntryKey, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("__PPSDynamic__"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = (void *)objc_opt_new();
      objc_msgSend((id)_metricsByEntryKey, "objectForKeyedSubscript:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("__PPSDynamic__"));

    }
    objc_msgSend((id)_metricsByEntryKey, "objectForKeyedSubscript:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = CFSTR("__PPSDynamic__");
LABEL_9:
    objc_msgSend(v11, "objectForKeyedSubscript:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, v19);

  }
}

+ (id)allEntryKeys
{
  void *v2;

  objc_sync_enter(CFSTR("++entryKeyObjectsSync++"));
  objc_msgSend((id)_entryKeyByMetadata, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(CFSTR("++entryKeyObjectsSync++"));
  return v2;
}

+ (id)allEntryKeysForStorage:(int)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  int v12;

  v4 = (void *)objc_opt_new();
  v5 = objc_msgSend(&unk_1E6AF5E58, "indexOfObject:", CFSTR("storage"));
  objc_sync_enter(CFSTR("++entryKeyObjectsSync++"));
  v6 = (void *)_entryKeyByMetadata;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38__PPSEntryKey_allEntryKeysForStorage___block_invoke;
  v9[3] = &unk_1E6A524A0;
  v11 = v5;
  v12 = a3;
  v7 = v4;
  v10 = v7;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v9);

  objc_sync_exit(CFSTR("++entryKeyObjectsSync++"));
  return v7;
}

void __38__PPSEntryKey_allEntryKeysForStorage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  int v6;
  int v7;
  id v8;

  v8 = a3;
  objc_msgSend(a2, "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");
  v7 = *(_DWORD *)(a1 + 48);

  if (v6 == v7)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);

}

+ (void)resetMetricsForEntryKey:(id)a3
{
  id v3;

  v3 = a3;
  objc_sync_enter(CFSTR("++entryKeyObjectsSync++"));
  objc_msgSend((id)_metricsByEntryKey, "setObject:forKeyedSubscript:", 0, v3);
  objc_sync_exit(CFSTR("++entryKeyObjectsSync++"));

}

+ (id)metricsForEntryKey:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_sync_enter(CFSTR("++entryKeyObjectsSync++"));
  objc_msgSend((id)_metricsByEntryKey, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(CFSTR("++entryKeyObjectsSync++"));

  return v4;
}

+ (id)allMetricsForEntryKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(CFSTR("++entryKeyObjectsSync++"));
  +[PPSEntryKey baseMetricsForEntryKey:](PPSEntryKey, "baseMetricsForEntryKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v5);

  +[PPSEntryKey dynamicMetricsForEntryKey:](PPSEntryKey, "dynamicMetricsForEntryKey:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v6);

  +[PPSEntryKey arrayMetricsForEntryKey:](PPSEntryKey, "arrayMetricsForEntryKey:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v7);

  objc_sync_exit(CFSTR("++entryKeyObjectsSync++"));
  return v4;
}

+ (id)allKeysForEntryKey:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "allMetricsForEntryKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_21);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __34__PPSEntryKey_allKeysForEntryKey___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (id)dynamicMetricsForEntryKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (v3)
  {
    objc_sync_enter(CFSTR("++entryKeyObjectsSync++"));
    objc_msgSend((id)_metricsByEntryKey, "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("__PPSDynamic__"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_sync_exit(CFSTR("++entryKeyObjectsSync++"));
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)allDynamicKeysForEntryKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (v3)
  {
    objc_sync_enter(CFSTR("++entryKeyObjectsSync++"));
    objc_msgSend((id)_metricsByEntryKey, "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("__PPSDynamic__"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_sync_exit(CFSTR("++entryKeyObjectsSync++"));
    if (v6)
    {
      objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_23_0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __41__PPSEntryKey_allDynamicKeysForEntryKey___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (id)dynamicTableNameForEntryKey:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_Dynamic"), a3);
}

+ (BOOL)hasDMAKeys:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v3 = a3;
  if (v3)
  {
    +[PPSEntryKey allMetricsForEntryKey:](PPSEntryKey, "allMetricsForEntryKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    v9 = &v8;
    v10 = 0x2020000000;
    v11 = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __26__PPSEntryKey_hasDMAKeys___block_invoke;
    v7[3] = &unk_1E6A52548;
    v7[4] = &v8;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v7);
    v5 = *((_BYTE *)v9 + 24) != 0;
    _Block_object_dispose(&v8, 8);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __26__PPSEntryKey_hasDMAKeys___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  id v9;

  v9 = a2;
  v7 = a3;
  v8 = v7;
  if (v7 && objc_msgSend(v7, "DMACompliant"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }

}

+ (id)arrayMetricsForEntryKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (v3)
  {
    objc_sync_enter(CFSTR("++entryKeyObjectsSync++"));
    objc_msgSend((id)_metricsByEntryKey, "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("__PPSArray__"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_sync_exit(CFSTR("++entryKeyObjectsSync++"));
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)allArrayKeysForEntryKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (v3)
  {
    objc_sync_enter(CFSTR("++entryKeyObjectsSync++"));
    objc_msgSend((id)_metricsByEntryKey, "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("__PPSArray__"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_sync_exit(CFSTR("++entryKeyObjectsSync++"));
    if (v6)
    {
      objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_28);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __39__PPSEntryKey_allArrayKeysForEntryKey___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (id)allDMAKeysForEntryKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v3 = a3;
  if (v3)
  {
    +[PPSEntryKey allMetricsForEntryKey:](PPSEntryKey, "allMetricsForEntryKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    v9 = &v8;
    v10 = 0x3032000000;
    v11 = __Block_byref_object_copy__2;
    v12 = __Block_byref_object_dispose__2;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __37__PPSEntryKey_allDMAKeysForEntryKey___block_invoke;
    v7[3] = &unk_1E6A52548;
    v7[4] = &v8;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v7);
    objc_msgSend((id)v9[5], "sortedArrayUsingComparator:", &__block_literal_global_29);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _Block_object_dispose(&v8, 8);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __37__PPSEntryKey_allDMAKeysForEntryKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = v5;
  if (v5 && objc_msgSend(v5, "DMACompliant"))
  {
    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    objc_msgSend(v6, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

  }
}

uint64_t __37__PPSEntryKey_allDMAKeysForEntryKey___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (int64_t)timeToLiveForEntryKey:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  +[PPSEntryKey anyMetricsForEntryKey:](PPSEntryKey, "anyMetricsForEntryKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "timeToLive");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (int)directionalityForEntryKey:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[PPSEntryKey anyMetricsForEntryKey:](PPSEntryKey, "anyMetricsForEntryKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v3, "allValues", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "directionality") == 3)
          {
            v11 = 3;
            goto LABEL_12;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          continue;
        break;
      }
    }

    objc_msgSend(v4, "allValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v5, "directionality");
LABEL_12:

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)entryKeyFromSelector:(id)a3
{
  return (id)objc_msgSend(a3, "componentsJoinedByString:", CFSTR("_"));
}

@end
