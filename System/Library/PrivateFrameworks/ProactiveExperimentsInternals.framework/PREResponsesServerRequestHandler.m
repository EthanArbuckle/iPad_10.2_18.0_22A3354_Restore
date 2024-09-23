@implementation PREResponsesServerRequestHandler

- (void)setRemoteObjectProxy:(id)a3
{
  objc_storeStrong((id *)&self->_clientProxy, a3);
}

- (void)preResponseItemsForMessage:(id)a3 maximumResponses:(unint64_t)a4 conversationTurns:(id)a5 context:(id)a6 time:(id)a7 language:(id)a8 recipientHandles:(id)a9 modelFilePath:(id)a10 modelConfigPath:(id)a11 espressoBinFilePath:(id)a12 vocabFilePath:(id)a13 registerDisplayed:(BOOL)a14 includeCustomResponses:(BOOL)a15 includeResponsesToRobots:(BOOL)a16 completion:(id)a17
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void (**v26)(id, void *, _QWORD);
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint8_t v42[16];
  uint8_t buf[16];

  v37 = a3;
  v21 = a5;
  v39 = a6;
  v38 = a7;
  v41 = a8;
  v22 = a9;
  v40 = a10;
  v23 = a11;
  v24 = a12;
  v25 = a13;
  v26 = (void (**)(id, void *, _QWORD))a17;
  pre_sv_responses_handle();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_227234000, v27, OS_LOG_TYPE_DEFAULT, "PREInternal - Server responsesForMessage called", buf, 2u);
  }

  if (v21)
  {
    BYTE2(v33) = a16;
    BYTE1(v33) = a15;
    LOBYTE(v33) = 1;
    v28 = v37;
    v29 = v22;
    objc_msgSend(MEMORY[0x24BE28680], "quickResponsesForMessage:conversationTurns:maxResponses:localeIdentifier:recipientHandles:chunkPath:plistPath:espressoBinFilePath:vocabFilePath:useContactNames:includeCustomResponses:includeResponsesToRobots:", v37, v21, a4, v41, v22, v40, v23, v24, v25, v33);
  }
  else
  {
    LOWORD(v34) = __PAIR16__(a16, a15);
    v28 = v37;
    v29 = v22;
    objc_msgSend(MEMORY[0x24BE28680], "quickResponsesForMessage:context:time:maxResponses:locale:recipientHandles:chunkPath:plistPath:espressoBinFilePath:vocabFilePath:includeCustomResponses:includeResponsesToRobots:", v37, v39, v38, a4, v41, v22, v40, v23, v24, v25, v34);
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    -[PREResponsesServerRequestHandler preResponseItemArrayFromQuickResponses:](self, "preResponseItemArrayFromQuickResponses:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = 0;
  }
  v26[2](v26, v31, 0);
  if (a14 && objc_msgSend(v30, "count"))
  {
    pre_sv_responses_handle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v42 = 0;
      _os_log_impl(&dword_227234000, v32, OS_LOG_TYPE_DEFAULT, "PREInternal - registerDisplayedQuickResponses", v42, 2u);
    }

    objc_msgSend(MEMORY[0x24BE28680], "registerDisplayedQuickResponses:plistPath:vocabPath:", v30, v23, v25);
  }

}

- (void)predictForMessage:(id)a3 conversationTurns:(id)a4 language:(id)a5 plistPath:(id)a6 espressoBinPath:(id)a7 vocabPath:(id)a8 heads:(id)a9 completion:(id)a10
{
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  void (**v27)(id, void *, _QWORD);
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[8];
  uint64_t v40;
  Class (*v41)(uint64_t);
  void *v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v28 = a3;
  v29 = a4;
  v30 = a5;
  v31 = a6;
  v32 = a7;
  v33 = a8;
  v34 = a9;
  v27 = (void (**)(id, void *, _QWORD))a10;
  pre_sv_responses_handle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_227234000, v15, OS_LOG_TYPE_DEFAULT, "PREInternal - Server predictForMessage called", buf, 2u);
  }

  v44 = 0;
  v45 = &v44;
  v46 = 0x2050000000;
  v16 = (void *)getSGMultiHeadInferenceClass_softClass;
  v47 = getSGMultiHeadInferenceClass_softClass;
  if (!getSGMultiHeadInferenceClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    v40 = 3221225472;
    v41 = __getSGMultiHeadInferenceClass_block_invoke;
    v42 = &unk_24EF87310;
    v43 = &v44;
    __getSGMultiHeadInferenceClass_block_invoke((uint64_t)buf);
    v16 = (void *)v45[3];
  }
  v17 = objc_retainAutorelease(v16);
  _Block_object_dispose(&v44, 8);
  objc_msgSend(v17, "predictForMessage:conversationTurns:localeIdentifier:plistPath:espressoBinPath:vocabPath:heads:", v28, v29, v30, v31, v32, v33, v34);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)objc_opt_new();
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v20 = v18;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v36 != v22)
            objc_enumerationMutation(v20);
          v24 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_msgSend(v20, "objectForKeyedSubscript:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "_pas_mappedArrayWithTransform:", &__block_literal_global_81);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v26, v24);

        }
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
      }
      while (v21);
    }

    v27[2](v27, v19, 0);
  }
  else
  {
    v27[2](v27, 0, 0);
  }

}

- (id)preResponseItemArrayFromQuickResponses:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v5)
  {
    v6 = v5;
    v26 = *(_QWORD *)v28;
    v19 = v4;
    do
    {
      v7 = 0;
      v21 = v6;
      do
      {
        if (*(_QWORD *)v28 != v26)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "proactiveTrigger");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9)
          {
            pre_sv_responses_handle();
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
            {
              objc_msgSend(v8, "proactiveTrigger");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v32 = v11;
              _os_log_fault_impl(&dword_227234000, v10, OS_LOG_TYPE_FAULT, "PREInternal - Unexpected proactive trigger received %@", buf, 0xCu);

            }
          }
          else
          {
            v12 = objc_alloc(MEMORY[0x24BE79A08]);
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v8, "categoryId"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v8, "modelId"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v8, "semanticClassId"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v8, "styleGroupId"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v8, "replyTextId"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "text");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "lang");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v8, "isCustomResponse"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v8, "isRobotResponse"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = objc_msgSend(v12, "initWithCategoryId:modelId:responseClassId:replySubgroupId:replyTextId:replyText:language:isCustomResponse:isRobotResponse:", v13, v25, v24, v22, v23, v14, v15, v16, v17);

            v6 = v21;
            v4 = v19;

            objc_msgSend(v20, "addObject:", v10);
          }
        }
        else
        {
          pre_sv_responses_handle();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_227234000, v10, OS_LOG_TYPE_FAULT, "PREInternal - Unexpected type received when expecting SGQuickResponse", buf, 2u);
          }
        }

        ++v7;
      }
      while (v6 != v7);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v6);
  }

  return v20;
}

- (void)registerResponse:(id)a3 position:(id)a4 isCanned:(BOOL)a5 isUsingQuickResponses:(BOOL)a6 locale:(id)a7 modelConfigPath:(id)a8 vocabPath:(id)a9
{
  _BOOL8 v11;
  _BOOL8 v12;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  uint8_t buf[16];

  v11 = a6;
  v12 = a5;
  v15 = a9;
  v16 = a8;
  v17 = a7;
  v18 = a4;
  v19 = a3;
  pre_sv_responses_handle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_227234000, v20, OS_LOG_TYPE_DEFAULT, "PREInternal - Server registerResponse called", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BE28680], "registerResponse:position:isCanned:isUsingQuickResponses:locale:plistPath:vocabPath:", v19, v18, v12, v11, v17, v16, v15);
}

- (NSString)clientProcessName
{
  return self->_clientProcessName;
}

- (void)setClientProcessName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (_PASBundleIdResolver)bundleIdResolver
{
  return self->_bundleIdResolver;
}

- (void)setBundleIdResolver:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdResolver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdResolver, 0);
  objc_storeStrong((id *)&self->_clientProcessName, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);
}

id __134__PREResponsesServerRequestHandler_predictForMessage_conversationTurns_language_plistPath_espressoBinPath_vocabPath_heads_completion___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (objc_class *)MEMORY[0x24BE79A00];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "score");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v4, "initWithScore:label:", v5, v6);
  return v7;
}

@end
