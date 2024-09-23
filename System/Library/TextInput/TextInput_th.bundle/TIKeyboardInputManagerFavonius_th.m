@implementation TIKeyboardInputManagerFavonius_th

- (void)initImplementation
{
  void *result;
  TIInputManager *v3;

  result = *(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BEB5498]);
  if (!result)
  {
    v3 = (TIInputManager *)operator new();
    TIInputManager::TIInputManager(v3);
    *(_QWORD *)result = &unk_25012CAC0;
  }
  return result;
}

- (void)loadDictionaries
{
  uint64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManagerFavonius_th;
  -[TIKeyboardInputManagerFavonius_th loadDictionaries](&v4, sel_loadDictionaries);
  v3 = *(uint64_t *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BEB5498]);
  if (v3)
    *(_BYTE *)(*(_QWORD *)(v3 + 224) + 64) = 1;
}

- (BOOL)shouldExtendPriorWord
{
  return 0;
}

- (BOOL)supportsLearning
{
  return 0;
}

- (id)wordSeparator
{
  return &stru_25012CBF0;
}

- (BOOL)deletesComposedTextByComposedCharacterSequence
{
  return 0;
}

- (id)keyboardBehaviors
{
  return objc_alloc_init(MEMORY[0x24BEB4DE0]);
}

- (id)trimmedInputStem
{
  void *v3;
  void *v4;

  -[TIKeyboardInputManagerFavonius_th inputStem](self, "inputStem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerFavonius_th trimmedInputStemForStem:](self, "trimmedInputStemForStem:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)trimmedInputStemForStem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  __CFString *v8;
  char *v9;
  char *v10;
  double v11;
  __CFString *v12;
  objc_super v14;
  objc_super v15;
  objc_super v16;

  v4 = a3;
  v5 = v4;
  if (*(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BEB5498]))
  {
    v6 = objc_msgSend(v4, "_lastLongCharacter");
    if ((_DWORD)v6)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "_stringWithUnichar:", v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = &stru_25012CBF0;
    }
    v16.receiver = self;
    v16.super_class = (Class)TIKeyboardInputManagerFavonius_th;
    v9 = (char *)-[TIKeyboardInputManagerFavonius_th countOfWordsIninputStem:](&v16, sel_countOfWordsIninputStem_, v5);
    v15.receiver = self;
    v15.super_class = (Class)TIKeyboardInputManagerFavonius_th;
    v10 = (char *)-[TIKeyboardInputManagerFavonius_th maxPriorWordTokensAfterTrimming](&v15, sel_maxPriorWordTokensAfterTrimming);
    if (v9)
      v11 = (float)((float)(unint64_t)objc_msgSend(v5, "length") / (float)(unint64_t)v9);
    else
      v11 = 1.0;
    if ((-[TIKeyboardInputManagerFavonius_th stringEndsWord:](self, "stringEndsWord:", v7) & 1) != 0)
    {
      v8 = &stru_25012CBF0;
    }
    else
    {
      if ((unint64_t)objc_msgSend(v5, "length") <= 0xC && (v9 <= v10 + 1 || v11 <= 2.5))
      {
        v12 = v5;
      }
      else
      {
        v14.receiver = self;
        v14.super_class = (Class)TIKeyboardInputManagerFavonius_th;
        -[TIKeyboardInputManagerFavonius_th trimmedInputStem](&v14, sel_trimmedInputStem);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v8 = v12;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)setWordBoundary
{
  uint64_t v2;

  v2 = (int)*MEMORY[0x24BEB5498];
  if (*(Class *)((char *)&self->super.super.super.isa + v2))
  {
    -[TIKeyboardInputManagerFavonius_th dropInput](self, "dropInput");
    TIInputManager::set_input_index(*(TIInputManager **)((char *)&self->super.super.super.isa + v2));
  }
}

- (void)textAccepted:(id)a3 fromPredictiveInputBar:(BOOL)a4 withInput:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardInputManagerFavonius_th;
  -[TIKeyboardInputManagerBase textAccepted:fromPredictiveInputBar:withInput:](&v6, sel_textAccepted_fromPredictiveInputBar_withInput_, a3, a4, a5);
  -[TIKeyboardInputManagerFavonius_th setWordBoundary](self, "setWordBoundary");
}

- (void)candidateRejected:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManagerFavonius_th;
  -[TIKeyboardInputManagerBase candidateRejected:](&v4, sel_candidateRejected_, a3);
  -[TIKeyboardInputManagerFavonius_th setWordBoundary](self, "setWordBoundary");
}

- (void)registerLearning:(id)a3 fullCandidate:(id)a4 keyboardState:(id)a5 mode:(id)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TIKeyboardInputManagerFavonius_th;
  -[TIKeyboardInputManagerBase registerLearning:fullCandidate:keyboardState:mode:](&v7, sel_registerLearning_fullCandidate_keyboardState_mode_, a3, a4, a5, a6);
  -[TIKeyboardInputManagerFavonius_th setWordBoundary](self, "setWordBoundary");
}

- (void)registerLearningForCompletion:(id)a3 fullCompletion:(id)a4 context:(id)a5 prefix:(id)a6 mode:(id)a7
{
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TIKeyboardInputManagerFavonius_th;
  -[TIKeyboardInputManagerBase registerLearningForCompletion:fullCompletion:context:prefix:mode:](&v8, sel_registerLearningForCompletion_fullCompletion_context_prefix_mode_, a3, a4, a5, a6, a7);
  -[TIKeyboardInputManagerFavonius_th setWordBoundary](self, "setWordBoundary");
}

- (void)addInput:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  unint64_t v18;
  void *v19;
  void *v20;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  -[TIKeyboardInputManagerFavonius_th inputStem](self, "inputStem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardInputManagerFavonius_th trimmedInputStemForStem:](self, "trimmedInputStemForStem:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerFavonius_th lastAutocorrectionList](self, "lastAutocorrectionList");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "corrections");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "autocorrection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "input");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "candidate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "isEqualToString:", v16);

  v18 = objc_msgSend(v11, "length");
  if (v18 < objc_msgSend(v8, "length") && ((objc_msgSend(v8, "hasSuffix:", v11) ^ 1 | v17) & 1) == 0)
  {
    -[TIKeyboardInputManagerFavonius_th textAccepted:fromPredictiveInputBar:withInput:](self, "textAccepted:fromPredictiveInputBar:withInput:", v14, 0, 0);
    objc_msgSend(v7, "deleteTextBackward:", v8);
    objc_msgSend(v14, "candidate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertText:", v19);

    -[TIKeyboardInputManagerFavonius_th previousTouchEvent](self, "previousTouchEvent");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerFavonius_th addTouch:shouldHitTest:](self, "addTouch:shouldHitTest:", v20, 1);

  }
  v21.receiver = self;
  v21.super_class = (Class)TIKeyboardInputManagerFavonius_th;
  -[TIKeyboardInputManagerFavonius_th addInput:withContext:](&v21, sel_addInput_withContext_, v6, v7);

}

@end
