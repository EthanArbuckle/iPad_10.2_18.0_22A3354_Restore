@implementation OADSolidFill

+ (id)defaultProperties
{
  if (+[OADSolidFill defaultProperties]::once != -1)
    dispatch_once(&+[OADSolidFill defaultProperties]::once, &__block_literal_global_38_0);
  return (id)+[OADSolidFill defaultProperties]::defaultProperties;
}

- (OADSolidFill)initWithDefaults
{
  OADSolidFill *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OADSolidFill;
  v2 = -[OADProperties initWithDefaults](&v5, sel_initWithDefaults);
  if (v2)
  {
    +[OADRgbColor black](OADRgbColor, "black");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADSolidFill setColor:](v2, "setColor:", v3);

  }
  return v2;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->super.mDefinedByStyle, a3);
  LOBYTE(self->mColor) = 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  char v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)OADSolidFill;
  if (-[OADFill isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = v4;
    if (LOBYTE(self->mColor) == *((unsigned __int8 *)v5 + 32))
    {
      if (LOBYTE(self->mColor))
        v6 = objc_msgSend(*(id *)&self->super.mDefinedByStyle, "isEqual:", v5[3]);
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

- (id)color
{
  id *v2;
  id v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_isColorOverridden);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[3];

  return v3;
}

- (BOOL)isColorOverridden
{
  return LOBYTE(self->mColor) || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (unint64_t)hash
{
  uint64_t v3;
  objc_super v5;

  if (LOBYTE(self->mColor))
    v3 = objc_msgSend(*(id *)&self->super.mDefinedByStyle, "hash");
  else
    v3 = 0;
  v5.receiver = self;
  v5.super_class = (Class)OADSolidFill;
  return -[OADFill hash](&v5, sel_hash) ^ v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (LOBYTE(self->mColor))
  {
    v6 = (void *)objc_msgSend(*(id *)&self->super.mDefinedByStyle, "copyWithZone:", a3);
    objc_msgSend(v5, "setColor:", v6);

  }
  return v5;
}

+ (id)blackFill
{
  OADSolidFill *v2;
  void *v3;

  v2 = objc_alloc_init(OADSolidFill);
  +[OADRgbColor black](OADRgbColor, "black");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADSolidFill setColor:](v2, "setColor:", v3);

  return v2;
}

- (void)setStyleColor:(id)a3
{
  id v4;

  objc_msgSend(*(id *)&self->super.mDefinedByStyle, "colorForStyleColor:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[OADSolidFill setColor:](self, "setColor:");

}

+ (id)whiteFill
{
  OADSolidFill *v2;
  void *v3;

  v2 = objc_alloc_init(OADSolidFill);
  +[OADRgbColor white](OADRgbColor, "white");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADSolidFill setColor:](v2, "setColor:", v3);

  return v2;
}

void __33__OADSolidFill_defaultProperties__block_invoke()
{
  OADSolidFill *v0;
  void *v1;

  v0 = -[OADSolidFill initWithDefaults]([OADSolidFill alloc], "initWithDefaults");
  v1 = (void *)+[OADSolidFill defaultProperties]::defaultProperties;
  +[OADSolidFill defaultProperties]::defaultProperties = (uint64_t)v0;

}

- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_object *v7;
  void *v8;
  objc_object *v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)OADSolidFill;
  -[OADProperties fixPropertiesForChangingParentPreservingEffectiveValues:](&v11, sel_fixPropertiesForChangingParentPreservingEffectiveValues_, v4);
  if (LOBYTE(self->mColor)
    || (-[OADProperties parent](self, "parent"), v5 = (id)objc_claimAutoreleasedReturnValue(),
                                                 v5,
                                                 v5 != v4))
  {
    -[OADProperties possiblyInexistentOverrideForSelector:](self, "possiblyInexistentOverrideForSelector:", sel_isColorOverridden);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[OADSolidFill color](self, "color");
      v7 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_isColorOverridden);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "color");
      v9 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    if (TCObjectEqual(v7, v9))
    {
      v10 = *(void **)&self->super.mDefinedByStyle;
      *(_QWORD *)&self->super.mDefinedByStyle = 0;

      LOBYTE(self->mColor) = 0;
    }
    else if (!LOBYTE(self->mColor) && v6)
    {
      -[OADSolidFill setColor:](self, "setColor:", v7);
    }

  }
}

- (BOOL)usesPlaceholderColor
{
  void *v2;
  char isKindOfClass;

  -[OADSolidFill color](self, "color");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)isAnythingOverridden
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OADSolidFill;
  return -[OADProperties isAnythingOverridden](&v4, sel_isAnythingOverridden)
      || -[OADSolidFill isColorOverridden](self, "isColorOverridden");
}

- (void)removeUnnecessaryOverrides
{
  void *v3;
  _BOOL8 v4;
  _BOOL8 v5;
  void *v6;
  objc_object *v7;
  objc_object *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  void *v12;
  objc_super v13;

  -[OADProperties parent](self, "parent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = -[OADProperties isMerged](self, "isMerged");
    v5 = -[OADProperties isMergedWithParent](self, "isMergedWithParent");
    -[OADProperties setMerged:](self, "setMerged:", 0);
    -[OADProperties setMergedWithParent:](self, "setMergedWithParent:", 0);
    if (!-[OADSolidFill isColorOverridden](self, "isColorOverridden"))
    {
LABEL_10:
      -[OADProperties setMerged:](self, "setMerged:", v4);
      -[OADProperties setMergedWithParent:](self, "setMergedWithParent:", v5);
      v13.receiver = self;
      v13.super_class = (Class)OADSolidFill;
      -[OADProperties removeUnnecessaryOverrides](&v13, sel_removeUnnecessaryOverrides);
      return;
    }
    -[OADProperties parent](self, "parent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADSolidFill color](self, "color");
    v7 = (objc_object *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "color");
    v8 = (objc_object *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[objc_object removeUnnecessaryOverrides](v7, "removeUnnecessaryOverrides");
      v9 = objc_opt_class();
      if (v9 != objc_opt_class())
        goto LABEL_9;
      v10 = -[objc_object isMergedWithParent](v7, "isMergedWithParent");
      -[objc_object setMergedWithParent:](v7, "setMergedWithParent:", 0);
      v11 = -[objc_object isAnythingOverridden](v7, "isAnythingOverridden");
      -[objc_object setMergedWithParent:](v7, "setMergedWithParent:", v10);
      if ((v11 & 1) != 0)
        goto LABEL_9;
    }
    else if (!TCObjectEqual(v7, v8))
    {
LABEL_9:

      goto LABEL_10;
    }
    v12 = *(void **)&self->super.mDefinedByStyle;
    *(_QWORD *)&self->super.mDefinedByStyle = 0;

    LOBYTE(self->mColor) = 0;
    goto LABEL_9;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->super.mDefinedByStyle, 0);
}

@end
