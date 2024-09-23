@implementation _LTTextLanguageDetectorScorer

- (_LTTextLanguageDetectorScorer)initWithSupportedLocales:(id)a3
{
  id v5;
  _LTTextLanguageDetectorScorer *v6;
  uint64_t v7;
  NSMutableArray *items;
  NSObject *v9;
  NSArray *v10;
  void *v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _LTTextLanguageDetectorScorer *v21;
  objc_super v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_LTTextLanguageDetectorScorer;
  v6 = -[_LTTextLanguageDetectorScorer init](&v23, sel_init);
  if (v6)
  {
    v7 = objc_opt_new();
    items = v6->_items;
    v6->_items = (NSMutableArray *)v7;

    objc_storeStrong((id *)&v6->_supportedLocales, a3);
    v9 = (id)_LTOSLogLID();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = v6->_supportedLocales;
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v12 = v10;
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v24, buf, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v25;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v25 != v15)
              objc_enumerationMutation(v12);
            objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v16), "localeIdentifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addObject:", v17);

            ++v16;
          }
          while (v14 != v16);
          v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v24, buf, 16);
        }
        while (v14);
      }

      v18 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR(",\n"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("[ %@ ]"), v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138543362;
      v29 = v20;
      _os_log_impl(&dword_2491B9000, v9, OS_LOG_TYPE_INFO, "supported locales for scoring: %{public}@", buf, 0xCu);

    }
    v21 = v6;
  }

  return v6;
}

- (void)append:(id)a3 recognizer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  _LTTextLanguageDetectorScorerItem *v13;
  _LTTextLanguageDetectorScorerItem *v14;
  NSObject *v15;
  NSObject *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "dominantLanguage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    _LTLanguageCodeToSupportedLocale();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "languageHypothesesWithMaximum:", 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = +[_LTTokenizer _wordCount:inLocale:](_LTTokenizer, "_wordCount:inLocale:", v6, v9);
    v13 = [_LTTextLanguageDetectorScorerItem alloc];
    objc_msgSend(v11, "doubleValue");
    v14 = -[_LTTextLanguageDetectorScorerItem initWithLocale:confidence:wordCount:](v13, "initWithLocale:confidence:wordCount:", v9, v12);
    if (v14)
      -[NSMutableArray addObject:](self->_items, "addObject:", v14);

  }
  else
  {
    v15 = _LTOSLogLID();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = v15;
      v17 = 134217984;
      v18 = objc_msgSend(v6, "length");
      _os_log_impl(&dword_2491B9000, v16, OS_LOG_TYPE_INFO, "no scorable dominant language for text length: %zu", (uint8_t *)&v17, 0xCu);

    }
  }

}

- (BOOL)hasWeightedLocale
{
  return -[NSMutableArray count](self->_items, "count") != 0;
}

- (NSLocale)weightedLocale
{
  NSObject *v3;
  double v4;
  NSObject *v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t i;
  void *v16;
  double v17;
  NSObject *v18;
  NSObject *v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v32;
  double v33;
  NSObject *v34;
  double v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  double v43;
  __int16 v44;
  double v45;
  __int16 v46;
  unint64_t v47;
  __int16 v48;
  uint64_t v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v3 = _LTOSLogLID();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[_LTTextLanguageDetectorScorer weightedLocale].cold.1((uint64_t)self, v3);
  v4 = _LTPreferencesTextLIDScorerConfidenceThreshold();
  v5 = _LTOSLogLID();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v43 = v4;
    _os_log_impl(&dword_2491B9000, v5, OS_LOG_TYPE_INFO, "weightedLocale confidence threshold from preferences: %f", buf, 0xCu);
  }
  v6 = (void *)objc_opt_new();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v7 = self->_items;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
  if (v8)
  {
    v10 = v8;
    v11 = 0;
    v12 = 0;
    v13 = *(_QWORD *)v39;
    v14 = 0.0;
    *(_QWORD *)&v9 = 134218240;
    v37 = v9;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v39 != v13)
          objc_enumerationMutation(v7);
        v16 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v16, "confidence", v37, (_QWORD)v38);
        if (v17 >= v4)
        {
          objc_msgSend(v16, "locale");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKeyedSubscript:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "doubleValue");
          v24 = v23;
          objc_msgSend(v16, "score");
          v26 = v24 + v25;

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "locale");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v27, v28);

          v12 += objc_msgSend(v16, "wordCount");
          if (v26 > v14)
          {
            objc_msgSend(v16, "locale");
            v29 = objc_claimAutoreleasedReturnValue();

            v11 = (void *)v29;
            v14 = v26;
          }
        }
        else
        {
          v18 = _LTOSLogLID();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            v19 = v18;
            objc_msgSend(v16, "confidence");
            *(_DWORD *)buf = v37;
            v43 = v20;
            v44 = 2048;
            v45 = v4;
            _os_log_debug_impl(&dword_2491B9000, v19, OS_LOG_TYPE_DEBUG, "weightedLocale item confidence %f < confidence threshold %f, skipping", buf, 0x16u);

          }
        }
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
    v12 = 0;
    v14 = 0.0;
  }

  v30 = _LTOSLogLID();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    if (v12 <= 1)
      v32 = 1;
    else
      v32 = v12;
    v33 = v14 / (double)v32;
    v34 = v30;
    objc_msgSend(v11, "localeIdentifier");
    v35 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    v36 = objc_msgSend(v6, "count");
    *(_DWORD *)buf = 138544130;
    v43 = v35;
    v44 = 2048;
    v45 = v33;
    v46 = 2048;
    v47 = v12;
    v48 = 2048;
    v49 = v36;
    _os_log_debug_impl(&dword_2491B9000, v34, OS_LOG_TYPE_DEBUG, "weightedLocale is %{public}@ with score %f on %zd words from %zu locales", buf, 0x2Au);

  }
  return (NSLocale *)v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedLocales, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

- (void)weightedLocale
{
  void *v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 8);
  v3 = a2;
  v4 = 134217984;
  v5 = objc_msgSend(v2, "count");
  _os_log_debug_impl(&dword_2491B9000, v3, OS_LOG_TYPE_DEBUG, "weightedLocale for %zu items", (uint8_t *)&v4, 0xCu);

}

@end
