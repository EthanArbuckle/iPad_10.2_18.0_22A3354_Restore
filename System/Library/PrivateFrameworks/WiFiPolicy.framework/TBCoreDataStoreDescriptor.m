@implementation TBCoreDataStoreDescriptor

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (NSURL)storeURL
{
  return self->_storeURL;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSPersistentStoreDescription)storeDescription
{
  return self->_storeDescription;
}

+ (id)directStoreDescriptor
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  objc_msgSend((id)objc_opt_class(), "defaultStoresDirectoryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "defaultPersistentStoreURLWithDirectory:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc((Class)a1);
  objc_msgSend((id)objc_opt_class(), "defaultModelURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithType:storeURL:modelURL:", 1, v4, v6);

  return v7;
}

- (TBCoreDataStoreDescriptor)initWithType:(unint64_t)a3 storeURL:(id)a4 modelURL:(id)a5
{
  id v9;
  id v10;
  TBCoreDataStoreDescriptor *v11;
  void *v12;
  void *v13;
  unint64_t type;
  uint64_t v15;
  uint64_t v16;
  NSDictionary *v17;
  uint64_t v18;
  NSDictionary *storeOptions;
  objc_super v21;

  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)TBCoreDataStoreDescriptor;
  v11 = -[TBCoreDataStoreDescriptor init](&v21, sel_init);
  v11->_type = a3;
  objc_storeStrong((id *)&v11->_storeURL, a4);
  objc_storeStrong((id *)&v11->_modelURL, a5);
  objc_msgSend(MEMORY[0x1E0C97C08], "persistentStoreDescriptionWithURL:", v11->_storeURL);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  type = v11->_type;
  if (type <= 3)
    objc_msgSend(v12, "setType:", **((_QWORD **)&unk_1E881E6D8 + type));
  objc_msgSend(v13, "setConfiguration:", CFSTR("Default"));
  objc_msgSend(v13, "setShouldInferMappingModelAutomatically:", 1);
  objc_msgSend(v13, "setShouldMigrateStoreAutomatically:", 1);
  objc_msgSend(v13, "setShouldAddStoreAsynchronously:", 0);
  v15 = *MEMORY[0x1E0C97A60];
  objc_msgSend(v13, "setOption:forKey:", CFSTR("com.apple.wifid.store.cache"), *MEMORY[0x1E0C97A60]);
  v16 = *MEMORY[0x1E0C97A40];
  objc_msgSend(v13, "setOption:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C97A40]);
  objc_storeStrong((id *)&v11->_storeDescription, v13);
  if (!v11->_type)
  {
    v17 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[NSDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", CFSTR("com.apple.wifid.store.cache"), v15);
    v18 = MEMORY[0x1E0C9AAB0];
    -[NSDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C97A50]);
    -[NSDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v18, v16);
    -[NSDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0C97970]);
    -[NSDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CB2AE0], *MEMORY[0x1E0C97940]);
    storeOptions = v11->_storeOptions;
    v11->_storeOptions = v17;

  }
  return v11;
}

+ (id)defaultStoresDirectoryURL
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3620], "wifiCacheDirectoryPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)defaultPersistentStoreURLWithDirectory:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("ThreeBars"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathExtension:", CFSTR("sqlite"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)defaultModelURL
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("ThreeBars"), CFSTR("momd"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeDescription, 0);
  objc_storeStrong((id *)&self->_storeOptions, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);
  objc_storeStrong((id *)&self->_storeURL, 0);
}

+ (id)clientStoreDescriptor
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  objc_msgSend((id)objc_opt_class(), "defaultStoresDirectoryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "defaultPersistentStoreURLWithDirectory:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc((Class)a1);
  objc_msgSend((id)objc_opt_class(), "defaultModelURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithType:storeURL:modelURL:", 2, v4, v6);

  return v7;
}

+ (id)serverStoreDescriptor
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  objc_msgSend((id)objc_opt_class(), "defaultStoresDirectoryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "defaultPersistentStoreURLWithDirectory:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc((Class)a1);
  objc_msgSend((id)objc_opt_class(), "defaultModelURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithType:storeURL:modelURL:", 0, v4, v6);

  return v7;
}

+ (id)tempStoreDescriptor
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  objc_msgSend((id)objc_opt_class(), "tempStoresDirectoryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "defaultPersistentStoreURLWithDirectory:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc((Class)a1);
  objc_msgSend((id)objc_opt_class(), "defaultModelURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithType:storeURL:modelURL:", 3, v4, v6);

  return v7;
}

+ (id)tempStoresDirectoryURL
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void)setStoreURL:(id)a3
{
  objc_storeStrong((id *)&self->_storeURL, a3);
}

- (void)setModelURL:(id)a3
{
  objc_storeStrong((id *)&self->_modelURL, a3);
}

- (NSDictionary)storeOptions
{
  return self->_storeOptions;
}

- (void)setStoreOptions:(id)a3
{
  objc_storeStrong((id *)&self->_storeOptions, a3);
}

@end
