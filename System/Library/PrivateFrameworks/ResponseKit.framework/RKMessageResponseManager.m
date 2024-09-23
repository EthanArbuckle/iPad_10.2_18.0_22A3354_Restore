@implementation RKMessageResponseManager

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__RKMessageResponseManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, block);
  return (id)sharedManager_singleton;
}

void __41__RKMessageResponseManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDynamicDataURL:", 0);
  v1 = (void *)sharedManager_singleton;
  sharedManager_singleton = v0;

}

- (id)dispatchQueue
{
  if (dispatchQueue_onceToken != -1)
    dispatch_once(&dispatchQueue_onceToken, &__block_literal_global_6);
  return (id)dispatchQueue_queue;
}

void __41__RKMessageResponseManager_dispatchQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.ResponseKit", v0);
  v2 = (void *)dispatchQueue_queue;
  dispatchQueue_queue = (uint64_t)v1;

}

- (RKMessageResponseManager)init
{
  -[RKMessageResponseManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return self;
}

- (RKMessageResponseManager)initWithDynamicDataURL:(id)a3
{
  id v4;
  RKBundleDataProvider *v5;
  void *v6;
  RKBundleDataProvider *v7;
  RKMessageResponseManager *v8;

  v4 = a3;
  v5 = [RKBundleDataProvider alloc];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[RKBundleDataProvider initWithBundle:](v5, "initWithBundle:", v6);
  v8 = -[RKMessageResponseManager initWithDynamicDataURL:displayStringsProvider:](self, "initWithDynamicDataURL:displayStringsProvider:", v4, v7);

  return v8;
}

- (RKMessageResponseManager)initWithDynamicDataURL:(id)a3 withBundleURL:(id)a4
{
  id v6;
  id v7;
  RKBundleDataProvider *v8;
  void *v9;
  RKBundleDataProvider *v10;
  RKMessageResponseManager *v11;

  v6 = a4;
  v7 = a3;
  v8 = [RKBundleDataProvider alloc];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithURL:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[RKBundleDataProvider initWithBundle:](v8, "initWithBundle:", v9);
  v11 = -[RKMessageResponseManager initWithDynamicDataURL:displayStringsProvider:](self, "initWithDynamicDataURL:displayStringsProvider:", v7, v10);

  return v11;
}

- (RKMessageResponseManager)initWithAssetPlistURL:(id)a3
{
  id v4;
  RKMessageResponseManager *v5;
  uint64_t v6;
  OS_dispatch_queue *dispatchQueue;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  RKResponseCollection *v15;
  RKBundleDataProvider *v16;
  uint64_t v17;
  RKResponseCollection *collection;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)RKMessageResponseManager;
  v5 = -[RKMessageResponseManager init](&v24, sel_init);
  -[RKMessageResponseManager dispatchQueue](v5, "dispatchQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatchQueue = v5->_dispatchQueue;
  v5->_dispatchQueue = (OS_dispatch_queue *)v6;

  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        +[RKUtilities canonicalLanguageAndScriptCodeIdentifierForIdentifier:](RKUtilities, "canonicalLanguageAndScriptCodeIdentifierForIdentifier:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v13));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v11);
  }

  -[RKMessageResponseManager setPreferredLanguages:](v5, "setPreferredLanguages:", v8);
  if (v5)
  {
    v15 = [RKResponseCollection alloc];
    v16 = -[RKBundleDataProvider initWithAssetPlist:]([RKBundleDataProvider alloc], "initWithAssetPlist:", v4);
    v17 = -[RKResponseCollection initWithDynamicDataURL:displayStringsProvider:](v15, "initWithDynamicDataURL:displayStringsProvider:", 0, v16);
    collection = v5->_collection;
    v5->_collection = (RKResponseCollection *)v17;

  }
  return v5;
}

- (RKMessageResponseManager)initWithDynamicDataURL:(id)a3 displayStringsProvider:(id)a4
{
  id v5;
  RKMessageResponseManager *v6;
  uint64_t v7;
  OS_dispatch_queue *dispatchQueue;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  RKResponseCollection *v16;
  RKResponseCollection *collection;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v23.receiver = self;
  v23.super_class = (Class)RKMessageResponseManager;
  v6 = -[RKMessageResponseManager init](&v23, sel_init);
  -[RKMessageResponseManager dispatchQueue](v6, "dispatchQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatchQueue = v6->_dispatchQueue;
  v6->_dispatchQueue = (OS_dispatch_queue *)v7;

  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        +[RKUtilities canonicalLanguageAndScriptCodeIdentifierForIdentifier:](RKUtilities, "canonicalLanguageAndScriptCodeIdentifierForIdentifier:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v14));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          objc_msgSend(v9, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v12);
  }

  -[RKMessageResponseManager setPreferredLanguages:](v6, "setPreferredLanguages:", v9);
  if (v6)
  {
    v16 = -[RKResponseCollection initWithDynamicDataURL:displayStringsProvider:]([RKResponseCollection alloc], "initWithDynamicDataURL:displayStringsProvider:", 0, v5);
    collection = v6->_collection;
    v6->_collection = v16;

  }
  return v6;
}

- (void)responsesForMessage:(id)a3 maximumResponses:(unint64_t)a4 forContext:(id)a5 withLanguage:(id)a6 options:(unint64_t)a7 completionBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *dispatchQueue;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD *v28;
  unint64_t v29;
  unint64_t v30;
  _QWORD v31[5];
  id v32;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__2;
  v31[4] = __Block_byref_object_dispose__2;
  v32 = 0;
  dispatchQueue = self->_dispatchQueue;
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __113__RKMessageResponseManager_responsesForMessage_maximumResponses_forContext_withLanguage_options_completionBlock___block_invoke;
  v23[3] = &unk_24C6AF978;
  v23[4] = self;
  v24 = v14;
  v25 = v15;
  v26 = v16;
  v29 = a4;
  v30 = a7;
  v27 = v17;
  v28 = v31;
  v19 = v17;
  v20 = v16;
  v21 = v15;
  v22 = v14;
  dispatch_async(dispatchQueue, v23);

  _Block_object_dispose(v31, 8);
}

void __113__RKMessageResponseManager_responsesForMessage_maximumResponses_forContext_withLanguage_options_completionBlock___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "responsesForMessageImp:maximumResponses:forRecipientID:forConversationHistory:forContext:withLanguage:options:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 80), 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), RKMessageResponseDontOverrideLanguageID | *(_QWORD *)(a1 + 88));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

- (void)responsesForMessage:(id)a3 maximumResponses:(unint64_t)a4 forConversationHistory:(id)a5 withLanguage:(id)a6 options:(unint64_t)a7 completionBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *dispatchQueue;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD block[5];
  id v24;
  id v25;
  id v26;
  id v27;
  unint64_t v28;
  unint64_t v29;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __125__RKMessageResponseManager_responsesForMessage_maximumResponses_forConversationHistory_withLanguage_options_completionBlock___block_invoke;
  block[3] = &unk_24C6AF9A0;
  block[4] = self;
  v24 = v14;
  v25 = v15;
  v26 = v16;
  v28 = a4;
  v29 = a7;
  v27 = v17;
  v19 = v17;
  v20 = v16;
  v21 = v15;
  v22 = v14;
  dispatch_async(dispatchQueue, block);

}

void __125__RKMessageResponseManager_responsesForMessage_maximumResponses_forConversationHistory_withLanguage_options_completionBlock___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "responsesForMessageImp:maximumResponses:forRecipientID:forConversationHistory:forContext:withLanguage:options:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), 0, *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 56), RKMessageResponseDontOverrideLanguageID | *(_QWORD *)(a1 + 80));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

- (void)responsesForMessage:(id)a3 maximumResponses:(unint64_t)a4 recipientID:(id)a5 forConversationHistory:(id)a6 withLanguage:(id)a7 options:(unint64_t)a8 completionBlock:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *dispatchQueue;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  unint64_t v32;
  unint64_t v33;

  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a9;
  dispatchQueue = self->_dispatchQueue;
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __137__RKMessageResponseManager_responsesForMessage_maximumResponses_recipientID_forConversationHistory_withLanguage_options_completionBlock___block_invoke;
  v26[3] = &unk_24C6AF9C8;
  v26[4] = self;
  v27 = v15;
  v28 = v16;
  v29 = v17;
  v32 = a4;
  v33 = a8;
  v30 = v18;
  v31 = v19;
  v21 = v19;
  v22 = v18;
  v23 = v17;
  v24 = v16;
  v25 = v15;
  dispatch_async(dispatchQueue, v26);

}

void __137__RKMessageResponseManager_responsesForMessage_maximumResponses_recipientID_forConversationHistory_withLanguage_options_completionBlock___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "responsesForMessageImp:maximumResponses:forRecipientID:forConversationHistory:forContext:withLanguage:options:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0, *(_QWORD *)(a1 + 64), RKMessageResponseDontOverrideLanguageID | *(_QWORD *)(a1 + 88));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

}

- (id)responsesForMessage:(id)a3 maximumResponses:(unint64_t)a4 recipientID:(id)a5 forConversationHistory:(id)a6 withLanguage:(id)a7 options:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *dispatchQueue;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t *v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__2;
  v37 = __Block_byref_object_dispose__2;
  v38 = 0;
  dispatchQueue = self->_dispatchQueue;
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __121__RKMessageResponseManager_responsesForMessage_maximumResponses_recipientID_forConversationHistory_withLanguage_options___block_invoke;
  v25[3] = &unk_24C6AF9F0;
  v25[4] = self;
  v26 = v14;
  v27 = v15;
  v28 = v16;
  v29 = v17;
  v30 = &v33;
  v31 = a4;
  v32 = a8;
  v19 = v17;
  v20 = v16;
  v21 = v15;
  v22 = v14;
  dispatch_sync(dispatchQueue, v25);
  v23 = (id)v34[5];

  _Block_object_dispose(&v33, 8);
  return v23;
}

void __121__RKMessageResponseManager_responsesForMessage_maximumResponses_recipientID_forConversationHistory_withLanguage_options___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "responsesForMessageImp:maximumResponses:forRecipientID:forConversationHistory:forContext:withLanguage:options:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0, *(_QWORD *)(a1 + 64), RKMessageResponseDontOverrideLanguageID | *(_QWORD *)(a1 + 88));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)responsesForMessageWithLanguageDetection:(id)a3 maximumResponses:(unint64_t)a4 forConversationHistory:(id)a5 forContext:(id)a6 withLanguage:(id *)a7 options:(unint64_t)a8 completionBlock:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *dispatchQueue;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD *v29;
  unint64_t v30;
  unint64_t v31;
  _QWORD v32[5];
  id v33;

  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a9;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__2;
  v32[4] = __Block_byref_object_dispose__2;
  v33 = *a7;
  dispatchQueue = self->_dispatchQueue;
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __157__RKMessageResponseManager_responsesForMessageWithLanguageDetection_maximumResponses_forConversationHistory_forContext_withLanguage_options_completionBlock___block_invoke;
  v24[3] = &unk_24C6AFA18;
  v24[4] = self;
  v25 = v15;
  v26 = v16;
  v27 = v17;
  v30 = a4;
  v31 = a8;
  v28 = v18;
  v29 = v32;
  v20 = v18;
  v21 = v17;
  v22 = v16;
  v23 = v15;
  dispatch_async(dispatchQueue, v24);

  _Block_object_dispose(v32, 8);
}

void __157__RKMessageResponseManager_responsesForMessageWithLanguageDetection_maximumResponses_forConversationHistory_forContext_withLanguage_options_completionBlock___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = a1[7];
  v6 = a1[10];
  v7 = *(_QWORD *)(a1[9] + 8);
  obj = *(id *)(v7 + 40);
  objc_msgSend(v2, "responsesForMessageWithLanguageDetectionImp:maximumResponses:forRecipientID:forConversationHistory:forContext:withLanguage:inputModes:options:", v3, v6, 0, v4, v5, &obj, 0, a1[11]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v7 + 40), obj);
  (*(void (**)(void))(a1[8] + 16))();

}

- (id)responsesForMessage:(id)a3 maximumResponses:(unint64_t)a4 forContext:(id)a5 withLanguage:(id)a6 options:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *dispatchQueue;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v21[5];
  id v22;
  id v23;
  uint64_t *v24;
  _QWORD *v25;
  _QWORD *v26;
  unint64_t v27;
  unint64_t v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[5];
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__2;
  v37 = __Block_byref_object_dispose__2;
  v38 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__2;
  v31[4] = __Block_byref_object_dispose__2;
  v32 = v14;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__2;
  v29[4] = __Block_byref_object_dispose__2;
  v30 = 0;
  dispatchQueue = self->_dispatchQueue;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __97__RKMessageResponseManager_responsesForMessage_maximumResponses_forContext_withLanguage_options___block_invoke;
  v21[3] = &unk_24C6AFA40;
  v21[4] = self;
  v22 = v12;
  v23 = v13;
  v24 = &v33;
  v25 = v29;
  v26 = v31;
  v27 = a4;
  v28 = a7;
  v16 = v13;
  v17 = v12;
  v18 = v14;
  dispatch_sync(dispatchQueue, v21);
  v19 = (id)v34[5];

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v31, 8);

  _Block_object_dispose(&v33, 8);
  return v19;
}

void __97__RKMessageResponseManager_responsesForMessage_maximumResponses_forContext_withLanguage_options___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40);
  v6 = *(_QWORD *)(a1[9] + 8);
  obj = *(id *)(v6 + 40);
  objc_msgSend(v2, "responsesForMessageWithLanguageDetectionImp:maximumResponses:forRecipientID:forConversationHistory:forContext:withLanguage:inputModes:options:", v3, a1[10], 0, v5, v4, &obj, 0, RKMessageResponseDontOverrideLanguageID | a1[11]);
  v7 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v6 + 40), obj);
  v8 = *(_QWORD *)(a1[7] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (id)responsesForMessage:(id)a3 maximumResponses:(unint64_t)a4 forConversationHistory:(id)a5 withLanguage:(id)a6 options:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *dispatchQueue;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[5];
  id v22;
  id v23;
  uint64_t *v24;
  _QWORD *v25;
  unint64_t v26;
  unint64_t v27;
  _QWORD v28[5];
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__2;
  v34 = __Block_byref_object_dispose__2;
  v35 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__2;
  v28[4] = __Block_byref_object_dispose__2;
  v29 = v14;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __109__RKMessageResponseManager_responsesForMessage_maximumResponses_forConversationHistory_withLanguage_options___block_invoke;
  block[3] = &unk_24C6AFA68;
  block[4] = self;
  v22 = v12;
  v23 = v13;
  v24 = &v30;
  v25 = v28;
  v26 = a4;
  v27 = a7;
  v16 = v13;
  v17 = v12;
  v18 = v14;
  dispatch_sync(dispatchQueue, block);
  v19 = (id)v31[5];

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(&v30, 8);

  return v19;
}

void __109__RKMessageResponseManager_responsesForMessage_maximumResponses_forConversationHistory_withLanguage_options___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = a1[9];
  v6 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v6 + 40);
  objc_msgSend(v2, "responsesForMessageWithLanguageDetectionImp:maximumResponses:forRecipientID:forConversationHistory:forContext:withLanguage:inputModes:options:", v3, v5, 0, v4, 0, &obj, 0, RKMessageResponseDontOverrideLanguageID | a1[10]);
  v7 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v6 + 40), obj);
  v8 = *(_QWORD *)(a1[7] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (id)responsesForMessage:(id)a3 maximumResponses:(unint64_t)a4 forConversationHistory:(id)a5 withLanguage:(id)a6 inputModes:(id)a7 options:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *dispatchQueue;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  uint64_t *v29;
  _QWORD *v30;
  unint64_t v31;
  unint64_t v32;
  _QWORD v33[5];
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__2;
  v39 = __Block_byref_object_dispose__2;
  v40 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__2;
  v33[4] = __Block_byref_object_dispose__2;
  v34 = v16;
  dispatchQueue = self->_dispatchQueue;
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __120__RKMessageResponseManager_responsesForMessage_maximumResponses_forConversationHistory_withLanguage_inputModes_options___block_invoke;
  v25[3] = &unk_24C6AFA90;
  v25[4] = self;
  v26 = v14;
  v29 = &v35;
  v30 = v33;
  v27 = v15;
  v28 = v17;
  v31 = a4;
  v32 = a8;
  v19 = v17;
  v20 = v15;
  v21 = v14;
  v22 = v16;
  dispatch_sync(dispatchQueue, v25);
  v23 = (id)v36[5];

  _Block_object_dispose(v33, 8);
  _Block_object_dispose(&v35, 8);

  return v23;
}

void __120__RKMessageResponseManager_responsesForMessage_maximumResponses_forConversationHistory_withLanguage_inputModes_options___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = a1[10];
  v6 = *(_QWORD *)(a1[9] + 8);
  obj = *(id *)(v6 + 40);
  objc_msgSend(v2, "responsesForMessageWithLanguageDetectionImp:maximumResponses:forRecipientID:forConversationHistory:forContext:withLanguage:inputModes:options:", v3, v5, 0, v4, 0, &obj, a1[7], RKMessageResponseDontOverrideLanguageID | a1[11]);
  v7 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v6 + 40), obj);
  v8 = *(_QWORD *)(a1[8] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (id)responsesForMessageWithLanguageDetection:(id)a3 maximumResponses:(unint64_t)a4 forConversationHistory:(id)a5 forContext:(id)a6 withLanguage:(id *)a7 options:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  NSObject *dispatchQueue;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  uint64_t *v27;
  unint64_t v28;
  id *v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__2;
  v35 = __Block_byref_object_dispose__2;
  v36 = 0;
  dispatchQueue = self->_dispatchQueue;
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __141__RKMessageResponseManager_responsesForMessageWithLanguageDetection_maximumResponses_forConversationHistory_forContext_withLanguage_options___block_invoke;
  v23[3] = &unk_24C6AFAB8;
  v23[4] = self;
  v24 = v14;
  v27 = &v31;
  v28 = a4;
  v25 = v15;
  v26 = v16;
  v29 = a7;
  v30 = a8;
  v18 = v16;
  v19 = v15;
  v20 = v14;
  dispatch_sync(dispatchQueue, v23);
  v21 = (id)v32[5];

  _Block_object_dispose(&v31, 8);
  return v21;
}

void __141__RKMessageResponseManager_responsesForMessageWithLanguageDetection_maximumResponses_forConversationHistory_forContext_withLanguage_options___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "responsesForMessageWithLanguageDetectionImp:maximumResponses:forRecipientID:forConversationHistory:forContext:withLanguage:inputModes:options:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), 0, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 80), 0, *(_QWORD *)(a1 + 88));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)responsesForMessageImp:(id)a3 maximumResponses:(unint64_t)a4 forRecipientID:(id)a5 forConversationHistory:(id)a6 forContext:(id)a7 withLanguage:(id)a8 options:(unint64_t)a9
{
  unint64_t v15;
  id v16;
  void *v17;
  id v18;
  id v20;

  v20 = a8;
  v15 = RKMessageResponseDontOverrideLanguageID | a9;
  v16 = a8;
  -[RKMessageResponseManager responsesForMessageWithLanguageDetectionImp:maximumResponses:forRecipientID:forConversationHistory:forContext:withLanguage:inputModes:options:](self, "responsesForMessageWithLanguageDetectionImp:maximumResponses:forRecipientID:forConversationHistory:forContext:withLanguage:inputModes:options:", a3, a4, a5, a6, a7, &v20, 0, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v20;

  return v17;
}

- (id)responseWithAttributesMatchingProactiveGrammarForMessage:(id)a3 languageID:(id)a4 kbdInputModes:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *dispatchQueue;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v18;
  id v19;
  uint64_t *v20;
  _QWORD *v21;
  _QWORD v22[5];
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__2;
  v28 = __Block_byref_object_dispose__2;
  v29 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__2;
  v22[4] = __Block_byref_object_dispose__2;
  v23 = v9;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __110__RKMessageResponseManager_responseWithAttributesMatchingProactiveGrammarForMessage_languageID_kbdInputModes___block_invoke;
  block[3] = &unk_24C6AFAE0;
  block[4] = self;
  v18 = v8;
  v20 = &v24;
  v21 = v22;
  v19 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_sync(dispatchQueue, block);
  v15 = (id)v25[5];

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(&v24, 8);

  return v15;
}

void __110__RKMessageResponseManager_responseWithAttributesMatchingProactiveGrammarForMessage_languageID_kbdInputModes___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v5 + 40);
  objc_msgSend(v2, "responseWithAttributesMatchingProactiveGrammarForMessageImp:languageID:kbdInputModes:", v3, &obj, v4);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), obj);
  v7 = *(_QWORD *)(a1[7] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (void)responseWithAttributesMatchingProactiveGrammarForMessage:(id)a3 languageID:(id)a4 kbdInputModes:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *dispatchQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  _QWORD *v23;
  _QWORD v24[5];
  id v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__2;
  v24[4] = __Block_byref_object_dispose__2;
  v25 = v11;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __126__RKMessageResponseManager_responseWithAttributesMatchingProactiveGrammarForMessage_languageID_kbdInputModes_completionBlock___block_invoke;
  block[3] = &unk_24C6AFB08;
  block[4] = self;
  v20 = v10;
  v22 = v13;
  v23 = v24;
  v21 = v12;
  v15 = v13;
  v16 = v12;
  v17 = v10;
  v18 = v11;
  dispatch_async(dispatchQueue, block);

  _Block_object_dispose(v24, 8);
}

void __126__RKMessageResponseManager_responseWithAttributesMatchingProactiveGrammarForMessage_languageID_kbdInputModes_completionBlock___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v5 + 40);
  objc_msgSend(v2, "responseWithAttributesMatchingProactiveGrammarForMessageImp:languageID:kbdInputModes:", v3, &obj, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), obj);
  (*(void (**)(void))(a1[7] + 16))();

}

- (id)responseWithAttributesMatchingProactiveGrammarForMessageImp:(id)a3 languageID:(id *)a4 kbdInputModes:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  RKResponse *v12;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  RKResponse *j;
  uint64_t v26;
  void *v27;
  RKResponse *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  v8 = (void *)MEMORY[0x24BDD14A8];
  v9 = a3;
  objc_msgSend(v8, "whitespaceCharacterSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "length")
    && (unint64_t)objc_msgSend(v11, "length") <= 0x800
    && !+[RKUtilities RKRepairStringNeeded:](RKUtilities, "RKRepairStringNeeded:", v11))
  {
    v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    +[RKUtilities canonicalLanguageAndScriptCodeIdentifierForIdentifier:](RKUtilities, "canonicalLanguageAndScriptCodeIdentifierForIdentifier:", *a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v15);

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v16 = v7;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v35 != v19)
            objc_enumerationMutation(v16);
          +[RKUtilities canonicalLanguageAndScriptCodeIdentifierForIdentifier:](RKUtilities, "canonicalLanguageAndScriptCodeIdentifierForIdentifier:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v14, "containsObject:", v21) & 1) == 0)
            objc_msgSend(v14, "addObject:", v21);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v18);
    }

    +[RKProactiveGrammar sharedManager](RKProactiveGrammar, "sharedManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v23 = v14;
    v12 = (RKResponse *)objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v12)
    {
      v24 = *(_QWORD *)v31;
      while (2)
      {
        for (j = 0; j != v12; j = (RKResponse *)((char *)j + 1))
        {
          if (*(_QWORD *)v31 != v24)
            objc_enumerationMutation(v23);
          v26 = objc_msgSend(v22, "copyAttributedTokenForText:forLanguage:", v11, *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)j), (_QWORD)v30);
          if (v26)
          {
            v27 = (void *)v26;
            v28 = [RKResponse alloc];
            RKLinguisticCategoryToPreferenceKey(43);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = -[RKResponse initWithString:attributes:category:](v28, "initWithString:attributes:category:", 0, v27, v29);

            goto LABEL_25;
          }
        }
        v12 = (RKResponse *)objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        if (v12)
          continue;
        break;
      }
    }
LABEL_25:

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)responsesForMessageWithLanguageDetectionImp:(id)a3 maximumResponses:(unint64_t)a4 forRecipientID:(id)a5 forConversationHistory:(id)a6 forContext:(id)a7 withLanguage:(id *)a8 inputModes:(id)a9 options:(unint64_t)a10
{
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  RKResponse *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  unint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  id v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  char v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  RKRankLearner *v65;
  RKRankLearner *rankLearner;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  uint64_t v84;
  int v85;
  void *v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t i;
  uint64_t v92;
  void *v93;
  NSObject *v94;
  id v95;
  void *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t j;
  RKResponse *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  char v110;
  uint64_t v111;
  uint64_t v112;
  int IntentType;
  void *v114;
  double v115;
  char v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  RKResponse *v127;
  void *v128;
  void *v129;
  void *v130;
  NSObject *v131;
  id v132;
  NSObject *v133;
  const char *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  int v145;
  NSObject *v146;
  id v147;
  void *v148;
  void *v149;
  uint64_t v150;
  void *v151;
  const __CFString *v152;
  void *v153;
  NSObject *v154;
  id v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  id v162;
  NSObject *v163;
  id v164;
  NSObject *v166;
  id v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  id *v178;
  void *v179;
  id v180;
  void *v181;
  id v182;
  RKMessageResponseManager *v183;
  void *v184;
  void *v185;
  id v186;
  id v187;
  id obj;
  void *v189;
  void *v190;
  int v191;
  void *v192;
  uint64_t v193;
  void *v194;
  uint64_t v195;
  void *v196;
  id v197;
  RKResponse *v198;
  void *v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  _QWORD v212[4];
  id v213;
  _QWORD v214[4];
  id v215;
  _QWORD v216[4];
  id v217;
  _QWORD v218[4];
  id v219;
  uint8_t buf[4];
  void *v221;
  __int16 v222;
  void *v223;
  __int16 v224;
  uint64_t v225;
  __int16 v226;
  const __CFString *v227;
  _BYTE v228[128];
  _BYTE v229[128];
  _BYTE v230[128];
  _QWORD v231[4];

  v231[1] = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v186 = a5;
  v17 = a6;
  v18 = a7;
  v187 = a9;
  objc_msgSend((id)objc_opt_class(), "_chronologicalConversationHistory:", v17);
  v19 = objc_claimAutoreleasedReturnValue();
  v191 = objc_msgSend((id)objc_opt_class(), "_needsMirroredAnalysisForMessage:forChronologicalConversationHistory:", v16, v19);
  v183 = self;
  v184 = (void *)v19;
  if (!objc_msgSend(v16, "length"))
  {
    objc_msgSend((id)objc_opt_class(), "_mostRecentTextFromChronologicalConversationHistory:", v19);
    v20 = v18;
    v21 = objc_claimAutoreleasedReturnValue();

    v16 = (id)v21;
    v18 = v20;
  }
  v185 = v17;
  if (!+[RKUtilities RKRepairStringNeeded:](RKUtilities, "RKRepairStringNeeded:", v16))
  {
    v182 = v18;
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringByTrimmingCharactersInSet:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "stringByReplacingOccurrencesOfString:withString:", CFSTR("‘"), &stru_24C6B9E08);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "stringByReplacingOccurrencesOfString:withString:", CFSTR("’"), &stru_24C6B9E08);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "stringByReplacingOccurrencesOfString:withString:", CFSTR("'"), &stru_24C6B9E08);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v27, "length") > 0x800)
    {
      v22 = 0;
      v18 = v182;
      v16 = v27;
      goto LABEL_7;
    }
    if (!a4)
      a4 = 0x7FFFFFFFLL;
    v29 = a8;
    v30 = (void *)objc_msgSend(v17, "mutableCopy");
    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("timestamp"), 0);
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    v231[0] = v179;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v231, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "sortUsingDescriptors:", v31);

    -[RKMessageResponseManager preferredLanguages](self, "preferredLanguages");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[RKMessageClassifier setPreferredLanguages:](RKMessageClassifier, "setPreferredLanguages:", v32);

    v178 = v29;
    v190 = v27;
    v181 = v30;
    +[RKMessageClassifier messageClassification:withLanguageIdentifier:conversationTurns:](RKMessageClassifier, "messageClassification:withLanguageIdentifier:conversationTurns:", v27, *v29, v30);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "language");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v192 = v33;
    if (!v34)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
        -[RKMessageResponseManager responsesForMessageWithLanguageDetectionImp:maximumResponses:forRecipientID:forConversationHistory:forContext:withLanguage:inputModes:options:].cold.1();
      v22 = 0;
      v18 = v182;
      v16 = v27;
      v28 = v184;
      v44 = v33;
      goto LABEL_153;
    }
    RKLinguisticCategoryToPreferenceKey(objc_msgSend(v33, "sentenceType"));
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "language");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[RKCoreAnalytics sendCoreAnalyticsEvent:forAction:withLanguageID:](RKCoreAnalytics, "sendCoreAnalyticsEvent:forAction:withLanguageID:", 0, CFSTR("triggered"), v35);

    if ((RKMessageResponseDontOverrideLanguageID & a10) == 0)
    {
      objc_msgSend(v192, "language");
      *v29 = (id)objc_claimAutoreleasedReturnValue();
    }
    if ((a10 & 0x200) != 0)
    {
      +[RKResponseCollection responsesForFullScreenMoments:](RKResponseCollection, "responsesForFullScreenMoments:", v27);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      if (v36 && objc_msgSend(v36, "count"))
      {
        objc_msgSend(v36, "objectAtIndexedSubscript:", 0);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectForKey:", CFSTR("subtype"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        RKLinguisticCategoryForFSMType(v38);
        v39 = objc_claimAutoreleasedReturnValue();

        v40 = [RKResponse alloc];
        obj = v36;
        objc_msgSend(v36, "objectAtIndexedSubscript:", 0);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = -[RKResponse initWithString:attributes:category:](v40, "initWithString:attributes:category:", 0, v41, v39);

        v43 = (void *)v39;
        v177 = (void *)v42;
        objc_msgSend(v22, "insertObject:atIndex:", v42, 0);
        v44 = v192;
        objc_msgSend(v192, "language");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        +[RKCoreAnalytics sendCoreAnalyticsEvent:forAction:withLanguageID:](RKCoreAnalytics, "sendCoreAnalyticsEvent:forAction:withLanguageID:", v43, CFSTR("triggered"), v45);
        v18 = v182;
        v16 = v27;
        v28 = v184;
LABEL_152:

LABEL_153:
        goto LABEL_154;
      }

    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if ((a10 & 1) == 0)
    {
      objc_msgSend(v192, "customResponses");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "count");

      if (v48)
      {
        if (objc_msgSend(v192, "sentenceType") != 6
          || (objc_msgSend(v192, "customResponses"),
              v49 = (void *)objc_claimAutoreleasedReturnValue(),
              v50 = objc_msgSend(v49, "count"),
              v49,
              v50 <= a4))
        {
          objc_msgSend(v192, "customResponses");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "addObjectsFromArray:", v51);

          if (objc_msgSend(v46, "count") > a4)
          {
            objc_msgSend(v46, "subarrayWithRange:", 0, a4);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = objc_msgSend(v52, "mutableCopy");

            v46 = (void *)v53;
          }
          a4 -= objc_msgSend(v46, "count");
        }
      }
    }
    v54 = (void *)MEMORY[0x24BDBCEA0];
    if (*v29)
    {
      objc_msgSend(MEMORY[0x24BDBCEA0], "canonicalLanguageIdentifierFromString:");
      v55 = (id)objc_claimAutoreleasedReturnValue();
      v180 = v55;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
      v55 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "localeIdentifier");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "canonicalLanguageIdentifierFromString:", v56);
      v180 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v192, "language");
    v57 = objc_claimAutoreleasedReturnValue();
    if (v57)
    {
      v58 = (void *)v57;
      objc_msgSend(v192, "language");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v59, "isEqualToString:", CFSTR("und"));

      if ((v60 & 1) == 0)
      {
        objc_msgSend(v192, "language");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        +[RKUtilities canonicalLanguageAndScriptCodeIdentifierForIdentifier:](RKUtilities, "canonicalLanguageAndScriptCodeIdentifierForIdentifier:", v61);
        v62 = (void *)objc_claimAutoreleasedReturnValue();

        +[RKUtilities canonicalLanguageAndScriptCodeIdentifierForIdentifier:](RKUtilities, "canonicalLanguageAndScriptCodeIdentifierForIdentifier:", v180);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v62, "isEqualToString:", v63) & 1) == 0)
        {
          objc_msgSend(v192, "language");
          v64 = objc_claimAutoreleasedReturnValue();

          v180 = (id)v64;
        }

      }
    }
    if (a4)
    {
      if (-[RKMessageResponseManager usePersonalizedRanking](self, "usePersonalizedRanking"))
      {
        -[RKMessageResponseManager getRankLearner](self, "getRankLearner");
        v65 = (RKRankLearner *)objc_claimAutoreleasedReturnValue();
        rankLearner = self->_rankLearner;
        self->_rankLearner = v65;

        v67 = v192;
        if (objc_msgSend(v192, "sentenceType") == 1)
          objc_msgSend(v192, "setSentenceType:", 2);
        -[RKMessageResponseManager rankLearner](v183, "rankLearner");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        RKLinguisticCategoryToPreferenceKey(objc_msgSend(v192, "sentenceType"));
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v192, "language");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "getRankedResponses:forRecipientID:withLanguageID:", v69, v186, v70);
        v177 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v177 = 0;
        v67 = v192;
      }
      if (objc_msgSend(v67, "sentenceType") != 6)
      {
        -[RKMessageResponseManager collection](v183, "collection");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "responsesForCategory:gender:maximumResponses:withLanguage:context:options:", objc_msgSend(v67, "sentenceType"), objc_msgSend(v67, "gender"), a4, v180, v182, a10);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "addObjectsFromArray:", v72);

      }
    }
    else
    {
      v177 = 0;
    }
    v73 = MEMORY[0x24BDAC760];
    if ((a10 & 0x40) != 0)
    {
      v218[0] = MEMORY[0x24BDAC760];
      v218[1] = 3221225472;
      v218[2] = __170__RKMessageResponseManager_responsesForMessageWithLanguageDetectionImp_maximumResponses_forRecipientID_forConversationHistory_forContext_withLanguage_inputModes_options___block_invoke;
      v218[3] = &unk_24C6AF180;
      v219 = v46;
      objc_msgSend(v219, "enumerateObjectsUsingBlock:", v218);

    }
    if ((a10 & 0x80) == 0)
    {
      v216[0] = v73;
      v216[1] = 3221225472;
      v216[2] = __170__RKMessageResponseManager_responsesForMessageWithLanguageDetectionImp_maximumResponses_forRecipientID_forConversationHistory_forContext_withLanguage_inputModes_options___block_invoke_2;
      v216[3] = &unk_24C6AF180;
      v217 = v46;
      objc_msgSend(v217, "enumerateObjectsUsingBlock:", v216);

    }
    if (objc_msgSend(v192, "sentenceType") == 6)
    {
      if (responsesForMessageWithLanguageDetectionImp_maximumResponses_forRecipientID_forConversationHistory_forContext_withLanguage_inputModes_options__onceToken != -1)
        dispatch_once(&responsesForMessageWithLanguageDetectionImp_maximumResponses_forRecipientID_forConversationHistory_forContext_withLanguage_inputModes_options__onceToken, &__block_literal_global_152);
      v214[0] = v73;
      v214[1] = 3221225472;
      v214[2] = __170__RKMessageResponseManager_responsesForMessageWithLanguageDetectionImp_maximumResponses_forRecipientID_forConversationHistory_forContext_withLanguage_inputModes_options___block_invoke_6;
      v214[3] = &unk_24C6AF180;
      v215 = v46;
      objc_msgSend(v215, "enumerateObjectsUsingBlock:", v214);

    }
    if ((a10 & 0x20) == 0)
    {
      v212[0] = v73;
      v212[1] = 3221225472;
      v212[2] = __170__RKMessageResponseManager_responsesForMessageWithLanguageDetectionImp_maximumResponses_forRecipientID_forConversationHistory_forContext_withLanguage_inputModes_options___block_invoke_8;
      v212[3] = &unk_24C6AF180;
      v213 = v46;
      objc_msgSend(v213, "enumerateObjectsUsingBlock:", v212);

    }
    if (objc_msgSend(v192, "isSensitive"))
    {

      v46 = 0;
    }
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "synchronize");
    v176 = v74;
    if (objc_msgSend(v74, "BOOLForKey:", CFSTR("RKSuppressGeneralStatementResponse"))
      && (!objc_msgSend(v192, "sentenceType") || objc_msgSend(v192, "sentenceType") == 31))
    {

      v46 = 0;
    }
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v190;
    objc_msgSend(v190, "stringByTrimmingCharactersInSet:", v75);
    v76 = objc_claimAutoreleasedReturnValue();

    -[RKMessageResponseManager collection](v183, "collection");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "responsesForCategory:gender:maximumResponses:withLanguage:context:options:", objc_msgSend(v192, "sentenceType"), objc_msgSend(v192, "gender"), a4, v180, v182, a10 & 0xFFFFFFFFFFFFFFE0 | 0xF);
    v78 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("SELF CONTAINS[c] %@"), v76);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v174 = v78;
    objc_msgSend(v78, "filteredArrayUsingPredicate:", v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = objc_msgSend(v80, "count");

    v175 = (void *)v76;
    if (v81)
    {
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("NOT (SELF CONTAINS[c] %@)"), v76);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "filteredArrayUsingPredicate:", v82);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = objc_msgSend(v83, "mutableCopy");

      v46 = (void *)v84;
    }
    v85 = v191;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v208 = 0u;
    v209 = 0u;
    v210 = 0u;
    v211 = 0u;
    v87 = v46;
    v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v208, v230, 16);
    if (v88)
    {
      v89 = v88;
      v90 = *(_QWORD *)v209;
      do
      {
        for (i = 0; i != v89; ++i)
        {
          if (*(_QWORD *)v209 != v90)
            objc_enumerationMutation(v87);
          v92 = *(_QWORD *)(*((_QWORD *)&v208 + 1) + 8 * i);
          if ((objc_msgSend(v86, "containsObject:", v92) & 1) == 0)
            objc_msgSend(v86, "addObject:", v92);
        }
        v89 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v208, v230, 16);
      }
      while (v89);
    }

    v93 = (void *)objc_msgSend(v86, "copy");
    if (!objc_msgSend(v93, "count"))
    {

      v93 = 0;
    }
    v44 = v192;
    v173 = v86;
    if (objc_msgSend(v93, "count"))
    {
      v94 = MEMORY[0x24BDACB70];
      v95 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20D3BA000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Non-intent based responses have been sunset.", buf, 2u);
      }

      obj = 0;
      v96 = 0;
      v93 = 0;
      if ((a10 & 0x200) != 0)
        goto LABEL_91;
    }
    else if ((a10 & 0x200) != 0)
    {
      if (v93)
      {
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        v204 = 0u;
        v205 = 0u;
        v206 = 0u;
        v207 = 0u;
        obj = v93;
        v99 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v204, v229, 16);
        if (v99)
        {
          v100 = v99;
          v101 = *(_QWORD *)v205;
          do
          {
            for (j = 0; j != v100; ++j)
            {
              if (*(_QWORD *)v205 != v101)
                objc_enumerationMutation(obj);
              v103 = -[RKResponse initWithString:attributes:category:]([RKResponse alloc], "initWithString:attributes:category:", *(_QWORD *)(*((_QWORD *)&v204 + 1) + 8 * j), 0, v189);
              objc_msgSend(v98, "addObject:", v103);

            }
            v100 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v204, v229, 16);
          }
          while (v100);
        }

        v44 = v192;
        v96 = v98;
      }
      else
      {
        obj = 0;
        v96 = 0;
      }
LABEL_91:
      v104 = (void *)objc_opt_new();
      RKLinguisticCategoryToPreferenceKey(objc_msgSend(v44, "sentenceType"));
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "setObject:forKey:");
      +[RKMessageIntentRecognizer sharedManager](RKMessageIntentRecognizer, "sharedManager");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "language");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      v170 = v105;
      v171 = v104;
      v107 = (void *)objc_msgSend(v105, "copyAttributedTokensForMessage:conversationTurns:metadata:languageID:", v190, v181, v104, v106);

      if (objc_msgSend(v107, "count") && !v96)
        v96 = (void *)objc_opt_new();
      v202 = 0u;
      v203 = 0u;
      v200 = 0u;
      v201 = 0u;
      v197 = v107;
      v108 = objc_msgSend(v197, "countByEnumeratingWithState:objects:count:", &v200, v228, 16);
      if (v108)
      {
        v109 = v108;
        v110 = 0;
        v111 = *(_QWORD *)v201;
        v193 = *(_QWORD *)v201;
        do
        {
          v112 = 0;
          v195 = v109;
          do
          {
            if (*(_QWORD *)v201 != v111)
              objc_enumerationMutation(v197);
            IntentType = NLMessageIntentCandidateGetIntentType();
            v114 = (void *)NLMessageIntentCandidateCopyAttributes();
            NLMessageIntentCandidateGetScore();
            if (v115 >= 0.5 && IntentType == 1)
              v117 = v85;
            else
              v117 = 1;
            if ((v117 & 1) == 0)
            {
              v118 = (void *)objc_opt_new();
              objc_msgSend(v118, "setObject:forKey:", CFSTR("photosharing"), CFSTR("type"));
              objc_msgSend(v114, "objectForKey:", *MEMORY[0x24BE6B278]);
              v119 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v119, "componentsSeparatedByString:", CFSTR(","));
              v120 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v118, "setObject:forKey:", v120, CFSTR("keywords"));
              +[RKMessageIntentRecognizer getRangesOfKeywords:forMessage:](RKMessageIntentRecognizer, "getRangesOfKeywords:forMessage:", v120, v16);
              v121 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v121, "count"))
              {
                objc_msgSend(v118, "setObject:forKey:", v121, CFSTR("keywordranges"));
                objc_msgSend(v118, "setObject:forKey:", v16, CFSTR("message"));
                RKLinguisticCategoryToPreferenceKey(45);
                v122 = (void *)objc_claimAutoreleasedReturnValue();
                v198 = -[RKResponse initWithString:attributes:category:]([RKResponse alloc], "initWithString:attributes:category:", 0, v118, v122);
                objc_msgSend(v192, "language");
                v123 = (void *)objc_claimAutoreleasedReturnValue();
                +[RKCoreAnalytics sendCoreAnalyticsEvent:forAction:withLanguageID:](RKCoreAnalytics, "sendCoreAnalyticsEvent:forAction:withLanguageID:", v122, CFSTR("triggered"), v123);

                objc_msgSend(v96, "insertObject:atIndex:", v198, 0);
                v16 = v190;

                v85 = v191;
                v110 = 1;
              }

              v111 = v193;
              v109 = v195;
            }

            ++v112;
          }
          while (v109 != v112);
          v109 = objc_msgSend(v197, "countByEnumeratingWithState:objects:count:", &v200, v228, 16);
        }
        while (v109);
      }
      else
      {
        v110 = 0;
      }

      +[RKPaymentIdentifier sharedManager](RKPaymentIdentifier, "sharedManager");
      v196 = (void *)objc_claimAutoreleasedReturnValue();
      v124 = objc_msgSend(v196, "copyAttributedTokensForText:", v16);
      v194 = (void *)v124;
      if (v124)
      {
        v125 = v124;
        RKLinguisticCategoryToPreferenceKey(44);
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        v127 = -[RKResponse initWithString:attributes:category:]([RKResponse alloc], "initWithString:attributes:category:", 0, v125, v126);
        if (!v96)
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v192, "language");
        v128 = v96;
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        +[RKCoreAnalytics sendCoreAnalyticsEvent:forAction:withLanguageID:](RKCoreAnalytics, "sendCoreAnalyticsEvent:forAction:withLanguageID:", v126, CFSTR("triggered"), v129);

        v96 = v128;
        objc_msgSend(v128, "insertObject:atIndex:", v127, 0);

      }
      else
      {
        if ((v110 & 1) != 0)
        {
          v199 = v96;
          goto LABEL_121;
        }
        objc_msgSend(v192, "language");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        +[RKCoreAnalytics sendCoreAnalyticsEvent:forAction:withLanguageID:](RKCoreAnalytics, "sendCoreAnalyticsEvent:forAction:withLanguageID:", v172, CFSTR("triggered"), v126);
      }
      v199 = v96;

LABEL_121:
      v28 = v184;
      v43 = v180;
      -[RKMessageResponseManager responseWithAttributesMatchingProactiveGrammarForMessageImp:languageID:kbdInputModes:](v183, "responseWithAttributesMatchingProactiveGrammarForMessageImp:languageID:kbdInputModes:", v16, v178, v187);
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend((id)objc_opt_class(), "_responseLooksLikeIncomingCheckInResponse:", v130))
      {
        if (v85)
        {
          v131 = MEMORY[0x24BDACB70];
          v132 = MEMORY[0x24BDACB70];
          v44 = v192;
          if (os_log_type_enabled(v131, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            v133 = MEMORY[0x24BDACB70];
            v134 = "Incoming check-in response is not valid for outgoing messages";
LABEL_147:
            _os_log_impl(&dword_20D3BA000, v133, OS_LOG_TYPE_INFO, v134, buf, 2u);
            goto LABEL_148;
          }
          goto LABEL_148;
        }
        objc_msgSend(v130, "attributes");
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        v136 = (void *)objc_msgSend(v140, "mutableCopy");

        v141 = (void *)objc_msgSend(CFSTR("event"), "copy");
        objc_msgSend(v136, "setObject:forKeyedSubscript:", v141, CFSTR("type"));

        v142 = (void *)objc_msgSend(CFSTR("traveling home"), "copy");
        objc_msgSend(v136, "setObject:forKeyedSubscript:", v142, CFSTR("subtype"));

        objc_msgSend(v136, "setObject:forKeyedSubscript:", 0, CFSTR("request"));
        v139 = (void *)objc_msgSend(v136, "copy");
        objc_msgSend(v130, "setAttributes:", v139);
        v44 = v192;
      }
      else if (objc_msgSend((id)objc_opt_class(), "_responseLooksLikeOutgoingCheckInResponse:", v130))
      {
        v44 = v192;
        if ((v85 & 1) == 0)
        {
          v163 = MEMORY[0x24BDACB70];
          v164 = MEMORY[0x24BDACB70];
          if (os_log_type_enabled(v163, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            v133 = MEMORY[0x24BDACB70];
            v134 = "Outgoing check-in response is not valid for incoming messages";
            goto LABEL_147;
          }
LABEL_148:

          v22 = 0;
          v18 = v182;
          v97 = v175;
          v45 = v176;
LABEL_149:
          v162 = v199;
LABEL_150:

          goto LABEL_151;
        }
        objc_msgSend(v130, "attributes");
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        v136 = (void *)objc_msgSend(v135, "mutableCopy");

        v137 = (void *)objc_msgSend(CFSTR("event"), "copy");
        objc_msgSend(v136, "setObject:forKeyedSubscript:", v137, CFSTR("type"));

        v138 = (void *)objc_msgSend(CFSTR("traveling home"), "copy");
        objc_msgSend(v136, "setObject:forKeyedSubscript:", v138, CFSTR("subtype"));

        objc_msgSend(v136, "setObject:forKeyedSubscript:", 0, CFSTR("request"));
        v139 = (void *)objc_msgSend(v136, "copy");
        objc_msgSend(v130, "setAttributes:", v139);
      }
      else
      {
        if (!v85)
        {
          v44 = v192;
          if (objc_msgSend((id)objc_opt_class(), "_responseTypeIsSunsetted:", v130))
          {
            v166 = MEMORY[0x24BDACB70];
            v167 = MEMORY[0x24BDACB70];
            v97 = v175;
            v45 = v176;
            if (os_log_type_enabled(v166, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v130, "attributes");
              v168 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v168, "objectForKeyedSubscript:", CFSTR("type"));
              v169 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v221 = v169;
              _os_log_impl(&dword_20D3BA000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Responses of this type (%@) have been sunsetted", buf, 0xCu);

              v43 = v180;
            }

            v22 = 0;
            v18 = v182;
            goto LABEL_149;
          }
          v18 = v182;
LABEL_130:
          v97 = v175;
          v45 = v176;
          if (v130)
          {
            v143 = v199;
            if (!v199)
            {
              objc_msgSend(MEMORY[0x24BDBCEB8], "array");
              v143 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v143, "insertObject:atIndex:", v130, 0);
          }
          else
          {
            v143 = v199;
          }
          v162 = v143;
          v22 = v162;
          goto LABEL_150;
        }
        objc_msgSend(v130, "attributes");
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        v136 = (void *)objc_msgSend(v144, "copy");

        v145 = objc_msgSend((id)objc_opt_class(), "_isMirroredResponseValidForResponse:", v130);
        v146 = MEMORY[0x24BDACB70];
        v147 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v146, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v136, "objectForKeyedSubscript:", CFSTR("type"));
          v148 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v136, "objectForKeyedSubscript:", CFSTR("subtype"));
          v149 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v136, "objectForKeyedSubscript:", CFSTR("field"));
          v150 = objc_claimAutoreleasedReturnValue();
          v151 = (void *)v150;
          v152 = CFSTR("No");
          *(_DWORD *)buf = 138413058;
          v221 = v148;
          if (v145)
            v152 = CFSTR("Yes");
          v222 = 2112;
          v223 = v149;
          v224 = 2112;
          v225 = v150;
          v226 = 2112;
          v227 = v152;
          _os_log_impl(&dword_20D3BA000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Response with type: %@, subtype: %@, field: %@ is valid for mirroring: %@", buf, 0x2Au);

        }
        v44 = v192;
        if (v145)
        {
          v139 = (void *)objc_msgSend(v136, "mutableCopy");
          objc_msgSend(v139, "setObject:forKeyedSubscript:", CFSTR("mirrored"), CFSTR("pov"));
          v153 = (void *)objc_msgSend(v139, "copy");
          objc_msgSend(v130, "setAttributes:", v153);

          v154 = MEMORY[0x24BDACB70];
          v155 = MEMORY[0x24BDACB70];
          if (os_log_type_enabled(v154, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v130, "attributes");
            v156 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v156, "objectForKeyedSubscript:", CFSTR("type"));
            v157 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v130, "attributes");
            v158 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v158, "objectForKeyedSubscript:", CFSTR("subtype"));
            v159 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v130, "attributes");
            v160 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v160, "objectForKeyedSubscript:", CFSTR("field"));
            v161 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v221 = v157;
            v222 = 2112;
            v223 = v159;
            v224 = 2112;
            v225 = (uint64_t)v161;
            _os_log_impl(&dword_20D3BA000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Response after mirroring has type: %@, subtype: %@, field: %@", buf, 0x20u);

            v16 = v190;
            v44 = v192;

          }
        }
        else
        {
          v139 = v130;
          v130 = 0;
        }
      }

      v18 = v182;
      v43 = v180;
      goto LABEL_130;
    }
    v22 = v93;
    obj = v22;
    v18 = v182;
    v28 = v184;
    v43 = v180;
    v97 = v175;
    v45 = v176;
LABEL_151:

    goto LABEL_152;
  }
  v22 = 0;
LABEL_7:
  v28 = v184;
LABEL_154:

  return v22;
}

void __170__RKMessageResponseManager_responsesForMessageWithLanguageDetectionImp_maximumResponses_forRecipientID_forConversationHistory_forContext_withLanguage_inputModes_options___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("“"), CFSTR("\"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("”"), CFSTR("\"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("‘"), CFSTR("'"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("’"), CFSTR("'"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v8, a3);
}

void __170__RKMessageResponseManager_responsesForMessageWithLanguageDetectionImp_maximumResponses_forRecipientID_forConversationHistory_forContext_withLanguage_inputModes_options___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  objc_msgSend(a2, "componentsSeparatedByString:", CFSTR("\n"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __170__RKMessageResponseManager_responsesForMessageWithLanguageDetectionImp_maximumResponses_forRecipientID_forConversationHistory_forContext_withLanguage_inputModes_options___block_invoke_3;
  v9[3] = &unk_24C6AF180;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v9);
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR("\n"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v7, a3);

}

void __170__RKMessageResponseManager_responsesForMessageWithLanguageDetectionImp_maximumResponses_forRecipientID_forConversationHistory_forContext_withLanguage_inputModes_options___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  objc_msgSend(a2, "uppercaseFirstWordString");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v5, a3);

}

uint64_t __170__RKMessageResponseManager_responsesForMessageWithLanguageDetectionImp_maximumResponses_forRecipientID_forConversationHistory_forContext_withLanguage_inputModes_options___block_invoke_4()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)responsesForMessageWithLanguageDetectionImp_maximumResponses_forRecipientID_forConversationHistory_forContext_withLanguage_inputModes_options__sAppleProducts;
  responsesForMessageWithLanguageDetectionImp_maximumResponses_forRecipientID_forConversationHistory_forContext_withLanguage_inputModes_options__sAppleProducts = v0;

  return objc_msgSend(&unk_24C715D28, "enumerateObjectsUsingBlock:", &__block_literal_global_242);
}

void __170__RKMessageResponseManager_responsesForMessageWithLanguageDetectionImp_maximumResponses_forRecipientID_forConversationHistory_forContext_withLanguage_inputModes_options___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = a2;
  objc_msgSend(v2, "stringWithFormat:", CFSTR("\\b%@\\b"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("\\s*"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)responsesForMessageWithLanguageDetectionImp_maximumResponses_forRecipientID_forConversationHistory_forContext_withLanguage_inputModes_options__sAppleProducts, "setObject:forKeyedSubscript:", v3, v5);
}

void __170__RKMessageResponseManager_responsesForMessageWithLanguageDetectionImp_maximumResponses_forRecipientID_forConversationHistory_forContext_withLanguage_inputModes_options___block_invoke_6(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;

  v5 = (void *)objc_msgSend(a2, "mutableCopy");
  v6 = (void *)responsesForMessageWithLanguageDetectionImp_maximumResponses_forRecipientID_forConversationHistory_forContext_withLanguage_inputModes_options__sAppleProducts;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __170__RKMessageResponseManager_responsesForMessageWithLanguageDetectionImp_maximumResponses_forRecipientID_forConversationHistory_forContext_withLanguage_inputModes_options___block_invoke_7;
  v8[3] = &unk_24C6AFB90;
  v9 = v5;
  v10 = *(id *)(a1 + 32);
  v11 = a3;
  v7 = v5;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v8);

}

void __170__RKMessageResponseManager_responsesForMessageWithLanguageDetectionImp_maximumResponses_forRecipientID_forConversationHistory_forContext_withLanguage_inputModes_options___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  v8 = objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", v7, v6, 1025, 0, objc_msgSend(v5, "length"));

  if (v8)
    objc_msgSend(*(id *)(a1 + 40), "setObject:atIndexedSubscript:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
}

void __170__RKMessageResponseManager_responsesForMessageWithLanguageDetectionImp_maximumResponses_forRecipientID_forConversationHistory_forContext_withLanguage_inputModes_options___block_invoke_8(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  objc_msgSend(a2, "componentsSeparatedByString:", CFSTR("\n"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v6, "count") >= 2)
  {
    objc_msgSend(v6, "objectAtIndex:", arc4random() % (unint64_t)objc_msgSend(v6, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v5, a3);

  }
}

- (id)categoryForMessage:(id)a3 langID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  v22 = 0;
  -[RKMessageResponseManager dispatchQueue](self, "dispatchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__RKMessageResponseManager_categoryForMessage_langID___block_invoke;
  block[3] = &unk_24C6AFBB8;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, block);

  v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __54__RKMessageResponseManager_categoryForMessage_langID___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v2 = (void *)MEMORY[0x212BA17B8]();
  +[RKMessageClassifier messageClassification:withLanguageIdentifier:](RKMessageClassifier, "messageClassification:withLanguageIdentifier:", a1[4], a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  RKLinguisticCategoryToPreferenceKey(objc_msgSend(v3, "sentenceType"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "isEqualToString:", CFSTR("QueryGeneral")))
  {
    v7 = *(_QWORD *)(a1[6] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = CFSTR("QueryPolar");

  }
  objc_autoreleasePoolPop(v2);
}

- (id)categoryForMessageWithoutQueue:(id)a3 langID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  __CFString *v9;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x212BA17B8]();
  +[RKMessageClassifier messageClassification:withLanguageIdentifier:](RKMessageClassifier, "messageClassification:withLanguageIdentifier:", v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  RKLinguisticCategoryToPreferenceKey(objc_msgSend(v8, "sentenceType"));
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("QueryGeneral")))
  {

    v9 = CFSTR("QueryPolar");
  }

  objc_autoreleasePoolPop(v7);
  return v9;
}

- (void)registerResponse:(id)a3 forMessage:(id)a4 forContext:(id)a5 withLanguage:(id)a6
{
  -[RKMessageResponseManager registerResponse:forMessage:forContext:withEffectiveDate:withLanguage:](self, "registerResponse:forMessage:forContext:withEffectiveDate:withLanguage:", a3, a4, a5, 0, a6);
}

- (void)registerResponse:(id)a3 forMessage:(id)a4 forContext:(id)a5 withEffectiveDate:(id)a6 withLanguage:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD block[4];
  id v24;
  id v25;
  RKMessageResponseManager *v26;
  id v27;
  id v28;
  id v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[RKMessageResponseManager dispatchQueue](self, "dispatchQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __98__RKMessageResponseManager_registerResponse_forMessage_forContext_withEffectiveDate_withLanguage___block_invoke;
  block[3] = &unk_24C6AFBE0;
  v24 = v12;
  v25 = v13;
  v26 = self;
  v27 = v16;
  v28 = v14;
  v29 = v15;
  v18 = v15;
  v19 = v14;
  v20 = v16;
  v21 = v13;
  v22 = v12;
  dispatch_sync(v17, block);

}

void __98__RKMessageResponseManager_registerResponse_forMessage_forContext_withEffectiveDate_withLanguage___block_invoke(uint64_t a1)
{
  id v2;

  if (*(_QWORD *)(a1 + 32))
  {
    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(*(id *)(a1 + 48), "collection");
      v2 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "registerResponse:forMessage:withLanguage:context:effectiveDate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));

    }
    else
    {
      NSLog(CFSTR("Warning: message is not nullable"));
    }
  }
  else
  {
    NSLog(CFSTR("Warning: response is not nullable"));
  }
}

- (void)registerResponse:(id)a3 forMessage:(id)a4 metadata:(id)a5 withLanguage:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  RKMessageResponseManager *v22;
  id v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[RKMessageResponseManager dispatchQueue](self, "dispatchQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78__RKMessageResponseManager_registerResponse_forMessage_metadata_withLanguage___block_invoke;
  block[3] = &unk_24C6AFC08;
  v20 = v11;
  v21 = v10;
  v22 = self;
  v23 = v13;
  v24 = v12;
  v15 = v12;
  v16 = v13;
  v17 = v10;
  v18 = v11;
  dispatch_async(v14, block);

}

void __78__RKMessageResponseManager_registerResponse_forMessage_metadata_withLanguage___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
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
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    if ((unint64_t)objc_msgSend(v2, "length") <= 0x800)
    {
      v3 = *(void **)(a1 + 40);
      if (v3)
      {
        if ((unint64_t)objc_msgSend(v3, "length") <= 0x14)
        {
          if (objc_msgSend(*(id *)(a1 + 48), "usePersonalizedRanking"))
          {
            objc_msgSend(*(id *)(a1 + 48), "getRankLearner");
            v4 = objc_claimAutoreleasedReturnValue();
            v5 = *(_QWORD *)(a1 + 48);
            v6 = *(void **)(v5 + 32);
            *(_QWORD *)(v5 + 32) = v4;

          }
          if (*(_QWORD *)(*(_QWORD *)(a1 + 48) + 32))
          {
            objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", *(_QWORD *)(a1 + 56));
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BDBCB20]);
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            v8 = (void *)objc_opt_new();
            objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", CFSTR("recipient"));
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("recipient"));

            objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", CFSTR("source"));
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("source"));

            objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", CFSTR("inputmethod"));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = v8;
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("inputmethod"));

            v30 = a1;
            objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", CFSTR("rankedlist"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = (void *)objc_opt_new();
            v32 = 0u;
            v33 = 0u;
            v34 = 0u;
            v35 = 0u;
            obj = v12;
            v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
            if (v14)
            {
              v15 = v14;
              v16 = *(_QWORD *)v33;
              do
              {
                for (i = 0; i != v15; ++i)
                {
                  if (*(_QWORD *)v33 != v16)
                    objc_enumerationMutation(obj);
                  v18 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
                  v19 = (void *)objc_opt_new();
                  objc_msgSend(v18, "string");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "addObject:", v20);

                  objc_msgSend(v18, "attributes");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "objectForKey:", CFSTR("rank"));
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "addObject:", v22);

                  objc_msgSend(v18, "attributes");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "objectForKey:", CFSTR("selected"));
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "addObject:", v24);

                  objc_msgSend(v19, "componentsJoinedByString:", CFSTR(":"));
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v13, "addObject:", v25);

                }
                v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
              }
              while (v15);
            }

            objc_msgSend(*(id *)(v30 + 48), "categoryForMessageWithoutQueue:langID:", *(_QWORD *)(v30 + 32), *(_QWORD *)(v30 + 56));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setObject:forKeyedSubscript:", v26, CFSTR("category"));
            objc_msgSend(v13, "componentsJoinedByString:", CFSTR(";"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setObject:forKeyedSubscript:", v27, CFSTR("rankedlist"));
            objc_msgSend(v28, "setObject:forKeyedSubscript:", *(_QWORD *)(v30 + 32), CFSTR("message"));
            objc_msgSend(v28, "setObject:forKeyedSubscript:", *(_QWORD *)(v30 + 40), CFSTR("response"));
            if (objc_msgSend(*(id *)(*(_QWORD *)(v30 + 48) + 32), "insertRankingInfo:forLanguageID:", v28, v29))objc_msgSend(*(id *)(*(_QWORD *)(v30 + 48) + 32), "flushRankingData:", v29);

          }
        }
      }
    }
  }
}

- (id)getRankLearner
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__RKMessageResponseManager_getRankLearner__block_invoke;
  block[3] = &unk_24C6AF3F0;
  block[4] = self;
  if (getRankLearner_onceToken != -1)
    dispatch_once(&getRankLearner_onceToken, block);
  return self->_rankLearner;
}

void __42__RKMessageResponseManager_getRankLearner__block_invoke(uint64_t a1)
{
  RKRankLearner *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(RKRankLearner);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

}

- (BOOL)usePersonalizedRanking
{
  uint8_t v3[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_20D3BA000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Rank learning has been sunset across all platforms.", v3, 2u);
  }
  return 0;
}

- (void)prunePersonalizedUserDatabase:(id)a3
{
  RKRankLearner *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[RKMessageResponseManager usePersonalizedRanking](self, "usePersonalizedRanking"))
  {
    v4 = objc_alloc_init(RKRankLearner);
    -[RKRankLearner getDBManager:](v4, "getDBManager:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pruneUserDatabase");

  }
}

- (void)resetRegisteredResponses
{
  NSObject *v3;
  _QWORD block[5];

  -[RKMessageResponseManager dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__RKMessageResponseManager_resetRegisteredResponses__block_invoke;
  block[3] = &unk_24C6AF3F0;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __52__RKMessageResponseManager_resetRegisteredResponses__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "collection");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "resetRegisteredResponses");

}

- (void)flushDynamicData
{
  NSObject *v3;
  _QWORD block[5];

  -[RKMessageResponseManager dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__RKMessageResponseManager_flushDynamicData__block_invoke;
  block[3] = &unk_24C6AF3F0;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __44__RKMessageResponseManager_flushDynamicData__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "collection");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "flushDynamicData");

}

- (BOOL)isQuestion:(id)a3 withLanguage:(id)a4
{
  return 0;
}

+ (BOOL)_needsMirroredAnalysisForMessage:(id)a3 forChronologicalConversationHistory:(id)a4
{
  id v6;
  BOOL v7;
  void *v8;

  v6 = a4;
  if (objc_msgSend(a3, "length") || !objc_msgSend(v6, "count"))
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(a1, "_mostRecentTextFromChronologicalConversationHistory:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "length") != 0;

  }
  return v7;
}

+ (BOOL)_responseTypeIsSunsetted:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  if (!a3)
    return 0;
  objc_msgSend(a3, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("event")) & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("health"));

  return v5;
}

+ (BOOL)_responseLooksLikeIncomingCheckInResponse:(id)a3
{
  void *v3;
  void *v4;

  if (!a3)
    return 0;
  objc_msgSend(a3, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("request"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "containsString:", CFSTR("xCHECKININCOMINGx"));
  return (char)v3;
}

+ (BOOL)_responseLooksLikeOutgoingCheckInResponse:(id)a3
{
  void *v3;
  void *v4;

  if (!a3)
    return 0;
  objc_msgSend(a3, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("request"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "containsString:", CFSTR("xCHECKINOUTGOINGx"));
  return (char)v3;
}

+ (BOOL)_isMirroredResponseValidForResponse:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  objc_msgSend(a3, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("subtype"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("field"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length") || !objc_msgSend(v4, "containsString:", CFSTR("location")))
    v7 = 0;
  else
    v7 = objc_msgSend(v5, "containsString:", CFSTR("current location"));

  return v7;
}

+ (id)_mostRecentTextFromChronologicalConversationHistory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend((id)objc_opt_class(), "_chronologicalConversationHistory:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)_chronologicalConversationHistory:(id)a3
{
  return (id)objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_281);
}

uint64_t __62__RKMessageResponseManager__chronologicalConversationHistory___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (RKResponseCollection)collection
{
  return (RKResponseCollection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCollection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSArray)preferredLanguages
{
  return self->_preferredLanguages;
}

- (void)setPreferredLanguages:(id)a3
{
  objc_storeStrong((id *)&self->_preferredLanguages, a3);
}

- (RKRankLearner)rankLearner
{
  return (RKRankLearner *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRankLearner:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rankLearner, 0);
  objc_storeStrong((id *)&self->_preferredLanguages, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

- (void)responsesForMessageWithLanguageDetectionImp:maximumResponses:forRecipientID:forConversationHistory:forContext:withLanguage:inputModes:options:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_20D3BA000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Failed to identify the language of the given message", v0, 2u);
}

@end
