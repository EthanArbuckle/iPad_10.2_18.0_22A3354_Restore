@implementation SAAppSizerResults

- (SAAppSizerResults)init
{
  char *v2;
  SAAppSizerResults *v3;
  uint64_t v4;
  NSMutableDictionary *appsDataInternal;
  NSDictionary *reportedTelemetry;
  uint64_t v7;
  NSMutableDictionary *pathsList;
  uint64_t v9;
  NSMutableDictionary *attributionTags;
  uint64_t v11;
  NSMutableDictionary *clonesInfo;
  uint64_t v13;
  NSDictionary *systemDataDetails;
  uint64_t v15;
  NSMutableDictionary *hiddenAppsData;
  uint64_t v17;
  NSMutableDictionary *appsList;
  uint64_t v19;
  NSMutableArray *zeroSizeApps;
  uint64_t v21;
  NSDictionary *systemDetails;
  SAAppSizeBreakdownList *appSizeBreakdownList;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)SAAppSizerResults;
  v2 = -[SAAppSizerResults init](&v25, sel_init);
  v3 = (SAAppSizerResults *)v2;
  if (v2)
  {
    *((_QWORD *)v2 + 3) = 0;
    *((_QWORD *)v2 + 4) = 0;
    *((_QWORD *)v2 + 16) = 0;
    *((_QWORD *)v2 + 17) = 0;
    *(_OWORD *)(v2 + 8) = xmmword_2478F58E0;
    v4 = objc_opt_new();
    appsDataInternal = v3->_appsDataInternal;
    v3->_appsDataInternal = (NSMutableDictionary *)v4;

    reportedTelemetry = v3->_reportedTelemetry;
    v3->_reportedTelemetry = 0;

    v7 = objc_opt_new();
    pathsList = v3->_pathsList;
    v3->_pathsList = (NSMutableDictionary *)v7;

    v9 = objc_opt_new();
    attributionTags = v3->_attributionTags;
    v3->_attributionTags = (NSMutableDictionary *)v9;

    v11 = objc_opt_new();
    clonesInfo = v3->_clonesInfo;
    v3->_clonesInfo = (NSMutableDictionary *)v11;

    v13 = objc_opt_new();
    systemDataDetails = v3->_systemDataDetails;
    v3->_systemDataDetails = (NSDictionary *)v13;

    v15 = objc_opt_new();
    hiddenAppsData = v3->_hiddenAppsData;
    v3->_hiddenAppsData = (NSMutableDictionary *)v15;

    v17 = objc_opt_new();
    appsList = v3->_appsList;
    v3->_appsList = (NSMutableDictionary *)v17;

    v19 = objc_opt_new();
    zeroSizeApps = v3->_zeroSizeApps;
    v3->_zeroSizeApps = (NSMutableArray *)v19;

    v21 = objc_opt_new();
    systemDetails = v3->_systemDetails;
    v3->_systemDetails = (NSDictionary *)v21;

    appSizeBreakdownList = v3->_appSizeBreakdownList;
    v3->_appSizeBreakdownList = 0;

  }
  return v3;
}

- (void)enableAppSizeBreakdown
{
  SAAppSizeBreakdownList *v3;
  SAAppSizeBreakdownList *appSizeBreakdownList;

  v3 = (SAAppSizeBreakdownList *)objc_opt_new();
  appSizeBreakdownList = self->_appSizeBreakdownList;
  self->_appSizeBreakdownList = v3;

}

- (id)convertBundlesSetToBundlesKey:(id)a3
{
  return +[SAUtilities createCommaSeparatedString:](SAUtilities, "createCommaSeparatedString:", a3);
}

- (id)convertBundlesKeyToBundlesSet:(id)a3
{
  return +[SAUtilities breakCommaSeparatedStringToComponents:](SAUtilities, "breakCommaSeparatedStringToComponents:", a3);
}

- (void)populateAppsData
{
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__1;
  v8 = __Block_byref_object_dispose__1;
  v9 = (id)objc_opt_new();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __37__SAAppSizerResults_populateAppsData__block_invoke;
  v3[3] = &unk_2518F38A0;
  v3[4] = &v4;
  -[SAAppSizerResults enumerateAppsDataUsingBlock:](self, "enumerateAppsDataUsingBlock:", v3);
  objc_storeStrong((id *)&self->_appData, (id)v5[5]);
  _Block_object_dispose(&v4, 8);

}

uint64_t __37__SAAppSizerResults_populateAppsData__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", a3, a2);
}

- (void)updateAppSet:(id)a3 fixedSize:(unint64_t)a4 dataSize:(unint64_t)a5 cloneSize:(unint64_t)a6 purgeableSize:(unint64_t)a7 FSPurgeableSize:(unint64_t)a8 physicalSize:(unint64_t)a9 appCacheSize:(unint64_t)a10 CDPluginSize:(unint64_t)a11
{
  NSMutableDictionary *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;

  v22 = a3;
  v17 = self->_appsDataInternal;
  objc_sync_enter(v17);
  -[SAAppSizerResults convertBundlesSetToBundlesKey:](self, "convertBundlesSetToBundlesKey:", v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_appsDataInternal, "objectForKey:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    objc_msgSend(v19, "setFixedSize:", objc_msgSend(v19, "fixedSize") + a4);
    objc_msgSend(v20, "setDataSize:", objc_msgSend(v20, "dataSize") + a5);
    objc_msgSend(v20, "setCloneSize:", objc_msgSend(v20, "cloneSize") + a6);
    objc_msgSend(v20, "setPurgeableSize:", objc_msgSend(v20, "purgeableSize") + a7);
    objc_msgSend(v20, "setPhysicalSize:", objc_msgSend(v20, "physicalSize") + a9);
    objc_msgSend(v20, "setFSPurgeableSize:", objc_msgSend(v20, "FSPurgeableSize") + a8);
    objc_msgSend(v20, "setAppCacheSize:", objc_msgSend(v20, "appCacheSize") + a10);
    objc_msgSend(v20, "setCacheDeletePluginSize:", objc_msgSend(v20, "cacheDeletePluginSize") + a11);
  }
  else
  {
    v21 = +[SAAppSize newWithFixedSize:dataSize:cloneSize:purgeableSize:FSPurgeableSize:physicalSize:appCacheSize:CDPluginSize:](SAAppSize, "newWithFixedSize:dataSize:cloneSize:purgeableSize:FSPurgeableSize:physicalSize:appCacheSize:CDPluginSize:", a4, a5, a6, a7, a8, a9, a10, a11);
    -[NSMutableDictionary setObject:forKey:](self->_appsDataInternal, "setObject:forKey:", v21, v18);

  }
  objc_sync_exit(v17);

}

- (void)setAppSet:(id)a3 vendorName:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;

  v6 = a3;
  v7 = a4;
  v8 = self->_appsDataInternal;
  objc_sync_enter(v8);
  -[SAAppSizerResults convertBundlesSetToBundlesKey:](self, "convertBundlesSetToBundlesKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_appsDataInternal, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "setVendorName:", v7);
  }
  else
  {
    SALog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SAAppSizerResults setAppSet:vendorName:].cold.1();

  }
  objc_sync_exit(v8);

}

- (void)setAppSet:(id)a3 withAppSize:(id)a4
{
  id v6;
  NSMutableDictionary *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = self->_appsDataInternal;
  objc_sync_enter(v7);
  -[SAAppSizerResults convertBundlesSetToBundlesKey:](self, "convertBundlesSetToBundlesKey:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_appsDataInternal, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v9, "setFixedSize:", objc_msgSend(v6, "fixedSize"));
    objc_msgSend(v9, "setDataSize:", objc_msgSend(v6, "dataSize"));
    objc_msgSend(v9, "setCloneSize:", objc_msgSend(v6, "cloneSize"));
    objc_msgSend(v9, "setPurgeableSize:", objc_msgSend(v6, "purgeableSize"));
    objc_msgSend(v9, "setPhysicalSize:", objc_msgSend(v6, "physicalSize"));
    objc_msgSend(v9, "setFSPurgeableSize:", objc_msgSend(v6, "FSPurgeableSize"));
    objc_msgSend(v9, "setAppCacheSize:", objc_msgSend(v6, "appCacheSize"));
    objc_msgSend(v9, "setCacheDeletePluginSize:", objc_msgSend(v6, "cacheDeletePluginSize"));
  }
  else
  {
    -[NSMutableDictionary setObject:forKey:](self->_appsDataInternal, "setObject:forKey:", v6, v8);
  }

  objc_sync_exit(v7);
}

- (void)updateAppSet:(id)a3 withAppSize:(id)a4
{
  id v6;
  NSMutableDictionary *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = self->_appsDataInternal;
  objc_sync_enter(v7);
  -[SAAppSizerResults convertBundlesSetToBundlesKey:](self, "convertBundlesSetToBundlesKey:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_appsDataInternal, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v9, "setFixedSize:", objc_msgSend(v9, "fixedSize") + objc_msgSend(v6, "fixedSize"));
    objc_msgSend(v9, "setDataSize:", objc_msgSend(v9, "dataSize") + objc_msgSend(v6, "dataSize"));
    objc_msgSend(v9, "setCloneSize:", objc_msgSend(v9, "cloneSize") + objc_msgSend(v6, "cloneSize"));
    objc_msgSend(v9, "setPurgeableSize:", objc_msgSend(v9, "purgeableSize") + objc_msgSend(v6, "purgeableSize"));
    objc_msgSend(v9, "setPhysicalSize:", objc_msgSend(v9, "physicalSize") + objc_msgSend(v6, "physicalSize"));
    objc_msgSend(v9, "setFSPurgeableSize:", objc_msgSend(v9, "FSPurgeableSize") + objc_msgSend(v6, "FSPurgeableSize"));
    objc_msgSend(v9, "setAppCacheSize:", objc_msgSend(v9, "appCacheSize") + objc_msgSend(v6, "appCacheSize"));
    objc_msgSend(v9, "setCacheDeletePluginSize:", objc_msgSend(v9, "cacheDeletePluginSize") + objc_msgSend(v6, "cacheDeletePluginSize"));
  }
  else
  {
    -[NSMutableDictionary setObject:forKey:](self->_appsDataInternal, "setObject:forKey:", v6, v8);
  }

  objc_sync_exit(v7);
}

- (void)accountSUPurgeableFor:(id)a3 purgeableSize:(unint64_t)a4
{
  void *v6;
  void *v7;
  id v8;

  -[SAAppSizerResults convertBundlesSetToBundlesKey:](self, "convertBundlesSetToBundlesKey:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_appsDataInternal, "objectForKey:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "setDataSize:", objc_msgSend(v6, "dataSize") + a4);
    objc_msgSend(v7, "setPurgeableSize:", objc_msgSend(v7, "purgeableSize") - a4);
  }
  else
  {
    -[SAAppSizerResults updateHiddenApp:withSUPurgeableSize:](self, "updateHiddenApp:withSUPurgeableSize:", v8, a4);
  }

}

- (void)updateHiddenApp:(id)a3 withSUPurgeableSize:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSDictionary *systemDataDetails;
  void *v12;

  v6 = a3;
  -[NSMutableDictionary objectForKey:](self->_hiddenAppsData, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "setDataSize:", objc_msgSend(v7, "dataSize") + a4);
    objc_msgSend(v8, "setPurgeableSize:", objc_msgSend(v8, "purgeableSize") - a4);
  }
  else
  {
    SALog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SAAppSizerResults updateHiddenApp:withSUPurgeableSize:].cold.1();

  }
  -[NSDictionary objectForKey:](self->_systemDataDetails, "objectForKey:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  systemDataDetails = self->_systemDataDetails;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v10, "unsignedLongLongValue") + a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary setValue:forKey:](systemDataDetails, "setValue:forKey:", v12, v6);

}

- (id)mergeAppSet:(id)a3 withAppSet:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v6, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObjectsFromArray:", v9);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v19);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  -[SAAppSizerResults convertBundlesSetToBundlesKey:](self, "convertBundlesSetToBundlesKey:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[SAAppSizerResults convertBundlesSetToBundlesKey:](self, "convertBundlesSetToBundlesKey:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[SAAppSizerResults convertBundlesSetToBundlesKey:](self, "convertBundlesSetToBundlesKey:", v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_appsDataInternal, "objectForKey:", v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_appsDataInternal, "objectForKey:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = +[SAAppSize newWithFixedSize:dataSize:cloneSize:purgeableSize:FSPurgeableSize:physicalSize:appCacheSize:CDPluginSize:](SAAppSize, "newWithFixedSize:dataSize:cloneSize:purgeableSize:FSPurgeableSize:physicalSize:appCacheSize:CDPluginSize:", objc_msgSend(v11, "fixedSize") + objc_msgSend(v10, "fixedSize"), objc_msgSend(v11, "dataSize") + objc_msgSend(v10, "dataSize"), objc_msgSend(v11, "cloneSize") + objc_msgSend(v10, "cloneSize"), objc_msgSend(v11, "purgeableSize") + objc_msgSend(v10, "purgeableSize"), objc_msgSend(v11, "FSPurgeableSize") + objc_msgSend(v10, "FSPurgeableSize"), objc_msgSend(v11, "physicalSize") + objc_msgSend(v10, "physicalSize"), objc_msgSend(v11, "appCacheSize") + objc_msgSend(v10, "appCacheSize"), objc_msgSend(v11, "cacheDeletePluginSize") + objc_msgSend(v10, "cacheDeletePluginSize"));
  objc_msgSend(v10, "vendorName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setVendorName:", v13);

  -[NSMutableDictionary removeObjectForKey:](self->_appsDataInternal, "removeObjectForKey:", v16);
  -[NSMutableDictionary removeObjectForKey:](self->_appsDataInternal, "removeObjectForKey:", v15);
  -[NSMutableDictionary setObject:forKey:](self->_appsDataInternal, "setObject:forKey:", v12, v17);

  return v18;
}

- (void)updateSystemDataDetailsWith:(id)a3 andSize:(unint64_t)a4
{
  void *v6;
  NSDictionary *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[SAAppSizerResults convertBundlesSetToBundlesKey:](self, "convertBundlesSetToBundlesKey:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = self->_systemDataDetails;
  objc_sync_enter(v7);
  -[NSDictionary objectForKey:](self->_systemDataDetails, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[NSDictionary setValue:forKey:](self->_systemDataDetails, "setValue:forKey:", v8, v6);

  objc_sync_exit(v7);
}

- (void)enumerateAppsDataUsingBlock:(id)a3
{
  id v4;
  NSMutableDictionary *appsDataInternal;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  appsDataInternal = self->_appsDataInternal;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__SAAppSizerResults_enumerateAppsDataUsingBlock___block_invoke;
  v7[3] = &unk_2518F38C8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](appsDataInternal, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __49__SAAppSizerResults_enumerateAppsDataUsingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "convertBundlesKeyToBundlesSet:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)print
{
  SAAppSizerResults *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t diskCapacity;
  uint64_t v7;
  unint64_t diskUsed;
  NSMutableDictionary *appsDataInternal;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  char *v16;
  void *v17;
  NSObject *v18;
  unint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  SAAppSizerResults *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  NSMutableDictionary *obj;
  const char *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  char *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  char __s[8];
  uint64_t v49;
  _QWORD v50[5];

  v2 = self;
  v50[2] = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)__s = 0;
  v49 = 0;
  *(_QWORD *)((char *)v50 + 6) = 0;
  v50[0] = 0;
  ctime_r(&self->_time, __s);
  __s[strlen(__s) - 1] = 0;
  SALog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(CFSTR("time"), "UTF8String");
    v5 = objc_msgSend(CFSTR("diskUsed"), "UTF8String");
    diskCapacity = v2->_diskCapacity;
    v7 = objc_msgSend(CFSTR("diskUsed"), "UTF8String");
    diskUsed = v2->_diskUsed;
    *(_DWORD *)buf = 136316418;
    v37 = v4;
    v38 = 2080;
    v39 = __s;
    v40 = 2080;
    v41 = v5;
    v42 = 2048;
    v43 = diskCapacity;
    v44 = 2080;
    v45 = v7;
    v46 = 2048;
    v47 = diskUsed;
    _os_log_impl(&dword_2478E3000, v3, OS_LOG_TYPE_DEFAULT, "%s: %s\n%s: %llu\n%s: %llu\napps data:\n", buf, 0x3Eu);
  }

  appsDataInternal = v2->_appsDataInternal;
  if (appsDataInternal)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    obj = appsDataInternal;
    v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v10)
    {
      v12 = v10;
      v13 = *(_QWORD *)v32;
      *(_QWORD *)&v11 = 136316418;
      v28 = v11;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v32 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          -[SAAppSizerResults convertBundlesSetToBundlesKey:](v2, "convertBundlesSetToBundlesKey:", v15, v28);
          v16 = (char *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](v2->_appsDataInternal, "objectForKeyedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          SALog();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            v19 = objc_msgSend(v15, "count");
            v20 = "app";
            if (v19 > 1)
              v20 = "apps";
            v30 = v20;
            v21 = objc_msgSend(v17, "fixedSize");
            v22 = objc_msgSend(v17, "dataSize");
            v23 = v2;
            v24 = v12;
            v25 = v13;
            v26 = objc_msgSend(v17, "cloneSize");
            v27 = objc_msgSend(v17, "purgeableSize");
            *(_DWORD *)buf = v28;
            v37 = (uint64_t)v30;
            v38 = 2112;
            v39 = v16;
            v40 = 2048;
            v41 = v21;
            v42 = 2048;
            v43 = v22;
            v44 = 2048;
            v45 = v26;
            v13 = v25;
            v12 = v24;
            v2 = v23;
            v46 = 2048;
            v47 = v27;
            _os_log_impl(&dword_2478E3000, v18, OS_LOG_TYPE_DEFAULT, "%s: %@\nfixed size: %llu\ndata size: %llu\nclone size: %llu\npurgeable size: %llu\n\n", buf, 0x3Eu);
          }

        }
        v12 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v12);
    }

  }
}

- (void)updateTimestamp
{
  self->_time = time(0);
}

- (void)updateBundleID:(id)a3 WithCloneSize:(unint64_t)a4
{
  __CFString *v6;
  void *v7;
  __CFString *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v6 = (__CFString *)a3;
  -[NSMutableDictionary objectForKey:](self->_appsDataInternal, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (!v7)
  {
    SALog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SAAppSizerResults updateBundleID:WithCloneSize:].cold.2((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);

    v8 = CFSTR("com.apple.fakeapp.SystemData");
    -[NSMutableDictionary objectForKey:](self->_appsDataInternal, "objectForKey:", CFSTR("com.apple.fakeapp.SystemData"));
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v7 = (void *)v16;
    }
    else
    {
      SALog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[SAAppSizerResults updateBundleID:WithCloneSize:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);

      v7 = (void *)objc_opt_new();
      v8 = CFSTR("com.apple.fakeapp.SystemData");
    }
  }
  objc_msgSend(v7, "setCloneSize:", objc_msgSend(v7, "cloneSize") + a4);
  objc_msgSend(v7, "setDataSize:", objc_msgSend(v7, "dataSize") + a4);
  -[NSMutableDictionary setObject:forKey:](self->_appsDataInternal, "setObject:forKey:", v7, v8);

}

- (void)updateBundleID:(id)a3 withDataSize:(unint64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;

  v6 = a3;
  -[NSMutableDictionary objectForKey:](self->_appsDataInternal, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SALog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v9)
      -[SAAppSizerResults updateBundleID:withDataSize:].cold.2();

  }
  else
  {
    if (v9)
      -[SAAppSizerResults updateBundleID:withDataSize:].cold.1();

    v7 = (void *)objc_opt_new();
  }
  objc_msgSend(v7, "setDataSize:", objc_msgSend(v7, "dataSize") + a4);
  -[NSMutableDictionary setObject:forKey:](self->_appsDataInternal, "setObject:forKey:", v7, v6);

}

- (void)addSystemVolumeWithCapacity:(unint64_t)a3 used:(unint64_t)a4 withReplyBlock:(id)a5
{
  NSMutableDictionary *appsDataInternal;
  void (**v8)(id, void *, uint64_t, uint64_t);
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  int v20;
  const __CFString *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  appsDataInternal = self->_appsDataInternal;
  v8 = (void (**)(id, void *, uint64_t, uint64_t))a5;
  -[NSMutableDictionary objectForKey:](appsDataInternal, "objectForKey:", CFSTR("com.apple.fakeapp.System"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    SALog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[SAAppSizerResults addSystemVolumeWithCapacity:used:withReplyBlock:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

    v9 = (void *)objc_opt_new();
  }
  objc_msgSend(v9, "setDataSize:", a4);
  objc_msgSend(v9, "setFixedSize:", 0);
  -[NSMutableDictionary setObject:forKey:](self->_appsDataInternal, "setObject:forKey:", v9, CFSTR("com.apple.fakeapp.System"));
  SALog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138412802;
    v21 = CFSTR("com.apple.fakeapp.System");
    v22 = 2048;
    v23 = objc_msgSend(v9, "dataSize");
    v24 = 2048;
    v25 = objc_msgSend(v9, "fixedSize");
    _os_log_impl(&dword_2478E3000, v18, OS_LOG_TYPE_DEFAULT, "Adding for %@ - data size: %llu, fixed size: %llu", (uint8_t *)&v20, 0x20u);
  }

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("com.apple.fakeapp.System"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, v19, objc_msgSend(v9, "dataSize"), objc_msgSend(v9, "fixedSize"));

}

- (void)removeBundleSet:(id)a3
{
  id v4;

  if (a3)
  {
    -[SAAppSizerResults convertBundlesSetToBundlesKey:](self, "convertBundlesSetToBundlesKey:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](self->_appsDataInternal, "removeObjectForKey:", v4);

  }
}

- (void)zeroSizeAppsFiltering
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  uint64_t v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[NSMutableDictionary allKeys](self->_appsDataInternal, "allKeys");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x249583724]();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_appsDataInternal, "objectForKeyedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v10, "dataSize") && !objc_msgSend(v10, "fixedSize"))
        {
          SALog();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v17 = v8;
            _os_log_debug_impl(&dword_2478E3000, v11, OS_LOG_TYPE_DEBUG, "Bundle set %@ totalSize is 0", buf, 0xCu);
          }

          -[NSMutableArray addObject:](self->_zeroSizeApps, "addObject:", v8);
          -[NSMutableDictionary removeObjectForKey:](self->_appsDataInternal, "removeObjectForKey:", v8);
        }

        objc_autoreleasePoolPop(v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    }
    while (v5);
  }

}

- (unint64_t)postProcessFilteringWithAppPathList:(id)a3
{
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  SAAppSizeBreakdownList *appSizeBreakdownList;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  SAAppSizeBreakdownList *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  SAAppSizeBreakdownList *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  SAAppSizeBreakdownList *v31;
  NSObject *v32;
  uint64_t v33;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[4];
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  uint64_t v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  void *v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v41 = a3;
  -[NSMutableDictionary allKeys](self->_appsDataInternal, "allKeys");
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
  if (v5)
  {
    v7 = v5;
    v39 = 0;
    v8 = *(_QWORD *)v48;
    *(_QWORD *)&v6 = 138412290;
    v35 = v6;
    v40 = v4;
    v42 = *(_QWORD *)v48;
    while (1)
    {
      v9 = 0;
      v43 = v7;
      do
      {
        if (*(_QWORD *)v48 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x249583724]();
        -[SAAppSizerResults convertBundlesKeyToBundlesSet:](self, "convertBundlesKeyToBundlesSet:", v10);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "count") != 1)
          goto LABEL_11;
        objc_msgSend(v12, "anyObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v13, "isEqual:", CFSTR("com.apple.fakeapp.SystemData")) & 1) == 0
          && (objc_msgSend(v13, "isEqual:", CFSTR("com.apple.fakeapp.System")) & 1) == 0
          && (objc_msgSend(v13, "isEqual:", CFSTR("com.apple.fakeapp.SoftwareUpdate")) & 1) == 0)
        {

LABEL_11:
          -[NSMutableDictionary objectForKeyedSubscript:](self->_appsDataInternal, "objectForKeyedSubscript:", v10, v35);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v13)
            goto LABEL_43;
          if ((unint64_t)objc_msgSend(v12, "count") < 2)
            goto LABEL_25;
          if (objc_msgSend(v12, "containsObject:", CFSTR("com.apple.FileProvider.LocalStorage")))
          {
            objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("com.apple.FileProvider.LocalStorage"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            SALog();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v52 = (uint64_t)v12;
              v53 = 2112;
              v54 = (uint64_t)v14;
              _os_log_debug_impl(&dword_2478E3000, v15, OS_LOG_TYPE_DEBUG, "Assign to LocalStorage: bundleID set %@ belongs to %@", buf, 0x16u);
            }

            -[SAAppSizerResults updateAppSet:withAppSize:](self, "updateAppSet:withAppSize:", v14, v13);
            -[NSMutableDictionary removeObjectForKey:](self->_appsDataInternal, "removeObjectForKey:", v10);
            appSizeBreakdownList = self->_appSizeBreakdownList;
            if (appSizeBreakdownList)
              -[SAAppSizeBreakdownList updateBundleId:newId:](appSizeBreakdownList, "updateBundleId:newId:", v12, v14);
            v17 = v14;
            v18 = v17;
            v4 = v40;
LABEL_42:

            v12 = v18;
            v8 = v42;
            v7 = v43;
            goto LABEL_43;
          }
          if (objc_msgSend(v12, "containsObject:", CFSTR("com.apple.Bridge")))
          {
            objc_msgSend(MEMORY[0x24BDBCEF0], "setWithSet:", v12);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "removeObject:", CFSTR("com.apple.Bridge"));
            objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            SALog();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v52 = (uint64_t)v12;
              v53 = 2112;
              v54 = (uint64_t)v20;
              _os_log_debug_impl(&dword_2478E3000, v21, OS_LOG_TYPE_DEBUG, "Remove watch from bundleID set %@ changed to %@", buf, 0x16u);
            }

            -[SAAppSizerResults updateAppSet:withAppSize:](self, "updateAppSet:withAppSize:", v20, v13);
            -[NSMutableDictionary removeObjectForKey:](self->_appsDataInternal, "removeObjectForKey:", v10);
            v22 = self->_appSizeBreakdownList;
            if (v22)
              -[SAAppSizeBreakdownList updateBundleId:newId:](v22, "updateBundleId:newId:", v12, v20);
            v17 = v20;

            v18 = v17;
            v4 = v40;
          }
          else
          {
LABEL_25:
            v17 = 0;
            v18 = v12;
          }
          objc_msgSend(MEMORY[0x24BDBCEF0], "setWithSet:", v18);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v44[0] = MEMORY[0x24BDAC760];
          v44[1] = 3221225472;
          v44[2] = __57__SAAppSizerResults_postProcessFilteringWithAppPathList___block_invoke;
          v44[3] = &unk_2518F38F0;
          v45 = v41;
          v12 = v23;
          v46 = v12;
          objc_msgSend(v18, "enumerateObjectsUsingBlock:", v44);
          -[SAAppSizerResults convertBundlesSetToBundlesKey:](self, "convertBundlesSetToBundlesKey:", v18);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "count"))
          {
            v25 = objc_msgSend(v12, "count");
            if (v25 != objc_msgSend(v18, "count"))
            {
              SALog();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                v52 = (uint64_t)v18;
                v53 = 2112;
                v54 = (uint64_t)v12;
                _os_log_debug_impl(&dword_2478E3000, v26, OS_LOG_TYPE_DEBUG, "Remove hidden: Replacing bundleID set %@ with %@", buf, 0x16u);
              }

              -[SAAppSizerResults updateAppSet:withAppSize:](self, "updateAppSet:withAppSize:", v12, v13);
              -[NSMutableDictionary removeObjectForKey:](self->_appsDataInternal, "removeObjectForKey:", v24);
              v27 = self->_appSizeBreakdownList;
              if (v27)
                -[SAAppSizeBreakdownList updateBundleId:newId:](v27, "updateBundleId:newId:", v18, v12);
            }
          }
          else
          {
            -[NSMutableDictionary objectForKeyedSubscript:](self->_appsDataInternal, "objectForKeyedSubscript:", v24);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = v28;
            if (v28)
            {
              v38 = objc_msgSend(v28, "dataSize");
              v37 = objc_msgSend(v29, "fixedSize");
              -[SAAppSizerResults updateSystemDataDetailsWith:andSize:](self, "updateSystemDataDetailsWith:andSize:", v18, objc_msgSend(v29, "fixedSize") + objc_msgSend(v29, "dataSize"));
              SALog();
              v30 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
              {
                v36 = objc_msgSend(v29, "dataSize");
                v33 = objc_msgSend(v29, "fixedSize");
                *(_DWORD *)buf = 134218498;
                v52 = v36;
                v53 = 2048;
                v54 = v33;
                v55 = 2112;
                v56 = v18;
                _os_log_debug_impl(&dword_2478E3000, v30, OS_LOG_TYPE_DEBUG, "Remove hidden: dataSize %llu and fixedSize %llu for bundleID set %@", buf, 0x20u);
              }
              v39 += v38 + v37;

              -[NSMutableDictionary removeObjectForKey:](self->_appsDataInternal, "removeObjectForKey:", v24);
              -[NSMutableDictionary setObject:forKey:](self->_hiddenAppsData, "setObject:forKey:", v29, v24);
              v31 = self->_appSizeBreakdownList;
              if (v31)
                -[SAAppSizeBreakdownList removeBundleId:](v31, "removeBundleId:", v18);
            }
            else
            {
              SALog();
              v32 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v35;
                v52 = (uint64_t)v18;
                _os_log_error_impl(&dword_2478E3000, v32, OS_LOG_TYPE_ERROR, "filteredData is nil for %@", buf, 0xCu);
              }

            }
            v4 = v40;
          }

          goto LABEL_42;
        }
LABEL_43:

        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
      if (!v7)
        goto LABEL_47;
    }
  }
  v39 = 0;
LABEL_47:

  return v39;
}

void __57__SAAppSizerResults_postProcessFilteringWithAppPathList___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "appPathList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4
    || (objc_msgSend(*(id *)(a1 + 32), "appPathList"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "objectForKeyedSubscript:", v8),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isUserVisible"),
        v6,
        v5,
        (v7 & 1) == 0))
  {
    objc_msgSend(*(id *)(a1 + 40), "removeObject:", v8);
  }

}

- (void)postProcessMerging
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  SAAppSizeBreakdownList *appSizeBreakdownList;
  id v23;
  void *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  -[NSMutableDictionary allKeys](self->_appsDataInternal, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 100);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
    v23 = v5;
    v24 = v4;
    do
    {
      v9 = 0;
      v25 = v7;
      do
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x249583724]();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_appsDataInternal, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SAAppSizerResults convertBundlesKeyToBundlesSet:](self, "convertBundlesKeyToBundlesSet:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v13, "count") >= 2)
        {
          objc_msgSend(v12, "vendorName");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            objc_msgSend(v4, "objectForKeyedSubscript:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15)
            {
              objc_msgSend(v4, "objectForKeyedSubscript:", v14);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              -[SAAppSizerResults mergeAppSet:withAppSet:](self, "mergeAppSet:withAppSet:", v16, v13);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              SALog();
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v31 = v13;
                _os_log_debug_impl(&dword_2478E3000, v18, OS_LOG_TYPE_DEBUG, "Merging %@", buf, 0xCu);
              }

              SALog();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v31 = v16;
                _os_log_debug_impl(&dword_2478E3000, v19, OS_LOG_TYPE_DEBUG, "and %@", buf, 0xCu);
              }

              SALog();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v31 = v17;
                _os_log_debug_impl(&dword_2478E3000, v20, OS_LOG_TYPE_DEBUG, "to %@", buf, 0xCu);
              }

              SALog();
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v31 = v14;
                _os_log_debug_impl(&dword_2478E3000, v21, OS_LOG_TYPE_DEBUG, "for vendor %@", buf, 0xCu);
              }

              objc_msgSend(v24, "setObject:forKeyedSubscript:", v17, v14);
              appSizeBreakdownList = self->_appSizeBreakdownList;
              if (appSizeBreakdownList)
                -[SAAppSizeBreakdownList mergeBundleId:withBundleId:newBundleId:](appSizeBreakdownList, "mergeBundleId:withBundleId:newBundleId:", v13, v16, v17);

              v5 = v23;
              v4 = v24;
            }
            else
            {
              objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v14);
            }
          }

          v7 = v25;
        }

        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v7);
  }

}

- (unsigned)initDiskUsedAndCapacity
{
  int v3;
  NSObject *v4;
  NSObject *v5;
  unsigned __int8 v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t *p_diskUsed;
  NSObject *v12;
  id v14;
  __int128 v15;
  __int128 v16;
  int v17;
  _QWORD v18[3];

  v17 = 0;
  v15 = 0u;
  v16 = 0u;
  v18[2] = 0;
  v18[0] = 5;
  v18[1] = 2155872284;
  v3 = getattrlist("/", v18, &v15, 0x24uLL, 1u);
  SALog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[SAAppSizerResults initDiskUsedAndCapacity].cold.5();
    v6 = 3;
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[SAAppSizerResults initDiskUsedAndCapacity].cold.4((uint64_t)&v15, v5);

    v14 = 0;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE2D0C0]), "initWithDevName:error:", CFSTR("disk0"), &v14);
    v5 = v14;
    if (v7)
    {
      v8 = objc_msgSend(v7, "copyPropertyWithClass:key:", objc_opt_class(), CFSTR("Size"));
      v9 = v8;
      if (v8)
      {
        v10 = -[NSObject unsignedLongLongValue](v8, "unsignedLongLongValue");
        self->_diskUsed = *(_QWORD *)((char *)&v15 + 4) - *(_QWORD *)((char *)&v16 + 4);
        p_diskUsed = (uint64_t *)&self->_diskUsed;
        *(p_diskUsed - 1) = v10;
        SALog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          -[SAAppSizerResults initDiskUsedAndCapacity].cold.3(p_diskUsed, p_diskUsed - 1, v12);
        v6 = 5;
      }
      else
      {
        SALog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[SAAppSizerResults initDiskUsedAndCapacity].cold.2();
        v6 = 3;
      }

    }
    else
    {
      SALog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[SAAppSizerResults initDiskUsedAndCapacity].cold.1();
      v6 = 3;
    }

  }
  return v6;
}

- (void)setDiskUsed:(unint64_t)a3 andCapacity:(unint64_t)a4
{
  self->_diskCapacity = a4;
  self->_diskUsed = a3;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t time;
  id v5;

  time = self->_time;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", time, CFSTR("time"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_status, CFSTR("status"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_diskCapacity, CFSTR("diskCapacity"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_diskUsed, CFSTR("diskUsed"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_totalCDAvailable, CFSTR("totalCDAvailable"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_totalPurgeableClones, CFSTR("totalPurgeableClones"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appData, CFSTR("appData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_reportedTelemetry, CFSTR("reportedTelemetry"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pathsList, CFSTR("pathsList"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attributionTags, CFSTR("attributionTags"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clonesInfo, CFSTR("clonesInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_FSPurgeableData, CFSTR("FSPurgeableData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_systemDataDetails, CFSTR("systemDataDetails"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_systemDetails, CFSTR("systemDetails"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_hiddenAppsData, CFSTR("hiddenAppsData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appsList, CFSTR("appsList"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_zeroSizeApps, CFSTR("zeroSizeApps"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appsInfo, CFSTR("appsInfo"));

}

- (SAAppSizerResults)initWithCoder:(id)a3
{
  id v4;
  SAAppSizerResults *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSDictionary *appData;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSDictionary *reportedTelemetry;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSMutableDictionary *pathsList;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSMutableDictionary *attributionTags;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  NSMutableDictionary *clonesInfo;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  NSMutableDictionary *FSPurgeableData;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  NSDictionary *systemDataDetails;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  NSDictionary *systemDetails;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  NSMutableDictionary *hiddenAppsData;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  NSMutableDictionary *appsList;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  NSMutableArray *zeroSizeApps;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  NSDictionary *appsInfo;
  objc_super v87;

  v4 = a3;
  v87.receiver = self;
  v87.super_class = (Class)SAAppSizerResults;
  v5 = -[SAAppSizerResults init](&v87, sel_init);
  if (v5)
  {
    v5->_time = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("time"));
    v5->_status = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("status"));
    v5->_diskCapacity = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("diskCapacity"));
    v5->_diskUsed = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("diskUsed"));
    v5->_totalCDAvailable = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("totalCDAvailable"));
    v5->_totalPurgeableClones = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("totalPurgeableClones"));
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("appData"));
    v11 = objc_claimAutoreleasedReturnValue();
    appData = v5->_appData;
    v5->_appData = (NSDictionary *)v11;

    v13 = (void *)MEMORY[0x24BDBCF20];
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, v15, v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("reportedTelemetry"));
    v18 = objc_claimAutoreleasedReturnValue();
    reportedTelemetry = v5->_reportedTelemetry;
    v5->_reportedTelemetry = (NSDictionary *)v18;

    v20 = (void *)MEMORY[0x24BDBCF20];
    v21 = objc_opt_class();
    v22 = objc_opt_class();
    v23 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v21, v22, v23, objc_opt_class(), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("pathsList"));
    v25 = objc_claimAutoreleasedReturnValue();
    pathsList = v5->_pathsList;
    v5->_pathsList = (NSMutableDictionary *)v25;

    v27 = (void *)MEMORY[0x24BDBCF20];
    v28 = objc_opt_class();
    v29 = objc_opt_class();
    v30 = objc_opt_class();
    objc_msgSend(v27, "setWithObjects:", v28, v29, v30, objc_opt_class(), 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v31, CFSTR("attributionTags"));
    v32 = objc_claimAutoreleasedReturnValue();
    attributionTags = v5->_attributionTags;
    v5->_attributionTags = (NSMutableDictionary *)v32;

    v34 = (void *)MEMORY[0x24BDBCF20];
    v35 = objc_opt_class();
    v36 = objc_opt_class();
    v37 = objc_opt_class();
    v38 = objc_opt_class();
    objc_msgSend(v34, "setWithObjects:", v35, v36, v37, v38, objc_opt_class(), 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v39, CFSTR("clonesInfo"));
    v40 = objc_claimAutoreleasedReturnValue();
    clonesInfo = v5->_clonesInfo;
    v5->_clonesInfo = (NSMutableDictionary *)v40;

    v42 = (void *)MEMORY[0x24BDBCF20];
    v43 = objc_opt_class();
    v44 = objc_opt_class();
    objc_msgSend(v42, "setWithObjects:", v43, v44, objc_opt_class(), 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v45, CFSTR("FSPurgeableData"));
    v46 = objc_claimAutoreleasedReturnValue();
    FSPurgeableData = v5->_FSPurgeableData;
    v5->_FSPurgeableData = (NSMutableDictionary *)v46;

    v48 = (void *)MEMORY[0x24BDBCF20];
    v49 = objc_opt_class();
    v50 = objc_opt_class();
    objc_msgSend(v48, "setWithObjects:", v49, v50, objc_opt_class(), 0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v51, CFSTR("systemDataDetails"));
    v52 = objc_claimAutoreleasedReturnValue();
    systemDataDetails = v5->_systemDataDetails;
    v5->_systemDataDetails = (NSDictionary *)v52;

    v54 = (void *)MEMORY[0x24BDBCF20];
    v55 = objc_opt_class();
    v56 = objc_opt_class();
    objc_msgSend(v54, "setWithObjects:", v55, v56, objc_opt_class(), 0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v57, CFSTR("systemDetails"));
    v58 = objc_claimAutoreleasedReturnValue();
    systemDetails = v5->_systemDetails;
    v5->_systemDetails = (NSDictionary *)v58;

    v60 = (void *)MEMORY[0x24BDBCF20];
    v61 = objc_opt_class();
    v62 = objc_opt_class();
    v63 = objc_opt_class();
    objc_msgSend(v60, "setWithObjects:", v61, v62, v63, objc_opt_class(), 0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v64, CFSTR("hiddenAppsData"));
    v65 = objc_claimAutoreleasedReturnValue();
    hiddenAppsData = v5->_hiddenAppsData;
    v5->_hiddenAppsData = (NSMutableDictionary *)v65;

    v67 = (void *)MEMORY[0x24BDBCF20];
    v68 = objc_opt_class();
    v69 = objc_opt_class();
    objc_msgSend(v67, "setWithObjects:", v68, v69, objc_opt_class(), 0);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v70, CFSTR("appsList"));
    v71 = objc_claimAutoreleasedReturnValue();
    appsList = v5->_appsList;
    v5->_appsList = (NSMutableDictionary *)v71;

    v73 = (void *)MEMORY[0x24BDBCF20];
    v74 = objc_opt_class();
    v75 = objc_opt_class();
    objc_msgSend(v73, "setWithObjects:", v74, v75, objc_opt_class(), 0);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v76, CFSTR("zeroSizeApps"));
    v77 = objc_claimAutoreleasedReturnValue();
    zeroSizeApps = v5->_zeroSizeApps;
    v5->_zeroSizeApps = (NSMutableArray *)v77;

    v79 = (void *)MEMORY[0x24BDBCF20];
    v80 = objc_opt_class();
    v81 = objc_opt_class();
    v82 = objc_opt_class();
    objc_msgSend(v79, "setWithObjects:", v80, v81, v82, objc_opt_class(), 0);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v83, CFSTR("appsInfo"));
    v84 = objc_claimAutoreleasedReturnValue();
    appsInfo = v5->_appsInfo;
    v5->_appsInfo = (NSDictionary *)v84;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)time
{
  return self->_time;
}

- (void)setTime:(int64_t)a3
{
  self->_time = a3;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (unint64_t)diskCapacity
{
  return self->_diskCapacity;
}

- (void)setDiskCapacity:(unint64_t)a3
{
  self->_diskCapacity = a3;
}

- (unint64_t)diskUsed
{
  return self->_diskUsed;
}

- (void)setDiskUsed:(unint64_t)a3
{
  self->_diskUsed = a3;
}

- (NSDictionary)appData
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAppData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSDictionary)systemDataDetails
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSystemDataDetails:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSDictionary)systemDetails
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSystemDetails:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSDictionary)reportedTelemetry
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setReportedTelemetry:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSMutableDictionary)pathsList
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setPathsList:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSMutableDictionary)attributionTags
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAttributionTags:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSMutableDictionary)clonesInfo
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setClonesInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSMutableDictionary)FSPurgeableData
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setFSPurgeableData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSMutableDictionary)hiddenAppsData
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (void)setHiddenAppsData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSMutableDictionary)appsList
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (void)setAppsList:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSMutableArray)zeroSizeApps
{
  return (NSMutableArray *)objc_getProperty(self, a2, 120, 1);
}

- (void)setZeroSizeApps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (unint64_t)totalCDAvailable
{
  return self->_totalCDAvailable;
}

- (void)setTotalCDAvailable:(unint64_t)a3
{
  self->_totalCDAvailable = a3;
}

- (unint64_t)totalPurgeableClones
{
  return self->_totalPurgeableClones;
}

- (void)setTotalPurgeableClones:(unint64_t)a3
{
  self->_totalPurgeableClones = a3;
}

- (NSDictionary)appsInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 144, 1);
}

- (void)setAppsInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSMutableDictionary)appsDataInternal
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 152, 1);
}

- (void)setAppsDataInternal:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (SAAppSizeBreakdownList)appSizeBreakdownList
{
  return (SAAppSizeBreakdownList *)objc_getProperty(self, a2, 160, 1);
}

- (void)setAppSizeBreakdownList:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appSizeBreakdownList, 0);
  objc_storeStrong((id *)&self->_appsDataInternal, 0);
  objc_storeStrong((id *)&self->_appsInfo, 0);
  objc_storeStrong((id *)&self->_zeroSizeApps, 0);
  objc_storeStrong((id *)&self->_appsList, 0);
  objc_storeStrong((id *)&self->_hiddenAppsData, 0);
  objc_storeStrong((id *)&self->_FSPurgeableData, 0);
  objc_storeStrong((id *)&self->_clonesInfo, 0);
  objc_storeStrong((id *)&self->_attributionTags, 0);
  objc_storeStrong((id *)&self->_pathsList, 0);
  objc_storeStrong((id *)&self->_reportedTelemetry, 0);
  objc_storeStrong((id *)&self->_systemDetails, 0);
  objc_storeStrong((id *)&self->_systemDataDetails, 0);
  objc_storeStrong((id *)&self->_appData, 0);
}

- (void)setAppSet:vendorName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1(&dword_2478E3000, v0, v1, "%s: bundlesSet (%@) not found", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)updateHiddenApp:withSUPurgeableSize:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1(&dword_2478E3000, v0, v1, "%s: bundlesSet (%@) not found", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)updateBundleID:(uint64_t)a3 WithCloneSize:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_0(&dword_2478E3000, a1, a3, "'System Data' not found, creating", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8_0();
}

- (void)updateBundleID:(uint64_t)a3 WithCloneSize:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2478E3000, a2, a3, "bundleID %@ not found, add to 'System Data'", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)updateBundleID:withDataSize:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_4_1(&dword_2478E3000, v0, v1, "bundleID %@ not found, creating with dataSize %llu");
  OUTLINED_FUNCTION_3();
}

- (void)updateBundleID:withDataSize:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_4_1(&dword_2478E3000, v0, v1, "bundleID %@ adding to dataSize %llu");
  OUTLINED_FUNCTION_3();
}

- (void)addSystemVolumeWithCapacity:(uint64_t)a3 used:(uint64_t)a4 withReplyBlock:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_0(&dword_2478E3000, a1, a3, "'System' not found, creating", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8_0();
}

- (void)initDiskUsedAndCapacity
{
  int v0;
  os_log_t v1;
  int v2[3];
  const char *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_6_0();
  v3 = "/";
  v4 = 1024;
  v5 = v0;
  _os_log_error_impl(&dword_2478E3000, v1, OS_LOG_TYPE_ERROR, "%s: Can't get volume size for %s (err %d)", (uint8_t *)v2, 0x1Cu);
  OUTLINED_FUNCTION_9_0();
}

@end
