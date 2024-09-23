@implementation TIDPBiomeNamedEntityTokenRecorder

- (id)delegate
{
  void *v3;
  TIDPBiomeReportingDelegate *v4;
  objc_super v6;
  objc_super v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TIDPBiomeNamedEntityTokenRecorder;
  -[TIDPRecorder delegate](&v8, sel_delegate);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(TIDPBiomeReportingDelegate);
    v7.receiver = self;
    v7.super_class = (Class)TIDPBiomeNamedEntityTokenRecorder;
    -[TIDPRecorder setDelegate:](&v7, sel_setDelegate_, v4);

  }
  v6.receiver = self;
  v6.super_class = (Class)TIDPBiomeNamedEntityTokenRecorder;
  -[TIDPRecorder delegate](&v6, sel_delegate);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)shouldSkipWordEntry:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "acceptedCandidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_msgSend(v3, "sourceMask") & 8) == 0;

  return v4;
}

- (id)givenNameRecordingKey
{
  return (id)BMKeyboardTokenFrequencyTokenTypeAsString();
}

- (id)surnameRecordingKey
{
  return (id)BMKeyboardTokenFrequencyTokenTypeAsString();
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
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v28;
  TIDPBiomeNamedEntityTokenRecorder *v29;
  uint64_t v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[TIDPRecorder typingSessionAligned](self, "typingSessionAligned");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alignedEntries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v37;
    v28 = *(_QWORD *)v37;
    v29 = self;
    do
    {
      v9 = 0;
      v30 = v7;
      do
      {
        if (*(_QWORD *)v37 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v9);
        objc_msgSend(v10, "originalWord", v28, v29);
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

        if (!-[TIDPBiomeNamedEntityTokenRecorder shouldSkipWordEntry:](self, "shouldSkipWordEntry:", v15))
        {
          objc_msgSend(v15, "acceptedString");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "componentsSeparatedByCharactersInSet:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v34 = 0u;
          v35 = 0u;
          v32 = 0u;
          v33 = 0u;
          v19 = v18;
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v33;
            do
            {
              for (i = 0; i != v21; ++i)
              {
                if (*(_QWORD *)v33 != v22)
                  objc_enumerationMutation(v19);
                v24 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
                if (objc_msgSend(v24, "length"))
                {
                  +[TIDPWordRecord word:](TIDPWordRecord, "word:", v24);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v3, "addObject:", v25);

                }
              }
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
            }
            while (v21);
          }

          v8 = v28;
          self = v29;
          v7 = v30;
        }

        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v7);
  }

  v26 = (void *)objc_msgSend(v3, "copy");
  return v26;
}

- (id)filterTokenFrequencies:(id)a3 forTokenClass:(unsigned int)a4
{
  id v5;
  uint64_t SharedVocabulary;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  unsigned int v13;

  v5 = a3;
  SharedVocabulary = LMVocabularyGetSharedVocabulary();
  objc_msgSend(v5, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __74__TIDPBiomeNamedEntityTokenRecorder_filterTokenFrequencies_forTokenClass___block_invoke;
  v12[3] = &__block_descriptor_44_e35_B24__0__NSString_8__NSDictionary_16l;
  v12[4] = SharedVocabulary;
  v13 = a4;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filteredArrayUsingPredicate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "dictionaryWithValuesForKeys:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

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
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *context;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1DF0A2708](self, a2);
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[TIDPBiomeNamedEntityTokenRecorder records](self, "records");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v9, "word");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v11, "intValue") + 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v9, "word");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKey:", v12, v13);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v3, "count"))
  {
    -[TIDPBiomeNamedEntityTokenRecorder filterTokenFrequencies:forTokenClass:](self, "filterTokenFrequencies:forTokenClass:", v3, 68);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIDPBiomeNamedEntityTokenRecorder filterTokenFrequencies:forTokenClass:](self, "filterTokenFrequencies:forTokenClass:", v3, 69);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "count") || objc_msgSend(v15, "count"))
    {
      -[TIDPBiomeNamedEntityTokenRecorder delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_opt_respondsToSelector();

      if ((v17 & 1) != 0)
      {
        if (objc_msgSend(v14, "count"))
        {
          -[TIDPBiomeNamedEntityTokenRecorder delegate](self, "delegate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIDPRecorder recordingKeyLocaleSubstring](self, "recordingKeyLocaleSubstring");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIDPBiomeNamedEntityTokenRecorder givenNameRecordingKey](self, "givenNameRecordingKey");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "recordTokenFrequency:withLocale:withTokenType:", v14, v19, v20);

        }
        if (objc_msgSend(v15, "count"))
        {
          -[TIDPBiomeNamedEntityTokenRecorder delegate](self, "delegate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIDPRecorder recordingKeyLocaleSubstring](self, "recordingKeyLocaleSubstring");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIDPBiomeNamedEntityTokenRecorder surnameRecordingKey](self, "surnameRecordingKey");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "recordTokenFrequency:withLocale:withTokenType:", v15, v22, v23);

        }
      }
      v24 = 0;
    }
    else
    {
      v24 = 1;
    }

  }
  else
  {
    v24 = 1;
  }

  objc_autoreleasePoolPop(context);
  return v24 == 0;
}

BOOL __74__TIDPBiomeNamedEntityTokenRecorder_filterTokenFrequencies_forTokenClass___block_invoke(uint64_t a1)
{
  LMVocabularyGetTokenIDForLemma();
  return LMVocabularyGetClassForTokenID() == *(_DWORD *)(a1 + 40);
}

@end
