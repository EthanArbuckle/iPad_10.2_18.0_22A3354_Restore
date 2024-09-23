@implementation RKPersistentPersonalizer

+ (id)nonEmptyStringsPredicate
{
  if (nonEmptyStringsPredicate_onceToken != -1)
    dispatch_once(&nonEmptyStringsPredicate_onceToken, &__block_literal_global_4);
  return (id)nonEmptyStringsPredicate_sNonEmptyStringsPredicate;
}

void __52__RKPersistentPersonalizer_nonEmptyStringsPredicate__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("SELF != ''"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)nonEmptyStringsPredicate_sNonEmptyStringsPredicate;
  nonEmptyStringsPredicate_sNonEmptyStringsPredicate = v0;

}

- (RKPersistentPersonalizer)init
{
  -[RKPersistentPersonalizer doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return self;
}

- (RKPersistentPersonalizer)initWithLanguageIdentifier:(id)a3 andDynamicDataURL:(id)a4 displayStringsProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  RKPersistentPersonalizer *v12;
  RKPersistentPersonalizer *v13;
  uint64_t v14;
  NSLocale *languageLocale;
  void **p_dynamicDataURL;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSMutableDictionary *synonyms;
  RKPersistentPersonalizer *v28;
  objc_super v30;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v30.receiver = self;
  v30.super_class = (Class)RKPersistentPersonalizer;
  v12 = -[RKPersistentPersonalizer init](&v30, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_languageID, a3);
    objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v9);
    v14 = objc_claimAutoreleasedReturnValue();
    languageLocale = v13->_languageLocale;
    v13->_languageLocale = (NSLocale *)v14;

    p_dynamicDataURL = (void **)&v13->_dynamicDataURL;
    objc_storeStrong((id *)&v13->_dynamicDataURL, a4);
    if (!v13->_dynamicDataURL)
    {
      NSHomeDirectory();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringByAppendingPathComponent:", CFSTR("Library/ResponseKit"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v18, 1);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = *p_dynamicDataURL;
      *p_dynamicDataURL = (void *)v19;

    }
    objc_storeStrong((id *)&v13->_displayStringsProvider, a5);
    v13->_model = -[RKPersistentPersonalizer createLanguageModel](v13, "createLanguageModel");
    -[RKPersistentPersonalizer dynamicDataCreationDate](v13, "dynamicDataCreationDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v13->_lastObservedDynamicDataCreationDate, v21);

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v13->_lastDynamicDataCreationCheckDate, v22);

    if (!v13->_model)
    {
      v28 = 0;
      goto LABEL_10;
    }
    -[RKPersistentPersonalizer languageID](v13, "languageID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[RKUtilities canonicalLanguageAndScriptCodeIdentifierForIdentifier:](RKUtilities, "canonicalLanguageAndScriptCodeIdentifierForIdentifier:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    +[RKAssets synonyms](RKAssets, "synonyms");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKeyedSubscript:", v24);
    v26 = objc_claimAutoreleasedReturnValue();
    synonyms = v13->_synonyms;
    v13->_synonyms = (NSMutableDictionary *)v26;

    if (LMLanguageModelDynamicModelIsEmpty())
      -[RKPersistentPersonalizer initializeDynamicLanguageModel](v13, "initializeDynamicLanguageModel");

  }
  v28 = v13;
LABEL_10:

  return v28;
}

- (id)dynamicDataCreationDate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[RKPersistentPersonalizer model](self, "model");
  v2 = (void *)LMLanguageModelCopyDynamicModelBundlePath();
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "attributesOfItemAtPath:error:", v2, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDD0C58]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)model
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  char v11;
  void *model;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RKPersistentPersonalizer lastDynamicDataCreationCheckDate](self, "lastDynamicDataCreationCheckDate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4
    || (v5 = (void *)v4,
        -[RKPersistentPersonalizer lastDynamicDataCreationCheckDate](self, "lastDynamicDataCreationCheckDate"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "timeIntervalSinceDate:", v6),
        v8 = v7,
        v6,
        v5,
        v8 > 3600.0))
  {
    -[RKPersistentPersonalizer setLastDynamicDataCreationCheckDate:](self, "setLastDynamicDataCreationCheckDate:", v3);
    -[RKPersistentPersonalizer dynamicDataCreationDate](self, "dynamicDataCreationDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[RKPersistentPersonalizer lastObservedDynamicDataCreationDate](self, "lastObservedDynamicDataCreationDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToDate:", v10);

      if ((v11 & 1) == 0)
      {
        if (-[RKPersistentPersonalizer model](self, "model"))
        {
          LMLanguageModelRelease();
          self->_model = 0;
        }
        self->_model = -[RKPersistentPersonalizer createLanguageModel](self, "createLanguageModel");
        -[RKPersistentPersonalizer setLastObservedDynamicDataCreationDate:](self, "setLastObservedDynamicDataCreationDate:", v9);
      }
    }
    else
    {
      if (-[RKPersistentPersonalizer model](self, "model"))
        LMLanguageModelRelease();
      self->_model = 0;
    }

  }
  model = self->_model;

  return model;
}

- (void)initializeDynamicLanguageModel
{
  RKDisplayStringsProvider *displayStringsProvider;
  RKDisplayStringsProvider **p_displayStringsProvider;
  void *v5;
  RKDisplayStringsProvider *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id obj;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  _QWORD v35[4];
  id v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  p_displayStringsProvider = &self->_displayStringsProvider;
  displayStringsProvider = self->_displayStringsProvider;
  -[RKPersistentPersonalizer languageID](self, "languageID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RKDisplayStringsProvider displayStringsForPlatform:languageID:](displayStringsProvider, "displayStringsForPlatform:languageID:", CFSTR("iOS"), v5);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *p_displayStringsProvider;
  -[RKPersistentPersonalizer languageID](self, "languageID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RKDisplayStringsProvider displayStringsForPlatform:languageID:](v6, "displayStringsForPlatform:languageID:", CFSTR("watchOS"), v7);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v31, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setByAddingObjectsFromArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v13;
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v32)
  {
    v30 = *(_QWORD *)v49;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v49 != v30)
        {
          v15 = v14;
          objc_enumerationMutation(obj);
          v14 = v15;
        }
        v33 = v14;
        v16 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v14);
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        objc_msgSend(v31, "objectForKeyedSubscript:", v16);
        v34 = (id)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
        if (v17)
        {
          v18 = *(_QWORD *)v45;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v45 != v18)
                objc_enumerationMutation(v34);
              v20 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
              +[RKUtilities normalizeForPersonalization:](RKUtilities, "normalizeForPersonalization:", v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              -[RKPersistentPersonalizer headwordsForSynonym:](self, "headwordsForSynonym:", v20);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = 0;
              v39 = &v38;
              v40 = 0x3032000000;
              v41 = __Block_byref_object_copy__0;
              v42 = __Block_byref_object_dispose__0;
              v43 = 0;
              v35[0] = MEMORY[0x24BDAC760];
              v35[1] = 3221225472;
              v35[2] = __58__RKPersistentPersonalizer_initializeDynamicLanguageModel__block_invoke;
              v35[3] = &unk_24C6AF518;
              v23 = v21;
              v36 = v23;
              v37 = &v38;
              objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v35);
              v24 = v39[5];
              if (v24)
                goto LABEL_13;
              objc_msgSend(v22, "allKeys");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
              v26 = objc_claimAutoreleasedReturnValue();
              v27 = (void *)v39[5];
              v39[5] = v26;

              v24 = v39[5];
              if (v24)
LABEL_13:
                -[RKPersistentPersonalizer trainSynonymForSpeechAct:headword:userResponse:recipientContext:weight:effectiveDate:](self, "trainSynonymForSpeechAct:headword:userResponse:recipientContext:weight:effectiveDate:", v16, v24, v20, 0, 3, 0);

              _Block_object_dispose(&v38, 8);
            }
            v17 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
          }
          while (v17);
        }

        v14 = v33 + 1;
      }
      while (v33 + 1 != v32);
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v32);
  }

}

void __58__RKPersistentPersonalizer_initializeDynamicLanguageModel__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v7 = a2;
  v8 = *(void **)(a1 + 32);
  v10 = v7;
  +[RKUtilities normalizeForPersonalization:](RKUtilities, "normalizeForPersonalization:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v8, "isEqualToString:", v9);

  if ((_DWORD)v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)trainSynonymForSpeechAct:(id)a3 headword:(id)a4 userResponse:(id)a5 recipientContext:(id)a6 weight:(unint64_t)a7 effectiveDate:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  char *v22;
  unint64_t v23;
  void *v24;
  int TokenIDForString;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  _QWORD v30[2];
  id v31;
  id v32;
  uint8_t buf[4];
  uint64_t v34;
  _QWORD v35[4];

  v35[3] = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  -[RKPersistentPersonalizer model](self, "model");
  LMLanguageModelSetParameterValue();
  v32 = v14;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("A:%@"), v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v19;
  v31 = v15;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("H:%@"), v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v20;
  v35[2] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v30[1] = v30;
  v22 = (char *)v30 - ((4 * objc_msgSend(v21, "count") + 15) & 0xFFFFFFFFFFFFFFF0);
  if (objc_msgSend(v21, "count"))
  {
    v23 = 0;
    do
    {
      *(_DWORD *)buf = 0;
      -[RKPersistentPersonalizer model](self, "model");
      objc_msgSend(v21, "objectAtIndexedSubscript:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      TokenIDForString = LMLanguageModelGetTokenIDForString();

      *(_DWORD *)buf = TokenIDForString;
      if (!TokenIDForString)
      {
        -[RKPersistentPersonalizer model](self, "model");
        objc_msgSend(v21, "objectAtIndexedSubscript:", v23);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        LMLanguageModelAddTokenForString();

        TokenIDForString = *(_DWORD *)buf;
      }
      *(_DWORD *)&v22[4 * v23++] = TokenIDForString;
    }
    while (v23 < objc_msgSend(v21, "count"));
  }
  objc_msgSend(v18, "timeIntervalSinceReferenceDate");
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v27 = objc_msgSend(v21, "count");
    *(_DWORD *)buf = 134217984;
    v34 = v27;
    _os_log_impl(&dword_20D3BA000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "updating dynamic lm with [%lu] candidate ngrams", buf, 0xCu);
  }
  if (a7)
  {
    v28 = 0;
    do
    {
      if (objc_msgSend(v21, "count"))
      {
        v29 = 0;
        do
        {
          -[RKPersistentPersonalizer model](self, "model");
          if (v18)
            LMLanguageModelIncrementUsageCountWithEffectiveTime();
          else
            LMLanguageModelIncrementUsageCount();
          ++v29;
        }
        while (v29 < objc_msgSend(v21, "count"));
      }
      ++v28;
    }
    while (v28 != a7);
  }

}

- (id)topSynonymsForSpeechAct:(id)a3 headword:(id)a4 recipientContext:(id)a5 maxCount:(unint64_t)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char *v16;
  void *v17;
  id v18;
  id v19;
  unint64_t v20;
  char v21;
  void *v22;
  int TokenIDForString;
  uint64_t v25;
  id v26;
  unint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t, uint64_t, uint64_t, BOOL *);
  void *v32;
  RKPersistentPersonalizer *v33;
  id v34;
  unint64_t v35;
  _QWORD v36[3];

  v27 = a6;
  v36[2] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[RKPersistentPersonalizer model](self, "model");
  LMLanguageModelSetParameterValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("A:%@"), v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v13;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("H:%@"), v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = &v25;
  v16 = (char *)&v25 - ((4 * objc_msgSend(v15, "count") + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!objc_msgSend(v15, "count"))
    goto LABEL_5;
  v26 = v11;
  v17 = v12;
  v18 = v10;
  v19 = v9;
  v20 = 0;
  v21 = 1;
  do
  {
    -[RKPersistentPersonalizer model](self, "model");
    objc_msgSend(v15, "objectAtIndexedSubscript:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    TokenIDForString = LMLanguageModelGetTokenIDForString();

    *(_DWORD *)&v16[4 * v20] = TokenIDForString;
    v21 &= TokenIDForString != 0;
    ++v20;
  }
  while (v20 < objc_msgSend(v15, "count"));
  v9 = v19;
  v10 = v18;
  v12 = v17;
  v11 = v26;
  if ((v21 & 1) != 0)
  {
LABEL_5:
    -[RKPersistentPersonalizer model](self, "model");
    objc_msgSend(v15, "count");
    v29 = MEMORY[0x24BDAC760];
    v30 = 3221225472;
    v31 = __87__RKPersistentPersonalizer_topSynonymsForSpeechAct_headword_recipientContext_maxCount___block_invoke;
    v32 = &unk_24C6AF540;
    v33 = self;
    v34 = v12;
    v35 = v27;
    LMLanguageModelEnumeratePredictionsWithBlock();

  }
  return v12;
}

void __87__RKPersistentPersonalizer_topSynonymsForSpeechAct_headword_recipientContext_maxCount___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, BOOL *a5)
{
  id StringForTokenID;

  objc_msgSend(*(id *)(a1 + 32), "model");
  StringForTokenID = (id)LMLanguageModelCreateStringForTokenID();
  if (StringForTokenID)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", StringForTokenID);
  *a5 = (unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") >= *(_QWORD *)(a1 + 48);

}

- (void)createLanguageModel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDBCEA0];
  -[RKPersistentPersonalizer languageID](self, "languageID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localeWithLocaleIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObject:forKey:", v5, *MEMORY[0x24BE5EEB8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x24BDBD1C0];
    objc_msgSend(v6, "setObject:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE5EED8]);
    objc_msgSend(v6, "setObject:forKey:", v7, *MEMORY[0x24BE5EED0]);
    objc_msgSend(v6, "setObject:forKey:", CFSTR("com.apple.MobileSMS"), *MEMORY[0x24BE5EE68]);
    -[RKPersistentPersonalizer dynamicDataURL](self, "dynamicDataURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v8, *MEMORY[0x24BE5EE78]);

    objc_msgSend(v6, "setObject:forKey:", v7, *MEMORY[0x24BE5EEB0]);
    v9 = (void *)LMLanguageModelCreate();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)dealloc
{
  NSMutableDictionary *synonyms;
  objc_super v4;

  if (self->_model)
  {
    LMLanguageModelRelease();
    self->_model = 0;
  }
  synonyms = self->_synonyms;
  self->_synonyms = 0;

  v4.receiver = self;
  v4.super_class = (Class)RKPersistentPersonalizer;
  -[RKPersistentPersonalizer dealloc](&v4, sel_dealloc);
}

- (id)headwordsForSynonym:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__0;
  v23 = __Block_byref_object_dispose__0;
  v24 = 0;
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "nonEmptyStringsPredicate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "filteredArrayUsingPredicate:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(" "));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[RKUtilities normalizeForPersonalization:](RKUtilities, "normalizeForPersonalization:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RKPersistentPersonalizer synonyms](self, "synonyms");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __48__RKPersistentPersonalizer_headwordsForSynonym___block_invoke;
    v15[3] = &unk_24C6AF568;
    v12 = v10;
    v16 = v12;
    v18 = &v19;
    v4 = v9;
    v17 = v4;
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v15);

    v13 = (id)v20[5];
  }
  else
  {
    v13 = 0;
  }
  _Block_object_dispose(&v19, 8);

  return v13;
}

void __48__RKPersistentPersonalizer_headwordsForSynonym___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(a3, "containsObject:", a1[4]))
  {
    v5 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1[6] + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

      v5 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
    }
    objc_msgSend(v5, "setObject:forKeyedSubscript:", a1[5], v9);
  }

}

- (id)headwordsForSynonymPrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = (void *)MEMORY[0x24BDD14A8];
  v5 = a3;
  objc_msgSend(v4, "whitespaceCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsSeparatedByCharactersInSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "nonEmptyStringsPredicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filteredArrayUsingPredicate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsJoinedByString:", CFSTR(" "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "componentsSeparatedByString:", CFSTR(" "));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");
  if (v12 >= 4)
    v13 = 4;
  else
    v13 = v12;
  if (v13)
  {
    while (1)
    {
      objc_msgSend(v11, "subarrayWithRange:", 0, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "componentsJoinedByString:", CFSTR(" "));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD14A8], "punctuationCharacterSet");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringByTrimmingCharactersInSet:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[RKPersistentPersonalizer headwordsForSynonym:](self, "headwordsForSynonym:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
        break;
      if (!--v13)
        goto LABEL_7;
    }
  }
  else
  {
LABEL_7:
    v18 = 0;
  }

  return v18;
}

- (void)flushDynamicData
{
  -[RKPersistentPersonalizer model](self, "model");
  LMLanguageModelFlushDynamicData();
}

+ (void)removeAllDynamicModelsInDirectory:(id)a3
{
  LMLanguageModelRemoveModelBundlesInDirectory();
}

- (NSURL)dynamicDataURL
{
  return self->_dynamicDataURL;
}

- (void)setDynamicDataURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)languageID
{
  return self->_languageID;
}

- (void)setLanguageID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSLocale)languageLocale
{
  return self->_languageLocale;
}

- (void)setLanguageLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDate)lastObservedDynamicDataCreationDate
{
  return (NSDate *)objc_loadWeakRetained((id *)&self->_lastObservedDynamicDataCreationDate);
}

- (void)setLastObservedDynamicDataCreationDate:(id)a3
{
  objc_storeWeak((id *)&self->_lastObservedDynamicDataCreationDate, a3);
}

- (NSDate)lastDynamicDataCreationCheckDate
{
  return (NSDate *)objc_loadWeakRetained((id *)&self->_lastDynamicDataCreationCheckDate);
}

- (void)setLastDynamicDataCreationCheckDate:(id)a3
{
  objc_storeWeak((id *)&self->_lastDynamicDataCreationCheckDate, a3);
}

- (NSMutableDictionary)synonyms
{
  return self->_synonyms;
}

- (void)setSynonyms:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synonyms, 0);
  objc_destroyWeak((id *)&self->_lastDynamicDataCreationCheckDate);
  objc_destroyWeak((id *)&self->_lastObservedDynamicDataCreationDate);
  objc_storeStrong((id *)&self->_languageLocale, 0);
  objc_storeStrong((id *)&self->_languageID, 0);
  objc_storeStrong((id *)&self->_dynamicDataURL, 0);
  objc_storeStrong((id *)&self->_displayStringsProvider, 0);
}

@end
