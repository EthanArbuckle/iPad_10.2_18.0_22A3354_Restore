@implementation TIKeyboardInputManagerWubixing

- (BOOL)usesPunctuationKeysForRowNavigation
{
  return 1;
}

- (id)keyboardBehaviors
{
  return objc_alloc_init(MEMORY[0x24BEB4DF0]);
}

- (unint64_t)initialSelectedIndex
{
  void *v3;
  int v4;
  objc_super v6;

  objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForPreferenceKey:", *MEMORY[0x24BEB5128]);

  if (!v4)
    return 0x7FFFFFFFFFFFFFFFLL;
  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardInputManagerWubixing;
  return -[TIKeyboardInputManagerShapeBased initialSelectedIndex](&v6, sel_initialSelectedIndex);
}

- (BOOL)supportsNumberKeySelection
{
  void *v2;
  BOOL v3;

  -[TIKeyboardInputManagerWubixing inputString](self, "inputString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (int)inputMethodType
{
  return 10;
}

- (id)sortingMethods
{
  if (-[TIKeyboardInputManagerChinese showingFacemarkCandidates](self, "showingFacemarkCandidates"))
    return &unk_251987788;
  if (-[TIKeyboardInputManagerChinese hasIdeographicCandidates](self, "hasIdeographicCandidates"))
    return &unk_2519877B8;
  return &unk_2519877A0;
}

- (BOOL)acceptAutocorrectionCommitsInline
{
  return 1;
}

- (void)addInput:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    -[TIKeyboardInputManagerShapeBased cancelCandidatesThread](self, "cancelCandidatesThread");
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("☻")) & 1) != 0)
    {
      v9 = 1;
    }
    else
    {
      -[TIKeyboardInputManagerWubixing keyboardState](self, "keyboardState");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "hardwareKeyboardMode"))
        v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BEB5A88]);
      else
        v9 = 0;

    }
    if (-[TIKeyboardInputManagerWubixing isValidWubiInput:](self, "isValidWubiInput:", v8)
      || -[TIKeyboardInputManagerMecabra stringContainsActiveSupplementalLexiconSearchPrefix:](self, "stringContainsActiveSupplementalLexiconSearchPrefix:", v8))
    {
      if (-[TIKeyboardInputManagerChinese showingFacemarkCandidates](self, "showingFacemarkCandidates"))
        -[TIKeyboardInputManagerWubixing acceptCurrentCandidateWithContext:](self, "acceptCurrentCandidateWithContext:", v7);
      -[TIKeyboardInputManagerShapeBased searchString](self, "searchString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "appendString:", v8);

      -[TIKeyboardInputManagerWubixing updateMarkedText](self, "updateMarkedText");
    }
    else if (v9)
    {
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("☻")))
      {
        v12 = (id)*MEMORY[0x24BEB5A98];

        v8 = v12;
      }
      -[TIKeyboardInputManagerWubixing acceptCurrentCandidateWithContext:](self, "acceptCurrentCandidateWithContext:", v7);
      -[TIKeyboardInputManagerShapeBased searchString](self, "searchString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "appendString:", v8);

      objc_msgSend(v6, "setString:", v8);
      v15.receiver = self;
      v15.super_class = (Class)TIKeyboardInputManagerWubixing;
      -[TIKeyboardInputManagerWubixing addInput:withContext:](&v15, sel_addInput_withContext_, v6, v7);
    }
    else
    {
      -[TIKeyboardInputManagerWubixing acceptCurrentCandidateWithContext:](self, "acceptCurrentCandidateWithContext:", v7);
      -[TIKeyboardInputManagerChinese outputByConvertingDecimalPointForInput:](self, "outputByConvertingDecimalPointForInput:", v8);
      v14 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "insertText:", v14);
      v8 = (void *)v14;
    }
  }

}

- (void)updateMarkedText
{
  id v3;

  -[TIKeyboardInputManagerShapeBased markedTextWithAutoconvertedCandidates](self, "markedTextWithAutoconvertedCandidates");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerChinese setInput:](self, "setInput:", v3);
  -[TIKeyboardInputManagerWubixing setMarkedText](self, "setMarkedText");

}

- (unsigned)inputIndex
{
  void *v2;
  unsigned int v3;

  -[TIKeyboardInputManagerWubixing inputString](self, "inputString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  return v3;
}

- (void)notifyUpdateCandidates:(id)a3 forOperation:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v5 = a3;
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __70__TIKeyboardInputManagerWubixing_notifyUpdateCandidates_forOperation___block_invoke;
  v7[3] = &unk_2519802A0;
  objc_copyWeak(&v9, &location);
  v8 = v5;
  v6 = v5;
  -[TIKeyboardInputManagerMecabra addStickers:withCompletionHandler:](self, "addStickers:withCompletionHandler:", v6, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (BOOL)isValidWubiInput:(id)a3
{
  id v4;
  void *v5;
  char v6;
  BOOL v7;

  v4 = a3;
  if (-[TIKeyboardInputManagerWubixing isValidWubiInput:]::onceToken != -1)
    dispatch_once(&-[TIKeyboardInputManagerWubixing isValidWubiInput:]::onceToken, &__block_literal_global_576);
  -[TIKeyboardInputManagerShapeBased searchString](self, "searchString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "length"))
  {

    goto LABEL_7;
  }
  v6 = objc_msgSend(v4, "isEqualToString:", CFSTR("."));

  if ((v6 & 1) == 0)
  {
LABEL_7:
    v7 = objc_msgSend(v4, "rangeOfCharacterFromSet:", -[TIKeyboardInputManagerWubixing isValidWubiInput:]::notWubiSet) == 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_8;
  }
  v7 = 1;
LABEL_8:

  return v7;
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

void __51__TIKeyboardInputManagerWubixing_isValidWubiInput___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD14A8], "lowercaseLetterCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDD14A8], "uppercaseLetterCharacterSet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "formUnionWithCharacterSet:", v1);

  objc_msgSend(v4, "invertedSet");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)-[TIKeyboardInputManagerWubixing isValidWubiInput:]::notWubiSet;
  -[TIKeyboardInputManagerWubixing isValidWubiInput:]::notWubiSet = v2;

}

void __70__TIKeyboardInputManagerWubixing_notifyUpdateCandidates_forOperation___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "setWordSearchCandidateResultSet:", v4);

  objc_msgSend(WeakRetained, "searchString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "wordSearchCandidateResultSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "candidates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
    goto LABEL_4;
  v8 = objc_msgSend(v5, "length");

  if (v8)
  {
    objc_msgSend(WeakRetained, "markedTextWithAutoconvertedCandidates");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "wordSearchCandidateResultSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSyntheticMecabraCandidateWithSurface:input:", v6, v5);
LABEL_4:

  }
  objc_msgSend(WeakRetained, "updateMarkedText");
  objc_msgSend(WeakRetained, "candidateResultSetFromWordSearchCandidateResultSet:", *(_QWORD *)(a1 + 32));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "closeCandidateGenerationContextWithResults:", v9);

}

+ (Class)wordSearchClass
{
  return (Class)objc_opt_class();
}

@end
