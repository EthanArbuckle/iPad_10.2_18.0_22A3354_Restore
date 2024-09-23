@implementation PSUINetworkSlicingController

- (PSUINetworkSlicingController)init
{
  void *v3;
  PSUINetworkSlicingController *v4;

  +[PSUICoreTelephonyCapabilitiesCache sharedInstance](PSUICoreTelephonyCapabilitiesCache, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PSUINetworkSlicingController initWithCapabilityCache:](self, "initWithCapabilityCache:", v3);

  return v4;
}

- (PSUINetworkSlicingController)initWithCapabilityCache:(id)a3
{
  id v5;
  PSUINetworkSlicingController *v6;
  PSUINetworkSlicingController *v7;
  NSArray *fCategories;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PSUINetworkSlicingController;
  v6 = -[PSUINetworkSlicingController init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_capabilityCache, a3);
    fCategories = v7->_fCategories;
    v7->_fCategories = 0;

  }
  return v7;
}

- (id)specifiers
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  uint64_t v27;
  id obj;
  void *v29;
  void *v30;
  PSUINetworkSlicingController *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
  if (!v3)
  {
    v27 = (int)*MEMORY[0x24BE756E0];
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A8]), "propertyForKey:", *MEMORY[0x24BE75CE8]);
    v4 = objc_claimAutoreleasedReturnValue();
    -[PSUINetworkSlicingController getLogger](self, "getLogger");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v4;
      _os_log_debug_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEBUG, "Slicing: reload, context=%@", buf, 0xCu);
    }

    v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("NetworkSlicingGroupSpecifierKey"));
    v29 = v6;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v30);
    -[PSUICoreTelephonyCapabilitiesCache networkSlicingCategories:](self->_capabilityCache, "networkSlicingCategories:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUINetworkSlicingController setFCategories:](self, "setFCategories:", v7);

    -[PSUINetworkSlicingController getLogger](self, "getLogger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      -[PSUINetworkSlicingController fCategories](self, "fCategories");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v38 = v4;
      v39 = 2112;
      v40 = v25;
      _os_log_debug_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEBUG, "Slicing: reload, context=%@, categories:%@", buf, 0x16u);

    }
    v26 = (void *)v4;

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v31 = self;
    -[PSUINetworkSlicingController fCategories](self, "fCategories");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v33;
      v12 = *MEMORY[0x24BDC2AC8];
      v13 = *MEMORY[0x24BDC2AC0];
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v33 != v11)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          v16 = (void *)MEMORY[0x24BE75590];
          objc_msgSend(v15, "objectForKey:", v12);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v17, v31, sel_setNetworkSlicingAppCategory_specifier_, sel_getNetworkSlicingAppCategory_, 0, 6, 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "objectForKey:", v13);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setIdentifier:", v20);

          objc_msgSend(v18, "setUserInfo:", v19);
          objc_msgSend(v29, "ps_addSpecifier:toGroup:", v18, v30);

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v10);
    }

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("CONSUMER_SLICING_FOOTER"), &stru_24D5028C8, CFSTR("Cellular"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v30, "setProperty:forKey:", v22, *MEMORY[0x24BE75A68]);
    objc_msgSend(MEMORY[0x24BE856B8], "logSpecifiers:origin:", v29, CFSTR("[PSUINetworkSlicingController specifiers] end"));
    v23 = *(Class *)((char *)&v31->super.super.super.super.super.isa + v27);
    *(Class *)((char *)&v31->super.super.super.super.super.isa + v27) = (Class)v29;

    v3 = *(Class *)((char *)&v31->super.super.super.super.super.isa + v27);
  }
  return v3;
}

- (id)getNetworkSlicingAppCategory:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  int v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[PSUINetworkSlicingController fCategories](self, "fCategories", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    v9 = *MEMORY[0x24BDC2AC0];
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKey:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isEqual:", v4))
        {
          objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BDC2AD0]);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v14, "BOOLValue");

          goto LABEL_11;
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  -[PSUINetworkSlicingController getLogger](self, "getLogger");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v23 = "-[PSUINetworkSlicingController getNetworkSlicingAppCategory:]";
    v24 = 2112;
    v25 = v4;
    v26 = 1024;
    v27 = v13;
    _os_log_debug_impl(&dword_2161C6000, v15, OS_LOG_TYPE_DEBUG, "Slicing: %s category=%@ STATE=%d", buf, 0x1Cu);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)setNetworkSlicingAppCategory:(id)a3 specifier:(id)a4
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = objc_msgSend(a3, "BOOLValue");
  -[PSUINetworkSlicingController getLogger](self, "getLogger");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "userInfo");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    v14 = CFSTR("disabled");
    v16 = "-[PSUINetworkSlicingController setNetworkSlicingAppCategory:specifier:]";
    v15 = 136315650;
    if ((_DWORD)v7)
      v14 = CFSTR("enabled");
    v17 = 2112;
    v18 = v12;
    v19 = 2112;
    v20 = v14;
    _os_log_debug_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEBUG, "Slicing: %s category=%@ ->%@", (uint8_t *)&v15, 0x20u);

  }
  -[PSUINetworkSlicingController getNetworkSlicingAppCategory:](self, "getNetworkSlicingAppCategory:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if ((_DWORD)v7 == v10)
  {
    -[PSUINetworkSlicingController reloadSpecifiers](self, "reloadSpecifiers");
    -[PSUINetworkSlicingController getLogger](self, "getLogger");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v15) = 0;
      _os_log_debug_impl(&dword_2161C6000, v11, OS_LOG_TYPE_DEBUG, "Slicing: skipped", (uint8_t *)&v15, 2u);
    }
  }
  else
  {
    objc_msgSend(v6, "userInfo");
    v11 = objc_claimAutoreleasedReturnValue();
    -[PSUINetworkSlicingController _enableNetworkSlicing:categoryID:](self, "_enableNetworkSlicing:categoryID:", v7, v11);
  }

}

- (void)_enableNetworkSlicing:(BOOL)a3 categoryID:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  PSUICoreTelephonyCapabilitiesCache *capabilityCache;
  void *v18;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v4 = a3;
  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A8]), "propertyForKey:", *MEMORY[0x24BE75CE8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUINetworkSlicingController fCategories](self, "fCategories");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  if (objc_msgSend(v9, "count"))
  {
    v10 = 0;
    v11 = *MEMORY[0x24BDC2AC0];
    while (1)
    {
      objc_msgSend(v9, "objectAtIndex:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "isEqual:", v6))
        break;

      if (++v10 >= (unint64_t)objc_msgSend(v9, "count"))
        goto LABEL_7;
    }
    v14 = (void *)objc_msgSend(v12, "mutableCopy");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BDC2AD0]);

    objc_msgSend(v9, "replaceObjectAtIndex:withObject:", v10, v14);
  }
LABEL_7:
  -[PSUINetworkSlicingController setFCategories:](self, "setFCategories:", v9);
  -[PSUINetworkSlicingController getLogger](self, "getLogger");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    -[PSUINetworkSlicingController fCategories](self, "fCategories");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 136315650;
    v21 = "-[PSUINetworkSlicingController _enableNetworkSlicing:categoryID:]";
    v22 = 2112;
    v23 = v7;
    v24 = 2112;
    v25 = v19;
    _os_log_debug_impl(&dword_2161C6000, v16, OS_LOG_TYPE_DEBUG, "Slicing: %s context=%@, UDPATE=%@", (uint8_t *)&v20, 0x20u);

  }
  capabilityCache = self->_capabilityCache;
  -[PSUINetworkSlicingController fCategories](self, "fCategories");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUICoreTelephonyCapabilitiesCache setNetworkSlicingCategories:forContext:](capabilityCache, "setNetworkSlicingCategories:forContext:", v18, v7);

  -[PSUICoreTelephonyCapabilitiesCache setNetworkSlicing:enabled:category:](self->_capabilityCache, "setNetworkSlicing:enabled:category:", v7, v4, v6);
  -[PSUINetworkSlicingController reloadSpecifiers](self, "reloadSpecifiers");

}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("NetworkSlicingController"));
}

- (PSUICoreTelephonyCapabilitiesCache)capabilityCache
{
  return self->_capabilityCache;
}

- (void)setCapabilityCache:(id)a3
{
  objc_storeStrong((id *)&self->_capabilityCache, a3);
}

- (NSArray)fCategories
{
  return self->_fCategories;
}

- (void)setFCategories:(id)a3
{
  objc_storeStrong((id *)&self->_fCategories, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fCategories, 0);
  objc_storeStrong((id *)&self->_capabilityCache, 0);
}

@end
