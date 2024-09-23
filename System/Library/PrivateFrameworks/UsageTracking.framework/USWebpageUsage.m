@implementation USWebpageUsage

- (USWebpageUsage)initWithURL:(id)a3 context:(id)a4 eventStorage:(id)a5 source:(id)a6 bundleIdentifier:(id)a7 profileIdentifier:(id)a8 usageTrusted:(BOOL)a9
{
  __CFString *v16;
  id v17;
  id v18;
  USWebpageUsage *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSURL *URL;
  void *v24;
  uint64_t v25;
  NSString *uniqueIdentifier;
  uint64_t v27;
  NSString *profileIdentifier;
  uint64_t v29;
  NSMutableDictionary *contextUsageRecord;
  void *v31;
  void *v32;
  uint64_t v33;
  NSString *bundleIdentifier;
  id v36;
  id v37;
  id v38;
  objc_super v39;

  v38 = a4;
  v37 = a5;
  v36 = a6;
  v16 = (__CFString *)a7;
  v39.receiver = self;
  v39.super_class = (Class)USWebpageUsage;
  v17 = a8;
  v18 = a3;
  v19 = -[USWebpageUsage init](&v39, sel_init);
  v20 = (void *)objc_opt_new();
  objc_msgSend(v20, "normalizeURL:", v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_msgSend(v21, "copy");
  URL = v19->_URL;
  v19->_URL = (NSURL *)v22;

  v24 = (void *)objc_opt_new();
  objc_msgSend(v24, "UUIDString");
  v25 = objc_claimAutoreleasedReturnValue();
  uniqueIdentifier = v19->_uniqueIdentifier;
  v19->_uniqueIdentifier = (NSString *)v25;

  v27 = objc_msgSend(v17, "copy");
  profileIdentifier = v19->_profileIdentifier;
  v19->_profileIdentifier = (NSString *)v27;

  objc_storeStrong((id *)&v19->_context, a4);
  objc_storeStrong((id *)&v19->_eventStorage, a5);
  objc_storeStrong((id *)&v19->_source, a6);
  v19->_state = 0;
  v19->_usageTrusted = a9;
  v29 = objc_opt_new();
  contextUsageRecord = v19->_contextUsageRecord;
  v19->_contextUsageRecord = (NSMutableDictionary *)v29;

  +[USWebpageUsage getProcessIdentifier](USWebpageUsage, "getProcessIdentifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (!v16)
    v16 = v31;
  if (objc_msgSend(v32, "isEqualToString:", CFSTR("com.apple.SafariViewService")))
  {

    v16 = CFSTR("com.apple.mobilesafari");
  }
  v33 = -[__CFString copy](v16, "copy");
  bundleIdentifier = v19->_bundleIdentifier;
  v19->_bundleIdentifier = (NSString *)v33;

  return v19;
}

- (USWebpageUsage)initWithURL:(id)a3 bundleIdentifier:(id)a4 auditToken:(id *)a5
{
  id v7;
  id v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  USWebpageUsage *v16;
  uint64_t v18;

  v7 = a4;
  v8 = a3;
  v9 = +[USUsageTrust validateTrustForSecTask:](USUsageTrust, "validateTrustForSecTask:", 0);
  objc_msgSend(MEMORY[0x24BE1B170], "userContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B0B0], "userKnowledgeStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  BiomeLibrary();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "App");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "WebUsage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "source");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v18) = v9;
  v16 = -[USWebpageUsage initWithURL:context:eventStorage:source:bundleIdentifier:profileIdentifier:usageTrusted:](self, "initWithURL:context:eventStorage:source:bundleIdentifier:profileIdentifier:usageTrusted:", v8, v10, v11, v15, v7, 0, v18);

  return v16;
}

- (USWebpageUsage)initWithURL:(id)a3 bundleIdentifier:(id)a4 profileIdentifier:(id)a5
{
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  USWebpageUsage *v18;
  uint64_t v20;

  v8 = initWithURL_bundleIdentifier_profileIdentifier__onceToken;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  if (v8 != -1)
    dispatch_once(&initWithURL_bundleIdentifier_profileIdentifier__onceToken, &__block_literal_global_3);
  objc_msgSend(MEMORY[0x24BE1B170], "userContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B0B0], "userKnowledgeStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  BiomeLibrary();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "App");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "WebUsage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "source");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v20) = initWithURL_bundleIdentifier_profileIdentifier__trusted;
  v18 = -[USWebpageUsage initWithURL:context:eventStorage:source:bundleIdentifier:profileIdentifier:usageTrusted:](self, "initWithURL:context:eventStorage:source:bundleIdentifier:profileIdentifier:usageTrusted:", v11, v12, v13, v17, v10, v9, v20);

  return v18;
}

BOOL __65__USWebpageUsage_initWithURL_bundleIdentifier_profileIdentifier___block_invoke()
{
  _BOOL8 result;

  result = +[USUsageTrust validateTrustForSecTask:](USUsageTrust, "validateTrustForSecTask:", 0);
  initWithURL_bundleIdentifier_profileIdentifier__trusted = result;
  return result;
}

- (USWebpageUsage)initWithURL:(id)a3 bundleIdentifier:(id)a4
{
  return -[USWebpageUsage initWithURL:bundleIdentifier:profileIdentifier:](self, "initWithURL:bundleIdentifier:profileIdentifier:", a3, a4, 0);
}

- (USWebpageUsage)initWithURL:(id)a3
{
  return -[USWebpageUsage initWithURL:bundleIdentifier:](self, "initWithURL:bundleIdentifier:", a3, 0);
}

- (void)dealloc
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2_0(&dword_20D894000, MEMORY[0x24BDACB70], v0, "Tried to create Duet event with start date %@ later than end date %@", v1, v2, v3, v4, v5);
}

void __25__USWebpageUsage_dealloc__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;

  v5 = a3;
  if ((a2 & 1) == 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __25__USWebpageUsage_dealloc__block_invoke_cold_1(a1, (uint64_t)v5);

}

- (id)description
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = self->_contextUsageRecord;
  objc_sync_enter(v3);
  v4 = (void *)-[NSMutableDictionary copy](self->_contextUsageRecord, "copy");
  objc_sync_exit(v3);

  v5 = (void *)MEMORY[0x24BDD17C8];
  v10.receiver = self;
  v10.super_class = (Class)USWebpageUsage;
  -[USWebpageUsage description](&v10, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[USWebpageUsage URL](self, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@ %@"), v6, v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)getProcessIdentifier
{
  __CFBundle *MainBundle;
  __CFString *Identifier;
  __CFString *v4;
  void *v5;

  MainBundle = CFBundleGetMainBundle();
  Identifier = (__CFString *)CFBundleGetIdentifier(MainBundle);
  if (Identifier)
  {
    v4 = Identifier;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "processName");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)changeState:(int64_t)a3 completionHandler:(id)a4
{
  NSMutableDictionary *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  char v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSMutableDictionary *obj;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[4];
  id v55;
  id v56;
  USWebpageUsage *v57;
  id v58;
  void *v59;
  id v60;
  id v61;
  void *v62;
  _QWORD v63[7];
  _QWORD v64[7];
  _QWORD v65[6];
  _QWORD v66[6];
  uint8_t buf[4];
  void *v68;
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v49 = a4;
  v48 = (void *)objc_opt_new();
  -[USWebpageUsage URL](self, "URL");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "host");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (v50)
  {
    objc_msgSend(MEMORY[0x24BE1B180], "appWebUsageType");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = self->_contextUsageRecord;
    objc_sync_enter(v6);
    obj = v6;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_contextUsageRecord, "objectForKeyedSubscript:", v47);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0x24BE1B000;
    v43 = v7;
    switch(a3)
    {
      case 0:
        if (v7)
        {
          v45 = (void *)-[NSMutableDictionary copy](self->_contextUsageRecord, "copy");
          -[NSMutableDictionary removeAllObjects](self->_contextUsageRecord, "removeAllObjects");
          v9 = 0;
        }
        else
        {
          v9 = 0;
          v45 = 0;
        }
        v11 = 1;
        v10 = 1;
        goto LABEL_26;
      case 1:
        if (v7)
        {
          if (!objc_msgSend(v7, "integerValue"))
          {
            v9 = 0;
            v45 = 0;
            v10 = 2;
            goto LABEL_18;
          }
          v45 = (void *)-[NSMutableDictionary copy](self->_contextUsageRecord, "copy");
          v11 = 0;
        }
        else
        {
          v11 = 0;
          v45 = 0;
        }
        v10 = 2;
        v9 = &unk_24C7E0620;
        goto LABEL_26;
      case 2:
        if (v7)
        {
          if (objc_msgSend(v7, "integerValue") == 1)
          {
            v9 = 0;
            v45 = 0;
            v10 = 3;
LABEL_18:
            v11 = 1;
LABEL_26:
            -[USWebpageUsage bundleIdentifier](self, "bundleIdentifier");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = v9;
            -[USWebpageUsage profileIdentifier](self, "profileIdentifier");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[USWebpageUsage usageTrusted](self, "usageTrusted"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (-[USWebpageUsage state](self, "state") != (_DWORD)v10)
            {
              v14 = objc_alloc(MEMORY[0x24BE0C2A8]);
              -[USWebpageUsage uniqueIdentifier](self, "uniqueIdentifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = v51;
              objc_msgSend(v16, "absoluteString");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = v17;
              if (v17)
              {
                v19 = v17;
              }
              else
              {
                objc_msgSend(v16, "relativeString");
                v19 = (id)objc_claimAutoreleasedReturnValue();
              }
              v20 = v19;

              v21 = (void *)objc_msgSend(v14, "initWithUniqueID:absoluteTimestamp:usageState:webpageURL:webDomain:applicationID:deviceID:isUsageTrusted:safariProfileID:", v15, v48, v10, v20, v50, v46, 0, v13, v12);
              -[USWebpageUsage source](self, "source");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "sendEvent:", v21);

              -[USWebpageUsage setState:](self, "setState:", v10);
              v8 = 0x24BE1B000uLL;
            }
            if ((v11 & 1) != 0)
            {
              v23 = 0;
            }
            else
            {
              objc_msgSend(*(id *)(v8 + 384), "appWebUsageWepageURL");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(v8 + 384), "appWebUsageWebDomain");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(v8 + 384), "appWebUsageStartDate");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(v8 + 384), "appWebUsageBundleID");
              v27 = objc_claimAutoreleasedReturnValue();
              v28 = v8;
              v29 = (void *)v27;
              objc_msgSend(*(id *)(v28 + 384), "isUsageTrusted");
              v30 = objc_claimAutoreleasedReturnValue();
              v31 = (void *)v30;
              if (v12)
              {
                objc_msgSend(MEMORY[0x24BE1B180], "appUsageSafariProfileID");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v63[0] = v24;
                v63[1] = v25;
                v64[0] = v51;
                v64[1] = v50;
                v63[2] = v47;
                v63[3] = v26;
                v64[2] = v42;
                v64[3] = v48;
                v63[4] = v29;
                v63[5] = v32;
                v64[4] = v46;
                v64[5] = v12;
                v63[6] = v31;
                v64[6] = v13;
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v64, v63, 7);
                v23 = (void *)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v65[0] = v24;
                v65[1] = v25;
                v66[0] = v51;
                v66[1] = v50;
                v65[2] = v47;
                v65[3] = v26;
                v66[2] = v42;
                v66[3] = v48;
                v65[4] = v29;
                v65[5] = v30;
                v66[4] = v46;
                v66[5] = v13;
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v66, v65, 6);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
              }
              -[NSMutableDictionary setDictionary:](self->_contextUsageRecord, "setDictionary:", v23);

            }
            objc_sync_exit(obj);

            if (v45)
            {
              v54[0] = MEMORY[0x24BDAC760];
              v54[1] = 3221225472;
              v54[2] = __48__USWebpageUsage_changeState_completionHandler___block_invoke;
              v54[3] = &unk_24C7DB870;
              v33 = v45;
              v55 = v33;
              v56 = v48;
              v57 = self;
              v58 = v49;
              v34 = (void *)MEMORY[0x212BAB2A0](v54);
              -[USWebpageUsage context](self, "context");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              if (v23)
              {
                v62 = v23;
                objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v62, 1);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v61 = v33;
                objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v61, 1);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BE1B180], "keyPathForAppWebUsageDataDictionaries");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "addObjects:andRemoveObjects:fromArrayAtKeyPath:responseQueue:withCompletion:", v36, v37, v38, 0, v34);

              }
              else
              {
                v60 = v33;
                objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v60, 1);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BE1B180], "keyPathForAppWebUsageDataDictionaries");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "removeObjects:fromArrayAtKeyPath:responseQueue:withCompletion:", v36, v37, 0, v34);
              }

            }
            else if (v23)
            {
              -[USWebpageUsage context](self, "context");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v59 = v23;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v59, 1);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BE1B180], "keyPathForAppWebUsageDataDictionaries");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v52[0] = MEMORY[0x24BDAC760];
              v52[1] = 3221225472;
              v52[2] = __48__USWebpageUsage_changeState_completionHandler___block_invoke_3;
              v52[3] = &unk_24C7DB898;
              v53 = v49;
              objc_msgSend(v39, "addObjects:toArrayAtKeyPath:responseQueue:withCompletion:", v40, v41, 0, v52);

            }
            else if (v49)
            {
              (*((void (**)(id, _QWORD))v49 + 2))(v49, 0);
            }

            goto LABEL_45;
          }
          v45 = (void *)-[NSMutableDictionary copy](self->_contextUsageRecord, "copy");
          v11 = 0;
        }
        else
        {
          v11 = 0;
          v45 = 0;
        }
        v10 = 3;
        v9 = &unk_24C7E0638;
        goto LABEL_26;
    }
    v9 = 0;
    v10 = 0;
    v45 = 0;
    goto LABEL_18;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138739971;
    v68 = v51;
    _os_log_impl(&dword_20D894000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "No hostname for URL %{sensitive}@", buf, 0xCu);
  }
  if (v49)
    (*((void (**)(id, _QWORD))v49 + 2))(v49, 0);
LABEL_45:

}

void __48__USWebpageUsage_changeState_completionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v1 = *(void **)(a1 + 40);
  v2 = *(id *)(a1 + 32);
  v3 = v1;
  objc_msgSend(MEMORY[0x24BE1B180], "appWebUsageWepageURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B180], "appWebUsageWebDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B180], "appWebUsageType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B180], "isUsageTrusted");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B180], "appWebUsageStartDate");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B180], "appWebUsageBundleID");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B180], "appUsageSafariProfileID");
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B078], "webpageURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B078], "webDomain");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B078], "usageType");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B078], "safariProfileID");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B078], "isUsageTrusted");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B130], "appWebUsageStream");
  v11 = objc_claimAutoreleasedReturnValue();
  v39 = (void *)v7;
  objc_msgSend(v2, "objectForKeyedSubscript:", v7);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)v8;
  v12 = (void *)v11;
  if (objc_msgSend(v36, "compare:", v3) == 1)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    {
      -[USWebpageUsage dealloc].cold.1();
      v15 = v36;
      v13 = 0;
      v14 = (void *)v9;
      v16 = a1;
    }
    else
    {
      v13 = 0;
      v14 = (void *)v9;
      v15 = v36;
      v16 = a1;
    }
  }
  else
  {
    v34 = v3;
    v35 = v6;
    v17 = (void *)MEMORY[0x24BE1B050];
    objc_msgSend(v2, "objectForKeyedSubscript:", v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "withBundle:", v18);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = (void *)v9;
    objc_msgSend(v2, "objectForKeyedSubscript:", v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v5;
    v33 = v4;
    if (v19)
    {
      v48 = v10;
      objc_msgSend(v2, "objectForKeyedSubscript:", v4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v20;
      v49 = v43;
      objc_msgSend(v2, "objectForKeyedSubscript:", v5);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v21;
      v50 = v42;
      objc_msgSend(v2, "objectForKeyedSubscript:", v35);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v22;
      v56 = v19;
      v51 = v40;
      v52 = v41;
      objc_msgSend(v2, "objectForKeyedSubscript:", v44);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v23;
      v24 = (void *)MEMORY[0x24BDBCE70];
      v25 = 5;
    }
    else
    {
      v48 = v10;
      objc_msgSend(v2, "objectForKeyedSubscript:", v4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v20;
      v49 = v43;
      objc_msgSend(v2, "objectForKeyedSubscript:", v5);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v21;
      v50 = v42;
      objc_msgSend(v2, "objectForKeyedSubscript:", v35);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v22;
      v51 = v41;
      objc_msgSend(v2, "objectForKeyedSubscript:", v44);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v23;
      v24 = (void *)MEMORY[0x24BDBCE70];
      v25 = 4;
    }
    objc_msgSend(v24, "dictionaryWithObjects:forKeys:count:", &v53, &v48, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = a1;

    v3 = v34;
    objc_msgSend(MEMORY[0x24BE1B080], "eventWithStream:startDate:endDate:value:metadata:", v12, v36, v34, v30, v26);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v36;
    v5 = v32;
    v4 = v33;
    v6 = v35;
    v14 = v31;
  }

  if (v13)
  {
    objc_msgSend(*(id *)(v16 + 48), "eventStorage");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v47, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = MEMORY[0x24BDAC760];
    v45[1] = 3221225472;
    v45[2] = __48__USWebpageUsage_changeState_completionHandler___block_invoke_2;
    v45[3] = &unk_24C7DB848;
    v46 = *(id *)(v16 + 56);
    objc_msgSend(v27, "saveObjects:responseQueue:withCompletion:", v28, 0, v45);

  }
  else
  {
    v29 = *(_QWORD *)(v16 + 56);
    if (v29)
      (*(void (**)(uint64_t, _QWORD))(v29 + 16))(v29, 0);
  }

}

uint64_t __48__USWebpageUsage_changeState_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

uint64_t __48__USWebpageUsage_changeState_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (NSURL)URL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)uniqueIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)profileIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)usageTrusted
{
  return self->_usageTrusted;
}

- (_CDAsyncLocalContext)context
{
  return (_CDAsyncLocalContext *)objc_getProperty(self, a2, 56, 1);
}

- (_DKKnowledgeSaving)eventStorage
{
  return (_DKKnowledgeSaving *)objc_getProperty(self, a2, 64, 1);
}

- (BMSource)source
{
  return (BMSource *)objc_getProperty(self, a2, 72, 1);
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_eventStorage, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_contextUsageRecord, 0);
}

void __25__USWebpageUsage_dealloc__block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 138740483;
  v5 = v2;
  v6 = 2112;
  v7 = v3;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_20D894000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to reset web page usage to not-in-use on dealloc for URL %{sensitive}@ and bundle identifier %@ with error: %@", (uint8_t *)&v4, 0x20u);
}

@end
