@implementation TIDPBiomeUnigramTokenRecorder

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
  -[TIDPBiomeUnigramTokenRecorder records](self, "records");
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
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
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
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v6);
  }

  v14 = objc_msgSend(v3, "count");
  if (v14)
  {
    -[TIDPBiomeUnigramTokenRecorder delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_opt_respondsToSelector();

    if ((v16 & 1) != 0)
    {
      -[TIDPBiomeUnigramTokenRecorder delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIDPRecorder recordingKeyLocaleSubstring](self, "recordingKeyLocaleSubstring");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIDPBiomeUnigramTokenRecorder recordingKey](self, "recordingKey");
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
  _UNKNOWN **v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  uint64_t v25;
  BOOL v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  id v40;
  TIDPBiomeUnigramTokenRecorder *v41;
  id v42;
  _UNKNOWN **v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  id obj;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int16 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  -[TIDPRecorder typingSessionAligned](self, "typingSessionAligned");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alignedEntries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v63;
    v9 = &off_1EA0F7000;
    v48 = *(_QWORD *)v63;
    v49 = v5;
    do
    {
      v10 = 0;
      v50 = v7;
      do
      {
        if (*(_QWORD *)v63 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v10);
        objc_msgSend(v11, "originalWord");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "editedEntry");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        v55 = v10;
        if (v13)
        {
          v15 = v13;
        }
        else
        {
          objc_msgSend(v11, "originalWord");
          v15 = (id)objc_claimAutoreleasedReturnValue();
        }
        v16 = v15;

        v17 = v16;
        objc_msgSend(v17, "acceptedString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "length");

        v20 = v17;
        if (v19)
        {
          objc_msgSend(v17, "acceptedString");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "_containsEmoji");

          v20 = v17;
          if ((v22 & 1) == 0)
          {
            objc_msgSend(v17, "keyboardState");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "textInputTraits");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = v17;
            v25 = objc_msgSend(v24, "autocorrectionType");

            v26 = v25 == 1;
            v17 = v54;
            if (v26)
              goto LABEL_30;
            objc_msgSend(v54, "acceptedString");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = 8217;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v61, 1);
            v28 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "rangeOfString:", v28);
            v52 = (void *)v28;
            if (v29)
            {
              objc_msgSend(v27, "stringByReplacingOccurrencesOfString:withString:", v28, CFSTR("'"));
              v30 = objc_claimAutoreleasedReturnValue();

              v27 = (void *)v30;
            }
            objc_msgSend(MEMORY[0x1E0CB3780], "punctuationCharacterSet");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "removeCharactersInString:", CFSTR("'-"));
            v51 = v31;
            objc_msgSend(v27, "stringByTrimmingCharactersInSet:", v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            v53 = v32;
            if (objc_msgSend(v32, "length"))
            {
              objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "componentsSeparatedByCharactersInSet:", v33);
              v34 = (void *)objc_claimAutoreleasedReturnValue();

              v59 = 0u;
              v60 = 0u;
              v57 = 0u;
              v58 = 0u;
              obj = v34;
              v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
              if (v35)
              {
                v36 = v35;
                v37 = *(_QWORD *)v58;
                do
                {
                  for (i = 0; i != v36; ++i)
                  {
                    if (*(_QWORD *)v58 != v37)
                      objc_enumerationMutation(obj);
                    v39 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
                    if (objc_msgSend(v39, "length"))
                    {
                      v40 = objc_alloc_init((Class)v9[481]);
                      objc_msgSend(v40, "setAcceptedString:", v39);
                      if (-[TIDPRecorder isWordEntryReallyOOV:caseSensitive:](self, "isWordEntryReallyOOV:caseSensitive:", v40, 1))
                      {
                        objc_msgSend(v39, "lowercaseString");
                        v41 = self;
                        v42 = v3;
                        v43 = v9;
                        v44 = (void *)objc_claimAutoreleasedReturnValue();
                        +[TIDPWordRecord word:](TIDPWordRecord, "word:", v44);
                        v45 = (void *)objc_claimAutoreleasedReturnValue();

                        v9 = v43;
                        v3 = v42;
                        self = v41;
                      }
                      else
                      {
                        +[TIDPWordRecord word:](TIDPWordRecord, "word:", v39);
                        v45 = (void *)objc_claimAutoreleasedReturnValue();
                      }
                      objc_msgSend(v3, "addObject:", v45);

                    }
                  }
                  v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
                }
                while (v36);
              }

              v5 = v49;
              v7 = v50;
              v8 = v48;
              v17 = v54;
            }

            v20 = v53;
          }
        }

LABEL_30:
        v10 = v55 + 1;
      }
      while (v55 + 1 != v7);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
    }
    while (v7);
  }

  v46 = (void *)objc_msgSend(v3, "copy");
  return v46;
}

- (id)delegate
{
  void *v3;
  TIDPBiomeReportingDelegate *v4;
  objc_super v6;
  objc_super v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TIDPBiomeUnigramTokenRecorder;
  -[TIDPRecorder delegate](&v8, sel_delegate);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(TIDPBiomeReportingDelegate);
    v7.receiver = self;
    v7.super_class = (Class)TIDPBiomeUnigramTokenRecorder;
    -[TIDPRecorder setDelegate:](&v7, sel_setDelegate_, v4);

  }
  v6.receiver = self;
  v6.super_class = (Class)TIDPBiomeUnigramTokenRecorder;
  -[TIDPRecorder delegate](&v6, sel_delegate);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)recordingKey
{
  return (id)BMKeyboardTokenFrequencyTokenTypeAsString();
}

@end
