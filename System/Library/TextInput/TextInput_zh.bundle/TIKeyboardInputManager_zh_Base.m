@implementation TIKeyboardInputManager_zh_Base

- (id)keyEventMap
{
  return (id)objc_msgSend(MEMORY[0x24BEB4D98], "sharedInstance");
}

- (id)keyboardBehaviors
{
  return objc_alloc_init(MEMORY[0x24BEB4DF8]);
}

- (BOOL)supportsNumberKeySelection
{
  return 0;
}

- (BOOL)acceptInputString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  char v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;

  v4 = a3;
  if (objc_msgSend(v4, "length") && objc_msgSend(v4, "_containsBopomofoOnly"))
  {
    -[TIKeyboardInputManagerChinesePhonetic inputString](self, "inputString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerChinesePhonetic externalStringToInternal:](self, "externalStringToInternal:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "substringToIndex:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "_containsBopomofoToneOnly");

    if (v8
      && (!objc_msgSend(v6, "length")
       || (objc_msgSend(v6, "substringWithRange:", -[TIKeyboardInputManagerChinesePhonetic inputIndex](self, "inputIndex") - 1, 1), v9 = (void *)objc_claimAutoreleasedReturnValue(), v10 = objc_msgSend(v9, "_containsBopomofoToneOnly"), v9, (v10 & 1) != 0)))
    {
      v11 = 0;
    }
    else
    {
      -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](self, "wordSearchCandidateResultSet");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "candidates");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v13, "count") == 1)
      {
        objc_msgSend(v13, "objectAtIndex:", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "candidate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v6, "isEqualToString:", v15);

        v11 = v16 ^ 1;
      }
      else
      {
        v11 = 1;
      }

    }
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (void)initImplementation
{
  uint64_t v2;
  objc_super v4;

  v2 = *MEMORY[0x24BEB52F8];
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManager_zh_Base;
  return -[TIKeyboardInputManagerChinese initImplementationWithMode:andLanguage:](&v4, sel_initImplementationWithMode_andLanguage_, CFSTR("Zhuyin"), v2);
}

- (BOOL)shouldSearchCompletionForSubstrings
{
  return 0;
}

- (int)inputMethodType
{
  return 5;
}

- (id)phoneticSortingMethod
{
  return &unk_2501332B0;
}

- (BOOL)_shouldCommitInputDirectly:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  unint64_t v7;
  objc_super v9;

  v4 = a3;
  if (!-[TIKeyboardInputManagerChinesePhonetic inputCount](self, "inputCount"))
  {
    -[TIKeyboardInputManagerChinesePhonetic conversionHistory](self, "conversionHistory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "convertedLength"))
    {
      v7 = objc_msgSend(v4, "length");

      if (v7 > 1)
        goto LABEL_9;
    }
    else
    {

    }
  }
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInputManager_zh_Base;
  if (!-[TIKeyboardInputManagerChinesePhonetic _shouldCommitInputDirectly:](&v9, sel__shouldCommitInputDirectly_, v4))
  {
    if ((objc_msgSend(v4, "_containsBopomofoOnly") & 1) == 0
      && !-[TIKeyboardInputManagerChinesePhonetic isSpecialInput:](self, "isSpecialInput:", v4))
    {
      v5 = !-[TIKeyboardInputManagerMecabra stringContainsActiveSupplementalLexiconSearchPrefix:](self, "stringContainsActiveSupplementalLexiconSearchPrefix:", v4);
      goto LABEL_10;
    }
LABEL_9:
    LOBYTE(v5) = 0;
    goto LABEL_10;
  }
  LOBYTE(v5) = 1;
LABEL_10:

  return v5;
}

- (id)inputsToReject
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  _BOOL4 v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  objc_super v18;

  -[TIKeyboardInputManagerChinesePhonetic inputString](self, "inputString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerChinesePhonetic externalStringToInternal:](self, "externalStringToInternal:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[TIKeyboardInputManagerChinesePhonetic inputIndex](self, "inputIndex");
  -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](self, "wordSearchCandidateResultSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "candidates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == -[TIKeyboardInputManagerChinesePhonetic inputCount](self, "inputCount")
    && objc_msgSend(v7, "count") == 1
    && (objc_msgSend(v7, "objectAtIndex:", 0),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "candidate"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v4, "isEqualToString:", v9),
        v9,
        v8,
        (v10 & 1) != 0))
  {
    v11 = 0;
    v12 = CFSTR("ㄅㄆㄇㄈㄉㄊㄋㄌㄍㄎㄏㄐㄑㄒㄓㄔㄕㄖㄗㄘㄙㄧㄨㄩㄚㄛㄜㄝㄞㄟㄠㄡㄢㄣㄤㄥㄦ");
  }
  else
  {
    v11 = v5 != 0;
    if (v5)
      v12 = 0;
    else
      v12 = CFSTR("ˉˊˇˋ˙");
  }
  v18.receiver = self;
  v18.super_class = (Class)TIKeyboardInputManager_zh_Base;
  -[TIKeyboardInputManagerMecabra inputsToReject](&v18, sel_inputsToReject);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v11)
  {
    v15 = v13;
LABEL_13:
    v16 = v15;
    goto LABEL_14;
  }
  if (!v13)
  {
    v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEB4D00]), "initWithCharactersInString:", v12);
    goto LABEL_13;
  }
  v16 = (void *)objc_msgSend(v13, "mutableCopy");
  objc_msgSend(v16, "addCharactersInString:", v12);
LABEL_14:

  return v16;
}

- (id)validCharacterSetForSegmentation
{
  return (id)objc_msgSend(MEMORY[0x24BDD14A8], "zhuyinCharacterSet");
}

@end
