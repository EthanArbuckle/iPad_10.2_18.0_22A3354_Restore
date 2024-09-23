@implementation SPSearchQueryContext

uint64_t __40__SPSearchQueryContext_setSearchString___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3780], "whitespaceAndNewlineCharacterSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)setSearchString__characterSet;
  setSearchString__characterSet = v0;

  return objc_msgSend((id)setSearchString__characterSet, "invert");
}

- (SPSearchQueryContext)initWithSearchString:(id)a3
{
  id v4;
  SPSearchQueryContext *v5;
  SPSearchQueryContext *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SPSearchQueryContext;
  v5 = -[SPSearchQueryContext init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[SPSearchQueryContext setSearchString:](v5, "setSearchString:", v4);
    -[SPSearchQueryContext setCurrentTime:](v6, "setCurrentTime:", CFAbsoluteTimeGetCurrent());
    -[SPSearchQueryContext incrementQueryId](v6, "incrementQueryId");
  }

  return v6;
}

- (void)setSearchString:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  void *v8;
  NSString *v9;
  NSString *normalizedSearchString;
  id obj;

  v4 = a3;
  obj = v4;
  if (setSearchString__once != -1)
  {
    dispatch_once(&setSearchString__once, &__block_literal_global_137);
    v4 = obj;
  }
  v5 = objc_msgSend(v4, "rangeOfCharacterFromSet:", setSearchString__characterSet);
  if (v5)
    v6 = v5 == 0x7FFFFFFFFFFFFFFFLL;
  else
    v6 = 1;
  if (!v6)
  {
    objc_msgSend(obj, "substringFromIndex:", v5);
    v7 = objc_claimAutoreleasedReturnValue();

    obj = (id)v7;
  }
  objc_storeStrong((id *)&self->_searchString, obj);
  if (obj)
  {
    SSNormalizedQueryString(obj);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lowercaseString");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    normalizedSearchString = self->_normalizedSearchString;
    self->_normalizedSearchString = v9;

  }
  else
  {
    v8 = self->_normalizedSearchString;
    self->_normalizedSearchString = 0;
  }

}

- (void)setCurrentTime:(double)a3
{
  self->_currentTime = a3;
}

- (void)incrementQueryId
{
  uint64_t v3;
  unint64_t v4;

  v3 = arc4random_uniform(0xAu) + 1;
  do
    v4 = __ldaxr(&s_currentQueryID);
  while (__stlxr(v4 + v3, &s_currentQueryID));
  self->_queryIdent = v4;
}

- (unint64_t)queryIdent
{
  return self->_queryIdent;
}

- (void)setQueryIdent:(unint64_t)a3
{
  self->_queryIdent = a3;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (double)scaleFactor
{
  return self->_scaleFactor;
}

- (BOOL)promoteParsecResults
{
  return self->_promoteParsecResults;
}

- (BOOL)promoteLocalResults
{
  return self->_promoteLocalResults;
}

- (BOOL)noTokenize
{
  return self->_noTokenize;
}

- (NSString)keyboardPrimaryLanguage
{
  return self->_keyboardPrimaryLanguage;
}

- (NSString)keyboardLanguage
{
  return self->_keyboardLanguage;
}

- (BOOL)internalValidation
{
  return self->_internalValidation;
}

- (BOOL)internalDebug
{
  return self->_internalDebug;
}

- (SPSearchQueryContext)init
{
  return -[SPSearchQueryContext initWithSearchString:](self, "initWithSearchString:", 0);
}

- (NSArray)disabledBundles
{
  return self->_disabledBundles;
}

- (NSArray)disabledApps
{
  return self->_disabledApps;
}

- (double)currentTime
{
  return self->_currentTime;
}

+ (SPSearchQueryContext)queryContextWithSearchString:(id)a3
{
  id v3;
  SPSearchQueryContext *v4;

  v3 = a3;
  v4 = -[SPSearchQueryContext initWithSearchString:]([SPSearchQueryContext alloc], "initWithSearchString:", v3);

  return v4;
}

+ (id)getAppEntityParams:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  BOOL v20;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (getAppEntityParams__onceToken != -1)
    dispatch_once(&getAppEntityParams__onceToken, &__block_literal_global_21);
  v4 = (void *)objc_msgSend(&unk_1E6E9B830, "mutableCopy");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v22 = v3;
  objc_msgSend(v3, "filterQueries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend((id)getAppEntityParams__regex, "firstMatchInString:options:range:", v10, 0, 0, objc_msgSend(v10, "length"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11 && objc_msgSend(v11, "numberOfRanges") == 3)
        {
          v13 = objc_msgSend(v12, "rangeAtIndex:", 1);
          objc_msgSend(v10, "substringWithRange:", v13, v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v12, "rangeAtIndex:", 2);
          objc_msgSend(v10, "substringWithRange:", v16, v17);
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = (void *)v18;
          if (v15)
            v20 = v18 == 0;
          else
            v20 = 1;
          if (!v20)
          {
            objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("isAppEntitySearch"));
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("bundleID"));
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("entityTypeIdentifier"));
          }

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v7);
  }

  return v4;
}

void __43__SPSearchQueryContext_getAppEntityParams___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("(?=.*_kMDItemBundleID==([^ ]+))(?=.*_kMDItemAppEntityTypeIdentifier==([^)]+))"), 0, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)getAppEntityParams__regex;
  getAppEntityParams__regex = v0;

}

+ (id)removeAppEntitySpecificStopwords:(id)a3 withEntityTypeIdentifier:(id)a4 bundleID:(id)a5
{
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  void *v25;
  id v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;
  _BYTE v37[128];
  _QWORD v38[4];

  v38[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (removeAppEntitySpecificStopwords_withEntityTypeIdentifier_bundleID__onceToken != -1)
    dispatch_once(&removeAppEntitySpecificStopwords_withEntityTypeIdentifier_bundleID__onceToken, &__block_literal_global_62_0);
  v38[0] = v9;
  v38[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)removeAppEntitySpecificStopwords_withEntityTypeIdentifier_bundleID__stopwordsMap, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v25 = v10;
    v27 = v8;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    v26 = v9;
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v30 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\\b%@\\b"), v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = 0;
          objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", v18, 1, &v28);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v28;
          if (v20)
          {
            SSGeneralLog();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v34 = v17;
              v35 = 2112;
              v36 = v20;
              _os_log_error_impl(&dword_1B86C5000, v21, OS_LOG_TYPE_ERROR, "[POMMES][SearchTool][Query Normalization] Error creating regex for appEntity stopword %@: %@", buf, 0x16u);
            }
          }
          else
          {
            objc_msgSend(v19, "stringByReplacingMatchesInString:options:range:withTemplate:", v7, 0, 0, -[NSObject length](v7, "length"), &stru_1E6E549F0);
            v21 = v7;
            v7 = objc_claimAutoreleasedReturnValue();
          }

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v14);
    }
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v22 = objc_claimAutoreleasedReturnValue();
    -[NSObject stringByTrimmingCharactersInSet:](v7, "stringByTrimmingCharactersInSet:", v22);
    v23 = objc_claimAutoreleasedReturnValue();

    v7 = v23;
    v9 = v26;
    v8 = v27;
    v10 = v25;
  }
  else
  {
    SSGeneralLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v34 = v9;
      v35 = 2112;
      v36 = v8;
      _os_log_impl(&dword_1B86C5000, v22, OS_LOG_TYPE_INFO, "[POMMES][SearchTool][Query Normalization] No stopwords found for bundleID %@ and typeIdentifier %@", buf, 0x16u);
    }
  }

  return v7;
}

void __91__SPSearchQueryContext_removeAppEntitySpecificStopwords_withEntityTypeIdentifier_bundleID___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E6E9B4B8;
  v2[1] = &unk_1E6E9B4E8;
  v3[0] = &unk_1E6E9B4D0;
  v3[1] = &unk_1E6E9B500;
  v2[2] = &unk_1E6E9B518;
  v2[3] = &unk_1E6E9B548;
  v3[2] = &unk_1E6E9B530;
  v3[3] = &unk_1E6E9B560;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)removeAppEntitySpecificStopwords_withEntityTypeIdentifier_bundleID__stopwordsMap;
  removeAppEntitySpecificStopwords_withEntityTypeIdentifier_bundleID__stopwordsMap = v0;

}

+ (id)normalizeSearchString:(id)a3 queryContext:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (_os_feature_enabled_impl())
  {
    v8 = v6;
  }
  else
  {
    +[SPSearchQueryContext getAppEntityParams:](SPSearchQueryContext, "getAppEntityParams:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("isAppEntitySearch"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    if (v11)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("entityTypeIdentifier"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("bundleID"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      SSGeneralLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v26 = 138412546;
        v27 = v13;
        v28 = 2112;
        v29 = v12;
        _os_log_impl(&dword_1B86C5000, v14, OS_LOG_TYPE_INFO, "[POMMES][SearchTool][Query Normalization] SearchTool AppEntity Search detected with bundleID: %@ and typeIdentifier: %@", (uint8_t *)&v26, 0x16u);
      }

      if (v12 && v13)
      {
        objc_msgSend(a1, "removeAppEntitySpecificStopwords:withEntityTypeIdentifier:bundleID:", v6, v12, v13);
        v15 = objc_claimAutoreleasedReturnValue();

        v6 = (id)v15;
      }

    }
    if (normalizeSearchString_queryContext__onceToken != -1)
      dispatch_once(&normalizeSearchString_queryContext__onceToken, &__block_literal_global_118);
    objc_msgSend((id)normalizeSearchString_queryContext__punctuationRegex, "stringByReplacingMatchesInString:options:range:withTemplate:", v6, 0, 0, objc_msgSend(v6, "length"), CFSTR(" "));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)normalizeSearchString_queryContext__specialApostropheSRegex, "stringByReplacingMatchesInString:options:range:withTemplate:", v16, 0, 0, objc_msgSend(v16, "length"), CFSTR("$1 is"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)normalizeSearchString_queryContext__specialApostropheReRegex, "stringByReplacingMatchesInString:options:range:withTemplate:", v17, 0, 0, objc_msgSend(v17, "length"), CFSTR("$1 are"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)normalizeSearchString_queryContext__apostropheSRegex, "stringByReplacingMatchesInString:options:range:withTemplate:", v18, 0, 0, objc_msgSend(v18, "length"), &stru_1E6E549F0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)normalizeSearchString_queryContext__ordinalNumberRegex, "stringByReplacingMatchesInString:options:range:withTemplate:", v19, 0, 0, objc_msgSend(v19, "length"), CFSTR("$1"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringByTrimmingCharactersInSet:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    SSGeneralLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      SSRedactString(v22, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138412290;
      v27 = v24;
      _os_log_impl(&dword_1B86C5000, v23, OS_LOG_TYPE_INFO, "[POMMES][SearchTool][Query Normalization] Normalized Query: %@", (uint8_t *)&v26, 0xCu);

    }
    v8 = v22;

  }
  return v8;
}

void __59__SPSearchQueryContext_normalizeSearchString_queryContext___block_invoke()
{
  uint64_t v0;
  id v1;
  void *v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;

  v24 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("[’']s\\b"), 0, &v24);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = v24;
  v2 = (void *)normalizeSearchString_queryContext__apostropheSRegex;
  normalizeSearchString_queryContext__apostropheSRegex = v0;

  if (v1)
  {
    SSGeneralLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __59__SPSearchQueryContext_normalizeSearchString_queryContext___block_invoke_cold_5();

  }
  v23 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("\\b(\\d+)(st|nd|rd|th)\\b"), 1, &v23);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v23;
  v6 = (void *)normalizeSearchString_queryContext__ordinalNumberRegex;
  normalizeSearchString_queryContext__ordinalNumberRegex = v4;

  if (v5)
  {
    SSGeneralLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __59__SPSearchQueryContext_normalizeSearchString_queryContext___block_invoke_cold_4();

  }
  v22 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("[,.:?-]+"), 0, &v22);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v22;
  v10 = (void *)normalizeSearchString_queryContext__punctuationRegex;
  normalizeSearchString_queryContext__punctuationRegex = v8;

  if (v9)
  {
    SSGeneralLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __59__SPSearchQueryContext_normalizeSearchString_queryContext___block_invoke_cold_3();

  }
  v21 = v9;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("\\b(What|Where|When|How)[’']s\\b"), 1, &v21);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v21;

  v14 = (void *)normalizeSearchString_queryContext__specialApostropheSRegex;
  normalizeSearchString_queryContext__specialApostropheSRegex = v12;

  if (v13)
  {
    SSGeneralLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __59__SPSearchQueryContext_normalizeSearchString_queryContext___block_invoke_cold_2();

  }
  v20 = v13;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("\\b(What|Where|When|How)[’']re\\b"), 1, &v20);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v20;

  v18 = (void *)normalizeSearchString_queryContext__specialApostropheReRegex;
  normalizeSearchString_queryContext__specialApostropheReRegex = v16;

  if (v17)
  {
    SSGeneralLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      __59__SPSearchQueryContext_normalizeSearchString_queryContext___block_invoke_cold_1();

  }
}

- (NSString)getTrimmedSearchString
{
  NSString *searchString;
  void *v3;
  void *v4;

  searchString = self->_searchString;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByTrimmingCharactersInSet:](searchString, "stringByTrimmingCharactersInSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)displayedText
{
  void *v3;
  uint64_t v4;

  -[SPSearchQueryContext searchString](self, "searchString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SPSearchQueryContext hasMarkedText](self, "hasMarkedText"))
  {
    -[NSArray componentsJoinedByString:](self->_markedTextArray, "componentsJoinedByString:", &stru_1E6E549F0);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return (NSString *)v3;
}

- (BOOL)hasMarkedText
{
  return -[NSArray count](self->_markedTextArray, "count") == 3;
}

- (id)evaluatorWithSearchString:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;

  v4 = a3;
  -[SPSearchQueryContext keyboardLanguage](self, "keyboardLanguage");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = CFSTR("en");
  if (v5)
    v7 = (__CFString *)v5;
  v8 = v7;

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AB8]), "initWithQuery:language:fuzzyThreshold:options:", v4, v8, 0, 1);
  objc_msgSend(v9, "setMatchOncePerTerm:", 1);
  return v9;
}

- (id)evaluator
{
  CSAttributeEvaluator *evaluator;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  CSAttributeEvaluator *v8;
  CSAttributeEvaluator *v9;

  evaluator = self->_evaluator;
  if (!evaluator
    || (-[CSAttributeEvaluator queryString](evaluator, "queryString"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        -[SPSearchQueryContext searchString](self, "searchString"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v4, "isEqual:", v5),
        v5,
        v4,
        (v6 & 1) == 0))
  {
    -[SPSearchQueryContext searchString](self, "searchString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPSearchQueryContext evaluatorWithSearchString:](self, "evaluatorWithSearchString:", v7);
    v8 = (CSAttributeEvaluator *)objc_claimAutoreleasedReturnValue();
    v9 = self->_evaluator;
    self->_evaluator = v8;

  }
  return self->_evaluator;
}

- (id)evaluatorForPersonMatching
{
  CSAttributeEvaluator *evaluatorForPersonMatching;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  CSAttributeEvaluator *v10;
  CSAttributeEvaluator *v11;

  evaluatorForPersonMatching = self->_evaluatorForPersonMatching;
  if (!evaluatorForPersonMatching)
  {
    -[SPSearchQueryContext searchEntities](self, "searchEntities");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v5, "isContactEntitySearch") & 1) != 0)
    {
      objc_msgSend(v5, "tokenText");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[SPSearchQueryContext searchString](self, "searchString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        v9 = v7;
      }
      else
      {
        objc_msgSend(v5, "searchString");
        v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      v6 = v9;

    }
    -[SPSearchQueryContext evaluatorWithSearchString:](self, "evaluatorWithSearchString:", v6);
    v10 = (CSAttributeEvaluator *)objc_claimAutoreleasedReturnValue();
    v11 = self->_evaluatorForPersonMatching;
    self->_evaluatorForPersonMatching = v10;

    evaluatorForPersonMatching = self->_evaluatorForPersonMatching;
  }
  return evaluatorForPersonMatching;
}

- (BOOL)isPasscodeLocked
{
  return -[SPSearchQueryContext deviceAuthenticationState](self, "deviceAuthenticationState") != 0;
}

- (void)setIsPasscodeLocked:(BOOL)a3
{
  -[SPSearchQueryContext setDeviceAuthenticationState:](self, "setDeviceAuthenticationState:", a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  void *v20;

  v4 = (void *)objc_opt_new();
  -[SPSearchQueryContext searchString](self, "searchString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSearchString:", v5);

  -[SPSearchQueryContext markedTextArray](self, "markedTextArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMarkedTextArray:", v6);

  -[SPSearchQueryContext keyboardLanguage](self, "keyboardLanguage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setKeyboardLanguage:", v7);

  -[SPSearchQueryContext keyboardPrimaryLanguage](self, "keyboardPrimaryLanguage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setKeyboardPrimaryLanguage:", v8);

  -[SPSearchQueryContext searchDomains](self, "searchDomains");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSearchDomains:", v9);

  -[SPSearchQueryContext disabledDomains](self, "disabledDomains");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisabledDomains:", v10);

  -[SPSearchQueryContext disabledBundles](self, "disabledBundles");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisabledBundles:", v11);

  -[SPSearchQueryContext groupingRules](self, "groupingRules");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGroupingRules:", v12);

  objc_msgSend(v4, "setForceQueryEvenIfSame:", -[SPSearchQueryContext forceQueryEvenIfSame](self, "forceQueryEvenIfSame"));
  objc_msgSend(v4, "setWhyQuery:", -[SPSearchQueryContext whyQuery](self, "whyQuery"));
  objc_msgSend(v4, "setQueryKind:", -[SPSearchQueryContext queryKind](self, "queryKind"));
  objc_msgSend(v4, "setWhyClear:", -[SPSearchQueryContext whyClear](self, "whyClear"));
  objc_msgSend(v4, "setQueryIdent:", -[SPSearchQueryContext queryIdent](self, "queryIdent"));
  -[SPSearchQueryContext currentTime](self, "currentTime");
  objc_msgSend(v4, "setCurrentTime:");
  -[SPSearchQueryContext scaleFactor](self, "scaleFactor");
  objc_msgSend(v4, "setScaleFactor:");
  objc_msgSend(v4, "setAllowInternet:", -[SPSearchQueryContext allowInternet](self, "allowInternet"));
  objc_msgSend(v4, "setNoTokenize:", -[SPSearchQueryContext noTokenize](self, "noTokenize"));
  objc_msgSend(v4, "setInternalDebug:", -[SPSearchQueryContext internalDebug](self, "internalDebug"));
  objc_msgSend(v4, "setInternalValidation:", -[SPSearchQueryContext internalValidation](self, "internalValidation"));
  objc_msgSend(v4, "setDisableOCR:", -[SPSearchQueryContext disableOCR](self, "disableOCR"));
  objc_msgSend(v4, "setIsAdvancedSyntax:", -[SPSearchQueryContext isAdvancedSyntax](self, "isAdvancedSyntax"));
  -[SPSearchQueryContext searchEntities](self, "searchEntities");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSearchEntities:", v13);

  -[SPSearchQueryContext backingSearchModel](self, "backingSearchModel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackingSearchModel:", v14);

  -[SPSearchQueryContext queryUnderstandingOutput](self, "queryUnderstandingOutput");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setQueryUnderstandingOutput:", v15);

  objc_msgSend(v4, "setOptions:", -[SPSearchQueryContext options](self, "options"));
  objc_msgSend(v4, "setEnablePersonalAnswers:", -[SPSearchQueryContext enablePersonalAnswers](self, "enablePersonalAnswers"));
  objc_msgSend(v4, "setRetainBackendData:", -[SPSearchQueryContext retainBackendData](self, "retainBackendData"));
  -[SPSearchQueryContext answerAttributes](self, "answerAttributes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAnswerAttributes:", v16);

  objc_msgSend(v4, "setDeviceAuthenticationState:", -[SPSearchQueryContext deviceAuthenticationState](self, "deviceAuthenticationState"));
  -[SPSearchQueryContext disabledApps](self, "disabledApps");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisabledApps:", v17);

  objc_msgSend(v4, "setPromoteParsecResults:", -[SPSearchQueryContext promoteParsecResults](self, "promoteParsecResults"));
  -[SPSearchQueryContext queryIntent](self, "queryIntent");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setQueryIntent:", v18);

  -[SPSearchQueryContext bundleIDs](self, "bundleIDs");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBundleIDs:", v19);

  -[SPSearchQueryContext filterQueries](self, "filterQueries");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFilterQueries:", v20);

  return v4;
}

- (NSString)normalizedSearchString
{
  return self->_normalizedSearchString;
}

- (NSArray)markedTextArray
{
  return self->_markedTextArray;
}

- (void)setMarkedTextArray:(id)a3
{
  objc_storeStrong((id *)&self->_markedTextArray, a3);
}

- (void)setKeyboardLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardLanguage, a3);
}

- (void)setKeyboardPrimaryLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardPrimaryLanguage, a3);
}

- (NSArray)searchDomains
{
  return self->_searchDomains;
}

- (void)setSearchDomains:(id)a3
{
  objc_storeStrong((id *)&self->_searchDomains, a3);
}

- (NSArray)disabledDomains
{
  return self->_disabledDomains;
}

- (void)setDisabledDomains:(id)a3
{
  objc_storeStrong((id *)&self->_disabledDomains, a3);
}

- (void)setDisabledBundles:(id)a3
{
  objc_storeStrong((id *)&self->_disabledBundles, a3);
}

- (NSArray)groupingRules
{
  return self->_groupingRules;
}

- (void)setGroupingRules:(id)a3
{
  objc_storeStrong((id *)&self->_groupingRules, a3);
}

- (NSArray)answerAttributes
{
  return self->_answerAttributes;
}

- (void)setAnswerAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_answerAttributes, a3);
}

- (BOOL)forceQueryEvenIfSame
{
  return self->_forceQueryEvenIfSame;
}

- (void)setForceQueryEvenIfSame:(BOOL)a3
{
  self->_forceQueryEvenIfSame = a3;
}

- (unint64_t)whyQuery
{
  return self->_whyQuery;
}

- (void)setWhyQuery:(unint64_t)a3
{
  self->_whyQuery = a3;
}

- (unint64_t)queryKind
{
  return self->_queryKind;
}

- (void)setQueryKind:(unint64_t)a3
{
  self->_queryKind = a3;
}

- (unint64_t)whyClear
{
  return self->_whyClear;
}

- (void)setWhyClear:(unint64_t)a3
{
  self->_whyClear = a3;
}

- (void)setScaleFactor:(double)a3
{
  self->_scaleFactor = a3;
}

- (BOOL)allowInternet
{
  return self->_allowInternet;
}

- (void)setAllowInternet:(BOOL)a3
{
  self->_allowInternet = a3;
}

- (void)setNoTokenize:(BOOL)a3
{
  self->_noTokenize = a3;
}

- (void)setInternalDebug:(BOOL)a3
{
  self->_internalDebug = a3;
}

- (void)setInternalValidation:(BOOL)a3
{
  self->_internalValidation = a3;
}

- (BOOL)disableOCR
{
  return self->_disableOCR;
}

- (void)setDisableOCR:(BOOL)a3
{
  self->_disableOCR = a3;
}

- (BOOL)isAdvancedSyntax
{
  return self->_isAdvancedSyntax;
}

- (void)setIsAdvancedSyntax:(BOOL)a3
{
  self->_isAdvancedSyntax = a3;
}

- (BOOL)fetchL2Signals
{
  return self->_fetchL2Signals;
}

- (void)setFetchL2Signals:(BOOL)a3
{
  self->_fetchL2Signals = a3;
}

- (NSArray)searchEntities
{
  return self->_searchEntities;
}

- (void)setSearchEntities:(id)a3
{
  objc_storeStrong((id *)&self->_searchEntities, a3);
}

- (CSSuggestion)backingSearchModel
{
  return self->_backingSearchModel;
}

- (void)setBackingSearchModel:(id)a3
{
  objc_storeStrong((id *)&self->_backingSearchModel, a3);
}

- (NSDictionary)queryUnderstandingOutput
{
  return self->_queryUnderstandingOutput;
}

- (void)setQueryUnderstandingOutput:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (BOOL)enablePersonalAnswers
{
  return self->_enablePersonalAnswers;
}

- (void)setEnablePersonalAnswers:(BOOL)a3
{
  self->_enablePersonalAnswers = a3;
}

- (BOOL)retainBackendData
{
  return self->_retainBackendData;
}

- (void)setRetainBackendData:(BOOL)a3
{
  self->_retainBackendData = a3;
}

- (NSArray)bundleIDs
{
  return self->_bundleIDs;
}

- (void)setBundleIDs:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIDs, a3);
}

- (NSArray)filterQueries
{
  return self->_filterQueries;
}

- (void)setFilterQueries:(id)a3
{
  objc_storeStrong((id *)&self->_filterQueries, a3);
}

- (unint64_t)deviceAuthenticationState
{
  return self->_deviceAuthenticationState;
}

- (void)setDeviceAuthenticationState:(unint64_t)a3
{
  self->_deviceAuthenticationState = a3;
}

- (void)setDisabledApps:(id)a3
{
  objc_storeStrong((id *)&self->_disabledApps, a3);
}

- (void)setPromoteLocalResults:(BOOL)a3
{
  self->_promoteLocalResults = a3;
}

- (void)setPromoteParsecResults:(BOOL)a3
{
  self->_promoteParsecResults = a3;
}

- (SSQueryIntent)queryIntent
{
  return self->_queryIntent;
}

- (void)setQueryIntent:(id)a3
{
  objc_storeStrong((id *)&self->_queryIntent, a3);
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (void)setClientBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_clientBundleID, a3);
}

- (int)intentFromQU
{
  return self->_intentFromQU;
}

- (void)setIntentFromQU:(int)a3
{
  self->_intentFromQU = a3;
}

- (NSString)parsedQueryFromQU
{
  return self->_parsedQueryFromQU;
}

- (void)setParsedQueryFromQU:(id)a3
{
  objc_storeStrong((id *)&self->_parsedQueryFromQU, a3);
}

- (BOOL)earliestTokenFromQU
{
  return self->_earliestTokenFromQU;
}

- (void)setEarliestTokenFromQU:(BOOL)a3
{
  self->_earliestTokenFromQU = a3;
}

- (BOOL)latestTokenFromQU
{
  return self->_latestTokenFromQU;
}

- (void)setLatestTokenFromQU:(BOOL)a3
{
  self->_latestTokenFromQU = a3;
}

- (BOOL)isAppEntitySearch
{
  return self->_isAppEntitySearch;
}

- (void)setIsAppEntitySearch:(BOOL)a3
{
  self->_isAppEntitySearch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parsedQueryFromQU, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_queryIntent, 0);
  objc_storeStrong((id *)&self->_disabledApps, 0);
  objc_storeStrong((id *)&self->_filterQueries, 0);
  objc_storeStrong((id *)&self->_bundleIDs, 0);
  objc_storeStrong((id *)&self->_queryUnderstandingOutput, 0);
  objc_storeStrong((id *)&self->_backingSearchModel, 0);
  objc_storeStrong((id *)&self->_searchEntities, 0);
  objc_storeStrong((id *)&self->_answerAttributes, 0);
  objc_storeStrong((id *)&self->_groupingRules, 0);
  objc_storeStrong((id *)&self->_disabledBundles, 0);
  objc_storeStrong((id *)&self->_disabledDomains, 0);
  objc_storeStrong((id *)&self->_searchDomains, 0);
  objc_storeStrong((id *)&self->_keyboardPrimaryLanguage, 0);
  objc_storeStrong((id *)&self->_keyboardLanguage, 0);
  objc_storeStrong((id *)&self->_markedTextArray, 0);
  objc_storeStrong((id *)&self->_normalizedSearchString, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_evaluatorForPersonMatching, 0);
  objc_storeStrong((id *)&self->_evaluator, 0);
}

void __59__SPSearchQueryContext_normalizeSearchString_queryContext___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_3(&dword_1B86C5000, v0, v1, "[POMMES][SearchTool][Query Normalization] Error creating specialApostropheReRegex: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __59__SPSearchQueryContext_normalizeSearchString_queryContext___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_3(&dword_1B86C5000, v0, v1, "[POMMES][SearchTool][Query Normalization] Error creating specialApostropheSRegex: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __59__SPSearchQueryContext_normalizeSearchString_queryContext___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_3(&dword_1B86C5000, v0, v1, "[POMMES][SearchTool][Query Normalization] Error creating punctuationRegex: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __59__SPSearchQueryContext_normalizeSearchString_queryContext___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_3(&dword_1B86C5000, v0, v1, "[POMMES][SearchTool][Query Normalization] Error creating ordinalNumberRegex: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __59__SPSearchQueryContext_normalizeSearchString_queryContext___block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_3(&dword_1B86C5000, v0, v1, "[POMMES][SearchTool][Query Normalization] Error creating apostropheSRegex: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

@end
