@implementation OADStretchTechnique

+ (id)defaultProperties
{
  if (+[OADStretchTechnique defaultProperties]::once != -1)
    dispatch_once(&+[OADStretchTechnique defaultProperties]::once, &__block_literal_global_180);
  return (id)+[OADStretchTechnique defaultProperties]::defaultProperties;
}

- (OADStretchTechnique)initWithDefaults
{
  OADStretchTechnique *v2;
  OADRelativeRect *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  OADRelativeRect *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)OADStretchTechnique;
  v2 = -[OADProperties initWithDefaults](&v10, sel_initWithDefaults);
  if (v2)
  {
    v3 = [OADRelativeRect alloc];
    LODWORD(v4) = 0;
    LODWORD(v5) = 0;
    LODWORD(v6) = 0;
    LODWORD(v7) = 0;
    v8 = -[OADRelativeRect initWithLeft:top:right:bottom:](v3, "initWithLeft:top:right:bottom:", v4, v5, v6, v7);
    -[OADStretchTechnique setFillRect:](v2, "setFillRect:", v8);

  }
  return v2;
}

- (void)setFillRect:(id)a3
{
  OADRelativeRect *v5;
  OADRelativeRect *v6;

  v5 = (OADRelativeRect *)a3;
  if (self->mFillRect != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mFillRect, a3);
    v5 = v6;
  }

}

- (unint64_t)hash
{
  unint64_t result;

  result = (unint64_t)self->mFillRect;
  if (result)
    return objc_msgSend((id)result, "hash");
  return result;
}

- (BOOL)isEqual:(id)a3
{
  objc_object **v4;
  char v5;
  objc_super v7;

  v4 = (objc_object **)a3;
  v7.receiver = self;
  v7.super_class = (Class)OADStretchTechnique;
  if (-[OADImageFillTechnique isEqual:](&v7, sel_isEqual_, v4))
    v5 = TCObjectEqual((objc_object *)self->mFillRect, v4[3]);
  else
    v5 = 0;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  OADRelativeRect *mFillRect;
  id v7;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  mFillRect = self->mFillRect;
  if (mFillRect)
  {
    v7 = -[OADRelativeRect copyWithZone:](mFillRect, "copyWithZone:", a3);
    objc_msgSend(v5, "setFillRect:", v7);

  }
  return v5;
}

void __40__OADStretchTechnique_defaultProperties__block_invoke()
{
  OADStretchTechnique *v0;
  void *v1;

  v0 = -[OADStretchTechnique initWithDefaults]([OADStretchTechnique alloc], "initWithDefaults");
  v1 = (void *)+[OADStretchTechnique defaultProperties]::defaultProperties;
  +[OADStretchTechnique defaultProperties]::defaultProperties = (uint64_t)v0;

}

- (BOOL)isAnythingOverridden
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OADStretchTechnique;
  return -[OADProperties isAnythingOverridden](&v4, sel_isAnythingOverridden)
      || -[OADStretchTechnique isFillRectOverridden](self, "isFillRectOverridden");
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
  OADRelativeRect *mFillRect;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)OADStretchTechnique;
  -[OADProperties fixPropertiesForChangingParentPreservingEffectiveValues:](&v12, sel_fixPropertiesForChangingParentPreservingEffectiveValues_, v4);
  if (-[OADStretchTechnique isFillRectOverridden](self, "isFillRectOverridden")
    || (-[OADProperties parent](self, "parent"), v5 = (id)objc_claimAutoreleasedReturnValue(),
                                                 v5,
                                                 v5 != v4))
  {
    -[OADProperties possiblyInexistentOverrideForSelector:](self, "possiblyInexistentOverrideForSelector:", sel_isFillRectOverridden);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[OADStretchTechnique fillRect](self, "fillRect");
      v7 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_isFillRectOverridden);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "fillRect");
      v9 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    v10 = TCObjectEqual(v7, v9);
    mFillRect = self->mFillRect;
    if (v10)
    {
      self->mFillRect = 0;

    }
    else if (!mFillRect && v6)
    {
      -[OADStretchTechnique setFillRect:](self, "setFillRect:", v7);
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
  OADRelativeRect *mFillRect;
  objc_super v13;

  -[OADProperties parent](self, "parent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = -[OADProperties isMerged](self, "isMerged");
    v5 = -[OADProperties isMergedWithParent](self, "isMergedWithParent");
    -[OADProperties setMerged:](self, "setMerged:", 0);
    -[OADProperties setMergedWithParent:](self, "setMergedWithParent:", 0);
    if (!-[OADStretchTechnique isFillRectOverridden](self, "isFillRectOverridden"))
    {
LABEL_10:
      -[OADProperties setMerged:](self, "setMerged:", v4);
      -[OADProperties setMergedWithParent:](self, "setMergedWithParent:", v5);
      v13.receiver = self;
      v13.super_class = (Class)OADStretchTechnique;
      -[OADProperties removeUnnecessaryOverrides](&v13, sel_removeUnnecessaryOverrides);
      return;
    }
    -[OADProperties parent](self, "parent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADStretchTechnique fillRect](self, "fillRect");
    v7 = (objc_object *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fillRect");
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
    mFillRect = self->mFillRect;
    self->mFillRect = 0;

    goto LABEL_9;
  }
}

- (id)fillRect
{
  id *v2;
  id v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_isFillRectOverridden);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[3];

  return v3;
}

- (BOOL)isFillRectOverridden
{
  return self->mFillRect || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFillRect, 0);
}

@end
