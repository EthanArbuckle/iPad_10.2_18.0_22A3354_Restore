@implementation TIResponseKitManager

- (TIResponseKitManager)init
{
  TIResponseKitManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TIResponseKitManager;
  v2 = -[TIResponseKitManager init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.TextInput.ResponseKitManager", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)generateResponseKitSuggestionsForString:(id)a3 withLanguage:(id)a4 withClientID:(id)a5 withRecipientID:(id)a6 withAdditionalPredictions:(id)a7 desiredCandidateCount:(unint64_t)a8 shouldDisableAutoCaps:(BOOL)a9 stringIsBlocklisted:(BOOL)a10 async:(BOOL)a11 completionHandler:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t);
  void *v39;
  TIResponseKitManager *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  unint64_t v47;
  BOOL v48;
  BOOL v49;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a12;
  if (a11)
  {
    v36 = MEMORY[0x1E0C809B0];
    v37 = 3221225472;
    v38 = __220__TIResponseKitManager_generateResponseKitSuggestionsForString_withLanguage_withClientID_withRecipientID_withAdditionalPredictions_desiredCandidateCount_shouldDisableAutoCaps_stringIsBlocklisted_async_completionHandler___block_invoke;
    v39 = &unk_1EA105C00;
    v40 = self;
    v41 = v17;
    v42 = v18;
    v43 = v19;
    v44 = v20;
    v45 = v21;
    v47 = a8;
    v48 = a9;
    v49 = a10;
    v46 = v22;
    TIDispatchAsync();

    v23 = v41;
  }
  else
  {
    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__16979;
    v34 = __Block_byref_object_dispose__16980;
    v35 = 0;
    v25 = v17;
    v26 = v18;
    v27 = v19;
    v28 = v20;
    v29 = v21;
    TIDispatchSync();
    (*((void (**)(id, uint64_t))v22 + 2))(v22, v31[5]);

    _Block_object_dispose(&v30, 8);
    v23 = v35;
  }

}

- (void)registerResponseKitResponse:(id)a3 forMessage:(id)a4 withLanguage:(id)a5 withClientID:(id)a6 withSenderID:(id)a7 withRecipientID:(id)a8 withTimestamp:(id)a9 shouldUpdateConversationHistory:(BOOL)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v28 = v18;
  v29 = v15;
  v30 = v16;
  v31 = v17;
  v32 = v19;
  v33 = a9;
  v21 = v33;
  v22 = v19;
  v23 = v17;
  v24 = v16;
  v25 = v15;
  v26 = v20;
  v27 = v18;
  TIDispatchAsync();

}

- (void)updateResponseKitConversationHistoryWithMessage:(id)a3 withSenderID:(id)a4 withTimestamp:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v7 = v12;
  v8 = v11;
  v9 = v10;
  TIDispatchAsync();

}

- (void)resetResponseKitConversationHistory
{
  TIDispatchAsync();
}

- (void)resetResponseKit
{
  TIDispatchSync();
}

- (void)persistResponseKitDynamicDataToDisk
{
  TIDispatchSync();
}

- (void)addNewConversationTurnToHistory:(id)a3
{
  id v4;
  NSMutableArray *conversationTurns;
  NSMutableArray *v6;
  NSMutableArray *v7;
  unint64_t v8;
  id v9;

  v4 = a3;
  conversationTurns = self->_conversationTurns;
  v9 = v4;
  if (!conversationTurns)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_conversationTurns;
    self->_conversationTurns = v6;

    v4 = v9;
    conversationTurns = self->_conversationTurns;
  }
  -[NSMutableArray addObject:](conversationTurns, "addObject:", v4);
  v8 = *MEMORY[0x1E0D87C48];
  if (-[NSMutableArray count](self->_conversationTurns, "count") > v8)
    -[NSMutableArray removeObjectsInRange:](self->_conversationTurns, "removeObjectsInRange:", 0, -[NSMutableArray count](self->_conversationTurns, "count") - v8);

}

- (id)responseKitResponseCandidatesForString:(id)a3 withLanguageID:(id)a4 withClientID:(id)a5 withRecipientID:(id)a6 shouldDisableAutoCaps:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  uint64_t v14;
  NSMutableArray *conversationTurns;
  id v16;
  id v17;
  TILanguageModelAdaptationContext *v18;
  void *v19;
  void *v20;
  uint64_t v21;

  v7 = a7;
  v12 = a5;
  v13 = a6;
  if (v7)
    v14 = 704;
  else
    v14 = 576;
  conversationTurns = self->_conversationTurns;
  v16 = a4;
  v17 = a3;
  if (-[NSMutableArray count](conversationTurns, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D87C10], "sharedManager");
    v18 = (TILanguageModelAdaptationContext *)objc_claimAutoreleasedReturnValue();
    -[TILanguageModelAdaptationContext responsesForMessage:maximumResponses:forConversationHistory:withLanguage:options:](v18, "responsesForMessage:maximumResponses:forConversationHistory:withLanguage:options:", v17, 10, self->_conversationTurns, v16, v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = -[TILanguageModelAdaptationContext initWithClientIdentifier:andRecipientContactInfo:]([TILanguageModelAdaptationContext alloc], "initWithClientIdentifier:andRecipientContactInfo:", v12, v13);
    objc_msgSend(MEMORY[0x1E0D87C10], "sharedManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[TILanguageModelAdaptationContext identifierForResponseKit](v18, "identifierForResponseKit");
    v21 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "responsesForMessage:maximumResponses:forContext:withLanguage:options:", v17, 10, v21, v16, v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (id)v21;
    v17 = v20;
  }

  return v19;
}

- (id)indexesOfDuplicatesInCandidates:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = (objc_class *)MEMORY[0x1E0C99E20];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithCapacity:", objc_msgSend(v4, "count"));
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__TIResponseKitManager_indexesOfDuplicatesInCandidates___block_invoke;
  v9[3] = &unk_1EA105CE0;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "indexesOfObjectsPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)cannedResponsesForString:(id)a3 withLanguageID:(id)a4 withClientID:(id)a5 withRecipientID:(id)a6 withAdditionalPredictions:(id)a7 desiredCandidateCount:(unint64_t)a8 shouldDisableAutoCaps:(BOOL)a9 isBlocklisted:(BOOL)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  TIProactiveTrigger *v36;
  void *v37;
  id v38;
  TIProactiveTrigger *v39;
  void *v40;
  TIProactiveTrigger *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  TIResponseKitManager *v48;
  unint64_t v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  void *v55;
  uint64_t v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t buf[4];
  void *v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  if (!objc_msgSend(v16, "length"))
  {
    v46 = v20;
    goto LABEL_33;
  }
  -[TIResponseKitManager responseKitResponseCandidatesForString:withLanguageID:withClientID:withRecipientID:shouldDisableAutoCaps:](self, "responseKitResponseCandidatesForString:withLanguageID:withClientID:withRecipientID:shouldDisableAutoCaps:", v16, v17, v18, v19, a9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    v46 = v20;
    goto LABEL_32;
  }
  v48 = self;
  v49 = a8;
  v51 = v20;
  v52 = v19;
  v53 = v18;
  v54 = v16;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v50 = v21;
  v22 = v21;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
  if (!v23)
    goto LABEL_27;
  v24 = v23;
  v25 = *(_QWORD *)v59;
  v56 = *MEMORY[0x1E0D87C30];
  do
  {
    v26 = 0;
    do
    {
      if (*(_QWORD *)v59 != v25)
        objc_enumerationMutation(v22);
      v27 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v26);
      objc_msgSend(v27, "attributes");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        if (TICanLogMessageAtLevel_onceToken != -1)
          dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
        if (TICanLogMessageAtLevel_logLevel >= 2)
        {
          TIOSLogFacility();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s DEBUG:ProactiveQuickType:TI: Response Kit has returned an attributed response."), "-[TIResponseKitManager cannedResponsesForString:withLanguageID:withClientID:withRecipientID:withAdditionalPredictions:desiredCandidateCount:shouldDisableAutoCaps:isBlocklisted:]");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v63 = v42;
            _os_log_debug_impl(&dword_1DA6F2000, v29, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

          }
        }
        objc_msgSend(v27, "category");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("QueryPhotoSharing"));

        if (!v31 || !a10)
        {
          objc_msgSend(v27, "attributes");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "objectForKey:", *MEMORY[0x1E0D43428]);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v33, "isEqualToString:", v56))
          {
            objc_msgSend(v27, "attributes");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            +[TIResponseKitManager rewriteMoneyAttributes:](TIResponseKitManager, "rewriteMoneyAttributes:", v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            v36 = [TIProactiveTrigger alloc];
          }
          else
          {
            v41 = [TIProactiveTrigger alloc];
            objc_msgSend(v27, "attributes");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = v41;
          }
          v39 = -[TIProactiveTrigger initWithSourceType:attributes:](v36, "initWithSourceType:attributes:", 1, v35);

          objc_msgSend(v57, "addObject:", v39);
          goto LABEL_24;
        }
      }
      else
      {
        objc_msgSend(v27, "string");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37 && !a10)
        {
          v38 = objc_alloc(MEMORY[0x1E0DBDDD0]);
          objc_msgSend(v27, "string");
          v39 = (TIProactiveTrigger *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "category");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = (void *)objc_msgSend(v38, "initWithCandidate:responseKitCategory:", v39, v33);
          objc_msgSend(v55, "addObject:", v40);

LABEL_24:
        }
      }
      ++v26;
    }
    while (v24 != v26);
    v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
  }
  while (v24);
LABEL_27:

  v20 = v51;
  if (objc_msgSend(v55, "count") < v49)
  {
    objc_msgSend(v51, "predictions");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "addObjectsFromArray:", v43);

    -[TIResponseKitManager indexesOfDuplicatesInCandidates:](v48, "indexesOfDuplicatesInCandidates:", v55);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "removeObjectsAtIndexes:", v44);

    objc_msgSend(v51, "proactiveTriggers");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "addObjectsFromArray:", v45);

  }
  objc_msgSend(MEMORY[0x1E0DBDB48], "listWithPredictions:proactiveTriggers:", v55, v57);
  v46 = (id)objc_claimAutoreleasedReturnValue();

  v16 = v54;
  v19 = v52;
  v18 = v53;
  v21 = v50;
LABEL_32:

LABEL_33:
  return v46;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversationTurns, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

BOOL __56__TIResponseKitManager_indexesOfDuplicatesInCandidates___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "candidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "member:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  return v4 != 0;
}

void __59__TIResponseKitManager_persistResponseKitDynamicDataToDisk__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0D87C10], "sharedManager");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "flushDynamicData");

}

void __40__TIResponseKitManager_resetResponseKit__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0D87C10], "sharedManager");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "resetRegisteredResponses");

}

uint64_t __59__TIResponseKitManager_resetResponseKitConversationHistory__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
}

void __99__TIResponseKitManager_updateResponseKitConversationHistoryWithMessage_withSenderID_withTimestamp___block_invoke(uint64_t a1)
{
  id v2;

  if (*(_QWORD *)(a1 + 32) && *(_QWORD *)(a1 + 40))
  {
    if (*(_QWORD *)(a1 + 48))
    {
      v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D87C00]), "initWithString:senderID:timestamp:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      objc_msgSend(*(id *)(a1 + 56), "addNewConversationTurnToHistory:", v2);

    }
  }
}

void __164__TIResponseKitManager_registerResponseKitResponse_forMessage_withLanguage_withClientID_withSenderID_withRecipientID_withTimestamp_shouldUpdateConversationHistory___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  TILanguageModelAdaptationContext *v7;

  v7 = -[TILanguageModelAdaptationContext initWithClientIdentifier:andRecipientContactInfo:]([TILanguageModelAdaptationContext alloc], "initWithClientIdentifier:andRecipientContactInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0D87C10], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  -[TILanguageModelAdaptationContext identifierForResponseKit](v7, "identifierForResponseKit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerResponse:forMessage:forContext:withLanguage:", v3, v4, v5, *(_QWORD *)(a1 + 64));

  if (*(_BYTE *)(a1 + 96) && *(_QWORD *)(a1 + 48) && *(_QWORD *)(a1 + 72) && *(_QWORD *)(a1 + 80))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87C00]), "initWithString:senderID:timestamp:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
    objc_msgSend(*(id *)(a1 + 88), "addNewConversationTurnToHistory:", v6);

  }
}

void __220__TIResponseKitManager_generateResponseKitSuggestionsForString_withLanguage_withClientID_withRecipientID_withAdditionalPredictions_desiredCandidateCount_shouldDisableAutoCaps_stringIsBlocklisted_async_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;

  LOWORD(v4) = *(_WORD *)(a1 + 96);
  objc_msgSend(*(id *)(a1 + 32), "cannedResponsesForString:withLanguageID:withClientID:withRecipientID:withAdditionalPredictions:desiredCandidateCount:shouldDisableAutoCaps:isBlocklisted:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 88), v4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(id *)(a1 + 80);
  v3 = v2;
  TIDispatchAsync();

}

void __220__TIResponseKitManager_generateResponseKitSuggestionsForString_withLanguage_withClientID_withRecipientID_withAdditionalPredictions_desiredCandidateCount_shouldDisableAutoCaps_stringIsBlocklisted_async_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  LOWORD(v5) = *(_WORD *)(a1 + 96);
  objc_msgSend(*(id *)(a1 + 32), "cannedResponsesForString:withLanguageID:withClientID:withRecipientID:withAdditionalPredictions:desiredCandidateCount:shouldDisableAutoCaps:isBlocklisted:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 88), v5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __220__TIResponseKitManager_generateResponseKitSuggestionsForString_withLanguage_withClientID_withRecipientID_withAdditionalPredictions_desiredCandidateCount_shouldDisableAutoCaps_stringIsBlocklisted_async_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (id)sharedTIResponseKitManager
{
  return +[TIResponseKitManager singletonInstance](TIResponseKitManager, "singletonInstance");
}

+ (id)singletonInstance
{
  if (singletonInstance_onceToken_16997 != -1)
    dispatch_once(&singletonInstance_onceToken_16997, &__block_literal_global_16998);
  return (id)singletonInstance_singleton_16999;
}

+ (id)rewriteMoneyAttributes:(id)a3
{
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = (_QWORD *)MEMORY[0x1E0D433D0];
  objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0D433D0]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKey:", *MEMORY[0x1E0D87C38]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", *MEMORY[0x1E0D87C30], *MEMORY[0x1E0D43428]);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v7, CFSTR("Currency"));
  v23 = v5;
  v24 = v6;
  objc_msgSend(v5, "setValue:forKey:", v6, *v3);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v27;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = (void *)MEMORY[0x1E0C99E08];
          v15 = v13;
          objc_msgSend(v14, "dictionary");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "currency");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKey:", v17, CFSTR("CurrencyType"));

          v18 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v15, "value");
          v20 = v19;

          objc_msgSend(v18, "stringWithFormat:", CFSTR("%.2f"), v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKey:", v21, CFSTR("CurrencyValue"));

          objc_msgSend(v7, "addObject:", v16);
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v10);
  }

  return v23;
}

void __41__TIResponseKitManager_singletonInstance__block_invoke()
{
  TIResponseKitManager *v0;
  void *v1;

  v0 = objc_alloc_init(TIResponseKitManager);
  v1 = (void *)singletonInstance_singleton_16999;
  singletonInstance_singleton_16999 = (uint64_t)v0;

}

@end
