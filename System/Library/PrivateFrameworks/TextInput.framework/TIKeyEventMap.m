@implementation TIKeyEventMap

- (TIKeyEventMap)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TIKeyEventMap;
  return -[TIKeyEventMap init](&v4, sel_init, a3);
}

- (BOOL)isEqual:(id)a3
{
  return -[TIKeyEventMap isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class());
}

- (unint64_t)hash
{
  return objc_msgSend((id)objc_opt_class(), "hash");
}

- (id)remapKeyWithString:(id)a3 stringWithoutModifiers:(id)a4 modifierFlags:(unint64_t)a5 keyboardState:(id)a6
{
  return a3;
}

- (id)inputEventForInputString:(id)a3 stringWithoutModifiers:(id)a4 modifierFlags:(unint64_t)a5 keyboardState:(id)a6
{
  return 0;
}

- (int64_t)candidateNumberKey:(int)a3
{
  return u_charDigitValue(a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __42__TIKeyEventMap_zh_punctuationMap_zh_Hant__block_invoke()
{
  void *v0;

  v0 = (void *)punctuationMap_zh_Hant___punctuationMap;
  punctuationMap_zh_Hant___punctuationMap = (uint64_t)&unk_1E24B4230;

}

void __42__TIKeyEventMap_zh_punctuationMap_zh_Hans__block_invoke()
{
  void *v0;

  v0 = (void *)punctuationMap_zh_Hans___punctuationMap;
  punctuationMap_zh_Hans___punctuationMap = (uint64_t)&unk_1E24B4208;

}

void __46__TIKeyEventMap_zh_Hans_Pinyin_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_opt_class();
  v0 = objc_opt_new();
  v1 = (void *)sharedInstance___keyEventMap;
  sharedInstance___keyEventMap = v0;

}

void __46__TIKeyEventMap_zh_Hant_Pinyin_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_opt_class();
  v0 = objc_opt_new();
  v1 = (void *)sharedInstance___keyEventMap_136;
  sharedInstance___keyEventMap_136 = v0;

}

void __46__TIKeyEventMap_zh_Hant_Zhuyin_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_opt_class();
  v0 = objc_opt_new();
  v1 = (void *)sharedInstance___keyEventMap_139;
  sharedInstance___keyEventMap_139 = v0;

}

void __61__TIKeyEventMap_zh_Hant_Zhuyin_LiveConversion_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_opt_class();
  v0 = objc_opt_new();
  v1 = (void *)sharedInstance___keyEventMap_145;
  sharedInstance___keyEventMap_145 = v0;

}

void __66__TIKeyEventMap_zh_Hant_Zhuyin_LiveConversion_candidateNumberKey___block_invoke()
{
  void *v0;

  v0 = (void *)candidateNumberKey____numberKeys;
  candidateNumberKey____numberKeys = (uint64_t)&unk_1E24B06A8;

}

void __41__TIKeyEventMap_zh_Stroke_wubiFromASCII___block_invoke()
{
  void *v0;

  v0 = (void *)wubiFromASCII__asciiToWubiMap;
  wubiFromASCII__asciiToWubiMap = (uint64_t)&unk_1E24B4258;

}

void __46__TIKeyEventMap_zh_Hans_Stroke_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_opt_class();
  v0 = objc_opt_new();
  v1 = (void *)sharedInstance___keyEventMap_204;
  sharedInstance___keyEventMap_204 = v0;

}

void __46__TIKeyEventMap_zh_Hant_Stroke_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_opt_class();
  v0 = objc_opt_new();
  v1 = (void *)sharedInstance___keyEventMap_207;
  sharedInstance___keyEventMap_207 = v0;

}

void __47__TIKeyEventMap_zh_Hant_Cangjie_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_opt_class();
  v0 = objc_opt_new();
  v1 = (void *)sharedInstance___keyEventMap_210;
  sharedInstance___keyEventMap_210 = v0;

}

void __48__TIKeyEventMap_zh_Hans_Wubixing_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_opt_class();
  v0 = objc_opt_new();
  v1 = (void *)sharedInstance___keyEventMap_213;
  sharedInstance___keyEventMap_213 = v0;

}

void __33__TIKeyEventMap_ja_optionMap_JIS__block_invoke()
{
  void *v0;

  v0 = (void *)optionMap_JIS_optionMap;
  optionMap_JIS_optionMap = (uint64_t)&unk_1E24B42A8;

}

void __38__TIKeyEventMap_ja_shiftOptionMap_JIS__block_invoke()
{
  void *v0;

  v0 = (void *)shiftOptionMap_JIS_optionMap;
  shiftOptionMap_JIS_optionMap = (uint64_t)&unk_1E24B4280;

}

@end
