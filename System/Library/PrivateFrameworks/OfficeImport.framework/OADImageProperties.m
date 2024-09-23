@implementation OADImageProperties

+ (id)defaultProperties
{
  if (+[OADImageProperties defaultProperties]::once != -1)
    dispatch_once(&+[OADImageProperties defaultProperties]::once, &__block_literal_global_58);
  return (id)+[OADImageProperties defaultProperties]::defaultProperties;
}

- (void)setImageFill:(id)a3
{
  objc_storeStrong((id *)&self->mImageFill, a3);
}

- (BOOL)hasImageFill
{
  void *v4;
  char isKindOfClass;
  OADImageFill *mImageFill;

  -[OADProperties parent](self, "parent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  mImageFill = self->mImageFill;
  if ((isKindOfClass & 1) == 0)
    return mImageFill != 0;
  if (mImageFill)
    return 1;
  return -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (id)imageFill
{
  id *v2;
  id v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasImageFill);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[16];

  return v3;
}

void __39__OADImageProperties_defaultProperties__block_invoke()
{
  OADImageProperties *v0;
  void *v1;

  v0 = -[OADGraphicProperties initWithDefaults]([OADImageProperties alloc], "initWithDefaults");
  v1 = (void *)+[OADImageProperties defaultProperties]::defaultProperties;
  +[OADImageProperties defaultProperties]::defaultProperties = (uint64_t)v0;

}

- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3
{
  id v4;
  OADImageFill **p_mImageFill;
  id v6;
  void *v7;
  id v8;
  void *v9;
  OADImageFill *v10;
  char isKindOfClass;
  uint64_t v12;
  OADImageFill *v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)OADImageProperties;
  -[OADGraphicProperties fixPropertiesForChangingParentPreservingEffectiveValues:](&v14, sel_fixPropertiesForChangingParentPreservingEffectiveValues_, v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    p_mImageFill = &self->mImageFill;
    if (self->mImageFill
      || (-[OADProperties parent](self, "parent"),
          v6 = (id)objc_claimAutoreleasedReturnValue(),
          v6,
          v6 != v4))
    {
      -[OADImageProperties imageFill](self, "imageFill");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_alloc_init((Class)objc_opt_class());

      -[OADImageProperties imageFill](self, "imageFill");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setParent:", v9);

      objc_storeStrong((id *)p_mImageFill, v8);
      objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_hasImageFill);
      v10 = (OADImageFill *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v4, "imageFill");
        v10 = (OADImageFill *)objc_claimAutoreleasedReturnValue();
      }
      if (*p_mImageFill == v10)
      {
        v13 = v10;
      }
      else
      {
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        if ((isKindOfClass & 1) == 0)
        {
          objc_msgSend((id)objc_opt_class(), "defaultProperties");
          v12 = objc_claimAutoreleasedReturnValue();

          v10 = (OADImageFill *)v12;
        }
        -[OADProperties changeParentPreservingEffectiveValues:](*p_mImageFill, "changeParentPreservingEffectiveValues:", v10);
        if ((isKindOfClass & 1) == 0 || -[OADImageFill isAnythingOverridden](*p_mImageFill, "isAnythingOverridden"))
          goto LABEL_14;
        v13 = *p_mImageFill;
      }
      *p_mImageFill = 0;

LABEL_14:
    }
  }

}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADImageProperties;
  -[OADGraphicProperties description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mImageFill, 0);
}

@end
