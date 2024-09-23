@implementation WDRunWithCharacterProperties

- (WDRunWithCharacterProperties)initWithParagraph:(id)a3
{
  WDRunWithCharacterProperties *v3;
  WDRunWithCharacterProperties *v4;
  WDCharacterProperties *mProperties;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WDRunWithCharacterProperties;
  v3 = -[WDRun initWithParagraph:](&v7, sel_initWithParagraph_, a3);
  v4 = v3;
  if (v3)
  {
    mProperties = v3->mProperties;
    v3->mProperties = 0;

  }
  return v4;
}

- (void)clearProperties
{
  -[WDRunWithCharacterProperties setProperties:](self, "setProperties:", 0);
}

- (BOOL)isHidden
{
  _BOOL4 v3;
  WDCharacterProperties *mProperties;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;

  v3 = -[WDCharacterProperties isHiddenOverridden](self->mProperties, "isHiddenOverridden");
  mProperties = self->mProperties;
  if (v3)
  {
    LOBYTE(v5) = -[WDCharacterProperties hidden](mProperties, "hidden") != 0;
  }
  else if (-[WDCharacterProperties isBaseStyleOverridden](mProperties, "isBaseStyleOverridden")
         && (-[WDCharacterProperties baseStyle](self->mProperties, "baseStyle"),
             (v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = (void *)v6;
    while (1)
    {
      objc_msgSend(v7, "characterProperties");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isHiddenOverridden");

      if (v9)
      {
        objc_msgSend(v7, "characterProperties");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v5) = objc_msgSend(v11, "hidden") == 1;

        goto LABEL_13;
      }
      objc_msgSend(v7, "baseStyle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 == v7)
        break;
      objc_msgSend(v7, "baseStyle");
      v5 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v5;
      if (!v5)
        return v5;
    }
    LOBYTE(v5) = 0;
LABEL_13:

  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (WDCharacterProperties)properties
{
  return (WDCharacterProperties *)objc_getProperty(self, a2, 16, 1);
}

- (void)setProperties:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mProperties, 0);
}

@end
