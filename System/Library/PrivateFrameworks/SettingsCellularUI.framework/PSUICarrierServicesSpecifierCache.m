@implementation PSUICarrierServicesSpecifierCache

+ (id)sharedInstance
{
  if (qword_253E96F98 != -1)
    dispatch_once(&qword_253E96F98, &__block_literal_global_1);
  return (id)_MergedGlobals_55;
}

void __51__PSUICarrierServicesSpecifierCache_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[PSUICarrierServicesSpecifierCache initPrivate]([PSUICarrierServicesSpecifierCache alloc], "initPrivate");
  v1 = (void *)_MergedGlobals_55;
  _MergedGlobals_55 = (uint64_t)v0;

}

- (id)initPrivate
{
  PSUICarrierServicesSpecifierCache *v2;
  id v3;
  void *v4;
  uint64_t v5;
  CoreTelephonyClient *client;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PSUICarrierServicesSpecifierCache;
  v2 = -[PSUICarrierServicesSpecifierCache init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BDC2810]);
    objc_msgSend(MEMORY[0x24BE856B8], "createCTClientSerialQueue:", CFSTR("carrier_services_cache"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "initWithQueue:", v4);
    client = v2->_client;
    v2->_client = (CoreTelephonyClient *)v5;

    -[CoreTelephonyClient setDelegate:](v2->_client, "setDelegate:", v2);
    -[PSUICarrierServicesSpecifierCache clearCache](v2, "clearCache");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel_clearCache, *MEMORY[0x24BEBE008], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel_clearCache, 0x24D506868, 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel_clearCache, CFSTR("PSNewCarrierNotification"), 0);

  }
  return v2;
}

- (PSUICarrierServicesSpecifierCache)init
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  -[PSUICarrierServicesSpecifierCache getLogger](self, "getLogger");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = 136315138;
    v4 = "-[PSUICarrierServicesSpecifierCache init]";
    _os_log_error_impl(&dword_2161C6000, v2, OS_LOG_TYPE_ERROR, "Error: unsupported initializer called: %s", (uint8_t *)&v3, 0xCu);
  }

  objc_exception_throw((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE88]), "initWithName:reason:userInfo:", CFSTR("Unsupported initializer"), CFSTR("Unsupported initializer called"), 0));
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:", self);
  v4.receiver = self;
  v4.super_class = (Class)PSUICarrierServicesSpecifierCache;
  -[PSUICarrierServicesSpecifierCache dealloc](&v4, sel_dealloc);
}

- (void)clearCache
{
  NSObject *v3;
  NSMutableDictionary *specifiersDict;
  NSMutableDictionary *mmsInfoSpecifiersDict;
  uint8_t v6[16];

  -[PSUICarrierServicesSpecifierCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "Clearing carrier services cache", v6, 2u);
  }

  specifiersDict = self->_specifiersDict;
  self->_specifiersDict = 0;

  mmsInfoSpecifiersDict = self->_mmsInfoSpecifiersDict;
  self->_mmsInfoSpecifiersDict = 0;

}

- (id)mmsInfoSpecifierWithTarget:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSMutableDictionary *mmsInfoSpecifiersDict;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  mmsInfoSpecifiersDict = self->_mmsInfoSpecifiersDict;
  if (!mmsInfoSpecifiersDict)
  {
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v15 = self->_mmsInfoSpecifiersDict;
    self->_mmsInfoSpecifiersDict = v14;

    v11 = 0;
LABEL_6:
    v13 = -[PSUICarrierServicesSpecifierCache newMMSInfoSpecifierWithTarget:context:](self, "newMMSInfoSpecifierWithTarget:context:", v6, v8);

    v16 = self->_mmsInfoSpecifiersDict;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v8, "slotID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v13, v17);

    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v7, "slotID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](mmsInfoSpecifiersDict, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    goto LABEL_6;
  objc_msgSend(v11, "target");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v13 = v11;
  if (v12 != v6)
    goto LABEL_6;
LABEL_7:

  return v13;
}

- (id)newMMSInfoSpecifierWithTarget:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char *v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  +[PSUICoreTelephonyCarrierBundleCache sharedInstance](PSUICoreTelephonyCarrierBundleCache, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mmsInfoUrl:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "length"))
  {
    v9 = (char *)objc_alloc_init(MEMORY[0x24BE75590]);
    objc_msgSend(v9, "setButtonAction:", sel_openURLWithSpecifier_);
    *(_QWORD *)&v9[*MEMORY[0x24BE75738]] = 13;
    objc_storeWeak((id *)&v9[*MEMORY[0x24BE75768]], v5);
    objc_msgSend(v9, "setIdentifier:", CFSTR("MMS_INFO"));
    +[PSUICoreTelephonyCarrierBundleCache sharedInstance](PSUICoreTelephonyCarrierBundleCache, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "mmsInfoTitle:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setName:", v11);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)fetchSpecifiers
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  char *v17;
  char *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  PSUIMyAccountSpecifier *v27;
  void *v28;
  PSUIMyAccountSpecifier *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  PSUICarrierServicesSpecifierCache *v35;
  NSMutableDictionary *specifiersDict;
  id obj;
  uint64_t v38;
  NSMutableDictionary *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  uint64_t v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  -[PSUICarrierServicesSpecifierCache getLogger](self, "getLogger");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v57 = "-[PSUICarrierServicesSpecifierCache fetchSpecifiers]";
    _os_log_impl(&dword_2161C6000, v2, OS_LOG_TYPE_DEFAULT, "%s executing fetch", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subscriptionContexts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = v4;
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
  if (v40)
  {
    v38 = *(_QWORD *)v53;
    v43 = *MEMORY[0x24BE75CE8];
    v44 = *MEMORY[0x24BE75DA0];
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v53 != v38)
          objc_enumerationMutation(obj);
        v41 = v5;
        v6 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v5);
        v7 = objc_alloc(MEMORY[0x24BDBCEB8]);
        objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_msgSend(v7, "initWithObjects:", v8, 0);

        +[PSUICoreTelephonyCarrierBundleCache sharedInstance](PSUICoreTelephonyCarrierBundleCache, "sharedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "carrierServices:", v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        +[PSUICoreTelephonyCarrierBundleCache sharedInstance](PSUICoreTelephonyCarrierBundleCache, "sharedInstance");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v12, "showServiceCodes:", v6);

        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v42 = v11;
        v13 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
        if (v13)
        {
          v14 = v13;
          v45 = *(_QWORD *)v49;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v49 != v45)
                objc_enumerationMutation(v42);
              v16 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
              v17 = (char *)objc_alloc_init(MEMORY[0x24BE75590]);
              objc_msgSend(v17, "setButtonAction:", sel_dialCarrierServiceNumber_);
              *(_QWORD *)&v17[*MEMORY[0x24BE75738]] = 4;
              v18 = sel_readPreference_;
              if (!v46)
                v18 = 0;
              *(_QWORD *)&v17[*MEMORY[0x24BE75750]] = v18;
              objc_storeWeak((id *)&v17[*MEMORY[0x24BE75768]], self);
              objc_msgSend(v16, "objectForKey:", CFSTR("ServiceName"));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if (v19)
              {
                v20 = v9;
                +[PSUICoreTelephonyCarrierBundleCache sharedInstance](PSUICoreTelephonyCarrierBundleCache, "sharedInstance");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = v6;
                objc_msgSend(v21, "carrierServiceNameForServiceName:context:", v19, v6);
                v23 = (void *)objc_claimAutoreleasedReturnValue();

                if (objc_msgSend(v23, "length"))
                {
                  v24 = v23;

                  v19 = v24;
                }
                v9 = v20;

                v6 = v22;
              }
              objc_msgSend(v17, "setName:", v19);
              objc_msgSend(v16, "objectForKey:", CFSTR("ServiceCode"));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "setProperty:forKey:", v25, v44);

              objc_msgSend(v17, "setProperty:forKey:", v6, v43);
              objc_msgSend(v9, "addObject:", v17);

            }
            v14 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
          }
          while (v14);
        }

        if (objc_msgSend(v42, "count"))
        {
          objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v26);

        }
        v27 = [PSUIMyAccountSpecifier alloc];
        +[PSUICoreTelephonyCarrierBundleCache sharedInstance](PSUICoreTelephonyCarrierBundleCache, "sharedInstance");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = -[PSUIMyAccountSpecifier initWithContext:cbCache:](v27, "initWithContext:cbCache:", v6, v28);

        if (v29)
          objc_msgSend(v9, "addObject:", v29);
        -[PSUICarrierServicesSpecifierCache mmsInfoSpecifierWithTarget:context:](self, "mmsInfoSpecifierWithTarget:context:", self, v6);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30)
        {
          if (v29)
          {
            objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v31);

          }
          objc_msgSend(v9, "addObject:", v30);
        }
        -[PSUICarrierServicesSpecifierCache getLogger](self, "getLogger");
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          v33 = objc_msgSend(v9, "count");
          *(_DWORD *)buf = 136315650;
          v57 = "-[PSUICarrierServicesSpecifierCache fetchSpecifiers]";
          v58 = 2112;
          v59 = v6;
          v60 = 2048;
          v61 = v33;
          _os_log_impl(&dword_2161C6000, v32, OS_LOG_TYPE_DEFAULT, "%s fetch succeeded: %@, %lu", buf, 0x20u);
        }

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v6, "slotID"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v39, "setObject:forKeyedSubscript:", v9, v34);

        v5 = v41 + 1;
      }
      while (v41 + 1 != v40);
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
    }
    while (v40);
  }

  v35 = self;
  objc_sync_enter(v35);
  specifiersDict = v35->_specifiersDict;
  v35->_specifiersDict = v39;

  objc_sync_exit(v35);
}

- (id)specifiers:(id)a3
{
  id v4;
  void *v5;
  PSUICarrierServicesSpecifierCache *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[PSUICarrierServicesSpecifierCache specifiersDict](self, "specifiersDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[PSUICarrierServicesSpecifierCache fetchSpecifiers](self, "fetchSpecifiers");
  v6 = self;
  objc_sync_enter(v6);
  -[PSUICarrierServicesSpecifierCache specifiersDict](v6, "specifiersDict");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "slotID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v6);
  return v9;
}

- (id)readPreference:(id)a3
{
  return (id)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75DA0]);
}

- (void)dialCarrierServiceNumber:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BE75CE8];
  v5 = a3;
  objc_msgSend(v5, "propertyForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "propertyForKey:", *MEMORY[0x24BE75DA0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PSUICarrierServicesSpecifierCache getLogger](self, "getLogger");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v7;
    _os_log_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEFAULT, "Dialing carrier service number %@", buf, 0xCu);
  }

  v9 = objc_alloc_init(MEMORY[0x24BEB4950]);
  v10 = objc_alloc(MEMORY[0x24BEB49D0]);
  objc_msgSend(v9, "telephonyProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithProvider:", v11);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB49E8]), "initWithType:value:", 2, v7);
  objc_msgSend(v12, "setHandle:", v13);

  objc_msgSend(v6, "uuid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLocalSenderIdentityUUID:", v14);

  objc_msgSend(v12, "setPerformDialAssist:", 0);
  objc_msgSend(v12, "setPerformLocalDialAssist:", 0);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __62__PSUICarrierServicesSpecifierCache_dialCarrierServiceNumber___block_invoke;
  v16[3] = &unk_24D501858;
  v16[4] = self;
  v17 = v12;
  v15 = v12;
  objc_msgSend(v9, "launchAppForDialRequest:completion:", v15, v16);

}

void __62__PSUICarrierServicesSpecifierCache_dialCarrierServiceNumber___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "getLogger");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v6 = 138412546;
      v7 = v5;
      v8 = 2112;
      v9 = v3;
      _os_log_error_impl(&dword_2161C6000, v4, OS_LOG_TYPE_ERROR, "Error launching app for service number dial request %@: %@", (uint8_t *)&v6, 0x16u);
    }

  }
}

- (void)openURLWithSpecifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(a3, "propertyForKey:", CFSTR("url"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLWithString:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v5 = (void *)*MEMORY[0x24BEBDF78];
  v6 = (void *)objc_opt_new();
  objc_msgSend(v5, "openURL:options:completionHandler:", v7, v6, 0);

}

- (void)carrierBundleChange:(id)a3
{
  PSUICarrierServicesSpecifierCache *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[PSUICarrierServicesSpecifierCache clearCache](v4, "clearCache");
  objc_sync_exit(v4);

}

- (void)simStatusDidChange:(id)a3 status:(id)a4
{
  id v6;
  PSUICarrierServicesSpecifierCache *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  -[PSUICarrierServicesSpecifierCache clearCache](v7, "clearCache");
  objc_sync_exit(v7);

}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("CarrierServicesSpecifierCache"));
}

- (CoreTelephonyClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (NSMutableDictionary)specifiersDict
{
  return self->_specifiersDict;
}

- (void)setSpecifiersDict:(id)a3
{
  objc_storeStrong((id *)&self->_specifiersDict, a3);
}

- (NSMutableDictionary)mmsInfoSpecifiersDict
{
  return self->_mmsInfoSpecifiersDict;
}

- (void)setMmsInfoSpecifiersDict:(id)a3
{
  objc_storeStrong((id *)&self->_mmsInfoSpecifiersDict, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mmsInfoSpecifiersDict, 0);
  objc_storeStrong((id *)&self->_specifiersDict, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end
