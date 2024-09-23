@implementation SiriNLUOverridesTrieBundle

- (id)fetchRuleId:(id)a3 locale:(id)a4 overrideNamespace:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  SiriNLUMarisaTrie *patternTrie;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  +[SiriNLUOverridesTrieBundle buildPatternTrieLookupKey:locale:overrideNamespace:](SiriNLUOverridesTrieBundle, "buildPatternTrieLookupKey:locale:overrideNamespace:", v9, v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = OverridesLogContext;
  if (os_log_type_enabled((os_log_t)OverridesLogContext, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "-[SiriNLUOverridesTrieBundle fetchRuleId:locale:overrideNamespace:]";
    v24 = 2112;
    v25 = v11;
    _os_log_debug_impl(&dword_21952B000, v12, OS_LOG_TYPE_DEBUG, "%s TrieOverrides: Starting to fetch rule Id for lookup key:%@", buf, 0x16u);
  }
  patternTrie = self->patternTrie;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __67__SiriNLUOverridesTrieBundle_fetchRuleId_locale_overrideNamespace___block_invoke;
  v19[3] = &unk_24DA9F070;
  v20 = v11;
  v14 = v10;
  v21 = v14;
  v15 = v11;
  -[SiriNLUMarisaTrie lookupKey:resultBlock:](patternTrie, "lookupKey:resultBlock:", v15, v19);
  v16 = v21;
  v17 = v14;

  return v17;
}

+ (id)buildPatternTrieLookupKey:(id)a3 locale:(id)a4 overrideNamespace:(int64_t)a5
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("__%ld__+%@+%@"), a5, a4, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->overrideTimeStampTrie, 0);
  objc_storeStrong((id *)&self->userParseTrie, 0);
  objc_storeStrong((id *)&self->overrideIdTrie, 0);
  objc_storeStrong((id *)&self->patternTrie, 0);
  objc_storeStrong((id *)&self->ruleTrie, 0);
}

- (id)init:(id)a3
{
  id v4;
  SiriNLUOverridesTrieBundle *v5;
  void *v6;
  NSObject *v7;
  SiriNLUMarisaTrie *v8;
  void *v9;
  uint64_t v10;
  SiriNLUMarisaTrie *ruleTrie;
  SiriNLUMarisaTrie *v12;
  void *v13;
  uint64_t v14;
  SiriNLUMarisaTrie *patternTrie;
  SiriNLUMarisaTrie *v16;
  void *v17;
  uint64_t v18;
  SiriNLUMarisaTrie *overrideIdTrie;
  SiriNLUMarisaTrie *v20;
  void *v21;
  uint64_t v22;
  SiriNLUMarisaTrie *userParseTrie;
  SiriNLUMarisaTrie *v24;
  void *v25;
  uint64_t v26;
  SiriNLUMarisaTrie *overrideTimeStampTrie;
  NSObject *v28;
  SiriNLUOverridesTrieBundle *v29;
  NSObject *v30;
  NSObject *v31;
  objc_super v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[SiriNLUOverridesLogging SiriNLUOverridesLogInitIfNeeded](SiriNLUOverridesLogging, "SiriNLUOverridesLogInitIfNeeded");
  v33.receiver = self;
  v33.super_class = (Class)SiriNLUOverridesTrieBundle;
  v5 = -[SiriNLUOverridesTrieBundle init](&v33, sel_init);
  if (v5)
  {
    +[SiriNLUOverridesTrieBundle getTrieURLs:](SiriNLUOverridesTrieBundle, "getTrieURLs:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = OverridesLogContext;
    if (os_log_type_enabled((os_log_t)OverridesLogContext, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "-[SiriNLUOverridesTrieBundle init:]";
      v36 = 2112;
      v37 = v6;
      _os_log_debug_impl(&dword_21952B000, v7, OS_LOG_TYPE_DEBUG, "%s TrieOverrides: Reading Overrrides trie from %@", buf, 0x16u);
    }
    v8 = [SiriNLUMarisaTrie alloc];
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SiriNLUMarisaTrie initWithURL:](v8, "initWithURL:", v9);
    ruleTrie = v5->ruleTrie;
    v5->ruleTrie = (SiriNLUMarisaTrie *)v10;

    v12 = [SiriNLUMarisaTrie alloc];
    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SiriNLUMarisaTrie initWithURL:](v12, "initWithURL:", v13);
    patternTrie = v5->patternTrie;
    v5->patternTrie = (SiriNLUMarisaTrie *)v14;

    v16 = [SiriNLUMarisaTrie alloc];
    objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[SiriNLUMarisaTrie initWithURL:](v16, "initWithURL:", v17);
    overrideIdTrie = v5->overrideIdTrie;
    v5->overrideIdTrie = (SiriNLUMarisaTrie *)v18;

    v20 = [SiriNLUMarisaTrie alloc];
    objc_msgSend(v6, "objectAtIndexedSubscript:", 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[SiriNLUMarisaTrie initWithURL:](v20, "initWithURL:", v21);
    userParseTrie = v5->userParseTrie;
    v5->userParseTrie = (SiriNLUMarisaTrie *)v22;

    v24 = [SiriNLUMarisaTrie alloc];
    objc_msgSend(v6, "objectAtIndexedSubscript:", 4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[SiriNLUMarisaTrie initWithURL:](v24, "initWithURL:", v25);
    overrideTimeStampTrie = v5->overrideTimeStampTrie;
    v5->overrideTimeStampTrie = (SiriNLUMarisaTrie *)v26;

    if (v5->ruleTrie && v5->patternTrie && v5->overrideIdTrie && v5->userParseTrie && v5->overrideTimeStampTrie)
    {
      v28 = OverridesLogContext;
      if (os_log_type_enabled((os_log_t)OverridesLogContext, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v35 = "-[SiriNLUOverridesTrieBundle init:]";
        _os_log_impl(&dword_21952B000, v28, OS_LOG_TYPE_INFO, "%s TrieOverrides: Successfully initialized", buf, 0xCu);
      }
      v29 = v5;
    }
    else
    {
      v30 = OverridesLogContext;
      if (os_log_type_enabled((os_log_t)OverridesLogContext, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v35 = "-[SiriNLUOverridesTrieBundle init:]";
        _os_log_error_impl(&dword_21952B000, v30, OS_LOG_TYPE_ERROR, "%s [ERR]: TrieOverrides: Failing to init without required assets", buf, 0xCu);
      }
      v29 = 0;
    }

  }
  else
  {
    v31 = OverridesLogContext;
    if (os_log_type_enabled((os_log_t)OverridesLogContext, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v35 = "-[SiriNLUOverridesTrieBundle init:]";
      _os_log_error_impl(&dword_21952B000, v31, OS_LOG_TYPE_ERROR, "%s [ERR]: TrieOverrides: Unable to initialized for unknown reasons", buf, 0xCu);
    }
    v29 = 0;
  }

  return v29;
}

+ (id)getTrieURLs:(id)a3
{
  id v3;
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
  void *v15;

  v3 = a3;
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("rule_id_to_serialized_rule.trie"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("pattern_to_rule_id.trie"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("rule_id_to_override_id.trie"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("override_id_to_serialized_parse.trie"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("override_id_to_timestamp.trie"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v8, v9, v10, v11, v12, 0);

  return v13;
}

- (id)fetchRegexRuleIds:(id)a3 overrideNamespace:(int64_t)a4
{
  return -[SiriNLUOverridesTrieBundle fetchRuleId:locale:overrideNamespace:](self, "fetchRuleId:locale:overrideNamespace:", CFSTR("__REGEX__"), a3, a4);
}

void __67__SiriNLUOverridesTrieBundle_fetchRuleId_locale_overrideNamespace___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v3, 4);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);

  }
  else
  {
    v5 = OverridesLogContext;
    if (os_log_type_enabled((os_log_t)OverridesLogContext, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 136315394;
      v8 = "-[SiriNLUOverridesTrieBundle fetchRuleId:locale:overrideNamespace:]_block_invoke";
      v9 = 2112;
      v10 = v6;
      _os_log_error_impl(&dword_21952B000, v5, OS_LOG_TYPE_ERROR, "%s [ERR]: PatternTrie returns nil binary for lookup key:%@, exit early from the callback to prevent crash", (uint8_t *)&v7, 0x16u);
    }
  }

}

- (id)fetchSerializedNluRequestRule:(id)a3
{
  id v4;
  SiriNLUMarisaTrie *ruleTrie;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  ruleTrie = self->ruleTrie;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __60__SiriNLUOverridesTrieBundle_fetchSerializedNluRequestRule___block_invoke;
  v9[3] = &unk_24DA9F048;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  -[SiriNLUMarisaTrie lookupKey:resultBlock:](ruleTrie, "lookupKey:resultBlock:", v6, v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __60__SiriNLUOverridesTrieBundle_fetchSerializedNluRequestRule___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  else
  {
    v5 = OverridesLogContext;
    if (os_log_type_enabled((os_log_t)OverridesLogContext, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 136315394;
      v8 = "-[SiriNLUOverridesTrieBundle fetchSerializedNluRequestRule:]_block_invoke";
      v9 = 2112;
      v10 = v6;
      _os_log_error_impl(&dword_21952B000, v5, OS_LOG_TYPE_ERROR, "%s [ERR]: SerializedRuleTrie returns nil binary for ruleId:%@, exit early from the callback to prevent crash", (uint8_t *)&v7, 0x16u);
    }
  }

}

- (id)fetchOverrideId:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[SiriNLUOverridesTrieBundle fetchOverrideIdArray:](self, "fetchOverrideIdArray:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v3, "count") >= 2)
    {
      v5 = (void *)OverridesLogContext;
      if (os_log_type_enabled((os_log_t)OverridesLogContext, OS_LOG_TYPE_ERROR))
      {
        v6 = v5;
        v9 = 136315650;
        v10 = "-[SiriNLUOverridesTrieBundle fetchOverrideId:]";
        v11 = 2048;
        v12 = objc_msgSend(v3, "count");
        v13 = 2112;
        v14 = v4;
        _os_log_error_impl(&dword_21952B000, v6, OS_LOG_TYPE_ERROR, "%s [ERR]: OverrrideId has multiple values (length:%lu), possibly mal-formed data, returning the last one from the array. OverrideId returned:%@. ", (uint8_t *)&v9, 0x20u);

      }
    }
  }
  else
  {
    v7 = OverridesLogContext;
    if (os_log_type_enabled((os_log_t)OverridesLogContext, OS_LOG_TYPE_INFO))
    {
      v9 = 136315138;
      v10 = "-[SiriNLUOverridesTrieBundle fetchOverrideId:]";
      _os_log_impl(&dword_21952B000, v7, OS_LOG_TYPE_INFO, "%s [WARN]: OverrideId not found, returning nil", (uint8_t *)&v9, 0xCu);
    }
    v4 = 0;
  }

  return v4;
}

- (id)fetchOverrideIdArray:(id)a3
{
  id v4;
  void *v5;
  SiriNLUMarisaTrie *overrideIdTrie;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  overrideIdTrie = self->overrideIdTrie;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __51__SiriNLUOverridesTrieBundle_fetchOverrideIdArray___block_invoke;
  v12[3] = &unk_24DA9F070;
  v13 = v4;
  v7 = v5;
  v14 = v7;
  v8 = v4;
  -[SiriNLUMarisaTrie lookupKey:resultBlock:](overrideIdTrie, "lookupKey:resultBlock:", v8, v12);
  v9 = v14;
  v10 = v7;

  return v10;
}

void __51__SiriNLUOverridesTrieBundle_fetchOverrideIdArray___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v3, 4);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);

  }
  else
  {
    v5 = OverridesLogContext;
    if (os_log_type_enabled((os_log_t)OverridesLogContext, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 136315394;
      v8 = "-[SiriNLUOverridesTrieBundle fetchOverrideIdArray:]_block_invoke";
      v9 = 2112;
      v10 = v6;
      _os_log_error_impl(&dword_21952B000, v5, OS_LOG_TYPE_ERROR, "%s [ERR]: OverrideIdTrie returns nil binary for ruleId:%@, exit early from the callback to prevent crash", (uint8_t *)&v7, 0x16u);
    }
  }

}

- (id)fetchSerializedUserParse:(id)a3
{
  id v4;
  SiriNLUMarisaTrie *userParseTrie;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  userParseTrie = self->userParseTrie;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __55__SiriNLUOverridesTrieBundle_fetchSerializedUserParse___block_invoke;
  v9[3] = &unk_24DA9F048;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  -[SiriNLUMarisaTrie lookupKey:resultBlock:](userParseTrie, "lookupKey:resultBlock:", v6, v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __55__SiriNLUOverridesTrieBundle_fetchSerializedUserParse___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  else
  {
    v5 = OverridesLogContext;
    if (os_log_type_enabled((os_log_t)OverridesLogContext, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 136315394;
      v8 = "-[SiriNLUOverridesTrieBundle fetchSerializedUserParse:]_block_invoke";
      v9 = 2112;
      v10 = v6;
      _os_log_error_impl(&dword_21952B000, v5, OS_LOG_TYPE_ERROR, "%s [ERR]: UserParseTrie returns nil binary for overrideId:%@, exit early  from the callback to prevent crash", (uint8_t *)&v7, 0x16u);
    }
  }

}

- (unint64_t)fetchOverrideTimeStamp:(id)a3
{
  id v4;
  SiriNLUMarisaTrie *overrideTimeStampTrie;
  id v6;
  unint64_t v7;
  _QWORD v9[4];
  id v10;
  _QWORD *v11;
  uint64_t *v12;
  _QWORD v13[3];
  char v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v14 = 0;
  overrideTimeStampTrie = self->overrideTimeStampTrie;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __53__SiriNLUOverridesTrieBundle_fetchOverrideTimeStamp___block_invoke;
  v9[3] = &unk_24DA9F098;
  v6 = v4;
  v10 = v6;
  v11 = v13;
  v12 = &v15;
  -[SiriNLUMarisaTrie lookupKey:resultBlock:](overrideTimeStampTrie, "lookupKey:resultBlock:", v6, v9);
  v7 = v16[3];

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(&v15, 8);

  return v7;
}

void __53__SiriNLUOverridesTrieBundle_fetchOverrideTimeStamp___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
    {
      objc_msgSend(v3, "getBytes:length:", *(_QWORD *)(a1[6] + 8) + 24, 8);
      *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
      goto LABEL_9;
    }
    v5 = OverridesLogContext;
    if (os_log_type_enabled((os_log_t)OverridesLogContext, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315138;
      v12 = "-[SiriNLUOverridesTrieBundle fetchOverrideTimeStamp:]_block_invoke";
      v6 = "%s [ERR]: OverrideId has multiple time stamps! Possibly mal-formed data, exit early from the callback and wil"
           "l return the first value looked up";
      v7 = v5;
      v8 = 12;
LABEL_7:
      _os_log_error_impl(&dword_21952B000, v7, OS_LOG_TYPE_ERROR, v6, (uint8_t *)&v11, v8);
    }
  }
  else
  {
    v9 = OverridesLogContext;
    if (os_log_type_enabled((os_log_t)OverridesLogContext, OS_LOG_TYPE_ERROR))
    {
      v10 = a1[4];
      v11 = 136315394;
      v12 = "-[SiriNLUOverridesTrieBundle fetchOverrideTimeStamp:]_block_invoke";
      v13 = 2112;
      v14 = v10;
      v6 = "%s [ERR]: TimeStampTrie returns nil binary for overrideId:%@, exit early  from the callback to prevent crash";
      v7 = v9;
      v8 = 22;
      goto LABEL_7;
    }
  }
LABEL_9:

}

@end
