@implementation PLNLP

+ (id)lemmasForToken:(id)a3 locale:(id)a4 options:(int64_t)a5
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localeIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = LXLemmatizerCreate();
  if (v13)
  {
    v14 = (const void *)v13;
    objc_msgSend(v6, "lowercaseString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = v11;
      LXLemmatizerEnumerateLemmasforString();
      PLBackendGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v20 = v6;
        v21 = 2112;
        v22 = v16;
        _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEBUG, "Token Lemmatization: token %@ -> lemma %@", buf, 0x16u);
      }

    }
    CFRelease(v14);

  }
  return v11;
}

+ (id)tokensFromString:(id)a3 options:(int64_t)a4
{
  char v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  BOOL v26;
  BOOL v27;
  uint64_t v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v4 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((v4 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3730], "dominantLanguageForString:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PLBackendGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v8;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "Detected language from string: %@", buf, 0xCu);
    }

    objc_msgSend(a1, "stopWordsForLanguageCode:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = *MEMORY[0x1E0CB2D00];
  v11 = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3730]), "initWithTagSchemes:options:", v12, 0);
  objc_msgSend(v13, "setString:", v6);
  v14 = objc_msgSend(v6, "length");
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __34__PLNLP_tokensFromString_options___block_invoke;
  v21[3] = &unk_1E36739B0;
  v22 = v6;
  v23 = v7;
  v26 = (v4 & 2) != 0;
  v25 = a1;
  v27 = (v4 & 4) != 0;
  v15 = v10;
  v24 = v15;
  v16 = v7;
  v17 = v6;
  objc_msgSend(v13, "enumerateTagsInRange:unit:scheme:options:usingBlock:", 0, v14, 0, v11, 6, v21);
  v18 = v24;
  v19 = v15;

  return v19;
}

+ (id)stringWithoutDiacriticsFromString:(id)a3
{
  __CFString *v3;

  v3 = (__CFString *)objc_msgSend(a3, "mutableCopy");
  CFStringTransform(v3, 0, (CFStringRef)*MEMORY[0x1E0C9B350], 0);
  return v3;
}

+ (id)ngramsFromTokens:(id)a3 ofSize:(unint64_t)a4 usingSeparator:(id)a5
{
  id v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  NSObject *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  int v17;
  unint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = objc_msgSend(v7, "count");
  v10 = v9 - a4;
  if (v9 >= a4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    do
    {
      objc_msgSend(v7, "subarrayWithRange:", v13, a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "componentsJoinedByString:", v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "addObject:", v15);
      ++v13;

    }
    while (v13 <= v10);
  }
  else
  {
    PLBackendGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 134218242;
      v18 = a4;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "Cannot generate %lu-grams from tokens %@", (uint8_t *)&v17, 0x16u);
    }

    v12 = 0;
  }

  return v12;
}

+ (id)dateIntervalsFromMessage:(id)a3 onDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D513A0], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "length");
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __41__PLNLP_dateIntervalsFromMessage_onDate___block_invoke;
  v19[3] = &unk_1E3673A00;
  v23 = 0;
  v24 = v10;
  v25 = a1;
  v20 = v7;
  v21 = v11;
  v12 = v8;
  v22 = v12;
  v13 = v11;
  v14 = v7;
  v15 = (id)objc_msgSend(v9, "tokenizeAndEnumerateAttributedParsesForQuery:options:withBlock:", v6, MEMORY[0x1E0C9AA70], v19);
  v16 = v22;
  v17 = v12;

  return v17;
}

+ (id)dateFilterForCMMWithAttributes:(id)a3 withReferenceDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  PSIDateFilter *v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  BOOL v24;
  PSIDateFilter *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  int v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  PSIDateFilter *v42;
  void *v43;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D512F0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "components:fromDate:", 540, v6);
  v9 = objc_claimAutoreleasedReturnValue();
  v48 = (void *)v9;
  if (!v7)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D51318]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D51310]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    if (v17)
      goto LABEL_50;
    goto LABEL_11;
  }
  v10 = (void *)v9;
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D51308]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntegerValue");

  if (v12 == 3 || v12 == 8)
  {
    objc_msgSend(v8, "dateFromComponents:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateByAddingUnit:value:toDate:options:", 0x2000, 1, v14, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v14)
    {
      objc_msgSend(v8, "components:fromDate:", 28, v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
        goto LABEL_22;
    }
    else
    {
      v17 = 0;
      if (!v15)
        goto LABEL_22;
    }
    objc_msgSend(v8, "components:fromDate:", 28, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  if (v12 != 38
    || ((v21 = objc_msgSend(v7, "month"), v22 = objc_msgSend(v7, "year"),
                                          objc_msgSend(v7, "day") != 0x7FFFFFFFFFFFFFFFLL)
      ? (v23 = v21 == 0x7FFFFFFFFFFFFFFFLL)
      : (v23 = 1),
        !v23 ? (v24 = v22 == 0x7FFFFFFFFFFFFFFFLL) : (v24 = 0),
        !v24))
  {
    v14 = 0;
    v16 = 0;
    v17 = 0;
LABEL_22:
    v18 = 0;
LABEL_37:
    v19 = v7;
    goto LABEL_38;
  }
  v19 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v19, "setYear:", objc_msgSend(v10, "year"));
  objc_msgSend(v8, "dateFromComponents:", v19);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v45, "compare:", v6) == 1)
    objc_msgSend(v19, "setYear:", objc_msgSend(v10, "year") - 1);
  PLBackendGetLog();
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v50 = v7;
    v51 = 2112;
    v52 = v19;
    _os_log_impl(&dword_199541000, v46, OS_LOG_TYPE_DEFAULT, "Adjusting date component %@ to date component %@", buf, 0x16u);
  }

  v14 = 0;
  v16 = 0;
  v17 = 0;
  v18 = 0;
LABEL_38:
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D51300]);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "unsignedIntegerValue");

  if (v37 == 2)
  {
    if (v17)
      v40 = v17;
    else
      v40 = v19;
    v41 = v40;

    v39 = 0;
    v17 = v41;
  }
  else
  {
    if (v37 != 1)
      goto LABEL_49;

    if (v18)
      v38 = v18;
    else
      v38 = v19;
    v39 = v38;
    v17 = 0;
  }

  v18 = v39;
LABEL_49:

  if (v17)
  {
LABEL_50:
    v42 = [PSIDateFilter alloc];
    if (v18)
      v20 = -[PSIDateFilter initWithStartDateComponents:endDateComponents:](v42, "initWithStartDateComponents:endDateComponents:", v17, v18);
    else
      v20 = -[PSIDateFilter initWithStartDateComponents:](v42, "initWithStartDateComponents:", v17);
    goto LABEL_53;
  }
LABEL_11:
  if (v18)
  {
    v20 = -[PSIDateFilter initWithEndDateComponents:]([PSIDateFilter alloc], "initWithEndDateComponents:", v18);
LABEL_53:
    v25 = v20;
    goto LABEL_54;
  }
  if (v19)
  {
    v25 = -[PSIDateFilter initWithSingleDateComponents:]([PSIDateFilter alloc], "initWithSingleDateComponents:", v19);
    v26 = objc_msgSend(v19, "weekday");
    if (!v25)
    {
      v27 = v26;
      if (v26 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v47 = (void *)objc_msgSend(v19, "copy");
        v28 = objc_msgSend(v19, "month");
        v29 = objc_msgSend(v19, "year");
        if (objc_msgSend(v19, "day") == 0x7FFFFFFFFFFFFFFFLL
          && v28 == 0x7FFFFFFFFFFFFFFFLL
          && v29 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v30 = (v27 - objc_msgSend(v48, "weekday") - 7) % 7uLL;
          if (v30)
            v31 = v30;
          else
            v31 = -7;
          objc_msgSend(v8, "dateByAddingUnit:value:toDate:options:", 16, v31, v6, 0);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "components:fromDate:", 28, v32);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          PLBackendGetLog();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v50 = v19;
            v51 = 2112;
            v52 = v34;
            _os_log_impl(&dword_199541000, v35, OS_LOG_TYPE_DEFAULT, "Adjusting date component %@ to date component %@", buf, 0x16u);
          }

        }
        else
        {
          v34 = v47;
          objc_msgSend(v47, "setWeekday:", 0x7FFFFFFFFFFFFFFFLL);
        }
        v25 = -[PSIDateFilter initWithSingleDateComponents:]([PSIDateFilter alloc], "initWithSingleDateComponents:", v34);

      }
    }
  }
  else
  {
    v25 = 0;
  }
LABEL_54:
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D512F8]);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSIDateFilter setDisplayString:](v25, "setDisplayString:", v43);

  return v25;
}

+ (id)stopWordsForLanguageCode:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("en"), CFSTR("fr"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "containsObject:", v4))
  {
    PLBackendGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v4;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "We don't have a stop word list for language %@", buf, 0xCu);
    }

    goto LABEL_10;
  }
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("en")))
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("fr")))
    {
      objc_msgSend(a1, "_frenchStopWords");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_10:
    v8 = 0;
    goto LABEL_11;
  }
  objc_msgSend(a1, "_englishStopWords");
  v6 = objc_claimAutoreleasedReturnValue();
LABEL_9:
  v8 = (void *)v6;
LABEL_11:

  return v8;
}

+ (id)_englishStopWords
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)_englishStopWords_stopWords;
  if (!_englishStopWords_stopWords)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("a"), CFSTR("about"), CFSTR("above"), CFSTR("after"), CFSTR("again"), CFSTR("against"), CFSTR("all"), CFSTR("also"), CFSTR("am"), CFSTR("an"), CFSTR("and"), CFSTR("another"), CFSTR("any"), CFSTR("are"), CFSTR("as"), CFSTR("at"), CFSTR("back"),
      CFSTR("be"),
      CFSTR("because"),
      CFSTR("been"),
      CFSTR("before"),
      CFSTR("being"),
      CFSTR("below"),
      CFSTR("between"),
      CFSTR("both"),
      CFSTR("but"),
      CFSTR("by"),
      CFSTR("can"),
      CFSTR("could"),
      CFSTR("did"),
      CFSTR("do"),
      CFSTR("does"),
      CFSTR("doing"),
      CFSTR("down"),
      CFSTR("during"),
      CFSTR("each"),
      CFSTR("even"),
      CFSTR("ever"),
      CFSTR("every"),
      CFSTR("few"),
      CFSTR("first"),
      CFSTR("five"),
      CFSTR("for"),
      CFSTR("four"),
      CFSTR("from"),
      CFSTR("further"),
      CFSTR("get"),
      CFSTR("go"),
      CFSTR("goes"),
      CFSTR("had"),
      CFSTR("has"),
      CFSTR("have"),
      CFSTR("having"),
      0x1E36BA000,
      CFSTR("her"),
      CFSTR("here"),
      CFSTR("hers"),
      CFSTR("herself"),
      CFSTR("high"),
      CFSTR("him"),
      CFSTR("himself"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)_englishStopWords_stopWords;
    _englishStopWords_stopWords = v3;

    v2 = (void *)_englishStopWords_stopWords;
  }
  return v2;
}

+ (id)_frenchStopWords
{
  id v2;

  v2 = objc_unsafeClaimAutoreleasedReturnValue((id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("ai"), CFSTR("aie"), CFSTR("aient"), CFSTR("aies"), CFSTR("ait"), CFSTR("as"), CFSTR("au"), CFSTR("aura"), CFSTR("aurai"), CFSTR("auraient"), CFSTR("aurais"), CFSTR("aurait"), CFSTR("auras"), CFSTR("aurez"), CFSTR("auriez"), CFSTR("aurions"), CFSTR("aurons"),
                                                     CFSTR("auront"),
                                                     CFSTR("aux"),
                                                     0x1E36BB000,
                                                     CFSTR("avais"),
                                                     CFSTR("avait"),
                                                     CFSTR("avec"),
                                                     CFSTR("avez"),
                                                     CFSTR("aviez"),
                                                     CFSTR("avions"),
                                                     CFSTR("avons"),
                                                     CFSTR("ayant"),
                                                     CFSTR("ayez"),
                                                     CFSTR("ayons"),
                                                     CFSTR("c"),
                                                     CFSTR("ce"),
                                                     CFSTR("ceci"),
                                                     CFSTR("cela"),
                                                     CFSTR("celà"),
                                                     CFSTR("ces"),
                                                     CFSTR("cet"),
                                                     CFSTR("cette"),
                                                     CFSTR("d"),
                                                     CFSTR("dans"),
                                                     CFSTR("de"),
                                                     CFSTR("des"),
                                                     CFSTR("du"),
                                                     CFSTR("elle"),
                                                     CFSTR("en"),
                                                     CFSTR("es"),
                                                     CFSTR("est"),
                                                     CFSTR("et"),
                                                     CFSTR("eu"),
                                                     CFSTR("eue"),
                                                     CFSTR("eues"),
                                                     CFSTR("eurent"),
                                                     CFSTR("eus"),
                                                     CFSTR("eusse"),
                                                     CFSTR("eussent"),
                                                     CFSTR("eusses"),
                                                     CFSTR("eussiez"),
                                                     CFSTR("eussions"),
                                                     CFSTR("eut"),
                                                     CFSTR("eux"),
                                                     CFSTR("furent")));
  return 0;
}

+ (BOOL)nlpSearchSupportsLocale:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "languageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(&unk_1E3763F80, "containsObject:", v3);

  return v4;
}

void __41__PLNLP_dateIntervalsFromMessage_onDate___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  uint64_t v8;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__PLNLP_dateIntervalsFromMessage_onDate___block_invoke_2;
  v4[3] = &unk_1E36739D8;
  v8 = *(_QWORD *)(a1 + 72);
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(a2, "enumerateAttributesInRange:options:usingBlock:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), 0, v4);

}

void __41__PLNLP_dateIntervalsFromMessage_onDate___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a2;
  v3 = objc_msgSend(v22, "count");
  v4 = v22;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 56), "dateFilterForCMMWithAttributes:withReferenceDate:", v22, *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!v5)
    {
LABEL_11:

      v4 = v22;
      goto LABEL_12;
    }
    objc_msgSend(v5, "singleDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v6, "singleDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dateComponents");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 40), "dateFromComponents:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
LABEL_10:

        goto LABEL_11;
      }
      objc_msgSend(*(id *)(a1 + 40), "dateByAddingUnit:value:toDate:options:", 16, 1, v10, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v10, v11);
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v12);

    }
    else
    {
      objc_msgSend(v6, "startDate");
      v13 = objc_claimAutoreleasedReturnValue();
      if (!v13)
        goto LABEL_11;
      v14 = (void *)v13;
      objc_msgSend(v6, "endDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
        goto LABEL_11;
      v16 = *(void **)(a1 + 40);
      objc_msgSend(v6, "startDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "dateComponents");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "dateFromComponents:", v18);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = *(void **)(a1 + 40);
      objc_msgSend(v6, "endDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "dateComponents");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "dateFromComponents:", v21);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v9, v10);
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v11);
    }

    goto LABEL_10;
  }
LABEL_12:

}

void __34__PLNLP_tokensFromString_options___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  int v23;
  NSObject *v24;
  __int16 v25;
  NSObject *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a3, a4);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 40);
  -[NSObject lowercaseString](v8, "lowercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v9, "containsObject:", v10);

  if ((_DWORD)v9)
  {
    PLBackendGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(NSObject **)(a1 + 32);
      v23 = 138412546;
      v24 = v12;
      v25 = 2112;
      v26 = v8;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "Tokens from string %@: ignoring stop word %@", (uint8_t *)&v23, 0x16u);
    }
    goto LABEL_19;
  }
  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(v7, "lowercaseString");
    v13 = objc_claimAutoreleasedReturnValue();
    PLBackendGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v23 = 138412546;
      v24 = v8;
      v25 = 2112;
      v26 = v13;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEBUG, "Lemmatization: token %@ -> lemma %@", (uint8_t *)&v23, 0x16u);
    }

    if (v13)
    {
      v15 = v13;

      v8 = v15;
    }

  }
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 56), "stringWithoutDiacriticsFromString:", v8);
    v16 = objc_claimAutoreleasedReturnValue();
    v11 = v16;
    if (*(_BYTE *)(a1 + 65))
    {
      v17 = *(void **)(a1 + 40);
      -[NSObject lowercaseString](v16, "lowercaseString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v17) = objc_msgSend(v17, "containsObject:", v18);

      if ((_DWORD)v17)
      {
        PLBackendGetLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = *(NSObject **)(a1 + 32);
          v23 = 138412546;
          v24 = v20;
          v25 = 2112;
          v26 = v8;
          _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEFAULT, "Tokens from string %@: ignoring stop word %@", (uint8_t *)&v23, 0x16u);
        }

        goto LABEL_19;
      }
      v21 = *(void **)(a1 + 48);
      v22 = v11;
    }
    else
    {
      v21 = *(void **)(a1 + 48);
      v22 = v8;
    }
    objc_msgSend(v21, "addObject:", v22);
LABEL_19:

  }
}

void __39__PLNLP_lemmasForToken_locale_options___block_invoke(uint64_t a1, __CFString *theString1)
{
  const __CFString *v4;
  uint64_t v5;
  __CFString *v6;
  __CFString *v7;

  if (CFStringCompare(theString1, *(CFStringRef *)(a1 + 40), 1uLL))
  {
    v4 = theString1;
    if (*(_BYTE *)(a1 + 56))
    {
      v6 = (__CFString *)v4;
      objc_msgSend(*(id *)(a1 + 48), "stringWithoutDiacriticsFromString:", v4);
      v5 = objc_claimAutoreleasedReturnValue();

      v4 = (const __CFString *)v5;
    }
    v7 = (__CFString *)v4;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

  }
}

@end
