@implementation TIKeyEventMap_ja

- (id)remapKeyWithString:(id)a3 stringWithoutModifiers:(id)a4 modifierFlags:(unint64_t)a5 keyboardState:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR(" ")))
  {
    objc_msgSend(v12, "inputForMarkedText");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length");

    if (!v14)
    {
      if ((((a5 & 0x900000) == 0) & (((a5 & 0x220000) != 0) ^ objc_msgSend(v12, "shouldOutputFullwidthSpace"))) != 0)v19 = CFSTR("　");
      else
        v19 = CFSTR(" ");
      v18 = v19;
      goto LABEL_14;
    }
  }
  if ((a5 & 0x480000) != 0 && (a5 & 0x220000) != 0)
  {
    objc_msgSend((id)objc_opt_class(), "shiftOptionMap_JIS");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      goto LABEL_15;
  }
  else if ((a5 & 0x480000) == 0)
  {
LABEL_9:
    v21.receiver = self;
    v21.super_class = (Class)TIKeyEventMap_ja;
    -[TIKeyEventMap remapKeyWithString:stringWithoutModifiers:modifierFlags:keyboardState:](&v21, sel_remapKeyWithString_stringWithoutModifiers_modifierFlags_keyboardState_, v10, v11, a5, v12);
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_14:
    v16 = v18;
    goto LABEL_15;
  }
  objc_msgSend((id)objc_opt_class(), "optionMap_JIS");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
    goto LABEL_9;
LABEL_15:

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)shiftOptionMap_JIS
{
  if (shiftOptionMap_JIS_onceToken != -1)
    dispatch_once(&shiftOptionMap_JIS_onceToken, &__block_literal_global_225);
  return (id)shiftOptionMap_JIS_optionMap;
}

+ (id)optionMap_JIS
{
  if (optionMap_JIS_onceToken != -1)
    dispatch_once(&optionMap_JIS_onceToken, &__block_literal_global_233);
  return (id)optionMap_JIS_optionMap;
}

@end
