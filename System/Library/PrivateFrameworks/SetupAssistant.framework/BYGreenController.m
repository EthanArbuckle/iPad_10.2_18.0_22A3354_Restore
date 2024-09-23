@implementation BYGreenController

- (BYGreenController)init
{
  BYGreenController *v2;
  BYGreenController *v3;
  NSArray *relevantGreenKeys;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BYGreenController;
  v2 = -[BYGreenController init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    relevantGreenKeys = v2->_relevantGreenKeys;
    v2->_relevantGreenKeys = (NSArray *)&unk_1E4E34738;

    -[BYGreenController setPlistStateCache:](v3, "setPlistStateCache:", 0xFFFFFFFFLL);
  }
  return v3;
}

- (void)writeInitialPlistIfNecessary
{
  uint64_t v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  NSObject *v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (-[BYGreenController _shouldWriteInitialPlist](self, "_shouldWriteInitialPlist"))
  {
    v3 = -[BYGreenController _skuRegionCodeIsAmbiguous](self, "_skuRegionCodeIsAmbiguous") ^ 1;
    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "countryCode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[BYGreenController _writePlistForLocaleRegionCode:desiredPlistState:](self, "_writePlistForLocaleRegionCode:desiredPlistState:", v5, v3);

    _BYLoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109120;
      v8[1] = v6;
      _os_log_impl(&dword_1A4E92000, v7, OS_LOG_TYPE_DEFAULT, "green file initial did write with success %d", (uint8_t *)v8, 8u);
    }

  }
}

- (void)writeInformedDefaultPlistIfNecessaryForLocaleRegionCode:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[BYGreenController _shouldWriteInformedDefaultPlist](self, "_shouldWriteInformedDefaultPlist"))
  {
    v5 = -[BYGreenController _writePlistForLocaleRegionCode:desiredPlistState:](self, "_writePlistForLocaleRegionCode:desiredPlistState:", v4, 1);
    -[BYGreenController setPlistStateCache:](self, "setPlistStateCache:", 1);
    _BYLoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412546;
      v8 = v4;
      v9 = 1024;
      v10 = v5;
      _os_log_impl(&dword_1A4E92000, v6, OS_LOG_TYPE_DEFAULT, "green write informed defaults completed for %@ with success %d", (uint8_t *)&v7, 0x12u);
    }

  }
}

- (int)_readPlistState
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  NSObject *v11;
  _DWORD v13[2];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BYGreenController _greenPlistFilePath](self, "_greenPlistFilePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  if ((v5 & 1) != 0)
  {
    v6 = (void *)MEMORY[0x1E0C99D80];
    -[BYGreenController _greenPlistFilePath](self, "_greenPlistFilePath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryWithContentsOfFile:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NSObject objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("state"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = objc_msgSend(v9, "intValue");
      else
        v10 = 0;

    }
    else
    {
      v10 = 0;
    }
    _BYLoggingFacility();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13[0] = 67109120;
      v13[1] = v10;
      _os_log_impl(&dword_1A4E92000, v11, OS_LOG_TYPE_DEFAULT, "green file already exists with state %d", (uint8_t *)v13, 8u);
    }

  }
  else
  {
    _BYLoggingFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13[0]) = 0;
      _os_log_impl(&dword_1A4E92000, v8, OS_LOG_TYPE_DEFAULT, "green file does not exist", (uint8_t *)v13, 2u);
    }
    v10 = 0;
  }

  return v10;
}

- (BOOL)_shouldWriteInitialPlist
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  _BOOL4 v12;
  const char *v13;
  uint8_t *v14;
  uint8_t v16[16];
  uint8_t buf[2];
  __int16 v18;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BYGreenController _greenPlistFilePath](self, "_greenPlistFilePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99D80];
    -[BYGreenController _greenPlistFilePath](self, "_greenPlistFilePath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryWithContentsOfFile:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    -[NSObject objectForKey:](v8, "objectForKey:", CFSTR("state"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 == 0;

    _BYLoggingFacility();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v12)
      {
        v18 = 0;
        v13 = "green file already exists with state key";
        v14 = (uint8_t *)&v18;
LABEL_10:
        _os_log_impl(&dword_1A4E92000, v11, OS_LOG_TYPE_DEFAULT, v13, v14, 2u);
      }
    }
    else if (v12)
    {
      *(_WORD *)buf = 0;
      v13 = "green file already exists without state key";
      v14 = buf;
      goto LABEL_10;
    }

    goto LABEL_12;
  }
  _BYLoggingFacility();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_1A4E92000, v8, OS_LOG_TYPE_DEFAULT, "green file does not exist", v16, 2u);
  }
  v10 = 1;
LABEL_12:

  return v10;
}

- (BOOL)_shouldWriteInformedDefaultPlist
{
  uint64_t v3;
  NSObject *v4;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  LODWORD(v3) = -[BYGreenController plistStateCache](self, "plistStateCache");
  if ((_DWORD)v3 == -1)
  {
    v3 = -[BYGreenController _readPlistState](self, "_readPlistState");
    -[BYGreenController setPlistStateCache:](self, "setPlistStateCache:", v3);
  }
  if ((int)v3 >= 2)
  {
    _BYLoggingFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109120;
      v6[1] = v3;
      _os_log_impl(&dword_1A4E92000, v4, OS_LOG_TYPE_DEFAULT, "green write informed defaults unnecessary. already in state %d", (uint8_t *)v6, 8u);
    }

  }
  return (int)v3 < 2;
}

- (BOOL)_writePlistForLocaleRegionCode:(id)a3 desiredPlistState:(int)a4
{
  uint64_t v4;
  void *v6;

  v4 = *(_QWORD *)&a4;
  -[BYGreenController _extractGreenValuesForEffectivePlace:desiredPlistState:](self, "_extractGreenValuesForEffectivePlace:desiredPlistState:", -[BYGreenController _effectivePlaceForLocaleRegionCode:](self, "_effectivePlaceForLocaleRegionCode:", a3), *(_QWORD *)&a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = -[BYGreenController _writeFilesWithPlist:desiredPlistState:](self, "_writeFilesWithPlist:desiredPlistState:", v6, v4);

  return v4;
}

- (BOOL)_writeFilesWithPlist:(id)a3 desiredPlistState:(int)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  int v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  char v22;
  id v23;
  BYGreenController *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  char v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v30 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v6, 200, 0, &v30);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v30;
    if (v7)
    {
      -[BYGreenController _greenPlistFilePath](self, "_greenPlistFilePath");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v7, "writeToFile:options:error:", v8, 268435457, 0);

    }
    else
    {
      v22 = 0;
    }
    v10 = a4 << 6;
    v29 = (_BYTE)a4 << 6;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v24 = self;
    v11 = self->_relevantGreenKeys;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      v15 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v26 != v15)
            objc_enumerationMutation(v11);
          objc_msgSend(v6, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "BOOLValue");

          if (v18)
          {
            v10 |= 1 << (v14 + i);
            v29 = v10;
          }
        }
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
        v14 += i;
      }
      while (v13);
    }

    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v29, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[BYGreenController _greenBinaryFilePath](v24, "_greenBinaryFilePath");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "writeToFile:atomically:", v20, 1);

    v9 = v22;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_greenPlistFilePath
{
  return CFSTR("/var/mobile/Library/Application Support/com.apple.palette.green.plist");
}

- (id)_greenBinaryFilePath
{
  return CFSTR("/var/mobile/Library/Application Support/com.apple.palette.green.bin");
}

- (id)_extractGreenValuesForEffectivePlace:(unint64_t)a3 desiredPlistState:(int)a4
{
  uint64_t v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;

  v4 = *(_QWORD *)&a4;
  if (a3 > 2)
    v5 = CFSTR("dict4");
  else
    v5 = off_1E4E27708[a3];
  +[  objectForKey:](&unk_1E4E34808, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v9 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("state"));

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_skuRegionCode
{
  uint64_t v2;
  const void *v3;
  __CFString *v4;
  NSObject *v5;
  int v7;

  v7 = 0;
  v2 = MGCopyAnswerWithError();
  if (v2)
  {
    v3 = (const void *)v2;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v2);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFRelease(v3);
  }
  else
  {
    _BYLoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[BYGreenController _skuRegionCode].cold.1(&v7, v5);

    v4 = &stru_1E4E29440;
  }
  return v4;
}

- (BOOL)_skuRegionCodeIsAmbiguous
{
  void *v2;
  char v3;

  -[BYGreenController _skuRegionCode](self, "_skuRegionCode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("ZP")) & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "isEqualToString:", &stru_1E4E29440);

  return v3;
}

- (unint64_t)_effectivePlaceForLocaleRegionCode:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[BYGreenController _skuRegionCode](self, "_skuRegionCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("CH")) & 1) != 0)
  {
LABEL_2:
    v6 = 0;
    goto LABEL_7;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("TA")) & 1) != 0)
  {
LABEL_4:
    v6 = 1;
    goto LABEL_7;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("ZA")) & 1) != 0)
    goto LABEL_6;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("ZP")) & 1) == 0
    && !objc_msgSend(v5, "isEqualToString:", &stru_1E4E29440))
  {
    v6 = 3;
    goto LABEL_7;
  }
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("CN")) & 1) != 0)
    goto LABEL_2;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("TW")) & 1) != 0)
    goto LABEL_4;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("HK")) & 1) != 0)
  {
LABEL_6:
    v6 = 2;
    goto LABEL_7;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("MO")))
    v6 = 2;
  else
    v6 = 3;
LABEL_7:

  return v6;
}

- (int)plistStateCache
{
  return self->_plistStateCache;
}

- (void)setPlistStateCache:(int)a3
{
  self->_plistStateCache = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relevantGreenKeys, 0);
}

- (void)_skuRegionCode
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_1A4E92000, a2, OS_LOG_TYPE_ERROR, "green region code MG returned NULL; %d",
    (uint8_t *)v3,
    8u);
}

@end
