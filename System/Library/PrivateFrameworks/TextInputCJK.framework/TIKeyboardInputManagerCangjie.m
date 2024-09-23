@implementation TIKeyboardInputManagerCangjie

- (id)keyboardBehaviors
{
  return objc_alloc_init(MEMORY[0x24BEB4DB0]);
}

- (BOOL)supportsNumberKeySelection
{
  void *v2;
  BOOL v3;

  -[TIKeyboardInputManagerCangjie inputString](self, "inputString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (void)syncToLayoutState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TIKeyboardInputManagerCangjie;
  v4 = a3;
  -[TIKeyboardInputManagerChinese syncToLayoutState:](&v8, sel_syncToLayoutState_, v4);
  objc_msgSend(v4, "inputMode", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  TIInputModeGetVariant();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerCangjie setSuchengEnabled:](self, "setSuchengEnabled:", objc_msgSend(v6, "isEqualToString:", CFSTR("Sucheng")));

  objc_msgSend(v4, "softwareLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardInputManagerCangjie setSupportsEnglish:](self, "setSupportsEnglish:", objc_msgSend(v7, "hasSuffix:", CFSTR("QWERTY")));
  -[TIKeyboardInputManagerCangjie syncWordSearch](self, "syncWordSearch");
}

- (void)syncWordSearch
{
  id v3;

  -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSuchengEnabled:", -[TIKeyboardInputManagerCangjie suchengEnabled](self, "suchengEnabled"));
  objc_msgSend(v3, "setSupportsEnglish:", -[TIKeyboardInputManagerCangjie supportsEnglish](self, "supportsEnglish"));

}

- (void)addInput:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isPopupVariant") & 1) != 0)
    v9 = 1;
  else
    v9 = objc_msgSend(v6, "isGesture");
  if (objc_msgSend(v8, "length"))
  {
    -[TIKeyboardInputManagerShapeBased setPreviousActionWasAutoConfirmation:](self, "setPreviousActionWasAutoConfirmation:", 0);
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("☻")))
    {
      v10 = (id)*MEMORY[0x24BEB5A98];
    }
    else
    {
      -[TIKeyboardInputManagerChinese outputByConvertingDecimalPointForInput:](self, "outputByConvertingDecimalPointForInput:", v8);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v10;

    -[TIKeyboardInputManagerShapeBased cancelCandidatesThread](self, "cancelCandidatesThread");
    objc_msgSend(v6, "string");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[TIKeyboardInputManagerCangjie cangjieInputType:fromPopupVariant:](self, "cangjieInputType:fromPopupVariant:", v12, v9);

    if (v13 == 2)
    {
      -[TIKeyboardInputManagerCangjie acceptCurrentCandidateWithContext:](self, "acceptCurrentCandidateWithContext:", v7);
      -[TIKeyboardInputManagerShapeBased searchString](self, "searchString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "appendString:", v11);

      objc_msgSend(v6, "setString:", v11);
      v21.receiver = self;
      v21.super_class = (Class)TIKeyboardInputManagerCangjie;
      -[TIKeyboardInputManagerCangjie addInput:withContext:](&v21, sel_addInput_withContext_, v6, v7);
      goto LABEL_20;
    }
    if (v13 == 3)
    {
      objc_msgSend(v6, "string");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[TIKeyboardInputManagerMecabra stringContainsActiveSupplementalLexiconSearchPrefix:](self, "stringContainsActiveSupplementalLexiconSearchPrefix:", v14);

      if (!v15)
      {
        -[TIKeyboardInputManagerCangjie acceptCurrentCandidateWithContext:](self, "acceptCurrentCandidateWithContext:", v7);
        objc_msgSend(v7, "insertText:", v11);
        goto LABEL_20;
      }
    }
    else
    {
      -[TIKeyboardInputManagerShapeBased searchString](self, "searchString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[TIKeyboardInputManagerChinese isFacemarkInput:](self, "isFacemarkInput:", v17);

      if (v18)
        -[TIKeyboardInputManagerCangjie acceptCurrentCandidateWithContext:](self, "acceptCurrentCandidateWithContext:", v7);
    }
    -[TIKeyboardInputManagerShapeBased searchString](self, "searchString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[TIKeyboardInputManagerCangjie supportsEnglish](self, "supportsEnglish"))
    {
      objc_msgSend(v19, "appendString:", v11);
    }
    else
    {
      objc_msgSend(v11, "lowercaseString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "appendString:", v20);

    }
    -[TIKeyboardInputManagerCangjie updateMarkedText](self, "updateMarkedText");
    -[TIKeyboardInputManagerCangjie setMarkedText](self, "setMarkedText");
  }
  else
  {
    v11 = v8;
  }
LABEL_20:

}

- (void)syncToKeyboardState:(id)a3 from:(id)a4 afterContextChange:(BOOL)a5
{
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TIKeyboardInputManagerCangjie;
  -[TIKeyboardInputManagerChinese syncToKeyboardState:from:afterContextChange:](&v8, sel_syncToKeyboardState_from_afterContextChange_, a3, a4, a5);
  -[TIKeyboardInputManagerCangjie syncWordSearch](self, "syncWordSearch");
  -[TIKeyboardInputManagerCangjie keyboardState](self, "keyboardState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentCandidate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[TIKeyboardInputManagerCangjie updateMarkedText](self, "updateMarkedText");
    -[TIKeyboardInputManagerCangjie setMarkedText](self, "setMarkedText");
  }
}

- (id)deleteFromInput:(unint64_t *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardInputManagerCangjie;
  v4 = -[TIKeyboardInputManagerShapeBased deleteFromInput:](&v6, sel_deleteFromInput_, a3);
  -[TIKeyboardInputManagerCangjie updateMarkedText](self, "updateMarkedText");
  return 0;
}

- (id)formattedSearchString
{
  void *v2;
  void *InputKeyFromASCIIString;

  -[TIKeyboardInputManagerShapeBased searchString](self, "searchString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  InputKeyFromASCIIString = (void *)MecabraInputKeyPropertiesCreateInputKeyFromASCIIString();

  return InputKeyFromASCIIString;
}

- (void)updateMarkedText
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  -[TIKeyboardInputManagerShapeBased searchString](self, "searchString");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
    if (-[TIKeyboardInputManagerCangjie supportsEnglish](self, "supportsEnglish"))
    {
      objc_msgSend(v9, "lowercaseString");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v3, "isEqualToString:", v9))
      {
        v4 = -[TIKeyboardInputManagerCangjie firstCandidateIsEnglish](self, "firstCandidateIsEnglish");

        if (!v4)
        {
          if (-[TIKeyboardInputManagerCangjie selectedCandidateIsEnglish](self, "selectedCandidateIsEnglish"))
          {
            -[TIKeyboardInputManagerCangjie keyboardState](self, "keyboardState");
            v5 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "currentCandidate");
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "candidate");
            v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
            -[TIKeyboardInputManagerChinese setInput:](self, "setInput:", v7);

            goto LABEL_13;
          }
          goto LABEL_8;
        }
      }
      else
      {

      }
      v8 = v9;
      goto LABEL_11;
    }
LABEL_8:
    -[TIKeyboardInputManagerShapeBased markedTextWithAutoconvertedCandidates](self, "markedTextWithAutoconvertedCandidates");
    v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:
    v7 = v8;
    goto LABEL_12;
  }
  -[TIKeyboardInputManagerChinese setInput:](self, "setInput:", v9);
LABEL_13:

}

- (BOOL)firstCandidateIsEnglish
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](self, "wordSearchCandidateResultSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "candidates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "candidate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(v6, "substringToIndex:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[TIKeyboardInputManagerCangjie cangjieInputType:fromPopupVariant:](self, "cangjieInputType:fromPopupVariant:", v7, 0) == 1;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)selectedCandidateIsEnglish
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[TIKeyboardInputManagerCangjie keyboardState](self, "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentCandidate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "candidate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(v5, "substringToIndex:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[TIKeyboardInputManagerCangjie cangjieInputType:fromPopupVariant:](self, "cangjieInputType:fromPopupVariant:", v6, 0) == 1;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)notifyUpdateCandidates:(id)a3 forOperation:(id)a4
{
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v5 = a3;
  if (-[TIKeyboardInputManagerCangjie shouldSkipCandidateSelection](self, "shouldSkipCandidateSelection"))
  {
    -[TIKeyboardInputManagerCangjie closeCandidateGenerationContextWithResults:](self, "closeCandidateGenerationContextWithResults:", 0);
  }
  else
  {
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __69__TIKeyboardInputManagerCangjie_notifyUpdateCandidates_forOperation___block_invoke;
    v6[3] = &unk_2519802A0;
    objc_copyWeak(&v8, &location);
    v7 = v5;
    -[TIKeyboardInputManagerMecabra addStickers:withCompletionHandler:](self, "addStickers:withCompletionHandler:", v7, v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

- (BOOL)updateCandidatesWithTIWordSearch:(id)a3 predictionEnabled:(BOOL)a4
{
  _BOOL4 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TIKeyboardInputManagerCangjie;
  v5 = -[TIKeyboardInputManagerShapeBased updateCandidatesWithTIWordSearch:predictionEnabled:](&v7, sel_updateCandidatesWithTIWordSearch_predictionEnabled_, a3, a4);
  if (v5)
    -[TIKeyboardInputManagerCangjie updateMarkedText](self, "updateMarkedText");
  return v5;
}

- (id)nonstopPunctuationCharacters
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInputManagerCangjie;
  -[TIKeyboardInputManagerCangjie nonstopPunctuationCharacters](&v9, sel_nonstopPunctuationCharacters);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "pairedPunctuationDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", &stru_251980880);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByAppendingString:", CFSTR("☻"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)cangjieInputType:(id)a3 fromPopupVariant:(BOOL)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v10;
  char v11;
  void *v12;
  char v13;

  v6 = a3;
  v7 = v6;
  if (v6
    && objc_msgSend(v6, "length")
    && (-[TIKeyboardInputManagerCangjie shouldSkipCandidateSelection](self, "shouldSkipCandidateSelection") & 1) == 0)
  {
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("☻")) & 1) != 0
      || -[TIKeyboardInputManagerChinese isFacemarkInput:](self, "isFacemarkInput:", v7))
    {
      v8 = 2;
      goto LABEL_5;
    }
    if (!a4)
    {
      -[TIKeyboardInputManagerCangjie cangjieSet](self, "cangjieSet");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "characterIsMember:", objc_msgSend(v7, "characterAtIndex:", 0));

      v8 = 0;
      if ((v11 & 1) != 0)
        goto LABEL_5;
      -[TIKeyboardInputManagerCangjie cangjieAlphabetSet](self, "cangjieAlphabetSet");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "characterIsMember:", objc_msgSend(v7, "characterAtIndex:", 0));

      if ((v13 & 1) != 0)
      {
        v8 = 1;
        goto LABEL_5;
      }
    }
  }
  v8 = 3;
LABEL_5:

  return v8;
}

- (id)cangjieSet
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)-[TIKeyboardInputManagerCangjie cangjieSet]::cangjieSet;
  if (!-[TIKeyboardInputManagerCangjie cangjieSet]::cangjieSet)
  {
    MecabraInputKeyPropertiesGetInputKeys();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)-[TIKeyboardInputManagerCangjie cangjieSet]::cangjieSet;
    -[TIKeyboardInputManagerCangjie cangjieSet]::cangjieSet = v4;

    v2 = (void *)-[TIKeyboardInputManagerCangjie cangjieSet]::cangjieSet;
  }
  return v2;
}

- (id)cangjieAlphabetSet
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)-[TIKeyboardInputManagerCangjie cangjieAlphabetSet]::cangjieAlphabetSet;
  if (!-[TIKeyboardInputManagerCangjie cangjieAlphabetSet]::cangjieAlphabetSet)
  {
    objc_msgSend(MEMORY[0x24BDD1690], "characterSetWithRange:", 65, 26);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addCharactersInRange:", 97, 26);
    v4 = objc_msgSend(v3, "copy");
    v5 = (void *)-[TIKeyboardInputManagerCangjie cangjieAlphabetSet]::cangjieAlphabetSet;
    -[TIKeyboardInputManagerCangjie cangjieAlphabetSet]::cangjieAlphabetSet = v4;

    v2 = (void *)-[TIKeyboardInputManagerCangjie cangjieAlphabetSet]::cangjieAlphabetSet;
  }
  return v2;
}

- (BOOL)isPunctuationInput
{
  void *v2;
  void *ASCIIFromInputKeyString;
  char v4;

  -[TIKeyboardInputManagerCangjie inputString](self, "inputString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  ASCIIFromInputKeyString = (void *)MecabraInputKeyPropertiesCreateASCIIFromInputKeyString();

  if ((objc_msgSend(ASCIIFromInputKeyString, "isEqualToString:", CFSTR("z")) & 1) != 0
    || (objc_msgSend(ASCIIFromInputKeyString, "hasPrefix:", CFSTR("zx")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(ASCIIFromInputKeyString, "hasPrefix:", CFSTR("yyy"));
  }

  return v4;
}

- (id)sortingMethods
{
  objc_super v4;

  if (-[TIKeyboardInputManagerChinese showingFacemarkCandidates](self, "showingFacemarkCandidates"))
    return &unk_2519876E0;
  if (-[TIKeyboardInputManagerCangjie isPunctuationInput](self, "isPunctuationInput"))
    return &unk_2519876F8;
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManagerCangjie;
  -[TIKeyboardInputManagerShapeBased sortingMethods](&v4, sel_sortingMethods);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)suchengEnabled
{
  return *(&self->super._previousActionWasAutoConfirmation + 1);
}

- (void)setSuchengEnabled:(BOOL)a3
{
  *(&self->super._previousActionWasAutoConfirmation + 1) = a3;
}

- (BOOL)supportsEnglish
{
  return *(&self->super._previousActionWasAutoConfirmation + 2);
}

- (void)setSupportsEnglish:(BOOL)a3
{
  *(&self->super._previousActionWasAutoConfirmation + 2) = a3;
}

void __69__TIKeyboardInputManagerCangjie_notifyUpdateCandidates_forOperation___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(*(id *)(a1 + 32), "candidates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setWordSearchCandidateResultSet:", v4);

  objc_msgSend(WeakRetained, "updateMarkedText");
  objc_msgSend(WeakRetained, "setMarkedText");
  objc_msgSend(WeakRetained, "wordSearchCandidateResultSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "proactiveTriggers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "candidateResultSetFromCandidates:proactiveTriggers:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "closeCandidateGenerationContextWithResults:", v8);

}

+ (Class)wordSearchClass
{
  return (Class)objc_opt_class();
}

@end
