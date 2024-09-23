@implementation OADGroupProperties

+ (id)defaultProperties
{
  if (+[OADGroupProperties defaultProperties]::once != -1)
    dispatch_once(&+[OADGroupProperties defaultProperties]::once, &__block_literal_global_57);
  return (id)+[OADGroupProperties defaultProperties]::defaultProperties;
}

- (OADGroupProperties)initWithDefaults
{
  OADGroupProperties *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OADGroupProperties;
  v2 = -[OADDrawableProperties initWithDefaults](&v8, sel_initWithDefaults);
  if (v2)
  {
    +[OADNullFill nullFill](OADNullFill, "nullFill");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADGroupProperties setFill:](v2, "setFill:", v3);

    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADGroupProperties setEffects:](v2, "setEffects:", v4);

    +[OADScene3D nullScene3D](OADScene3D, "nullScene3D");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADGroupProperties setScene3D:](v2, "setScene3D:", v5);

    +[OADShape3D nullShape3D](OADShape3D, "nullShape3D");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADGroupProperties setShape3D:](v2, "setShape3D:", v6);

  }
  return v2;
}

- (void)setFill:(id)a3
{
  objc_storeStrong((id *)&self->mFill, a3);
}

- (void)setEffects:(id)a3
{
  objc_storeStrong((id *)&self->mEffects, a3);
}

- (void)setScene3D:(id)a3
{
  objc_storeStrong((id *)&self->mScene3D, a3);
}

- (void)setShape3D:(id)a3
{
  objc_storeStrong((id *)&self->mShape3D, a3);
}

- (id)fill
{
  id *v2;
  id v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasFill);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[9];

  return v3;
}

- (BOOL)hasFill
{
  return self->mFill || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (id)effects
{
  id *v2;
  id v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasEffects);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[10];

  return v3;
}

- (BOOL)hasEffects
{
  return self->mEffects || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (id)scene3D
{
  id *v2;
  id v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasScene3D);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[11];

  return v3;
}

- (BOOL)hasScene3D
{
  return self->mScene3D || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (id)shape3D
{
  id *v2;
  id v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasShape3D);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[12];

  return v3;
}

- (BOOL)hasShape3D
{
  return self->mShape3D || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

void __39__OADGroupProperties_defaultProperties__block_invoke()
{
  OADGroupProperties *v0;
  void *v1;

  v0 = -[OADGroupProperties initWithDefaults]([OADGroupProperties alloc], "initWithDefaults");
  v1 = (void *)+[OADGroupProperties defaultProperties]::defaultProperties;
  +[OADGroupProperties defaultProperties]::defaultProperties = (uint64_t)v0;

}

- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3
{
  id v4;
  OADFill **p_mFill;
  id v6;
  void *v7;
  id v8;
  void *v9;
  OADFill *v10;
  char isKindOfClass;
  uint64_t v12;
  OADFill *v13;
  id v14;
  void *v15;
  objc_object *v16;
  void *v17;
  objc_object *v18;
  int v19;
  NSArray *mEffects;
  id v21;
  void *v22;
  objc_object *v23;
  void *v24;
  objc_object *v25;
  int v26;
  OADScene3D *mScene3D;
  id v28;
  void *v29;
  objc_object *v30;
  void *v31;
  objc_object *v32;
  int v33;
  OADShape3D *mShape3D;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)OADGroupProperties;
  -[OADDrawableProperties fixPropertiesForChangingParentPreservingEffectiveValues:](&v35, sel_fixPropertiesForChangingParentPreservingEffectiveValues_, v4);
  p_mFill = &self->mFill;
  if (self->mFill
    || (-[OADProperties parent](self, "parent"), v6 = (id)objc_claimAutoreleasedReturnValue(),
                                                 v6,
                                                 v6 != v4))
  {
    -[OADGroupProperties fill](self, "fill");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc_init((Class)objc_opt_class());

    -[OADGroupProperties fill](self, "fill");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setParent:", v9);

    objc_storeStrong((id *)&self->mFill, v8);
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_hasFill);
    v10 = (OADFill *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "fill");
      v10 = (OADFill *)objc_claimAutoreleasedReturnValue();
    }
    if (*p_mFill == v10)
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

        v10 = (OADFill *)v12;
      }
      -[OADProperties changeParentPreservingEffectiveValues:](*p_mFill, "changeParentPreservingEffectiveValues:", v10);
      if ((isKindOfClass & 1) == 0 || -[OADProperties isAnythingOverridden](*p_mFill, "isAnythingOverridden"))
        goto LABEL_13;
      v13 = *p_mFill;
    }
    *p_mFill = 0;

LABEL_13:
  }
  if (-[OADGroupProperties hasEffects](self, "hasEffects")
    || (-[OADProperties parent](self, "parent"),
        v14 = (id)objc_claimAutoreleasedReturnValue(),
        v14,
        v14 != v4))
  {
    -[OADProperties possiblyInexistentOverrideForSelector:](self, "possiblyInexistentOverrideForSelector:", sel_hasEffects);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[OADGroupProperties effects](self, "effects");
      v16 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_hasEffects);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v4, "effects");
      v18 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }
    v19 = TCObjectEqual(v16, v18);
    mEffects = self->mEffects;
    if (v19)
    {
      self->mEffects = 0;

    }
    else if (!mEffects && v15)
    {
      -[OADGroupProperties setEffects:](self, "setEffects:", v16);
    }

  }
  if (-[OADGroupProperties hasScene3D](self, "hasScene3D")
    || (-[OADProperties parent](self, "parent"),
        v21 = (id)objc_claimAutoreleasedReturnValue(),
        v21,
        v21 != v4))
  {
    -[OADProperties possiblyInexistentOverrideForSelector:](self, "possiblyInexistentOverrideForSelector:", sel_hasScene3D);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      -[OADGroupProperties scene3D](self, "scene3D");
      v23 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
    }
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_hasScene3D);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v4, "scene3D");
      v25 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = 0;
    }
    v26 = TCObjectEqual(v23, v25);
    mScene3D = self->mScene3D;
    if (v26)
    {
      self->mScene3D = 0;

    }
    else if (!mScene3D && v22)
    {
      -[OADGroupProperties setScene3D:](self, "setScene3D:", v23);
    }

  }
  if (-[OADGroupProperties hasShape3D](self, "hasShape3D")
    || (-[OADProperties parent](self, "parent"),
        v28 = (id)objc_claimAutoreleasedReturnValue(),
        v28,
        v28 != v4))
  {
    -[OADProperties possiblyInexistentOverrideForSelector:](self, "possiblyInexistentOverrideForSelector:", sel_hasShape3D);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      -[OADGroupProperties shape3D](self, "shape3D");
      v30 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = 0;
    }
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_hasShape3D);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      objc_msgSend(v4, "shape3D");
      v32 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = 0;
    }
    v33 = TCObjectEqual(v30, v32);
    mShape3D = self->mShape3D;
    if (v33)
    {
      self->mShape3D = 0;

    }
    else if (!mShape3D && v29)
    {
      -[OADGroupProperties setShape3D:](self, "setShape3D:", v30);
    }

  }
}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADGroupProperties;
  -[OADDrawableProperties description](&v3, sel_description);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mShape3D, 0);
  objc_storeStrong((id *)&self->mScene3D, 0);
  objc_storeStrong((id *)&self->mEffects, 0);
  objc_storeStrong((id *)&self->mFill, 0);
}

@end
