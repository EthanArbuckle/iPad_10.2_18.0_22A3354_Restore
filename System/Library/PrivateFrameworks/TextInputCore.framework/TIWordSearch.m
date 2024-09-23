@implementation TIWordSearch

- (void)clearCache
{
  id v2;

  -[TIWordSearch candidatesCache](self, "candidatesCache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (void)setDebuggingLogEnabled:(BOOL)a3
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  BOOL v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__TIWordSearch_setDebuggingLogEnabled___block_invoke;
  v5[3] = &unk_1EA100538;
  v5[4] = self;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB34C8], "blockOperationWithBlock:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "sharedOperationQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addOperation:", v3);

}

- (void)updateMecabraState
{
  -[TIWordSearch updateSupplementalLexicon](self, "updateSupplementalLexicon");
  -[TIWordSearch updateAddressBook](self, "updateAddressBook");
}

- (void)clearLearningDictionary
{
  if (-[TIWordSearch mecabra](self, "mecabra"))
  {
    -[TIWordSearch completeOperationsInQueue](self, "completeOperationsInQueue");
    -[TIWordSearch mecabra](self, "mecabra");
    MecabraClearLearningDictionaries();
  }
}

- (TIMecabraEnvironment)mecabraEnvironment
{
  TIWordSearch *v2;
  TIMecabraEnvironment *v3;
  void *v4;
  uint64_t v5;
  TIMecabraEnvironment *mecabraEnvironment;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_mecabraEnvironment && v2->_mecabraWrapper)
  {
    v3 = [TIMecabraEnvironment alloc];
    -[TIWordSearch mecabraWrapper](v2, "mecabraWrapper");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[TIMecabraEnvironment initWithMecabraEngine:language:](v3, "initWithMecabraEngine:language:", objc_msgSend(v4, "mecabraRef"), -[TIWordSearch mecabraLanguage](v2, "mecabraLanguage"));
    mecabraEnvironment = v2->_mecabraEnvironment;
    v2->_mecabraEnvironment = (TIMecabraEnvironment *)v5;

  }
  objc_sync_exit(v2);

  return v2->_mecabraEnvironment;
}

- (TIMecabraWrapper)mecabraWrapper
{
  TIWordSearch *v2;
  TIMecabraWrapper *mecabraWrapper;
  TIMecabraWrapper *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  TIMecabraWrapper *v9;
  uint64_t v10;
  TIMecabraWrapper *v11;
  TIMecabraWrapper *v12;

  v2 = self;
  objc_sync_enter(v2);
  mecabraWrapper = v2->_mecabraWrapper;
  v4 = mecabraWrapper;
  if (!mecabraWrapper)
  {
    v5 = -[TIWordSearch mecabraInputMethodType](v2, "mecabraInputMethodType");
    objc_msgSend((id)objc_opt_class(), "mecabraLearningDictionaryDirectory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[TIWordSearch mecabraCreationOptions](v2, "mecabraCreationOptions");
    -[TIWordSearch mecabraCreationOptionsDictionary](v2, "mecabraCreationOptionsDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = [TIMecabraWrapper alloc];
    if (v8)
      v10 = -[TIMecabraWrapper initWithInputMethodType:learningDictionaryDirectoryURL:creationOptionsDictionary:](v9, "initWithInputMethodType:learningDictionaryDirectoryURL:creationOptionsDictionary:", v5, v6, v8);
    else
      v10 = -[TIMecabraWrapper initWithInputMethodType:learningDictionaryDirectoryURL:creationOptions:](v9, "initWithInputMethodType:learningDictionaryDirectoryURL:creationOptions:", v5, v6, v7);
    v11 = v2->_mecabraWrapper;
    v2->_mecabraWrapper = (TIMecabraWrapper *)v10;

    v4 = v2->_mecabraWrapper;
  }
  v12 = v4;
  objc_sync_exit(v2);

  if (!mecabraWrapper)
    -[TIWordSearch updateMecabraState](v2, "updateMecabraState");
  return v12;
}

- (void)setMecabraWrapper:(id)a3
{
  TIWordSearch *v5;
  TIMecabraWrapper *v6;

  v6 = (TIMecabraWrapper *)a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_mecabraWrapper != v6)
    objc_storeStrong((id *)&v5->_mecabraWrapper, a3);
  -[TIWordSearch updateMecabraState](v5, "updateMecabraState");
  objc_sync_exit(v5);

}

- (__Mecabra)mecabra
{
  void *v2;
  __Mecabra *v3;

  -[TIWordSearch mecabraWrapper](self, "mecabraWrapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (__Mecabra *)objc_msgSend(v2, "mecabraRef");

  return v3;
}

- (int)mecabraInputMethodType
{
  return 0;
}

- (int)mecabraLanguage
{
  unsigned int v2;

  v2 = -[TIWordSearch mecabraInputMethodType](self, "mecabraInputMethodType") - 1;
  if (v2 > 0x11)
    return -1;
  else
    return dword_1DA910038[v2];
}

- (unint64_t)mecabraCreationOptions
{
  return 0;
}

- (id)mecabraCreationOptionsDictionary
{
  void *values;
  void *keys[2];

  keys[1] = *(void **)MEMORY[0x1E0C80C00];
  keys[0] = *(void **)MEMORY[0x1E0DE7130];
  values = (void *)*MEMORY[0x1E0C9AE50];
  return CFDictionaryCreate(0, (const void **)keys, (const void **)&values, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
}

- (id)initTIWordSearchWithInputMode:(id)a3
{
  return -[TIWordSearch initTIWordSearchWithInputMode:mecabraWrapper:](self, "initTIWordSearchWithInputMode:mecabraWrapper:", a3, 0);
}

- (id)initTIWordSearchWithInputMode:(id)a3 mecabraWrapper:(id)a4
{
  id v7;
  id v8;
  TIWordSearch *v9;
  TIWordSearch *v10;
  id v11;
  void *v12;
  void *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)TIWordSearch;
  v9 = -[TIWordSearch init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_inputMode, a3);
    -[TIWordSearch setAutoCorrects:](v10, "setAutoCorrects:", 1);
    if (v8)
      -[TIWordSearch setMecabraWrapper:](v10, "setMecabraWrapper:", v8);
    else
      v11 = -[TIWordSearch mecabraWrapper](v10, "mecabraWrapper");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v10, sel_dynamicDictionariesRemoved_, CFSTR("TIKeyboardInputManagerDynamicDictionariesRemovedNotification"), 0);

    +[TIKeyboardActivityController sharedController](TIKeyboardActivityController, "sharedController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addActivityObserver:", v10);

    TILanguageModelScheduleMaintenance();
  }

  return v10;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[TIWordSearch clearObservers](self, "clearObservers");
  +[TIKeyboardActivityController sharedController](TIKeyboardActivityController, "sharedController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeActivityObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)TIWordSearch;
  -[TIWordSearch dealloc](&v5, sel_dealloc);
}

- (void)keyboardActivityDidTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14;

  v4 = a3;
  if (objc_msgSend(v4, "toState") == 3)
  {
    -[TIWordSearch mecabraWrapper](self, "mecabraWrapper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB34C8];
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __46__TIWordSearch_keyboardActivityDidTransition___block_invoke;
    v12 = &unk_1EA107030;
    v13 = v5;
    v14 = v4;
    v7 = v5;
    objc_msgSend(v6, "blockOperationWithBlock:", &v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIWordSearch performOperationAsync:withBackgroundActivityAssertion:](self, "performOperationAsync:withBackgroundActivityAssertion:", v8, 1, v9, v10, v11, v12);

  }
}

- (void)handleMemoryPressureLevel:(unint64_t)a3 excessMemoryInBytes:(unint64_t)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  BOOL v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  unint64_t v18;
  int v19;

  +[TIKeyboardActivityController sharedController](TIKeyboardActivityController, "sharedController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "activityState");

  if (v8 == 3)
  {
    -[TIWordSearch mecabraWrapper](self, "mecabraWrapper");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = a3 - 1;
    v11 = a3 - 1 >= 3;
    v12 = (void *)MEMORY[0x1E0CB34C8];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    if (v11)
      v13 = 0;
    else
      v13 = v10 + 1;
    v16[2] = __62__TIWordSearch_handleMemoryPressureLevel_excessMemoryInBytes___block_invoke;
    v16[3] = &unk_1EA100580;
    v19 = v13;
    v17 = v9;
    v18 = a4;
    v14 = v9;
    objc_msgSend(v12, "blockOperationWithBlock:", v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIWordSearch performOperationAsync:withBackgroundActivityAssertion:](self, "performOperationAsync:withBackgroundActivityAssertion:", v15, 1);

  }
}

- (NSCache)candidatesCache
{
  NSCache *candidatesCache;
  NSCache *v4;
  NSCache *v5;

  candidatesCache = self->_candidatesCache;
  if (!candidatesCache)
  {
    v4 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    v5 = self->_candidatesCache;
    self->_candidatesCache = v4;

    candidatesCache = self->_candidatesCache;
  }
  return candidatesCache;
}

- (id)candidatesCacheKeyForOperation:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  int v7;
  const __CFString *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "inputString");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (__CFString *)v4;
  else
    v6 = &stru_1EA1081D0;
  v7 = objc_msgSend(v3, "predictionEnabled");

  if (v7)
    v8 = CFSTR("-1");
  else
    v8 = CFSTR("-0");
  -[__CFString stringByAppendingString:](v6, "stringByAppendingString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)candidatesForOperation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[TIWordSearch candidatesCacheKeyForOperation:](self, "candidatesCacheKeyForOperation:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIWordSearch candidatesCache](self, "candidatesCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[TIWordSearch uncachedCandidatesForOperation:](self, "uncachedCandidatesForOperation:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isCancelled") & 1) == 0)
    {
      if (v7)
      {
        -[TIWordSearch clearCache](self, "clearCache");
        -[TIWordSearch candidatesCache](self, "candidatesCache");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKey:", v7, v5);

      }
    }
  }

  return v7;
}

- (id)uncachedCandidatesForOperation:(id)a3
{
  return 0;
}

- (id)cachedCandidatesForOperation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[TIWordSearch candidatesCache](self, "candidatesCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIWordSearch candidatesCacheKeyForOperation:](self, "candidatesCacheKeyForOperation:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_addFacemarkCandidatesToResultSet:(id)a3 forInput:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[TIWordSearch mecabra](self, "mecabra");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = (id)MecabraCreateFacemarkCandidates();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v6, "addMecabraFacemarkCandidate:forInput:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), v7, (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (BOOL)addFacemarkCandidatesToResultSet:(id)a3 forInput:(id)a4
{
  id v6;
  id v7;
  BOOL v8;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("^_^")) & 1) == 0
    && (objc_msgSend(v7, "isEqualToString:", CFSTR("☺")) & 1) == 0
    && (objc_msgSend(v7, "isEqualToString:", CFSTR("☻")) & 1) == 0
    && (objc_msgSend(v7, "isEqualToString:", CFSTR("^_^")) & 1) == 0)
  {
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("……")) & 1) == 0
      && !objc_msgSend(v7, "isEqualToString:", CFSTR("⋯⋯")))
    {
      v8 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v6, "addSyntheticMecabraCandidateWithSurface:input:", v7, v7);
  }
  -[TIWordSearch _addFacemarkCandidatesToResultSet:forInput:](self, "_addFacemarkCandidatesToResultSet:forInput:", v6, v7);
  v8 = 1;
LABEL_9:

  return v8;
}

- (void)performAccept:(void *)a3 isPartial:(BOOL)a4
{
  _BOOL8 v4;
  TIWordSearchOperationContextAcceptCandidate *v7;

  v4 = a4;
  if (-[TIWordSearch mecabra](self, "mecabra"))
  {
    v7 = -[TIWordSearchOperationContextAcceptCandidate initWithWordSearch:mecabraCandidate:isPartial:isPrediction:]([TIWordSearchOperationContextAcceptCandidate alloc], "initWithWordSearch:mecabraCandidate:isPartial:isPrediction:", self, a3, v4, 0);
    -[TIWordSearch performOperationAsync:](self, "performOperationAsync:");
    if (!v4)
      -[TIWordSearch clearCache](self, "clearCache");

  }
}

- (void)cancel
{
  void *v3;

  +[TIWordSearch sharedOperationQueue](TIWordSearch, "sharedOperationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelAllOperations");

  if (-[TIWordSearch mecabra](self, "mecabra"))
  {
    -[TIWordSearch mecabra](self, "mecabra");
    MecabraCancelAnalysis();
  }
}

- (BOOL)isCancelled
{
  void *v2;
  char v3;

  -[TIWordSearch operation](self, "operation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCancelled");

  return v3;
}

- (void)resetPreviousWord
{
  TIWordSearchOperationAcceptCandidate *v3;

  v3 = -[TIWordSearchOperationAcceptCandidate initWithWordSearch:mecabraCandidate:isPartial:]([TIWordSearchOperationAcceptCandidate alloc], "initWithWordSearch:mecabraCandidate:isPartial:", self, 0, 0);
  -[TIWordSearch performOperationAsync:](self, "performOperationAsync:", v3);

}

- (void)performOperationAsync:(id)a3
{
  -[TIWordSearch performOperationAsync:withBackgroundActivityAssertion:](self, "performOperationAsync:withBackgroundActivityAssertion:", a3, 0);
}

- (void)performOperationAsync:(id)a3 withBackgroundActivityAssertion:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id location;
  _BYTE v27[128];
  uint64_t v28;

  v4 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v4)
  {
    +[TIKeyboardAssertionManager sharedAssertionManager](TIKeyboardAssertionManager, "sharedAssertionManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "retainBackgroundActivityAssertion");

    objc_initWeak(&location, self);
    objc_msgSend(v6, "completionBlock");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __70__TIWordSearch_performOperationAsync_withBackgroundActivityAssertion___block_invoke;
    v23[3] = &unk_1EA1005A8;
    objc_copyWeak(&v25, &location);
    v24 = v8;
    v9 = v8;
    objc_msgSend(v6, "setCompletionBlock:", v23);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    +[TIWordSearch sharedOperationQueue](TIWordSearch, "sharedOperationQueue", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "operations");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v15);
          if (objc_msgSend(v16, "isMemberOfClass:", objc_opt_class()))
          {
            v17 = v16;
            if ((objc_msgSend(v17, "isExecuting") & 1) == 0)
              objc_msgSend(v17, "cancel");

          }
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v13);
    }

  }
  +[TIWordSearch sharedOperationQueue](TIWordSearch, "sharedOperationQueue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addOperation:", v6);

}

- (void)releaseBackgroundActivityAssertion
{
  id v2;

  +[TIKeyboardAssertionManager sharedAssertionManager](TIKeyboardAssertionManager, "sharedAssertionManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "releaseBackgroundActivityAssertion");

}

- (void)lastAcceptedCandidateCorrected
{
  TIWordSearchOperationCancelLastAcceptedCandidate *v3;

  if (-[TIWordSearch mecabra](self, "mecabra"))
  {
    v3 = -[TIWordSearchOperationCancelLastAcceptedCandidate initWithWordSearch:]([TIWordSearchOperationCancelLastAcceptedCandidate alloc], "initWithWordSearch:", self);
    -[TIWordSearch performOperationAsync:](self, "performOperationAsync:", v3);

  }
}

- (void)completeOperationsInQueue
{
  void *v2;
  id v3;

  +[TIWordSearch sharedOperationQueue](TIWordSearch, "sharedOperationQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelAllOperations");

  +[TIWordSearch sharedOperationQueue](TIWordSearch, "sharedOperationQueue");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "waitUntilAllOperationsAreFinished");

}

- (void)saveLearningDictionary
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  -[TIWordSearch mecabraWrapper](self, "mecabraWrapper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__TIWordSearch_saveLearningDictionary__block_invoke;
  v6[3] = &unk_1EA106A98;
  v7 = v3;
  v4 = v3;
  +[NSBlockOperation blockOperationWithBlock:](TINoncancellableBlockOperation, "blockOperationWithBlock:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIWordSearch performOperationAsync:withBackgroundActivityAssertion:](self, "performOperationAsync:withBackgroundActivityAssertion:", v5, 1);

}

- (void)clearObservers
{
  void *v3;
  id userDictionaryObserver;
  id dictionaryUpdateObserver;
  void *v6;
  id supplementalLexiconObserver;
  void *v8;
  id contactObserver;

  if (self->_userDictionaryObserver)
  {
    +[TIUserDictionaryServer sharedInstance](TIUserDictionaryServer, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self->_userDictionaryObserver);

    userDictionaryObserver = self->_userDictionaryObserver;
    self->_userDictionaryObserver = 0;

  }
  if (self->_dictionaryUpdateObserver)
  {
    +[TIMecabraEnvironment removeMobileAssetListener:](TIMecabraEnvironment, "removeMobileAssetListener:");
    dictionaryUpdateObserver = self->_dictionaryUpdateObserver;
    self->_dictionaryUpdateObserver = 0;

  }
  if (self->_supplementalLexiconObserver)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:", self->_supplementalLexiconObserver);

    supplementalLexiconObserver = self->_supplementalLexiconObserver;
    self->_supplementalLexiconObserver = 0;

  }
  if (self->_contactObserver)
  {
    +[TITransientLexiconManager sharedInstance](TITransientLexiconManager, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeContactObserver:", self->_contactObserver);

    contactObserver = self->_contactObserver;
    self->_contactObserver = 0;

  }
}

- (void)dynamicDictionariesRemoved:(id)a3
{
  TIMecabraWrapper *mecabraWrapper;
  TIMecabraEnvironment *mecabraEnvironment;
  TIWordSearch *obj;

  -[TIWordSearch completeOperationsInQueue](self, "completeOperationsInQueue", a3);
  -[TIWordSearch clearObservers](self, "clearObservers");
  obj = self;
  objc_sync_enter(obj);
  mecabraWrapper = obj->_mecabraWrapper;
  obj->_mecabraWrapper = 0;

  mecabraEnvironment = obj->_mecabraEnvironment;
  obj->_mecabraEnvironment = 0;

  objc_sync_exit(obj);
}

- (void)insertTopSupplementalCandidateSurroundingCursorToFrontOfResultSet:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  TIWordSearch *v16;
  id v17;

  v4 = a3;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __82__TIWordSearch_insertTopSupplementalCandidateSurroundingCursorToFrontOfResultSet___block_invoke;
  v15 = &unk_1EA107030;
  v16 = self;
  v5 = v4;
  v17 = v5;
  v6 = (void (**)(_QWORD))_Block_copy(&v12);
  objc_msgSend(MEMORY[0x1E0CB3828], "currentQueue", v12, v13, v14, v15, v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[TIWordSearch sharedOperationQueue](TIWordSearch, "sharedOperationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (v9)
  {
    v6[2](v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34C8], "blockOperationWithBlock:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIWordSearch performOperationAsync:](self, "performOperationAsync:", v10);

    +[TIWordSearch sharedOperationQueue](TIWordSearch, "sharedOperationQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "waitUntilAllOperationsAreFinished");

  }
}

- (void)contactStoreDidChange:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    +[TIWordSearch recipientRecords](TIWordSearch, "recipientRecords");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAllObjects");

  }
  else
  {
    -[TIWordSearch performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, v6, 1);
  }

}

- (void)setLanguageModelAdaptationContextWithClientIdentifier:(id)a3 recipientIdentifier:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void (**v10)(void *, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  void (**v17)(void *, _QWORD);
  _QWORD aBlock[4];
  id v19;
  id v20;
  TIWordSearch *v21;
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  if (-[TIWordSearch mecabra](self, "mecabra"))
  {
    v8 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __90__TIWordSearch_setLanguageModelAdaptationContextWithClientIdentifier_recipientIdentifier___block_invoke;
    block[3] = &unk_1EA106A98;
    block[4] = self;
    if (-[TIWordSearch setLanguageModelAdaptationContextWithClientIdentifier:recipientIdentifier:]::dispatchOnce != -1)
      dispatch_once(&-[TIWordSearch setLanguageModelAdaptationContextWithClientIdentifier:recipientIdentifier:]::dispatchOnce, block);
    aBlock[0] = v8;
    aBlock[1] = 3221225472;
    aBlock[2] = __90__TIWordSearch_setLanguageModelAdaptationContextWithClientIdentifier_recipientIdentifier___block_invoke_2;
    aBlock[3] = &unk_1EA1005F0;
    v19 = v6;
    v9 = v7;
    v20 = v9;
    v21 = self;
    v10 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
    if (objc_msgSend(v9, "length"))
    {
      +[TIWordSearch recipientRecords](TIWordSearch, "recipientRecords");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        if (objc_msgSend(v12, "count"))
          v13 = v12;
        else
          v13 = 0;
        ((void (**)(void *, void *))v10)[2](v10, v13);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = v8;
        v15[1] = 3221225472;
        v15[2] = __90__TIWordSearch_setLanguageModelAdaptationContextWithClientIdentifier_recipientIdentifier___block_invoke_77;
        v15[3] = &unk_1EA100618;
        v16 = v9;
        v17 = v10;
        TIAddressBookFindRecordsMatchingRecipientsAsync(v14, v15);

      }
    }
    else
    {
      v10[2](v10, 0);
    }

  }
}

- (void)setLanguageModelAdaptationContext:(id)a3
{
  TIWordSearchOperationSetLanguageModelAdaptationContext *v4;
  id v5;

  v5 = a3;
  if (-[TIWordSearch mecabra](self, "mecabra"))
  {
    v4 = -[TIWordSearchOperationSetLanguageModelAdaptationContext initWithWordSearch:adaptationContext:]([TIWordSearchOperationSetLanguageModelAdaptationContext alloc], "initWithWordSearch:adaptationContext:", self, v5);
    -[TIWordSearch performOperationAsync:](self, "performOperationAsync:", v4);

  }
}

- (void)updateUserWordEntries
{
  void *v3;
  void *v4;
  id userDictionaryObserver;
  id v6;

  v3 = (void *)objc_opt_class();
  -[TIWordSearch mecabraWrapper](self, "mecabraWrapper");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configureUserDictionaryObserver:previousObserver:", v6, self->_userDictionaryObserver);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  userDictionaryObserver = self->_userDictionaryObserver;
  self->_userDictionaryObserver = v4;

}

- (unsigned)nameReadingPairGenerationMode
{
  return 0;
}

- (void)updateSupplementalLexicon
{
  void *v3;
  void *v4;
  void *v5;
  TIWordSearch *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void (**v12)(id, void *);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD aBlock[5];
  id v20;
  id v21;
  id location;

  -[TIWordSearch supplementalLexiconObserver](self, "supplementalLexiconObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIWordSearch supplementalLexiconObserver](self, "supplementalLexiconObserver");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:", v5);

    -[TIWordSearch setSupplementalLexiconObserver:](self, "setSupplementalLexiconObserver:", 0);
  }
  v6 = self;
  objc_sync_enter(v6);
  -[TIWordSearch mecabraWrapper](v6, "mecabraWrapper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v6);

  objc_initWeak(&location, v6);
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__TIWordSearch_updateSupplementalLexicon__block_invoke;
  aBlock[3] = &unk_1EA100640;
  aBlock[4] = v6;
  objc_copyWeak(&v21, &location);
  v20 = v7;
  v9 = v7;
  v10 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v8;
  v17[1] = 3221225472;
  v17[2] = __41__TIWordSearch_updateSupplementalLexicon__block_invoke_3;
  v17[3] = &unk_1EA100678;
  v18 = v10;
  v12 = v10;
  objc_msgSend(v11, "addObserverForName:object:queue:usingBlock:", CFSTR("TIActiveLexiconDidChangeNotification"), 0, 0, v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIWordSearch setSupplementalLexiconObserver:](v6, "setSupplementalLexiconObserver:", v13);

  +[TITransientLexiconManager sharedInstance](TITransientLexiconManager, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "supplementalLexicons");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "activeLexicon");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2](v12, v16);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (void)addContact:(id)a3 toVocabulary:(void *)a4 toReadingPairs:(id)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  long double v12;
  long double v13;
  void *v14;
  id v15;

  v15 = a3;
  v7 = a5;
  objc_msgSend(v15, "firstName");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "lastName");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!(v8 | v9))
    goto LABEL_17;
  v10 = -[TIWordSearch nameReadingPairGenerationMode](self, "nameReadingPairGenerationMode");
  -[TIWordSearch mecabraEnvironment](self, "mecabraEnvironment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  TICreateNameReadingPairFromContactAndAppendToArray(v15, v10, v11, v7);

  objc_msgSend(v15, "score");
  v13 = v12;
  if (v8 && v9)
  {
    if (((objc_msgSend((id)v8, "_containsIdeographicCharacters") & 1) != 0
       || (objc_msgSend((id)v8, "_containsHiraganaOrKatakana") & 1) != 0
       || objc_msgSend((id)v8, "_containsKorean"))
      && ((objc_msgSend((id)v9, "_containsIdeographicCharacters") & 1) != 0
       || (objc_msgSend((id)v9, "_containsHiraganaOrKatakana") & 1) != 0
       || objc_msgSend((id)v8, "_containsKorean")))
    {
      objc_msgSend((id)v9, "stringByAppendingString:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      log10(v13);
      LMVocabularyAddLemma();

    }
  }
  else
  {
    if (!v9)
      goto LABEL_15;
    if (!v8)
    {
      log10(v12);
      LMVocabularyAddLemma();
    }
  }
  log10(v13);
  LMVocabularyAddLemma();
LABEL_15:
  if (v8)
  {
    log10(v13);
    LMVocabularyAddLemma();
  }
LABEL_17:

}

- (void)updateAddressBook
{
  objc_class *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  TIWordSearch *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id contactObserver;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id location;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_contactObserver)
  {
    TIPersonalizationContactOSLogFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s %@:updateAddressBook - removing observer"), "-[TIWordSearch updateAddressBook]", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v26 = v6;
      _os_log_impl(&dword_1DA6F2000, v5, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

    }
    +[TITransientLexiconManager sharedInstance](TITransientLexiconManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeContactObserver:", self->_contactObserver);

  }
  v8 = self;
  objc_sync_enter(v8);
  -[TIWordSearch mecabraWrapper](v8, "mecabraWrapper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIWordSearch mecabraEnvironment](v8, "mecabraEnvironment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v8);

  objc_initWeak(&location, v8);
  TIPersonalizationContactOSLogFacility();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s %@:updateAddressBook - adding observer"), "-[TIWordSearch updateAddressBook]", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v26 = v12;
    _os_log_impl(&dword_1DA6F2000, v11, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

  }
  +[TITransientLexiconManager sharedInstance](TITransientLexiconManager, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __33__TIWordSearch_updateAddressBook__block_invoke;
  v19[3] = &unk_1EA1006C8;
  v20 = v4;
  v14 = v4;
  objc_copyWeak(&v23, &location);
  v21 = v10;
  v22 = v9;
  v15 = v9;
  v16 = v10;
  objc_msgSend(v13, "addContactObserver:", v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  contactObserver = self->_contactObserver;
  self->_contactObserver = v17;

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

- (BOOL)shareVocabulary
{
  return 0;
}

- (void)updateDictionaryPaths
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id dictionaryUpdateObserver;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  -[TIWordSearch mecabraWrapper](self, "mecabraWrapper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "mecabraRef");
  -[TIWordSearch inputMode](self, "inputMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[TIWordSearch sharedOperationQueue](TIWordSearch, "sharedOperationQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[TIMecabraEnvironment loadMobileAssetContentsWhenMobileAssetChangesForMecabra:inputModes:onQueue:oldMobileAssetChangeListener:](TIMecabraEnvironment, "loadMobileAssetContentsWhenMobileAssetChangesForMecabra:inputModes:onQueue:oldMobileAssetChangeListener:", v4, v6, v7, self->_dictionaryUpdateObserver);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  dictionaryUpdateObserver = self->_dictionaryUpdateObserver;
  self->_dictionaryUpdateObserver = v8;

  TIAssetsOSLogFacility();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    -[TIWordSearch inputMode](self, "inputMode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%s updateDictionaryPaths for %@"), "-[TIWordSearch updateDictionaryPaths]", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v15 = v13;
    _os_log_debug_impl(&dword_1DA6F2000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

  }
}

- (void)setDisablePersonalData:(BOOL)a3
{
  void *v4;
  _QWORD v5[5];
  BOOL v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__TIWordSearch_setDisablePersonalData___block_invoke;
  v5[3] = &unk_1EA100538;
  v5[4] = self;
  v6 = a3;
  +[NSBlockOperation blockOperationWithBlock:](TINoncancellableBlockOperation, "blockOperationWithBlock:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIWordSearch performOperationAsync:](self, "performOperationAsync:", v4);

}

- (void)adaptOfflineToParagraph:(id)a3 adaptationContext:(id)a4 timeStamp:(double)a5
{
  id v8;
  TIWordSearchOperationAdaptOffline *v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  if (-[TIWordSearch mecabra](self, "mecabra"))
  {
    v9 = -[TIWordSearchOperationAdaptOffline initWithWordSearch:paragraph:adaptationContext:timeStamp:]([TIWordSearchOperationAdaptOffline alloc], "initWithWordSearch:paragraph:adaptationContext:timeStamp:", self, v11, v8, a5);
    +[TIWordSearch sharedOperationQueue](TIWordSearch, "sharedOperationQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addOperation:", v9);

  }
}

- (void)flushDynamicData
{
  void *v3;
  TIWordSearchOperationFlushDynamicData *v4;

  if (-[TIWordSearch mecabra](self, "mecabra"))
  {
    v4 = -[TIWordSearchOperationFlushDynamicData initWithWordSearch:]([TIWordSearchOperationFlushDynamicData alloc], "initWithWordSearch:", self);
    +[TIWordSearch sharedOperationQueue](TIWordSearch, "sharedOperationQueue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addOperation:", v4);

  }
}

- (void)setLeftDocumentContext:(id)a3 rightDocumentContext:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__TIWordSearch_setLeftDocumentContext_rightDocumentContext___block_invoke;
  v11[3] = &unk_1EA1006F0;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  +[NSBlockOperation blockOperationWithBlock:](TINoncancellableBlockOperation, "blockOperationWithBlock:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIWordSearch performOperationAsync:](self, "performOperationAsync:", v10);

}

- (void)clearLeftDocumentContext
{
  void *v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__TIWordSearch_clearLeftDocumentContext__block_invoke;
  v4[3] = &unk_1EA106A98;
  v4[4] = self;
  +[NSBlockOperation blockOperationWithBlock:](TINoncancellableBlockOperation, "blockOperationWithBlock:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIWordSearch performOperationAsync:](self, "performOperationAsync:", v3);

}

- (void)adjustEnvironmentOnAction:(int64_t)a3
{
  void *v4;
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__TIWordSearch_adjustEnvironmentOnAction___block_invoke;
  v5[3] = &unk_1EA100718;
  v5[4] = self;
  v5[5] = a3;
  +[NSBlockOperation blockOperationWithBlock:](TINoncancellableBlockOperation, "blockOperationWithBlock:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIWordSearch performOperationAsync:](self, "performOperationAsync:", v4);

}

- (void)declareEndOfSentence
{
  void *v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__TIWordSearch_declareEndOfSentence__block_invoke;
  v4[3] = &unk_1EA106A98;
  v4[4] = self;
  +[NSBlockOperation blockOperationWithBlock:](TINoncancellableBlockOperation, "blockOperationWithBlock:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIWordSearch performOperationAsync:](self, "performOperationAsync:", v3);

}

- (void)commitSurface:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  TIWordSearch *v11;
  id v12;

  v4 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __30__TIWordSearch_commitSurface___block_invoke;
  v10 = &unk_1EA107030;
  v11 = self;
  v12 = v4;
  v5 = v4;
  +[NSBlockOperation blockOperationWithBlock:](TINoncancellableBlockOperation, "blockOperationWithBlock:", &v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIWordSearch performOperationAsync:](self, "performOperationAsync:", v6, v7, v8, v9, v10, v11);

}

- (void)commitPunctuationSurface:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  TIWordSearch *v11;
  id v12;

  v4 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __41__TIWordSearch_commitPunctuationSurface___block_invoke;
  v10 = &unk_1EA107030;
  v11 = self;
  v12 = v4;
  v5 = v4;
  +[NSBlockOperation blockOperationWithBlock:](TINoncancellableBlockOperation, "blockOperationWithBlock:", &v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIWordSearch performOperationAsync:](self, "performOperationAsync:", v6, v7, v8, v9, v10, v11);

}

- (void)resetMecabraEnvironment
{
  void *v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__TIWordSearch_resetMecabraEnvironment__block_invoke;
  v4[3] = &unk_1EA106A98;
  v4[4] = self;
  +[NSBlockOperation blockOperationWithBlock:](TINoncancellableBlockOperation, "blockOperationWithBlock:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIWordSearch performOperationAsync:](self, "performOperationAsync:", v3);

}

- (void)setMecabraTextContentType:(int)a3
{
  void *v4;
  _QWORD v5[5];
  int v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__TIWordSearch_setMecabraTextContentType___block_invoke;
  v5[3] = &unk_1EA100740;
  v5[4] = self;
  v6 = a3;
  +[NSBlockOperation blockOperationWithBlock:](TINoncancellableBlockOperation, "blockOperationWithBlock:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIWordSearch performOperationAsync:](self, "performOperationAsync:", v4);

}

- (void)revertInlineCandidate
{
  void *v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__TIWordSearch_revertInlineCandidate__block_invoke;
  v4[3] = &unk_1EA106A98;
  v4[4] = self;
  +[NSBlockOperation blockOperationWithBlock:](TINoncancellableBlockOperation, "blockOperationWithBlock:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIWordSearch performOperationAsync:](self, "performOperationAsync:", v3);

}

- (id)baseLayout
{
  void *v2;
  void *v3;

  -[TIWordSearch mecabraEnvironment](self, "mecabraEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "baseLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setKeyboardLayout:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  TIWordSearch *v11;
  id v12;

  v4 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __34__TIWordSearch_setKeyboardLayout___block_invoke;
  v10 = &unk_1EA107030;
  v11 = self;
  v12 = v4;
  v5 = v4;
  +[NSBlockOperation blockOperationWithBlock:](TINoncancellableBlockOperation, "blockOperationWithBlock:", &v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIWordSearch performOperationAsync:](self, "performOperationAsync:", v6, v7, v8, v9, v10, v11);

}

- (TIInputMode)inputMode
{
  return (TIInputMode *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMecabraEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_mecabraEnvironment, a3);
}

- (TIWordSearchOperationGetCandidates)operation
{
  return (TIWordSearchOperationGetCandidates *)objc_getProperty(self, a2, 56, 1);
}

- (void)setOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BOOL)autoCorrects
{
  return self->_autoCorrects;
}

- (void)setAutoCorrects:(BOOL)a3
{
  self->_autoCorrects = a3;
}

- (BOOL)shouldLearnAcceptedCandidate
{
  return self->_shouldLearnAcceptedCandidate;
}

- (void)setShouldLearnAcceptedCandidate:(BOOL)a3
{
  self->_shouldLearnAcceptedCandidate = a3;
}

- (void)setCandidatesCache:(id)a3
{
  objc_storeStrong((id *)&self->_candidatesCache, a3);
}

- (id)supplementalLexiconObserver
{
  return self->_supplementalLexiconObserver;
}

- (void)setSupplementalLexiconObserver:(id)a3
{
  objc_storeStrong(&self->_supplementalLexiconObserver, a3);
}

- (id)contactObserver
{
  return self->_contactObserver;
}

- (void)setContactObserver:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_contactObserver, 0);
  objc_storeStrong(&self->_supplementalLexiconObserver, 0);
  objc_storeStrong((id *)&self->_candidatesCache, 0);
  objc_storeStrong((id *)&self->_operation, 0);
  objc_storeStrong((id *)&self->_mecabraWrapper, 0);
  objc_storeStrong((id *)&self->_mecabraEnvironment, 0);
  objc_storeStrong((id *)&self->_inputMode, 0);
  objc_storeStrong(&self->_dictionaryUpdateObserver, 0);
  objc_storeStrong(&self->_userDictionaryObserver, 0);
}

void __34__TIWordSearch_setKeyboardLayout___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "mecabraEnvironment");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setKeyboardLayout:", *(_QWORD *)(a1 + 40));

}

void __37__TIWordSearch_revertInlineCandidate__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "mecabraEnvironment");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "revertInlineCandidate");

}

void __42__TIWordSearch_setMecabraTextContentType___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(unsigned int *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "mecabraEnvironment");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTextContentType:", v1);

}

void __39__TIWordSearch_resetMecabraEnvironment__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "mecabraEnvironment");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reset");

}

void __41__TIWordSearch_commitPunctuationSurface___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "mecabraEnvironment");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addPunctuationCandidateToContext:", *(_QWORD *)(a1 + 40));

}

void __30__TIWordSearch_commitSurface___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "mecabraEnvironment");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addStringCandidateToContext:", *(_QWORD *)(a1 + 40));

}

void __36__TIWordSearch_declareEndOfSentence__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "mecabraEnvironment");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "declareEndOfSentence");

}

void __42__TIWordSearch_adjustEnvironmentOnAction___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "mecabraEnvironment");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "adjustEnvironmentOnAction:", *(_QWORD *)(a1 + 40));

}

void __40__TIWordSearch_clearLeftDocumentContext__block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  void *v3;
  uint8_t buf[4];
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "mecabraEnvironment");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setLeftDocumentContext:", &stru_1EA1081D0);

  if (TICanLogMessageAtLevel_onceToken != -1)
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
  if (TICanLogMessageAtLevel_logLevel >= 2)
  {
    TIOSLogFacility();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s [Environment] Clear left context"), "-[TIWordSearch clearLeftDocumentContext]_block_invoke");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v5 = v3;
      _os_log_debug_impl(&dword_1DA6F2000, v2, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }
}

void __60__TIWordSearch_setLeftDocumentContext_rightDocumentContext___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "mecabraEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLeftDocumentContext:", v2);

  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "mecabraEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRightDocumentContext:", v4);

  if (TICanLogMessageAtLevel_onceToken != -1)
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
  if (TICanLogMessageAtLevel_logLevel >= 2)
  {
    TIOSLogFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 32), "mecabraEnvironment");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "leftDocumentContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "mecabraEnvironment");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "rightDocumentContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%s [Environment] Set left context: %@, Right context: %@"), "-[TIWordSearch setLeftDocumentContext:rightDocumentContext:]_block_invoke", v9, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v14 = v12;
      _os_log_debug_impl(&dword_1DA6F2000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }
}

void __39__TIWordSearch_setDisablePersonalData___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "mecabraEnvironment");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPrivateMode:", *(unsigned __int8 *)(a1 + 40));

}

void __33__TIWordSearch_updateAddressBook__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  TIPersonalizationContactOSLogFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s %@:updateAddressBook - processing %ld contacts"), "-[TIWordSearch updateAddressBook]_block_invoke", *(_QWORD *)(a1 + 32), objc_msgSend(v3, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v13 = v5;
    _os_log_impl(&dword_1DA6F2000, v4, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

  }
  v6 = (void *)objc_msgSend(v3, "copy");

  _TIQueueBackground();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_copyWeak(&v11, (id *)(a1 + 56));
  v9 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  v8 = v6;
  TIDispatchAsync();

  objc_destroyWeak(&v11);
}

void __33__TIWordSearch_updateAddressBook__block_invoke_92(id *a1)
{
  id WeakRetained;
  void *v3;
  int v4;
  uint64_t v5;
  __CFArray *Mutable;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const void *LanguageWithRegion;
  uint64_t SharedVocabulary;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t);
  void *v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(uint64_t);
  void *v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    v3 = (void *)objc_opt_new();
    v4 = objc_msgSend(WeakRetained, "shareVocabulary");
    v5 = MEMORY[0x1E0C809B0];
    if (v4)
    {
      Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
      v52 = 0;
      v53 = &v52;
      v54 = 0x3032000000;
      v55 = __Block_byref_object_copy__9287;
      v56 = __Block_byref_object_dispose__9288;
      v57 = 0;
      v47 = v5;
      v48 = 3221225472;
      v49 = __33__TIWordSearch_updateAddressBook__block_invoke_93;
      v50 = &unk_1EA107058;
      v51 = &v52;
      TIDispatchSync();
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v7 = (id)v53[5];
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v43, v60, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v44;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v44 != v10)
              objc_enumerationMutation(v7);
            LanguageWithRegion = (const void *)TIInputModeGetLanguageWithRegion();
            CFArrayAppendValue(Mutable, LanguageWithRegion);
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v43, v60, 16);
        }
        while (v9);
      }

      SharedVocabulary = LMVocabularyGetSharedVocabulary();
      LMVocabularyReset();
      LMVocabularySetLanguages();
      CFRelease(Mutable);
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v14 = a1[4];
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v59, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v40;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v40 != v17)
              objc_enumerationMutation(v14);
            objc_msgSend(a1[4], "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v18));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(WeakRetained, "addContact:toVocabulary:toReadingPairs:", v19, SharedVocabulary, v3);

            ++v18;
          }
          while (v16 != v18);
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v59, 16);
        }
        while (v16);
      }

      _Block_object_dispose(&v52, 8);
      v5 = MEMORY[0x1E0C809B0];
    }
    else
    {
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v20 = a1[4];
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v58, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v36;
        do
        {
          v24 = 0;
          do
          {
            if (*(_QWORD *)v36 != v23)
              objc_enumerationMutation(v20);
            objc_msgSend(a1[4], "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v24));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            TICreateNameReadingPairFromContactAndAppendToArray(v25, objc_msgSend(WeakRetained, "nameReadingPairGenerationMode"), a1[5], v3);

            ++v24;
          }
          while (v22 != v24);
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v58, 16);
        }
        while (v22);
      }

    }
    +[TIWordSearch sharedOperationQueue](TIWordSearch, "sharedOperationQueue");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v5;
    v30 = 3221225472;
    v31 = __33__TIWordSearch_updateAddressBook__block_invoke_2;
    v32 = &unk_1EA107030;
    v33 = a1[6];
    v34 = v3;
    v27 = v3;
    +[NSBlockOperation blockOperationWithBlock:](TINoncancellableBlockOperation, "blockOperationWithBlock:", &v29);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addOperation:", v28, v29, v30, v31, v32);

  }
}

void __33__TIWordSearch_updateAddressBook__block_invoke_93(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0DBDBA8], "sharedInputModeController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enabledInputModeIdentifiers");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __33__TIWordSearch_updateAddressBook__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "mecabraRef");
  return MecabraSetAddressBookNamePhoneticPairs();
}

void __41__TIWordSearch_updateSupplementalLexicon__block_invoke(id *a1, void *a2)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id WeakRetained;
  void *v29;
  id v30;
  void *v31;
  id obj;
  uint64_t v33;
  uint64_t v34;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[4];
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[4];
  _QWORD v57[4];
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v36 = v3;
  objc_msgSend(v3, "items");
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
  if (v37)
  {
    v33 = *(_QWORD *)v53;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v53 != v33)
          objc_enumerationMutation(obj);
        v39 = v5;
        v6 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v5);
        v7 = objc_msgSend(a1[4], "nameReadingPairGenerationMode");
        objc_msgSend(a1[4], "mecabraEnvironment");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "core_nameReadingPairsWithGenerationMode:mecabraEnvironment:", v7, v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v2 = v9;
        v10 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v49;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v49 != v12)
                objc_enumerationMutation(v2);
              v14 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
              objc_msgSend(v4, "objectForKeyedSubscript:", v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v15)
              {
                v15 = (void *)objc_opt_new();
                objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, v14);
              }
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v6, "identifier"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "addObject:", v16);

            }
            v11 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
          }
          while (v11);
        }

        v5 = v39 + 1;
      }
      while (v39 + 1 != v37);
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
    }
    while (v37);
  }
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v17 = v4;
  v40 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
  if (v40)
  {
    v34 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v40; ++j)
      {
        if (*(_QWORD *)v45 != v34)
          objc_enumerationMutation(v17);
        v19 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
        v56[0] = *MEMORY[0x1E0DE7158];
        objc_msgSend(v19, "name");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v57[0] = v20;
        v56[1] = *MEMORY[0x1E0DE7150];
        objc_msgSend(v19, "reading");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (!v21)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v2 = (id)objc_claimAutoreleasedReturnValue();
          v22 = v2;
        }
        v57[1] = v22;
        v56[2] = *MEMORY[0x1E0DE7140];
        objc_msgSend(v17, "objectForKeyedSubscript:", v19);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "allObjects");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v57[2] = v24;
        v56[3] = *MEMORY[0x1E0DE7148];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v36, "searchPrefixCharacter"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v57[3] = v25;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 4);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v21)
        objc_msgSend(v38, "addObject:", v26);

      }
      v40 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
    }
    while (v40);
  }
  v27 = v17;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend((id)objc_opt_class(), "sharedOperationQueue");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __41__TIWordSearch_updateSupplementalLexicon__block_invoke_2;
  v41[3] = &unk_1EA107030;
  v42 = a1[5];
  v43 = v38;
  v30 = v38;
  +[NSBlockOperation blockOperationWithBlock:](TINoncancellableBlockOperation, "blockOperationWithBlock:", v41);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addOperation:", v31);

}

void __41__TIWordSearch_updateSupplementalLexicon__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("TIActiveLexiconDidChangeUserInfo_ActiveLexicon"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __41__TIWordSearch_updateSupplementalLexicon__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "mecabraRef");
  return MecabraSetSupplementalLexiconEntries();
}

void __90__TIWordSearch_setLanguageModelAdaptationContextWithClientIdentifier_recipientIdentifier___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_contactStoreDidChange_, *MEMORY[0x1E0C96870], 0);

}

void __90__TIWordSearch_setLanguageModelAdaptationContextWithClientIdentifier_recipientIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  TILanguageModelAdaptationContext *v4;
  NSObject *v5;
  TIWordSearchOperationSetLanguageModelAdaptationContext *v6;
  void *v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = -[TILanguageModelAdaptationContext initWithClientIdentifier:andRecipientRecord:]([TILanguageModelAdaptationContext alloc], "initWithClientIdentifier:andRecipientRecord:", *(_QWORD *)(a1 + 32), v3);
  if (TICanLogMessageAtLevel_onceToken != -1)
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
  if (TICanLogMessageAtLevel_logLevel >= 2)
  {
    TIOSLogFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Language model adaptation context = %@, recipient = %@ (%@)"), "-[TIWordSearch setLanguageModelAdaptationContextWithClientIdentifier:recipientIdentifier:]_block_invoke_2", v4, *(_QWORD *)(a1 + 40), v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v9 = v7;
      _os_log_debug_impl(&dword_1DA6F2000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }
  v6 = -[TIWordSearchOperationSetLanguageModelAdaptationContext initWithWordSearch:adaptationContext:]([TIWordSearchOperationSetLanguageModelAdaptationContext alloc], "initWithWordSearch:adaptationContext:", *(_QWORD *)(a1 + 48), v4);
  objc_msgSend(*(id *)(a1 + 48), "performOperationAsync:", v6);

}

void __90__TIWordSearch_setLanguageModelAdaptationContextWithClientIdentifier_recipientIdentifier___block_invoke_77(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  id v7;

  objc_msgSend(a2, "objectForKey:", *(_QWORD *)(a1 + 32));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  if (objc_msgSend(v7, "count"))
    v4 = v7;
  else
    v4 = 0;
  (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  +[TIWordSearch recipientRecords](TIWordSearch, "recipientRecords");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v6 = v7;
  else
    v6 = (id)MEMORY[0x1E0C9AA70];
  objc_msgSend(v5, "setObject:forKey:", v6, *(_QWORD *)(a1 + 32));

}

void __82__TIWordSearch_insertTopSupplementalCandidateSurroundingCursorToFrontOfResultSet___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "mecabraEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findSupplementalLexiconCandidatesSurroundingCursor");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    MecabraCandidateGetSurface();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBDC88]), "initWithMecabraCandidate:input:", v3, v4);
    objc_msgSend(*(id *)(a1 + 40), "insertMecabraCandidate:mecabraCandidateRef:atIndex:", v5, v3, 0);

  }
}

uint64_t __38__TIWordSearch_saveLearningDictionary__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v4;
  uint8_t buf[4];
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (TICanLogMessageAtLevel_onceToken != -1)
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
  TIOSLogFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Calling MecabraFlushDynamicData"), "-[TIWordSearch saveLearningDictionary]_block_invoke");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v6 = v4;
    _os_log_debug_impl(&dword_1DA6F2000, v2, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "mecabraRef");
  return MecabraFlushDynamicData();
}

uint64_t __70__TIWordSearch_performOperationAsync_withBackgroundActivityAssertion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t result;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_releaseBackgroundActivityAssertion, 0, 0);

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __62__TIWordSearch_handleMemoryPressureLevel_excessMemoryInBytes___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "mecabraRef");
  return MecabraHandleMemoryPressure();
}

uint64_t __46__TIWordSearch_keyboardActivityDidTransition___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "mecabraRef");
  objc_msgSend(*(id *)(a1 + 40), "excessMemoryInBytes");
  return MecabraHandleMemoryPressure();
}

uint64_t __39__TIWordSearch_setDebuggingLogEnabled___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "mecabra");
  return MecabraSetDebuggingLogEnabled();
}

+ (id)configureUserDictionaryObserver:(id)a3 previousObserver:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v5 = a3;
  if (a4)
  {
    v6 = a4;
    +[TIUserDictionaryServer sharedInstance](TIUserDictionaryServer, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:", v6);

  }
  objc_msgSend((id)objc_opt_class(), "sharedOperationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[TIUserDictionaryServer sharedInstance](TIUserDictionaryServer, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__TIWordSearch_configureUserDictionaryObserver_previousObserver___block_invoke;
  v14[3] = &unk_1EA102930;
  v15 = v8;
  v16 = v5;
  v10 = v5;
  v11 = v8;
  objc_msgSend(v9, "addObserver:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)mecabraLearningDictionaryDirectory
{
  const __CFAllocator *v2;
  __CFString *v3;
  CFURLRef v4;

  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  UIKeyboardUserDirectory();
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = CFURLCreateWithFileSystemPath(v2, v3, kCFURLPOSIXPathStyle, 1u);

  return v4;
}

+ (id)sharedOperationQueue
{
  if (+[TIWordSearch sharedOperationQueue]::__onceToken != -1)
    dispatch_once(&+[TIWordSearch sharedOperationQueue]::__onceToken, &__block_literal_global_9335);
  return (id)+[TIWordSearch sharedOperationQueue]::__operationQueue;
}

+ (id)recipientRecords
{
  if (+[TIWordSearch recipientRecords]::dispatchOnce != -1)
    dispatch_once(&+[TIWordSearch recipientRecords]::dispatchOnce, &__block_literal_global_66);
  return (id)+[TIWordSearch recipientRecords]::__recipientRecords;
}

void __32__TIWordSearch_recipientRecords__block_invoke()
{
  TILRUDictionary *v0;
  void *v1;

  v0 = -[TILRUDictionary initWithMaximumCapacity:]([TILRUDictionary alloc], "initWithMaximumCapacity:", 10);
  v1 = (void *)+[TIWordSearch recipientRecords]::__recipientRecords;
  +[TIWordSearch recipientRecords]::__recipientRecords = (uint64_t)v0;

}

void __36__TIWordSearch_sharedOperationQueue__block_invoke()
{
  id v0;
  void *v1;

  if (!+[TIWordSearch sharedOperationQueue]::__operationQueue)
  {
    v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    v1 = (void *)+[TIWordSearch sharedOperationQueue]::__operationQueue;
    +[TIWordSearch sharedOperationQueue]::__operationQueue = (uint64_t)v0;

    objc_msgSend((id)+[TIWordSearch sharedOperationQueue]::__operationQueue, "setMaxConcurrentOperationCount:", 1);
    objc_msgSend((id)+[TIWordSearch sharedOperationQueue]::__operationQueue, "setQualityOfService:", 25);
  }
}

void __65__TIWordSearch_configureUserDictionaryObserver_previousObserver___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  id v10;
  id v11;

  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __65__TIWordSearch_configureUserDictionaryObserver_previousObserver___block_invoke_2;
    v9 = &unk_1EA107030;
    v4 = *(void **)(a1 + 32);
    v10 = *(id *)(a1 + 40);
    v11 = v3;
    +[NSBlockOperation blockOperationWithBlock:](TINoncancellableBlockOperation, "blockOperationWithBlock:", &v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addOperation:", v5, v6, v7, v8, v9);

  }
}

uint64_t __65__TIWordSearch_configureUserDictionaryObserver_previousObserver___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "mecabraRef");
  return MecabraSetUserWordKeyPairs();
}

@end
