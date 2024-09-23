@implementation TIDPNgramRecorder

- (TIDPNgramRecorder)initWithTypingSession:(id)a3 aligned:(id)a4 n:(unint64_t)a5 shouldDonateNgramSampleRandomly:(BOOL)a6
{
  _BOOL8 v6;
  TIDPNgramRecorder *v7;
  TIDPNgramRecorder *v8;
  objc_super v10;

  v6 = a6;
  v10.receiver = self;
  v10.super_class = (Class)TIDPNgramRecorder;
  v7 = -[TIDPNgramRecorderCascading initWithTypingSession:aligned:n:](&v10, sel_initWithTypingSession_aligned_n_, a3, a4, a5);
  v8 = v7;
  if (v7)
    -[TIDPNgramRecorder setShouldDonateNgramSampleRandomly:](v7, "setShouldDonateNgramSampleRandomly:", v6);
  return v8;
}

- (id)recordingKey
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.TextInput.WordNgrams.%lu."), -[TIDPNgramRecorderCascading n](self, "n"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIDPRecorder recordingKeyLocaleSubstring](self, "recordingKeyLocaleSubstring");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
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
  v10.super_class = (Class)TIDPNgramRecorder;
  -[TIDPRecorder delegate](&v10, sel_delegate);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0D1D320]);
    -[TIDPNgramRecorder recordingKey](self, "recordingKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithKey:", v5);

    v9.receiver = self;
    v9.super_class = (Class)TIDPNgramRecorder;
    -[TIDPRecorder setDelegate:](&v9, sel_setDelegate_, v6);

  }
  v8.receiver = self;
  v8.super_class = (Class)TIDPNgramRecorder;
  -[TIDPRecorder delegate](&v8, sel_delegate);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)records
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  id v8;
  void *v9;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  TIDPNgramRecorder *v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[TIDPRecorder wordCoder](self, "wordCoder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = (void *)objc_opt_class();
    -[TIDPRecorder typingSessionAligned](self, "typingSessionAligned");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[TIDPNgramRecorderCascading n](self, "n");
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __28__TIDPNgramRecorder_records__block_invoke;
    v15 = &unk_1EA106A08;
    v16 = self;
    v17 = v4;
    v8 = v4;
    objc_msgSend(v5, "enumerateNgramsFromSession:n:usingBlock:", v6, v7, &v12);

    v9 = (void *)objc_msgSend(v8, "copy", v12, v13, v14, v15, v16);
    return v9;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      -[TIDPRecorder recordingKeyLocaleSubstring](self, "recordingKeyLocaleSubstring");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v19 = "-[TIDPNgramRecorder records]";
      v20 = 2112;
      v21 = v11;
      _os_log_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s  Not recording n-grams for locale '%@' because a valid word coder could not be loaded.", buf, 0x16u);

    }
    return MEMORY[0x1E0C9AA60];
  }
}

- (id)randomRecords
{
  return -[TIDPNgramRecorder randomRecordsLimitedByCount:](self, "randomRecordsLimitedByCount:", 1);
}

- (id)randomRecordsLimitedByCount:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint32_t v9;
  unint64_t v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  id v15;

  -[TIDPNgramRecorder records](self, "records");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") <= a3)
  {
    v15 = v5;
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", a3);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a3);
    -[TIDPNgramRecorder records](self, "records");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    while (objc_msgSend(v6, "count") < a3)
    {
      v10 = arc4random_uniform(v9);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v6, "containsObject:", v11);

      if ((v12 & 1) == 0 && objc_msgSend(v5, "count") >= v10)
      {
        objc_msgSend(v5, "objectAtIndex:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v14);

      }
    }
    v15 = (id)objc_msgSend(v7, "copy");

  }
  return v15;
}

- (BOOL)report
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  __CFString *v28;
  __CFString *v29;
  void *v30;
  void *v31;
  BOOL v32;
  uint64_t v34;
  void *v35;
  TIDPNgramRecorder *v36;
  void *context;
  id obj;
  id obja;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  const __CFString *v53;
  __CFString *v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1DF0A2708](self, a2);
  v36 = self;
  if (-[TIDPNgramRecorder shouldDonateNgramSampleRandomly](self, "shouldDonateNgramSampleRandomly"))
    -[TIDPNgramRecorder randomRecords](self, "randomRecords");
  else
    -[TIDPNgramRecorder records](self, "records");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v50;
    do
    {
      v8 = 0;
      v9 = v6;
      do
      {
        if (*(_QWORD *)v50 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v8);
        v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v12 = v10;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v46;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v46 != v15)
                objc_enumerationMutation(v12);
              objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "codedWord");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (v17)
                objc_msgSend(v11, "addObject:", v17);

            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
          }
          while (v14);
        }

        objc_msgSend(v12, "firstObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "coderVersion");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v40, "addObject:", v11);
        ++v8;
        v9 = v6;
      }
      while (v8 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  v19 = (void *)objc_msgSend(v40, "copy");
  v20 = objc_msgSend(v19, "count");
  if (v20)
  {
    v34 = v20;
    v35 = v19;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    obja = v19;
    v21 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v42;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v42 != v23)
            objc_enumerationMutation(obja);
          v25 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j);
          objc_msgSend(v6, "UUIDString", v34, v35);
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = (void *)v26;
          v28 = CFSTR("UNKNOWN_VERSION");
          if (v26)
            v28 = (__CFString *)v26;
          v29 = v28;

          -[TIDPNgramRecorder delegate](v36, "delegate");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = CFSTR("VersionHash");
          v54 = v29;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "record:metadata:", v25, v31);

        }
        v22 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
      }
      while (v22);
    }

    v20 = v34;
    v19 = v35;
  }
  v32 = v20 != 0;

  objc_autoreleasePoolPop(context);
  return v32;
}

- (id)_normalizedWordEntryStringForWordEntry:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "originalWord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[TIDPRecorder isWordEntryReallyOOV:caseSensitive:](self, "isWordEntryReallyOOV:caseSensitive:", v5, 0);

  if ((self & 1) != 0)
  {
    v6 = CFSTR("u_token");
  }
  else
  {
    objc_msgSend(v4, "originalWord");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "acceptedString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lowercaseString");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (BOOL)shouldDonateNgramSampleRandomly
{
  return self->_shouldDonateNgramSampleRandomly;
}

- (void)setShouldDonateNgramSampleRandomly:(BOOL)a3
{
  self->_shouldDonateNgramSampleRandomly = a3;
}

void __28__TIDPNgramRecorder_records__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v8);
        if ((objc_msgSend(v9, "isStandaloneString") & 1) != 0)
        {
          objc_msgSend(v9, "wordString");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v11 = *(void **)(a1 + 32);
          objc_msgSend(v9, "wordEntryAligned");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "_normalizedWordEntryStringForWordEntry:", v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

        }
        ++v8;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6 + v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "wordCoder");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[TIDPWordRecord word:atPosition:coder:](TIDPWordRecord, "word:atPosition:coder:", v10, v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "addObject:", v15);
      }
      while (v5 != v8);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v6 += v8;
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v17);
}

+ (void)enumerateNgramsFromSession:(id)a3 n:(unint64_t)a4 usingBlock:(id)a5
{
  id v7;
  void (**v8)(id, void *, _BYTE *);
  void *v9;
  uint64_t v10;
  void *v11;
  TIDPNgramWordEntryPair *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  TIDPNgramWordEntryPair *v21;
  TIDPNgramWordEntryPair *v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  unint64_t v29;
  id v30;
  char v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, void *, _BYTE *))a5;
  objc_msgSend(v7, "alignedEntries");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10 && v10 + 2 >= a4)
  {
    v29 = a4;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[TIDPNgramWordEntryPair initWithWordString:]([TIDPNgramWordEntryPair alloc], "initWithWordString:", CFSTR("<s>"));
    objc_msgSend(v11, "addObject:", v12);

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v30 = v7;
    objc_msgSend(v7, "alignedEntries");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v33 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v18, "originalWord");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "acceptedString");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
          {
            v21 = -[TIDPNgramWordEntryPair initWithWordString:wordEntryAligned:]([TIDPNgramWordEntryPair alloc], "initWithWordString:wordEntryAligned:", v20, v18);
            objc_msgSend(v11, "addObject:", v21);

          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v15);
    }

    v22 = -[TIDPNgramWordEntryPair initWithWordString:]([TIDPNgramWordEntryPair alloc], "initWithWordString:", CFSTR("</s>"));
    objc_msgSend(v11, "addObject:", v22);

    v23 = objc_msgSend(v11, "count");
    if (v23 < a4)
      a4 = v23;
    v31 = 0;
    objc_msgSend(v11, "count");
    v24 = 0;
    v25 = 0;
    do
    {
      v26 = v25;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v29);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (a4)
      {
        v27 = 0;
        do
        {
          if (v27 >= objc_msgSend(v11, "count") - 1)
            break;
          objc_msgSend(v11, "objectAtIndexedSubscript:", v24 + v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addObject:", v28);

          ++v27;
        }
        while (a4 != v27);
      }
      v8[2](v8, v25, &v31);
      ++v24;
    }
    while (v24 <= objc_msgSend(v11, "count") - a4 && !v31);

    v7 = v30;
  }

}

@end
