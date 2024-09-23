@implementation TILanguageModelOfflineLearningStrategyResponseKit

- (TILanguageModelOfflineLearningStrategyResponseKit)initWithClientIdentifier:(id)a3 andDirectory:(id)a4
{
  id v6;
  id v7;
  TILanguageModelOfflineLearningStrategyResponseKit *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *recipientModels;
  uint64_t v11;
  TILanguageModelOfflineLearningTask *learningTask;
  uint64_t v13;
  RKMessageResponseManager *trainer;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)TILanguageModelOfflineLearningStrategyResponseKit;
  v8 = -[TILanguageModelOfflineLearningStrategyResponseKit init](&v16, sel_init);
  if (v8)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    recipientModels = v8->_recipientModels;
    v8->_recipientModels = v9;

    +[TILanguageModelOfflineLearningTask taskWithClientIdentifier:oneTimeTask:](TILanguageModelOfflineLearningTask, "taskWithClientIdentifier:oneTimeTask:", v6, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    learningTask = v8->_learningTask;
    v8->_learningTask = (TILanguageModelOfflineLearningTask *)v11;

    objc_storeStrong((id *)&v8->_directory, a4);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0D87C10]), "initWithDynamicDataURL:", v8->_directory);
    trainer = v8->_trainer;
    v8->_trainer = (RKMessageResponseManager *)v13;

  }
  return v8;
}

- (id)messagesClusteredByRecipient:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "recipient", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v4, "objectForKey:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v12)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKey:", v12, v11);
          }
          objc_msgSend(v12, "addObject:", v10);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (BOOL)learnMessages:(id)a3 withRecipientRecords:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  TIRecipientModel *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[TILanguageModelOfflineLearningStrategyResponseKit messagesClusteredByRecipient:](self, "messagesClusteredByRecipient:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKey:", CFSTR("compositeName"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          -[NSMutableDictionary objectForKey:](self->_recipientModels, "objectForKey:", v14);
          v15 = (TIRecipientModel *)objc_claimAutoreleasedReturnValue();
          if (!v15)
          {
            v15 = -[TIRecipientModel initWithCompositeName:andTrainer:]([TIRecipientModel alloc], "initWithCompositeName:andTrainer:", v14, self->_trainer);
            -[NSMutableDictionary setObject:forKey:](self->_recipientModels, "setObject:forKey:", v15, v14);
          }
          objc_msgSend(v7, "objectForKey:", v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIRecipientModel handleMessages:](v15, "handleMessages:", v16);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  return 1;
}

- (id)filterMessages:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v3 = (void *)MEMORY[0x1E0C99D68];
  v4 = a3;
  objc_msgSend(v3, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__TILanguageModelOfflineLearningStrategyResponseKit_filterMessages___block_invoke;
  v10[3] = &unk_1EA105CE0;
  v11 = v5;
  v6 = v5;
  objc_msgSend(v4, "indexesOfObjectsPassingTest:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectsAtIndexes:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)didFinishLearning
{
  void *v3;
  char v4;

  -[TILanguageModelOfflineLearningStrategyResponseKit learningTask](self, "learningTask");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCancelled");

  if ((v4 & 1) == 0)
    -[RKMessageResponseManager flushDynamicData](self->_trainer, "flushDynamicData");
}

- (TILanguageModelOfflineLearningTask)learningTask
{
  return (TILanguageModelOfflineLearningTask *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_learningTask, 0);
  objc_storeStrong((id *)&self->_trainer, 0);
  objc_storeStrong((id *)&self->_directory, 0);
  objc_storeStrong((id *)&self->_recipientModels, 0);
}

BOOL __68__TILanguageModelOfflineLearningStrategyResponseKit_filterMessages___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _BOOL8 v8;

  v3 = a2;
  objc_msgSend(v3, "body");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    objc_msgSend(v3, "dateSent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "laterDate:", *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 == *(void **)(a1 + 32);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
