@implementation CRFormContentTypeKeywordBasedPredictor

+ (id)supportedLanguages
{
  if (_MergedGlobals_10 != -1)
    dispatch_once(&_MergedGlobals_10, &__block_literal_global_6);
  objc_msgSend((id)qword_1ED0B4350, "addObject:", CFSTR("unknown"));
  return (id)qword_1ED0B4350;
}

void __60__CRFormContentTypeKeywordBasedPredictor_supportedLanguages__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  _QWORD v15[15];

  v15[13] = *MEMORY[0x1E0C80C00];
  v15[0] = CFSTR("de-DE");
  v15[1] = CFSTR("en-US");
  v15[2] = CFSTR("es-ES");
  v15[3] = CFSTR("fr-FR");
  v15[4] = CFSTR("it-IT");
  v15[5] = CFSTR("ja-JP");
  v15[6] = CFSTR("ko-KR");
  v15[7] = CFSTR("pt-BR");
  v15[8] = CFSTR("ru-RU");
  v15[9] = CFSTR("th-TH");
  v15[10] = CFSTR("uk-UA");
  v15[11] = CFSTR("vi-VT");
  v15[12] = CFSTR("zh-Hans");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 13);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_opt_new();
  v2 = (void *)qword_1ED0B4350;
  qword_1ED0B4350 = v1;

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = v0;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6), (_QWORD)v10);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)qword_1ED0B4350;
        objc_msgSend(v7, "languageCode");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v9);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

  objc_msgSend((id)qword_1ED0B4350, "addObject:", CFSTR("unknown"));
}

+ (id)lookupLanguagesForLanguage:(id)a3
{
  id v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[5];
  _QWORD v11[3];
  _QWORD v12[9];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("ja")))
    {
      v13[0] = v4;
      v13[1] = CFSTR("unknown");
      v13[2] = CFSTR("zh");
      v13[3] = CFSTR("en");
      v5 = v13;
      v6 = 4;
    }
    else
    {
      if (!objc_msgSend(v4, "isEqualToString:", CFSTR("uk")))
      {
        if (objc_msgSend(v4, "isEqualToString:", CFSTR("ru")))
        {
          v11[0] = v4;
          v11[1] = CFSTR("en");
          v11[2] = CFSTR("unknown");
          v5 = v11;
        }
        else
        {
          if (objc_msgSend(v4, "isEqualToString:", CFSTR("fr")))
          {
            v10[0] = v4;
            v10[1] = CFSTR("es");
            v10[2] = CFSTR("it");
            v10[3] = CFSTR("unknown");
            v10[4] = CFSTR("en");
            v5 = v10;
            v6 = 5;
            goto LABEL_13;
          }
          v9[0] = v4;
          v9[1] = CFSTR("en");
          v9[2] = CFSTR("unknown");
          v5 = v9;
        }
        v6 = 3;
        goto LABEL_13;
      }
      v12[0] = v4;
      v12[1] = CFSTR("ru");
      v12[2] = CFSTR("unknown");
      v12[3] = CFSTR("en");
      v12[4] = CFSTR("de");
      v12[5] = CFSTR("es");
      v5 = v12;
      v12[6] = CFSTR("fr");
      v12[7] = CFSTR("it");
      v12[8] = CFSTR("pt");
      v6 = 9;
    }
LABEL_13:
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v7 = &unk_1E993CF98;
LABEL_14:

  return v7;
}

+ (id)_keywordMapForPriorityKeywords:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v4;
  _QWORD block[5];

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__CRFormContentTypeKeywordBasedPredictor__keywordMapForPriorityKeywords___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ED0B4358 != -1)
    dispatch_once(&qword_1ED0B4358, block);
  v4 = 3;
  if (v3)
    v4 = 4;
  return (id)_MergedGlobals_10[v4];
}

void __73__CRFormContentTypeKeywordBasedPredictor__keywordMapForPriorityKeywords___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  unint64_t v17;
  __CFString *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t m;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  id obj;
  uint64_t i;
  id v37;
  id v38;
  __CFString *v39;
  uint64_t v40;
  uint64_t v42;
  uint64_t k;
  id v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  _QWORD v65[2];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v1 = objc_opt_new();
  v2 = (void *)qword_1ED0B4360;
  qword_1ED0B4360 = v1;

  v3 = objc_opt_new();
  v4 = (void *)qword_1ED0B4368;
  qword_1ED0B4368 = v3;

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v65[0] = qword_1ED0B4360;
  v65[1] = qword_1ED0B4368;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 2);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
  if (v33)
  {
    v34 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v59 != v34)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        objc_msgSend(*(id *)(a1 + 32), "supportedLanguages");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
        if (v7)
        {
          v8 = *(_QWORD *)v55;
          do
          {
            for (j = 0; j != v7; ++j)
            {
              if (*(_QWORD *)v55 != v8)
                objc_enumerationMutation(v6);
              v10 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * j);
              v11 = (void *)objc_opt_new();
              objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v10);

            }
            v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
          }
          while (v7);
        }

        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        getFormContentTypeMappings();
        v37 = (id)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
        if (v42)
        {
          v40 = *(_QWORD *)v51;
          do
          {
            for (k = 0; k != v42; ++k)
            {
              if (*(_QWORD *)v51 != v40)
                objc_enumerationMutation(v37);
              v12 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * k);
              objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("locale"));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v13);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 32), "supportedLanguages");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "containsObject:", v13);

              if ((v15 & 1) != 0)
              {
                objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("type"));
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = +[CRFormContentTypeUtilities contentTypeFromString:](CRFormContentTypeUtilities, "contentTypeFromString:", v16);

                v18 = CFSTR("keywords");
                if (v5 == (void *)qword_1ED0B4368)
                  v18 = CFSTR("priorityKeywords");
                v39 = v18;
                objc_msgSend(v12, "objectForKeyedSubscript:");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                if (v19)
                {
                  v48 = 0u;
                  v49 = 0u;
                  v46 = 0u;
                  v47 = 0u;
                  v38 = v19;
                  v44 = v19;
                  v20 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
                  if (v20)
                  {
                    v21 = *(_QWORD *)v47;
                    do
                    {
                      for (m = 0; m != v20; ++m)
                      {
                        if (*(_QWORD *)v47 != v21)
                          objc_enumerationMutation(v44);
                        v23 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * m);
                        if (v45)
                          objc_msgSend(v23, "lowercaseStringWithLocale:");
                        else
                          objc_msgSend(v23, "lowercaseString");
                        v24 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v5, "objectForKeyedSubscript:", v13);
                        v25 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v25, "allKeys");
                        v26 = (void *)objc_claimAutoreleasedReturnValue();
                        v27 = objc_msgSend(v26, "containsObject:", v24);

                        if ((v27 & 1) == 0)
                        {
                          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                          v28 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v5, "objectForKeyedSubscript:", v13);
                          v29 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v29, "setObject:forKeyedSubscript:", v28, v24);

                        }
                        objc_msgSend(v5, "objectForKeyedSubscript:", v13);
                        v30 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v30, "objectForKeyedSubscript:", v24);
                        v31 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17);
                        v32 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v31, "addObject:", v32);

                      }
                      v20 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
                    }
                    while (v20);
                  }

                  v19 = v38;
                }

              }
            }
            v42 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
          }
          while (v42);
        }

      }
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
    }
    while (v33);
  }

}

+ (id)useKeywordTypes
{
  if (qword_1ED0B4378 != -1)
    dispatch_once(&qword_1ED0B4378, &__block_literal_global_41);
  return (id)qword_1ED0B4370;
}

void __57__CRFormContentTypeKeywordBasedPredictor_useKeywordTypes__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E993CFB0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0B4370;
  qword_1ED0B4370 = v0;

}

+ (unint64_t)predictContentTypeWithKeywordMatching:(id)a3 locale:(id)a4 keyword:(id *)a5 withPriorityKeywords:(BOOL)a6
{
  _BOOL8 v6;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  uint64_t *v12;
  int v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t m;
  void *v37;
  void *v38;
  unint64_t v40;
  void *v41;
  void *v42;
  uint64_t v44;
  int v45;
  const __CFString *v46;
  uint64_t v47;
  uint64_t k;
  uint64_t v49;
  _BOOL4 v50;
  uint64_t i;
  id v53;
  void *v54;
  void *v55;
  id v56;
  id obj;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  _QWORD v75[5];

  v6 = a6;
  v75[3] = *MEMORY[0x1E0C80C00];
  v53 = a3;
  v56 = a4;
  if (qword_1ED0B4380 != -1)
    dispatch_once(&qword_1ED0B4380, &__block_literal_global_55_0);
  v50 = v6;
  objc_msgSend(a1, "_keywordMapForPriorityKeywords:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v56);
  v9 = objc_claimAutoreleasedReturnValue();
  v55 = (void *)v9;
  if (v9)
    objc_msgSend(v53, "lowercaseStringWithLocale:", v9);
  else
    objc_msgSend(v53, "lowercaseString");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "languageCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v10;
  v11 = &stru_1E98DC948;
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("zh")) & 1) != 0)
  {
    v46 = &stru_1E98DC948;
    v12 = &qword_1ED0B4390;
    v13 = 1;
  }
  else
  {
    v14 = objc_msgSend(v10, "isEqualToString:", CFSTR("ja"));
    v13 = v14;
    if (!v14)
      v11 = CFSTR(" ");
    v46 = v11;
    v12 = &qword_1ED0B4388;
    if (v14)
      v12 = &qword_1ED0B4390;
  }
  objc_msgSend(v54, "_crStringByReplacingCharactersInSet:withString:", *v12, CFSTR(" "));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v75[0] = v15;
  v16 = 8;
  if (v13)
    v16 = 9;
  objc_msgSend(v54, "_crStringByReplacingCharactersInSet:withString:", _MergedGlobals_10[v16], &stru_1E98DC948);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v13;
  v75[1] = v17;
  v75[2] = v54;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  obj = v18;
  v19 = v59;
  v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
  if (v44)
  {
    v49 = *(_QWORD *)v69;
    do
    {
      for (i = 0; i != v44; ++i)
      {
        if (*(_QWORD *)v69 != v49)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
        v64 = 0u;
        v65 = 0u;
        v66 = 0u;
        v67 = 0u;
        objc_msgSend(a1, "lookupLanguagesForLanguage:", v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
        if (v22)
        {
          v23 = *(_QWORD *)v65;
          while (2)
          {
            for (j = 0; j != v22; ++j)
            {
              if (*(_QWORD *)v65 != v23)
                objc_enumerationMutation(v21);
              v25 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * j);
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("^%@$"), v20);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "objectForKeyedSubscript:", v25);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "objectForKey:", v26);
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              if (v28)
              {
                objc_msgSend(v28, "firstObject");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                v40 = objc_msgSend(v41, "unsignedIntegerValue");

                if (a5)
                  *a5 = objc_retainAutorelease(v26);
LABEL_61:

                goto LABEL_62;
              }

            }
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
            if (v22)
              continue;
            break;
          }
        }

        if (v45)
        {
          objc_msgSend(v20, "_crArrayOfComposedCharacters");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 5;
        }
        else
        {
          objc_msgSend(v20, "componentsSeparatedByString:", CFSTR(" "));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 6;
        }
        v30 = objc_msgSend(v21, "count");
        if (v30 >= 1)
        {
          if (v30 >= v29)
            v31 = v29;
          else
            v31 = v30;
          v47 = v31;
          do
          {
            for (k = 0; k + v47 <= (unint64_t)objc_msgSend(v21, "count"); ++k)
            {
              v32 = objc_msgSend(v59, "isEqualToString:", CFSTR("ja")) ^ 1;
              if ((unint64_t)v47 > 2)
                LOBYTE(v32) = 1;
              if ((v32 & 1) != 0 || k + v47 == objc_msgSend(v21, "count"))
              {
                objc_msgSend(v21, "subarrayWithRange:", k, v47);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "componentsJoinedByString:", v46);
                v26 = (void *)objc_claimAutoreleasedReturnValue();

                v62 = 0u;
                v63 = 0u;
                v60 = 0u;
                v61 = 0u;
                objc_msgSend(a1, "lookupLanguagesForLanguage:", v59);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v34 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
                if (v34)
                {
                  v35 = *(_QWORD *)v61;
                  while (2)
                  {
                    for (m = 0; m != v34; ++m)
                    {
                      if (*(_QWORD *)v61 != v35)
                        objc_enumerationMutation(v28);
                      objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * m));
                      v37 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v37, "objectForKey:", v26);
                      v38 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v38)
                      {
                        objc_msgSend(v38, "firstObject");
                        v42 = (void *)objc_claimAutoreleasedReturnValue();
                        v40 = objc_msgSend(v42, "unsignedIntegerValue");

                        if (a5)
                          *a5 = objc_retainAutorelease(v26);

                        goto LABEL_61;
                      }
                    }
                    v34 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
                    if (v34)
                      continue;
                    break;
                  }
                }

              }
            }
          }
          while (v47-- > 1);
        }

        v19 = v59;
      }
      v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
    }
    while (v44);
  }

  v40 = !v50;
LABEL_62:

  return v40;
}

void __116__CRFormContentTypeKeywordBasedPredictor_predictContentTypeWithKeywordMatching_locale_keyword_withPriorityKeywords___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(":.,;-—_/()[]<>"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0B4388;
  qword_1ED0B4388 = v0;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(":：.,;-—_()[]<>"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0B4390;
  qword_1ED0B4390 = v2;

}

+ (BOOL)_shouldPredictContentTypeForLabel:(id)a3 locale:(id)a4
{
  id v5;
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v5 = a3;
  v6 = a4;
  if (!v6
    || !+[CRImageReader languageIsChinese:](CRImageReader, "languageIsChinese:", v6)
    && !+[CRImageReader languageIsJapanese:](CRImageReader, "languageIsJapanese:", v6)
    && !+[CRImageReader languageIsKorean:](CRImageReader, "languageIsKorean:", v6))
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsSeparatedByCharactersInSet:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10 > 0x10)
      goto LABEL_6;
LABEL_8:
    v7 = 1;
    goto LABEL_9;
  }
  if ((unint64_t)objc_msgSend(v5, "length") <= 0x10)
    goto LABEL_8;
LABEL_6:
  v7 = 0;
LABEL_9:

  return v7;
}

+ (unint64_t)_nonStructuralContentTypeFromType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (qword_1ED0B43A0 != -1)
    dispatch_once(&qword_1ED0B43A0, &__block_literal_global_69);
  v4 = (void *)qword_1ED0B4398;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    a3 = objc_msgSend(v6, "unsignedIntegerValue");

  return a3;
}

void __76__CRFormContentTypeKeywordBasedPredictor__nonStructuralContentTypeFromType___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E9926748;
  v2[1] = &unk_1E9926778;
  v3[0] = &unk_1E9926760;
  v3[1] = &unk_1E9926760;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0B4398;
  qword_1ED0B4398 = v0;

}

@end
