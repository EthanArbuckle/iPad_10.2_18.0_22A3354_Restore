@implementation OADLinearShade

+ (id)defaultProperties
{
  if (+[OADLinearShade defaultProperties]::once != -1)
    dispatch_once(&+[OADLinearShade defaultProperties]::once, &__block_literal_global_78);
  return (id)+[OADLinearShade defaultProperties]::defaultProperties;
}

- (OADLinearShade)initWithDefaults
{
  OADLinearShade *v2;
  double v3;
  OADLinearShade *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OADLinearShade;
  v2 = -[OADProperties initWithDefaults](&v6, sel_initWithDefaults);
  v4 = v2;
  if (v2)
  {
    LODWORD(v3) = 0;
    -[OADLinearShade setAngle:](v2, "setAngle:", v3);
    -[OADLinearShade setScaled:](v4, "setScaled:", 0);
  }
  return v4;
}

- (void)setAngle:(float)a3
{
  *((float *)&self->super.super + 5) = a3;
  LOBYTE(self->mAngle) = 1;
}

- (void)setScaled:(BOOL)a3
{
  BYTE1(self->mAngle) = a3;
  BYTE2(self->mAngle) = 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  double v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v4;
  if (LOBYTE(self->mAngle))
  {
    LODWORD(v5) = *((_DWORD *)&self->super.super + 5);
    objc_msgSend(v4, "setAngle:", v5);
  }
  if (BYTE2(self->mAngle))
    objc_msgSend(v6, "setScaled:", BYTE1(self->mAngle));
  return v6;
}

- (unint64_t)hash
{
  unint64_t v2;

  if (LOBYTE(self->mAngle))
    v2 = (unint64_t)*((float *)&self->super.super + 5);
  else
    v2 = 0;
  if (BYTE2(self->mAngle))
    v2 ^= BYTE1(self->mAngle);
  return v2;
}

- (float)angle
{
  float *v2;
  float v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_isAngleOverridden);
  v2 = (float *)objc_claimAutoreleasedReturnValue();
  v3 = v2[5];

  return v3;
}

- (BOOL)isAngleOverridden
{
  return LOBYTE(self->mAngle) || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  float *v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)OADLinearShade;
  if (-[OADShade isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = (float *)v4;
    if (LOBYTE(self->mAngle) == *((unsigned __int8 *)v5 + 24)
      && (!LOBYTE(self->mAngle) || *((float *)&self->super.super + 5) == v5[5])
      && BYTE2(self->mAngle) == *((unsigned __int8 *)v5 + 26))
    {
      if (BYTE2(self->mAngle))
        v6 = BYTE1(self->mAngle) == *((unsigned __int8 *)v5 + 25);
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

void __35__OADLinearShade_defaultProperties__block_invoke()
{
  OADLinearShade *v0;
  void *v1;

  v0 = -[OADLinearShade initWithDefaults]([OADLinearShade alloc], "initWithDefaults");
  v1 = (void *)+[OADLinearShade defaultProperties]::defaultProperties;
  +[OADLinearShade defaultProperties]::defaultProperties = (uint64_t)v0;

}

- (BOOL)isAnythingOverridden
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OADLinearShade;
  return -[OADProperties isAnythingOverridden](&v4, sel_isAnythingOverridden)
      || -[OADLinearShade isAngleOverridden](self, "isAngleOverridden")
      || -[OADLinearShade isScaledOverridden](self, "isScaledOverridden");
}

- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3
{
  id v4;
  id v5;
  float v6;
  float v7;
  float v8;
  id v9;
  int v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)OADLinearShade;
  -[OADProperties fixPropertiesForChangingParentPreservingEffectiveValues:](&v11, sel_fixPropertiesForChangingParentPreservingEffectiveValues_, v4);
  if (LOBYTE(self->mAngle)
    || (-[OADProperties parent](self, "parent"), v5 = (id)objc_claimAutoreleasedReturnValue(),
                                                 v5,
                                                 v5 != v4))
  {
    -[OADLinearShade angle](self, "angle");
    v7 = v6;
    objc_msgSend(v4, "angle");
    if (v7 == v8)
    {
      LOBYTE(self->mAngle) = 0;
    }
    else if (!LOBYTE(self->mAngle))
    {
      -[OADLinearShade angle](self, "angle");
      -[OADLinearShade setAngle:](self, "setAngle:");
    }
  }
  if (BYTE2(self->mAngle)
    || (-[OADProperties parent](self, "parent"), v9 = (id)objc_claimAutoreleasedReturnValue(),
                                                 v9,
                                                 v9 != v4))
  {
    v10 = -[OADLinearShade scaled](self, "scaled");
    if (v10 == objc_msgSend(v4, "scaled"))
    {
      BYTE2(self->mAngle) = 0;
    }
    else if (!BYTE2(self->mAngle))
    {
      -[OADLinearShade setScaled:](self, "setScaled:", -[OADLinearShade scaled](self, "scaled"));
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
  int v11;
  objc_super v12;

  -[OADProperties parent](self, "parent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = -[OADProperties isMerged](self, "isMerged");
    v5 = -[OADProperties isMergedWithParent](self, "isMergedWithParent");
    -[OADProperties setMerged:](self, "setMerged:", 0);
    -[OADProperties setMergedWithParent:](self, "setMergedWithParent:", 0);
    if (-[OADLinearShade isAngleOverridden](self, "isAngleOverridden"))
    {
      -[OADProperties parent](self, "parent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADLinearShade angle](self, "angle");
      v8 = v7;
      objc_msgSend(v6, "angle");
      if (v8 == *(float *)&v9)
      {
        LODWORD(v9) = 0;
        -[OADLinearShade setAngle:](self, "setAngle:", v9);
        LOBYTE(self->mAngle) = 0;
      }

    }
    if (-[OADLinearShade isScaledOverridden](self, "isScaledOverridden"))
    {
      -[OADProperties parent](self, "parent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[OADLinearShade scaled](self, "scaled");
      if (v11 == objc_msgSend(v10, "scaled"))
      {
        -[OADLinearShade setScaled:](self, "setScaled:", 0);
        BYTE2(self->mAngle) = 0;
      }

    }
    -[OADProperties setMerged:](self, "setMerged:", v4);
    -[OADProperties setMergedWithParent:](self, "setMergedWithParent:", v5);
    v12.receiver = self;
    v12.super_class = (Class)OADLinearShade;
    -[OADProperties removeUnnecessaryOverrides](&v12, sel_removeUnnecessaryOverrides);
  }
}

- (BOOL)scaled
{
  _BYTE *v2;
  char v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_isScaledOverridden);
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  v3 = v2[25];

  return v3;
}

- (BOOL)isScaledOverridden
{
  return BYTE2(self->mAngle) || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

@end
