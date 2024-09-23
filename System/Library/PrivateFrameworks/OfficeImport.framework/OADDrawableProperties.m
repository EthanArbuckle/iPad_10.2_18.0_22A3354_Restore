@implementation OADDrawableProperties

- (OADDrawableProperties)initWithDefaults
{
  OADDrawableProperties *v2;
  OADOrientedBounds *v3;
  OADOrientedBounds *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OADDrawableProperties;
  v2 = -[OADProperties initWithDefaults](&v6, sel_initWithDefaults);
  if (v2)
  {
    v3 = [OADOrientedBounds alloc];
    v4 = -[OADOrientedBounds initWithBounds:](v3, "initWithBounds:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    -[OADDrawableProperties setOrientedBounds:](v2, "setOrientedBounds:", v4);
    -[OADDrawableProperties setAspectRatioLocked:](v2, "setAspectRatioLocked:", 0);
    -[OADDrawableProperties setWrdInline:](v2, "setWrdInline:", 0);

  }
  return v2;
}

- (void)setOrientedBounds:(id)a3
{
  objc_storeStrong((id *)&self->mOrientedBounds, a3);
}

- (BOOL)hasOrientedBounds
{
  return self->mOrientedBounds
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (id)orientedBounds
{
  id *v2;
  id v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasOrientedBounds);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[3];

  return v3;
}

- (void)removeUnnecessaryOverrides
{
  void *v3;
  _BOOL8 v4;
  _BOOL8 v5;
  void *v6;
  int v7;
  void *v8;
  objc_object *v9;
  objc_object *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  OADOrientedBounds *mOrientedBounds;
  void *v15;
  objc_object *v16;
  objc_object *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  OADHyperlink *mClickHyperlink;
  void *v22;
  objc_object *v23;
  objc_object *v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  OADHyperlink *mHoverHyperlink;
  void *v29;
  int v30;
  objc_super v31;

  -[OADProperties parent](self, "parent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return;
  v4 = -[OADProperties isMerged](self, "isMerged");
  v5 = -[OADProperties isMergedWithParent](self, "isMergedWithParent");
  -[OADProperties setMerged:](self, "setMerged:", 0);
  -[OADProperties setMergedWithParent:](self, "setMergedWithParent:", 0);
  if (-[OADDrawableProperties hasAspectRatioLocked](self, "hasAspectRatioLocked"))
  {
    -[OADProperties parent](self, "parent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[OADDrawableProperties isAspectRatioLocked](self, "isAspectRatioLocked");
    if (v7 == objc_msgSend(v6, "isAspectRatioLocked"))
    {
      -[OADDrawableProperties setAspectRatioLocked:](self, "setAspectRatioLocked:", 0);
      *((_BYTE *)self + 64) &= ~1u;
    }

  }
  if (-[OADDrawableProperties hasOrientedBounds](self, "hasOrientedBounds"))
  {
    -[OADProperties parent](self, "parent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADDrawableProperties orientedBounds](self, "orientedBounds");
    v9 = (objc_object *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "orientedBounds");
    v10 = (objc_object *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[objc_object removeUnnecessaryOverrides](v9, "removeUnnecessaryOverrides");
      v11 = objc_opt_class();
      if (v11 != objc_opt_class())
        goto LABEL_13;
      v12 = -[objc_object isMergedWithParent](v9, "isMergedWithParent");
      -[objc_object setMergedWithParent:](v9, "setMergedWithParent:", 0);
      v13 = -[objc_object isAnythingOverridden](v9, "isAnythingOverridden");
      -[objc_object setMergedWithParent:](v9, "setMergedWithParent:", v12);
      if ((v13 & 1) != 0)
        goto LABEL_13;
    }
    else if (!TCObjectEqual(v9, v10))
    {
LABEL_13:

      goto LABEL_14;
    }
    mOrientedBounds = self->mOrientedBounds;
    self->mOrientedBounds = 0;

    goto LABEL_13;
  }
LABEL_14:
  if (!-[OADDrawableProperties hasClickHyperlink](self, "hasClickHyperlink"))
    goto LABEL_22;
  -[OADProperties parent](self, "parent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADDrawableProperties clickHyperlink](self, "clickHyperlink");
  v16 = (objc_object *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "clickHyperlink");
  v17 = (objc_object *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[objc_object removeUnnecessaryOverrides](v16, "removeUnnecessaryOverrides");
    v18 = objc_opt_class();
    if (v18 != objc_opt_class())
      goto LABEL_21;
    v19 = -[objc_object isMergedWithParent](v16, "isMergedWithParent");
    -[objc_object setMergedWithParent:](v16, "setMergedWithParent:", 0);
    v20 = -[objc_object isAnythingOverridden](v16, "isAnythingOverridden");
    -[objc_object setMergedWithParent:](v16, "setMergedWithParent:", v19);
    if ((v20 & 1) != 0)
      goto LABEL_21;
    goto LABEL_20;
  }
  if (TCObjectEqual(v16, v17))
  {
LABEL_20:
    mClickHyperlink = self->mClickHyperlink;
    self->mClickHyperlink = 0;

  }
LABEL_21:

LABEL_22:
  if (-[OADDrawableProperties hasHoverHyperlink](self, "hasHoverHyperlink"))
  {
    -[OADProperties parent](self, "parent");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADDrawableProperties hoverHyperlink](self, "hoverHyperlink");
    v23 = (objc_object *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "hoverHyperlink");
    v24 = (objc_object *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[objc_object removeUnnecessaryOverrides](v23, "removeUnnecessaryOverrides");
      v25 = objc_opt_class();
      if (v25 != objc_opt_class())
        goto LABEL_29;
      v26 = -[objc_object isMergedWithParent](v23, "isMergedWithParent");
      -[objc_object setMergedWithParent:](v23, "setMergedWithParent:", 0);
      v27 = -[objc_object isAnythingOverridden](v23, "isAnythingOverridden");
      -[objc_object setMergedWithParent:](v23, "setMergedWithParent:", v26);
      if ((v27 & 1) != 0)
        goto LABEL_29;
    }
    else if (!TCObjectEqual(v23, v24))
    {
LABEL_29:

      goto LABEL_30;
    }
    mHoverHyperlink = self->mHoverHyperlink;
    self->mHoverHyperlink = 0;

    goto LABEL_29;
  }
LABEL_30:
  if (-[OADDrawableProperties hasWrdInline](self, "hasWrdInline"))
  {
    -[OADProperties parent](self, "parent");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[OADDrawableProperties isWrdInline](self, "isWrdInline");
    if (v30 == objc_msgSend(v29, "isWrdInline"))
    {
      -[OADDrawableProperties setWrdInline:](self, "setWrdInline:", 0);
      *((_BYTE *)self + 64) &= ~4u;
    }

  }
  -[OADProperties setMerged:](self, "setMerged:", v4);
  -[OADProperties setMergedWithParent:](self, "setMergedWithParent:", v5);
  v31.receiver = self;
  v31.super_class = (Class)OADDrawableProperties;
  -[OADProperties removeUnnecessaryOverrides](&v31, sel_removeUnnecessaryOverrides);
}

- (BOOL)hasAspectRatioLocked
{
  return *((_BYTE *)self + 64) & 1;
}

- (BOOL)hasClickHyperlink
{
  return self->mClickHyperlink
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (BOOL)hasHoverHyperlink
{
  return self->mHoverHyperlink
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (BOOL)hasWrdInline
{
  return (*((unsigned __int8 *)self + 64) >> 2) & 1;
}

- (void)setAspectRatioLocked:(BOOL)a3
{
  char v3;

  *((_BYTE *)self + 64) |= 1u;
  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 64) = *((_BYTE *)self + 64) & 0xFD | v3;
}

- (void)setClickHyperlink:(id)a3
{
  objc_storeStrong((id *)&self->mClickHyperlink, a3);
}

- (void)setHoverHyperlink:(id)a3
{
  objc_storeStrong((id *)&self->mHoverHyperlink, a3);
}

- (id)clickHyperlink
{
  return self->mClickHyperlink;
}

- (void)setWrdInline:(BOOL)a3
{
  char v3;

  *((_BYTE *)self + 64) |= 4u;
  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)self + 64) = *((_BYTE *)self + 64) & 0xF7 | v3;
}

- (BOOL)isAspectRatioLocked
{
  return (*((unsigned __int8 *)self + 64) >> 1) & 1;
}

- (id)orientedBoundsForCharts
{
  uint64_t v2;
  void *v3;
  id v4;

  -[OADProperties possiblyInexistentOverrideForSelector:](self, "possiblyInexistentOverrideForSelector:", sel_hasOrientedBounds);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
    v4 = *(id *)(v2 + 24);
  else
    v4 = 0;

  return v4;
}

- (id)hoverHyperlink
{
  return self->mHoverHyperlink;
}

- (BOOL)isWrdInline
{
  return (*((unsigned __int8 *)self + 64) >> 3) & 1;
}

- (id)altTitle
{
  return self->mTitle;
}

- (void)setAltTitle:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->mTitle != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mTitle, a3);
    v5 = v6;
  }

}

- (BOOL)hasAltTitle
{
  return self->mTitle || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (id)altDescription
{
  return self->mDescription;
}

- (void)setAltDescription:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->mDescription != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mDescription, a3);
    v5 = v6;
  }

}

- (BOOL)hasAltDescription
{
  return self->mDescription || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
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
  OADOrientedBounds *mOrientedBounds;
  id v12;
  void *v13;
  objc_object *v14;
  void *v15;
  objc_object *v16;
  int v17;
  OADHyperlink *mClickHyperlink;
  id v19;
  void *v20;
  objc_object *v21;
  void *v22;
  objc_object *v23;
  int v24;
  OADHyperlink *mHoverHyperlink;
  id v26;
  void *v27;
  objc_object *v28;
  void *v29;
  objc_object *v30;
  int v31;
  NSString *mTitle;
  id v33;
  int v34;
  id v35;
  int v36;
  objc_super v37;

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)OADDrawableProperties;
  -[OADProperties fixPropertiesForChangingParentPreservingEffectiveValues:](&v37, sel_fixPropertiesForChangingParentPreservingEffectiveValues_, v4);
  if (-[OADDrawableProperties hasOrientedBounds](self, "hasOrientedBounds")
    || (-[OADProperties parent](self, "parent"), v5 = (id)objc_claimAutoreleasedReturnValue(),
                                                 v5,
                                                 v5 != v4))
  {
    -[OADProperties possiblyInexistentOverrideForSelector:](self, "possiblyInexistentOverrideForSelector:", sel_hasOrientedBounds);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[OADDrawableProperties orientedBounds](self, "orientedBounds");
      v7 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_hasOrientedBounds);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "orientedBounds");
      v9 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    v10 = TCObjectEqual(v7, v9);
    mOrientedBounds = self->mOrientedBounds;
    if (v10)
    {
      self->mOrientedBounds = 0;

    }
    else if (!mOrientedBounds && v6)
    {
      -[OADDrawableProperties setOrientedBounds:](self, "setOrientedBounds:", v7);
    }

  }
  if (-[OADDrawableProperties hasClickHyperlink](self, "hasClickHyperlink")
    || (-[OADProperties parent](self, "parent"),
        v12 = (id)objc_claimAutoreleasedReturnValue(),
        v12,
        v12 != v4))
  {
    -[OADProperties possiblyInexistentOverrideForSelector:](self, "possiblyInexistentOverrideForSelector:", sel_hasClickHyperlink);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[OADDrawableProperties clickHyperlink](self, "clickHyperlink");
      v14 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_hasClickHyperlink);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v4, "clickHyperlink");
      v16 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
    v17 = TCObjectEqual(v14, v16);
    mClickHyperlink = self->mClickHyperlink;
    if (v17)
    {
      self->mClickHyperlink = 0;

    }
    else if (!mClickHyperlink && v13)
    {
      -[OADDrawableProperties setClickHyperlink:](self, "setClickHyperlink:", v14);
    }

  }
  if (-[OADDrawableProperties hasHoverHyperlink](self, "hasHoverHyperlink")
    || (-[OADProperties parent](self, "parent"),
        v19 = (id)objc_claimAutoreleasedReturnValue(),
        v19,
        v19 != v4))
  {
    -[OADProperties possiblyInexistentOverrideForSelector:](self, "possiblyInexistentOverrideForSelector:", sel_hasHoverHyperlink);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      -[OADDrawableProperties hoverHyperlink](self, "hoverHyperlink");
      v21 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = 0;
    }
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_hasHoverHyperlink);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v4, "hoverHyperlink");
      v23 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
    }
    v24 = TCObjectEqual(v21, v23);
    mHoverHyperlink = self->mHoverHyperlink;
    if (v24)
    {
      self->mHoverHyperlink = 0;

    }
    else if (!mHoverHyperlink && v20)
    {
      -[OADDrawableProperties setHoverHyperlink:](self, "setHoverHyperlink:", v21);
    }

  }
  if (-[OADDrawableProperties hasAltTitle](self, "hasAltTitle")
    || (-[OADProperties parent](self, "parent"),
        v26 = (id)objc_claimAutoreleasedReturnValue(),
        v26,
        v26 != v4))
  {
    -[OADProperties possiblyInexistentOverrideForSelector:](self, "possiblyInexistentOverrideForSelector:", sel_hasAltTitle);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      -[OADDrawableProperties altTitle](self, "altTitle");
      v28 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = 0;
    }
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_hasAltTitle);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend(v4, "altTitle");
      v30 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = 0;
    }
    v31 = TCObjectEqual(v28, v30);
    mTitle = self->mTitle;
    if (v31)
    {
      self->mTitle = 0;

    }
    else if (!mTitle && v27)
    {
      -[OADDrawableProperties setAltTitle:](self, "setAltTitle:", v28);
    }

  }
  if ((*((_BYTE *)self + 64) & 2) != 0
    || (-[OADProperties parent](self, "parent"),
        v33 = (id)objc_claimAutoreleasedReturnValue(),
        v33,
        v33 != v4))
  {
    v34 = -[OADDrawableProperties isAspectRatioLocked](self, "isAspectRatioLocked");
    if (v34 == objc_msgSend(v4, "isAspectRatioLocked"))
    {
      *((_BYTE *)self + 64) &= ~2u;
    }
    else if ((*((_BYTE *)self + 64) & 2) == 0)
    {
      -[OADDrawableProperties setAspectRatioLocked:](self, "setAspectRatioLocked:", -[OADDrawableProperties isAspectRatioLocked](self, "isAspectRatioLocked"));
    }
  }
  if ((*((_BYTE *)self + 64) & 4) != 0
    || (-[OADProperties parent](self, "parent"),
        v35 = (id)objc_claimAutoreleasedReturnValue(),
        v35,
        v35 != v4))
  {
    v36 = -[OADDrawableProperties isWrdInline](self, "isWrdInline");
    if (v36 == objc_msgSend(v4, "isWrdInline"))
    {
      *((_BYTE *)self + 64) &= ~4u;
    }
    else if ((*((_BYTE *)self + 64) & 4) == 0)
    {
      -[OADDrawableProperties setWrdInline:](self, "setWrdInline:", -[OADDrawableProperties isWrdInline](self, "isWrdInline"));
    }
  }

}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  objc_super v9;

  v3 = -[OADOrientedBounds hash](self->mOrientedBounds, "hash");
  v4 = -[OADHyperlink hash](self->mClickHyperlink, "hash");
  v5 = -[OADHyperlink hash](self->mHoverHyperlink, "hash");
  v6 = ((unint64_t)*((unsigned __int8 *)self + 64) >> 1) & 1;
  v7 = ((unint64_t)*((unsigned __int8 *)self + 64) >> 3) & 1;
  v9.receiver = self;
  v9.super_class = (Class)OADDrawableProperties;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[OADProperties hash](&v9, sel_hash);
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
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  int v25;
  int v26;
  int v27;
  BOOL v28;
  int v30;
  objc_super v31;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[OADDrawableProperties hash](self, "hash");
    if (v6 != objc_msgSend(v5, "hash"))
      goto LABEL_16;
    v7 = objc_msgSend(v5, "hasOrientedBounds");
    if (v7 != -[OADDrawableProperties hasOrientedBounds](self, "hasOrientedBounds"))
      goto LABEL_16;
    if (objc_msgSend(v5, "hasOrientedBounds"))
    {
      objc_msgSend(v5, "orientedBounds");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADDrawableProperties orientedBounds](self, "orientedBounds");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

      if ((v10 & 1) == 0)
        goto LABEL_16;
    }
    objc_msgSend(v5, "clickHyperlink");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADDrawableProperties clickHyperlink](self, "clickHyperlink");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (v11 == 0) ^ (v12 != 0);

    if ((v13 & 1) == 0)
      goto LABEL_16;
    objc_msgSend(v5, "clickHyperlink");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v5, "clickHyperlink");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADDrawableProperties clickHyperlink](self, "clickHyperlink");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "isEqual:", v16);

      if ((v17 & 1) == 0)
        goto LABEL_16;
    }
    objc_msgSend(v5, "hoverHyperlink");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADDrawableProperties hoverHyperlink](self, "hoverHyperlink");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (v18 == 0) ^ (v19 != 0);

    if ((v20 & 1) == 0)
      goto LABEL_16;
    objc_msgSend(v5, "hoverHyperlink");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend(v5, "hoverHyperlink");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADDrawableProperties hoverHyperlink](self, "hoverHyperlink");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if ((v24 & 1) == 0)
        goto LABEL_16;
    }
    if ((v25 = objc_msgSend(v5, "hasAspectRatioLocked"),
          v25 == -[OADDrawableProperties hasAspectRatioLocked](self, "hasAspectRatioLocked"))
      && (!objc_msgSend(v5, "hasAspectRatioLocked")
       || (v26 = objc_msgSend(v5, "isAspectRatioLocked"),
           v26 == -[OADDrawableProperties isAspectRatioLocked](self, "isAspectRatioLocked")))
      && (v27 = objc_msgSend(v5, "hasWrdInline"), v27 == -[OADDrawableProperties hasWrdInline](self, "hasWrdInline"))
      && (!objc_msgSend(v5, "hasWrdInline")
       || (v30 = objc_msgSend(v5, "isWrdInline"), v30 == -[OADDrawableProperties isWrdInline](self, "isWrdInline"))))
    {
      v31.receiver = self;
      v31.super_class = (Class)OADDrawableProperties;
      v28 = -[OADProperties isEqual:](&v31, sel_isEqual_, v5);
    }
    else
    {
LABEL_16:
      v28 = 0;
    }

  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADDrawableProperties;
  -[OADProperties description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mDescription, 0);
  objc_storeStrong((id *)&self->mTitle, 0);
  objc_storeStrong((id *)&self->mHoverHyperlink, 0);
  objc_storeStrong((id *)&self->mClickHyperlink, 0);
  objc_storeStrong((id *)&self->mOrientedBounds, 0);
}

@end
