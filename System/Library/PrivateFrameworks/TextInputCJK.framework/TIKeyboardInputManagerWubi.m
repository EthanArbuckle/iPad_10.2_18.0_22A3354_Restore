@implementation TIKeyboardInputManagerWubi

- (int)inputMethodType
{
  return 0;
}

- (void)addInput:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  void *ASCIIFromInputKeyString;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;
  objc_super v21;
  uint64_t v22;

  v6 = a3;
  v7 = a4;
  -[TIKeyboardInputManagerChinese setCurrentKeyHint:](self, "setCurrentKeyHint:", 0);
  if (!-[TIKeyboardInputManagerChinese handlePairedPunctuationInput:context:](self, "handlePairedPunctuationInput:context:", v6, v7))
  {
    objc_msgSend(v6, "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("☻")))
      {
        v9 = (id)*MEMORY[0x24BEB5A98];
      }
      else
      {
        -[TIKeyboardInputManagerChinese outputByConvertingDecimalPointForInput:](self, "outputByConvertingDecimalPointForInput:", v8);
        v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      v10 = v9;

      -[TIKeyboardInputManagerShapeBased cancelCandidatesThread](self, "cancelCandidatesThread");
      -[TIKeyboardInputManagerShapeBased setPreviousActionWasAutoConfirmation:](self, "setPreviousActionWasAutoConfirmation:", 0);
      if (objc_msgSend(v6, "isMultitap"))
      {
        v22 = 0;
        v11 = -[TIKeyboardInputManagerWubi deleteFromInput:](self, "deleteFromInput:", &v22);
        if (v22)
          objc_msgSend(v7, "deleteBackward:");
      }
      if (-[TIKeyboardInputManagerWubi shouldSkipCandidateSelection](self, "shouldSkipCandidateSelection"))
      {
        v21.receiver = self;
        v21.super_class = (Class)TIKeyboardInputManagerWubi;
        -[TIKeyboardInputManagerWubi addInput:withContext:](&v21, sel_addInput_withContext_, v6, v7);
      }
      else
      {
        if (objc_msgSend(v10, "length")
          && (-[TIKeyboardInputManagerWubi isWubi:](self, "isWubi:", v10)
           || -[TIKeyboardInputManagerMecabra stringContainsActiveSupplementalLexiconSearchPrefix:](self, "stringContainsActiveSupplementalLexiconSearchPrefix:", v10)))
        {
          -[TIKeyboardInputManagerShapeBased searchString](self, "searchString");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BEB5A98]);

          if (v13)
          {
            -[TIKeyboardInputManagerMecabra setRemainingInput:](self, "setRemainingInput:", 0);
            -[TIKeyboardInputManagerWubi acceptCurrentCandidateWithContext:](self, "acceptCurrentCandidateWithContext:", v7);
          }
          objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("問"), CFSTR("＊"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIKeyboardInputManagerWubi inputMethodType](self, "inputMethodType");
          ASCIIFromInputKeyString = (void *)MecabraInputKeyPropertiesCreateASCIIFromInputKeyString();
          -[TIKeyboardInputManagerShapeBased searchString](self, "searchString");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "appendString:", ASCIIFromInputKeyString);

          objc_msgSend(v6, "setString:", v14);
          -[TIKeyboardInputManagerShapeBased markedTextWithAutoconvertedCandidates](self, "markedTextWithAutoconvertedCandidates");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIKeyboardInputManagerChinese setInput:](self, "setInput:", v17);

          -[TIKeyboardInputManagerWubi setMarkedText](self, "setMarkedText");
        }
        else if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BEB5A98]))
        {
          -[TIKeyboardInputManagerWubi acceptCurrentCandidateWithContext:](self, "acceptCurrentCandidateWithContext:", v7);
          -[TIKeyboardInputManagerShapeBased searchString](self, "searchString");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "appendString:", v10);

          objc_msgSend(v6, "setString:", v10);
          v20.receiver = self;
          v20.super_class = (Class)TIKeyboardInputManagerWubi;
          -[TIKeyboardInputManagerWubi addInput:withContext:](&v20, sel_addInput_withContext_, v6, v7);
        }
        else
        {
          -[TIKeyboardInputManagerMecabra setRemainingInput:](self, "setRemainingInput:", 0);
          -[TIKeyboardInputManagerWubi acceptCurrentCandidateWithContext:](self, "acceptCurrentCandidateWithContext:", v7);
          objc_msgSend(v7, "insertText:", v10);
        }
        if ((objc_msgSend(v6, "isFlick") & 1) == 0 && (objc_msgSend(v6, "isMultitap") & 1) == 0)
        {
          objc_msgSend(v6, "inputManagerHint");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIKeyboardInputManagerChinese setCurrentKeyHint:](self, "setCurrentKeyHint:", v19);

        }
      }
    }
    else
    {
      v10 = v8;
    }

  }
}

- (id)deleteFromInput:(unint64_t *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TIKeyboardInputManagerWubi;
  v4 = -[TIKeyboardInputManagerShapeBased deleteFromInput:](&v7, sel_deleteFromInput_, a3);
  -[TIKeyboardInputManagerShapeBased markedTextWithAutoconvertedCandidates](self, "markedTextWithAutoconvertedCandidates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerChinese setInput:](self, "setInput:", v5);

  return 0;
}

- (id)formattedSearchString
{
  void *v3;
  void *InputKeyFromASCIIString;

  -[TIKeyboardInputManagerWubi inputMethodType](self, "inputMethodType");
  -[TIKeyboardInputManagerShapeBased searchString](self, "searchString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  InputKeyFromASCIIString = (void *)MecabraInputKeyPropertiesCreateInputKeyFromASCIIString();

  return InputKeyFromASCIIString;
}

- (void)notifyUpdateCandidates:(id)a3 forOperation:(id)a4
{
  id v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id location;

  v5 = a3;
  if (-[TIKeyboardInputManagerWubi shouldSkipCandidateSelection](self, "shouldSkipCandidateSelection"))
  {
    -[TIKeyboardInputManagerWubi closeCandidateGenerationContextWithResults:](self, "closeCandidateGenerationContextWithResults:", 0);
  }
  else
  {
    objc_msgSend(v5, "candidates");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      objc_initWeak(&location, self);
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __66__TIKeyboardInputManagerWubi_notifyUpdateCandidates_forOperation___block_invoke;
      v24[3] = &unk_2519802A0;
      objc_copyWeak(&v26, &location);
      v25 = v6;
      -[TIKeyboardInputManagerMecabra addStickers:withCompletionHandler:](self, "addStickers:withCompletionHandler:", v5, v24);

      objc_destroyWeak(&v26);
      objc_destroyWeak(&location);
    }
    else
    {
      v7 = -[TIKeyboardInputManagerShapeBased inputCount](self, "inputCount");
      if (v7 < 2)
      {
        v12 = 0;
      }
      else
      {
        v8 = v7;
        v9 = (void *)MEMORY[0x24BDD17C8];
        -[TIKeyboardInputManagerWubi inputString](self, "inputString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "substringFromIndex:", v8 - 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringWithString:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

      }
      -[TIKeyboardInputManagerMecabra setRemainingInput:](self, "setRemainingInput:", v12);
      self->super._keepRemainingInput = 1;
      v13 = objc_alloc(MEMORY[0x24BEB53B8]);
      -[TIKeyboardInputManagerWubi keyboardState](self, "keyboardState");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v13, "initWithKeyboardState:", v14);

      -[TIKeyboardInputManagerWubi acceptCurrentCandidateWithContext:](self, "acceptCurrentCandidateWithContext:", v15);
      objc_msgSend(v15, "output");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "acceptedCandidate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManagerWubi setAutoConfirmationCandidate:](self, "setAutoConfirmationCandidate:", v17);

      -[TIKeyboardInputManagerMecabra setRemainingInput:](self, "setRemainingInput:", 0);
      self->super._keepRemainingInput = 0;
      -[TIKeyboardInputManagerWubi keyboardState](self, "keyboardState");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "currentCandidate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        -[TIKeyboardInputManagerShapeBased setPreviousActionWasAutoConfirmation:](self, "setPreviousActionWasAutoConfirmation:", 1);
        -[TIKeyboardInputManagerWubi keyboardState](self, "keyboardState");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "inputMode");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        TIStatisticGetKeyForCandidateAccepted();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        TIStatisticScalarIncrement();

      }
      -[TIKeyboardInputManagerShapeBased candidateResultSet](self, "candidateResultSet");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v23, "isDummySet") & 1) == 0)
      {
        -[TIKeyboardInputManagerWubi setMarkedText](self, "setMarkedText");
        -[TIKeyboardInputManagerWubi closeCandidateGenerationContextWithResults:](self, "closeCandidateGenerationContextWithResults:", v23);
      }

    }
  }

}

- (BOOL)updateCandidatesWithTIWordSearch:(id)a3 predictionEnabled:(BOOL)a4
{
  _BOOL4 v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TIKeyboardInputManagerWubi;
  v5 = -[TIKeyboardInputManagerShapeBased updateCandidatesWithTIWordSearch:predictionEnabled:](&v8, sel_updateCandidatesWithTIWordSearch_predictionEnabled_, a3, a4);
  if (v5)
  {
    -[TIKeyboardInputManagerShapeBased markedTextWithAutoconvertedCandidates](self, "markedTextWithAutoconvertedCandidates");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerChinese setInput:](self, "setInput:", v6);

  }
  return v5;
}

- (void)openCandidateGenerationContextWithCandidateHandler:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManagerWubi;
  -[TIKeyboardInputManagerWubi openCandidateGenerationContextWithCandidateHandler:](&v4, sel_openCandidateGenerationContextWithCandidateHandler_, a3);
  -[TIKeyboardInputManagerWubi setAutoConfirmationCandidate:](self, "setAutoConfirmationCandidate:", 0);
}

- (void)pushCandidateGenerationContextWithResults:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[TIKeyboardInputManagerWubi autoConfirmationCandidate](self, "autoConfirmationCandidate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAcceptedCandidate:", v5);

  -[TIKeyboardInputManagerWubi setAutoConfirmationCandidate:](self, "setAutoConfirmationCandidate:", 0);
  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardInputManagerWubi;
  -[TIKeyboardInputManagerWubi pushCandidateGenerationContextWithResults:](&v6, sel_pushCandidateGenerationContextWithResults_, v4);

}

- (BOOL)shouldAddModifierSymbolsToWordCharacters
{
  return 0;
}

- (BOOL)acceptInputString:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if (-[TIKeyboardInputManagerWubi isWubi:](self, "isWubi:", v4))
  {
    v7.receiver = self;
    v7.super_class = (Class)TIKeyboardInputManagerWubi;
    v5 = -[TIKeyboardInputManagerShapeBased acceptInputString:](&v7, sel_acceptInputString_, v4);
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (id)inputsToReject
{
  _BOOL4 v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  v3 = -[TIKeyboardInputManagerShapeBased hasCandidates](self, "hasCandidates");
  if (v3)
    v4 = 0;
  else
    v4 = CFSTR("⼀⼁⼃⼂乛問匹");
  v10.receiver = self;
  v10.super_class = (Class)TIKeyboardInputManagerWubi;
  -[TIKeyboardInputManagerMecabra inputsToReject](&v10, sel_inputsToReject);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    v7 = v5;
LABEL_9:
    v8 = v7;
    goto LABEL_10;
  }
  if (!v5)
  {
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEB4D00]), "initWithCharactersInString:", v4);
    goto LABEL_9;
  }
  v8 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v8, "addCharactersInString:", v4);
LABEL_10:

  return v8;
}

- (BOOL)isWubi:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;

  v3 = a3;
  if (!-[TIKeyboardInputManagerWubi isWubi:]::notWubiSet)
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("⼀⼁⼃⼂乛問匹"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invertedSet");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)-[TIKeyboardInputManagerWubi isWubi:]::notWubiSet;
    -[TIKeyboardInputManagerWubi isWubi:]::notWubiSet = v5;

  }
  v7 = objc_msgSend(v3, "rangeOfCharacterFromSet:") == 0x7FFFFFFFFFFFFFFFLL;

  return v7;
}

- (BOOL)supportsPairedPunctutationInput
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[TIKeyboardInputManagerWubi keyboardState](self, "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hardwareKeyboardMode") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    -[TIKeyboardInputManagerWubi keyboardState](self, "keyboardState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "userInterfaceIdiom") == 1)
    {
      -[TIKeyboardInputManagerWubi keyboardState](self, "keyboardState");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "layoutState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v8, "hasCandidateKey");

    }
    else
    {
      v4 = 1;
    }

  }
  return v4;
}

- (TIKeyboardCandidate)autoConfirmationCandidate
{
  return self->_autoConfirmationCandidate;
}

- (void)setAutoConfirmationCandidate:(id)a3
{
  objc_storeStrong((id *)&self->_autoConfirmationCandidate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoConfirmationCandidate, 0);
}

void __66__TIKeyboardInputManagerWubi_notifyUpdateCandidates_forOperation___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "setWordSearchCandidateResultSet:", v4);

  objc_msgSend(WeakRetained, "markedTextWithAutoconvertedCandidates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setInput:", v5);

  objc_msgSend(WeakRetained, "setMarkedText");
  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(WeakRetained, "wordSearchCandidateResultSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "proactiveTriggers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "candidateResultSetFromCandidates:proactiveTriggers:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "closeCandidateGenerationContextWithResults:", v9);

}

+ (Class)wordSearchClass
{
  return 0;
}

@end
