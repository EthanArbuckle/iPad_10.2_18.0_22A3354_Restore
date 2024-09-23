@implementation VOSScreenreaderMode

- (id)_initWithRawValue:(id)a3
{
  id v5;
  VOSScreenreaderMode *v6;
  VOSScreenreaderMode *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VOSScreenreaderMode;
  v6 = -[VOSScreenreaderMode init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_rawValue, a3);

  return v7;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@<%p>: %@"), v5, self, self->_rawValue);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (VOSScreenreaderMode)Default
{
  if (Default_onceToken != -1)
    dispatch_once(&Default_onceToken, &__block_literal_global_3);
  return (VOSScreenreaderMode *)(id)Default__Mode;
}

void __30__VOSScreenreaderMode_Default__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSScreenreaderMode _initWithRawValue:]([VOSScreenreaderMode alloc], "_initWithRawValue:", CFSTR("Default"));
  v1 = (void *)Default__Mode;
  Default__Mode = (uint64_t)v0;

}

+ (VOSScreenreaderMode)Handwriting
{
  if (Handwriting_onceToken != -1)
    dispatch_once(&Handwriting_onceToken, &__block_literal_global_181);
  return (VOSScreenreaderMode *)(id)Handwriting__Mode;
}

void __34__VOSScreenreaderMode_Handwriting__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSScreenreaderMode _initWithRawValue:]([VOSScreenreaderMode alloc], "_initWithRawValue:", CFSTR("Handwriting"));
  v1 = (void *)Handwriting__Mode;
  Handwriting__Mode = (uint64_t)v0;

}

+ (VOSScreenreaderMode)BrailleScreenInput
{
  if (BrailleScreenInput_onceToken != -1)
    dispatch_once(&BrailleScreenInput_onceToken, &__block_literal_global_184);
  return (VOSScreenreaderMode *)(id)BrailleScreenInput__Mode;
}

void __41__VOSScreenreaderMode_BrailleScreenInput__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSScreenreaderMode _initWithRawValue:]([VOSScreenreaderMode alloc], "_initWithRawValue:", CFSTR("BrailleScreenInput"));
  v1 = (void *)BrailleScreenInput__Mode;
  BrailleScreenInput__Mode = (uint64_t)v0;

}

+ (VOSScreenreaderMode)Invalid
{
  if (Invalid_onceToken_0 != -1)
    dispatch_once(&Invalid_onceToken_0, &__block_literal_global_187);
  return (VOSScreenreaderMode *)(id)Invalid__Mode;
}

void __30__VOSScreenreaderMode_Invalid__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSScreenreaderMode _initWithRawValue:]([VOSScreenreaderMode alloc], "_initWithRawValue:", CFSTR("Invalid"));
  v1 = (void *)Invalid__Mode;
  Invalid__Mode = (uint64_t)v0;

}

+ (NSSet)allModes
{
  if (allModes_onceToken != -1)
    dispatch_once(&allModes_onceToken, &__block_literal_global_190);
  return (NSSet *)(id)allModes__AllModes;
}

void __31__VOSScreenreaderMode_allModes__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v0 = (void *)MEMORY[0x24BDBCF20];
  +[VOSScreenreaderMode Default](VOSScreenreaderMode, "Default");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[VOSScreenreaderMode Handwriting](VOSScreenreaderMode, "Handwriting");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSScreenreaderMode BrailleScreenInput](VOSScreenreaderMode, "BrailleScreenInput");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithObjects:", v5, v1, v2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)allModes__AllModes;
  allModes__AllModes = v3;

}

+ (VOSScreenreaderMode)modeWithStringValue:(id)a3
{
  id v4;
  void *v5;
  id *v6;
  uint64_t v7;
  id *i;
  id *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a1, "allModes", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (id *)((char *)i + 1))
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(id **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v9[1], "isEqualToString:", v4) & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return (VOSScreenreaderMode *)v6;
}

- (NSString)rawValue
{
  return self->_rawValue;
}

- (NSString)localizedName
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("VOSScreenReaderMode.%@"), self->_rawValue);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  VOSLocString(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawValue, 0);
}

@end
