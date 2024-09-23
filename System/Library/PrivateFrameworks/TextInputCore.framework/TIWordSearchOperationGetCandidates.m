@implementation TIWordSearchOperationGetCandidates

- (TIWordSearchOperationGetCandidates)initWithWordSearch:(id)a3 inputString:(id)a4 keyboardInput:(id)a5 segmentBreakIndex:(unint64_t)a6 predictionEnabled:(BOOL)a7 reanalysisMode:(BOOL)a8 autocapitalizationType:(unint64_t)a9 target:(id)a10 action:(SEL)a11 geometryModelData:(id)a12 hardwareKeyboardMode:(BOOL)a13 logger:(id)a14
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  TIWordSearchOperationGetCandidates *v23;
  uint64_t v24;
  NSString *inputString;
  void *v26;
  char isKindOfClass;
  uint64_t v28;
  MCAcceptCandidateInput *lastAcceptCandidateInput;
  uint64_t v30;
  MCKeyboardInput *keyboardInput;
  id v33;
  id v34;
  id v38;
  objc_super v39;

  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a10;
  v22 = a12;
  v38 = a14;
  v39.receiver = self;
  v39.super_class = (Class)TIWordSearchOperationGetCandidates;
  v23 = -[TIWordSearchOperationGetCandidates init](&v39, sel_init);
  if (v23)
  {
    v33 = v21;
    v34 = v18;
    v24 = objc_msgSend(v19, "copy");
    inputString = v23->_inputString;
    v23->_inputString = (NSString *)v24;

    objc_msgSend(v20, "composingInput");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v20, "composingInput");
      v28 = objc_claimAutoreleasedReturnValue();
      lastAcceptCandidateInput = v23->_lastAcceptCandidateInput;
      v23->_lastAcceptCandidateInput = (MCAcceptCandidateInput *)v28;

    }
    v30 = objc_msgSend(v20, "copy");
    keyboardInput = v23->_keyboardInput;
    v23->_keyboardInput = (MCKeyboardInput *)v30;

    v23->_segmentBreakIndex = a6;
    v23->_predictionEnabled = a7;
    v23->_reanalysisMode = a8;
    v23->_autocapitalizationType = a9;
    objc_storeStrong(&v23->_target, a10);
    v23->_action = a11;
    objc_storeStrong((id *)&v23->_geometryModelData, a12);
    v23->_hardwareKeyboardMode = a13;
    objc_storeStrong((id *)&v23->_logger, a14);
    objc_storeStrong((id *)&v23->_wordSearch, a3);
    -[TIWordSearchOperationGetCandidates checkForCachedResults](v23, "checkForCachedResults");
    v21 = v33;
    v18 = v34;
  }

  return v23;
}

- (void)dealloc
{
  id target;
  id v4;
  void *v5;
  objc_super v6;
  _QWORD v7[5];
  _QWORD v8[5];
  id v9;

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    target = self->_target;
    self->_target = 0;

  }
  else
  {
    v8[0] = 0;
    v8[1] = v8;
    v8[2] = 0x3032000000;
    v8[3] = __Block_byref_object_copy__18630;
    v8[4] = __Block_byref_object_dispose__18631;
    v9 = self->_target;
    v4 = self->_target;
    self->_target = 0;

    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __45__TIWordSearchOperationGetCandidates_dealloc__block_invoke;
    v7[3] = &unk_1EA107058;
    v7[4] = v8;
    objc_msgSend(v5, "addOperationWithBlock:", v7);

    _Block_object_dispose(v8, 8);
  }
  v6.receiver = self;
  v6.super_class = (Class)TIWordSearchOperationGetCandidates;
  -[TIWordSearchOperationGetCandidates dealloc](&v6, sel_dealloc);
}

- (void)checkForCachedResults
{
  void *v3;
  id v4;

  -[TIWordSearchOperationGetCandidates wordSearch](self, "wordSearch");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cachedCandidatesForOperation:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIWordSearchOperationGetCandidates setResults:](self, "setResults:", v3);

}

- (void)perform
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char isKindOfClass;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  if ((-[TIWordSearchOperationGetCandidates isCancelled](self, "isCancelled") & 1) == 0)
  {
    -[TIWordSearchOperationGetCandidates results](self, "results");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      -[TIWordSearchOperationGetCandidates wordSearch](self, "wordSearch");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "candidatesForOperation:", self);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIWordSearchOperationGetCandidates setResults:](self, "setResults:", v10);

      -[TIWordSearchOperationGetCandidates lastAcceptCandidateInput](self, "lastAcceptCandidateInput");
      v11 = objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = (void *)v11;
        -[TIWordSearchOperationGetCandidates keyboardInput](self, "keyboardInput");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "composingInput");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          -[TIWordSearchOperationGetCandidates keyboardInput](self, "keyboardInput");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "composingInput");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "remainingMecabraInputs");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIWordSearchOperationGetCandidates lastAcceptCandidateInput](self, "lastAcceptCandidateInput");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setRemainingMecabraInputs:", v18);

          -[TIWordSearchOperationGetCandidates results](self, "results");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "candidates");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "firstObject");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            objc_msgSend(v22, "input");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[TIWordSearchOperationGetCandidates lastAcceptCandidateInput](self, "lastAcceptCandidateInput");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setRemainingInputString:", v23);

          }
        }
      }
    }
  }
  if ((-[TIWordSearchOperationGetCandidates isCancelled](self, "isCancelled") & 1) == 0)
  {
    -[TIWordSearchOperationGetCandidates results](self, "results");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v25 = (id)v4;
      -[TIWordSearchOperationGetCandidates target](self, "target");
      v5 = objc_claimAutoreleasedReturnValue();
      if (!v5)
      {
LABEL_8:

        return;
      }
      v6 = (void *)v5;
      v7 = -[TIWordSearchOperationGetCandidates action](self, "action");

      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "cancelPerformSelectorsWithTarget:", self);

        -[TIWordSearchOperationGetCandidates results](self, "results");
        v25 = (id)objc_claimAutoreleasedReturnValue();
        -[TIWordSearchOperationGetCandidates performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_completeSearchOnMainThreadWithResults_, v25, 0);
        goto LABEL_8;
      }
    }
  }
}

- (void)completeSearchOnMainThreadWithResults:(id)a3
{
  id v4;
  char v5;
  void *v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    v5 = -[TIWordSearchOperationGetCandidates isCancelled](self, "isCancelled");
    v4 = v7;
    if ((v5 & 1) == 0)
    {
      -[TIWordSearchOperationGetCandidates target](self, "target");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, -[TIWordSearchOperationGetCandidates action](self, "action"), v7, self);

      v4 = v7;
    }
  }

}

- (NSString)inputString
{
  return self->_inputString;
}

- (MCKeyboardInput)keyboardInput
{
  return self->_keyboardInput;
}

- (MCAcceptCandidateInput)lastAcceptCandidateInput
{
  return self->_lastAcceptCandidateInput;
}

- (TIWordSearchCandidateResultSet)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (id)target
{
  return self->_target;
}

- (SEL)action
{
  return self->_action;
}

- (unint64_t)segmentBreakIndex
{
  return self->_segmentBreakIndex;
}

- (void)setSegmentBreakIndex:(unint64_t)a3
{
  self->_segmentBreakIndex = a3;
}

- (BOOL)predictionEnabled
{
  return self->_predictionEnabled;
}

- (BOOL)reanalysisMode
{
  return self->_reanalysisMode;
}

- (unint64_t)autocapitalizationType
{
  return self->_autocapitalizationType;
}

- (NSArray)geometryModelData
{
  return self->_geometryModelData;
}

- (BOOL)hardwareKeyboardMode
{
  return self->_hardwareKeyboardMode;
}

- (TIMecabraIMLogger)logger
{
  return self->_logger;
}

- (TIKeyboardCandidate)candidateAfterSegmentBreak
{
  return self->_candidateAfterSegmentBreak;
}

- (void)setCandidateAfterSegmentBreak:(id)a3
{
  objc_storeStrong((id *)&self->_candidateAfterSegmentBreak, a3);
}

- (TIWordSearch)wordSearch
{
  return (TIWordSearch *)objc_getProperty(self, a2, 344, 1);
}

- (void)setWordSearch:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 344);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wordSearch, 0);
  objc_storeStrong((id *)&self->_candidateAfterSegmentBreak, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_geometryModelData, 0);
  objc_storeStrong(&self->_target, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_lastAcceptCandidateInput, 0);
  objc_storeStrong((id *)&self->_keyboardInput, 0);
  objc_storeStrong((id *)&self->_inputString, 0);
}

void __45__TIWordSearchOperationGetCandidates_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

@end
