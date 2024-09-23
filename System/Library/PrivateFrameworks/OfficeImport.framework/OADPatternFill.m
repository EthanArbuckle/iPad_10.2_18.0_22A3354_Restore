@implementation OADPatternFill

+ (id)defaultProperties
{
  if (+[OADPatternFill defaultProperties]::once != -1)
    dispatch_once(&+[OADPatternFill defaultProperties]::once, &__block_literal_global_380);
  return (id)+[OADPatternFill defaultProperties]::defaultProperties;
}

- (OADPatternFill)initWithDefaults
{
  OADPatternFill *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OADPatternFill;
  v2 = -[OADProperties initWithDefaults](&v8, sel_initWithDefaults);
  if (v2)
  {
    +[OADPresetPattern defaultProperties](OADPresetPattern, "defaultProperties");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "copy");
    -[OADPatternFill setPattern:](v2, "setPattern:", v4);

    +[OADRgbColor black](OADRgbColor, "black");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADPatternFill setFgColor:](v2, "setFgColor:", v5);

    +[OADRgbColor white](OADRgbColor, "white");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADPatternFill setBgColor:](v2, "setBgColor:", v6);

  }
  return v2;
}

- (void)setPattern:(id)a3
{
  objc_storeStrong((id *)&self->mBgColor, a3);
}

- (void)setFgColor:(id)a3
{
  objc_storeStrong((id *)&self->super.mDefinedByStyle, a3);
}

- (void)setBgColor:(id)a3
{
  objc_storeStrong((id *)&self->mFgColor, a3);
}

- (void)setParent:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)OADPatternFill;
  -[OADProperties setParent:](&v6, sel_setParent_, v4);
  if (self->mBgColor)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "pattern");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isMemberOfClass:", objc_opt_class()))
        -[OADColor setParent:](self->mBgColor, "setParent:", v5);

    }
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  objc_object **v5;
  char v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)OADPatternFill;
  if (-[OADFill isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = (objc_object **)v4;
    if (TCObjectEqual(*(objc_object **)&self->super.mDefinedByStyle, v5[3])
      && TCObjectEqual((objc_object *)self->mFgColor, v5[4]))
    {
      v6 = TCObjectEqual((objc_object *)self->mBgColor, v5[5]);
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

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  OADColor *mFgColor;
  OADColor *mBgColor;
  objc_super v8;

  v3 = *(void **)&self->super.mDefinedByStyle;
  if (v3)
    v4 = objc_msgSend(v3, "hash");
  else
    v4 = 0;
  mFgColor = self->mFgColor;
  if (mFgColor)
    v4 ^= -[OADColor hash](mFgColor, "hash");
  mBgColor = self->mBgColor;
  if (mBgColor)
    v4 ^= -[OADColor hash](mBgColor, "hash");
  v8.receiver = self;
  v8.super_class = (Class)OADPatternFill;
  return -[OADFill hash](&v8, sel_hash) ^ v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  OADColor *mFgColor;
  id v9;
  OADColor *mBgColor;
  id v11;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = *(void **)&self->super.mDefinedByStyle;
  if (v6)
  {
    v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
    objc_msgSend(v5, "setFgColor:", v7);

  }
  mFgColor = self->mFgColor;
  if (mFgColor)
  {
    v9 = -[OADColor copyWithZone:](mFgColor, "copyWithZone:", a3);
    objc_msgSend(v5, "setBgColor:", v9);

  }
  mBgColor = self->mBgColor;
  if (mBgColor)
  {
    v11 = -[OADColor copyWithZone:](mBgColor, "copyWithZone:", a3);
    objc_msgSend(v5, "setPattern:", v11);

  }
  return v5;
}

void __35__OADPatternFill_defaultProperties__block_invoke()
{
  OADPatternFill *v0;
  void *v1;

  v0 = -[OADPatternFill initWithDefaults]([OADPatternFill alloc], "initWithDefaults");
  v1 = (void *)+[OADPatternFill defaultProperties]::defaultProperties;
  +[OADPatternFill defaultProperties]::defaultProperties = (uint64_t)v0;

}

- (BOOL)isAnythingOverridden
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OADPatternFill;
  return -[OADProperties isAnythingOverridden](&v4, sel_isAnythingOverridden)
      || -[OADPatternFill isFgColorOverridden](self, "isFgColorOverridden")
      || -[OADPatternFill isBgColorOverridden](self, "isBgColorOverridden")
      || -[OADPatternFill isPatternOverridden](self, "isPatternOverridden");
}

- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_object *v7;
  void *v8;
  objc_object *v9;
  int v10;
  void *v11;
  id v12;
  void *v13;
  objc_object *v14;
  void *v15;
  objc_object *v16;
  int v17;
  OADColor *mFgColor;
  OADColor **p_mBgColor;
  id v20;
  void *v21;
  id v22;
  void *v23;
  OADColor *v24;
  char isKindOfClass;
  uint64_t v26;
  OADColor *v27;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)OADPatternFill;
  -[OADProperties fixPropertiesForChangingParentPreservingEffectiveValues:](&v28, sel_fixPropertiesForChangingParentPreservingEffectiveValues_, v4);
  if (-[OADPatternFill isFgColorOverridden](self, "isFgColorOverridden")
    || (-[OADProperties parent](self, "parent"), v5 = (id)objc_claimAutoreleasedReturnValue(),
                                                 v5,
                                                 v5 != v4))
  {
    -[OADProperties possiblyInexistentOverrideForSelector:](self, "possiblyInexistentOverrideForSelector:", sel_isFgColorOverridden);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[OADPatternFill fgColor](self, "fgColor");
      v7 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_isFgColorOverridden);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "fgColor");
      v9 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    v10 = TCObjectEqual(v7, v9);
    v11 = *(void **)&self->super.mDefinedByStyle;
    if (v10)
    {
      *(_QWORD *)&self->super.mDefinedByStyle = 0;

    }
    else if (!v11 && v6)
    {
      -[OADPatternFill setFgColor:](self, "setFgColor:", v7);
    }

  }
  if (-[OADPatternFill isBgColorOverridden](self, "isBgColorOverridden")
    || (-[OADProperties parent](self, "parent"),
        v12 = (id)objc_claimAutoreleasedReturnValue(),
        v12,
        v12 != v4))
  {
    -[OADProperties possiblyInexistentOverrideForSelector:](self, "possiblyInexistentOverrideForSelector:", sel_isBgColorOverridden);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[OADPatternFill bgColor](self, "bgColor");
      v14 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_isBgColorOverridden);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v4, "bgColor");
      v16 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
    v17 = TCObjectEqual(v14, v16);
    mFgColor = self->mFgColor;
    if (v17)
    {
      self->mFgColor = 0;

    }
    else if (!mFgColor && v13)
    {
      -[OADPatternFill setBgColor:](self, "setBgColor:", v14);
    }

  }
  p_mBgColor = &self->mBgColor;
  if (self->mBgColor
    || (-[OADProperties parent](self, "parent"),
        v20 = (id)objc_claimAutoreleasedReturnValue(),
        v20,
        v20 != v4))
  {
    -[OADPatternFill pattern](self, "pattern");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_alloc_init((Class)objc_opt_class());

    -[OADPatternFill pattern](self, "pattern");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setParent:", v23);

    objc_storeStrong((id *)p_mBgColor, v22);
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_isPatternOverridden);
    v24 = (OADColor *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v4, "pattern");
      v24 = (OADColor *)objc_claimAutoreleasedReturnValue();
    }
    if (*p_mBgColor == v24)
    {
      v27 = v24;
    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) == 0)
      {
        objc_msgSend((id)objc_opt_class(), "defaultProperties");
        v26 = objc_claimAutoreleasedReturnValue();

        v24 = (OADColor *)v26;
      }
      -[OADColor changeParentPreservingEffectiveValues:](*p_mBgColor, "changeParentPreservingEffectiveValues:", v24);
      if ((isKindOfClass & 1) == 0 || (-[OADColor isAnythingOverridden](*p_mBgColor, "isAnythingOverridden") & 1) != 0)
        goto LABEL_41;
      v27 = *p_mBgColor;
    }
    *p_mBgColor = 0;

LABEL_41:
  }

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
  void *v13;
  objc_object *v14;
  objc_object *v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  OADColor *mFgColor;
  void *v20;
  objc_object *v21;
  objc_object *v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  OADColor *mBgColor;
  objc_super v27;

  -[OADProperties parent](self, "parent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = -[OADProperties isMerged](self, "isMerged");
    v5 = -[OADProperties isMergedWithParent](self, "isMergedWithParent");
    -[OADProperties setMerged:](self, "setMerged:", 0);
    -[OADProperties setMergedWithParent:](self, "setMergedWithParent:", 0);
    if (!-[OADPatternFill isFgColorOverridden](self, "isFgColorOverridden"))
      goto LABEL_10;
    -[OADProperties parent](self, "parent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADPatternFill fgColor](self, "fgColor");
    v7 = (objc_object *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fgColor");
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

LABEL_10:
      if (!-[OADPatternFill isBgColorOverridden](self, "isBgColorOverridden"))
        goto LABEL_18;
      -[OADProperties parent](self, "parent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADPatternFill bgColor](self, "bgColor");
      v14 = (objc_object *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bgColor");
      v15 = (objc_object *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[objc_object removeUnnecessaryOverrides](v14, "removeUnnecessaryOverrides");
        v16 = objc_opt_class();
        if (v16 != objc_opt_class())
          goto LABEL_17;
        v17 = -[objc_object isMergedWithParent](v14, "isMergedWithParent");
        -[objc_object setMergedWithParent:](v14, "setMergedWithParent:", 0);
        v18 = -[objc_object isAnythingOverridden](v14, "isAnythingOverridden");
        -[objc_object setMergedWithParent:](v14, "setMergedWithParent:", v17);
        if ((v18 & 1) != 0)
          goto LABEL_17;
      }
      else if (!TCObjectEqual(v14, v15))
      {
LABEL_17:

LABEL_18:
        if (!-[OADPatternFill isPatternOverridden](self, "isPatternOverridden"))
        {
LABEL_26:
          -[OADProperties setMerged:](self, "setMerged:", v4);
          -[OADProperties setMergedWithParent:](self, "setMergedWithParent:", v5);
          v27.receiver = self;
          v27.super_class = (Class)OADPatternFill;
          -[OADProperties removeUnnecessaryOverrides](&v27, sel_removeUnnecessaryOverrides);
          return;
        }
        -[OADProperties parent](self, "parent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[OADPatternFill pattern](self, "pattern");
        v21 = (objc_object *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "pattern");
        v22 = (objc_object *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[objc_object removeUnnecessaryOverrides](v21, "removeUnnecessaryOverrides");
          v23 = objc_opt_class();
          if (v23 != objc_opt_class())
            goto LABEL_25;
          v24 = -[objc_object isMergedWithParent](v21, "isMergedWithParent");
          -[objc_object setMergedWithParent:](v21, "setMergedWithParent:", 0);
          v25 = -[objc_object isAnythingOverridden](v21, "isAnythingOverridden");
          -[objc_object setMergedWithParent:](v21, "setMergedWithParent:", v24);
          if ((v25 & 1) != 0)
            goto LABEL_25;
        }
        else if (!TCObjectEqual(v21, v22))
        {
LABEL_25:

          goto LABEL_26;
        }
        mBgColor = self->mBgColor;
        self->mBgColor = 0;

        goto LABEL_25;
      }
      mFgColor = self->mFgColor;
      self->mFgColor = 0;

      goto LABEL_17;
    }
    v12 = *(void **)&self->super.mDefinedByStyle;
    *(_QWORD *)&self->super.mDefinedByStyle = 0;

    goto LABEL_9;
  }
}

- (id)fgColor
{
  id *v2;
  id v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_isFgColorOverridden);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[3];

  return v3;
}

- (BOOL)isFgColorOverridden
{
  return *(_QWORD *)&self->super.mDefinedByStyle
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (id)bgColor
{
  id *v2;
  id v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_isBgColorOverridden);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[4];

  return v3;
}

- (BOOL)isBgColorOverridden
{
  return self->mFgColor || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (id)pattern
{
  id *v2;
  id v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_isPatternOverridden);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[5];

  return v3;
}

- (BOOL)isPatternOverridden
{
  return self->mBgColor || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (void)setStyleColor:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(*(id *)&self->super.mDefinedByStyle, "colorForStyleColor:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADPatternFill setFgColor:](self, "setFgColor:", v4);

  -[OADColor colorForStyleColor:](self->mFgColor, "colorForStyleColor:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADPatternFill setBgColor:](self, "setBgColor:", v5);

}

- (id)namedImageDataWithBlipCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[OADColor blipRef](self->mBgColor, "blipRef");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "blip");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(v4, "blipAtIndex:", objc_msgSend(v5, "index"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "mainSubBlip");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isLoaded") & 1) == 0)
      objc_msgSend(v7, "load");
    objc_msgSend(v7, "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (-[__CFString length](v9, "length"))
    {
      if (v7)
      {
LABEL_8:
        +[OADBlip pathExtensionForBlipType:](OADBlip, "pathExtensionForBlipType:", objc_msgSend(v7, "type"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString stringByAppendingPathExtension:](v9, "stringByAppendingPathExtension:", v10);
        v11 = objc_claimAutoreleasedReturnValue();

        +[TCNamedData namedDataWithData:named:](TCNamedData, "namedDataWithData:named:", v8, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = (__CFString *)v11;
LABEL_12:

        goto LABEL_13;
      }
    }
    else
    {

      v9 = CFSTR("pattern");
      if (v7)
        goto LABEL_8;
    }
    v12 = 0;
    goto LABEL_12;
  }
  +[OADPresetPattern namedBitmapDataForPresetPatternType:](OADPresetPattern, "namedBitmapDataForPresetPatternType:", -[OADColor type](self->mBgColor, "type"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mBgColor, 0);
  objc_storeStrong((id *)&self->mFgColor, 0);
  objc_storeStrong((id *)&self->super.mDefinedByStyle, 0);
}

@end
