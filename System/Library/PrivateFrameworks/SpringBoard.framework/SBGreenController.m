@implementation SBGreenController

- (SBGreenController)init
{
  SBGreenController *v2;
  SBGreenController *v3;
  NSArray *relevantGreenKeys;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBGreenController;
  v2 = -[SBGreenController init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    relevantGreenKeys = v2->_relevantGreenKeys;
    v2->_relevantGreenKeys = (NSArray *)&unk_1E91CE2D8;

    v3->_fileExistenceState = 0;
  }
  return v3;
}

- (void)performPreBuddyWork
{
  void *v3;
  uint64_t v4;

  -[SBGreenController _readFileStateFromDisk](self, "_readFileStateFromDisk");
  if (self->_fileExistenceState - 1 <= 1)
  {
    v4 = 0;
    -[SBGreenController _defaultValuesDictionaryAndState:](self, "_defaultValuesDictionaryAndState:", &v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBGreenController _writeGreenValuesToDisk:withState:](self, "_writeGreenValuesToDisk:withState:", v3, v4);

  }
}

- (void)_readFileStateFromDisk
{
  void *v3;
  int v4;
  unint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  unint64_t v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t v13[16];
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileExistsAtPath:", CFSTR("/var/mobile/Library/Application Support/com.apple.palette.green.plist"));

  v5 = 3;
  if (!v4)
    v5 = 1;
  self->_fileExistenceState = v5;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", CFSTR("/var/mobile/Library/Application Support/com.apple.palette.green.plist"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("state"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    SBLogGreen();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
    if (v7)
    {
      if (v9)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_INFO, "Read non-empty file from disk", buf, 2u);
      }
      v10 = 3;
    }
    else if (v9)
    {
      *(_WORD *)v13 = 0;
      v10 = 2;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_INFO, "Empty on disk", v13, 2u);
    }
    else
    {
      v10 = 2;
    }

    self->_fileExistenceState = v10;
  }
  else
  {
    SBLogGreen();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_INFO, "File not on disk", v12, 2u);
    }

    self->_fileExistenceState = 1;
  }
}

- (id)_defaultValuesDictionaryAndState:(unint64_t *)a3
{
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSArray count](self->_relevantGreenKeys, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_relevantGreenKeys;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    v10 = MEMORY[0x1E0C9AAA0];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "setObject:forKey:", v10, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11++));
      }
      while (v8 != v11);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v13 = 0;
  if ((-[SBGreenController _effectivePlaceIsAmbiguous:](self, "_effectivePlaceIsAmbiguous:", &v13) & 0xFFFFFFFFFFFFFFFDLL) == 0)
    objc_msgSend(v5, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("key2"));
  if (a3)
    *a3 = v13 == 0;
  return v5;
}

- (BOOL)_writeGreenValuesToDisk:(id)a3 withState:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  int v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  int v20;
  void *v21;
  id v23;
  char v24;
  void *v25;
  SBGreenController *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  char v31;
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("state"));

    v32 = 0;
    v25 = v8;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v8, 200, 0, &v32);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v32;
    if (v10)
      v24 = objc_msgSend(v10, "writeToFile:options:error:", CFSTR("/var/mobile/Library/Application Support/com.apple.palette.green.plist"), 268435457, 0);
    else
      v24 = 0;
    v12 = (_DWORD)a4 << 6;
    v31 = (_BYTE)a4 << 6;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v26 = self;
    v13 = self->_relevantGreenKeys;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    if (v14)
    {
      v15 = v14;
      v16 = 0;
      v17 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v28 != v17)
            objc_enumerationMutation(v13);
          objc_msgSend(v7, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "BOOLValue");

          if (v20)
          {
            v12 |= 1 << (v16 + i);
            v31 = v12;
          }
        }
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
        v16 += i;
      }
      while (v15);
    }

    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v31, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "writeToFile:options:error:", CFSTR("/var/mobile/Library/Application Support/com.apple.palette.green.bin"), 268435457, 0);

    self = v26;
    v11 = v24;
  }
  else
  {
    v11 = 0;
  }
  -[SBGreenController _readFileStateFromDisk](self, "_readFileStateFromDisk");

  return v11;
}

- (unint64_t)_effectivePlaceIsAmbiguous:(BOOL *)a3
{
  void *v4;
  unint64_t v5;
  BOOL v6;
  void *v7;
  void *v8;

  -[SBGreenController _deviceRegionCode](self, "_deviceRegionCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("CH")) & 1) != 0)
  {
    v5 = 0;
    v6 = 0;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("TA")) & 1) != 0)
  {
    v6 = 0;
    v5 = 1;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("ZA")) & 1) != 0)
  {
    v6 = 0;
    v5 = 2;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("ZP")) & 1) != 0
         || objc_msgSend(v4, "isEqualToString:", &stru_1E8EC7EC0))
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "countryCode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("CN")) & 1) != 0)
    {
      v5 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TW")) & 1) != 0)
    {
      v5 = 1;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("HK")) & 1) != 0)
    {
      v5 = 2;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("MO")))
    {
      v5 = 2;
    }
    else
    {
      v5 = 3;
    }

    v6 = 1;
  }
  else
  {
    v6 = 0;
    v5 = 3;
  }
  if (a3)
    *a3 = v6;

  return v5;
}

- (id)_deviceRegionCode
{
  uint64_t v2;
  const void *v3;
  void *v4;
  NSObject *v6;
  uint8_t buf[4];
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = MGCopyAnswerWithError();
  if (v2)
  {
    v3 = (const void *)v2;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v3);
    return v4;
  }
  else
  {
    SBLogGreen();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v8 = 0;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_INFO, "MG returned NULL; %d", buf, 8u);
    }

    return &stru_1E8EC7EC0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relevantGreenKeys, 0);
}

@end
