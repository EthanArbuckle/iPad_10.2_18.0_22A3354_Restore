@implementation TIKeyboardInputManagerPinyin

- (BOOL)supportsPairedPunctutationInput
{
  return 0;
}

- (BOOL)usesPunctuationKeysForRowNavigation
{
  return 1;
}

- (BOOL)shouldSearchCompletionForSubstrings
{
  return 0;
}

- (BOOL)shouldResample
{
  return 1;
}

- (BOOL)shouldRescaleTouchPoints
{
  return 1;
}

- (id)keyboardBehaviors
{
  return objc_alloc_init(MEMORY[0x24BEB4DD0]);
}

- (unint64_t)initialSelectedIndex
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  objc_super v12;
  objc_super v13;

  objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForPreferenceKey:", *MEMORY[0x24BEB5128]);

  -[TIKeyboardInputManagerPinyin keyboardState](self, "keyboardState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "hardwareKeyboardMode");

  if ((_DWORD)v6 && v4)
  {
    -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](self, "wordSearchCandidateResultSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "candidates");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");
    if (v9
      && (-[TIKeyboardInputManagerChinesePhonetic inputString](self, "inputString"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "length")))
    {
      v10 = 0;
    }
    else
    {
      v13.receiver = self;
      v13.super_class = (Class)TIKeyboardInputManagerPinyin;
      v10 = -[TIKeyboardInputManagerChinese initialSelectedIndex](&v13, sel_initialSelectedIndex);
      if (!v9)
      {
LABEL_11:

        return (unint64_t)v10;
      }
    }

    goto LABEL_11;
  }
  if (!v4)
    return 0x7FFFFFFFFFFFFFFFLL;
  v12.receiver = self;
  v12.super_class = (Class)TIKeyboardInputManagerPinyin;
  return -[TIKeyboardInputManagerChinese initialSelectedIndex](&v12, sel_initialSelectedIndex);
}

- (BOOL)usesAutoDeleteWord
{
  return 1;
}

- (BOOL)usesGeometryModelData
{
  objc_super v3;

  if (self->super._isInAmbiguousMode)
    return 0;
  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManagerPinyin;
  return -[TIKeyboardInputManagerChinesePhonetic usesGeometryModelData](&v3, sel_usesGeometryModelData);
}

- (BOOL)acceptAutocorrectionCommitsInline
{
  objc_super v3;

  if (!self->super._isInAmbiguousMode)
    return 1;
  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManagerPinyin;
  return -[TIKeyboardInputManagerPinyin acceptAutocorrectionCommitsInline](&v3, sel_acceptAutocorrectionCommitsInline);
}

- (id)validCharacterSetForAutocorrection
{
  if (-[TIKeyboardInputManagerPinyin validCharacterSetForAutocorrection]::__onceToken != -1)
    dispatch_once(&-[TIKeyboardInputManagerPinyin validCharacterSetForAutocorrection]::__onceToken, &__block_literal_global_77);
  return (id)-[TIKeyboardInputManagerPinyin validCharacterSetForAutocorrection]::__validCharSet;
}

- (void)adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4
{
  _BOOL4 v4;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unsigned int v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  uint64_t v19;
  id v20;
  objc_super v21;

  v4 = a3;
  if (a4 == 1)
  {
    v6 = -[TIKeyboardInputManagerChinesePhonetic phraseBoundary](self, "phraseBoundary");
    if (v6 <= -[TIKeyboardInputManagerChinesePhonetic inputCount](self, "inputCount")
      && -[TIKeyboardInputManagerChinesePhonetic supportsSetPhraseBoundary](self, "supportsSetPhraseBoundary"))
    {
      if (v4)
        v7 = 1;
      else
        v7 = -1;
      if (v4)
        v8 = -[TIKeyboardInputManagerChinesePhonetic inputCount](self, "inputCount");
      else
        v8 = 0;
      v9 = -[TIKeyboardInputManagerChinesePhonetic inputCount](self, "inputCount");
      -[TIKeyboardInputManagerChinesePhonetic inputString](self, "inputString");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManagerChinesePhonetic convertedInput](self, "convertedInput");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "length");

      if (v11 <= v8)
        v12 = v8;
      else
        v12 = v11;
      v19 = v12;
      v13 = v6 - v9;
      v14 = v7;
      v15 = v6;
      while (1)
      {
        if (v6 == v12)
        {
          v15 = v19;
          goto LABEL_26;
        }
        if (!(v13 + v14) || !(v6 + v14))
        {
          v15 = v6 + v14;
          goto LABEL_26;
        }
        if (!(v6 - 0x7FFFFFFFFFFFFFFFLL + v14))
          break;
        v15 += v7;
        if (v6 + v14 + 1 <= objc_msgSend(v20, "length"))
        {
          objc_msgSend(v20, "substringWithRange:", v6 + v14, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIKeyboardInputManagerMecabra syllableSeparator](self, "syllableSeparator");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "isEqualToString:", v17);

          v14 += v7;
          v12 -= v7;
          if ((v18 & 1) == 0)
            continue;
        }
        goto LABEL_26;
      }
      v15 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_26:
      -[TIKeyboardInputManagerChinesePhonetic setPhraseBoundary:](self, "setPhraseBoundary:", v15);

    }
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)TIKeyboardInputManagerPinyin;
    -[TIKeyboardInputManagerMecabra adjustPhraseBoundaryInForwardDirection:granularity:](&v21, sel_adjustPhraseBoundaryInForwardDirection_granularity_, a3);
  }
}

- (BOOL)currentShuangpinTypeUsesSemicolon
{
  void *v2;
  int v3;

  -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shuangpinType");

  return v3 == 7 || v3 == 2;
}

- (BOOL)isShuangpinSemicolon:(id)a3
{
  void *v4;
  BOOL v5;

  if (!objc_msgSend(a3, "isEqualToString:", CFSTR(";"))
    || !-[TIKeyboardInputManagerPinyin currentShuangpinTypeUsesSemicolon](self, "currentShuangpinTypeUsesSemicolon"))
  {
    return 0;
  }
  -[TIKeyboardInputManagerChinesePhonetic inputString](self, "inputString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length") != 0;

  return v5;
}

- (BOOL)isSpecialInput:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TIKeyboardInputManagerPinyin;
  v5 = -[TIKeyboardInputManagerChinesePhonetic isSpecialInput:](&v7, sel_isSpecialInput_, v4)
    || -[TIKeyboardInputManagerPinyin isShuangpinSemicolon:](self, "isShuangpinSemicolon:", v4);

  return v5;
}

- (id)remapInput:(id)a3 isFacemarkInput:(BOOL *)a4
{
  __CFString *v5;
  void *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInputManagerPinyin;
  -[TIKeyboardInputManagerChinesePhonetic remapInput:isFacemarkInput:](&v9, sel_remapInput_isFacemarkInput_, a3, a4);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("；")))
  {
    if (-[TIKeyboardInputManagerPinyin currentShuangpinTypeUsesSemicolon](self, "currentShuangpinTypeUsesSemicolon"))
    {
      -[TIKeyboardInputManagerChinesePhonetic inputString](self, "inputString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "length");

      if (v7)
      {

        v5 = CFSTR(";");
      }
    }
  }
  return v5;
}

void __66__TIKeyboardInputManagerPinyin_validCharacterSetForAutocorrection__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDD1690], "characterSetWithRange:", 97, 26);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addCharactersInString:", CFSTR("➋➌➍➎➏➐➑➒"));
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)-[TIKeyboardInputManagerPinyin validCharacterSetForAutocorrection]::__validCharSet;
  -[TIKeyboardInputManagerPinyin validCharacterSetForAutocorrection]::__validCharSet = v0;

}

@end
