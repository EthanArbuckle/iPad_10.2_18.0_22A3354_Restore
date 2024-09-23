@implementation _LTTextLanguageDetector

- (_LTTextLanguageDetector)init
{
  _LTTextLanguageDetector *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_LTTextLanguageDetector;
  result = -[_LTTextLanguageDetector init](&v3, sel_init);
  if (result)
    return -[_LTTextLanguageDetector initWithModel:](result, "initWithModel:", 0);
  return result;
}

- (_LTTextLanguageDetector)initWithModel:(unint64_t)a3
{
  _LTTextLanguageDetector *v4;
  void *v5;
  int v6;
  NSObject *v7;
  objc_class *v8;
  NSObject *v9;
  NLLanguageRecognizer *v10;
  NLLanguageRecognizer *recognizer;
  _LTTextLanguageDetector *v12;
  uint8_t v14[16];
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_LTTextLanguageDetector;
  v4 = -[_LTTextLanguageDetector init](&v15, sel_init);
  if (v4)
  {
    if (a3 != 2
      && (a3
       || (objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"),
           v5 = (void *)objc_claimAutoreleasedReturnValue(),
           v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("TextLIDUseLSTM")),
           v5,
           v6)))
    {
      v7 = _LTOSLogLID();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_2491B9000, v7, OS_LOG_TYPE_DEFAULT, "Using LSTM text lid engine", v14, 2u);
      }
      v8 = (objc_class *)MEMORY[0x24BDDFD50];
    }
    else
    {
      v9 = _LTOSLogLID();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_2491B9000, v9, OS_LOG_TYPE_DEFAULT, "Using CFRO text lid engine", v14, 2u);
      }
      v8 = (objc_class *)MEMORY[0x24BDDFD30];
    }
    v10 = (NLLanguageRecognizer *)objc_alloc_init(v8);
    recognizer = v4->_recognizer;
    v4->_recognizer = v10;

    v12 = v4;
  }

  return v4;
}

- (id)detectionForString:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v33;
  void *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = _LTOSLogLID();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[_LTTextLanguageDetector detectionForString:].cold.2(v5, v6, v7, v8, v9, v10, v11, v12);
  -[NLLanguageRecognizer reset](self->_recognizer, "reset");
  -[NLLanguageRecognizer processString:](self->_recognizer, "processString:", v4);
  -[NLLanguageRecognizer dominantLanguage](self->_recognizer, "dominantLanguage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = _LTOSLogLID();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v42 = v13;
    _os_log_impl(&dword_2491B9000, v14, OS_LOG_TYPE_INFO, "Dominant language: %{public}@", buf, 0xCu);
  }
  -[NLLanguageRecognizer languageHypothesesWithMaximum:](self->_recognizer, "languageHypothesesWithMaximum:", 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = _LTOSLogLID();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v42 = v15;
    _os_log_impl(&dword_2491B9000, v16, OS_LOG_TYPE_INFO, "Language confidences: %{public}@", buf, 0xCu);
  }
  -[_LTTextLanguageDetector availableLocales](self, "availableLocales");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  _LTLanguageCodeToSupportedLocale();
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = _LTOSLogLID();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v42 = v18;
    _os_log_impl(&dword_2491B9000, v19, OS_LOG_TYPE_INFO, "Mapped language: %{public}@", buf, 0xCu);
  }
  if (v18)
  {
    v33 = v18;
    v34 = v13;
    v35 = v4;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    objc_msgSend(v15, "allKeys");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v37;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v37 != v24)
            objc_enumerationMutation(v21);
          v26 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v25);
          -[_LTTextLanguageDetector availableLocales](self, "availableLocales");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          _LTLanguageCodeToSupportedLocale();
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (v28)
          {
            objc_msgSend(v15, "objectForKeyedSubscript:", v26);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setObject:forKeyedSubscript:", v29, v28);

          }
          ++v25;
        }
        while (v23 != v25);
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v23);
    }

    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF63E8]), "initWithConfidences:isConfident:dominantLanguage:isFinal:", v20, 1, 0, 1);
    v18 = v33;
    objc_msgSend(v30, "setDominantLanguage:", v33);

    v13 = v34;
    v4 = v35;
  }
  else
  {
    v31 = _LTOSLogLID();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[_LTTextLanguageDetector detectionForString:].cold.1((uint64_t)v13, v31, self);
    v30 = 0;
  }

  return v30;
}

- (id)detectionForStrings:(id)a3
{
  return -[_LTTextLanguageDetector detectionForStrings:strategy:](self, "detectionForStrings:strategy:", a3, 0);
}

- (id)detectionForStrings:(id)a3 strategy:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  _LTTextLanguageDetectorScorer *v8;
  void *v9;
  _LTTextLanguageDetectorScorer *v10;
  void *v11;
  int v12;
  NSObject *v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t i;
  uint64_t v38;
  id v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  unint64_t v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  id v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = _LTOSLogLID();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[_LTTextLanguageDetector detectionForStrings:strategy:].cold.4(v7, v6, a4);
  if (a4 == 1)
  {
    v8 = [_LTTextLanguageDetectorScorer alloc];
    -[_LTTextLanguageDetector availableLocales](self, "availableLocales");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[_LTTextLanguageDetectorScorer initWithSupportedLocales:](v8, "initWithSupportedLocales:", v9);

  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLForKey:", CFSTR("TextLIDAggregateEvaluation"));

  v13 = _LTOSLogLID();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
  if (!v12)
  {
    v56 = a4;
    if (v14)
      -[_LTTextLanguageDetector detectionForStrings:strategy:].cold.3(v13, v15, v16, v17, v18, v19, v20, v21);
    v28 = objc_alloc_init(MEMORY[0x24BDD14E0]);
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v57 = v6;
    v32 = v6;
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v59;
      v36 = (void *)*MEMORY[0x24BDF6578];
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v59 != v35)
            objc_enumerationMutation(v32);
          v38 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i);
          -[NLLanguageRecognizer reset](self->_recognizer, "reset", v56);
          -[NLLanguageRecognizer processString:](self->_recognizer, "processString:", v38);
          -[NLLanguageRecognizer dominantLanguage](self->_recognizer, "dominantLanguage");
          v39 = (id)objc_claimAutoreleasedReturnValue();
          if (!v39)
            v39 = v36;
          objc_msgSend(v28, "addObject:", v39);
          -[_LTTextLanguageDetectorScorer append:recognizer:](v10, "append:recognizer:", v38, self->_recognizer);

        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
      }
      while (v34);
    }

    if (objc_msgSend(v32, "count") == 1)
    {
      -[NLLanguageRecognizer languageHypothesesWithMaximum:](self->_recognizer, "languageHypothesesWithMaximum:", 10);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = _LTOSLogLID();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        -[_LTTextLanguageDetector detectionForStrings:strategy:].cold.2((uint64_t)v40, v41);
      -[NLLanguageRecognizer dominantLanguage](self->_recognizer, "dominantLanguage", v56);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "objectForKeyedSubscript:", v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "keysSortedByValueUsingComparator:", &__block_literal_global_26);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[_LTTextLanguageDetector _mapSupportedLocales:](self, "_mapSupportedLocales:", v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = _LTPreferencesTextLIDScorerConfidenceThreshold();
      objc_msgSend(v43, "doubleValue");
      if (v47 >= v46)
        v48 = 0;
      else
        v48 = v45;

    }
    else
    {
      v48 = 0;
    }
    v52 = objc_alloc(MEMORY[0x24BDF6468]);
    v53 = v52;
    v6 = v57;
    if (v56 == 1)
    {
      v31 = (void *)objc_msgSend(v52, "initWithScorer:", v10);
    }
    else
    {
      -[_LTTextLanguageDetector availableLocales](self, "availableLocales");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)objc_msgSend(v53, "initWithDetectionCounts:availableLocales:lowConfidenceLocales:strategy:", v28, v54, v48, v56);

    }
    goto LABEL_43;
  }
  if (v14)
    -[_LTTextLanguageDetector detectionForStrings:strategy:].cold.1(v13, v15, v16, v17, v18, v19, v20, v21);
  -[NLLanguageRecognizer reset](self->_recognizer, "reset");
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v22 = v6;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v63;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v63 != v25)
          objc_enumerationMutation(v22);
        v27 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * j);
        -[NLLanguageRecognizer processString:](self->_recognizer, "processString:", v27);
        -[_LTTextLanguageDetectorScorer append:recognizer:](v10, "append:recognizer:", v27, self->_recognizer);
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
    }
    while (v24);
  }

  -[NLLanguageRecognizer dominantLanguage](self->_recognizer, "dominantLanguage");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  if (!v28)
    v28 = (id)*MEMORY[0x24BDF6578];
  v29 = objc_alloc(MEMORY[0x24BDF6468]);
  v30 = v29;
  if (a4 != 1)
  {
    v49 = (void *)MEMORY[0x24BDD14E0];
    v67 = v28;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v67, 1);
    v48 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setWithArray:", v48);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LTTextLanguageDetector availableLocales](self, "availableLocales");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v30, "initWithDetectionCounts:availableLocales:lowConfidenceLocales:strategy:", v50, v51, 0, a4);

LABEL_43:
    goto LABEL_44;
  }
  v31 = (void *)objc_msgSend(v29, "initWithScorer:", v10);
LABEL_44:

  return v31;
}

- (id)_mapSupportedLocales:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __48___LTTextLanguageDetector__mapSupportedLocales___block_invoke;
  v4[3] = &unk_251A13C00;
  v4[4] = self;
  objc_msgSend(a3, "_ltCompactMap:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)availableLocales
{
  return self->_availableLocales;
}

- (void)setAvailableLocales:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableLocales, 0);
  objc_storeStrong((id *)&self->_recognizer, 0);
}

- (void)detectionForString:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(a3, "availableLocales");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = a1;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_2491B9000, v5, OS_LOG_TYPE_ERROR, "Could not find locale for %{public}@ in available: %{public}@", (uint8_t *)&v7, 0x16u);

  OUTLINED_FUNCTION_1_3();
}

- (void)detectionForString:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_2491B9000, a1, a3, "Detection for string value", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_0();
}

- (void)detectionForStrings:(uint64_t)a3 strategy:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_2491B9000, a1, a3, "Text lid evaluation strategy: aggregate", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_0();
}

- (void)detectionForStrings:(uint64_t)a1 strategy:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_2491B9000, a2, OS_LOG_TYPE_DEBUG, "Language confidences: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)detectionForStrings:(uint64_t)a3 strategy:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_2491B9000, a1, a3, "Text lid evaluation strategy: count-based", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_0();
}

- (void)detectionForStrings:(unint64_t)a3 strategy:.cold.4(void *a1, void *a2, unint64_t a3)
{
  NSObject *v5;
  uint64_t v6;
  const __CFString *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = objc_msgSend(a2, "count");
  if (a3 > 2)
    v7 = CFSTR("undefined");
  else
    v7 = off_251A13C20[a3];
  v8 = 134218242;
  v9 = v6;
  v10 = 2114;
  v11 = v7;
  _os_log_debug_impl(&dword_2491B9000, v5, OS_LOG_TYPE_DEBUG, "Detection for %zd string array using strategy: %{public}@", (uint8_t *)&v8, 0x16u);

  OUTLINED_FUNCTION_1_3();
}

@end
