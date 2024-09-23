@implementation TIDPUnknownTokenRecorder

- (BOOL)report
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v27;
  id obj;
  TIDPUnknownTokenRecorder *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  const __CFString *v38;
  __CFString *v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1DF0A2708](self, a2);
  v29 = self;
  -[TIDPRecorder characterExplodedRecords](self, "characterExplodedRecords");
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
  if (v4)
  {
    v5 = v4;
    v27 = v3;
    v6 = 0;
    v7 = *(_QWORD *)v35;
    do
    {
      v8 = 0;
      v9 = v6;
      do
      {
        if (*(_QWORD *)v35 != v7)
          objc_enumerationMutation(obj);
        v10 = *(id *)(*((_QWORD *)&v34 + 1) + 8 * v8);
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v10, "count"));
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v12 = v10;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v31;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v31 != v15)
                objc_enumerationMutation(v12);
              objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "codedWord");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (v17)
                objc_msgSend(v11, "addObject:", v17);

            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
          }
          while (v14);
        }

        objc_msgSend(v12, "firstObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "coderVersion");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = (void *)objc_msgSend(v11, "copy");
        if (objc_msgSend(v19, "count"))
        {
          objc_msgSend(v6, "UUIDString");
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = (void *)v20;
          v22 = CFSTR("UNKNOWN_VERSION");
          if (v20)
            v22 = (__CFString *)v20;
          v23 = v22;

          -[TIDPUnknownTokenRecorder delegate](v29, "delegate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = CFSTR("VersionHash");
          v39 = v23;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v24, "record:metadata:", v19, v25);
        }

        ++v8;
        v9 = v6;
      }
      while (v8 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
    }
    while (v5);

    v3 = v27;
  }

  objc_autoreleasePoolPop(v3);
  return 1;
}

- (id)records
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v23;
  int v24;
  const char *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[TIDPRecorder characterCoder](self, "characterCoder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[TIDPRecorder typingSessionAligned](self, "typingSessionAligned");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "alignedEntries");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      v8 = 0;
      v9 = 0;
      do
      {
        v10 = v9;
        -[TIDPRecorder typingSessionAligned](self, "typingSessionAligned");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "alignedEntries");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndexedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "originalWord");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v12) = -[TIDPRecorder isWordEntryReallyOOV:caseSensitive:](self, "isWordEntryReallyOOV:caseSensitive:", v13, 0);

        if ((_DWORD)v12)
        {
          objc_msgSend(v9, "originalWord");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "acceptedString");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIDPRecorder characterCoder](self, "characterCoder");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          +[TIDPWordRecord word:atPosition:coder:](TIDPWordRecord, "word:atPosition:coder:", v15, &unk_1EA1404F8, v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v4, "addObject:", v17);
        }
        ++v8;
        -[TIDPRecorder typingSessionAligned](self, "typingSessionAligned");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "alignedEntries");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "count");

      }
      while (v8 < v20);

    }
    v21 = (void *)objc_msgSend(v4, "copy");

    return v21;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      -[TIDPRecorder recordingKeyLocaleSubstring](self, "recordingKeyLocaleSubstring");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 136315394;
      v25 = "-[TIDPUnknownTokenRecorder records]";
      v26 = 2112;
      v27 = v23;
      _os_log_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s  Not recording unknown tokens for locale '%@' because a valid character coder could not be loaded.", (uint8_t *)&v24, 0x16u);

    }
    return MEMORY[0x1E0C9AA60];
  }
}

- (id)delegate
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  objc_super v8;
  objc_super v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TIDPUnknownTokenRecorder;
  -[TIDPRecorder delegate](&v10, sel_delegate);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0D1D320]);
    -[TIDPUnknownTokenRecorder recordingKey](self, "recordingKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithKey:", v5);

    v9.receiver = self;
    v9.super_class = (Class)TIDPUnknownTokenRecorder;
    -[TIDPRecorder setDelegate:](&v9, sel_setDelegate_, v6);

  }
  v8.receiver = self;
  v8.super_class = (Class)TIDPUnknownTokenRecorder;
  -[TIDPRecorder delegate](&v8, sel_delegate);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)recordingKey
{
  void *v2;
  void *v3;

  -[TIDPRecorder recordingKeyLocaleSubstring](self, "recordingKeyLocaleSubstring");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("com.apple.TextInput.UnknownToken."), "stringByAppendingString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
