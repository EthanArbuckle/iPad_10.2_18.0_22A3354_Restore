@implementation TIKeyboardInputManager_zh_Candidates

- (TIKeyboardInputManager_zh_Candidates)initWithConfig:(id)a3 keyboardState:(id)a4 wordSearch:(id)a5
{
  id v9;
  TIKeyboardInputManager_zh_Candidates *v10;
  TIKeyboardInputManager_zh_Candidates *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)TIKeyboardInputManager_zh_Candidates;
  v10 = -[TIKeyboardInputManagerChinesePhonetic initWithConfig:keyboardState:](&v13, sel_initWithConfig_keyboardState_, a3, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_kbws, a5);

  return v11;
}

- (BOOL)shouldClearInputOnMarkedTextOutOfSync
{
  return 0;
}

- (id)keyboardConfiguration
{
  return 0;
}

- (BOOL)makeCandidatesWithInputString:(id)a3 autoCommitString:(id)a4 predictionEnabled:(BOOL)a5 reanalysisMode:(BOOL)a6 geometoryModelData:(id)a7
{
  id v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;

  v10 = a3;
  v11 = (__CFString *)a4;
  objc_storeStrong((id *)&self->_inputString, a3);
  if (v11)
    v12 = v11;
  else
    v12 = &stru_25012F088;
  objc_storeStrong((id *)&self->_autoCommitString, v12);
  -[TIKeyboardInputManager_zh_Candidates inputStringForLastCharacter:](self, "inputStringForLastCharacter:", self->_inputString);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager_zh_Candidates setWholePhraseCandidateResultSet:](self, "setWholePhraseCandidateResultSet:", 0);
  -[TIKeyboardInputManager_zh_Candidates setLastCharacterCandidateResultSet:](self, "setLastCharacterCandidateResultSet:", 0);
  -[TIKeyboardInputManager_zh_Candidates setSkipLastCharacterCandidates:](self, "setSkipLastCharacterCandidates:", v13 == 0);
  -[TIKeyboardInputManager_zh_Candidates performWordSearch:action:waitUntilFinished:](self, "performWordSearch:action:waitUntilFinished:", v10, sel__notifyWholePhraseCandidate_forOperation_, 1);
  if (v13)
    -[TIKeyboardInputManager_zh_Candidates performWordSearch:action:waitUntilFinished:](self, "performWordSearch:action:waitUntilFinished:", v13, sel__notifyLastCharacterCandidate_forOperation_, 0);

  return 0;
}

- (id)inputStringForLastCharacter:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "length") < 2)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "zhuyinToneCharacterSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "rangeOfCharacterFromSet:options:range:", v4, 4, 0, objc_msgSend(v3, "length") - 1);

    v6 = 0;
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v3, "substringFromIndex:", v5 + 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v6;
}

- (void)_notifyWholePhraseCandidate:(id)a3 forOperation:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id from;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v5 = a3;
  objc_initWeak(&location, self);
  v6 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __81__TIKeyboardInputManager_zh_Candidates__notifyWholePhraseCandidate_forOperation___block_invoke;
  v14[3] = &unk_25012EFD8;
  objc_copyWeak(&v16, &location);
  v15 = v5;
  v7 = v5;
  v8 = (void *)MEMORY[0x23490416C](v14);
  objc_initWeak(&from, self);
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __81__TIKeyboardInputManager_zh_Candidates__notifyWholePhraseCandidate_forOperation___block_invoke_2;
  v10[3] = &unk_25012F000;
  objc_copyWeak(&v12, &from);
  v11 = v8;
  v9 = v8;
  -[TIKeyboardInputManagerMecabra addStickers:withCompletionHandler:](self, "addStickers:withCompletionHandler:", v7, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&from);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)_notifyLastCharacterCandidate:(id)a3 forOperation:(id)a4
{
  -[TIKeyboardInputManager_zh_Candidates setLastCharacterCandidateResultSet:](self, "setLastCharacterCandidateResultSet:", a3, a4);
  -[TIKeyboardInputManager_zh_Candidates _notifyUpdateCandidates](self, "_notifyUpdateCandidates");
}

- (void)_notifyUpdateCandidates
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[TIKeyboardInputManager_zh_Candidates wholePhraseCandidateResultSet](self, "wholePhraseCandidateResultSet");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    if (-[TIKeyboardInputManager_zh_Candidates skipLastCharacterCandidates](self, "skipLastCharacterCandidates"))
    {

    }
    else
    {
      -[TIKeyboardInputManager_zh_Candidates lastCharacterCandidateResultSet](self, "lastCharacterCandidateResultSet");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
        return;
    }
    -[TIKeyboardInputManager_zh_Candidates wholePhraseCandidateResultSet](self, "wholePhraseCandidateResultSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_zh_Candidates lastCharacterCandidateResultSet](self, "lastCharacterCandidateResultSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_zh_Candidates candidateResultSetFromCandidateResultSet:lastCharacterCandidateResultSet:](self, "candidateResultSetFromCandidateResultSet:lastCharacterCandidateResultSet:", v6, v7);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "candidates");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDefaultCandidate:", v9);

    -[TIKeyboardInputManager_zh_Candidates closeCandidateGenerationContextWithResults:](self, "closeCandidateGenerationContextWithResults:", v10);
  }
}

- (id)candidateResultSetFromCandidateResultSet:(id)a3 lastCharacterCandidateResultSet:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t v19;
  id v20;
  NSString *autoCommitString;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  _QWORD v57[5];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v8;
  v53 = v7;
  v54 = v6;
  if (v6)
  {
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    objc_msgSend(v6, "candidates");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
    if (!v10)
      goto LABEL_13;
    v11 = v10;
    v12 = *(_QWORD *)v63;
    while (1)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v63 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
        objc_msgSend(v14, "input");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "isEqualToString:", self->_inputString))
        {
          objc_msgSend(v14, "label");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", self->_inputString);

          if ((v17 & 1) != 0)
            continue;
          objc_msgSend(v14, "mecabraCandidatePointerValue");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "unsignedLongLongValue");

          v20 = objc_alloc(MEMORY[0x24BEB4E78]);
          autoCommitString = self->_autoCommitString;
          objc_msgSend(v14, "candidate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSString stringByAppendingString:](autoCommitString, "stringByAppendingString:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)objc_msgSend(v20, "initWithMecabraCandidate:candidate:", v19, v23);

          objc_msgSend(v56, "addObject:", v15);
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
      if (!v11)
      {
LABEL_13:

        -[TIKeyboardInputManager_zh_Candidates punctuationCandiadtesFor:withAutoCommit:](self, "punctuationCandiadtesFor:withAutoCommit:", self->_inputString, self->_autoCommitString);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v56;
        objc_msgSend(v56, "addObjectsFromArray:", v24);

        v7 = v53;
        v6 = v54;
        break;
      }
    }
  }
  if (v7)
  {
    -[TIKeyboardInputManager_zh_Candidates inputStringForLastCharacter:](self, "inputStringForLastCharacter:", self->_inputString);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "candidates");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "firstObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "label");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v56;
    v52 = v28;
    objc_msgSend(v28, "_stringByTrimmingLastCharacter");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString stringByAppendingString:](self->_autoCommitString, "stringByAppendingString:");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    objc_msgSend(v7, "candidates");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v59;
      do
      {
        for (j = 0; j != v31; ++j)
        {
          if (*(_QWORD *)v59 != v32)
            objc_enumerationMutation(v29);
          v34 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * j);
          objc_msgSend(v34, "label");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "isEqualToString:", v25);

          if ((v36 & 1) == 0)
          {
            objc_msgSend(v34, "mecabraCandidatePointerValue");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v37, "unsignedLongLongValue");

            v39 = objc_alloc(MEMORY[0x24BEB4E78]);
            objc_msgSend(v34, "candidate");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "stringByAppendingString:", v40);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = (void *)objc_msgSend(v39, "initWithMecabraCandidate:candidate:", v38, v41);

            v8 = v56;
            objc_msgSend(v56, "addObject:", v42);

          }
        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
      }
      while (v31);
    }

    -[TIKeyboardInputManager_zh_Candidates punctuationCandiadtesFor:withAutoCommit:](self, "punctuationCandiadtesFor:withAutoCommit:", v25, v55);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v43);

    v7 = v53;
    v6 = v54;
  }
  v44 = objc_alloc(MEMORY[0x24BEB4E20]);
  -[TIKeyboardInputManager_zh_Candidates syntheticCandidate](self, "syntheticCandidate");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager_zh_Candidates syntheticCandidate](self, "syntheticCandidate");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)objc_msgSend(v44, "initWithCandidate:forInput:rawInput:extensionCandidate:", v45, v46, 0, 1);

  objc_msgSend(v47, "setTypingEngine:", 5);
  objc_msgSend(v8, "addObject:", v47);
  v57[0] = MEMORY[0x24BDAC760];
  v57[1] = 3221225472;
  v57[2] = __113__TIKeyboardInputManager_zh_Candidates_candidateResultSetFromCandidateResultSet_lastCharacterCandidateResultSet___block_invoke;
  v57[3] = &unk_25012F028;
  v57[4] = self;
  v48 = objc_msgSend(v8, "indexOfObjectPassingTest:", v57);
  if (v48 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[TIKeyboardInputManager_zh_Candidates candidateResultSetFromCandidates:](self, "candidateResultSetFromCandidates:", v8);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v8, "exchangeObjectAtIndex:withObjectAtIndex:", 0, v48);
    -[TIKeyboardInputManager_zh_Candidates candidateResultSetFromCandidates:](self, "candidateResultSetFromCandidates:", v8);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setInitialSelectedIndex:", 0);
  }

  return v49;
}

- (id)candidateResultSetFromCandidates:(id)a3
{
  return -[TIKeyboardInputManagerChinese candidateResultSetFromCandidates:proactiveTriggers:](self, "candidateResultSetFromCandidates:proactiveTriggers:", a3, 0);
}

- (BOOL)supportsCandidateGeneration
{
  return 0;
}

- (id)handleKeyboardInput:(id)a3
{
  if (objc_msgSend(a3, "isBackspace"))
    -[TIKeyboardInputManagerMecabra cancelComposition](self, "cancelComposition");
  return 0;
}

- (BOOL)supportsNumberKeySelection
{
  return 1;
}

- (BOOL)usesLiveConversion
{
  return 1;
}

- (BOOL)delayedCandidateList
{
  return 1;
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
  -[TIKeyboardInputManager_zh_Candidates inputString](self, "inputString");
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

  v10 = -[TIKeyboardInputManager_zh_Candidates mecabraCandidateRefFromCandidate:](self, "mecabraCandidateRefFromCandidate:", v5);
  -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "performAccept:isPartial:", v10, v9 & 1);

  -[TIKeyboardInputManagerMecabra completeComposition](self, "completeComposition");
  return 0;
}

- (void)performWordSearch:(id)a3 action:(SEL)a4 waitUntilFinished:(BOOL)a5
{
  _BOOL4 v5;
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v5 = a5;
  v8 = (objc_class *)MEMORY[0x24BEB5288];
  v9 = a3;
  v10 = [v8 alloc];
  LOBYTE(v14) = 1;
  BYTE2(v13) = 0;
  LOWORD(v13) = 1;
  v15 = (id)objc_msgSend(v10, "initWithWordSearch:inputString:keyboardInput:segmentBreakIndex:disambiguationCandidates:unambiguousSyllableCount:selectedDisambiguationCandidateIndex:regenerateDisambiguationCandidates:predictionEnabled:reanalysisMode:target:action:geometryModelData:hardwareKeyboardMode:logger:", self->_kbws, v9, 0, 0x7FFFFFFFFFFFFFFFLL, 0, 0, 0x7FFFFFFFFFFFFFFFLL, v13, self, a4, MEMORY[0x24BDBD1A8], v14, 0);

  objc_msgSend(v15, "results");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v15, "results");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(self, a4, v12, v15);

  }
  else
  {
    -[TIWordSearch performOperationAsync:](self->_kbws, "performOperationAsync:", v15);
    if (v5)
      objc_msgSend(v15, "waitUntilFinished");
  }

}

- (id)punctuationCandiadtesFor:(id)a3 withAutoCommit:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id obj;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v24 = a4;
  +[TIZhuyinPunctuationManager shareZhuyinPunctuationManager](TIZhuyinPunctuationManager, "shareZhuyinPunctuationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  objc_msgSend(v6, "candidatesFor:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v13);
        v15 = objc_alloc(MEMORY[0x24BEB4E70]);
        objc_msgSend(v14, "candidate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "stringByAppendingString:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "label");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v15, "initWithCandidate:forInput:label:", v17, v7, v18);

        objc_msgSend(v14, "alternativeText");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setAlternativeText:", v20);

        objc_msgSend(v9, "addObject:", v19);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v11);
  }

  v21 = (void *)objc_msgSend(v9, "copy");
  return v21;
}

- (BOOL)hasIdeographicCandidates
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  char v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v26.receiver = self;
  v26.super_class = (Class)TIKeyboardInputManager_zh_Candidates;
  if (!-[TIKeyboardInputManagerChinese hasIdeographicCandidates](&v26, sel_hasIdeographicCandidates))
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[TIKeyboardInputManager_zh_Candidates wholePhraseCandidateResultSet](self, "wholePhraseCandidateResultSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "candidates");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v23;
LABEL_5:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v9), "candidate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "_containsIdeographicCharacters");

        if ((v11 & 1) != 0)
          break;
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
          if (v7)
            goto LABEL_5;
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:

      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      -[TIKeyboardInputManager_zh_Candidates lastCharacterCandidateResultSet](self, "lastCharacterCandidateResultSet", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "candidates");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v3 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
      if (!v3)
      {
LABEL_21:

        return v3;
      }
      v13 = *(_QWORD *)v19;
LABEL_13:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v14), "candidate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "_containsIdeographicCharacters");

        if ((v16 & 1) != 0)
          break;
        if (v3 == ++v14)
        {
          v3 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
          if (v3)
            goto LABEL_13;
          goto LABEL_21;
        }
      }
    }
    LOBYTE(v3) = 1;
    goto LABEL_21;
  }
  LOBYTE(v3) = 1;
  return v3;
}

- (void)mecabraCandidateRefFromCandidate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TIKeyboardInputManager_zh_Candidates;
  v5 = -[TIKeyboardInputManagerMecabra mecabraCandidateRefFromCandidate:](&v13, sel_mecabraCandidateRefFromCandidate_, v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !v5)
  {
    -[TIKeyboardInputManager_zh_Candidates wholePhraseCandidateResultSet](self, "wholePhraseCandidateResultSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "candidateRefsDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mecabraCandidatePointerValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v7, "objectForKey:", v8);

    if (!v5)
    {
      -[TIKeyboardInputManager_zh_Candidates lastCharacterCandidateResultSet](self, "lastCharacterCandidateResultSet");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "candidateRefsDictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "mecabraCandidatePointerValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (id)objc_msgSend(v10, "objectForKey:", v11);

    }
  }

  return v5;
}

- (NSSet)autoSelectCandidates
{
  return self->_autoSelectCandidates;
}

- (void)setAutoSelectCandidates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 984);
}

- (NSString)syntheticCandidate
{
  return self->_syntheticCandidate;
}

- (void)setSyntheticCandidate:(id)a3
{
  objc_storeStrong((id *)&self->_syntheticCandidate, a3);
}

- (NSString)inputString
{
  return self->_inputString;
}

- (void)setInputString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1000);
}

- (TIKeyboardCandidate)defaultCandidate
{
  return self->_defaultCandidate;
}

- (void)setDefaultCandidate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1008);
}

- (TIWordSearch)kbws
{
  return self->_kbws;
}

- (NSString)autoCommitString
{
  return self->_autoCommitString;
}

- (void)setAutoCommitString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1024);
}

- (TIWordSearchCandidateResultSet)wholePhraseCandidateResultSet
{
  return self->_wholePhraseCandidateResultSet;
}

- (void)setWholePhraseCandidateResultSet:(id)a3
{
  objc_storeStrong((id *)&self->_wholePhraseCandidateResultSet, a3);
}

- (TIWordSearchCandidateResultSet)lastCharacterCandidateResultSet
{
  return self->_lastCharacterCandidateResultSet;
}

- (void)setLastCharacterCandidateResultSet:(id)a3
{
  objc_storeStrong((id *)&self->_lastCharacterCandidateResultSet, a3);
}

- (BOOL)skipLastCharacterCandidates
{
  return *(&self->_skipLastCharacterCandidates + 4);
}

- (void)setSkipLastCharacterCandidates:(BOOL)a3
{
  *(&self->_skipLastCharacterCandidates + 4) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCharacterCandidateResultSet, 0);
  objc_storeStrong((id *)&self->_wholePhraseCandidateResultSet, 0);
  objc_storeStrong((id *)&self->_autoCommitString, 0);
  objc_storeStrong((id *)&self->_kbws, 0);
  objc_storeStrong((id *)&self->_defaultCandidate, 0);
  objc_storeStrong((id *)&self->_inputString, 0);
  objc_storeStrong((id *)&self->_syntheticCandidate, 0);
  objc_storeStrong((id *)&self->_autoSelectCandidates, 0);
}

@end
