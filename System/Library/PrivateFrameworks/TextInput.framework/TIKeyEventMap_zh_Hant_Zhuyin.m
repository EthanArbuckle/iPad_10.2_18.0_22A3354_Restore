@implementation TIKeyEventMap_zh_Hant_Zhuyin

- (id)punctuationMap
{
  return (id)objc_msgSend((id)objc_opt_class(), "punctuationMap_zh_Hant");
}

- (BOOL)shouldInsertZhuyinCharacterAfter:(id)a3
{
  return objc_msgSend(a3, "_containsBopomofoWithoutToneOnly");
}

- (BOOL)isZhuyinCharacterBeforeInsertionPointOfKeyboardState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;

  v4 = a3;
  objc_msgSend(v4, "documentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markedText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && (objc_msgSend(v4, "documentState"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "selectedRangeInMarkedText"),
        v7,
        v8))
  {
    objc_msgSend(v4, "documentState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "markedText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "documentState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "substringWithRange:", objc_msgSend(v11, "selectedRangeInMarkedText") - 1, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = -[TIKeyEventMap_zh_Hant_Zhuyin shouldInsertZhuyinCharacterAfter:](self, "shouldInsertZhuyinCharacterAfter:", v12);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)remapKeyWithString:(id)a3 stringWithoutModifiers:(id)a4 modifierFlags:(unint64_t)a5 keyboardState:(id)a6
{
  id v10;
  id v11;
  id v12;
  __CFString *v13;
  objc_super v15;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (!a5
    && objc_msgSend(v10, "isEqualToString:", CFSTR(" "))
    && -[TIKeyEventMap_zh_Hant_Zhuyin isZhuyinCharacterBeforeInsertionPointOfKeyboardState:](self, "isZhuyinCharacterBeforeInsertionPointOfKeyboardState:", v12))
  {
    v13 = CFSTR("ˉ");
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)TIKeyEventMap_zh_Hant_Zhuyin;
    -[TIKeyEventMap_zh remapKeyWithString:stringWithoutModifiers:modifierFlags:keyboardState:](&v15, sel_remapKeyWithString_stringWithoutModifiers_modifierFlags_keyboardState_, v10, v11, a5, v12);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__TIKeyEventMap_zh_Hant_Zhuyin_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance___onceToken_140 != -1)
    dispatch_once(&sharedInstance___onceToken_140, block);
  return (id)sharedInstance___keyEventMap_139;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
