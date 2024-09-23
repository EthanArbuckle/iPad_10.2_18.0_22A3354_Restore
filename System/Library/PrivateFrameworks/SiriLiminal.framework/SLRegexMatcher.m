@implementation SLRegexMatcher

- (SLRegexMatcher)initWithConfigFile:(id)a3
{
  id v4;
  SLRegexMatcher *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SLRegexMatcher *v14;
  void *v15;
  NSObject *v17;
  void *v18;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SLRegexMatcher;
  v5 = -[SLRegexMatcher init](&v19, sel_init);
  if (!v5)
    goto LABEL_12;
  if (SLLogInitIfNeeded_once != -1)
    dispatch_once(&SLLogInitIfNeeded_once, &__block_literal_global);
  objc_msgSend(MEMORY[0x24BE28430], "decodeJsonFromFile:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rules"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
LABEL_11:
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("rules"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SLRegexMatcher _compileRegexRulesForPatterns:](v5, "_compileRegexRulesForPatterns:", v15);

LABEL_12:
      v14 = v5;
      goto LABEL_13;
    }
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Missing config for regex matcher %@"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD1540];
  v24 = CFSTR("reason");
  v25[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sl"), 115, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {

    goto LABEL_11;
  }
  v13 = (void *)SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    v17 = v13;
    objc_msgSend(v12, "localizedDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v21 = "-[SLRegexMatcher initWithConfigFile:]";
    v22 = 2112;
    v23 = v18;
    _os_log_error_impl(&dword_213B50000, v17, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);

  }
  v14 = 0;
LABEL_13:

  return v14;
}

- (void)_compileRegexRulesForPatterns:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSArray *v7;
  NSArray *v8;
  NSArray *regexMatchingRules;
  NSArray *v10;
  NSArray *replaceStrings;
  NSArray *v12;
  _QWORD v13[4];
  NSArray *v14;
  NSArray *v15;
  _QWORD *v16;
  _QWORD v17[5];
  id v18;

  v4 = a3;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__106;
  v17[4] = __Block_byref_object_dispose__107;
  v18 = 0;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __48__SLRegexMatcher__compileRegexRulesForPatterns___block_invoke;
  v13[3] = &unk_24D0C6178;
  v16 = v17;
  v7 = v5;
  v14 = v7;
  v8 = v6;
  v15 = v8;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v13);
  regexMatchingRules = self->_regexMatchingRules;
  self->_regexMatchingRules = v7;
  v10 = v7;

  replaceStrings = self->_replaceStrings;
  self->_replaceStrings = v8;
  v12 = v8;

  _Block_object_dispose(v17, 8);
}

- (id)applyPreprocessingOnUtt:(id)a3
{
  id v4;
  NSArray *regexMatchingRules;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__106;
  v15 = __Block_byref_object_dispose__107;
  v16 = (id)objc_msgSend(v4, "mutableCopy");
  regexMatchingRules = self->_regexMatchingRules;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __42__SLRegexMatcher_applyPreprocessingOnUtt___block_invoke;
  v10[3] = &unk_24D0C61A0;
  v10[4] = self;
  v10[5] = &v11;
  -[NSArray enumerateObjectsUsingBlock:](regexMatchingRules, "enumerateObjectsUsingBlock:", v10);
  v6 = SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[SLRegexMatcher applyPreprocessingOnUtt:]";
    v19 = 2112;
    v20 = v4;
    _os_log_impl(&dword_213B50000, v6, OS_LOG_TYPE_DEFAULT, "%s Input to regex: %@", buf, 0x16u);
    v6 = SLLogContextFacilityCoreSpeech;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)v12[5];
    *(_DWORD *)buf = 136315394;
    v18 = "-[SLRegexMatcher applyPreprocessingOnUtt:]";
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_213B50000, v6, OS_LOG_TYPE_DEFAULT, "%s Output of regex: %@", buf, 0x16u);
  }
  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (NSArray)regexMatchingRules
{
  return self->_regexMatchingRules;
}

- (void)setRegexMatchingRules:(id)a3
{
  objc_storeStrong((id *)&self->_regexMatchingRules, a3);
}

- (NSArray)replaceStrings
{
  return self->_replaceStrings;
}

- (void)setReplaceStrings:(id)a3
{
  objc_storeStrong((id *)&self->_replaceStrings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replaceStrings, 0);
  objc_storeStrong((id *)&self->_regexMatchingRules, 0);
}

void __42__SLRegexMatcher_applyPreprocessingOnUtt___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  id v8;

  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v6 = a2;
  v7 = objc_msgSend(v5, "length");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectAtIndexedSubscript:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "replaceMatchesInString:options:range:withTemplate:", v5, 0, 0, v7, v8);

}

void __48__SLRegexMatcher__compileRegexRulesForPatterns___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  id obj;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("patternMatch"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("replaceWith"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    obj = *(id *)(v6 + 40);
    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", v4, 1, &obj);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v6 + 40), obj);
    v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (v8)
      v9 = 1;
    else
      v9 = v7 == 0;
    if (v9 || v5 == 0)
    {
      v11 = (void *)SLLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        v12 = v11;
        objc_msgSend(v8, "localizedDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v17 = "-[SLRegexMatcher _compileRegexRulesForPatterns:]_block_invoke";
        v18 = 2112;
        v19 = v4;
        v20 = 2112;
        v21 = v13;
        _os_log_error_impl(&dword_213B50000, v12, OS_LOG_TYPE_ERROR, "%s Unable to decode pattern %@ with err %@", buf, 0x20u);

      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
    }

  }
  else
  {
    v14 = SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[SLRegexMatcher _compileRegexRulesForPatterns:]_block_invoke";
      _os_log_error_impl(&dword_213B50000, v14, OS_LOG_TYPE_ERROR, "%s Empty pattern, ignore", buf, 0xCu);
    }
  }

}

@end
