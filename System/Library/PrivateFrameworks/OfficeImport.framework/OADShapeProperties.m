@implementation OADShapeProperties

+ (id)defaultProperties
{
  if (+[OADShapeProperties defaultProperties]::once != -1)
    dispatch_once(&+[OADShapeProperties defaultProperties]::once, &__block_literal_global_61);
  return (id)+[OADShapeProperties defaultProperties]::defaultProperties;
}

- (BOOL)isTextBox
{
  return *((_BYTE *)&self->super + 121);
}

- (void)setIsTextBox:(BOOL)a3
{
  *((_BYTE *)&self->super + 121) = a3;
}

- (unint64_t)hash
{
  uint64_t v2;
  objc_super v4;

  v2 = *((unsigned __int8 *)&self->super + 121);
  v4.receiver = self;
  v4.super_class = (Class)OADShapeProperties;
  return -[OADGraphicProperties hash](&v4, sel_hash) ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char isKindOfClass;
  id v6;
  unint64_t v7;
  int v8;
  objc_super v10;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    v6 = v4;
    v7 = -[OADShapeProperties hash](self, "hash");
    if (v7 == objc_msgSend(v6, "hash"))
    {
      v8 = objc_msgSend(v6, "isTextBox");
      if (v8 == -[OADShapeProperties isTextBox](self, "isTextBox"))
      {
        v10.receiver = self;
        v10.super_class = (Class)OADShapeProperties;
        -[OADGraphicProperties isEqual:](&v10, sel_isEqual_, v6);
      }
    }

  }
  return isKindOfClass & 1;
}

void __39__OADShapeProperties_defaultProperties__block_invoke()
{
  OADShapeProperties *v0;
  void *v1;

  v0 = -[OADGraphicProperties initWithDefaults]([OADShapeProperties alloc], "initWithDefaults");
  v1 = (void *)+[OADShapeProperties defaultProperties]::defaultProperties;
  +[OADShapeProperties defaultProperties]::defaultProperties = (uint64_t)v0;

}

@end
