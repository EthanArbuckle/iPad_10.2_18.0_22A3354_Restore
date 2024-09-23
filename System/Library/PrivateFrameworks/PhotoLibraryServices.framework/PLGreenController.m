@implementation PLGreenController

- (PLGreenController)init
{
  PLGreenController *v2;
  PLGreenController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLGreenController;
  v2 = -[PLGreenController init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PLGreenController readValuesFromDisk](v2, "readValuesFromDisk");
  return v3;
}

- (void)readValuesFromDisk
{
  void *v3;
  int v4;
  NSDictionary *v5;
  NSDictionary *currentGreenValues;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileExistsAtPath:", CFSTR("/var/mobile/Library/Application Support/com.apple.palette.green.plist"));

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", CFSTR("/var/mobile/Library/Application Support/com.apple.palette.green.plist"));
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    currentGreenValues = self->_currentGreenValues;
    self->_currentGreenValues = v5;

  }
}

- (BOOL)isGreenStateValid
{
  void *v2;
  void *v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[PLGreenController currentGreenValues](self, "currentGreenValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("state"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  if (v4 <= 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v6 = 134218240;
    v7 = v4;
    v8 = 2048;
    v9 = 1;
    _os_log_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Green state version is %ld, below the required threshold %ld. Cannot compare green values", (uint8_t *)&v6, 0x16u);
  }
  return v4 > 0;
}

- (BOOL)greenValuesSimilarToGreenValues:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;

  v4 = a3;
  if (-[PLGreenController isGreenStateValid](self, "isGreenStateValid"))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("key1"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLGreenController currentGreenValues](self, "currentGreenValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("key1"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "isEqual:", v7);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("key2"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLGreenController currentGreenValues](self, "currentGreenValues");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v10, "objectForKeyedSubscript:", CFSTR("key2"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "isEqual:", v11);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("key3"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLGreenController currentGreenValues](self, "currentGreenValues");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("key3"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v10) = objc_msgSend(v13, "isEqual:", v15);

    v16 = v8 & v12 & v10;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (NSDictionary)currentGreenValues
{
  return self->_currentGreenValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentGreenValues, 0);
}

@end
