@implementation TILanguageModelOfflineLearningTask

- (TILanguageModelOfflineLearningTask)initWithClientIdentifier:(id)a3 oneTimeTask:(BOOL)a4
{
  id v6;
  TILanguageModelOfflineLearningTask *v7;
  uint64_t v8;
  NSString *clientIdentifier;
  NSMutableDictionary *v10;
  NSMutableDictionary *handles;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TILanguageModelOfflineLearningTask;
  v7 = -[TILanguageModelOfflineLearningTask init](&v13, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    clientIdentifier = v7->_clientIdentifier;
    v7->_clientIdentifier = (NSString *)v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    handles = v7->_handles;
    v7->_handles = v10;

    v7->_oneTimeTask = a4;
  }

  return v7;
}

- (TILinguisticDataSource)dataSource
{
  return 0;
}

- (NSCharacterSet)linePaddingCharacters
{
  return 0;
}

- (NSSet)forwardedMessageSeparators
{
  return 0;
}

- (TILanguageModelOfflineLearningHandle)handleForLanguageLikelihood
{
  TILanguageModelOfflineLearningHandle *handleForLanguageLikelihood;

  handleForLanguageLikelihood = self->_handleForLanguageLikelihood;
  if (!handleForLanguageLikelihood)
  {
    TIDispatchSync();
    handleForLanguageLikelihood = self->_handleForLanguageLikelihood;
  }
  return handleForLanguageLikelihood;
}

- (id)handleForLanguage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__99;
  v14 = __Block_byref_object_dispose__100;
  -[TILanguageModelOfflineLearningTask handles](self, "handles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)v11[5];
  if (!v6)
  {
    v9 = v4;
    TIDispatchSync();

    v6 = (void *)v11[5];
  }
  v7 = v6;
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (void)setAdaptationContext:(id)a3 onHandle:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;
  id v9;

  v9 = a3;
  v5 = a4;
  objc_msgSend(v5, "currentAdaptationContext");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v9)
  {

  }
  else
  {
    objc_msgSend(v5, "currentAdaptationContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "isEqual:", v7);

    if ((v8 & 1) == 0)
      objc_msgSend(v5, "updateAdaptationContext:", v9);
  }

}

- (BOOL)incrementUsageCountsForMessages:(id)a3 withHandle:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  id v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  BOOL v33;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[5];
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0x1E0C99000uLL;
    v36 = *(_QWORD *)v44;
    do
    {
      v12 = 0;
      v35 = v10;
      do
      {
        if (*(_QWORD *)v44 != v36)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v12);
        objc_msgSend(v13, "dateSent");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "lastAdaptationDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "earlierDate:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16 != v14)
        {
          objc_msgSend(v14, "timeIntervalSinceReferenceDate");
          v18 = v17;
          v19 = objc_alloc_init(*(Class *)(v11 + 3560));
          objc_msgSend(v13, "body");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v41[0] = MEMORY[0x1E0C809B0];
          v41[1] = 3221225472;
          v41[2] = __81__TILanguageModelOfflineLearningTask_incrementUsageCountsForMessages_withHandle___block_invoke;
          v41[3] = &unk_1EA104D68;
          v41[4] = self;
          v21 = v19;
          v42 = v21;
          objc_msgSend(v20, "enumerateLinesUsingBlock:", v41);

          if (TICanLogMessageAtLevel_onceToken != -1)
            dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
          if (TICanLogMessageAtLevel_logLevel >= 2)
          {
            TIOSLogFacility();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              v29 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v7, "inputMode");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "currentAdaptationContext");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "stringWithFormat:", CFSTR("%s Adapting to message (language=%@, adaptationContext=%@): %@"), "-[TILanguageModelOfflineLearningTask incrementUsageCountsForMessages:withHandle:]", v30, v31, v21);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v49 = v32;
              _os_log_debug_impl(&dword_1DA6F2000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

            }
          }
          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          v23 = v21;
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
          if (v24)
          {
            v25 = v24;
            v26 = *(_QWORD *)v38;
            while (2)
            {
              for (i = 0; i != v25; ++i)
              {
                if (*(_QWORD *)v38 != v26)
                  objc_enumerationMutation(v23);
                v28 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
                if (-[TILanguageModelOfflineLearningTask isCancelled](self, "isCancelled"))
                {

                  v33 = 0;
                  goto LABEL_27;
                }
                objc_msgSend(v7, "adaptToParagraph:timeStamp:adaptationType:", v28, 1, v18);
              }
              v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
              if (v25)
                continue;
              break;
            }
          }

          v10 = v35;
          v11 = 0x1E0C99000;
        }

        ++v12;
      }
      while (v12 != v10);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
      v33 = 1;
    }
    while (v10);
  }
  else
  {
    v33 = 1;
  }
LABEL_27:

  return v33;
}

- (void)enumerateHandlesForLanguage:(id)a3 withBlock:(id)a4
{
  void (**v6)(id, id);
  void *v7;
  id v8;

  v6 = (void (**)(id, id))a4;
  -[TILanguageModelOfflineLearningTask handleForLanguage:](self, "handleForLanguage:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v8);
  -[TILanguageModelOfflineLearningTask handleForLanguageLikelihood](self, "handleForLanguageLikelihood");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v7);

}

- (BOOL)incrementUsageCountsForMessages:(id)a3 forLanguage:(id)a4 adaptationContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v8 = a3;
  v9 = a5;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 1;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __100__TILanguageModelOfflineLearningTask_incrementUsageCountsForMessages_forLanguage_adaptationContext___block_invoke;
  v13[3] = &unk_1EA104D90;
  v13[4] = self;
  v14 = v9;
  v15 = v8;
  v16 = &v17;
  v10 = v8;
  v11 = v9;
  -[TILanguageModelOfflineLearningTask enumerateHandlesForLanguage:withBlock:](self, "enumerateHandlesForLanguage:withBlock:", a4, v13);
  LOBYTE(a4) = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return (char)a4;
}

- (void)didFinishLearning
{
  void *v3;
  id v4;

  -[TILanguageModelOfflineLearningTask handles](self, "handles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_107);

  -[TILanguageModelOfflineLearningTask handleForLanguageLikelihood](self, "handleForLanguageLikelihood");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didFinishLearning");

}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (BOOL)oneTimeTask
{
  return self->_oneTimeTask;
}

- (NSMutableDictionary)handles
{
  return self->_handles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handles, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_handleForLanguageLikelihood, 0);
}

void __55__TILanguageModelOfflineLearningTask_didFinishLearning__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  v3 = a3;
  if (objc_msgSend(v3, "isValid"))
    objc_msgSend(v3, "didFinishLearning");

}

void __100__TILanguageModelOfflineLearningTask_incrementUsageCountsForMessages_forLanguage_adaptationContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  char v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(v8, "isValid"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setAdaptationContext:onHandle:", *(_QWORD *)(a1 + 40), v8);
    if (!objc_msgSend(*(id *)(a1 + 32), "oneTimeTask")
      || (objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 0.0),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v8, "lastAdaptationDate"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          v5 = objc_msgSend(v4, "isEqualToDate:", v3),
          v4,
          v3,
          v5))
    {
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      if (*(_BYTE *)(v6 + 24))
      {
        v7 = objc_msgSend(*(id *)(a1 + 32), "incrementUsageCountsForMessages:withHandle:", *(_QWORD *)(a1 + 48), v8);
        v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      }
      else
      {
        v7 = 0;
      }
      *(_BYTE *)(v6 + 24) = v7;
    }
  }

}

void __81__TILanguageModelOfflineLearningTask_incrementUsageCountsForMessages_withHandle___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(*(id *)(a1 + 32), "linePaddingCharacters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "linePaddingCharacters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByTrimmingCharactersInSet:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v12 = (id)v7;
  }
  objc_msgSend(*(id *)(a1 + 32), "forwardedMessageSeparators");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v12);

  if (v9)
  {
    *a3 = 1;
LABEL_7:
    v11 = v12;
    goto LABEL_8;
  }
  v10 = objc_msgSend(v12, "length");
  v11 = v12;
  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);
    goto LABEL_7;
  }
LABEL_8:

}

void __56__TILanguageModelOfflineLearningTask_handleForLanguage___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  TICanonicalInputModeName();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[TIInputMode inputModeWithIdentifier:](TIInputMode, "inputModeWithIdentifier:", v2);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  +[TILanguageModelOfflineLearningHandle handleForInputMode:](TILanguageModelOfflineLearningHandle, "handleForInputMode:", v7);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "isValid"))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "load");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 40), "handles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 32));

  }
}

void __65__TILanguageModelOfflineLearningTask_handleForLanguageLikelihood__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  +[TILanguageModelOfflineLearningHandle handleForLanguageLikelihood](TILanguageModelOfflineLearningHandle, "handleForLanguageLikelihood");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

}

+ (id)dataSourceForTask
{
  return 0;
}

+ (TILanguageModelOfflineLearningTask)taskWithClientIdentifier:(id)a3 oneTimeTask:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v5 = +[TILanguageModelOfflineLearningTask taskWithClientIdentifier:oneTimeTask:]::onceToken;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&+[TILanguageModelOfflineLearningTask taskWithClientIdentifier:oneTimeTask:]::onceToken, &__block_literal_global_15773);
  objc_msgSend((id)+[TILanguageModelOfflineLearningTask taskWithClientIdentifier:oneTimeTask:]::learningTaskClasses, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend((id)objc_msgSend(v7, "alloc"), "initWithClientIdentifier:oneTimeTask:", v6, v4);

  return (TILanguageModelOfflineLearningTask *)v8;
}

void __75__TILanguageModelOfflineLearningTask_taskWithClientIdentifier_oneTimeTask___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("com.apple.mobilemail");
  v2[1] = CFSTR("com.apple.MobileSMS");
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[TILanguageModelOfflineLearningTask taskWithClientIdentifier:oneTimeTask:]::learningTaskClasses;
  +[TILanguageModelOfflineLearningTask taskWithClientIdentifier:oneTimeTask:]::learningTaskClasses = v0;

}

@end
