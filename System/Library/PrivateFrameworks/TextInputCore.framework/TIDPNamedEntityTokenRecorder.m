@implementation TIDPNamedEntityTokenRecorder

- (BOOL)report
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[TIDPRecorder characterExplodedRecords](self, "characterExplodedRecords");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v3)
  {
    v4 = v3;
    v18 = *(_QWORD *)v24;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(obj);
        v6 = *(id *)(*((_QWORD *)&v23 + 1) + 8 * v5);
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        -[TIDPNamedEntityTokenRecorder records](self, "records");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v20;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v20 != v11)
                objc_enumerationMutation(v8);
              objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v12), "toDPWordRecord");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "addObject:", v13);

              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          }
          while (v10);
        }

        v14 = (void *)objc_msgSend(v7, "copy");
        if (objc_msgSend(v14, "count"))
        {
          -[TIDPNamedEntityTokenRecorder delegate](self, "delegate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "record:", v14);

        }
        ++v5;
      }
      while (v5 != v4);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v4);
  }

  return 1;
}

- (id)records
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[TIDPRecorder typingSessionAligned](self, "typingSessionAligned");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alignedEntries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
    do
    {
      v10 = v8;
      v11 = v7;
      -[TIDPRecorder typingSessionAligned](self, "typingSessionAligned");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "alignedEntries");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "originalWord");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "acceptedString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "originalWord");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "acceptedCandidate");
      v16 = objc_claimAutoreleasedReturnValue();

      v17 = (id)v16;
      LODWORD(v16) = objc_msgSend(v17, "sourceMask") & 8;
      LODWORD(v16) = v16 | objc_msgSend(v17, "sourceMask") & 0x10;

      if ((_DWORD)v16)
      {
        +[TIDPWordRecord word:atPosition:](TIDPWordRecord, "word:atPosition:", v8, &unk_1EA140468);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v18);

      }
      ++v9;
      -[TIDPRecorder typingSessionAligned](self, "typingSessionAligned");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "alignedEntries");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");

    }
    while (v9 < v21);

  }
  v22 = (void *)objc_msgSend(v3, "copy");

  return v22;
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
  v10.super_class = (Class)TIDPNamedEntityTokenRecorder;
  -[TIDPRecorder delegate](&v10, sel_delegate);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0D1D338]);
    -[TIDPNamedEntityTokenRecorder recordingKey](self, "recordingKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithKey:", v5);

    v9.receiver = self;
    v9.super_class = (Class)TIDPNamedEntityTokenRecorder;
    -[TIDPRecorder setDelegate:](&v9, sel_setDelegate_, v6);

  }
  v8.receiver = self;
  v8.super_class = (Class)TIDPNamedEntityTokenRecorder;
  -[TIDPRecorder delegate](&v8, sel_delegate);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)recordingKey
{
  void *v2;
  void *v3;

  -[TIDPRecorder recordingKeyLocaleSubstring](self, "recordingKeyLocaleSubstring");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("com.apple.TextInput.AddressBookNameMatch."), "stringByAppendingString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
