@implementation TIKeyboardInputManagerLiveConversion

void __77__TIKeyboardInputManagerLiveConversion_ja_validCharacterSetForAutocorrection__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDD1690], "characterSetWithRange:", 97, 26);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addCharactersInString:", CFSTR("ー"));
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)-[TIKeyboardInputManagerLiveConversion_ja validCharacterSetForAutocorrection]::__validCharSet;
  -[TIKeyboardInputManagerLiveConversion_ja validCharacterSetForAutocorrection]::__validCharSet = v0;

}

void __94__TIKeyboardInputManagerLiveConversion_ja_openCandidateGenerationContextWithCandidateHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  TIKeyboardInputManager_ja_Candidates *v5;
  void *v6;
  void *v7;
  void *v8;
  TIKeyboardInputManager_ja_Candidates *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  uint64_t v22;
  id v23;

  objc_msgSend(*(id *)(a1 + 32), "setTimer:", 0);
  objc_msgSend(*(id *)(a1 + 32), "candidateHandlerForOpenRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCandidateHandlerForOpenRequest:", 0);
  objc_msgSend(*(id *)(a1 + 32), "composingKeyboardInputManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = *(void **)(a1 + 32);
    v5 = [TIKeyboardInputManager_ja_Candidates alloc];
    objc_msgSend(*(id *)(a1 + 32), "config");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "keyboardState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "wordSearch");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[TIKeyboardInputManager_ja_Candidates initWithConfig:keyboardState:wordSearch:](v5, "initWithConfig:keyboardState:wordSearch:", v6, v7, v8);
    objc_msgSend(v4, "composeTextWith:", v9);

  }
  v10 = objc_msgSend(*(id *)(a1 + 32), "candidateRange");
  v12 = v11;
  objc_msgSend(*(id *)(a1 + 32), "composingKeyboardInputManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCandidateRange:", v10, v12);

  objc_msgSend(*(id *)(a1 + 32), "composingKeyboardInputManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc(MEMORY[0x24BEB5340]);
  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __94__TIKeyboardInputManagerLiveConversion_ja_openCandidateGenerationContextWithCandidateHandler___block_invoke_2;
  v21 = &unk_250122850;
  v22 = *(_QWORD *)(a1 + 32);
  v23 = v2;
  v16 = v2;
  v17 = (void *)objc_msgSend(v15, "initWithWrappedCandidateHandler:resultSetHandlerBlock:", v16, &v18);
  objc_msgSend(v14, "openCandidateGenerationContextWithCandidateHandler:", v17, v18, v19, v20, v21, v22);

  objc_msgSend(*(id *)(a1 + 32), "startPrediction");
}

void __94__TIKeyboardInputManagerLiveConversion_ja_openCandidateGenerationContextWithCandidateHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "shouldShowPredictionCandidate:"))
  {
    objc_msgSend(*(id *)(a1 + 32), "addInlineCandidateIfNeeded:", v13);
    objc_msgSend(*(id *)(a1 + 32), "keyboardState");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "inputForMarkedText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "markedText");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setUncommittedText:", v5);

    }
    objc_msgSend(*(id *)(a1 + 32), "keyboardState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "inputForMarkedText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "markedText");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setUncommittedText:", v8);

    }
    if (objc_msgSend(v13, "initialSelectedIndex") == 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = (void *)MEMORY[0x24BEB4E20];
      objc_msgSend(*(id *)(a1 + 32), "inputString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "rawInputString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "candidateWithCandidate:forInput:", v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setDefaultCandidate:", v12);

    }
    objc_msgSend(*(id *)(a1 + 40), "pushCandidateResultSet:", v13);
  }

}

void __70__TIKeyboardInputManagerLiveConversion_ja_addInlineCandidateIfNeeded___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  if (objc_msgSend(v10, "isPartialCandidate"))
  {
    *a4 = 1;
  }
  else if ((objc_msgSend(v10, "isTransliterationCandidate") & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "candidate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", a1[4]);

      if (v8)
      {
        v9 = *(_QWORD *)(a1[5] + 8);
      }
      else
      {
        v9 = *(_QWORD *)(a1[6] + 8);
        if (*(_QWORD *)(v9 + 24) != 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_9;
      }
      *(_QWORD *)(v9 + 24) = a3;
    }
  }
LABEL_9:

}

@end
