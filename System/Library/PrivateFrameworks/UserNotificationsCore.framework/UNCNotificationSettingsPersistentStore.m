@implementation UNCNotificationSettingsPersistentStore

- (UNCNotificationSettingsPersistentStore)initWithDataDirectoryPath:(id)a3
{
  id v5;
  UNCNotificationSettingsPersistentStore *v6;
  NSObject *v7;
  objc_super v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UNCNotificationSettingsPersistentStore;
  v6 = -[UNCNotificationSettingsPersistentStore init](&v9, sel_init);
  if (v6)
  {
    v7 = *MEMORY[0x24BDF89D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89D8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_impl(&dword_2499A5000, v7, OS_LOG_TYPE_DEFAULT, "Created UNPersistedStore with path %@", buf, 0xCu);
    }
    objc_storeStrong((id *)&v6->_dataDirectoryPath, a3);
  }

  return v6;
}

- (UNCNotificationSettingsPersistentStore)init
{
  void *v3;
  UNCNotificationSettingsPersistentStore *v4;

  objc_msgSend(CFSTR("~/Library/BulletinBoard/"), "stringByExpandingTildeInPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[UNCNotificationSettingsPersistentStore initWithDataDirectoryPath:](self, "initWithDataDirectoryPath:", v3);

  return v4;
}

- (id)readClearedSections
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v8[16];

  v3 = *MEMORY[0x24BDF89D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89D8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2499A5000, v3, OS_LOG_TYPE_DEFAULT, "Reading cleared sections from persistence", v8, 2u);
  }
  v4 = (void *)MEMORY[0x24BDBCE70];
  -[UNCNotificationSettingsPersistentStore _clearedSectionsPath](self, "_clearedSectionsPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryWithContentsOfFile:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)readSectionInfo
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v23;
  void *context;
  id v25;
  uint64_t v26;
  id obj;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDF89D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89D8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2499A5000, v3, OS_LOG_TYPE_DEFAULT, "Reading UNCSectionInfo from persistence", buf, 2u);
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  context = (void *)MEMORY[0x24BCFE9BC]();
  v4 = (void *)MEMORY[0x24BDBCE70];
  -[UNCNotificationSettingsPersistentStore _sectionInfoPath](self, "_sectionInfoPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryWithContentsOfFile:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = v6;
  objc_msgSend(v6, "objectForKey:", CFSTR("sectionInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(v7, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v31;
    v26 = *MEMORY[0x24BDD0E88];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v31 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x24BCFE9BC]();
        objc_msgSend(v7, "objectForKey:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_alloc(MEMORY[0x24BDD1620]);
        v29 = 0;
        v16 = (void *)objc_msgSend(v15, "initForReadingFromData:error:", v14, &v29);
        v17 = v29;
        if (v17)
          goto LABEL_12;
        objc_msgSend(v16, "setClass:forClassName:", objc_opt_class(), CFSTR("BBMuteAssertion"));
        objc_msgSend(v16, "setClass:forClassName:", objc_opt_class(), CFSTR("BBSectionIcon"));
        objc_msgSend(v16, "setClass:forClassName:", objc_opt_class(), CFSTR("BBSectionIconVariant"));
        objc_msgSend(v16, "setClass:forClassName:", objc_opt_class(), CFSTR("BBSectionInfo"));
        objc_msgSend(v16, "setClass:forClassName:", objc_opt_class(), CFSTR("BBSectionInfoSettings"));
        objc_msgSend(v16, "setClass:forClassName:", objc_opt_class(), CFSTR("BBSectionMuteAssertion"));
        objc_msgSend(v16, "setClass:forClassName:", objc_opt_class(), CFSTR("BBThreadsMuteAssertion"));
        v18 = objc_opt_class();
        v28 = 0;
        objc_msgSend(v16, "decodeTopLevelObjectOfClass:forKey:error:", v18, v26, &v28);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v28;
        if (v19)
          objc_msgSend(v25, "setObject:forKey:", v19, v12);

        if (v17)
        {
LABEL_12:
          v20 = *MEMORY[0x24BDF89D8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89D8], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v35 = v12;
            v36 = 2114;
            v37 = v17;
            _os_log_error_impl(&dword_2499A5000, v20, OS_LOG_TYPE_ERROR, "Decoding UNCSectionInfo for sectionID %{public}@ failed: %{public}@", buf, 0x16u);
          }

        }
        objc_autoreleasePoolPop(v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v9);
  }

  objc_autoreleasePoolPop(context);
  v21 = *MEMORY[0x24BDF89D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89D8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v35 = v25;
    _os_log_impl(&dword_2499A5000, v21, OS_LOG_TYPE_DEFAULT, "Returning sectionInfo %@", buf, 0xCu);
  }
  return v25;
}

- (id)readSectionInfoLegacy
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v8[16];

  v3 = *MEMORY[0x24BDF89D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89D8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2499A5000, v3, OS_LOG_TYPE_DEFAULT, "Reading legacy SectionInfo from persistence", v8, 2u);
  }
  v4 = (void *)MEMORY[0x24BDBCE70];
  -[UNCNotificationSettingsPersistentStore _sectionInfoLegacyPath](self, "_sectionInfoLegacyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryWithContentsOfFile:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)readSectionOrder
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v8[16];

  v3 = *MEMORY[0x24BDF89D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89D8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2499A5000, v3, OS_LOG_TYPE_DEFAULT, "Reading section order from persistence", v8, 2u);
  }
  v4 = (void *)MEMORY[0x24BDBCE70];
  -[UNCNotificationSettingsPersistentStore _sectionOrderPath](self, "_sectionOrderPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryWithContentsOfFile:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)writeClearedSections:(id)a3
{
  id v4;
  os_log_t *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t v18[16];

  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x24BDF89D8];
  v6 = *MEMORY[0x24BDF89D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89D8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_2499A5000, v6, OS_LOG_TYPE_DEFAULT, "Writing cleared sections to persistence", v18, 2u);
  }
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v4, 200, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCNotificationSettingsPersistentStore _clearedSectionsPath](self, "_clearedSectionsPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "writeToFile:options:error:", v8, 268435457, 0);

  if ((v9 & 1) == 0)
  {
    v10 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      -[UNCNotificationSettingsPersistentStore writeClearedSections:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
  }

}

- (void)writeSectionOrder:(id)a3
{
  id v4;
  os_log_t *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t v18[16];

  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x24BDF89D8];
  v6 = *MEMORY[0x24BDF89D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89D8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_2499A5000, v6, OS_LOG_TYPE_DEFAULT, "Writing section order to persistence", v18, 2u);
  }
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v4, 100, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCNotificationSettingsPersistentStore _sectionOrderPath](self, "_sectionOrderPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "writeToFile:options:error:", v8, 268435457, 0);

  if ((v9 & 1) == 0)
  {
    v10 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      -[UNCNotificationSettingsPersistentStore writeSectionOrder:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
  }

}

- (void)writeSectionInfo:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  UNCNotificationSettingsPersistentStore *v26;
  void *v27;
  void *context;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[16];
  _BYTE v35[128];
  uint64_t v36;

  v26 = self;
  v36 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = *MEMORY[0x24BDF89D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89D8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2499A5000, v4, OS_LOG_TYPE_DEFAULT, "Writing section info to persistence", buf, 2u);
  }
  context = (void *)MEMORY[0x24BCFE9BC]();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKey:", v11, v26);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v12, "suppressFromSettings") & 1) == 0)
        {
          v13 = (void *)MEMORY[0x24BCFE9BC]();
          objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKey:", v14, v11);

          objc_autoreleasePoolPop(v13);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v8);
  }

  objc_msgSend(v27, "setObject:forKey:", v5, CFSTR("sectionInfo"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setObject:forKey:", v15, CFSTR("sectionInfoVersionNumber"));

  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v27, 100, 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCNotificationSettingsPersistentStore _sectionInfoPath](v26, "_sectionInfoPath");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  objc_msgSend(v16, "writeToFile:options:error:", v17, 268435457, &v29);
  v18 = v29;

  if (v18)
  {
    v19 = *MEMORY[0x24BDF89D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89D8], OS_LOG_TYPE_ERROR))
      -[UNCNotificationSettingsPersistentStore writeSectionInfo:].cold.1((uint64_t)v18, v19, v20, v21, v22, v23, v24, v25);
  }

  objc_autoreleasePoolPop(context);
}

- (void)deleteSectionInfoFile
{
  OUTLINED_FUNCTION_0_3(&dword_2499A5000, a2, a3, "Deleting section info file due to downgrade failed with error: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_6();
}

- (void)deleteSectionInfoLegacyFile
{
  OUTLINED_FUNCTION_0_3(&dword_2499A5000, a2, a3, "Deleting legacy section info file failed with error: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_6();
}

- (BOOL)hasSectionInfoLegacyFile
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCNotificationSettingsPersistentStore _sectionInfoLegacyPath](self, "_sectionInfoLegacyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  return v5;
}

- (id)readSectionInfoWithVersionNumberForMigration
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCE70];
  -[UNCNotificationSettingsPersistentStore _sectionInfoPath](self, "_sectionInfoPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithContentsOfFile:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_clearedSectionsPath
{
  return -[NSString stringByAppendingPathComponent:](self->_dataDirectoryPath, "stringByAppendingPathComponent:", CFSTR("ClearedSections.plist"));
}

- (id)_sectionOrderPath
{
  return -[NSString stringByAppendingPathComponent:](self->_dataDirectoryPath, "stringByAppendingPathComponent:", CFSTR("SectionOrder.plist"));
}

- (id)_sectionInfoPath
{
  return -[NSString stringByAppendingPathComponent:](self->_dataDirectoryPath, "stringByAppendingPathComponent:", CFSTR("VersionedSectionInfo.plist"));
}

- (id)_sectionInfoLegacyPath
{
  return -[NSString stringByAppendingPathComponent:](self->_dataDirectoryPath, "stringByAppendingPathComponent:", CFSTR("SectionInfo.plist"));
}

- (NSString)dataDirectoryPath
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataDirectoryPath, 0);
}

- (void)writeClearedSections:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_2499A5000, a1, a3, "Error writing cleared sections data.", a5, a6, a7, a8, 0);
}

- (void)writeSectionOrder:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_2499A5000, a1, a3, "Error writing section order data.", a5, a6, a7, a8, 0);
}

- (void)writeSectionInfo:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_2499A5000, a2, a3, "Error writing section info: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_6();
}

@end
