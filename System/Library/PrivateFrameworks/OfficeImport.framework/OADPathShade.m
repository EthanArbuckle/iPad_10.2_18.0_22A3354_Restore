@implementation OADPathShade

+ (id)defaultProperties
{
  if (+[OADPathShade defaultProperties]::once != -1)
    dispatch_once(&+[OADPathShade defaultProperties]::once, &__block_literal_global_96);
  return (id)+[OADPathShade defaultProperties]::defaultProperties;
}

- (OADPathShade)initWithDefaults
{
  OADPathShade *v2;
  OADPathShade *v3;
  OADRelativeRect *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  OADRelativeRect *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)OADPathShade;
  v2 = -[OADProperties initWithDefaults](&v11, sel_initWithDefaults);
  v3 = v2;
  if (v2)
  {
    -[OADPathShade setType:](v2, "setType:", 1);
    v4 = [OADRelativeRect alloc];
    LODWORD(v5) = 0;
    LODWORD(v6) = 0;
    LODWORD(v7) = 0;
    LODWORD(v8) = 0;
    v9 = -[OADRelativeRect initWithLeft:top:right:bottom:](v4, "initWithLeft:top:right:bottom:", v5, v6, v7, v8);
    -[OADPathShade setFillToRect:](v3, "setFillToRect:", v9);

  }
  return v3;
}

- (void)setType:(int)a3
{
  self->mType = a3;
  self->mIsTypeOverridden = 1;
}

- (void)setFillToRect:(id)a3
{
  OADRelativeRect *v4;
  void *v5;
  void *v6;
  OADRelativeRect *mFillToRect;

  v4 = (OADRelativeRect *)a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OADPathShade setFillToRect:]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeArt/Dom/OADFill.mm");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 558, 0, "invalid nil value for '%{public}s'", "fillToRect");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  mFillToRect = self->mFillToRect;
  self->mFillToRect = v4;

}

- (unint64_t)hash
{
  unint64_t result;

  result = (unint64_t)self->mFillToRect;
  if (result)
    result = objc_msgSend((id)result, "hash");
  if (self->mIsTypeOverridden)
    result ^= self->mType;
  return result;
}

- (id)fillToRect
{
  id *v2;
  id v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_isFillToRectOverridden);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[3];

  return v3;
}

- (BOOL)isFillToRectOverridden
{
  return self->mFillToRect || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unsigned __int8 *v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)OADPathShade;
  if (-[OADShade isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = (unsigned __int8 *)v4;
    if (TCObjectEqual((objc_object *)self->mFillToRect, *((objc_object **)v5 + 3))
      && self->mIsTypeOverridden == v5[36])
    {
      v6 = !self->mIsTypeOverridden || self->mType == *((_DWORD *)v5 + 8);
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

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  OADRelativeRect *mFillToRect;
  id v7;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  mFillToRect = self->mFillToRect;
  if (mFillToRect)
  {
    v7 = -[OADRelativeRect copyWithZone:](mFillToRect, "copyWithZone:", a3);
    objc_msgSend(v5, "setFillToRect:", v7);

  }
  if (self->mIsTypeOverridden)
    objc_msgSend(v5, "setType:", self->mType);
  return v5;
}

void __33__OADPathShade_defaultProperties__block_invoke()
{
  OADPathShade *v0;
  void *v1;

  v0 = -[OADPathShade initWithDefaults]([OADPathShade alloc], "initWithDefaults");
  v1 = (void *)+[OADPathShade defaultProperties]::defaultProperties;
  +[OADPathShade defaultProperties]::defaultProperties = (uint64_t)v0;

}

- (BOOL)isAnythingOverridden
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OADPathShade;
  return -[OADProperties isAnythingOverridden](&v4, sel_isAnythingOverridden)
      || -[OADPathShade isFillToRectOverridden](self, "isFillToRectOverridden")
      || -[OADPathShade isTypeOverridden](self, "isTypeOverridden");
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
  OADRelativeRect *mFillToRect;
  id v12;
  int v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)OADPathShade;
  -[OADProperties fixPropertiesForChangingParentPreservingEffectiveValues:](&v14, sel_fixPropertiesForChangingParentPreservingEffectiveValues_, v4);
  if (-[OADPathShade isFillToRectOverridden](self, "isFillToRectOverridden")
    || (-[OADProperties parent](self, "parent"), v5 = (id)objc_claimAutoreleasedReturnValue(),
                                                 v5,
                                                 v5 != v4))
  {
    -[OADProperties possiblyInexistentOverrideForSelector:](self, "possiblyInexistentOverrideForSelector:", sel_isFillToRectOverridden);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[OADPathShade fillToRect](self, "fillToRect");
      v7 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_isFillToRectOverridden);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "fillToRect");
      v9 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    v10 = TCObjectEqual(v7, v9);
    mFillToRect = self->mFillToRect;
    if (v10)
    {
      self->mFillToRect = 0;

    }
    else if (!mFillToRect && v6)
    {
      -[OADPathShade setFillToRect:](self, "setFillToRect:", v7);
    }

  }
  if (self->mIsTypeOverridden
    || (-[OADProperties parent](self, "parent"),
        v12 = (id)objc_claimAutoreleasedReturnValue(),
        v12,
        v12 != v4))
  {
    v13 = -[OADPathShade type](self, "type");
    if (v13 == objc_msgSend(v4, "type"))
    {
      self->mIsTypeOverridden = 0;
    }
    else if (!self->mIsTypeOverridden)
    {
      -[OADPathShade setType:](self, "setType:", -[OADPathShade type](self, "type"));
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
  OADRelativeRect *mFillToRect;
  void *v13;
  int v14;
  objc_super v15;

  -[OADProperties parent](self, "parent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return;
  v4 = -[OADProperties isMerged](self, "isMerged");
  v5 = -[OADProperties isMergedWithParent](self, "isMergedWithParent");
  -[OADProperties setMerged:](self, "setMerged:", 0);
  -[OADProperties setMergedWithParent:](self, "setMergedWithParent:", 0);
  if (-[OADPathShade isFillToRectOverridden](self, "isFillToRectOverridden"))
  {
    -[OADProperties parent](self, "parent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADPathShade fillToRect](self, "fillToRect");
    v7 = (objc_object *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fillToRect");
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
    mFillToRect = self->mFillToRect;
    self->mFillToRect = 0;

    goto LABEL_9;
  }
LABEL_10:
  if (-[OADPathShade isTypeOverridden](self, "isTypeOverridden"))
  {
    -[OADProperties parent](self, "parent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[OADPathShade type](self, "type");
    if (v14 == objc_msgSend(v13, "type"))
    {
      -[OADPathShade setType:](self, "setType:", 1);
      self->mIsTypeOverridden = 0;
    }

  }
  -[OADProperties setMerged:](self, "setMerged:", v4);
  -[OADProperties setMergedWithParent:](self, "setMergedWithParent:", v5);
  v15.receiver = self;
  v15.super_class = (Class)OADPathShade;
  -[OADProperties removeUnnecessaryOverrides](&v15, sel_removeUnnecessaryOverrides);
}

- (int)type
{
  _DWORD *v2;
  int v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_isTypeOverridden);
  v2 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  v3 = v2[8];

  return v3;
}

- (BOOL)isTypeOverridden
{
  return self->mIsTypeOverridden
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFillToRect, 0);
}

@end
