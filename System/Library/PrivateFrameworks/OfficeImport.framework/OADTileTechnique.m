@implementation OADTileTechnique

+ (id)defaultProperties
{
  if (+[OADTileTechnique defaultProperties]::once != -1)
    dispatch_once(&+[OADTileTechnique defaultProperties]::once, &__block_literal_global_190);
  return (id)+[OADTileTechnique defaultProperties]::defaultProperties;
}

- (OADTileTechnique)initWithDefaults
{
  OADTileTechnique *v2;
  double v3;
  OADTileTechnique *v4;
  double v5;
  double v6;
  double v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)OADTileTechnique;
  v2 = -[OADProperties initWithDefaults](&v9, sel_initWithDefaults);
  v4 = v2;
  if (v2)
  {
    LODWORD(v3) = 0;
    -[OADTileTechnique setOffsetX:](v2, "setOffsetX:", v3);
    LODWORD(v5) = 0;
    -[OADTileTechnique setOffsetY:](v4, "setOffsetY:", v5);
    LODWORD(v6) = 1.0;
    -[OADTileTechnique setScaleX:](v4, "setScaleX:", v6);
    LODWORD(v7) = 1.0;
    -[OADTileTechnique setScaleY:](v4, "setScaleY:", v7);
    -[OADTileTechnique setFlipMode:](v4, "setFlipMode:", 0);
    -[OADTileTechnique setAlignment:](v4, "setAlignment:", 1);
  }
  return v4;
}

- (void)setOffsetX:(float)a3
{
  *((float *)&self->super.super + 5) = a3;
  LOBYTE(self->mOffsetX) = 1;
}

- (void)setOffsetY:(float)a3
{
  *(float *)&self->mIsOffsetXOverridden = a3;
  LOBYTE(self->mOffsetY) = 1;
}

- (void)setScaleX:(float)a3
{
  *(float *)&self->mIsOffsetYOverridden = a3;
  LOBYTE(self->mScaleX) = 1;
}

- (void)setScaleY:(float)a3
{
  *(float *)&self->mIsScaleXOverridden = a3;
  LOBYTE(self->mScaleY) = 1;
}

- (void)setFlipMode:(int)a3
{
  *(_DWORD *)&self->mIsScaleYOverridden = a3;
  LOBYTE(self->mFlipMode) = 1;
}

- (void)setAlignment:(int)a3
{
  *(_DWORD *)&self->mIsFlipModeOverridden = a3;
  LOBYTE(self->mAlignment) = 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  double v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v4;
  if (LOBYTE(self->mOffsetX))
  {
    LODWORD(v5) = *((_DWORD *)&self->super.super + 5);
    objc_msgSend(v4, "setOffsetX:", v5);
  }
  if (LOBYTE(self->mOffsetY))
  {
    LODWORD(v5) = *(_DWORD *)&self->mIsOffsetXOverridden;
    objc_msgSend(v6, "setOffsetY:", v5);
  }
  if (LOBYTE(self->mScaleX))
  {
    LODWORD(v5) = *(_DWORD *)&self->mIsOffsetYOverridden;
    objc_msgSend(v6, "setScaleX:", v5);
  }
  if (LOBYTE(self->mScaleY))
  {
    LODWORD(v5) = *(_DWORD *)&self->mIsScaleXOverridden;
    objc_msgSend(v6, "setScaleY:", v5);
  }
  if (LOBYTE(self->mFlipMode))
    objc_msgSend(v6, "setFlipMode:", *(unsigned int *)&self->mIsScaleYOverridden);
  if (LOBYTE(self->mAlignment))
    objc_msgSend(v6, "setAlignment:", *(unsigned int *)&self->mIsFlipModeOverridden);
  return v6;
}

- (unint64_t)hash
{
  unint64_t v2;
  objc_super v4;

  if (LOBYTE(self->mOffsetX))
    v2 = (unint64_t)*((float *)&self->super.super + 5);
  else
    v2 = 0;
  if (LOBYTE(self->mOffsetY))
    v2 ^= (unint64_t)*(float *)&self->mIsOffsetXOverridden;
  if (LOBYTE(self->mScaleX))
    v2 ^= (unint64_t)*(float *)&self->mIsOffsetYOverridden;
  if (LOBYTE(self->mScaleY))
    v2 ^= (unint64_t)*(float *)&self->mIsScaleXOverridden;
  if (LOBYTE(self->mFlipMode))
    v2 ^= *(unsigned int *)&self->mIsScaleYOverridden;
  if (LOBYTE(self->mAlignment))
    v2 ^= *(unsigned int *)&self->mIsFlipModeOverridden;
  v4.receiver = self;
  v4.super_class = (Class)OADTileTechnique;
  return -[OADImageFillTechnique hash](&v4, sel_hash) ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  float *v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)OADTileTechnique;
  if (-[OADImageFillTechnique isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = (float *)v4;
    if (LOBYTE(self->mOffsetX) == *((unsigned __int8 *)v5 + 24)
      && (!LOBYTE(self->mOffsetX) || *((float *)&self->super.super + 5) == v5[5])
      && LOBYTE(self->mOffsetY) == *((unsigned __int8 *)v5 + 32)
      && (!LOBYTE(self->mOffsetY) || *(float *)&self->mIsOffsetXOverridden == v5[7])
      && LOBYTE(self->mScaleX) == *((unsigned __int8 *)v5 + 40)
      && (!LOBYTE(self->mScaleX) || *(float *)&self->mIsOffsetYOverridden == v5[9])
      && LOBYTE(self->mScaleY) == *((unsigned __int8 *)v5 + 48)
      && (!LOBYTE(self->mScaleY) || *(float *)&self->mIsScaleXOverridden == v5[11])
      && LOBYTE(self->mFlipMode) == *((unsigned __int8 *)v5 + 56)
      && (!LOBYTE(self->mFlipMode) || *(_DWORD *)&self->mIsScaleYOverridden == *((_DWORD *)v5 + 13))
      && LOBYTE(self->mAlignment) == *((unsigned __int8 *)v5 + 64))
    {
      if (LOBYTE(self->mAlignment))
        v6 = *(_DWORD *)&self->mIsFlipModeOverridden == *((_DWORD *)v5 + 15);
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

void __37__OADTileTechnique_defaultProperties__block_invoke()
{
  OADTileTechnique *v0;
  void *v1;

  v0 = -[OADTileTechnique initWithDefaults]([OADTileTechnique alloc], "initWithDefaults");
  v1 = (void *)+[OADTileTechnique defaultProperties]::defaultProperties;
  +[OADTileTechnique defaultProperties]::defaultProperties = (uint64_t)v0;

}

- (BOOL)isAnythingOverridden
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OADTileTechnique;
  return -[OADProperties isAnythingOverridden](&v4, sel_isAnythingOverridden)
      || -[OADTileTechnique isOffsetXOverridden](self, "isOffsetXOverridden")
      || -[OADTileTechnique isOffsetYOverridden](self, "isOffsetYOverridden")
      || -[OADTileTechnique isScaleXOverridden](self, "isScaleXOverridden")
      || -[OADTileTechnique isScaleYOverridden](self, "isScaleYOverridden")
      || -[OADTileTechnique isFlipModeOverridden](self, "isFlipModeOverridden")
      || -[OADTileTechnique isAlignmentOverridden](self, "isAlignmentOverridden");
}

- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3
{
  id v4;
  id v5;
  float v6;
  float v7;
  float v8;
  id v9;
  float v10;
  float v11;
  float v12;
  id v13;
  float v14;
  float v15;
  float v16;
  id v17;
  float v18;
  float v19;
  float v20;
  id v21;
  int v22;
  id v23;
  int v24;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)OADTileTechnique;
  -[OADProperties fixPropertiesForChangingParentPreservingEffectiveValues:](&v25, sel_fixPropertiesForChangingParentPreservingEffectiveValues_, v4);
  if (LOBYTE(self->mOffsetX)
    || (-[OADProperties parent](self, "parent"), v5 = (id)objc_claimAutoreleasedReturnValue(),
                                                 v5,
                                                 v5 != v4))
  {
    -[OADTileTechnique offsetX](self, "offsetX");
    v7 = v6;
    objc_msgSend(v4, "offsetX");
    if (v7 == v8)
    {
      LOBYTE(self->mOffsetX) = 0;
    }
    else if (!LOBYTE(self->mOffsetX))
    {
      -[OADTileTechnique offsetX](self, "offsetX");
      -[OADTileTechnique setOffsetX:](self, "setOffsetX:");
    }
  }
  if (LOBYTE(self->mOffsetY)
    || (-[OADProperties parent](self, "parent"), v9 = (id)objc_claimAutoreleasedReturnValue(),
                                                 v9,
                                                 v9 != v4))
  {
    -[OADTileTechnique offsetY](self, "offsetY");
    v11 = v10;
    objc_msgSend(v4, "offsetY");
    if (v11 == v12)
    {
      LOBYTE(self->mOffsetY) = 0;
    }
    else if (!LOBYTE(self->mOffsetY))
    {
      -[OADTileTechnique offsetY](self, "offsetY");
      -[OADTileTechnique setOffsetY:](self, "setOffsetY:");
    }
  }
  if (LOBYTE(self->mScaleX)
    || (-[OADProperties parent](self, "parent"),
        v13 = (id)objc_claimAutoreleasedReturnValue(),
        v13,
        v13 != v4))
  {
    -[OADTileTechnique scaleX](self, "scaleX");
    v15 = v14;
    objc_msgSend(v4, "scaleX");
    if (v15 == v16)
    {
      LOBYTE(self->mScaleX) = 0;
    }
    else if (!LOBYTE(self->mScaleX))
    {
      -[OADTileTechnique scaleX](self, "scaleX");
      -[OADTileTechnique setScaleX:](self, "setScaleX:");
    }
  }
  if (LOBYTE(self->mScaleY)
    || (-[OADProperties parent](self, "parent"),
        v17 = (id)objc_claimAutoreleasedReturnValue(),
        v17,
        v17 != v4))
  {
    -[OADTileTechnique scaleY](self, "scaleY");
    v19 = v18;
    objc_msgSend(v4, "scaleY");
    if (v19 == v20)
    {
      LOBYTE(self->mScaleY) = 0;
    }
    else if (!LOBYTE(self->mScaleY))
    {
      -[OADTileTechnique scaleY](self, "scaleY");
      -[OADTileTechnique setScaleY:](self, "setScaleY:");
    }
  }
  if (LOBYTE(self->mFlipMode)
    || (-[OADProperties parent](self, "parent"),
        v21 = (id)objc_claimAutoreleasedReturnValue(),
        v21,
        v21 != v4))
  {
    v22 = -[OADTileTechnique flipMode](self, "flipMode");
    if (v22 == objc_msgSend(v4, "flipMode"))
    {
      LOBYTE(self->mFlipMode) = 0;
    }
    else if (!LOBYTE(self->mFlipMode))
    {
      -[OADTileTechnique setFlipMode:](self, "setFlipMode:", -[OADTileTechnique flipMode](self, "flipMode"));
    }
  }
  if (LOBYTE(self->mAlignment)
    || (-[OADProperties parent](self, "parent"),
        v23 = (id)objc_claimAutoreleasedReturnValue(),
        v23,
        v23 != v4))
  {
    v24 = -[OADTileTechnique alignment](self, "alignment");
    if (v24 == objc_msgSend(v4, "alignment"))
    {
      LOBYTE(self->mAlignment) = 0;
    }
    else if (!LOBYTE(self->mAlignment))
    {
      -[OADTileTechnique setAlignment:](self, "setAlignment:", -[OADTileTechnique alignment](self, "alignment"));
    }
  }

}

- (void)removeUnnecessaryOverrides
{
  void *v3;
  _BOOL8 v4;
  _BOOL8 v5;
  void *v6;
  float v7;
  float v8;
  double v9;
  void *v10;
  float v11;
  float v12;
  double v13;
  void *v14;
  float v15;
  float v16;
  double v17;
  void *v18;
  float v19;
  float v20;
  double v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  objc_super v26;

  -[OADProperties parent](self, "parent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = -[OADProperties isMerged](self, "isMerged");
    v5 = -[OADProperties isMergedWithParent](self, "isMergedWithParent");
    -[OADProperties setMerged:](self, "setMerged:", 0);
    -[OADProperties setMergedWithParent:](self, "setMergedWithParent:", 0);
    if (-[OADTileTechnique isOffsetXOverridden](self, "isOffsetXOverridden"))
    {
      -[OADProperties parent](self, "parent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADTileTechnique offsetX](self, "offsetX");
      v8 = v7;
      objc_msgSend(v6, "offsetX");
      if (v8 == *(float *)&v9)
      {
        LODWORD(v9) = 0;
        -[OADTileTechnique setOffsetX:](self, "setOffsetX:", v9);
        LOBYTE(self->mOffsetX) = 0;
      }

    }
    if (-[OADTileTechnique isOffsetYOverridden](self, "isOffsetYOverridden"))
    {
      -[OADProperties parent](self, "parent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADTileTechnique offsetY](self, "offsetY");
      v12 = v11;
      objc_msgSend(v10, "offsetY");
      if (v12 == *(float *)&v13)
      {
        LODWORD(v13) = 0;
        -[OADTileTechnique setOffsetY:](self, "setOffsetY:", v13);
        LOBYTE(self->mOffsetY) = 0;
      }

    }
    if (-[OADTileTechnique isScaleXOverridden](self, "isScaleXOverridden"))
    {
      -[OADProperties parent](self, "parent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADTileTechnique scaleX](self, "scaleX");
      v16 = v15;
      objc_msgSend(v14, "scaleX");
      if (v16 == *(float *)&v17)
      {
        LODWORD(v17) = 1.0;
        -[OADTileTechnique setScaleX:](self, "setScaleX:", v17);
        LOBYTE(self->mScaleX) = 0;
      }

    }
    if (-[OADTileTechnique isScaleYOverridden](self, "isScaleYOverridden"))
    {
      -[OADProperties parent](self, "parent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADTileTechnique scaleY](self, "scaleY");
      v20 = v19;
      objc_msgSend(v18, "scaleY");
      if (v20 == *(float *)&v21)
      {
        LODWORD(v21) = 1.0;
        -[OADTileTechnique setScaleY:](self, "setScaleY:", v21);
        LOBYTE(self->mScaleY) = 0;
      }

    }
    if (-[OADTileTechnique isFlipModeOverridden](self, "isFlipModeOverridden"))
    {
      -[OADProperties parent](self, "parent");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[OADTileTechnique flipMode](self, "flipMode");
      if (v23 == objc_msgSend(v22, "flipMode"))
      {
        -[OADTileTechnique setFlipMode:](self, "setFlipMode:", 0);
        LOBYTE(self->mFlipMode) = 0;
      }

    }
    if (-[OADTileTechnique isAlignmentOverridden](self, "isAlignmentOverridden"))
    {
      -[OADProperties parent](self, "parent");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[OADTileTechnique alignment](self, "alignment");
      if (v25 == objc_msgSend(v24, "alignment"))
      {
        -[OADTileTechnique setAlignment:](self, "setAlignment:", 1);
        LOBYTE(self->mAlignment) = 0;
      }

    }
    -[OADProperties setMerged:](self, "setMerged:", v4);
    -[OADProperties setMergedWithParent:](self, "setMergedWithParent:", v5);
    v26.receiver = self;
    v26.super_class = (Class)OADTileTechnique;
    -[OADProperties removeUnnecessaryOverrides](&v26, sel_removeUnnecessaryOverrides);
  }
}

- (float)offsetX
{
  float *v2;
  float v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_isOffsetXOverridden);
  v2 = (float *)objc_claimAutoreleasedReturnValue();
  v3 = v2[5];

  return v3;
}

- (BOOL)isOffsetXOverridden
{
  return LOBYTE(self->mOffsetX)
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (float)offsetY
{
  float *v2;
  float v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_isOffsetYOverridden);
  v2 = (float *)objc_claimAutoreleasedReturnValue();
  v3 = v2[7];

  return v3;
}

- (BOOL)isOffsetYOverridden
{
  return LOBYTE(self->mOffsetY)
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (float)scaleX
{
  float *v2;
  float v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_isScaleXOverridden);
  v2 = (float *)objc_claimAutoreleasedReturnValue();
  v3 = v2[9];

  return v3;
}

- (BOOL)isScaleXOverridden
{
  return LOBYTE(self->mScaleX)
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (float)scaleY
{
  float *v2;
  float v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_isScaleYOverridden);
  v2 = (float *)objc_claimAutoreleasedReturnValue();
  v3 = v2[11];

  return v3;
}

- (BOOL)isScaleYOverridden
{
  return LOBYTE(self->mScaleY)
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (int)flipMode
{
  _DWORD *v2;
  int v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_isFlipModeOverridden);
  v2 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  v3 = v2[13];

  return v3;
}

- (BOOL)isFlipModeOverridden
{
  return LOBYTE(self->mFlipMode)
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (int)alignment
{
  _DWORD *v2;
  int v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_isAlignmentOverridden);
  v2 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  v3 = v2[15];

  return v3;
}

- (BOOL)isAlignmentOverridden
{
  return LOBYTE(self->mAlignment)
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

@end
