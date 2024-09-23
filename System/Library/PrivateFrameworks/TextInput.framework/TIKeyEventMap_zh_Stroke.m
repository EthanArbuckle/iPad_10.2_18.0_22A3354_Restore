@implementation TIKeyEventMap_zh_Stroke

- (id)wubiFromASCII:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = wubiFromASCII__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&wubiFromASCII__onceToken, &__block_literal_global_170);
  objc_msgSend((id)wubiFromASCII__asciiToWubiMap, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isNumericWubi:(id)a3
{
  void *v3;
  BOOL v4;

  -[TIKeyEventMap_zh_Stroke wubiFromASCII:](self, "wubiFromASCII:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)remapKeyWithString:(id)a3 stringWithoutModifiers:(id)a4 modifierFlags:(unint64_t)a5 keyboardState:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (!objc_msgSend(v12, "hardwareKeyboardMode"))
    goto LABEL_11;
  if (-[TIKeyEventMap_zh_Stroke isNumericWubi:](self, "isNumericWubi:", v11) && (a5 == 0x400000 || a5 == 0x80000))
  {
    v13 = v11;
  }
  else
  {
    if (!-[TIKeyEventMap_zh_Stroke isNumericWubi:](self, "isNumericWubi:", v10))
      goto LABEL_11;
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("=")))
    {
      objc_msgSend(v12, "documentState");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "markedText");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "length");

      if (!v16)
        goto LABEL_11;
    }
    -[TIKeyEventMap_zh_Stroke wubiFromASCII:](self, "wubiFromASCII:", v10);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = v13;
  if (!v13)
  {
LABEL_11:
    v19.receiver = self;
    v19.super_class = (Class)TIKeyEventMap_zh_Stroke;
    -[TIKeyEventMap_zh remapKeyWithString:stringWithoutModifiers:modifierFlags:keyboardState:](&v19, sel_remapKeyWithString_stringWithoutModifiers_modifierFlags_keyboardState_, v10, v11, a5, v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

+ (id)sharedInstance
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
