@implementation SDPommesSynonyms

- (SDPommesSynonyms)init
{
  SDPommesSynonyms *v2;
  SDPommesSynonyms *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SDPommesSynonyms;
  v2 = -[SDPommesSynonyms init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SDPommesSynonyms loadFirstPassSynonymDictionary](v2, "loadFirstPassSynonymDictionary");
    -[SDPommesSynonyms loadSecondPassSynonymDictionary](v3, "loadSecondPassSynonymDictionary");
    -[SDPommesSynonyms loadDateSynonymDictionary](v3, "loadDateSynonymDictionary");
  }
  return v3;
}

- (id)getFirstPassSynonymsForWord:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->firstPassSynonymDictionary, "objectForKeyedSubscript:", a3);
}

- (id)getSecondPassSynonymsForWord:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->secondPassSynonymDictionary, "objectForKeyedSubscript:", a3);
}

- (id)getDateSynonymsForWord:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->dateSynonymDictionary, "objectForKeyedSubscript:", a3);
}

- (id)_cleanWord:(id)a3 unacceptableCharSet:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length") && objc_msgSend(v5, "rangeOfCharacterFromSet:", v6) == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v5, "localizedLowercaseString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_loadSynonymsFromFile:(id)a3 isFirstPass:(BOOL)a4 isDate:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v10;
  NSDictionary *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  NSDictionary **p_firstPassSynonymDictionary;
  NSDictionary *v34;
  NSDictionary *v35;
  NSDictionary *v36;
  NSObject *v37;
  _BOOL4 v39;
  _BOOL4 v40;
  void *v41;
  uint64_t v42;
  void *v43;
  NSDictionary *v44;
  uint64_t v45;
  id obj;
  NSObject *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  _BYTE v53[128];
  uint64_t v54;

  v7 = a5;
  v8 = a4;
  v54 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  v52 = 4;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithContentsOfFile:usedEncoding:error:", v10, &v52, a6);
  v13 = v12;
  if (*a6)
  {
    logForCSLogCategoryDefault();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      -[SDPommesSynonyms _loadSynonymsFromFile:isFirstPass:isDate:error:].cold.3();
LABEL_4:
    v14 = 0;
    goto LABEL_35;
  }
  if (!objc_msgSend(v12, "length"))
  {
    logForCSLogCategoryDefault();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      -[SDPommesSynonyms _loadSynonymsFromFile:isFirstPass:isDate:error:].cold.1();
    goto LABEL_4;
  }
  v39 = v7;
  v40 = v8;
  v42 = (uint64_t)v10;
  v47 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR(","));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v13;
  objc_msgSend(v13, "componentsSeparatedByCharactersInSet:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v17;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v49;
    v43 = v15;
    v44 = v11;
    do
    {
      v21 = 0;
      v45 = v19;
      do
      {
        if (*(_QWORD *)v49 != v20)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v21);
        v23 = (void *)MEMORY[0x2199C2D78]();
        objc_msgSend(v22, "componentsSeparatedByCharactersInSet:", v15);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v24, "count") >= 2)
        {
          objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[SDPommesSynonyms _cleanWord:unacceptableCharSet:](self, "_cleanWord:unacceptableCharSet:", v25, v47);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v26, "length"))
          {
            -[NSDictionary objectForKey:](v11, "objectForKey:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "count");

            if (!v28)
            {
              v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v24, "count") - 1);
              if ((unint64_t)objc_msgSend(v24, "count") >= 2)
              {
                v30 = 1;
                do
                {
                  objc_msgSend(v24, "objectAtIndexedSubscript:", v30);
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SDPommesSynonyms _cleanWord:unacceptableCharSet:](self, "_cleanWord:unacceptableCharSet:", v31, v47);
                  v32 = (void *)objc_claimAutoreleasedReturnValue();

                  if (objc_msgSend(v32, "length"))
                    objc_msgSend(v29, "addObject:", v32);

                  ++v30;
                }
                while (v30 < objc_msgSend(v24, "count"));
              }
              v11 = v44;
              if (objc_msgSend(v29, "count"))
                -[NSDictionary setValue:forKey:](v44, "setValue:forKey:", v29, v26);

              v15 = v43;
            }
          }

          v19 = v45;
        }

        objc_autoreleasePoolPop(v23);
        ++v21;
      }
      while (v21 != v19);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v19);
  }

  if (v40)
  {
    p_firstPassSynonymDictionary = &self->firstPassSynonymDictionary;
    v34 = v11;
  }
  else
  {
    v35 = v11;
    if (v39)
      p_firstPassSynonymDictionary = &self->dateSynonymDictionary;
    else
      p_firstPassSynonymDictionary = &self->secondPassSynonymDictionary;
  }
  v13 = v41;
  v10 = (id)v42;
  v36 = *p_firstPassSynonymDictionary;
  *p_firstPassSynonymDictionary = v11;

  logForCSLogCategoryDefault();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    -[SDPommesSynonyms _loadSynonymsFromFile:isFirstPass:isDate:error:].cold.2(v11, v42, v37);

  v14 = 1;
LABEL_35:

  return v14;
}

- (void)loadFirstPassSynonymDictionary
{
  OUTLINED_FUNCTION_1_1(&dword_213CF1000, a1, a3, "[POMMES] [first pass] Synonym vocab dictionary is not loaded.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4_1();
}

- (void)loadSecondPassSynonymDictionary
{
  OUTLINED_FUNCTION_1_1(&dword_213CF1000, a1, a3, "[POMMES] [second pass] Synonym vocab dictionary is not loaded.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4_1();
}

- (void)loadDateSynonymDictionary
{
  OUTLINED_FUNCTION_1_1(&dword_213CF1000, a1, a3, "[POMMES] [second pass] [date] Synonym vocab dictionary is not loaded.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4_1();
}

- (id)generateDateSynonymsFromToken:(id)a3 previousToken:(id)a4 isOrdinalToken:(BOOL *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;

  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (generateDateSynonymsFromToken_previousToken_isOrdinalToken__onceToken != -1)
    dispatch_once(&generateDateSynonymsFromToken_previousToken_isOrdinalToken__onceToken, &__block_literal_global_4);
  -[SDPommesSynonyms getDateSynonymsForWord:](self, "getDateSynonymsForWord:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v10, "addObjectsFromArray:", v11);
  v12 = objc_msgSend((id)generateDateSynonymsFromToken_previousToken_isOrdinalToken__ordinalIndicators, "containsObject:", v8);
  if (v9 && v12)
  {
    *a5 = 1;
    objc_msgSend(v10, "addObject:", v9);
  }

  return v10;
}

void __79__SDPommesSynonyms_generateDateSynonymsFromToken_previousToken_isOrdinalToken___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("st"), CFSTR("nd"), CFSTR("rd"), CFSTR("th"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)generateDateSynonymsFromToken_previousToken_isOrdinalToken__ordinalIndicators;
  generateDateSynonymsFromToken_previousToken_isOrdinalToken__ordinalIndicators = v0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->dateSynonymDictionary, 0);
  objc_storeStrong((id *)&self->secondPassSynonymDictionary, 0);
  objc_storeStrong((id *)&self->firstPassSynonymDictionary, 0);
}

- (void)_loadSynonymsFromFile:isFirstPass:isDate:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_213CF1000, v0, v1, "Empty synonym file: %@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_loadSynonymsFromFile:(NSObject *)a3 isFirstPass:isDate:error:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_2_1();
  v7 = 2112;
  v8 = a2;
  OUTLINED_FUNCTION_17(&dword_213CF1000, a3, v5, "Loaded %lu synonyms from file: %@.", v6);
}

- (void)_loadSynonymsFromFile:isFirstPass:isDate:error:.cold.3()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_1();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_17(&dword_213CF1000, v1, (uint64_t)v1, "Failed to read synonym file: %@ with error: %@.", v2);
  OUTLINED_FUNCTION_1();
}

@end
