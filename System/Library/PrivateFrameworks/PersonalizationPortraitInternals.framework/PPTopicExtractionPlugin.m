@implementation PPTopicExtractionPlugin

- (PPTopicExtractionPlugin)initWithTopicDissector:(id)a3
{
  id v5;
  PPTopicExtractionPlugin *v6;
  PPTopicExtractionPlugin *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PPTopicExtractionPlugin;
  v6 = -[PPTopicExtractionPlugin init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dissector, a3);

  return v7;
}

- (PPTopicExtractionPlugin)init
{
  void *v3;
  PPTopicExtractionPlugin *v4;

  +[PPTopicDissector sharedInstance](PPTopicDissector, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PPTopicExtractionPlugin initWithTopicDissector:](self, "initWithTopicDissector:", v3);

  return v4;
}

- (id)_topicContainersForText:(id)a3 isPlainText:(BOOL)a4 bundleId:(id)a5 groupId:(id)a6 documentId:(id)a7 contactHandles:(id)a8 weight:(double)a9 isOutgoing:(BOOL)a10
{
  id v15;
  __objc2_class *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v39;
  _BOOL4 v41;

  v41 = a4;
  v15 = a3;
  v16 = PPConfiguration;
  v17 = a8;
  v39 = a7;
  v18 = a6;
  v19 = a5;
  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a7) = objc_msgSend(v20, "isMultilingual");

  if ((a7 & 1) != 0)
  {
    v21 = (void *)MEMORY[0x1E0D70A90];
    objc_msgSend(MEMORY[0x1E0D70D00], "preferredLanguages");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "detectLanguageFromTextHeuristicallyWithLanguages:languages:defaultLanguage:", v15, v22, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (void *)MEMORY[0x1E0C99DC8];
    if (v23)
    {
      v25 = 0;
      v26 = v23;
      goto LABEL_6;
    }
  }
  else
  {
    v24 = (void *)MEMORY[0x1E0C99DC8];
  }
  objc_msgSend(v24, "currentLocale");
  v16 = (__objc2_class *)objc_claimAutoreleasedReturnValue();
  -[__objc2_class languageCode](v16, "languageCode");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v25 = 1;
LABEL_6:
  objc_msgSend(v24, "componentsFromLocaleIdentifier:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:", *MEMORY[0x1E0C997E8]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {

  }
  if (a9 == 1.79769313e308)
    a9 = 1.0;
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C80]), "initWithDwellTimeSeconds:lengthSeconds:lengthCharacters:donationCount:contactHandleCount:flags:", 0, 0, objc_msgSend(v15, "length"), 0, (unsigned __int16)objc_msgSend(v17, "count"), a10);
  v30 = objc_alloc(MEMORY[0x1E0D70C78]);
  v31 = (void *)objc_opt_new();
  v32 = (void *)objc_msgSend(v30, "initWithBundleId:groupId:documentId:date:relevanceDate:contactHandles:language:metadata:", v19, v18, v39, v31, 0, v17, v28, v29);

  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "extractionAlgorithmsForBundleId:sourceLanguage:conservative:domain:", v19, v28, 0, 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "extractionAlgorithmsForBundleId:sourceLanguage:conservative:domain:", v19, v28, 0, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  -[PPTopicDissector topicsInText:isPlainText:source:cloudSync:language:topicAlgorithms:namedEntityAlgorithms:weight:](self->_dissector, "topicsInText:isPlainText:source:cloudSync:language:topicAlgorithms:namedEntityAlgorithms:weight:", v15, v41, v32, 1, v28, v34, a9, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  return v37;
}

- (id)extractionsFromText:(id)a3 bundleId:(id)a4
{
  void *v4;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v44 = a4;
  v8 = (void *)objc_opt_new();
  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isMultilingual");

  v45 = v7;
  if ((v10 & 1) != 0)
  {
    v11 = (void *)MEMORY[0x1E0D70A90];
    objc_msgSend(MEMORY[0x1E0D70D00], "preferredLanguages");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "detectLanguageFromTextHeuristicallyWithLanguages:languages:defaultLanguage:", v7, v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0C99DC8];
    if (v13)
    {
      v15 = 0;
      v16 = v13;
      goto LABEL_6;
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0C99DC8];
  }
  objc_msgSend(v14, "currentLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "languageCode");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v15 = 1;
LABEL_6:
  objc_msgSend(v14, "componentsFromLocaleIdentifier:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0C997E8]);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {

  }
  v18 = objc_alloc(MEMORY[0x1E0D70C78]);
  v19 = (void *)objc_opt_new();
  objc_msgSend(v19, "UUIDString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v18, "initWithBundleId:groupId:documentId:date:relevanceDate:contactHandles:language:metadata:", v44, 0, v20, v21, 0, 0, v43, 0);

  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "extractionAlgorithmsForBundleId:sourceLanguage:conservative:domain:", v44, v43, 0, 0);
  v24 = objc_claimAutoreleasedReturnValue();

  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "extractionAlgorithmsForBundleId:sourceLanguage:conservative:domain:", v44, v43, 0, 1);
  v26 = objc_claimAutoreleasedReturnValue();

  v40 = (void *)v26;
  v41 = (void *)v24;
  v42 = (void *)v22;
  -[PPTopicDissector topicsInText:isPlainText:source:cloudSync:language:topicAlgorithms:namedEntityAlgorithms:weight:](self->_dissector, "topicsInText:isPlainText:source:cloudSync:language:topicAlgorithms:namedEntityAlgorithms:weight:", v45, 1, v22, 0, v43, v24, 1.0, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v47;
    do
    {
      v31 = 0;
      v32 = v8;
      do
      {
        if (*(_QWORD *)v47 != v30)
          objc_enumerationMutation(v27);
        v33 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v31);
        objc_msgSend(v33, "topics");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (v34)
        {
          objc_msgSend(v33, "topics");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "source");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          +[PPLocalTopicStore recordsForTopics:source:algorithm:](PPLocalTopicStore, "recordsForTopics:source:algorithm:", v35, v36, objc_msgSend(v33, "topicAlgorithm"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v37 = 0;
        }

        v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70B50]), "initWithNamedEntityRecords:topicRecords:", 0, v37);
        objc_msgSend(v32, "merge:", v38);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        ++v31;
        v32 = v8;
      }
      while (v29 != v31);
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    }
    while (v29);
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dissector, 0);
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken4_11908 != -1)
    dispatch_once(&sharedInstance__pasOnceToken4_11908, &__block_literal_global_11909);
  return (id)sharedInstance__pasExprOnceResult_11910;
}

void __41__PPTopicExtractionPlugin_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_11910;
  sharedInstance__pasExprOnceResult_11910 = v1;

  objc_autoreleasePoolPop(v0);
}

@end
