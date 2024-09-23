@implementation TIResponseKitTrainerImpl

- (id)_init
{
  TIResponseKitTrainerImpl *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TIResponseKitTrainerImpl;
  v2 = -[TIResponseKitTrainerImpl init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.companionmessagesd.ResponseKitTrainer", v3);
    v5 = (void *)_dispatchQueue;
    _dispatchQueue = (uint64_t)v4;

  }
  return v2;
}

- (BOOL)moveLanguageModelBundlesFromTemporaryDirectory:(id)a3 toDestination:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  int v30;
  void *v31;
  int v32;
  void *v33;
  char v34;
  void *v36;
  id obj;
  void *v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v7;
  objc_msgSend(v7, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "fileExistsAtPath:", v9);

  if ((v10 & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v7, 1, 0, a5),
        v11,
        v12))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "contentsOfDirectoryAtPath:error:", v14, a5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("pathExtension='lm'"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v15;
      objc_msgSend(v15, "filteredArrayUsingPredicate:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v18 = v17;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v41;
        obj = v18;
        while (2)
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v41 != v21)
              objc_enumerationMutation(obj);
            v23 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
            objc_msgSend(v39, "URLByAppendingPathComponent:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "URLByAppendingPathComponent:", v23);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "path");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v26, "fileExistsAtPath:", v27);

            if (v28)
            {
              objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = objc_msgSend(v29, "removeItemAtURL:error:", v25, a5);

              if (!v30)
              {

LABEL_18:
                v34 = 0;
                v18 = obj;
                v33 = obj;
                goto LABEL_19;
              }
            }
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v31, "moveItemAtURL:toURL:error:", v24, v25, a5);

            if (!v32)
              goto LABEL_18;
          }
          v18 = obj;
          v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
          if (v20)
            continue;
          break;
        }
      }

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "removeItemAtURL:error:", v39, a5);
LABEL_19:

      v15 = v36;
    }
    else
    {
      v34 = 0;
    }

  }
  else
  {
    v34 = 0;
  }

  return v34;
}

- (void)performTrainingForClient:(id)a3 withCompletionHandler:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;

  v5 = a3;
  v8 = a4;
  v6 = v5;
  v7 = v8;
  TIDispatchAsync();

}

void __75__TIResponseKitTrainerImpl_performTrainingForClient_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id *v8;
  char v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(_QWORD *);
  void *v22;
  id v23;
  id v24;
  _QWORD *v25;
  id obj;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  _QWORD v31[3];
  char v32;
  uint64_t v33;
  id *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v2 = (void *)MEMORY[0x1E0CB3940];
  NSTemporaryDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@/%d"), v3, arc4random());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/var/mobile/Library/ResponseKit"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  v34 = (id *)&v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__2505;
  v37 = __Block_byref_object_dispose__2506;
  v38 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v32 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v34;
  obj = v34[5];
  v9 = objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 1, 0, &obj);
  objc_storeStrong(v8 + 5, obj);

  v30 = v9;
  if (*((_BYTE *)v28 + 24))
  {
    v10 = MEMORY[0x1E0C809B0];
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __75__TIResponseKitTrainerImpl_performTrainingForClient_withCompletionHandler___block_invoke_41;
    v22 = &unk_1EA1070B8;
    v23 = *(id *)(a1 + 32);
    v24 = v5;
    v25 = v31;
    TIDispatchSync();
    +[TILanguageModelOfflineLearningAgent sharedLearningAgent](TILanguageModelOfflineLearningAgent, "sharedLearningAgent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v10;
    v12[1] = 3221225472;
    v12[2] = __75__TIResponseKitTrainerImpl_performTrainingForClient_withCompletionHandler___block_invoke_2;
    v12[3] = &unk_1EA0FB878;
    v16 = v31;
    v17 = &v27;
    v12[4] = *(_QWORD *)(a1 + 40);
    v13 = v24;
    v14 = v6;
    v18 = &v33;
    v15 = *(id *)(a1 + 48);
    objc_msgSend(v11, "performTaskInBackground:", v12);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(v31, 8);
  _Block_object_dispose(&v33, 8);

}

void __75__TIResponseKitTrainerImpl_performTrainingForClient_withCompletionHandler___block_invoke_41(_QWORD *a1)
{
  void *v2;
  void *v3;
  TILanguageModelOfflineLearningStrategyResponseKit *v4;

  v4 = -[TILanguageModelOfflineLearningStrategyResponseKit initWithClientIdentifier:andDirectory:]([TILanguageModelOfflineLearningStrategyResponseKit alloc], "initWithClientIdentifier:andDirectory:", a1[4], a1[5]);
  +[TILanguageModelOfflineLearningAgent sharedLearningAgent](TILanguageModelOfflineLearningAgent, "sharedLearningAgent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performLearningIfNecessaryWithStrategy:lastAdaptationTime:", v4, 0.0);

  -[TILanguageModelOfflineLearningStrategyResponseKit learningTask](v4, "learningTask");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v3, "isCancelled");

}

uint64_t __75__TIResponseKitTrainerImpl_performTrainingForClient_withCompletionHandler___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  id obj;

  if (!*(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24))
  {
    v2 = (void *)a1[4];
    v3 = a1[5];
    v4 = a1[6];
    v5 = *(_QWORD *)(a1[10] + 8);
    obj = *(id *)(v5 + 40);
    v6 = objc_msgSend(v2, "moveLanguageModelBundlesFromTemporaryDirectory:toDestination:error:", v3, v4, &obj);
    objc_storeStrong((id *)(v5 + 40), obj);
    *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) = v6;
  }
  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

+ (id)sharedTrainer
{
  if (sharedTrainer_onceToken != -1)
    dispatch_once(&sharedTrainer_onceToken, &__block_literal_global_2554);
  return (id)sharedTrainer_instance;
}

void __41__TIResponseKitTrainerImpl_sharedTrainer__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[TIResponseKitTrainerImpl _init]([TIResponseKitTrainerImpl alloc], "_init");
  v1 = (void *)sharedTrainer_instance;
  sharedTrainer_instance = (uint64_t)v0;

}

@end
