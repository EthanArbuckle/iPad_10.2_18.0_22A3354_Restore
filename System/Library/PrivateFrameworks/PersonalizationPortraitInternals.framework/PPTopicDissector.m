@implementation PPTopicDissector

- (PPTopicDissector)initWithContextClient:(id)a3
{
  id v5;
  PPTopicDissector *v6;
  PPTopicDissector *v7;
  uint64_t v8;
  PPTextToTopicTransform *transform;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PPTopicDissector;
  v6 = -[PPTopicDissector init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contextClient, a3);
    +[PPTextToTopicTransform sharedInstance](PPTextToTopicTransform, "sharedInstance");
    v8 = objc_claimAutoreleasedReturnValue();
    transform = v7->_transform;
    v7->_transform = (PPTextToTopicTransform *)v8;

  }
  return v7;
}

- (PPTopicDissector)init
{
  id v4;
  PPTopicDissector *v5;
  void *v7;

  if (init__pasOnceToken2 != -1)
    dispatch_once(&init__pasOnceToken2, &__block_literal_global_2621);
  v4 = (id)init__pasExprOnceResult;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPTopicDissector.m"), 70, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contextClient"));

  }
  v5 = -[PPTopicDissector initWithContextClient:](self, "initWithContextClient:", v4);

  return v5;
}

- (id)extractionsFromContextKitWithText:(id)a3 isPlainText:(BOOL)a4 bundleId:(id)a5 language:(id)a6 weight:(double)a7
{
  _BOOL4 v10;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  dispatch_semaphore_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  NSObject *v33;
  id v34;
  _QWORD v36[5];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  NSObject *v47;
  double v48;
  BOOL v49;

  v10 = a4;
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = (void *)-[CKContextClient newRequest](self->_contextClient, "newRequest");
  objc_msgSend(v15, "setText:", v12);
  v16 = (void *)MEMORY[0x1E0C99DC8];
  v17 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    a5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a5, "languageCode");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v16, "componentsFromLocaleIdentifier:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0C997E8]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setLanguageTag:", v19);

  if (!v14)
  {

  }
  objc_msgSend(v15, "setTextIsRaw:", !v10);
  v20 = dispatch_semaphore_create(0);
  v21 = objc_opt_new();
  *(_BYTE *)(v21 + 8) = 0;
  v22 = objc_opt_new();
  v23 = *(void **)(v21 + 16);
  *(_QWORD *)(v21 + 16) = v22;

  v24 = objc_opt_new();
  v25 = *(void **)(v21 + 24);
  *(_QWORD *)(v21 + 24) = v24;

  v26 = objc_opt_new();
  v27 = *(void **)(v21 + 32);
  *(_QWORD *)(v21 + 32) = v26;

  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v21);
  v29 = MEMORY[0x1E0C809B0];
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __91__PPTopicDissector_extractionsFromContextKitWithText_isPlainText_bundleId_language_weight___block_invoke;
  v43[3] = &unk_1E7E15B58;
  v30 = v13;
  v44 = v30;
  v49 = v10;
  v31 = v28;
  v45 = v31;
  v48 = a7;
  v32 = v14;
  v46 = v32;
  v33 = v20;
  v47 = v33;
  objc_msgSend(v15, "executeWithReply:", v43);
  objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:onAcquire:onTimeout:", v33, 0, &__block_literal_global_81, 3.0);
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__2603;
  v41 = __Block_byref_object_dispose__2604;
  v42 = 0;
  v36[0] = v29;
  v36[1] = 3221225472;
  v36[2] = __91__PPTopicDissector_extractionsFromContextKitWithText_isPlainText_bundleId_language_weight___block_invoke_82;
  v36[3] = &unk_1E7E15BA0;
  v36[4] = &v37;
  objc_msgSend(v31, "runWithLockAcquired:", v36);
  v34 = (id)v38[5];
  _Block_object_dispose(&v37, 8);

  return v34;
}

- (id)topicsInText:(id)a3 isPlainText:(BOOL)a4 source:(id)a5 cloudSync:(BOOL)a6 language:(id)a7 topicAlgorithms:(id)a8 namedEntityAlgorithms:(id)a9 weight:(double)a10
{
  _BOOL8 v15;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  double v22;
  void *v23;
  int v24;
  void *v25;
  float v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  id obj;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _QWORD v89[4];
  id v90;
  id v91;
  double v92;
  BOOL v93;
  _QWORD aBlock[4];
  id v95;
  id v96;
  double v97;
  BOOL v98;
  _BYTE v99[128];
  uint8_t v100[128];
  uint8_t buf[4];
  uint64_t v102;
  __int16 v103;
  void *v104;
  _BYTE v105[128];
  uint64_t v106;

  v15 = a4;
  v106 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a5;
  v19 = a7;
  v20 = a8;
  v71 = a9;
  v21 = (void *)objc_opt_new();
  v22 = 0.0;
  if (v15)
  {
    objc_msgSend(v18, "bundleId");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)*MEMORY[0x1E0D70E28], "isEqualToString:", v23))
    {

LABEL_5:
      +[PPSentiment sharedInstance](PPSentiment, "sharedInstance");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "sentimentScoreForText:", v17);
      v22 = v26;

      goto LABEL_6;
    }
    v24 = objc_msgSend((id)*MEMORY[0x1E0D70E18], "isEqualToString:", v23);

    if (v24)
      goto LABEL_5;
  }
LABEL_6:
  v27 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __116__PPTopicDissector_topicsInText_isPlainText_source_cloudSync_language_topicAlgorithms_namedEntityAlgorithms_weight___block_invoke;
  aBlock[3] = &unk_1E7E15BE8;
  v28 = v21;
  v95 = v28;
  v29 = v18;
  v96 = v29;
  v98 = a6;
  v97 = v22;
  v70 = _Block_copy(aBlock);
  v89[0] = v27;
  v89[1] = 3221225472;
  v89[2] = __116__PPTopicDissector_topicsInText_isPlainText_source_cloudSync_language_topicAlgorithms_namedEntityAlgorithms_weight___block_invoke_2;
  v89[3] = &unk_1E7E15C10;
  v30 = v28;
  v90 = v30;
  v31 = v29;
  v91 = v31;
  v93 = a6;
  v92 = v22;
  v69 = _Block_copy(v89);
  v32 = objc_msgSend(v20, "containsObject:", &unk_1E7E59138);
  v33 = objc_msgSend(v71, "containsObject:", &unk_1E7E59150);
  v34 = v33;
  if ((v32 & 1) != 0 || (_DWORD)v33)
  {
    objc_msgSend(v31, "bundleId");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPTopicDissector _collectResultsFromContextKitWithText:isPlainText:bundleId:language:useContextKitTopics:useContextKitNamedEntities:addTopic:addNamedEntity:weight:](self, "_collectResultsFromContextKitWithText:isPlainText:bundleId:language:useContextKitTopics:useContextKitNamedEntities:addTopic:addNamedEntity:weight:", v17, v15, v35, v19, v32, v34, a10, v70, v69);

  }
  v67 = v19;
  if (objc_msgSend(v20, "containsObject:", &unk_1E7E59168))
  {
    objc_msgSend(v31, "bundleId");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPTopicDissector _collectHighLevelTopicsWithText:bundleId:addTopic:weight:](self, "_collectHighLevelTopicsWithText:bundleId:addTopic:weight:", v17, v36, v70, a10);

  }
  v66 = v31;
  v68 = v17;
  objc_msgSend(v30, "allValues");
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v105, 16);
  if (v74)
  {
    v73 = *(_QWORD *)v86;
    do
    {
      v37 = 0;
      do
      {
        if (*(_QWORD *)v86 != v73)
          objc_enumerationMutation(obj);
        v76 = v37;
        v38 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * v37);
        pp_default_log_handle();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v38, "topics");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v40, "count");
          objc_msgSend(MEMORY[0x1E0D70CD0], "describeAlgorithm:", objc_msgSend(v38, "topicAlgorithm"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v102 = v41;
          v103 = 2112;
          v104 = v42;
          _os_log_impl(&dword_1C392E000, v39, OS_LOG_TYPE_DEFAULT, "PPTopicDissector detected %lu topics with algorithm \"%@\".", buf, 0x16u);

        }
        v83 = 0u;
        v84 = 0u;
        v81 = 0u;
        v82 = 0u;
        v75 = v38;
        objc_msgSend(v38, "topics");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v81, v100, 16);
        if (v44)
        {
          v45 = v44;
          v46 = *(_QWORD *)v82;
          do
          {
            v47 = 0;
            do
            {
              if (*(_QWORD *)v82 != v46)
                objc_enumerationMutation(v43);
              v48 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * v47);
              pp_private_log_handle();
              v49 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v48, "item");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "topicIdentifier");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v102 = (uint64_t)v51;
                _os_log_debug_impl(&dword_1C392E000, v49, OS_LOG_TYPE_DEBUG, "  QID: %@", buf, 0xCu);

              }
              ++v47;
            }
            while (v45 != v47);
            v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v81, v100, 16);
          }
          while (v45);
        }

        pp_default_log_handle();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v75, "entities");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = objc_msgSend(v53, "count");
          objc_msgSend(MEMORY[0x1E0D70BD8], "describeAlgorithm:", objc_msgSend(v75, "entityAlgorithm"));
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v102 = v54;
          v103 = 2112;
          v104 = v55;
          _os_log_impl(&dword_1C392E000, v52, OS_LOG_TYPE_DEFAULT, "PPTopicDissector detected %lu named entities with algorithm \"%@\".", buf, 0x16u);

        }
        v79 = 0u;
        v80 = 0u;
        v77 = 0u;
        v78 = 0u;
        objc_msgSend(v75, "entities");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v77, v99, 16);
        if (v57)
        {
          v58 = v57;
          v59 = *(_QWORD *)v78;
          do
          {
            v60 = 0;
            do
            {
              if (*(_QWORD *)v78 != v59)
                objc_enumerationMutation(v56);
              v61 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * v60);
              pp_private_log_handle();
              v62 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v61, "item");
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v63, "name");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v102 = (uint64_t)v64;
                _os_log_debug_impl(&dword_1C392E000, v62, OS_LOG_TYPE_DEBUG, "  QID: %@", buf, 0xCu);

              }
              ++v60;
            }
            while (v58 != v60);
            v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v77, v99, 16);
          }
          while (v58);
        }

        v37 = v76 + 1;
      }
      while (v76 + 1 != v74);
      v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v105, 16);
    }
    while (v74);
  }

  return obj;
}

- (void)_collectResultsFromContextKitWithText:(id)a3 isPlainText:(BOOL)a4 bundleId:(id)a5 language:(id)a6 useContextKitTopics:(BOOL)a7 useContextKitNamedEntities:(BOOL)a8 addTopic:(id)a9 addNamedEntity:(id)a10 weight:(double)a11
{
  _BOOL4 v12;
  _BOOL4 v13;
  _BOOL8 v16;
  id v19;
  void (**v20)(id, _QWORD, uint64_t);
  uint64_t v21;
  _QWORD *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[4];
  id v38;
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v12 = a8;
  v13 = a7;
  v16 = a4;
  v41 = *MEMORY[0x1E0C80C00];
  v19 = a9;
  v20 = (void (**)(id, _QWORD, uint64_t))a10;
  -[PPTopicDissector extractionsFromContextKitWithText:isPlainText:bundleId:language:weight:](self, "extractionsFromContextKitWithText:isPlainText:bundleId:language:weight:", a3, v16, a5, a6, a11);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (_QWORD *)v21;
  if (v13)
  {
    if (v21)
    {
      v23 = *(id *)(v21 + 8);
      v24 = (void *)v22[3];
    }
    else
    {
      v23 = 0;
      v24 = 0;
    }
    v25 = v24;
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __166__PPTopicDissector__collectResultsFromContextKitWithText_isPlainText_bundleId_language_useContextKitTopics_useContextKitNamedEntities_addTopic_addNamedEntity_weight___block_invoke;
    v37[3] = &unk_1E7E15C38;
    v38 = v25;
    v39 = v19;
    v26 = v25;
    objc_msgSend(v23, "enumerateObjectsUsingBlock:", v37);

  }
  if (v12)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    if (v22)
      v27 = (void *)v22[2];
    else
      v27 = 0;
    v28 = v27;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v34 != v31)
            objc_enumerationMutation(v28);
          v20[2](v20, *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i), 15);
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
      }
      while (v30);
    }

  }
}

- (void)_collectHighLevelTopicsWithText:(id)a3 bundleId:(id)a4 addTopic:(id)a5 weight:(double)a6
{
  id v8;
  id v9;
  NSObject *v10;
  PPTextToTopicTransform *transform;
  id v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[16];

  v8 = a5;
  v9 = a3;
  pp_default_log_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1C392E000, v10, OS_LOG_TYPE_DEBUG, "HighLevel Topic Extraction beginning for text...", buf, 2u);
  }

  transform = self->_transform;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __77__PPTopicDissector__collectHighLevelTopicsWithText_bundleId_addTopic_weight___block_invoke;
  v14[3] = &unk_1E7E15C60;
  v15 = v8;
  v12 = v8;
  -[PPTextToTopicTransform iterateTopicsForText:block:](transform, "iterateTopicsForText:block:", v9, v14);

  pp_default_log_handle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1C392E000, v13, OS_LOG_TYPE_DEBUG, "HighLevel Topic Extraction completed for text", buf, 2u);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transform, 0);
  objc_storeStrong((id *)&self->_contextClient, 0);
}

void __77__PPTopicDissector__collectHighLevelTopicsWithText_bundleId_addTopic_weight___block_invoke(uint64_t a1, void *a2, float a3)
{
  id v5;
  NSObject *v6;
  double v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  pp_private_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = a3;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412546;
    v12 = v5;
    v13 = 2048;
    v14 = v7;
    _os_log_debug_impl(&dword_1C392E000, v6, OS_LOG_TYPE_DEBUG, "topicId: %@, score: %f", (uint8_t *)&v11, 0x16u);
  }

  v8 = objc_alloc(MEMORY[0x1E0D70C38]);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70CB8]), "initWithTopicIdentifier:", v5);
  v10 = (void *)objc_msgSend(v8, "initWithItem:score:", v9, v7);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __166__PPTopicDissector__collectResultsFromContextKitWithText_isPlainText_bundleId_language_useContextKitTopics_useContextKitNamedEntities_addTopic_addNamedEntity_weight___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = a2;
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id, uint64_t))(v4 + 16))(v4, v6, v7, 1);

}

void __116__PPTopicDissector_topicsInText_isPlainText_source_cloudSync_language_topicAlgorithms_namedEntityAlgorithms_weight___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
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
  id v19;

  v19 = a2;
  v7 = a3;
  v8 = (void *)MEMORY[0x1C3BD6630]();
  v9 = *(void **)(a1 + 32);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("TP_%lu"), a4);
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v11 = (void *)objc_opt_new();
    v12 = (void *)objc_opt_new();
    objc_msgSend(v11, "setTopics:", v12);

    v13 = (void *)objc_opt_new();
    objc_msgSend(v11, "setTopicsExactMatchesInSourceText:", v13);

    objc_msgSend(v11, "setSource:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v11, "setTopicAlgorithm:", a4);
    objc_msgSend(v11, "setCloudSync:", *(unsigned __int8 *)(a1 + 56));
    objc_msgSend(v11, "setSentimentScore:", *(double *)(a1 + 48));
    v14 = *(void **)(a1 + 32);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("TP_%lu"), a4);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v11, v15);

  }
  objc_msgSend(v11, "topics");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "arrayByAddingObject:", v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTopics:", v17);

  objc_msgSend(v11, "topicsExactMatchesInSourceText");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObject:", v7);

  objc_autoreleasePoolPop(v8);
}

void __116__PPTopicDissector_topicsInText_isPlainText_source_cloudSync_language_topicAlgorithms_namedEntityAlgorithms_weight___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = (void *)MEMORY[0x1C3BD6630]();
  v6 = *(void **)(a1 + 32);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("NE_%lu"), a3);
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v8 = (void *)objc_opt_new();
    v9 = (void *)objc_opt_new();
    objc_msgSend(v8, "setEntities:", v9);

    objc_msgSend(v8, "setSource:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v8, "setEntityAlgorithm:", a3);
    objc_msgSend(v8, "setCloudSync:", *(unsigned __int8 *)(a1 + 56));
    objc_msgSend(v8, "setSentimentScore:", *(double *)(a1 + 48));
    v10 = *(void **)(a1 + 32);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("NE_%lu"), a3);
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, v11);

  }
  objc_msgSend(v8, "entities");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "arrayByAddingObject:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEntities:", v13);

  objc_autoreleasePoolPop(v5);
}

void __91__PPTopicDissector_extractionsFromContextKitWithText_isPlainText_bundleId_language_weight___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  _BOOL4 v17;
  NSObject *v18;
  void *v19;
  BOOL v20;
  NSObject *v21;
  int v22;
  void *v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  NSObject *v36;
  id v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  __int16 v45;
  uint8_t buf[4];
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    pp_default_log_handle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "error");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v47 = (uint64_t)v33;
      _os_log_error_impl(&dword_1C392E000, v5, OS_LOG_TYPE_ERROR, "ContextKit error: %@", buf, 0xCu);

    }
    objc_msgSend(v3, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "code") == 4)
    {
      v7 = 0;
      v8 = 0;
LABEL_24:

LABEL_26:
      +[PPLocalTopicStore defaultStore](PPLocalTopicStore, "defaultStore");
      v18 = objc_claimAutoreleasedReturnValue();
      -[NSObject logDonationErrorForReason:errorCode:source:](v18, "logDonationErrorForReason:errorCode:source:", v7, v8, *(_QWORD *)(a1 + 32));
      goto LABEL_27;
    }
    objc_msgSend(v3, "error");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "code") == 7;

    if (!v20)
    {
      objc_msgSend(v3, "error");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "code");
      v7 = 3;
      goto LABEL_24;
    }
LABEL_25:
    v7 = 0;
    v8 = 0;
    goto LABEL_26;
  }
  objc_msgSend(v3, "results");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9
    || (objc_msgSend(v3, "results"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "count") == 0,
        v10,
        v9,
        v11))
  {
    pp_default_log_handle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v21, OS_LOG_TYPE_DEFAULT, "nil or empty results received from ContextKit", buf, 2u);
    }

    if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x1E0D70E68]))
    {
      v22 = *(unsigned __int8 *)(a1 + 72);
      objc_msgSend(v3, "error");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v23;
      if (v22)
        v7 = 1;
      else
        v7 = 2;
      v8 = objc_msgSend(v23, "code");
      goto LABEL_24;
    }
    goto LABEL_25;
  }
  pp_default_log_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "results");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");
    *(_DWORD *)buf = 134217984;
    v47 = v14;
    _os_log_impl(&dword_1C392E000, v12, OS_LOG_TYPE_DEFAULT, "got %lu results from ContextKit", buf, 0xCu);

  }
  pp_private_log_handle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v3, "debug");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v47 = (uint64_t)v34;
    _os_log_debug_impl(&dword_1C392E000, v15, OS_LOG_TYPE_DEBUG, "ContextKit debug info: %@", buf, 0xCu);

  }
  objc_msgSend(v3, "results");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (objc_msgSend(v16, "count") & 0xFFFFFFFFFFFF0000) != 0;

  if (v17)
  {
    pp_default_log_handle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v18, OS_LOG_TYPE_DEFAULT, "ignoring excessive results returned from ContextKit.", buf, 2u);
    }
  }
  else
  {
    objc_msgSend(v3, "results");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count");

    +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "halfValuePosition");
    v28 = v27;

    v29 = *(void **)(a1 + 40);
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __91__PPTopicDissector_extractionsFromContextKitWithText_isPlainText_bundleId_language_weight___block_invoke_71;
    v35[3] = &unk_1E7E15B30;
    v36 = v3;
    v38 = &v42;
    v30 = *(_QWORD *)(a1 + 64);
    v39 = v28;
    v40 = v30;
    v41 = v25;
    v37 = *(id *)(a1 + 48);
    objc_msgSend(v29, "runWithLockAcquired:", v35);
    pp_default_log_handle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = *((unsigned __int16 *)v43 + 12);
      *(_DWORD *)buf = 134217984;
      v47 = v32;
      _os_log_impl(&dword_1C392E000, v31, OS_LOG_TYPE_DEFAULT, "processed %lu results from ContextKit", buf, 0xCu);
    }

    v18 = v36;
  }
LABEL_27:

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
  _Block_object_dispose(&v42, 8);

}

void __91__PPTopicDissector_extractionsFromContextKitWithText_isPlainText_bundleId_language_weight___block_invoke_82(uint64_t a1, _BYTE *a2)
{
  _QWORD *v3;
  PPContextKitResultContainer *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  PPContextKitResultContainer *v11;
  uint64_t v12;
  void *v13;
  objc_super v14;

  a2[8] = 1;
  v3 = a2;
  v4 = [PPContextKitResultContainer alloc];
  v6 = (void *)v3[2];
  v5 = (void *)v3[3];
  v7 = (void *)v3[4];

  v8 = v6;
  v9 = v5;
  v10 = v7;
  if (v4)
  {
    v14.receiver = v4;
    v14.super_class = (Class)PPContextKitResultContainer;
    v11 = (PPContextKitResultContainer *)objc_msgSendSuper2(&v14, sel_init);
    v4 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_topics, v6);
      objc_storeStrong((id *)&v4->_namedEntities, v5);
      objc_storeStrong((id *)&v4->_topicsExactMatchesInSourceText, v7);
    }
  }

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v4;

}

void __91__PPTopicDissector_extractionsFromContextKitWithText_isPlainText_bundleId_language_weight___block_invoke_80()
{
  NSObject *v0;
  uint8_t v1[16];

  pp_default_log_handle();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_error_impl(&dword_1C392E000, v0, OS_LOG_TYPE_ERROR, "Timeout waiting for ContextKit response.", v1, 2u);
  }

}

void __91__PPTopicDissector_extractionsFromContextKitWithText_isPlainText_bundleId_language_weight___block_invoke_71(uint64_t a1, void *a2)
{
  id *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  unint64_t v12;
  double v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*((_BYTE *)v3 + 8))
  {
    pp_default_log_handle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v4, OS_LOG_TYPE_DEFAULT, "Exceeded time limit to process ContextKit extractions. Stopping.", buf, 2u);
    }
  }
  else
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "results");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v27;
      obj = v4;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v27 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v8);
          pp_private_log_handle();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v9, "title");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "topicId");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "category");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v31 = v22;
            v32 = 2112;
            v33 = v23;
            v34 = 2112;
            v35 = v24;
            _os_log_debug_impl(&dword_1C392E000, v10, OS_LOG_TYPE_DEBUG, "ContextKit title: %@, qid: %@, category: %@", buf, 0x20u);

          }
          objc_msgSend(v9, "topicId");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          LOWORD(v12) = *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
          v13 = *(double *)(a1 + 56) / (*(double *)(a1 + 56) + (double)v12);
          if (v11)
          {
            v14 = objc_alloc(MEMORY[0x1E0D70CB8]);
            objc_msgSend(v9, "topicId");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = (void *)objc_msgSend(v14, "initWithTopicIdentifier:", v15);

            v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C38]), "initWithItem:score:resultPosition:resultCount:", v16, *(unsigned __int16 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), *(unsigned __int16 *)(a1 + 72), v13 * *(double *)(a1 + 64));
            objc_msgSend(v3[2], "addObject:", v17);
            v18 = v3[4];
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v9, "isExactMatch"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "addObject:", v19);

          }
          else
          {
            v20 = objc_alloc(MEMORY[0x1E0D70BC0]);
            objc_msgSend(v9, "title");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = (void *)objc_msgSend(v20, "initWithName:category:language:", v21, 0, *(_QWORD *)(a1 + 40));

            v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C38]), "initWithItem:score:resultPosition:resultCount:", v16, *(unsigned __int16 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), *(unsigned __int16 *)(a1 + 72), v13 * *(double *)(a1 + 64));
            objc_msgSend(v3[3], "addObject:", v17);
          }

          ++*(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
          ++v8;
        }
        while (v6 != v8);
        v4 = obj;
        v6 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
      }
      while (v6);
    }
  }

}

void __24__PPTopicDissector_init__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(MEMORY[0x1E0D14368], "clientWithDefaultRequestType:", 2);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)init__pasExprOnceResult;
  init__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken12 != -1)
    dispatch_once(&sharedInstance__pasOnceToken12, &__block_literal_global_84);
  return (id)sharedInstance__pasExprOnceResult_2634;
}

void __34__PPTopicDissector_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_2634;
  sharedInstance__pasExprOnceResult_2634 = v1;

  objc_autoreleasePoolPop(v0);
}

@end
