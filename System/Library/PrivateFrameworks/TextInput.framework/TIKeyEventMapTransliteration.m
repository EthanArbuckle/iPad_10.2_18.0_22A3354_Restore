@implementation TIKeyEventMapTransliteration

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
  if (!objc_msgSend(v10, "isEqualToString:", CFSTR("¤"))
    || (objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v13, "currencySymbol"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        !v14))
  {
    v16.receiver = self;
    v16.super_class = (Class)TIKeyEventMapTransliteration;
    -[TIKeyEventMap remapKeyWithString:stringWithoutModifiers:modifierFlags:keyboardState:](&v16, sel_remapKeyWithString_stringWithoutModifiers_modifierFlags_keyboardState_, v10, v11, a5, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
