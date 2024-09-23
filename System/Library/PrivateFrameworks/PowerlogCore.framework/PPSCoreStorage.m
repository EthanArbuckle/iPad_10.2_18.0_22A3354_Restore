@implementation PPSCoreStorage

+ (id)sharedSQLStorage
{
  void *v2;
  void *v3;
  void *v4;

  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "coreStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "sqlStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (PPSSQLStorage)sqlStorage
{
  return (PPSSQLStorage *)objc_getProperty(self, a2, 8, 1);
}

- (PPSCoreStorage)init
{
  BOOL v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  char v8;
  PPSCoreStorage *v9;
  PPSCoreStorage *v10;
  NSObject *v11;
  PPSSQLStorage *v12;
  void *v13;
  void *v14;
  int v15;
  PPSSQLStorage *sqlStorage;
  void *v17;
  _QWORD *v18;
  void **v19;
  uint64_t v20;
  void *v21;
  objc_super v23;
  uint8_t buf[8];
  _QWORD v25[5];
  _QWORD v26[5];
  void *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  if (+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
    goto LABEL_9;
  v3 = +[PLUtilities PreUnlockTelemetryEnabled](PLUtilities, "PreUnlockTelemetryEnabled");
  PPSCoreStorageLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (!v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6AB6000, v4, OS_LOG_TYPE_DEFAULT, "PreUnlockTelemetry disabled", buf, 2u);
    }

    +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "storage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "storageLocked");

    if ((v8 & 1) == 0)
      goto LABEL_10;
LABEL_9:
    v9 = 0;
    goto LABEL_18;
  }
  if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6AB6000, v4, OS_LOG_TYPE_DEFAULT, "PreUnlockTelemetry enabled", buf, 2u);
  }

LABEL_10:
  v23.receiver = self;
  v23.super_class = (Class)PPSCoreStorage;
  v10 = -[PPSCoreStorage init](&v23, sel_init);
  if (v10)
  {
    PPSCoreStorageLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6AB6000, v11, OS_LOG_TYPE_DEFAULT, "Initializing", buf, 2u);
    }

    v12 = objc_alloc_init(PPSSQLStorage);
    -[PPSCoreStorage setSqlStorage:](v10, "setSqlStorage:", v12);

    +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "storage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "storageLocked");

    sqlStorage = v10->_sqlStorage;
    if (v15)
    {
      v27 = &unk_1E6ABED50;
      v28[0] = sqlStorage;
      v17 = (void *)MEMORY[0x1E0C99D80];
      v18 = v28;
      v19 = &v27;
      v20 = 1;
    }
    else
    {
      v25[0] = &unk_1E6ABED50;
      v25[1] = &unk_1E6ABED68;
      v26[0] = sqlStorage;
      v26[1] = sqlStorage;
      v25[2] = &unk_1E6ABED80;
      v25[3] = &unk_1E6ABED98;
      v26[2] = sqlStorage;
      v26[3] = sqlStorage;
      v25[4] = &unk_1E6ABEDB0;
      v26[4] = sqlStorage;
      v17 = (void *)MEMORY[0x1E0C99D80];
      v18 = v26;
      v19 = (void **)v25;
      v20 = 5;
    }
    objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPSCoreStorage setStorageMap:](v10, "setStorageMap:", v21);

  }
  self = v10;
  v9 = self;
LABEL_18:

  return v9;
}

- (void)startStorage
{
  NSObject *v2;
  uint8_t v3[16];

  PPSCoreStorageLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1B6AB6000, v2, OS_LOG_TYPE_DEFAULT, "Starting Storage", v3, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D70A08], "buildDeviceMetadata");
  +[PPSCoreStorage setupEntryObjects](PPSCoreStorage, "setupEntryObjects");
  +[PPSCoreStorage setupMetadataStorage](PPSCoreStorage, "setupMetadataStorage");
  +[PPSCoreStorage setupStorage](PPSCoreStorage, "setupStorage");
  +[PPSCoreStorage startAllStorage](PPSCoreStorage, "startAllStorage");
}

+ (void)startAllStorage
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "coreStorage");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "storageMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &__block_literal_global_50);

}

uint64_t __33__PPSCoreStorage_startAllStorage__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "startStorage");
}

+ (void)setupEntryObjects
{
  void *v2;
  id v3;

  +[PPSCoreUtilities getAllowlist](PPSCoreUtilities, "getAllowlist");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &__block_literal_global_22_3);
}

void __35__PPSCoreStorage_setupEntryObjects__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0D70A08], "getMetadataByCategoryForSubsystem:", v2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__PPSCoreStorage_setupEntryObjects__block_invoke_2;
  v5[3] = &unk_1E6A55500;
  v6 = v2;
  v3 = v2;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v5);

}

void __35__PPSCoreStorage_setupEntryObjects__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t *v7;
  uint64_t v8;
  NSObject *v9;

  v5 = a2;
  v6 = a3;
  if (+[PLUtilities OverrideAllowlistEnabled](PLUtilities, "OverrideAllowlistEnabled")
    || (v8 = *(_QWORD *)(a1 + 32),
        v7 = (uint64_t *)(a1 + 32),
        +[PPSCoreUtilities isAllowedSubsystem:category:](PPSCoreUtilities, "isAllowedSubsystem:category:", v8, v5)))
  {
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_25);
  }
  else
  {
    PPSLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __35__PPSCoreStorage_setupEntryObjects__block_invoke_2_cold_1(v7, (uint64_t)v5, v9);

  }
}

uint64_t __35__PPSCoreStorage_setupEntryObjects__block_invoke_23()
{
  return +[PPSEntryKey setupEntryKeyForMetric:](PPSEntryKey, "setupEntryKeyForMetric:");
}

+ (void)setupMetadataStorage
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "coreStorage");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "storageMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &__block_literal_global_28_0);

}

uint64_t __38__PPSCoreStorage_setupMetadataStorage__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setupMetadataStorage");
}

+ (void)setupStorage
{
  id v2;

  +[PPSEntryKey allEntryKeys](PPSEntryKey, "allEntryKeys");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_29_1);

}

void __30__PPSCoreStorage_setupStorage__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  +[PPSCoreStorage storageClassForKey:](PPSCoreStorage, "storageClassForKey:", v2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setupStorageForEntryKey:", v2);

}

- (void)mergePreUnlockDBFile
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D70A10], "containerPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", CFSTR("/Library/PerfPowerTelemetry/"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", CFSTR("PreUnlock/"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingString:", CFSTR("PreUnlockLog.EPSQL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v2, "fileExistsAtPath:", v6);

  if (v7)
  {
    +[PPSCoreStorage sharedSQLStorage](PPSCoreStorage, "sharedSQLStorage");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "EPSQLConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D70A10], "containerPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("/Library/PerfPowerTelemetry/"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingString:", CFSTR("PreUnlock/"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAppendingString:", CFSTR("PreUnlockLog.EPSQL"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mergeDataFromOtherDBFile:", v12);

  }
}

+ (id)storageClassForKey:(id)a3
{
  return +[PPSCoreStorage storageClassForType:](PPSCoreStorage, "storageClassForType:", +[PPSEntryKey storageForEntryKey:](PPSEntryKey, "storageForEntryKey:", a3));
}

+ (id)storageClassForType:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = *(_QWORD *)&a3;
  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "coreStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "storageMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)sharedFlatStorage
{
  void *v2;
  void *v3;
  void *v4;

  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "coreStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "flatStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setSqlStorage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (PPSFlatStorage)flatStorage
{
  return (PPSFlatStorage *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFlatStorage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSDictionary)storageMap
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setStorageMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageMap, 0);
  objc_storeStrong((id *)&self->_flatStorage, 0);
  objc_storeStrong((id *)&self->_sqlStorage, 0);
}

void __35__PPSCoreStorage_setupEntryObjects__block_invoke_2_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1B6AB6000, log, OS_LOG_TYPE_ERROR, "Subsystem %@ Category %@ not allowed", (uint8_t *)&v4, 0x16u);
}

@end
