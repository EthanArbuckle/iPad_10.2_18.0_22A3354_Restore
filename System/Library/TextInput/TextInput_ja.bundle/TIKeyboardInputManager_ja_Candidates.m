@implementation TIKeyboardInputManager_ja_Candidates

- (TIKeyboardInputManager_ja_Candidates)initWithConfig:(id)a3 keyboardState:(id)a4 wordSearch:(id)a5
{
  id v9;
  TIKeyboardInputManager_ja_Candidates *v10;
  TIKeyboardInputManager_ja_Candidates *v11;
  TICandidateSorter *v12;
  TICandidateSorter *candidateSorter;
  objc_super v15;

  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TIKeyboardInputManager_ja_Candidates;
  v10 = -[TIKeyboardInputManagerMecabra initWithConfig:keyboardState:](&v15, sel_initWithConfig_keyboardState_, a3, a4);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_wordSearch, a5);
    v12 = objc_alloc_init(TICandidateSorter);
    candidateSorter = v11->_candidateSorter;
    v11->_candidateSorter = v12;

    -[TICandidateSorter setLiveConversionEnabled:](v11->_candidateSorter, "setLiveConversionEnabled:", 1);
    v11->_hardwareKeyboardMode = 1;
  }

  return v11;
}

- (id)handleKeyboardInput:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "transliterationType"))
  {
    objc_msgSend(v4, "string");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "_isSpace");

    if ((v6 & 1) == 0)
    {
      if (objc_msgSend(v4, "isBackspace"))
        -[TIKeyboardInputManagerMecabra cancelComposition](self, "cancelComposition");
      else
        -[TIKeyboardInputManagerMecabra completeComposition](self, "completeComposition");
    }
  }

  return 0;
}

- (id)keyboardConfiguration
{
  return 0;
}

- (BOOL)usesLiveConversion
{
  return 1;
}

- (BOOL)delayedCandidateList
{
  return 1;
}

- (BOOL)makeCandidatesWithInputString:(id)a3 autoCommitString:(id)a4 contextString:(id)a5 predictionEnabled:(BOOL)a6 reanalysisMode:(BOOL)a7 singlePhrase:(BOOL)a8 geometoryModelData:(id)a9
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v15;
  __CFString *v16;
  id v17;
  id v18;
  __CFString *v19;
  TIWordSearchJapaneseOperationGetCandidates *v20;
  void *v21;
  void *v22;
  TIWordSearchJapaneseOperationGetCandidates *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v28;
  uint64_t v29;

  v9 = a8;
  v10 = a6;
  v15 = a3;
  v16 = (__CFString *)a4;
  objc_storeStrong((id *)&self->_inputString, a3);
  v17 = a9;
  v18 = a5;
  if (v16)
    v19 = v16;
  else
    v19 = &stru_250122EC0;
  objc_storeStrong((id *)&self->_autoCommitString, v19);
  v20 = [TIWordSearchJapaneseOperationGetCandidates alloc];
  -[TIKeyboardInputManager_ja_Candidates wordSearch](self, "wordSearch");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringByAppendingString:", v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  BYTE2(v29) = -[TIKeyboardInputManager_ja_Candidates hardwareKeyboardMode](self, "hardwareKeyboardMode");
  LOWORD(v29) = 0;
  LOBYTE(v28) = 0;
  v23 = -[TIWordSearchJapaneseOperationGetCandidates initWithWordSearch:inputString:keyboardInput:contextString:segmentBreakIndex:predictionEnabled:reanalysisMode:autocapitalizationType:target:action:geometryModelData:flickUsed:phraseBoundarySet:hardwareKeyboardMode:logger:](v20, "initWithWordSearch:inputString:keyboardInput:contextString:segmentBreakIndex:predictionEnabled:reanalysisMode:autocapitalizationType:target:action:geometryModelData:flickUsed:phraseBoundarySet:hardwareKeyboardMode:logger:", v21, v15, 0, v22, 0x7FFFFFFFFFFFFFFFLL, v10, v28, 0, self, sel__notifyUpdateCandidates_forOperation_, v17, v29, 0);

  -[TIWordSearchJapaneseOperationGetCandidates setSinglePhrase:](v23, "setSinglePhrase:", v9);
  -[TIWordSearchJapaneseOperationGetCandidates results](v23, "results");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[TIWordSearchJapaneseOperationGetCandidates results](v23, "results");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerMecabra setWordSearchCandidateResultSet:](self, "setWordSearchCandidateResultSet:", v25);

    -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](self, "wordSearchCandidateResultSet");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_ja_Candidates _notifyUpdateCandidates:forOperation:](self, "_notifyUpdateCandidates:forOperation:", v26, v23);

  }
  else
  {
    -[TIWordSearch performOperationAsync:](self->_wordSearch, "performOperationAsync:", v23);
  }

  return 0;
}

- (void)_notifyUpdateCandidates:(id)a3 forOperation:(id)a4
{
  void *v5;
  void *v6;
  _QWORD v7[5];

  -[TIKeyboardInputManagerMecabra setWordSearchCandidateResultSet:](self, "setWordSearchCandidateResultSet:", a3, a4);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __77__TIKeyboardInputManager_ja_Candidates__notifyUpdateCandidates_forOperation___block_invoke;
  v7[3] = &unk_250122A30;
  v7[4] = self;
  v5 = (void *)MEMORY[0x2349027B0](v7);
  -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](self, "wordSearchCandidateResultSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerMecabra addProactiveTriggers:withCompletionHandler:](self, "addProactiveTriggers:withCompletionHandler:", v6, v5);

}

- (id)transliterationCandidates
{
  void *v3;
  uint64_t i;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  if (-[TIKeyboardInputManager_ja_Candidates hardwareKeyboardMode](self, "hardwareKeyboardMode"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != 5; ++i)
    {
      v5 = kTransliterationCandidatesTypes[i];
      -[TIKeyboardInputManager_ja_Candidates inputString](self, "inputString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      TIJapaneseTransliterate(v6, v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      -[TIKeyboardInputManager_ja_Candidates autoCommitString](self, "autoCommitString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringByAppendingString:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = objc_alloc(MEMORY[0x24BEB4E70]);
      -[TIKeyboardInputManager_ja_Candidates inputString](self, "inputString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initWithCandidate:forInput:label:transliterationType:", v9, v11, v7, v5);
      objc_msgSend(v3, "addObject:", v12);

    }
  }
  else
  {
    v3 = (void *)MEMORY[0x24BDBD1A8];
  }
  return v3;
}

- (int64_t)indexFromTransliterationType:(int64_t)a3
{
  int64_t result;

  result = 0;
  while (kTransliterationCandidatesTypes[result] != a3)
  {
    if (++result == 5)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (id)candidateResultSetFromCandidates:(id)a3 proactiveTriggers:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  NSString *autoCommitString;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  uint64_t v25;
  id obj;
  objc_super v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v24 = a4;
  v7 = (void *)MEMORY[0x24BDBCEB8];
  -[TIKeyboardInputManager_ja_Candidates transliterationCandidates](self, "transliterationCandidates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v6;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v29;
    do
    {
      v13 = 0;
      v25 = v11;
      do
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v13);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v14, "mecabraCandidatePointerValue");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "unsignedLongLongValue");

          v17 = objc_alloc(MEMORY[0x24BEB4E78]);
          autoCommitString = self->_autoCommitString;
          objc_msgSend(v14, "candidate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSString stringByAppendingString:](autoCommitString, "stringByAppendingString:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (void *)objc_msgSend(v17, "initWithMecabraCandidate:candidate:", v16, v20);

          if (-[TIKeyboardInputManager_ja_Candidates showsPartialCandidate](self, "showsPartialCandidate"))
            objc_msgSend(v21, "setPartialCandidate:", 0);
          objc_msgSend(v9, "addObject:", v21);

          v11 = v25;
        }
        else
        {
          objc_msgSend(v9, "addObject:", v14);
        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v11);
  }

  v27.receiver = self;
  v27.super_class = (Class)TIKeyboardInputManager_ja_Candidates;
  -[TIKeyboardInputManager_ja_Candidates candidateResultSetFromCandidates:proactiveTriggers:](&v27, sel_candidateResultSetFromCandidates_proactiveTriggers_, v9, v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[TIKeyboardInputManager_ja addFullwidthAnnotationToResultSet:](TIKeyboardInputManager_ja, "addFullwidthAnnotationToResultSet:", v22);

  return v22;
}

- (id)candidateResultSetFromCandidates:(id)a3
{
  return -[TIKeyboardInputManager_ja_Candidates candidateResultSetFromCandidates:proactiveTriggers:](self, "candidateResultSetFromCandidates:proactiveTriggers:", a3, 0);
}

- (BOOL)supportsCandidateGeneration
{
  return 0;
}

- (int64_t)transliterationCandidatesCount
{
  if (-[TIKeyboardInputManager_ja_Candidates hardwareKeyboardMode](self, "hardwareKeyboardMode"))
    return 5;
  else
    return 0;
}

+ (id)sortTitleFromSort:(unint64_t)a3
{
  if (a3 > 4)
    return 0;
  else
    return off_250122A50[a3];
}

+ (unint64_t)sortFromSortTitle:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UI-Sort-Common")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UI-Sort-Yomi")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UI-Sort-Radical")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UI-Sort-Facemark")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("UI-Sort-Emoji")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)titleForSortingMethod:(id)a3
{
  return a3;
}

- (id)sortingMethods
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;

  -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](self, "wordSearchCandidateResultSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "candidates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != 5; ++i)
    {
      v8 = (void *)objc_opt_class();
      v9 = kCandidateSorts[i];
      objc_msgSend(v8, "sortTitleFromSort:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        -[TIKeyboardInputManager_ja_Candidates candidateSorter](self, "candidateSorter");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardInputManager_ja_Candidates inputString](self, "inputString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "hasCandidatesFromCandidates:inputString:sortedBy:omittingEmoji:", v5, v12, v9, 0);

        if (v13)
          objc_msgSend(v6, "addObject:", v10);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TIKeyboardInputManager_ja_Candidates.m"), 312, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sortTitle != nil"));

      }
    }
  }
  else
  {
    v15 = (void *)MEMORY[0x24BDBCE30];
    objc_msgSend((id)objc_opt_class(), "sortTitleFromSort:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "arrayWithObject:", v16);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)groupedCandidatesFromCandidates:(id)a3 usingSortingMethod:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v9 = objc_msgSend((id)objc_opt_class(), "sortFromSortTitle:", v8);
    -[TIKeyboardInputManager_ja_Candidates candidateSorter](self, "candidateSorter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_ja_Candidates inputString](self, "inputString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "candidatesFromCandidates:inputString:sortedBy:omittingEmoji:", v7, v11, v9, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TIKeyboardInputManager_ja_Candidates.m"), 323, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sortTitle != nil"));
    v12 = 0;
  }

  return v12;
}

- (BOOL)alwaysShowExtensionCandidatesForSortingMethod:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("UI-Sort-Common")) ^ 1;
}

- (id)indexTitlesForGroupTitles:(id)a3 sortingMethod:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("UI-Sort-Yomi")) & 1) != 0)
    v6 = &unk_2501284F0;
  else
    v6 = v5;

  return v6;
}

- (BOOL)_adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4
{
  _BOOL4 v5;
  int v8;
  const char *v9;
  __int16 v10;
  _BOOL4 v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v5 = a3;
  v14 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315650;
    v9 = "-[TIKeyboardInputManager_ja_Candidates _adjustPhraseBoundaryInForwardDirection:granularity:]";
    v10 = 1024;
    v11 = v5;
    v12 = 1024;
    v13 = a4;
    _os_log_impl(&dword_232303000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s  adjust phrase: %d %d", (uint8_t *)&v8, 0x18u);
  }
  -[TIKeyboardInputManagerMecabra cancelComposition](self, "cancelComposition");
  return 0;
}

- (id)handleAcceptedCandidate:(id)a3 keyboardState:(id)a4
{
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;

  v5 = a3;
  -[TIKeyboardInputManager_ja_Candidates inputString](self, "inputString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");
  objc_msgSend(v5, "input");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 <= objc_msgSend(v8, "length"))
  {
    v9 = 0;
  }
  else
  {
    objc_opt_class();
    v9 = objc_opt_isKindOfClass() ^ 1;
  }

  v10 = -[TIKeyboardInputManagerMecabra mecabraCandidateRefFromCandidate:](self, "mecabraCandidateRefFromCandidate:", v5);
  -[TIKeyboardInputManager_ja_Candidates wordSearch](self, "wordSearch");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "performAccept:isPartial:", v10, v9 & 1);

  -[TIKeyboardInputManagerMecabra completeComposition](self, "completeComposition");
  return 0;
}

- (id)wordSearch
{
  return self->_wordSearch;
}

- (BOOL)showsPartialCandidate
{
  return self->_showsPartialCandidate;
}

- (void)setShowsPartialCandidate:(BOOL)a3
{
  self->_showsPartialCandidate = a3;
}

- (BOOL)autoSelectFirstCandidate
{
  return self->_autoSelectFirstCandidate;
}

- (void)setAutoSelectFirstCandidate:(BOOL)a3
{
  self->_autoSelectFirstCandidate = a3;
}

- (NSString)autoSelectCandidate
{
  return self->_autoSelectCandidate;
}

- (void)setAutoSelectCandidate:(id)a3
{
  self->_autoSelectCandidate = (NSString *)a3;
}

- (int64_t)autoSelectTransliterateCandidate
{
  return self->_autoSelectTransliterateCandidate;
}

- (void)setAutoSelectTransliterateCandidate:(int64_t)a3
{
  self->_autoSelectTransliterateCandidate = a3;
}

- (BOOL)hardwareKeyboardMode
{
  return self->_hardwareKeyboardMode;
}

- (void)setHardwareKeyboardMode:(BOOL)a3
{
  self->_hardwareKeyboardMode = a3;
}

- (TICandidateSorter)candidateSorter
{
  return self->_candidateSorter;
}

- (void)setCandidateSorter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 816);
}

- (NSString)inputString
{
  return self->_inputString;
}

- (void)setInputString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 824);
}

- (TIKeyboardCandidate)defaultCandidate
{
  return self->_defaultCandidate;
}

- (void)setDefaultCandidate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 832);
}

- (NSString)autoCommitString
{
  return self->_autoCommitString;
}

- (void)setAutoCommitString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 840);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoCommitString, 0);
  objc_storeStrong((id *)&self->_defaultCandidate, 0);
  objc_storeStrong((id *)&self->_inputString, 0);
  objc_storeStrong((id *)&self->_candidateSorter, 0);
  objc_storeStrong((id *)&self->_wordSearch, 0);
}

@end
