@implementation CRLanguageUtils

+ (_LXLexicon)createDynamicLexicon:(id)a3 forLocale:(id)a4 error:(id *)a5
{
  id v7;
  _LXLexicon *v8;
  id v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  id v20;
  uint8_t v21[128];
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v20 = 0;
  v8 = +[CRLanguageUtils createDynamicLexiconForLocale:error:](CRLanguageUtils, "createDynamicLexiconForLocale:error:", a4, &v20);
  v9 = v20;
  if (v9)
  {
    CROSLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v9;
      _os_log_impl(&dword_1D4FB8000, v10, OS_LOG_TYPE_ERROR, "Unable to create custom lexicon: %@", buf, 0xCu);
    }

    if (a5)
      *a5 = objc_retainAutorelease(v9);
  }
  else if (v8)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v11);
          if (LXLexiconAdd())
            LXLexiconIncrementUsageCount();
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v12);
    }

  }
  return v8;
}

+ (_LXLexicon)createDynamicLexiconForLocale:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  _LXLexicon *Mutable;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *MEMORY[0x1E0D437B8];
  v10[0] = *MEMORY[0x1E0D437C8];
  v10[1] = v6;
  v11[0] = CFSTR("CR-Custom-Lexicon");
  v11[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  Mutable = (_LXLexicon *)LXLexiconCreateMutable();
  if (a4)
    *a4 = objc_retainAutorelease(0);

  return Mutable;
}

@end
