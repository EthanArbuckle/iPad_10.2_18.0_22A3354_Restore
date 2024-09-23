@implementation OADPresetPattern

+ (id)defaultProperties
{
  if (+[OADPresetPattern defaultProperties]::once != -1)
    dispatch_once(&+[OADPresetPattern defaultProperties]::once, &__block_literal_global_257);
  return (id)+[OADPresetPattern defaultProperties]::defaultProperties;
}

- (OADPresetPattern)initWithDefaults
{
  OADPresetPattern *v2;
  OADPresetPattern *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OADPresetPattern;
  v2 = -[OADProperties initWithDefaults](&v5, sel_initWithDefaults);
  v3 = v2;
  if (v2)
    -[OADPresetPattern setType:](v2, "setType:", 1);
  return v3;
}

- (void)setType:(int)a3
{
  *((_DWORD *)&self->super.super + 5) = a3;
  LOBYTE(self->mType) = 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (LOBYTE(self->mType))
    objc_msgSend(v4, "setType:", *((unsigned int *)&self->super.super + 5));
  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  objc_super v4;

  if (LOBYTE(self->mType))
    v2 = *((unsigned int *)&self->super.super + 5);
  else
    v2 = 0;
  v4.receiver = self;
  v4.super_class = (Class)OADPresetPattern;
  return -[OADPattern hash](&v4, sel_hash) ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _DWORD *v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)OADPresetPattern;
  if (-[OADPattern isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = v4;
    if (LOBYTE(self->mType) == *((unsigned __int8 *)v5 + 24))
    {
      if (LOBYTE(self->mType))
        v6 = *((_DWORD *)&self->super.super + 5) == v5[5];
      else
        v6 = 1;
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __37__OADPresetPattern_defaultProperties__block_invoke()
{
  OADPresetPattern *v0;
  void *v1;

  v0 = -[OADPresetPattern initWithDefaults]([OADPresetPattern alloc], "initWithDefaults");
  v1 = (void *)+[OADPresetPattern defaultProperties]::defaultProperties;
  +[OADPresetPattern defaultProperties]::defaultProperties = (uint64_t)v0;

}

- (int)type
{
  _DWORD *v2;
  int v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_isTypeOverridden);
  v2 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  v3 = v2[5];

  return v3;
}

- (BOOL)isTypeOverridden
{
  return LOBYTE(self->mType) || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (BOOL)isAnythingOverridden
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OADPresetPattern;
  return -[OADProperties isAnythingOverridden](&v4, sel_isAnythingOverridden)
      || -[OADPresetPattern isTypeOverridden](self, "isTypeOverridden");
}

- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3
{
  id v4;
  id v5;
  int v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)OADPresetPattern;
  -[OADProperties fixPropertiesForChangingParentPreservingEffectiveValues:](&v7, sel_fixPropertiesForChangingParentPreservingEffectiveValues_, v4);
  if (LOBYTE(self->mType)
    || (-[OADProperties parent](self, "parent"), v5 = (id)objc_claimAutoreleasedReturnValue(),
                                                 v5,
                                                 v5 != v4))
  {
    v6 = -[OADPresetPattern type](self, "type");
    if (v6 == objc_msgSend(v4, "type"))
    {
      LOBYTE(self->mType) = 0;
    }
    else if (!LOBYTE(self->mType))
    {
      -[OADPresetPattern setType:](self, "setType:", -[OADPresetPattern type](self, "type"));
    }
  }

}

+ (id)nameForPresetPatternType:(int)a3
{
  if ((a3 - 1) > 0x35)
    return 0;
  else
    return off_24F39DAE0[a3 - 1];
}

+ (id)namedBitmapDataForPresetPatternType:(int)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "nameForPresetPatternType:", *(_QWORD *)&a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[OCPattern blackAndWhiteImageDataWithPatternName:](OCPattern, "blackAndWhiteImageDataWithPatternName:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingPathExtension:", CFSTR("bmp"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[TCNamedData namedDataWithData:named:](TCNamedData, "namedDataWithData:named:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
