@implementation AnalyticsStoreDescriptor

+ (id)serverStoreDescriptor:(unint64_t)a3
{
  AnalyticsStoreDescriptor *v4;
  void *v5;
  void *v6;
  AnalyticsStoreDescriptor *v7;

  v4 = [AnalyticsStoreDescriptor alloc];
  +[AnalyticsStoreDescriptor defaultPersistentStoreURL](AnalyticsStoreDescriptor, "defaultPersistentStoreURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[AnalyticsStoreDescriptor defaultModelURL](AnalyticsStoreDescriptor, "defaultModelURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AnalyticsStoreDescriptor initWithType:storeURL:modelURL:options:](v4, "initWithType:storeURL:modelURL:options:", 0, v5, v6, a3);

  return v7;
}

+ (id)directStoreDescriptor
{
  AnalyticsStoreDescriptor *v2;
  void *v3;
  void *v4;
  AnalyticsStoreDescriptor *v5;

  v2 = [AnalyticsStoreDescriptor alloc];
  +[AnalyticsStoreDescriptor defaultPersistentStoreURL](AnalyticsStoreDescriptor, "defaultPersistentStoreURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AnalyticsStoreDescriptor defaultModelURL](AnalyticsStoreDescriptor, "defaultModelURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[AnalyticsStoreDescriptor initWithType:storeURL:modelURL:options:](v2, "initWithType:storeURL:modelURL:options:", 1, v3, v4, 0);

  return v5;
}

- (AnalyticsStoreDescriptor)initWithType:(unint64_t)a3 storeURL:(id)a4 modelURL:(id)a5 options:(unint64_t)a6
{
  id v11;
  id v12;
  AnalyticsStoreDescriptor *v13;
  AnalyticsStoreDescriptor *v14;
  unint64_t v15;
  unint64_t v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  NSDictionary *v23;
  NSDictionary *remoteStoreOptions;
  AnalyticsStoreDescriptor *v25;
  NSObject *p_super;
  const char *v28;
  _QWORD v29[4];
  NSDictionary *v30;
  objc_super v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  _DWORD v37[7];

  *(_QWORD *)&v37[5] = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  v12 = a5;
  v31.receiver = self;
  v31.super_class = (Class)AnalyticsStoreDescriptor;
  v13 = -[AnalyticsStoreDescriptor init](&v31, sel_init);
  v14 = v13;
  if (!v11)
  {
    WALogCategoryDefaultHandle();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v33 = "-[AnalyticsStoreDescriptor initWithType:storeURL:modelURL:options:]";
      v34 = 1024;
      v35 = 56;
      v28 = "%{public}s::%d:storeURL is nil";
LABEL_26:
      _os_log_impl(&dword_212581000, p_super, OS_LOG_TYPE_ERROR, v28, buf, 0x12u);
    }
LABEL_27:
    v18 = 0;
    v25 = v14;
    v14 = 0;
LABEL_20:

    goto LABEL_21;
  }
  if (!v12)
  {
    WALogCategoryDefaultHandle();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v33 = "-[AnalyticsStoreDescriptor initWithType:storeURL:modelURL:options:]";
      v34 = 1024;
      v35 = 57;
      v28 = "%{public}s::%d:modelURL is nil";
      goto LABEL_26;
    }
    goto LABEL_27;
  }
  v13->_type = a3;
  objc_storeStrong((id *)&v13->_storeURL, a4);
  objc_storeStrong((id *)&v14->_modelURL, a5);
  v15 = a6 & 1;
  v16 = a6 & 2;
  WALogCategoryDefaultHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v33 = "-[AnalyticsStoreDescriptor initWithType:storeURL:modelURL:options:]";
    v34 = 1024;
    v35 = 66;
    v36 = 1024;
    v37[0] = a6 & 1;
    LOWORD(v37[1]) = 1024;
    *(_DWORD *)((char *)&v37[1] + 2) = v16 >> 1;
    _os_log_impl(&dword_212581000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:setupXPCStore: %d migrateIfNecessary: %d", buf, 0x1Eu);
  }

  v14->_analyticsStoreOptions = a6;
  objc_msgSend(MEMORY[0x24BDBB740], "persistentStoreDescriptionWithURL:", v14->_storeURL);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setType:", *MEMORY[0x24BDBB580]);
  objc_msgSend(v18, "setConfiguration:", CFSTR("Default"));
  if (!v16 || v14->_type)
  {
    objc_msgSend(v18, "setShouldAddStoreAsynchronously:", 0);
    if (!v16)
      objc_msgSend(v18, "setOption:forKey:", *MEMORY[0x24BDD0CD8], *MEMORY[0x24BDBB4F8]);
  }
  else
  {
    objc_msgSend(v18, "setShouldInferMappingModelAutomatically:", 1);
    objc_msgSend(v18, "setShouldMigrateStoreAutomatically:", 1);
    objc_msgSend(v18, "setShouldAddStoreAsynchronously:", 0);
  }
  if (v15 && !v14->_type)
  {
    objc_msgSend(v18, "setOption:forKey:", CFSTR("com.apple.wifianalyticsd.devicestore"), *MEMORY[0x24BDBB5D0]);
    v19 = MEMORY[0x24BDBD1C8];
    objc_msgSend(v18, "setOption:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDBB5B8]);
    objc_msgSend(v18, "setOption:forKey:", v19, *MEMORY[0x24BDBB520]);
  }
  objc_storeStrong((id *)&v14->_storeDescription, v18);
  if (v15 && !v14->_type)
  {
    v20 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v20, "setObject:forKeyedSubscript:", CFSTR("com.apple.wifianalyticsd.devicestore"), *MEMORY[0x24BDBB5D0]);
    v21 = MEMORY[0x24BDBD1C8];
    objc_msgSend(v20, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDBB5C8]);
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, *MEMORY[0x24BDBB5B8]);
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, *MEMORY[0x24BDBB518]);
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, *MEMORY[0x24BDBB520]);
    if (!v16)
    {
      WALogCategoryDefaultHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446722;
        v33 = "-[AnalyticsStoreDescriptor initWithType:storeURL:modelURL:options:]";
        v34 = 1024;
        v35 = 105;
        v36 = 2080;
        *(_QWORD *)v37 = "-[AnalyticsStoreDescriptor initWithType:storeURL:modelURL:options:]";
        _os_log_impl(&dword_212581000, v22, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%s: Reducing NSPersistentStoreConnectionPoolMaxSizeKey to 2 since proc is not wifianalyticsd", buf, 0x1Cu);
      }

      objc_msgSend(v20, "setObject:forKeyedSubscript:", &unk_24CE01C08, *MEMORY[0x24BDBB4D0]);
    }
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __67__AnalyticsStoreDescriptor_initWithType_storeURL_modelURL_options___block_invoke;
    v29[3] = &unk_24CDDCBC8;
    v23 = (NSDictionary *)v20;
    v30 = v23;
    +[WAUtil getLazyNSNumberPreference:domain:exists:](WAUtil, "getLazyNSNumberPreference:domain:exists:", CFSTR("NSPersistentStoreConnectionPoolMaxSizeKey"), CFSTR("com.apple.wifi.analytics"), v29);
    remoteStoreOptions = v14->_remoteStoreOptions;
    v14->_remoteStoreOptions = v23;
    v25 = v23;

    p_super = &v30->super;
    goto LABEL_20;
  }
LABEL_21:

  return v14;
}

void __67__AnalyticsStoreDescriptor_initWithType_storeURL_modelURL_options___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WALogCategoryDefaultHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446978;
    v7 = "-[AnalyticsStoreDescriptor initWithType:storeURL:modelURL:options:]_block_invoke";
    v8 = 1024;
    v9 = 111;
    v10 = 2080;
    v11 = "-[AnalyticsStoreDescriptor initWithType:storeURL:modelURL:options:]_block_invoke";
    v12 = 1024;
    v13 = objc_msgSend(v3, "unsignedIntValue");
    _os_log_impl(&dword_212581000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%s: OVERRIDING NSPersistentStoreConnectionPoolMaxSizeKey to %u", (uint8_t *)&v6, 0x22u);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v3, "unsignedIntValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BDBB4D0]);

}

+ (id)applicationSupportDirectoryPath
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  char v13;
  id v14;
  char v15;
  id v16;
  NSObject *v17;
  const char *v19;
  NSObject *v20;
  _QWORD v21[5];
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v28 = 0;
  NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, 1uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    WALogCategoryDefaultHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v30 = "+[AnalyticsStoreDescriptor applicationSupportDirectoryPath]";
      v31 = 1024;
      LODWORD(v32) = 129;
LABEL_17:
      _os_log_impl(&dword_212581000, v20, OS_LOG_TYPE_ERROR, "%{public}s::%d:NSCachesDirectory paths nil", buf, 0x12u);
    }
LABEL_18:

LABEL_8:
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __59__AnalyticsStoreDescriptor_applicationSupportDirectoryPath__block_invoke;
    v21[3] = &unk_24CDDCBF0;
    v21[4] = &v23;
    +[WAUtil getLazyNSNumberPreference:domain:exists:](WAUtil, "getLazyNSNumberPreference:domain:exists:", CFSTR("applicationSupportDirectoryPathNil"), CFSTR("com.apple.wifi.analytics"), v21);
    v16 = (id)v24[5];
    goto LABEL_12;
  }
  objc_msgSend(v2, "firstObject");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v24[5];
  v24[5] = v4;

  v6 = (void *)v24[5];
  if (!v6)
  {
    WALogCategoryDefaultHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v30 = "+[AnalyticsStoreDescriptor applicationSupportDirectoryPath]";
      v31 = 1024;
      LODWORD(v32) = 132;
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("com.apple.wifianalyticsd"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v24[5];
  v24[5] = v7;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "fileExistsAtPath:", v24[5]);

  if ((v10 & 1) != 0)
    goto LABEL_8;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v24[5];
  v22 = 0;
  v13 = objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v12, 1, 0, &v22);
  v14 = v22;

  v15 = v14 ? 0 : v13;
  if ((v15 & 1) != 0)
    goto LABEL_8;
  WALogCategoryDefaultHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
  {
    v19 = (const char *)v24[5];
    *(_DWORD *)buf = 138412546;
    v30 = v19;
    v31 = 2112;
    v32 = v14;
    _os_log_fault_impl(&dword_212581000, v17, OS_LOG_TYPE_FAULT, "Unable to create directory at %@: %@", buf, 0x16u);
  }

  v16 = 0;
LABEL_12:

  _Block_object_dispose(&v23, 8);
  return v16;
}

void __59__AnalyticsStoreDescriptor_applicationSupportDirectoryPath__block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a2, "BOOLValue"))
  {
    WALogCategoryDefaultHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136446722;
      v7 = "+[AnalyticsStoreDescriptor applicationSupportDirectoryPath]_block_invoke";
      v8 = 1024;
      v9 = 154;
      v10 = 2080;
      v11 = "+[AnalyticsStoreDescriptor applicationSupportDirectoryPath]_block_invoke";
      _os_log_impl(&dword_212581000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%s: OVERRIDING applicationSupportDirectoryPath to nil", (uint8_t *)&v6, 0x1Cu);
    }

    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = 0;

  }
}

+ (id)defaultPersistentStoreURL
{
  NSObject *v2;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__AnalyticsStoreDescriptor_defaultPersistentStoreURL__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals != -1)
    dispatch_once(&_MergedGlobals, block);
  WALogCategoryDefaultHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v6 = "+[AnalyticsStoreDescriptor defaultPersistentStoreURL]";
    v7 = 1024;
    v8 = 179;
    v9 = 2112;
    v10 = qword_253D3A450;
    _os_log_impl(&dword_212581000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:defaultPersistentStoreURL is %@", buf, 0x1Cu);
  }

  return (id)qword_253D3A450;
}

void __53__AnalyticsStoreDescriptor_defaultPersistentStoreURL__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)objc_opt_class(), "applicationSupportDirectoryPath");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v0)
  {
    WALogCategoryDefaultHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
LABEL_8:

      goto LABEL_4;
    }
    LOWORD(v11) = 0;
    v8 = "applicationSupportDirectoryPath is nil";
    v9 = v7;
    v10 = 2;
LABEL_10:
    _os_log_fault_impl(&dword_212581000, v9, OS_LOG_TYPE_FAULT, v8, (uint8_t *)&v11, v10);
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_253D3A450;
  qword_253D3A450 = v1;

  if (!qword_253D3A450)
  {
    WALogCategoryDefaultHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      goto LABEL_8;
    v11 = 138412290;
    v12 = v0;
    v8 = "defaultPersistentStoreURL is nil with path %@";
    v9 = v7;
    v10 = 12;
    goto LABEL_10;
  }
  objc_msgSend((id)qword_253D3A450, "URLByAppendingPathComponent:", CFSTR("DeviceAnalyticsModel"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_253D3A450;
  qword_253D3A450 = v3;

  objc_msgSend((id)qword_253D3A450, "URLByAppendingPathExtension:", CFSTR("sqlite"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)qword_253D3A450;
  qword_253D3A450 = v5;

LABEL_4:
}

+ (id)defaultModelURL
{
  NSObject *v2;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (qword_253D3A458 != -1)
    dispatch_once(&qword_253D3A458, &__block_literal_global);
  WALogCategoryDefaultHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136446722;
    v5 = "+[AnalyticsStoreDescriptor defaultModelURL]";
    v6 = 1024;
    v7 = 198;
    v8 = 2112;
    v9 = qword_253D3A460;
    _os_log_impl(&dword_212581000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:defaultModelURL is %@", (uint8_t *)&v4, 0x1Cu);
  }

  return (id)qword_253D3A460;
}

void __43__AnalyticsStoreDescriptor_defaultModelURL__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  +[WAUtil resourcePath](WAUtil, "resourcePath");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_253D3A460;
  qword_253D3A460 = v1;

  if (qword_253D3A460)
  {
    objc_msgSend((id)qword_253D3A460, "URLByAppendingPathComponent:", CFSTR("DeviceAnalyticsModel"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)qword_253D3A460;
    qword_253D3A460 = v3;

    objc_msgSend((id)qword_253D3A460, "URLByAppendingPathExtension:", CFSTR("momd"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)qword_253D3A460;
    qword_253D3A460 = v5;

  }
  else
  {
    WALogCategoryDefaultHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136446722;
      v9 = "+[AnalyticsStoreDescriptor defaultModelURL]_block_invoke";
      v10 = 1024;
      v11 = 194;
      v12 = 2112;
      v13 = v0;
      _os_log_impl(&dword_212581000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:ERROR defaultModelURL is nil with path %@", (uint8_t *)&v8, 0x1Cu);
    }

  }
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (void)setModelURL:(id)a3
{
  objc_storeStrong((id *)&self->_modelURL, a3);
}

- (NSURL)storeURL
{
  return self->_storeURL;
}

- (void)setStoreURL:(id)a3
{
  objc_storeStrong((id *)&self->_storeURL, a3);
}

- (NSDictionary)remoteStoreOptions
{
  return self->_remoteStoreOptions;
}

- (NSPersistentStoreDescription)storeDescription
{
  return self->_storeDescription;
}

- (unint64_t)analyticsStoreOptions
{
  return self->_analyticsStoreOptions;
}

- (void)setAnalyticsStoreOptions:(unint64_t)a3
{
  self->_analyticsStoreOptions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeDescription, 0);
  objc_storeStrong((id *)&self->_remoteStoreOptions, 0);
  objc_storeStrong((id *)&self->_storeURL, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);
}

@end
