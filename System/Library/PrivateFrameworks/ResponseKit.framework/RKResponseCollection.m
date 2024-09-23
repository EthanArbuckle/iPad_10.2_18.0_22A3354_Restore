@implementation RKResponseCollection

- (RKResponseCollection)initWithDynamicDataURL:(id)a3 displayStringsProvider:(id)a4
{
  id v7;
  id v8;
  RKResponseCollection *v9;
  RKResponseCollection *v10;
  uint64_t v11;
  NSMutableDictionary *personalizersByLanguageID;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RKResponseCollection;
  v9 = -[RKResponseCollection init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dynamicDataURL, a3);
    objc_storeStrong((id *)&v10->_displayStringsProvider, a4);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    personalizersByLanguageID = v10->_personalizersByLanguageID;
    v10->_personalizersByLanguageID = (NSMutableDictionary *)v11;

  }
  return v10;
}

- (void)dealloc
{
  NSMutableDictionary *responseCatalog;
  NSMutableDictionary *personalizersByLanguageID;
  objc_super v5;

  -[RKResponseCollection flushDynamicData](self, "flushDynamicData");
  responseCatalog = self->_responseCatalog;
  self->_responseCatalog = 0;

  personalizersByLanguageID = self->_personalizersByLanguageID;
  self->_personalizersByLanguageID = 0;

  v5.receiver = self;
  v5.super_class = (Class)RKResponseCollection;
  -[RKResponseCollection dealloc](&v5, sel_dealloc);
}

- (void)flushDynamicData
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[RKResponseCollection personalizersByLanguageID](self, "personalizersByLanguageID", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
        -[RKResponseCollection personalizersByLanguageID](self, "personalizersByLanguageID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "flushDynamicData");
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (void)resetRegisteredResponses
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[RKResponseCollection personalizersByLanguageID](self, "personalizersByLanguageID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[RKResponseCollection personalizersByLanguageID](self, "personalizersByLanguageID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "dynamicDataURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[RKPersistentPersonalizer removeAllDynamicModelsInDirectory:](RKPersistentPersonalizer, "removeAllDynamicModelsInDirectory:", v8);

  }
  -[RKResponseCollection personalizersByLanguageID](self, "personalizersByLanguageID");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAllObjects");

}

- (id)standardResponsesByCategoryForLanguageIdentifier:(id)a3 andUsage:(id)a4
{
  id v6;
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
  RKResponseCollection *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v42;
  void *v43;
  void *v44;
  uint64_t v45;
  id obj;
  RKResponseCollection *v47;
  _QWORD v48[4];
  id v49;
  uint64_t v50;
  id v51;
  RKResponseCollection *v52;
  id v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEA0], "canonicalLanguageIdentifierFromString:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RKResponseCollection responseCatalog](self, "responseCatalog");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    -[RKResponseCollection responseCatalog](self, "responseCatalog");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[RKResponseCollection setResponseCatalog:](self, "setResponseCatalog:", v12);

    }
    -[RKResponseCollection responseCatalog](self, "responseCatalog");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[RKResponseCollection responseCatalog](self, "responseCatalog");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v7);

    }
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[RKResponseCollection responseCatalog](self, "responseCatalog");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", v7);
    v47 = self;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v17, v6);

    v20 = self;
    -[RKResponseCollection responseCatalog](self, "responseCatalog");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", v7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", v6);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKey:", *MEMORY[0x24BDBCB20]);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = v6;
    v24 = v6;
    -[RKResponseCollection displayStringsProvider](self, "displayStringsProvider");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v7;
    objc_msgSend(v25, "displayStringsForPlatform:languageID:", v24, v7);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v27, "count"))
    {
      for (i = 0; i != 46; ++i)
      {
        RKLinguisticCategoryToPreferenceKey(i);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v29, "isEqualToString:", CFSTR("Unknown"))
          || (objc_msgSend(v44, "isEqualToString:", CFSTR("zh")) & 1) == 0
          && (objc_msgSend(v44, "isEqualToString:", CFSTR("ja")) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "array", v42);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = i;
          objc_msgSend((id)objc_opt_class(), "speechActsForCategory:platform:", i, v24);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = 0u;
          v56 = 0u;
          v57 = 0u;
          v58 = 0u;
          obj = v31;
          v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
          if (v32)
          {
            v33 = v32;
            v34 = *(_QWORD *)v56;
            do
            {
              for (j = 0; j != v33; ++j)
              {
                if (*(_QWORD *)v56 != v34)
                  objc_enumerationMutation(obj);
                v36 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * j);
                objc_msgSend(v27, "objectForKeyedSubscript:", v36);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v48[0] = MEMORY[0x24BDAC760];
                v48[1] = 3221225472;
                v48[2] = __82__RKResponseCollection_standardResponsesByCategoryForLanguageIdentifier_andUsage___block_invoke;
                v48[3] = &unk_24C6AEE18;
                v49 = v24;
                v50 = v36;
                v20 = v47;
                v51 = v29;
                v52 = v47;
                v53 = v26;
                v54 = v30;
                objc_msgSend(v37, "enumerateObjectsUsingBlock:", v48);

              }
              v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
            }
            while (v33);
          }
          if (objc_msgSend(v30, "count"))
            objc_msgSend(v43, "setObject:forKey:", v30, v29);

          i = v45;
        }

      }
    }

    v6 = v42;
    v7 = v26;
    self = v20;
  }
  -[RKResponseCollection responseCatalog](self, "responseCatalog", v42);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "objectForKeyedSubscript:", v7);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "objectForKeyedSubscript:", v6);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  return v40;
}

void __82__RKResponseCollection_standardResponsesByCategoryForLanguageIdentifier_andUsage___block_invoke(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  int v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  void *v16;
  _RKResponse *v17;
  id v18;

  v18 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("iOS"))
    && (v7 = objc_msgSend(*(id *)(a1 + 40), "hasPrefix:", CFSTR("YesNo")), a3 >= 2)
    && v7
    || objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("iOS"))
    && objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("Acknowledgment"))
    && (v8 = objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", CFSTR("Unknown")), a3)
    && v8)
  {
    *a4 = 1;
  }
  else
  {
    +[RKUtilities normalizeForPersonalization:](RKUtilities, "normalizeForPersonalization:", v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("iOS")))
      goto LABEL_14;
    objc_msgSend(*(id *)(a1 + 56), "personalizerForLanguageID:", *(_QWORD *)(a1 + 64));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "headwordsForSynonym:", v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "containsObject:", v9);

    if (v13)
    {
      v14 = v9;
    }
    else
    {
      objc_msgSend(v11, "allKeys");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
      v14 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (!v14)
LABEL_14:
      v14 = v18;
    v16 = *(void **)(a1 + 72);
    v17 = -[_RKResponse initWithSpeechAct:headword:text:]([_RKResponse alloc], "initWithSpeechAct:headword:text:", *(_QWORD *)(a1 + 40), v14, v18);
    objc_msgSend(v16, "addObject:", v17);

  }
}

- (id)cannedResponsesForCategory:(id)a3 withLanguage:(id)a4 options:(unint64_t)a5
{
  __int16 v5;
  id v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v5 = a5;
  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = CFSTR("watchOS");
  if ((v5 & 0x100) == 0)
    v9 = CFSTR("iOS");
  v10 = v9;
  -[RKResponseCollection standardResponsesByCategoryForLanguageIdentifier:andUsage:](self, "standardResponsesByCategoryForLanguageIdentifier:andUsage:", a4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = v12;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v19, "type", (_QWORD)v22) != 4)
        {
          objc_msgSend(v19, "text");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v20);

        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v16);
  }

  return v13;
}

- (id)responsesForCategory:(unint64_t)a3 gender:(unint64_t)a4 maximumResponses:(unint64_t)a5 withLanguage:(id)a6 context:(id)a7 options:(unint64_t)a8
{
  __int16 v8;
  id v12;
  id v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  __CFString *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  id v51;
  id v52;
  void *v53;
  __CFString *v55;
  void *v56;
  _QWORD v58[4];
  __CFString *v59;
  id v60;
  unint64_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD v66[4];
  id v67;
  id v68;
  id v69;
  id v70;
  _BYTE v71[128];
  uint64_t v72;

  v8 = a8;
  v72 = *MEMORY[0x24BDAC8D0];
  v12 = a6;
  v13 = a7;
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "languageCode");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = CFSTR("watchOS");
  if ((v8 & 0x100) == 0)
    v15 = CFSTR("iOS");
  v16 = v15;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  RKLinguisticCategoryToPreferenceKey(a3);
  v18 = objc_claimAutoreleasedReturnValue();
  -[RKResponseCollection standardResponsesByCategoryForLanguageIdentifier:andUsage:](self, "standardResponsesByCategoryForLanguageIdentifier:andUsage:", v12, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = (void *)v18;
  objc_msgSend(v19, "objectForKeyedSubscript:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "mutableCopy");

  v55 = v16;
  if ((v8 & 8) == 0 && (-[__CFString isEqualToString:](v16, "isEqualToString:", CFSTR("watchOS")) & 1) == 0)
  {
    -[RKResponseCollection personalizerForLanguageID:](self, "personalizerForLanguageID:", v12);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v66[0] = MEMORY[0x24BDAC760];
    v66[1] = 3221225472;
    v66[2] = __98__RKResponseCollection_responsesForCategory_gender_maximumResponses_withLanguage_context_options___block_invoke;
    v66[3] = &unk_24C6AEEB0;
    v67 = v22;
    v68 = v13;
    v24 = v23;
    v69 = v24;
    v70 = v56;
    v25 = v22;
    objc_msgSend(v21, "enumerateObjectsUsingBlock:", v66);
    v26 = v24;

    v21 = v26;
  }
  if (a5 != 0x7FFFFFFF)
  {
    v51 = v13;
    v52 = v12;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v21, "count"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v28 = v21;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
    if (v29)
    {
      v30 = v29;
      v31 = 0;
      v32 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v63 != v32)
            objc_enumerationMutation(v28);
          v34 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
          v35 = objc_msgSend(v34, "type") == 4;
          if ((v35 & v31) == 1)
          {
            objc_msgSend(v27, "addObject:", v34);
            v31 = 1;
          }
          else
          {
            v31 |= v35;
          }
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
      }
      while (v30);
    }

    objc_msgSend(v28, "removeObjectsInArray:", v27);
    v13 = v51;
    v12 = v52;
  }
  if ((v8 & 2) != 0)
  {
    if ((v8 & 4) != 0)
      goto LABEL_20;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("type == %ul"), 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "filteredArrayUsingPredicate:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObjectsFromArray:", v44);

    if ((v8 & 4) != 0)
    {
LABEL_20:
      if ((v8 & 0x10) != 0)
        goto LABEL_22;
      goto LABEL_21;
    }
  }
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("type == %ul"), 2);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "filteredArrayUsingPredicate:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObjectsFromArray:", v46);

  if ((v8 & 0x10) == 0)
  {
LABEL_21:
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("type == %ul"), 4);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "filteredArrayUsingPredicate:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObjectsFromArray:", v37);

  }
LABEL_22:
  if (responsesForCategory_gender_maximumResponses_withLanguage_context_options__onceToken != -1)
    dispatch_once(&responsesForCategory_gender_maximumResponses_withLanguage_context_options__onceToken, &__block_literal_global_77);
  objc_msgSend(v17, "sortUsingComparator:", &__block_literal_global_79);
  if (objc_msgSend(v17, "count") > a5)
  {
    objc_msgSend(v17, "subarrayWithRange:", 0, a5);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "mutableCopy");

    v17 = (void *)v39;
  }
  objc_msgSend(v17, "sortUsingComparator:", &__block_literal_global_80);
  objc_msgSend(v17, "valueForKeyPath:", CFSTR("@unionOfObjects.text"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)objc_msgSend(v40, "mutableCopy");

  if (a4 > 7)
    v42 = 0;
  else
    v42 = off_24C6AF038[a4];
  v58[0] = MEMORY[0x24BDAC760];
  v58[1] = 3221225472;
  v58[2] = __98__RKResponseCollection_responsesForCategory_gender_maximumResponses_withLanguage_context_options___block_invoke_8;
  v58[3] = &unk_24C6AEF58;
  v61 = a4;
  v59 = v42;
  v47 = v41;
  v60 = v47;
  objc_msgSend(v47, "enumerateObjectsUsingBlock:", v58);
  v48 = v60;
  v49 = v47;

  return v49;
}

void __98__RKResponseCollection_responsesForCategory_gender_maximumResponses_withLanguage_context_options___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _RKResponse *v21;
  void *v22;
  void *v23;
  _RKResponse *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;

  v25 = a2;
  objc_msgSend(v25, "headword");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = v25;
  if (v3)
  {
    v5 = (void *)MEMORY[0x24BDBCEB8];
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v25, "speechAct");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "headword");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "topSynonymsForSpeechAct:headword:recipientContext:maxCount:", v7, v8, *(_QWORD *)(a1 + 40), 20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v10, "count"))
    {
      objc_msgSend(v25, "headword");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v11);

    }
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __98__RKResponseCollection_responsesForCategory_gender_maximumResponses_withLanguage_context_options___block_invoke_2;
    v26[3] = &unk_24C6AEE68;
    v27 = *(id *)(a1 + 48);
    v12 = v10;
    v28 = v12;
    objc_msgSend(v12, "enumerateObjectsWithOptions:usingBlock:", 2, v26);
    if (objc_msgSend(v12, "count"))
    {
      if (_block_invoke_onceToken != -1)
        dispatch_once(&_block_invoke_onceToken, &__block_literal_global_72);
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lowercaseString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)_block_invoke_contractedResponseMap, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 56));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend((id)_block_invoke_contractedResponseMap, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 56));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", v15);
        v19 = objc_claimAutoreleasedReturnValue();

        v13 = (void *)v19;
      }
      v20 = *(void **)(a1 + 48);
      v21 = [_RKResponse alloc];
      objc_msgSend(v25, "speechAct");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "headword");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[_RKResponse initWithSpeechAct:headword:text:](v21, "initWithSpeechAct:headword:text:", v22, v23, v13);
      objc_msgSend(v20, "addObject:", v24);

    }
    v4 = v25;
  }

}

void __98__RKResponseCollection_responsesForCategory_gender_maximumResponses_withLanguage_context_options___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;

  +[RKUtilities normalizeForPersonalization:](RKUtilities, "normalizeForPersonalization:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __98__RKResponseCollection_responsesForCategory_gender_maximumResponses_withLanguage_context_options___block_invoke_3;
  v8[3] = &unk_24C6AEE40;
  v9 = v5;
  v6 = *(void **)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v11 = a3;
  v7 = v5;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

}

void __98__RKResponseCollection_responsesForCategory_gender_maximumResponses_withLanguage_context_options___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v6 = *(void **)(a1 + 32);
  objc_msgSend(a2, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[RKUtilities normalizeForPersonalization:](RKUtilities, "normalizeForPersonalization:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  if (!v9)
  {
    objc_msgSend(*(id *)(a1 + 40), "removeObjectAtIndex:", *(_QWORD *)(a1 + 48));
    *a4 = 1;
  }
}

void __98__RKResponseCollection_responsesForCategory_gender_maximumResponses_withLanguage_context_options___block_invoke_4()
{
  uint64_t v0;
  void *v1;

  +[RKAssets contractedResponses](RKAssets, "contractedResponses");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_block_invoke_contractedResponseMap;
  _block_invoke_contractedResponseMap = v0;

}

void __98__RKResponseCollection_responsesForCategory_gender_maximumResponses_withLanguage_context_options___block_invoke_5()
{
  uint64_t i;

  for (i = 0; i != 5; ++i)
    responsesForCategory_gender_maximumResponses_withLanguage_context_options__typePriorities[kTypePriorityOrder[i]] = i;
}

uint64_t __98__RKResponseCollection_responsesForCategory_gender_maximumResponses_withLanguage_context_options___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  int v6;
  uint64_t v7;
  int v8;

  v4 = a2;
  v5 = a3;
  v6 = responsesForCategory_gender_maximumResponses_withLanguage_context_options__typePriorities[objc_msgSend(v4, "type")];
  if (v6 >= responsesForCategory_gender_maximumResponses_withLanguage_context_options__typePriorities[objc_msgSend(v5, "type")])
  {
    v8 = responsesForCategory_gender_maximumResponses_withLanguage_context_options__typePriorities[objc_msgSend(v4, "type")];
    v7 = v8 > responsesForCategory_gender_maximumResponses_withLanguage_context_options__typePriorities[objc_msgSend(v5, "type")];
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

uint64_t __98__RKResponseCollection_responsesForCategory_gender_maximumResponses_withLanguage_context_options___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "type");
  if (v6 >= objc_msgSend(v5, "type"))
  {
    v8 = objc_msgSend(v4, "type");
    v7 = v8 > objc_msgSend(v5, "type");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

void __98__RKResponseCollection_responsesForCategory_gender_maximumResponses_withLanguage_context_options___block_invoke_8(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = v5;
  if (*(_QWORD *)(a1 + 48))
  {
    v13 = v5;
    objc_msgSend(v5, "rangeOfString:", CFSTR("{"));
    if (v7)
    {
      objc_msgSend(v13, "componentsSeparatedByString:", CFSTR("/"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("SELF ENDSWITH %@"), *(_QWORD *)(a1 + 32));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "filteredArrayUsingPredicate:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", *(_QWORD *)(a1 + 32), &stru_24C6B9E08);
      v12 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v12;
    }
    else
    {
      v6 = v13;
    }
  }
  v14 = v6;
  objc_msgSend(*(id *)(a1 + 40), "setObject:atIndexedSubscript:", v6, a3);

}

+ (id)responsesForFixedPhrase:(id)a3 withLanguage:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v5 = a3;
  v6 = a4;
  if (responsesForFixedPhrase_withLanguage__onceToken != -1)
    dispatch_once(&responsesForFixedPhrase_withLanguage__onceToken, &__block_literal_global_103);
  +[RKUtilities canonicalLanguageAndScriptCodeIdentifierForIdentifier:](RKUtilities, "canonicalLanguageAndScriptCodeIdentifierForIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)responsesForFixedPhrase_withLanguage__sPhraseMap, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)responsesForFixedPhrase_withLanguage__sPhraseMap, "setObject:forKeyedSubscript:", v9, v7);

    +[RKAssets fixedPhrases](RKAssets, "fixedPhrases");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __61__RKResponseCollection_responsesForFixedPhrase_withLanguage___block_invoke_2;
    v16[3] = &unk_24C6AEFA0;
    v17 = v7;
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v16);

  }
  +[RKUtilities normalizeForPersonalization:](RKUtilities, "normalizeForPersonalization:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)responsesForFixedPhrase_withLanguage__sPhraseMap, "objectForKeyedSubscript:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __61__RKResponseCollection_responsesForFixedPhrase_withLanguage___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)responsesForFixedPhrase_withLanguage__sPhraseMap;
  responsesForFixedPhrase_withLanguage__sPhraseMap = v0;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("SELF != ''"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)responsesForFixedPhrase_withLanguage__sNonEmptyStringsPredicate;
  responsesForFixedPhrase_withLanguage__sNonEmptyStringsPredicate = v2;

}

void __61__RKResponseCollection_responsesForFixedPhrase_withLanguage___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v3;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v16 = v6;
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("/"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        v13 = objc_msgSend(v7, "length");
        if (v13)
        {
          objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("/"));
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v3;
        }
        else
        {
          v14 = (void *)MEMORY[0x24BDBD1A8];
        }
        objc_msgSend((id)responsesForFixedPhrase_withLanguage__sPhraseMap, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v12);

        if (v13)
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

}

+ (id)responsesForFullScreenMoments:(id)a3
{
  void *v3;
  id v4;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  id v20;
  void *v22;
  void *v23;
  void *v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD14A8];
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RKAssets momentsPhrases](RKAssets, "momentsPhrases");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[RKUtilities normalizeForPersonalization:](RKUtilities, "normalizeForPersonalization:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "componentsSeparatedByCharactersInSet:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", &stru_24C6B9E08);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[RKUtilities removeEmoji:](RKUtilities, "removeEmoji:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByTrimmingCharactersInSet:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v23 = v12;
    v24 = v5;
    v14 = (void *)objc_opt_new();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v22 = v13;
    obj = v13;
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v27 != v17)
            objc_enumerationMutation(obj);
          v19 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          v20 = objc_alloc_init(MEMORY[0x24BDBCED8]);
          objc_msgSend(v20, "setObject:forKeyedSubscript:", CFSTR("moment"), CFSTR("type"));
          objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, CFSTR("subtype"));
          objc_msgSend(v14, "addObject:", v20);

        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v16);
    }

    v5 = v24;
    v13 = v22;
    v12 = v23;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)registerResponse:(id)a3 forMessage:(id)a4 withLanguage:(id)a5 context:(id)a6 effectiveDate:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;

  v34 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if ((unint64_t)objc_msgSend(v12, "length") <= 0x800)
  {
    +[RKMessageClassifier messageClassification:withLanguageIdentifier:](RKMessageClassifier, "messageClassification:withLanguageIdentifier:", v12, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEA0], "canonicalLanguageIdentifierFromString:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "language");
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = (void *)v18;
      objc_msgSend(v16, "language");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("und"));

      if ((v21 & 1) == 0)
      {
        objc_msgSend(v16, "language");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        +[RKUtilities canonicalLanguageAndScriptCodeIdentifierForIdentifier:](RKUtilities, "canonicalLanguageAndScriptCodeIdentifierForIdentifier:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        +[RKUtilities canonicalLanguageAndScriptCodeIdentifierForIdentifier:](RKUtilities, "canonicalLanguageAndScriptCodeIdentifierForIdentifier:", v13);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v23, "isEqualToString:", v24) & 1) == 0)
        {
          objc_msgSend(v16, "language");
          v25 = objc_claimAutoreleasedReturnValue();

          v17 = (void *)v25;
        }

      }
    }
    if (v17
      && +[RKSentenceClassifier canClassifyLanguageIdentifier:](RKSentenceClassifier, "canClassifyLanguageIdentifier:", v17))
    {
      -[RKResponseCollection personalizerForLanguageID:](self, "personalizerForLanguageID:", v17);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "headwordsForSynonym:", v34);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v27, "count"))
      {
        objc_msgSend(v26, "headwordsForSynonymPrefix:", v34);
        v28 = objc_claimAutoreleasedReturnValue();

        v27 = (void *)v28;
      }
      if (objc_msgSend(v27, "count"))
      {
        -[RKResponseCollection displayStringsProvider](self, "displayStringsProvider");
        v33 = v26;
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "displayStringsForPlatform:languageID:", CFSTR("watchOS"), v17);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend((id)objc_opt_class(), "speechActsForCategory:platform:", objc_msgSend(v16, "sentenceType"), CFSTR("watchOS"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v35[0] = MEMORY[0x24BDAC760];
        v35[1] = 3221225472;
        v35[2] = __87__RKResponseCollection_registerResponse_forMessage_withLanguage_context_effectiveDate___block_invoke;
        v35[3] = &unk_24C6AF018;
        v36 = v30;
        v37 = v27;
        v38 = v33;
        v39 = v14;
        v40 = v15;
        v32 = v30;
        objc_msgSend(v31, "enumerateObjectsUsingBlock:", v35);

        v26 = v33;
      }

    }
  }

}

void __87__RKResponseCollection_registerResponse_forMessage_withLanguage_context_effectiveDate___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __87__RKResponseCollection_registerResponse_forMessage_withLanguage_context_effectiveDate___block_invoke_2;
  v11[3] = &unk_24C6AEFF0;
  v12 = v7;
  v8 = *(void **)(a1 + 40);
  v13 = *(id *)(a1 + 48);
  v14 = v6;
  v15 = *(id *)(a1 + 56);
  v16 = *(id *)(a1 + 64);
  v17 = a4;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v11);

}

void __87__RKResponseCollection_registerResponse_forMessage_withLanguage_context_effectiveDate___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;

  v7 = a3;
  +[RKUtilities normalizeForPersonalization:](RKUtilities, "normalizeForPersonalization:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __87__RKResponseCollection_registerResponse_forMessage_withLanguage_context_effectiveDate___block_invoke_3;
  v12[3] = &unk_24C6AEFC8;
  v13 = v8;
  v9 = *(void **)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  v15 = *(id *)(a1 + 48);
  v16 = v7;
  v17 = *(id *)(a1 + 56);
  v18 = *(id *)(a1 + 64);
  v19 = a4;
  v20 = *(_QWORD *)(a1 + 72);
  v10 = v7;
  v11 = v8;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);

}

void __87__RKResponseCollection_registerResponse_forMessage_withLanguage_context_effectiveDate___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  _BYTE *v6;
  id v7;

  +[RKUtilities normalizeForPersonalization:](RKUtilities, "normalizeForPersonalization:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:"))
  {
    objc_msgSend(*(id *)(a1 + 40), "trainSynonymForSpeechAct:headword:userResponse:recipientContext:weight:effectiveDate:", *(_QWORD *)(a1 + 48), v7, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), 1, *(_QWORD *)(a1 + 72));
    *a4 = 1;
    v6 = *(_BYTE **)(a1 + 88);
    **(_BYTE **)(a1 + 80) = 1;
    *v6 = 1;
  }

}

- (id)personalizerForLanguageID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  RKPersistentPersonalizer *v8;
  void *v9;
  void *v10;
  RKPersistentPersonalizer *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  +[RKUtilities canonicalLanguageAndScriptCodeIdentifierForIdentifier:](RKUtilities, "canonicalLanguageAndScriptCodeIdentifierForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RKResponseCollection personalizersByLanguageID](self, "personalizersByLanguageID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = [RKPersistentPersonalizer alloc];
    -[RKResponseCollection dynamicDataURL](self, "dynamicDataURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RKResponseCollection displayStringsProvider](self, "displayStringsProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[RKPersistentPersonalizer initWithLanguageIdentifier:andDynamicDataURL:displayStringsProvider:](v8, "initWithLanguageIdentifier:andDynamicDataURL:displayStringsProvider:", v4, v9, v10);
    -[RKResponseCollection personalizersByLanguageID](self, "personalizersByLanguageID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v5);

  }
  -[RKResponseCollection personalizersByLanguageID](self, "personalizersByLanguageID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)speechActsForCategory:(unint64_t)a3 platform:(id)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = speechActsForCategory_platform__onceToken;
  v6 = a4;
  if (v5 != -1)
    dispatch_once(&speechActsForCategory_platform__onceToken, &__block_literal_global_120);
  RKLinguisticCategoryToPreferenceKey(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)speechActsForCategory_platform__sSpeechActsByPlatformByCategory, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __55__RKResponseCollection_speechActsForCategory_platform___block_invoke()
{
  void *v0;

  v0 = (void *)speechActsForCategory_platform__sSpeechActsByPlatformByCategory;
  speechActsForCategory_platform__sSpeechActsByPlatformByCategory = (uint64_t)&unk_24C719478;

}

- (NSMutableDictionary)responseCatalog
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setResponseCatalog:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableDictionary)personalizersByLanguageID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPersonalizersByLanguageID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSURL)dynamicDataURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (RKDisplayStringsProvider)displayStringsProvider
{
  return (RKDisplayStringsProvider *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayStringsProvider, 0);
  objc_storeStrong((id *)&self->_dynamicDataURL, 0);
  objc_storeStrong((id *)&self->_personalizersByLanguageID, 0);
  objc_storeStrong((id *)&self->_responseCatalog, 0);
}

@end
