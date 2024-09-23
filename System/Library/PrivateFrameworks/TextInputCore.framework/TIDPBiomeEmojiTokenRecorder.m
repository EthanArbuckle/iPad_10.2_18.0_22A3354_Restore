@implementation TIDPBiomeEmojiTokenRecorder

- (BOOL)report
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *context;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1DF0A2708](self, a2);
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[TIDPBiomeEmojiTokenRecorder records](self, "records");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "word");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "lowercaseString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = v11;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v11, "intValue") + 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v3, "setObject:forKey:", v13, v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v6);
  }

  v14 = objc_msgSend(v3, "count");
  if (v14)
  {
    -[TIDPBiomeEmojiTokenRecorder delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_opt_respondsToSelector();

    if ((v16 & 1) != 0)
    {
      -[TIDPBiomeEmojiTokenRecorder delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIDPRecorder recordingKeyLocaleSubstring](self, "recordingKeyLocaleSubstring");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIDPBiomeEmojiTokenRecorder recordingKey](self, "recordingKey");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "recordTokenFrequency:withLocale:withTokenType:", v3, v18, v19);

    }
  }

  objc_autoreleasePoolPop(context);
  return v14 != 0;
}

- (id)records
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[TIDPRecorder typingSessionAligned](self, "typingSessionAligned");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alignedEntries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v41;
    v33 = *(_QWORD *)v41;
    do
    {
      v9 = 0;
      v34 = v7;
      do
      {
        if (*(_QWORD *)v41 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v9);
        objc_msgSend(v10, "originalWord", v33);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "editedEntry");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          v14 = v12;
        }
        else
        {
          objc_msgSend(v10, "originalWord");
          v14 = (id)objc_claimAutoreleasedReturnValue();
        }
        v15 = v14;

        objc_msgSend(v15, "acceptedCandidate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "candidate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "_containsEmoji");

        if (v18)
        {
          objc_msgSend(v15, "acceptedCandidate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "candidate");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          +[TIDPWordRecord word:](TIDPWordRecord, "word:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v3, "addObject:", v21);
        }
        else
        {
          v38 = 0u;
          v39 = 0u;
          v36 = 0u;
          v37 = 0u;
          objc_msgSend(v10, "alignedKeyboardInputs");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
          if (v22)
          {
            v23 = v22;
            v35 = v15;
            v24 = *(_QWORD *)v37;
            do
            {
              for (i = 0; i != v23; ++i)
              {
                if (*(_QWORD *)v37 != v24)
                  objc_enumerationMutation(v21);
                v26 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
                objc_msgSend(v26, "string");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = objc_msgSend(v27, "_containsEmoji");

                if (v28)
                {
                  objc_msgSend(v26, "string");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  +[TIDPWordRecord word:](TIDPWordRecord, "word:", v29);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v3, "addObject:", v30);
                }
              }
              v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
            }
            while (v23);
            v8 = v33;
            v7 = v34;
            v15 = v35;
          }
        }

        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v7);
  }

  v31 = (void *)objc_msgSend(v3, "copy");
  return v31;
}

- (id)delegate
{
  void *v3;
  TIDPBiomeReportingDelegate *v4;
  objc_super v6;
  objc_super v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TIDPBiomeEmojiTokenRecorder;
  -[TIDPRecorder delegate](&v8, sel_delegate);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(TIDPBiomeReportingDelegate);
    v7.receiver = self;
    v7.super_class = (Class)TIDPBiomeEmojiTokenRecorder;
    -[TIDPRecorder setDelegate:](&v7, sel_setDelegate_, v4);

  }
  v6.receiver = self;
  v6.super_class = (Class)TIDPBiomeEmojiTokenRecorder;
  -[TIDPRecorder delegate](&v6, sel_delegate);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)recordingKey
{
  return (id)BMKeyboardTokenFrequencyTokenTypeAsString();
}

@end
