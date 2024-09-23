@implementation TransparencyAnalytics

+ (id)logger
{
  void *v2;
  void *v3;
  int v4;
  int v5;
  TransparencyAnalytics *v6;
  void *v7;
  __objc2_class **v8;
  void *v9;
  void *v10;

  os_unfair_lock_lock((os_unfair_lock_t)&analytics_lock);
  if (!analytics)
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "processName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("transparencyd"));
    v5 = objc_msgSend(v3, "isEqualToString:", CFSTR("swtransparencyd"));
    v6 = objc_alloc_init(TransparencyAnalytics);
    v7 = (void *)analytics;
    analytics = (uint64_t)v6;

    if ((v4 & 1) != 0 || v5)
    {
      v8 = off_24DC8CB88;
      if (!v4)
        v8 = off_24DC8CB20;
      -[__objc2_class logger](*v8, "logger");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)analytics, "setSfanalytics:", v9);

    }
    objc_msgSend((id)analytics, "sfanalytics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend((id)analytics, "loadCollectionConfiguration");
      objc_msgSend((id)analytics, "setupCollection");
    }

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&analytics_lock);
  return (id)analytics;
}

- (TransparencyAnalytics)init
{
  TransparencyAnalytics *v2;
  TransparencyAnalytics *v3;
  TransparencyAnalytics *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TransparencyAnalytics;
  v2 = -[TransparencyAnalytics init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[TransparencyAnalytics setToken:](v2, "setToken:", 0xFFFFFFFFLL);
    v4 = v3;
  }

  return v3;
}

- (void)setupCollection
{
  NSObject *v3;
  const char *v4;
  _QWORD v5[4];
  id v6;
  id location;

  if (-[TransparencyAnalytics token](self, "token") == -1)
  {
    dispatch_get_global_queue(-32768, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    location = 0;
    objc_initWeak(&location, self);
    v4 = (const char *)kTransparencySFACollectionUpdateName;
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __40__TransparencyAnalytics_setupCollection__block_invoke;
    v5[3] = &unk_24DC8FBC0;
    objc_copyWeak(&v6, &location);
    notify_register_dispatch(v4, &self->_token, v3, v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);

  }
}

void __40__TransparencyAnalytics_setupCollection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint8_t v3[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_9 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_9, &__block_literal_global_48);
  v2 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_9;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21A250000, v2, OS_LOG_TYPE_DEFAULT, "SFACollection updated, reloading", v3, 2u);
  }
  objc_msgSend(WeakRetained, "loadCollectionConfiguration");

}

void __40__TransparencyAnalytics_setupCollection__block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_9;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_9 = (uint64_t)v0;

}

- (void)dealloc
{
  objc_super v3;

  if (-[TransparencyAnalytics token](self, "token") != -1)
    notify_cancel(-[TransparencyAnalytics token](self, "token"));
  v3.receiver = self;
  v3.super_class = (Class)TransparencyAnalytics;
  -[TransparencyAnalytics dealloc](&v3, sel_dealloc);
}

- (void)loadCollectionConfiguration
{
  id v2;

  -[TransparencyAnalytics sfanalytics](self, "sfanalytics");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loadCollectionConfiguration");

}

+ (void)unsetGlobalLogger
{
  void *v2;

  os_unfair_lock_lock((os_unfair_lock_t)&analytics_lock);
  v2 = (void *)analytics;
  analytics = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&analytics_lock);
}

+ (id)analyticsApplications
{
  if (analyticsApplications_onceToken != -1)
    dispatch_once(&analyticsApplications_onceToken, &__block_literal_global_54);
  return (id)analyticsApplications_applications;
}

void __46__TransparencyAnalytics_analyticsApplications__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4[0] = CFSTR("IDS");
  v4[1] = CFSTR("TLT");
  v4[2] = CFSTR("CK");
  v4[3] = CFSTR("MP");
  v4[4] = CFSTR("FT");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)analyticsApplications_applications;
  analyticsApplications_applications = v2;

}

+ (BOOL)hasInternalDiagnostics
{
  return os_variant_has_internal_diagnostics();
}

+ (id)formatEventName:(id)a3 application:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("kt%@%@"), a4, a3);
}

+ (BOOL)doWithAnalyticsForEventName:(id)a3 error:(id *)a4 block:(id)a5
{
  id v7;
  id v8;
  uint64_t (*v9)(id, id *, id *);
  id v10;
  int v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v17;
  id v18;
  id v19;

  v7 = a3;
  if (a4)
    v8 = *a4;
  else
    v8 = 0;
  v18 = 0;
  v19 = v8;
  v9 = (uint64_t (*)(id, id *, id *))*((_QWORD *)a5 + 2);
  v10 = v8;
  v11 = v9(a5, &v19, &v18);
  v12 = v19;

  v13 = v18;
  if (v11)
  {
    +[TransparencyAnalytics logger](TransparencyAnalytics, "logger");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "logSuccessForEventNamed:", v7);
  }
  else
  {
    +[TransparencyAnalytics logger](TransparencyAnalytics, "logger");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v15;
    if (v12 && v13)
    {
      objc_msgSend(v15, "logResultForEvent:hardFailure:result:withAttributes:", v7, 1, v12, v13);
    }
    else
    {
      if (!v12)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TransparencyErrorUnknown"), -120, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "logResultForEvent:hardFailure:result:", v7, 1, v17);

        goto LABEL_14;
      }
      objc_msgSend(v15, "logResultForEvent:hardFailure:result:", v7, 1, v12);
    }
  }

  if (a4 && v12)
    *a4 = objc_retainAutorelease(v12);
LABEL_14:

  return v11;
}

+ (unint64_t)doKTResultWithAnalyticsForEventName:(id)a3 validateType:(unint64_t)a4 error:(id *)a5 block:(id)a6
{
  id v8;
  id v9;
  uint64_t (*v10)(id, id *, id *);
  id v11;
  unint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v26;
  id v27;

  v8 = a3;
  if (a5)
    v9 = *a5;
  else
    v9 = 0;
  v26 = 0;
  v27 = v9;
  v10 = (uint64_t (*)(id, id *, id *))*((_QWORD *)a6 + 2);
  v11 = v9;
  v12 = v10(a6, &v27, &v26);
  v13 = v27;

  v14 = v26;
  v15 = v14;
  if (v12)
  {
    if (v12 == 1)
    {
      +[TransparencyAnalytics logger](TransparencyAnalytics, "logger");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "logSuccessForEventNamed:", v8);
      goto LABEL_17;
    }
    v19 = 0;
  }
  else
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ktSoftFailure"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "BOOLValue");

    v19 = v18 ^ 1u;
  }
  if (objc_msgSend(v8, "isEqual:", CFSTR("ktIDSPV2OptIn"), v26))
  {
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("peerOptIn"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEqual:", CFSTR("On"));

    if (v21)
    {
      +[TransparencyAnalytics formatEventName:application:](TransparencyAnalytics, "formatEventName:application:", CFSTR("PV2OptInBoth"), CFSTR("IDS"));
      v22 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v22;
    }
  }
  +[TransparencyAnalytics logger](TransparencyAnalytics, "logger");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v23;
  if (v13 && v15)
  {
    objc_msgSend(v23, "logResultForEvent:hardFailure:result:withAttributes:", v8, v19, v13, v15);
  }
  else
  {
    if (!v13)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TransparencyErrorUnknown"), -120, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "logResultForEvent:hardFailure:result:", v8, v19, v24);

      goto LABEL_21;
    }
    objc_msgSend(v23, "logResultForEvent:hardFailure:result:", v8, v19, v13);
  }
LABEL_17:

  if (a5 && v13)
    *a5 = objc_retainAutorelease(v13);
LABEL_21:

  return v12;
}

+ (unint64_t)doKTResultWithAnalyticsForEventName:(id)a3 error:(id *)a4 block:(id)a5
{
  id v7;
  id v8;
  unint64_t v9;

  v7 = a5;
  v8 = a3;
  v9 = objc_msgSend((id)objc_opt_class(), "doKTResultWithAnalyticsForEventName:validateType:error:block:", v8, 0, a4, v7);

  return v9;
}

+ (id)errorChain:(id)a3 depth:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _QWORD v32[2];
  _QWORD v33[4];

  v33[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (a4 <= 5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v32[0] = CFSTR("domain");
    objc_msgSend(v6, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = CFSTR("code");
    v33[0] = v7;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v6, "code"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    objc_msgSend(v6, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = a4 + 1;
    objc_msgSend(a1, "errorChain:depth:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, CFSTR("child"));

    objc_msgSend(v6, "userInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x24BDD10D8]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = v10;
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v18 = v16;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v28;
        do
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v28 != v21)
              objc_enumerationMutation(v18);
            objc_msgSend(a1, "errorChain:depth:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v22), v13);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (v23)
              objc_msgSend(v17, "addObject:", v23);

            ++v22;
          }
          while (v20 != v22);
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        }
        while (v20);
      }

      v10 = v26;
      if (objc_msgSend(v17, "count"))
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v17, CFSTR("multiple"));

    }
    v24 = v10;

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

+ (id)analyticsErrorData:(id)a3
{
  return +[TransparencyAnalytics errorChain:depth:](TransparencyAnalytics, "errorChain:depth:", a3, 0);
}

- (void)logSuccessForEventNamed:(id)a3
{
  id v4;
  SFAnalytics *sfanalytics;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  sfanalytics = self->_sfanalytics;
  if (sfanalytics)
  {
    -[SFAnalytics logSuccessForEventNamed:](sfanalytics, "logSuccessForEventNamed:", v4);
  }
  else
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __49__TransparencyAnalytics_logSuccessForEventNamed___block_invoke;
    v6[3] = &unk_24DC8FBE8;
    v7 = v4;
    +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCAsynchronousCallWithBlock:errorHandler:", v6, &__block_literal_global_87_0);

  }
}

uint64_t __49__TransparencyAnalytics_logSuccessForEventNamed___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "logSuccessForEventNamed:", *(_QWORD *)(a1 + 32));
}

- (void)logHardFailureForEventNamed:(id)a3 withAttributes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_sfanalytics)
  {
    v9 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", 102);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("transparencyVersion"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", +[TransparencySettings getEnvironment](TransparencySettings, "getEnvironment"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("ktEnvironment"));

    -[SFAnalytics logHardFailureForEventNamed:withAttributes:](self->_sfanalytics, "logHardFailureForEventNamed:withAttributes:", v6, v9);
  }
  else
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __68__TransparencyAnalytics_logHardFailureForEventNamed_withAttributes___block_invoke;
    v12[3] = &unk_24DC8E8A0;
    v13 = v6;
    v14 = v8;
    +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCAsynchronousCallWithBlock:errorHandler:", v12, &__block_literal_global_89);

  }
}

uint64_t __68__TransparencyAnalytics_logHardFailureForEventNamed_withAttributes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "logHardFailureForEventNamed:withAttributes:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)logSoftFailureForEventNamed:(id)a3 withAttributes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_sfanalytics)
  {
    v9 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", 102);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("transparencyVersion"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", +[TransparencySettings getEnvironment](TransparencySettings, "getEnvironment"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("ktEnvironment"));

    -[SFAnalytics logSoftFailureForEventNamed:withAttributes:](self->_sfanalytics, "logSoftFailureForEventNamed:withAttributes:", v6, v9);
  }
  else
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __68__TransparencyAnalytics_logSoftFailureForEventNamed_withAttributes___block_invoke;
    v12[3] = &unk_24DC8E8A0;
    v13 = v6;
    v14 = v8;
    +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCAsynchronousCallWithBlock:errorHandler:", v12, &__block_literal_global_90_0);

  }
}

uint64_t __68__TransparencyAnalytics_logSoftFailureForEventNamed_withAttributes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "logSoftFailureForEventNamed:withAttributes:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)noteEventNamed:(id)a3
{
  id v4;
  SFAnalytics *sfanalytics;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  sfanalytics = self->_sfanalytics;
  if (sfanalytics)
  {
    -[SFAnalytics noteEventNamed:](sfanalytics, "noteEventNamed:", v4);
  }
  else
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __40__TransparencyAnalytics_noteEventNamed___block_invoke;
    v6[3] = &unk_24DC8FBE8;
    v7 = v4;
    +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCAsynchronousCallWithBlock:errorHandler:", v6, &__block_literal_global_91);

  }
}

uint64_t __40__TransparencyAnalytics_noteEventNamed___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "noteEventNamed:", *(_QWORD *)(a1 + 32));
}

- (BOOL)skipLogResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "code") == -134)
  {
    objc_msgSend(v4, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqual:", CFSTR("TransparencyErrorUnknown"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)addUserInfoAttributes:(id)a3 error:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  objc_msgSend(a4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__TransparencyAnalytics_addUserInfoAttributes_error___block_invoke;
  v8[3] = &unk_24DC8FC50;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v8);

}

void __53__TransparencyAnalytics_addUserInfoAttributes_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "hasPrefix:", CFSTR("swt")))
  {
    objc_msgSend(v5, "substringFromIndex:", 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v7;
    v11[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v8))
    {
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v7);
    }
    else
    {
      objc_msgSend(v6, "description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v7);

    }
  }

}

- (void)logResultForEvent:(id)a3 hardFailure:(BOOL)a4 result:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  BOOL v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v6 = a4;
  v19[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  if (!-[TransparencyAnalytics skipLogResult:](self, "skipLogResult:", v9))
  {
    if (self->_sfanalytics)
    {
      v18[0] = CFSTR("transparencyVersion");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", 102);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18[1] = CFSTR("ktEnvironment");
      v19[0] = v10;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", +[TransparencySettings getEnvironment](TransparencySettings, "getEnvironment"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19[1] = v11;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v12, "mutableCopy");

      -[TransparencyAnalytics addUserInfoAttributes:error:](self, "addUserInfoAttributes:error:", v13, v9);
      -[SFAnalytics logResultForEvent:hardFailure:result:withAttributes:](self->_sfanalytics, "logResultForEvent:hardFailure:result:withAttributes:", v8, v6, v9, v13);
    }
    else
    {
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __62__TransparencyAnalytics_logResultForEvent_hardFailure_result___block_invoke;
      v14[3] = &unk_24DC8FC78;
      v15 = v8;
      v17 = v6;
      v16 = v9;
      +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCAsynchronousCallWithBlock:errorHandler:", v14, &__block_literal_global_96_0);

      v13 = v15;
    }

  }
}

uint64_t __62__TransparencyAnalytics_logResultForEvent_hardFailure_result___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "logResultForEvent:hardFailure:result:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)logResultForEvent:(id)a3 hardFailure:(BOOL)a4 result:(id)a5 withAttributes:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  BOOL v22;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  if (self->_sfanalytics)
  {
    if (v12)
    {
      v14 = objc_msgSend(v12, "mutableCopy");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v15 = (void *)v14;
    -[TransparencyAnalytics addUserInfoAttributes:error:](self, "addUserInfoAttributes:error:", v14, v11);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", 102);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("transparencyVersion"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", +[TransparencySettings getEnvironment](TransparencySettings, "getEnvironment"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, CFSTR("ktEnvironment"));

    -[SFAnalytics logResultForEvent:hardFailure:result:withAttributes:](self->_sfanalytics, "logResultForEvent:hardFailure:result:withAttributes:", v10, v8, v11, v15);
  }
  else
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __77__TransparencyAnalytics_logResultForEvent_hardFailure_result_withAttributes___block_invoke;
    v18[3] = &unk_24DC8FCA0;
    v19 = v10;
    v22 = v8;
    v20 = v11;
    v21 = v13;
    +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCAsynchronousCallWithBlock:errorHandler:", v18, &__block_literal_global_98);

  }
}

uint64_t __77__TransparencyAnalytics_logResultForEvent_hardFailure_result_withAttributes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "logResultForEvent:hardFailure:result:withAttributes:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)logMetric:(id)a3 withName:(id)a4
{
  id v6;
  id v7;
  SFAnalytics *sfanalytics;
  _QWORD v9[4];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  sfanalytics = self->_sfanalytics;
  if (sfanalytics)
  {
    -[SFAnalytics logMetric:withName:](sfanalytics, "logMetric:withName:", v6, v7);
  }
  else
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __44__TransparencyAnalytics_logMetric_withName___block_invoke;
    v9[3] = &unk_24DC8E8A0;
    v10 = v6;
    v11 = v7;
    +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCAsynchronousCallWithBlock:errorHandler:", v9, &__block_literal_global_99);

  }
}

uint64_t __44__TransparencyAnalytics_logMetric_withName___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "logMetric:withName:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)incrementIntegerPropertyForKey:(id)a3
{
  -[SFAnalytics incrementIntegerPropertyForKey:](self->_sfanalytics, "incrementIntegerPropertyForKey:", a3);
}

- (void)setNumberProperty:(id)a3 forKey:(id)a4
{
  -[SFAnalytics setNumberProperty:forKey:](self->_sfanalytics, "setNumberProperty:forKey:", a3, a4);
}

- (id)numberPropertyForKey:(id)a3
{
  return -[SFAnalytics numberPropertyForKey:](self->_sfanalytics, "numberPropertyForKey:", a3);
}

- (void)setDateProperty:(id)a3 forKey:(id)a4
{
  -[SFAnalytics setDateProperty:forKey:](self->_sfanalytics, "setDateProperty:forKey:", a3, a4);
}

- (id)datePropertyForKey:(id)a3
{
  return -[SFAnalytics datePropertyForKey:](self->_sfanalytics, "datePropertyForKey:", a3);
}

- (void)setMetricsAccountID:(id)a3
{
  -[SFAnalytics setMetricsAccountID:](self->_sfanalytics, "setMetricsAccountID:", a3);
}

- (id)failureKey:(id)a3
{
  return (id)objc_msgSend(a3, "stringByAppendingString:", CFSTR("-failure"));
}

- (void)setSuccessNowForPropertyKey:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[TransparencyAnalytics failureKey:](self, "failureKey:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TransparencyAnalytics datePropertyForKey:](self, "datePropertyForKey:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TransparencyAnalytics datePropertyForKey:](self, "datePropertyForKey:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (!v5 || v6 && objc_msgSend(v5, "compare:", v6) < 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TransparencyAnalytics setDateProperty:forKey:](self, "setDateProperty:forKey:", v8, v9);

  }
}

- (void)setFailureNowForPropertyKey:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[TransparencyAnalytics failureKey:](self, "failureKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TransparencyAnalytics datePropertyForKey:](self, "datePropertyForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TransparencyAnalytics setDateProperty:forKey:](self, "setDateProperty:forKey:", v6, v4);

  }
  -[TransparencyAnalytics datePropertyForKey:](self, "datePropertyForKey:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && objc_msgSend(v5, "compare:", v7) < 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TransparencyAnalytics setDateProperty:forKey:](self, "setDateProperty:forKey:", v8, v4);

  }
}

- (id)fuzzyTimeSinceLastSuccess:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  -[TransparencyAnalytics failureKey:](self, "failureKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAnalytics datePropertyForKey:](self->_sfanalytics, "datePropertyForKey:", v4);
  v6 = objc_claimAutoreleasedReturnValue();

  -[SFAnalytics datePropertyForKey:](self->_sfanalytics, "datePropertyForKey:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6 | v7)
  {
    if (v6 || !v7)
    {
      if (v6 && !v7)
      {
        v10 = (void *)MEMORY[0x24BDD16E0];
        v12 = objc_msgSend(MEMORY[0x24BDE84E0], "fuzzyDaysSinceDate:", v6) + 1;
        goto LABEL_12;
      }
      v13 = objc_msgSend((id)v6, "compare:", v7);
      v10 = (void *)MEMORY[0x24BDD16E0];
      v11 = (void *)MEMORY[0x24BDE84E0];
      if ((v13 & 0x8000000000000000) == 0)
      {
        v12 = objc_msgSend(MEMORY[0x24BDE84E0], "fuzzyDaysSinceDate:", v6);
        goto LABEL_12;
      }
    }
    else
    {
      v10 = (void *)MEMORY[0x24BDD16E0];
      v11 = (void *)MEMORY[0x24BDE84E0];
    }
    v12 = ~objc_msgSend(v11, "fuzzyDaysSinceDate:", v8);
LABEL_12:
    objc_msgSend(v10, "numberWithInteger:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  v9 = 0;
LABEL_13:

  return v9;
}

- (id)fuzzyTimeSinceDateKey:(id)a3
{
  void *v3;
  void *v4;

  -[SFAnalytics datePropertyForKey:](self->_sfanalytics, "datePropertyForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(MEMORY[0x24BDE84E0], "fuzzyDaysSinceDate:", v3));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)addMultiSamplerForName:(id)a3 withTimeInterval:(double)a4 block:(id)a5
{
  id v8;
  id v9;
  SFAnalytics *sfanalytics;
  id v11;
  NSObject *v12;
  uint8_t v13[16];

  v8 = a3;
  v9 = a5;
  sfanalytics = self->_sfanalytics;
  if (sfanalytics)
  {
    v11 = -[SFAnalytics AddMultiSamplerForName:withTimeInterval:block:](sfanalytics, "AddMultiSamplerForName:withTimeInterval:block:", v8, v9, a4);
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_9 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_9, &__block_literal_global_104);
    v12 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_9;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_21A250000, v12, OS_LOG_TYPE_ERROR, "SPI violation: multi-sampler may only be called from transparencyd", v13, 2u);
    }
  }

}

void __71__TransparencyAnalytics_addMultiSamplerForName_withTimeInterval_block___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_9;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_9 = (uint64_t)v0;

}

- (void)removeMultiSamplerForName:(id)a3
{
  id v4;
  SFAnalytics *sfanalytics;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  sfanalytics = self->_sfanalytics;
  if (sfanalytics)
  {
    -[SFAnalytics removeMultiSamplerForName:](sfanalytics, "removeMultiSamplerForName:", v4);
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_9 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_9, &__block_literal_global_105);
    v6 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_9;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_21A250000, v6, OS_LOG_TYPE_ERROR, "SPI violation: multi-sampler may only be called from transparencyd", v7, 2u);
    }
  }

}

void __51__TransparencyAnalytics_removeMultiSamplerForName___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_9;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_9 = (uint64_t)v0;

}

- (void)updateCollectionConfigurationWithData:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[SFAnalytics updateCollectionConfigurationWithData:](self->_sfanalytics, "updateCollectionConfigurationWithData:");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[SWTransparencySFAnalytics logger](SWTransparencySFAnalytics, "logger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateCollectionConfigurationWithData:", v5);

    notify_post((const char *)kTransparencySFACollectionUpdateName);
  }

}

- (id)dailyMetrics
{
  return -[SFAnalytics dailyMetrics](self->_sfanalytics, "dailyMetrics");
}

- (void)addNFSReporting:(id)a3
{
  TransparencyAnalytics *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[TransparencyAnalytics nfsObserver](v4, "nfsObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TransparencyAnalytics setNfsObserver:](v4, "setNfsObserver:", v6);

  }
  -[TransparencyAnalytics nfsObserver](v4, "nfsObserver");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);

  objc_sync_exit(v4);
}

- (id)nfsReporting
{
  TransparencyAnalytics *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  -[TransparencyAnalytics nfsObserver](v2, "nfsObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v10, "status", (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "name");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v12);

        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unsigned)manateeStatusForReporting
{
  return PCSReportManateeStatus();
}

- (NSHashTable)nfsObserver
{
  return (NSHashTable *)objc_getProperty(self, a2, 16, 1);
}

- (void)setNfsObserver:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (int)token
{
  return self->_token;
}

- (void)setToken:(int)a3
{
  self->_token = a3;
}

- (SFAnalytics)sfanalytics
{
  return (SFAnalytics *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSfanalytics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sfanalytics, 0);
  objc_storeStrong((id *)&self->_nfsObserver, 0);
}

@end
