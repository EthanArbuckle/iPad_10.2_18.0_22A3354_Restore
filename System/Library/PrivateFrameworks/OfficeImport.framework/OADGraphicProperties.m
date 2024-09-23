@implementation OADGraphicProperties

- (OADGraphicProperties)initWithDefaults
{
  OADGraphicProperties *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)OADGraphicProperties;
  v2 = -[OADDrawableProperties initWithDefaults](&v10, sel_initWithDefaults);
  if (v2)
  {
    +[OADNullFill nullFill](OADNullFill, "nullFill");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADGraphicProperties setFill:](v2, "setFill:", v3);

    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADGraphicProperties setEffects:](v2, "setEffects:", v4);

    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADGraphicProperties setExts:](v2, "setExts:", v5);

    +[OADStroke nullStroke](OADStroke, "nullStroke");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADGraphicProperties setStroke:](v2, "setStroke:", v6);

    +[OADScene3D nullScene3D](OADScene3D, "nullScene3D");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADGraphicProperties setScene3D:](v2, "setScene3D:", v7);

    +[OADShape3D nullShape3D](OADShape3D, "nullShape3D");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADGraphicProperties setShape3D:](v2, "setShape3D:", v8);

    -[OADGraphicProperties setIsBehindText:](v2, "setIsBehindText:", 0);
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

- (void)setStroke:(id)a3
{
  objc_storeStrong((id *)&self->mStroke, a3);
}

- (void)setScene3D:(id)a3
{
  objc_storeStrong((id *)&self->mScene3D, a3);
}

- (void)setShape3D:(id)a3
{
  objc_storeStrong((id *)&self->mShape3D, a3);
}

- (void)setIsBehindText:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 120) = *((_BYTE *)self + 120) & 0xFD | v3;
  *((_BYTE *)self + 120) |= 1u;
}

- (void)setParent:(id)a3
{
  id v4;
  void *v5;
  OADFill *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  OADStroke *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)OADGraphicProperties;
  -[OADProperties setParent:](&v17, sel_setParent_, v4);
  if (self->mFill)
  {
    objc_msgSend(v4, "fill");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = self->mFill;
    -[OADProperties parent](self->mFill, "parent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 != v5)
    {
      -[OADProperties parent](self->mFill, "parent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "parent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[OADProperties parent](self->mFill, "parent");
        v10 = objc_claimAutoreleasedReturnValue();

        v6 = (OADFill *)v10;
      }
      if (objc_msgSend(v5, "isMemberOfClass:", objc_opt_class()))
        -[OADProperties setParent:](v6, "setParent:", v5);
    }

  }
  if (self->mStroke)
  {
    objc_msgSend(v4, "stroke");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = self->mStroke;
    -[OADProperties parent](self->mStroke, "parent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 != v11)
    {
      -[OADProperties parent](self->mStroke, "parent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "parent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        -[OADProperties parent](self->mStroke, "parent");
        v16 = objc_claimAutoreleasedReturnValue();

        v12 = (OADStroke *)v16;
      }
      -[OADStroke setParent:](v12, "setParent:", v11);
    }

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
  OADFill *mFill;
  void *v13;
  objc_object *v14;
  objc_object *v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  NSArray *mEffects;
  void *v20;
  objc_object *v21;
  objc_object *v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  NSArray *mExts;
  void *v27;
  objc_object *v28;
  objc_object *v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  OADScene3D *mScene3D;
  void *v34;
  objc_object *v35;
  objc_object *v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  OADShape3D *mShape3D;
  void *v41;
  objc_object *v42;
  objc_object *v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  OADStroke *mStroke;
  void *v48;
  int v49;
  objc_super v50;

  -[OADProperties parent](self, "parent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return;
  v4 = -[OADProperties isMerged](self, "isMerged");
  v5 = -[OADProperties isMergedWithParent](self, "isMergedWithParent");
  -[OADProperties setMerged:](self, "setMerged:", 0);
  -[OADProperties setMergedWithParent:](self, "setMergedWithParent:", 0);
  if (-[OADGraphicProperties hasFill](self, "hasFill"))
  {
    -[OADProperties parent](self, "parent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADGraphicProperties fill](self, "fill");
    v7 = (objc_object *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fill");
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
    mFill = self->mFill;
    self->mFill = 0;

    goto LABEL_9;
  }
LABEL_10:
  if (!-[OADGraphicProperties hasEffects](self, "hasEffects"))
    goto LABEL_18;
  -[OADProperties parent](self, "parent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADGraphicProperties effects](self, "effects");
  v14 = (objc_object *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "effects");
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
    goto LABEL_16;
  }
  if (TCObjectEqual(v14, v15))
  {
LABEL_16:
    mEffects = self->mEffects;
    self->mEffects = 0;

  }
LABEL_17:

LABEL_18:
  if (!-[OADGraphicProperties hasExts](self, "hasExts"))
    goto LABEL_26;
  -[OADProperties parent](self, "parent");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADGraphicProperties exts](self, "exts");
  v21 = (objc_object *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "exts");
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
    goto LABEL_24;
  }
  if (TCObjectEqual(v21, v22))
  {
LABEL_24:
    mExts = self->mExts;
    self->mExts = 0;

  }
LABEL_25:

LABEL_26:
  if (!-[OADGraphicProperties hasScene3D](self, "hasScene3D"))
    goto LABEL_34;
  -[OADProperties parent](self, "parent");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADGraphicProperties scene3D](self, "scene3D");
  v28 = (objc_object *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "scene3D");
  v29 = (objc_object *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[objc_object removeUnnecessaryOverrides](v28, "removeUnnecessaryOverrides");
    v30 = objc_opt_class();
    if (v30 != objc_opt_class())
      goto LABEL_33;
    v31 = -[objc_object isMergedWithParent](v28, "isMergedWithParent");
    -[objc_object setMergedWithParent:](v28, "setMergedWithParent:", 0);
    v32 = -[objc_object isAnythingOverridden](v28, "isAnythingOverridden");
    -[objc_object setMergedWithParent:](v28, "setMergedWithParent:", v31);
    if ((v32 & 1) != 0)
      goto LABEL_33;
    goto LABEL_32;
  }
  if (TCObjectEqual(v28, v29))
  {
LABEL_32:
    mScene3D = self->mScene3D;
    self->mScene3D = 0;

  }
LABEL_33:

LABEL_34:
  if (!-[OADGraphicProperties hasShape3D](self, "hasShape3D"))
    goto LABEL_42;
  -[OADProperties parent](self, "parent");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADGraphicProperties shape3D](self, "shape3D");
  v35 = (objc_object *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "shape3D");
  v36 = (objc_object *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[objc_object removeUnnecessaryOverrides](v35, "removeUnnecessaryOverrides");
    v37 = objc_opt_class();
    if (v37 != objc_opt_class())
      goto LABEL_41;
    v38 = -[objc_object isMergedWithParent](v35, "isMergedWithParent");
    -[objc_object setMergedWithParent:](v35, "setMergedWithParent:", 0);
    v39 = -[objc_object isAnythingOverridden](v35, "isAnythingOverridden");
    -[objc_object setMergedWithParent:](v35, "setMergedWithParent:", v38);
    if ((v39 & 1) != 0)
      goto LABEL_41;
    goto LABEL_40;
  }
  if (TCObjectEqual(v35, v36))
  {
LABEL_40:
    mShape3D = self->mShape3D;
    self->mShape3D = 0;

  }
LABEL_41:

LABEL_42:
  if (-[OADGraphicProperties hasStroke](self, "hasStroke"))
  {
    -[OADProperties parent](self, "parent");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADGraphicProperties stroke](self, "stroke");
    v42 = (objc_object *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "stroke");
    v43 = (objc_object *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[objc_object removeUnnecessaryOverrides](v42, "removeUnnecessaryOverrides");
      v44 = objc_opt_class();
      if (v44 != objc_opt_class())
        goto LABEL_49;
      v45 = -[objc_object isMergedWithParent](v42, "isMergedWithParent");
      -[objc_object setMergedWithParent:](v42, "setMergedWithParent:", 0);
      v46 = -[objc_object isAnythingOverridden](v42, "isAnythingOverridden");
      -[objc_object setMergedWithParent:](v42, "setMergedWithParent:", v45);
      if ((v46 & 1) != 0)
        goto LABEL_49;
    }
    else if (!TCObjectEqual(v42, v43))
    {
LABEL_49:

      goto LABEL_50;
    }
    mStroke = self->mStroke;
    self->mStroke = 0;

    goto LABEL_49;
  }
LABEL_50:
  if (-[OADGraphicProperties hasIsBehindText](self, "hasIsBehindText"))
  {
    -[OADProperties parent](self, "parent");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = -[OADGraphicProperties isBehindText](self, "isBehindText");
    if (v49 == objc_msgSend(v48, "isBehindText"))
    {
      -[OADGraphicProperties setIsBehindText:](self, "setIsBehindText:", 0);
      *((_BYTE *)self + 120) &= ~1u;
    }

  }
  -[OADProperties setMerged:](self, "setMerged:", v4);
  -[OADProperties setMergedWithParent:](self, "setMergedWithParent:", v5);
  v50.receiver = self;
  v50.super_class = (Class)OADGraphicProperties;
  -[OADDrawableProperties removeUnnecessaryOverrides](&v50, sel_removeUnnecessaryOverrides);
}

- (BOOL)hasFill
{
  return self->mFill || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
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

- (BOOL)hasEffects
{
  return self->mEffects || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
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

- (BOOL)hasScene3D
{
  return self->mScene3D || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (BOOL)hasShape3D
{
  return self->mShape3D || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (BOOL)hasStroke
{
  return self->mStroke || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (id)stroke
{
  id *v2;
  id v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasStroke);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[14];

  return v3;
}

- (BOOL)hasIsBehindText
{
  return (*((_BYTE *)self + 120) & 1) != 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (BOOL)isBehindText
{
  unsigned __int8 *v2;
  _BOOL4 v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasIsBehindText);
  v2 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
  v3 = (v2[120] >> 1) & 1;

  return v3;
}

- (BOOL)hasNonEmptyFill
{
  void *v3;
  char v4;

  if (-[OADGraphicProperties hasFill](self, "hasFill"))
  {
    -[OADGraphicProperties fill](self, "fill");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v4 = objc_opt_isKindOfClass() ^ 1;

  }
  else
  {
    v4 = 0;
  }
  return v4 & 1;
}

- (id)exts
{
  id *v2;
  id v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasExts);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[11];

  return v3;
}

- (void)setExts:(id)a3
{
  objc_storeStrong((id *)&self->mExts, a3);
}

- (BOOL)hasExts
{
  return self->mExts || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (id)scene3D
{
  id *v2;
  id v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasScene3D);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[12];

  return v3;
}

- (id)shape3D
{
  id *v2;
  id v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasShape3D);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[13];

  return v3;
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
  NSArray *mExts;
  id v28;
  void *v29;
  objc_object *v30;
  void *v31;
  objc_object *v32;
  int v33;
  OADScene3D *mScene3D;
  id v35;
  void *v36;
  objc_object *v37;
  void *v38;
  objc_object *v39;
  int v40;
  OADShape3D *mShape3D;
  OADStroke **p_mStroke;
  id v43;
  void *v44;
  id v45;
  void *v46;
  OADStroke *v47;
  char v48;
  uint64_t v49;
  OADStroke *v50;
  id v51;
  int v52;
  objc_super v53;

  v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)OADGraphicProperties;
  -[OADDrawableProperties fixPropertiesForChangingParentPreservingEffectiveValues:](&v53, sel_fixPropertiesForChangingParentPreservingEffectiveValues_, v4);
  p_mFill = &self->mFill;
  if (self->mFill
    || (-[OADProperties parent](self, "parent"), v6 = (id)objc_claimAutoreleasedReturnValue(),
                                                 v6,
                                                 v6 != v4))
  {
    -[OADGraphicProperties fill](self, "fill");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc_init((Class)objc_opt_class());

    -[OADGraphicProperties fill](self, "fill");
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
  if (-[OADGraphicProperties hasEffects](self, "hasEffects")
    || (-[OADProperties parent](self, "parent"),
        v14 = (id)objc_claimAutoreleasedReturnValue(),
        v14,
        v14 != v4))
  {
    -[OADProperties possiblyInexistentOverrideForSelector:](self, "possiblyInexistentOverrideForSelector:", sel_hasEffects);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[OADGraphicProperties effects](self, "effects");
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
      -[OADGraphicProperties setEffects:](self, "setEffects:", v16);
    }

  }
  if (-[OADGraphicProperties hasExts](self, "hasExts")
    || (-[OADProperties parent](self, "parent"),
        v21 = (id)objc_claimAutoreleasedReturnValue(),
        v21,
        v21 != v4))
  {
    -[OADProperties possiblyInexistentOverrideForSelector:](self, "possiblyInexistentOverrideForSelector:", sel_hasExts);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      -[OADGraphicProperties exts](self, "exts");
      v23 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
    }
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_hasExts);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v4, "exts");
      v25 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = 0;
    }
    v26 = TCObjectEqual(v23, v25);
    mExts = self->mExts;
    if (v26)
    {
      self->mExts = 0;

    }
    else if (!mExts && v22)
    {
      -[OADGraphicProperties setExts:](self, "setExts:", v23);
    }

  }
  if (-[OADGraphicProperties hasScene3D](self, "hasScene3D")
    || (-[OADProperties parent](self, "parent"),
        v28 = (id)objc_claimAutoreleasedReturnValue(),
        v28,
        v28 != v4))
  {
    -[OADProperties possiblyInexistentOverrideForSelector:](self, "possiblyInexistentOverrideForSelector:", sel_hasScene3D);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      -[OADGraphicProperties scene3D](self, "scene3D");
      v30 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = 0;
    }
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_hasScene3D);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      objc_msgSend(v4, "scene3D");
      v32 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = 0;
    }
    v33 = TCObjectEqual(v30, v32);
    mScene3D = self->mScene3D;
    if (v33)
    {
      self->mScene3D = 0;

    }
    else if (!mScene3D && v29)
    {
      -[OADGraphicProperties setScene3D:](self, "setScene3D:", v30);
    }

  }
  if (-[OADGraphicProperties hasShape3D](self, "hasShape3D")
    || (-[OADProperties parent](self, "parent"),
        v35 = (id)objc_claimAutoreleasedReturnValue(),
        v35,
        v35 != v4))
  {
    -[OADProperties possiblyInexistentOverrideForSelector:](self, "possiblyInexistentOverrideForSelector:", sel_hasShape3D);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      -[OADGraphicProperties shape3D](self, "shape3D");
      v37 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v37 = 0;
    }
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_hasShape3D);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      objc_msgSend(v4, "shape3D");
      v39 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v39 = 0;
    }
    v40 = TCObjectEqual(v37, v39);
    mShape3D = self->mShape3D;
    if (v40)
    {
      self->mShape3D = 0;

    }
    else if (!mShape3D && v36)
    {
      -[OADGraphicProperties setShape3D:](self, "setShape3D:", v37);
    }

  }
  p_mStroke = &self->mStroke;
  if (self->mStroke
    || (-[OADProperties parent](self, "parent"),
        v43 = (id)objc_claimAutoreleasedReturnValue(),
        v43,
        v43 != v4))
  {
    -[OADGraphicProperties stroke](self, "stroke");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_alloc_init((Class)objc_opt_class());

    -[OADGraphicProperties stroke](self, "stroke");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setParent:", v46);

    objc_storeStrong((id *)&self->mStroke, v45);
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_hasStroke);
    v47 = (OADStroke *)objc_claimAutoreleasedReturnValue();

    if (v47)
    {
      objc_msgSend(v4, "stroke");
      v47 = (OADStroke *)objc_claimAutoreleasedReturnValue();
    }
    if (*p_mStroke == v47)
    {
      v50 = v47;
    }
    else
    {
      objc_opt_class();
      v48 = objc_opt_isKindOfClass();
      if ((v48 & 1) == 0)
      {
        objc_msgSend((id)objc_opt_class(), "defaultProperties");
        v49 = objc_claimAutoreleasedReturnValue();

        v47 = (OADStroke *)v49;
      }
      -[OADProperties changeParentPreservingEffectiveValues:](*p_mStroke, "changeParentPreservingEffectiveValues:", v47);
      if ((v48 & 1) == 0 || -[OADStroke isAnythingOverridden](*p_mStroke, "isAnythingOverridden"))
        goto LABEL_82;
      v50 = *p_mStroke;
    }
    *p_mStroke = 0;

LABEL_82:
  }
  if ((*((_BYTE *)self + 120) & 1) != 0
    || (-[OADProperties parent](self, "parent"),
        v51 = (id)objc_claimAutoreleasedReturnValue(),
        v51,
        v51 != v4))
  {
    v52 = -[OADGraphicProperties isBehindText](self, "isBehindText");
    if (v52 == objc_msgSend(v4, "isBehindText"))
    {
      *((_BYTE *)self + 120) &= ~1u;
    }
    else if ((*((_BYTE *)self + 120) & 1) == 0)
    {
      -[OADGraphicProperties setIsBehindText:](self, "setIsBehindText:", -[OADGraphicProperties isBehindText](self, "isBehindText"));
    }
  }

}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unsigned int v8;
  void *v9;
  BOOL v10;
  uint64_t v11;
  unsigned int v12;
  void *v13;
  unint64_t v14;
  objc_super v16;

  v3 = -[OADFill hash](self->mFill, "hash");
  v4 = -[OADScene3D hash](self->mScene3D, "hash") ^ v3;
  v5 = -[OADShape3D hash](self->mShape3D, "hash");
  v6 = v4 ^ v5 ^ -[OADStroke hash](self->mStroke, "hash");
  if (-[NSArray count](self->mEffects, "count"))
  {
    v7 = 0;
    v8 = 1;
    do
    {
      -[NSArray objectAtIndex:](self->mEffects, "objectAtIndex:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 ^= objc_msgSend(v9, "hash");

      v7 = v8;
      v10 = -[NSArray count](self->mEffects, "count") > v8++;
    }
    while (v10);
  }
  if (-[NSArray count](self->mExts, "count"))
  {
    v11 = 0;
    v12 = 1;
    do
    {
      -[NSArray objectAtIndex:](self->mExts, "objectAtIndex:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v6 ^= objc_msgSend(v13, "hash");

      v11 = v12;
      v10 = -[NSArray count](self->mExts, "count") > v12++;
    }
    while (v10);
  }
  v14 = ((unint64_t)*((unsigned __int8 *)self + 120) >> 1) & 1;
  v16.receiver = self;
  v16.super_class = (Class)OADGraphicProperties;
  return v6 ^ -[OADDrawableProperties hash](&v16, sel_hash) ^ v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  int v7;
  void *v8;
  void *v9;
  char v10;
  int v11;
  void *v12;
  void *v13;
  char v14;
  int v15;
  void *v16;
  void *v17;
  char v18;
  int v19;
  void *v20;
  void *v21;
  char v22;
  int v23;
  void *v24;
  void *v25;
  char v26;
  int v27;
  BOOL v28;
  int v30;
  objc_super v31;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[OADGraphicProperties hash](self, "hash");
    if (v6 != objc_msgSend(v5, "hash"))
      goto LABEL_19;
    v7 = objc_msgSend(v5, "hasFill");
    if (v7 != -[OADGraphicProperties hasFill](self, "hasFill"))
      goto LABEL_19;
    if (objc_msgSend(v5, "hasFill"))
    {
      objc_msgSend(v5, "fill");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADGraphicProperties fill](self, "fill");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

      if ((v10 & 1) == 0)
        goto LABEL_19;
    }
    v11 = objc_msgSend(v5, "hasEffects");
    if (v11 != -[OADGraphicProperties hasEffects](self, "hasEffects"))
      goto LABEL_19;
    if (objc_msgSend(v5, "hasEffects"))
    {
      objc_msgSend(v5, "effects");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADGraphicProperties effects](self, "effects");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqualToArray:", v13);

      if ((v14 & 1) == 0)
        goto LABEL_19;
    }
    v15 = objc_msgSend(v5, "hasScene3D");
    if (v15 != -[OADGraphicProperties hasScene3D](self, "hasScene3D"))
      goto LABEL_19;
    if (objc_msgSend(v5, "hasScene3D"))
    {
      objc_msgSend(v5, "scene3D");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADGraphicProperties scene3D](self, "scene3D");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if ((v18 & 1) == 0)
        goto LABEL_19;
    }
    v19 = objc_msgSend(v5, "hasShape3D");
    if (v19 != -[OADGraphicProperties hasShape3D](self, "hasShape3D"))
      goto LABEL_19;
    if (objc_msgSend(v5, "hasShape3D"))
    {
      objc_msgSend(v5, "shape3D");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADGraphicProperties shape3D](self, "shape3D");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "isEqual:", v21);

      if ((v22 & 1) == 0)
        goto LABEL_19;
    }
    v23 = objc_msgSend(v5, "hasStroke");
    if (v23 != -[OADGraphicProperties hasStroke](self, "hasStroke"))
      goto LABEL_19;
    if (objc_msgSend(v5, "hasStroke"))
    {
      objc_msgSend(v5, "stroke");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADGraphicProperties stroke](self, "stroke");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v24, "isEqual:", v25);

      if ((v26 & 1) == 0)
        goto LABEL_19;
    }
    v27 = objc_msgSend(v5, "hasIsBehindText");
    if (v27 == -[OADGraphicProperties hasIsBehindText](self, "hasIsBehindText")
      && (!objc_msgSend(v5, "hasIsBehindText")
       || (v30 = objc_msgSend(v5, "isBehindText"), v30 == -[OADGraphicProperties isBehindText](self, "isBehindText"))))
    {
      v31.receiver = self;
      v31.super_class = (Class)OADGraphicProperties;
      v28 = -[OADDrawableProperties isEqual:](&v31, sel_isEqual_, v5);
    }
    else
    {
LABEL_19:
      v28 = 0;
    }

  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADGraphicProperties;
  -[OADDrawableProperties description](&v3, sel_description);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mStroke, 0);
  objc_storeStrong((id *)&self->mShape3D, 0);
  objc_storeStrong((id *)&self->mScene3D, 0);
  objc_storeStrong((id *)&self->mExts, 0);
  objc_storeStrong((id *)&self->mEffects, 0);
  objc_storeStrong((id *)&self->mFill, 0);
}

@end
