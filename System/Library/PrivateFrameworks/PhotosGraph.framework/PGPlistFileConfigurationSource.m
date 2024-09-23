@implementation PGPlistFileConfigurationSource

- (PGPlistFileConfigurationSource)initWithPlistFileURL:(id)a3
{
  id v4;
  PGPlistFileConfigurationSource *v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  NSDictionary *configurationData;
  PGPlistFileConfigurationSource *v11;
  void *v12;
  NSObject *v13;
  objc_super v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PGPlistFileConfigurationSource;
  v5 = -[PGPlistFileConfigurationSource init](&v15, sel_init);
  if (!v5)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "fileExistsAtPath:", v7);

  if ((v8 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v4);
    v9 = objc_claimAutoreleasedReturnValue();
    configurationData = v5->_configurationData;
    v5->_configurationData = (NSDictionary *)v9;

LABEL_4:
    v11 = v5;
    goto LABEL_8;
  }
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "loggingConnection");
  v13 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v4;
    _os_log_error_impl(&dword_1CA237000, v13, OS_LOG_TYPE_ERROR, "[PGConfigurationSource] failed to load PlistFile at filePath: %@", buf, 0xCu);
  }

  v11 = 0;
LABEL_8:

  return v11;
}

- (id)objectForKey:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_configurationData, "objectForKeyedSubscript:", a3);
}

- (NSDictionary)configurationData
{
  return self->_configurationData;
}

- (void)setConfigurationData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationData, 0);
}

@end
