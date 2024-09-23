@implementation TIKeyboardInputManagerFavonius_ko

- (TIKeyboardInputManagerFavonius_ko)initWithConfig:(id)a3 keyboardState:(id)a4
{
  TIKeyboardInputManagerFavonius_ko *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInputManagerFavonius_ko;
  result = -[TIKeyboardInputManagerFavonius_ko initWithConfig:keyboardState:](&v5, sel_initWithConfig_keyboardState_, a3, a4);
  if (result)
    result->_deleteSyllable = 1;
  return result;
}

- (void)initImplementation
{
  void *result;
  TIInputManager_ko *v3;

  result = *(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BEB5498]);
  if (!result)
  {
    v3 = (TIInputManager_ko *)operator new();
    TIInputManager_ko::TIInputManager_ko(v3);
  }
  return result;
}

- (Hangul2SetAutomata)batchConverter
{
  Hangul2SetAutomata *result;
  Hangul2SetAutomata *v4;

  result = self->_batchConverter;
  if (!result)
  {
    v4 = (Hangul2SetAutomata *)operator new();
    Hangul2SetAutomata::Hangul2SetAutomata(v4);
    self->_batchConverter = result;
  }
  return result;
}

- (void)syncToLayoutState:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardInputManagerFavonius_ko;
  v4 = a3;
  -[TIKeyboardInputManagerFavonius_ko syncToLayoutState:](&v6, sel_syncToLayoutState_, v4);
  objc_msgSend(v4, "softwareLayout", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v5, "isEqualToString:", CFSTR("Korean10Key"));
  *(_BYTE *)(-[TIKeyboardInputManagerFavonius_ko batchConverter](self, "batchConverter") + 36) = (_BYTE)v4;
  TIInputManager_ko::set_is_10key(*(uint64_t *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BEB5498]), (int)v4);
}

- (void)dealloc
{
  Hangul2SetAutomata *batchConverter;
  objc_super v4;

  batchConverter = self->_batchConverter;
  if (batchConverter)
  {
    Hangul2SetAutomata::~Hangul2SetAutomata(batchConverter);
    MEMORY[0x234902A68]();
    self->_batchConverter = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManagerFavonius_ko;
  -[TIKeyboardInputManagerFavonius_ko dealloc](&v4, sel_dealloc);
}

- (id)composeJamo:(id)a3
{
  __CFString *v4;
  __CFString *v5;

  v4 = (__CFString *)a3;
  v5 = _composeJamo(v4, -[TIKeyboardInputManagerFavonius_ko batchConverter](self, "batchConverter"));

  return v5;
}

- (BOOL)canHandleKeyHitTest
{
  unsigned int v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInputManagerFavonius_ko;
  v3 = -[TIKeyboardInputManagerFavonius_ko canHandleKeyHitTest](&v5, sel_canHandleKeyHitTest);
  if (v3)
    LOBYTE(v3) = TIInputManager_ko::is_10key(*(TIInputManager_ko **)((char *)&self->super.super.super.isa
                                                                   + (int)*MEMORY[0x24BEB5498])) ^ 1;
  return v3;
}

- (BOOL)doesComposeText
{
  return 1;
}

- (BOOL)dictionaryUsesExternalEncoding
{
  return 0;
}

- (id)externalStringToInternal:(id)a3
{
  return DecomposeHangul((NSString *)a3);
}

- (void)clearInput
{
  objc_super v2;

  self->_deleteSyllable = 1;
  v2.receiver = self;
  v2.super_class = (Class)TIKeyboardInputManagerFavonius_ko;
  -[TIKeyboardInputManagerFavonius_ko clearInput](&v2, sel_clearInput);
}

- (void)acceptInput
{
  objc_super v2;

  self->_deleteSyllable = 1;
  v2.receiver = self;
  v2.super_class = (Class)TIKeyboardInputManagerFavonius_ko;
  -[TIKeyboardInputManagerFavonius_ko acceptInput](&v2, sel_acceptInput);
}

- (void)setInput:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[TIKeyboardInputManagerFavonius_ko clearInput](self, "clearInput");
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInputManagerFavonius_ko;
  -[TIKeyboardInputManagerFavonius_ko setInput:](&v5, sel_setInput_, v4);

}

- (void)setInputIndex:(unsigned int)a3
{
  objc_super v3;

  self->_deleteSyllable = 1;
  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManagerFavonius_ko;
  -[TIKeyboardInputManagerFavonius_ko setInputIndex:](&v3, sel_setInputIndex_, *(_QWORD *)&a3);
}

- (BOOL)shouldExtendPriorWord
{
  return 0;
}

- (BOOL)supportsLearning
{
  return 1;
}

- (BOOL)acceptsCharacter:(unsigned int)a3
{
  uint64_t v3;
  objc_super v6;

  v3 = *(_QWORD *)&a3;
  if (-[TIKeyboardInputManagerFavonius_ko acceptsCharacter:]::onceToken != -1)
    dispatch_once(&-[TIKeyboardInputManagerFavonius_ko acceptsCharacter:]::onceToken, &__block_literal_global);
  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardInputManagerFavonius_ko;
  return -[TIKeyboardInputManagerFavonius_ko acceptsCharacter:](&v6, sel_acceptsCharacter_, v3)
      || MEMORY[0x234902C3C](-[TIKeyboardInputManagerFavonius_ko acceptsCharacter:]::hangul_set, v3) != 0;
}

- (void)textAccepted:(id)a3 fromPredictiveInputBar:(BOOL)a4 withInput:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardInputManagerFavonius_ko;
  -[TIKeyboardInputManagerBase textAccepted:fromPredictiveInputBar:withInput:](&v6, sel_textAccepted_fromPredictiveInputBar_withInput_, a3, a4, a5);
  -[TIKeyboardInputManagerFavonius_ko clearInput](self, "clearInput");
}

- (void)addInput:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  const KB::String *v10;
  void *v11;
  int v12;
  char v13;
  uint64_t v14;
  objc_super v15;
  _BYTE v16[32];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  self->_deleteSyllable = 0;
  objc_msgSend(v6, "setAutoshifted:", 0);
  objc_msgSend(v6, "setUppercase:", 0);
  v9 = objc_msgSend(v6, "isMultitap");
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("ㆍ")))
  {
    if (!v9)
      goto LABEL_10;
    v14 = 1;
    goto LABEL_9;
  }
  TIInputManager::input_string(*(TIInputManager **)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BEB5498]));
  KB::ns_string((KB *)v16, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  KB::String::~String((KB::String *)v16);
  v12 = objc_msgSend(v11, "hasSuffix:", CFSTR("ㆍㆍ"));

  v13 = v12 | v9;
  if (v12)
    v14 = 2;
  else
    v14 = 1;
  if ((v13 & 1) != 0)
  {
    do
    {
LABEL_9:
      -[TIKeyboardInputManagerFavonius_ko deleteFromInputWithContext:](self, "deleteFromInputWithContext:", v7);
      --v14;
    }
    while (v14);
  }
LABEL_10:
  v15.receiver = self;
  v15.super_class = (Class)TIKeyboardInputManagerFavonius_ko;
  -[TIKeyboardInputManagerFavonius_ko addInput:withContext:](&v15, sel_addInput_withContext_, v6, v7);

}

- (id)deleteFromInput:(unint64_t *)a3
{
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  const KB::String *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;
  _BYTE v16[32];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    *a3 = 0;
    if (!self->_deleteSyllable)
    {
      *a3 = 1;
      goto LABEL_6;
    }
LABEL_5:
    v15.receiver = self;
    v15.super_class = (Class)TIKeyboardInputManagerFavonius_ko;
    -[TIKeyboardInputManagerFavonius_ko deleteFromInput:](&v15, sel_deleteFromInput_, a3);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  if (self->_deleteSyllable)
    goto LABEL_5;
LABEL_6:
  v6 = (int)*MEMORY[0x24BEB5498];
  if (*(Class *)((char *)&self->super.super.super.isa + v6)
    && (v7 = -[TIKeyboardInputManagerFavonius_ko inputIndex](self, "inputIndex"),
        TIInputManager::delete_from_input(*(TIInputManager **)((char *)&self->super.super.super.isa + v6)),
        v8 = (int)*MEMORY[0x24BEB5490],
        *(Class *)((char *)&self->super.super.super.isa + v8)))
  {
    TIInputManager::input_string(*(TIInputManager **)((char *)&self->super.super.super.isa + v6));
    KB::ns_string((KB *)v16, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    KB::String::~String((KB::String *)v16);
    -[TIKeyboardInputManagerFavonius_ko internalStringToExternal:](self, "internalStringToExternal:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "substringToIndex:", objc_msgSend(v10, "_indexFromStartingIndex:byIncrementingComposedCharacterSequenceCount:", 0, (*(unsigned int **)((char *)&self->super.super.super.isa + v6))[24]));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerFavonius_ko internalStringToExternal:](self, "internalStringToExternal:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[TIKeyboardInputManagerFavonius_ko suffixOfDesiredString:toAppendToInputString:withInputIndex:afterDeletionCount:](self, "suffixOfDesiredString:toAppendToInputString:withInputIndex:afterDeletionCount:", v13, *(Class *)((char *)&self->super.super.super.isa + v8), v7, a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v8), "setString:", v11);
    if (!objc_msgSend(v14, "length"))
    {

      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }
  return v14;
}

@end
