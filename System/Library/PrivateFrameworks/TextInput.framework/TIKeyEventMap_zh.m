@implementation TIKeyEventMap_zh

- (id)punctuationMap
{
  return 0;
}

- (BOOL)isURLOrEmailKeyboardInKeyboardState:(id)a3
{
  unint64_t v3;

  v3 = objc_msgSend(a3, "keyboardType");
  return (v3 < 0x13) & (0x40488u >> v3);
}

- (id)remapKeyWithString:(id)a3 stringWithoutModifiers:(id)a4 modifierFlags:(unint64_t)a5 keyboardState:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (!objc_msgSend(v12, "hardwareKeyboardMode")
    || -[TIKeyEventMap_zh isURLOrEmailKeyboardInKeyboardState:](self, "isURLOrEmailKeyboardInKeyboardState:", v12)
    || (-[TIKeyEventMap_zh punctuationMap](self, "punctuationMap"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v13, "objectForKey:", v10),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        !v14))
  {
    v16.receiver = self;
    v16.super_class = (Class)TIKeyEventMap_zh;
    -[TIKeyEventMap remapKeyWithString:stringWithoutModifiers:modifierFlags:keyboardState:](&v16, sel_remapKeyWithString_stringWithoutModifiers_modifierFlags_keyboardState_, v10, v11, a5, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

+ (id)sharedInstance
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)punctuationMap_zh_Hans
{
  if (punctuationMap_zh_Hans___onceToken != -1)
    dispatch_once(&punctuationMap_zh_Hans___onceToken, &__block_literal_global_2280);
  return (id)punctuationMap_zh_Hans___punctuationMap;
}

+ (id)punctuationMap_zh_Hant
{
  if (punctuationMap_zh_Hant___onceToken != -1)
    dispatch_once(&punctuationMap_zh_Hant___onceToken, &__block_literal_global_114);
  return (id)punctuationMap_zh_Hant___punctuationMap;
}

@end
