@implementation TIWordSearchKana

+ (id)sharedMecabraWrapper
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v2 = a1;
  objc_sync_enter(v2);
  v3 = (void *)__mecabraWrapper;
  if (!__mecabraWrapper)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BEB5418]), "initWithInputMethodType:learningDictionaryDirectoryURL:creationOptions:", 1, objc_msgSend((id)objc_opt_class(), "mecabraLearningDictionaryDirectory"), 3);
    v5 = (void *)__mecabraWrapper;
    __mecabraWrapper = v4;

    objc_msgSend((id)objc_opt_class(), "configureContactCollectionObserver:previousObserver:", __mecabraWrapper, __contactCollectionObserver);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)__contactCollectionObserver;
    __contactCollectionObserver = v6;

    objc_msgSend((id)objc_opt_class(), "configureUserDictionaryObserver:previousObserver:", __mecabraWrapper, __userDictionaryObserver);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)__userDictionaryObserver;
    __userDictionaryObserver = v8;

    v3 = (void *)__mecabraWrapper;
  }
  v10 = v3;
  objc_sync_exit(v2);

  return v10;
}

+ (void)resetSharedMecabraWrapper
{
  void *v2;
  id obj;

  obj = a1;
  objc_sync_enter(obj);
  v2 = (void *)__mecabraWrapper;
  __mecabraWrapper = 0;

  objc_sync_exit(obj);
}

+ (id)configureContactCollectionObserver:(id)a3 previousObserver:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend((id)objc_opt_class(), "sharedOperationQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  TIPersonalizationContactOSLogFacility();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s TIWordSearchKana:configureContactCollectionObserver - adding observer"), "+[TIWordSearchKana configureContactCollectionObserver:previousObserver:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v23 = v9;
    _os_log_impl(&dword_232303000, v8, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x24BEB5440], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __72__TIWordSearchKana_configureContactCollectionObserver_previousObserver___block_invoke;
  v19[3] = &unk_250122750;
  v11 = v7;
  v20 = v11;
  v12 = v5;
  v21 = v12;
  objc_msgSend(v10, "addContactObserver:", v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    TIPersonalizationContactOSLogFacility();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s TIWordSearchKana:configureContactCollectionObserver - removing observer"), "+[TIWordSearchKana configureContactCollectionObserver:previousObserver:]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v23 = v15;
      _os_log_impl(&dword_232303000, v14, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BEB5440], "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeContactObserver:", v6);

  }
  v17 = (void *)MEMORY[0x2349027B0](v13);

  return v17;
}

void __72__TIWordSearchKana_configureContactCollectionObserver_previousObserver___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  TIPersonalizationContactOSLogFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s TITextCheckerExemptions:addObserverAssertion - processing %ld contacts"), "+[TIWordSearchKana configureContactCollectionObserver:previousObserver:]_block_invoke", objc_msgSend(v3, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v15 = v5;
    _os_log_impl(&dword_232303000, v4, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

  }
  v6 = (void *)objc_msgSend(v3, "copy");

  v7 = (void *)MEMORY[0x24BEB5420];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __72__TIWordSearchKana_configureContactCollectionObserver_previousObserver___block_invoke_6;
  v11[3] = &unk_250122728;
  v8 = *(void **)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  v13 = v6;
  v9 = v6;
  objc_msgSend(v7, "blockOperationWithBlock:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addOperation:", v10);

}

uint64_t __72__TIWordSearchKana_configureContactCollectionObserver_previousObserver___block_invoke_6(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "mecabraRef");
  TICreateNameReadingPairsFromContactCollection();
  return MecabraSetAddressBookNamePhoneticPairs();
}

- (int)mecabraInputMethodType
{
  return 1;
}

- (unint64_t)mecabraCreationOptions
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1 | 2;
}

- (id)initTIWordSearchWithInputMode:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "sharedMecabraWrapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TIWordSearchKana initTIWordSearchWithInputMode:mecabraWrapper:](self, "initTIWordSearchWithInputMode:mecabraWrapper:", v4, v5);

  return v6;
}

- (id)initTIWordSearchWithInputMode:(id)a3 mecabraWrapper:(id)a4
{
  id v4;
  void *v5;
  _QWORD *v6;
  _QWORD block[4];
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TIWordSearchKana;
  v4 = -[TIWordSearch initTIWordSearchWithInputMode:mecabraWrapper:](&v10, sel_initTIWordSearchWithInputMode_mecabraWrapper_, a3, a4);
  v5 = v4;
  if (v4)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __65__TIWordSearchKana_initTIWordSearchWithInputMode_mecabraWrapper___block_invoke;
    block[3] = &unk_250122778;
    v6 = v4;
    v9 = v6;
    if (-[TIWordSearchKana initTIWordSearchWithInputMode:mecabraWrapper:]::onceToken != -1)
      dispatch_once(&-[TIWordSearchKana initTIWordSearchWithInputMode:mecabraWrapper:]::onceToken, block);
    v6[11] = 0x7FFFFFFFFFFFFFFFLL;

  }
  return v5;
}

uint64_t __65__TIWordSearchKana_initTIWordSearchWithInputMode_mecabraWrapper___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateDictionaryPaths");
}

- (void)dealloc
{
  objc_super v3;

  -[TIWordSearch completeOperationsInQueue](self, "completeOperationsInQueue");
  v3.receiver = self;
  v3.super_class = (Class)TIWordSearchKana;
  -[TIWordSearch dealloc](&v3, sel_dealloc);
}

- (void)setInsertKatakanaAtIndex:(unint64_t)a3
{
  self->_insertKatakanaAtIndex = a3;
}

- (BOOL)shouldMoveCursor:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (-[TIWordSearchKana supportsPairedPunctutationInput](self, "supportsPairedPunctutationInput"))
  {
    if (pairedPunctuations(void)::__onceToken != -1)
      dispatch_once(&pairedPunctuations(void)::__onceToken, &__block_literal_global_0);
    v5 = objc_msgSend((id)pairedPunctuations(void)::__pairedPunctuations, "containsObject:", v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)candidateForDefault:(id)a3 rawInputString:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = -[TIWordSearchKana shouldMoveCursor:](self, "shouldMoveCursor:", v7);
  objc_msgSend(MEMORY[0x24BEB4E20], "candidateWithCandidate:forInput:cursorMovement:", v7, v6, v8 << 63 >> 63);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)_insertString:(id)a3 input:(id)a4 at:(unint64_t)a5 force:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  BOOL v12;
  void *v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v24;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = 0;
  if (v10 && a5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend(v10, "length"))
    {
      -[TIWordSearchKana candidateResultSet](self, "candidateResultSet");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "candidates");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = objc_msgSend(v14, "count");
      if (v15 >= a5)
        v16 = a5;
      else
        v16 = v15;
      v24 = v16;
      if (v15)
      {
        v17 = v15;
        v18 = 0;
        v19 = 0;
        while (1)
        {
          v20 = v19;
          objc_msgSend(v14, "objectAtIndex:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "candidate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v20) = objc_msgSend(v10, "isEqualToString:", v21);

          if ((_DWORD)v20)
            break;
          if (v17 == ++v18)
            goto LABEL_14;
        }
        if (v24 >= v18 && v17 != v18 && !v6)
        {
          v12 = 0;
LABEL_21:

          goto LABEL_22;
        }
        -[TIWordSearchKana candidateResultSet](self, "candidateResultSet");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "moveCandidate:fromIndex:toIndex:", v19, v18, v24);
      }
      else
      {
        v19 = 0;
LABEL_14:
        -[TIWordSearchKana candidateResultSet](self, "candidateResultSet");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "insertSyntheticMecabraCandidateWithSurface:input:atIndex:", v10, v11, v24);
      }

      v12 = 1;
      goto LABEL_21;
    }
    v12 = 0;
  }
LABEL_22:

  return v12;
}

- (BOOL)isAnalyzingJapaneseRomaji
{
  return 0;
}

- (id)candidatesCacheKeyForOperation:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;

  v3 = a3;
  objc_msgSend(v3, "keyboardInput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(v3, "inputString");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (objc_msgSend(v4, "hasKindOf:", objc_opt_class()))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lud"), v4);
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = (void *)v5;
    goto LABEL_8;
  }
  objc_msgSend(v4, "asSearchString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingFormat:", CFSTR("%lud"), objc_msgSend(v4, "asSearchTextCursorIndex"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "length"))
  {
    objc_msgSend(v4, "asInlineText");
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }
LABEL_8:
  if ((objc_msgSend(v3, "phraseBoundarySet") & 1) != 0 || (objc_msgSend(v3, "predictionEnabled") & 1) == 0)
  {
    objc_msgSend(v6, "stringByAppendingString:", CFSTR(" *"));
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v9;
  }
  if (objc_msgSend(v3, "allowIncompleteRomaji"))
  {
    objc_msgSend(v6, "stringByAppendingString:", CFSTR(" #"));
    v10 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v10;
  }
  if (objc_msgSend(v3, "referenceMode"))
  {
    objc_msgSend(v6, "stringByAppendingString:", CFSTR(" r"));
    v11 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v11;
  }
  if (objc_msgSend(v3, "segmentBreakIndex") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = v6;
  }
  else
  {
    objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(" %ld"), objc_msgSend(v3, "segmentBreakIndex"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  return v13;
}

- (id)makeCandidates:(id)a3 input:(id)a4 contextString:(id)a5 predictionEnabled:(BOOL)a6 reanalysisMode:(BOOL)a7 withInputManager:(id)a8 geometryModelData:(id)a9 flickUsed:(BOOL)a10 hardwareKeyboardMode:(BOOL)a11 referenceMode:(BOOL)a12 singlePhrase:(BOOL)a13
{
  _BOOL4 v14;
  _BOOL4 v15;
  id v19;
  unint64_t v20;
  unint64_t v21;
  id v22;
  uint64_t v23;
  _BOOL4 v24;
  uint64_t v25;
  uint64_t v26;
  _BOOL4 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  int v40;
  uint64_t NextCandidate;
  uint64_t v42;
  void *v43;
  id v45;
  id v46;

  v14 = a7;
  v15 = a6;
  v19 = a3;
  v20 = (unint64_t)a4;
  v45 = a5;
  v46 = a8;
  v21 = (unint64_t)a9;
  v22 = objc_alloc_init(MEMORY[0x24BEB5468]);
  if (v15)
    v23 = 0;
  else
    v23 = 2;
  if (-[TIWordSearchKana isAnalyzingJapaneseRomaji](self, "isAnalyzingJapaneseRomaji"))
    v23 |= 0x100uLL;
  v24 = -[TIWordSearch shouldLearnAcceptedCandidate](self, "shouldLearnAcceptedCandidate");
  v25 = v23 | 0x80;
  if (v24)
    v25 = v23;
  if (v14)
    v25 |= 0x4000uLL;
  if (!v14 || a12)
    v26 = v25 | 8;
  else
    v26 = v25;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (!a10 && !-[TIWordSearchKana flickOnly](self, "flickOnly"))
      v26 |= 0x1000000uLL;
    if (!-[TIWordSearchKana flickOnly](self, "flickOnly"))
      v26 |= 0x4000000uLL;
  }
  v27 = -[TIWordSearch autoCorrects](self, "autoCorrects");
  v28 = v26 | 0x40;
  if (v20 | v21)
    v29 = v26 | 0x40;
  else
    v29 = v26;
  if (!v15)
    v28 = v26;
  if (a11)
    v29 = v28;
  if (!v27)
    v29 = v26;
  v30 = v29 | a12;
  if (a13)
    v30 |= 0x400000uLL;
  if (a11)
    v31 = v30 | 0x20000000;
  else
    v31 = v30;
  -[TIWordSearch mecabraEnvironment](self, "mecabraEnvironment");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setGeometryModel:modelData:", v46, v21);

  if (!objc_msgSend(v19, "length"))
  {
    objc_msgSend((id)v20, "inputs");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "count");

    if (!v34)
    {
      -[TIWordSearch mecabraEnvironment](self, "mecabraEnvironment");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setLeftDocumentContext:", v45);

      -[TIWordSearch mecabraEnvironment](self, "mecabraEnvironment");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "adjustEnvironmentDirectly:", 0);

    }
  }
  -[TIWordSearch mecabraEnvironment](self, "mecabraEnvironment");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v37;
  if (v20)
  {
    v39 = objc_msgSend(v37, "analyzeInput:options:", v20, v31);

    if ((v39 & 1) == 0)
      goto LABEL_43;
  }
  else
  {
    v40 = objc_msgSend(v37, "analyzeString:options:", v19, v31);

    if (!v40)
      goto LABEL_43;
  }
  -[TIWordSearch mecabra](self, "mecabra");
  NextCandidate = MecabraGetNextCandidate();
  if (NextCandidate)
  {
    v42 = NextCandidate;
    do
    {
      v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB4E80]), "initWithMecabraCandidate:cursorMovement:", v42, -[TIWordSearchKana shouldMoveCursor:](self, "shouldMoveCursor:", MecabraCandidateGetSurface()) << 63 >> 63);
      objc_msgSend(v22, "addMecabraCandidate:mecabraCandidateRef:", v43, v42);

      -[TIWordSearch mecabra](self, "mecabra");
      v42 = MecabraGetNextCandidate();
    }
    while (v42);
  }
LABEL_43:
  if (!objc_msgSend(v19, "length"))
    -[TIWordSearch insertTopSupplementalCandidateSurroundingCursorToFrontOfResultSet:](self, "insertTopSupplementalCandidateSurroundingCursorToFrontOfResultSet:", v22);

  return v22;
}

- (void)updateMecabraState
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TIWordSearchKana;
  -[TIWordSearch updateMecabraState](&v3, sel_updateMecabraState);
  -[TIWordSearch updateUserWordEntries](self, "updateUserWordEntries");
}

- (void)dynamicDictionariesRemoved:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  -[TIWordSearch mecabraWrapper](self, "mecabraWrapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)TIWordSearchKana;
  -[TIWordSearch dynamicDictionariesRemoved:](&v8, sel_dynamicDictionariesRemoved_, v4);

  objc_msgSend((id)objc_opt_class(), "sharedMecabraWrapper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
    objc_msgSend((id)objc_opt_class(), "resetSharedMecabraWrapper");
  objc_msgSend((id)objc_opt_class(), "sharedMecabraWrapper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIWordSearch setMecabraWrapper:](self, "setMecabraWrapper:", v7);

  -[TIWordSearch updateDictionaryPaths](self, "updateDictionaryPaths");
}

- (TIWordSearchCandidateResultSet)candidateResultSet
{
  return self->_candidateResultSet;
}

- (void)setCandidateResultSet:(id)a3
{
  objc_storeStrong((id *)&self->_candidateResultSet, a3);
}

- (BOOL)supportsPairedPunctutationInput
{
  return self->_supportsPairedPunctutationInput;
}

- (void)setSupportsPairedPunctutationInput:(BOOL)a3
{
  self->_supportsPairedPunctutationInput = a3;
}

- (BOOL)flickOnly
{
  return self->_flickOnly;
}

- (void)setFlickOnly:(BOOL)a3
{
  self->_flickOnly = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateResultSet, 0);
}

+ (void)clearCachedContactObserver
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (__contactCollectionObserver)
  {
    TIPersonalizationContactOSLogFacility();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s TIWordSearchKana:clearCachedContactObserver - removing observer"), "+[TIWordSearchKana(TestingSupport) clearCachedContactObserver]");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v7 = v3;
      _os_log_impl(&dword_232303000, v2, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BEB5440], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeContactObserver:", __contactCollectionObserver);

    v5 = (void *)__contactCollectionObserver;
    __contactCollectionObserver = 0;

  }
}

@end
