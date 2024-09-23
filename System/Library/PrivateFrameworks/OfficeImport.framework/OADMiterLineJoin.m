@implementation OADMiterLineJoin

+ (id)defaultProperties
{
  if (+[OADMiterLineJoin defaultProperties]::once != -1)
    dispatch_once(&+[OADMiterLineJoin defaultProperties]::once, &__block_literal_global_76_0);
  return (id)+[OADMiterLineJoin defaultProperties]::defaultProperties;
}

- (OADMiterLineJoin)initWithDefaults
{
  OADMiterLineJoin *v2;
  double v3;
  OADMiterLineJoin *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OADMiterLineJoin;
  v2 = -[OADProperties initWithDefaults](&v6, sel_initWithDefaults);
  v4 = v2;
  if (v2)
  {
    LODWORD(v3) = 8.0;
    -[OADMiterLineJoin setLimit:](v2, "setLimit:", v3);
  }
  return v4;
}

- (void)setLimit:(float)a3
{
  *((float *)&self->super.super + 5) = a3;
  LOBYTE(self->mLimit) |= 1u;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  float *v7;
  int mLimit_low;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = (float *)v4;
    mLimit_low = LOBYTE(self->mLimit);
    v6 = ((*((unsigned __int8 *)v7 + 24) ^ mLimit_low) & 1) == 0
      && ((mLimit_low & 1) == 0 || *((float *)&self->super.super + 5) == v7[5]);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  double v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v4;
  if ((LOBYTE(self->mLimit) & 1) != 0)
  {
    LODWORD(v5) = *((_DWORD *)&self->super.super + 5);
    objc_msgSend(v4, "setLimit:", v5);
  }
  return v6;
}

void __37__OADMiterLineJoin_defaultProperties__block_invoke()
{
  OADMiterLineJoin *v0;
  void *v1;

  v0 = -[OADMiterLineJoin initWithDefaults]([OADMiterLineJoin alloc], "initWithDefaults");
  v1 = (void *)+[OADMiterLineJoin defaultProperties]::defaultProperties;
  +[OADMiterLineJoin defaultProperties]::defaultProperties = (uint64_t)v0;

}

- (BOOL)isAnythingOverridden
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OADMiterLineJoin;
  return -[OADProperties isAnythingOverridden](&v4, sel_isAnythingOverridden)
      || -[OADMiterLineJoin isLimitOverridden](self, "isLimitOverridden");
}

- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3
{
  id v4;
  id v5;
  float v6;
  float v7;
  float v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)OADMiterLineJoin;
  -[OADProperties fixPropertiesForChangingParentPreservingEffectiveValues:](&v9, sel_fixPropertiesForChangingParentPreservingEffectiveValues_, v4);
  if ((LOBYTE(self->mLimit) & 1) != 0
    || (-[OADProperties parent](self, "parent"), v5 = (id)objc_claimAutoreleasedReturnValue(),
                                                 v5,
                                                 v5 != v4))
  {
    -[OADMiterLineJoin limit](self, "limit");
    v7 = v6;
    objc_msgSend(v4, "limit");
    if (v7 == v8)
    {
      LOBYTE(self->mLimit) &= ~1u;
    }
    else if ((LOBYTE(self->mLimit) & 1) == 0)
    {
      -[OADMiterLineJoin limit](self, "limit");
      -[OADMiterLineJoin setLimit:](self, "setLimit:");
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
  objc_super v10;

  -[OADProperties parent](self, "parent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = -[OADProperties isMerged](self, "isMerged");
    v5 = -[OADProperties isMergedWithParent](self, "isMergedWithParent");
    -[OADProperties setMerged:](self, "setMerged:", 0);
    -[OADProperties setMergedWithParent:](self, "setMergedWithParent:", 0);
    if (-[OADMiterLineJoin isLimitOverridden](self, "isLimitOverridden"))
    {
      -[OADProperties parent](self, "parent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADMiterLineJoin limit](self, "limit");
      v8 = v7;
      objc_msgSend(v6, "limit");
      if (v8 == *(float *)&v9)
      {
        LODWORD(v9) = 8.0;
        -[OADMiterLineJoin setLimit:](self, "setLimit:", v9);
        LOBYTE(self->mLimit) &= ~1u;
      }

    }
    -[OADProperties setMerged:](self, "setMerged:", v4);
    -[OADProperties setMergedWithParent:](self, "setMergedWithParent:", v5);
    v10.receiver = self;
    v10.super_class = (Class)OADMiterLineJoin;
    -[OADProperties removeUnnecessaryOverrides](&v10, sel_removeUnnecessaryOverrides);
  }
}

- (float)limit
{
  float *v2;
  float v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_isLimitOverridden);
  v2 = (float *)objc_claimAutoreleasedReturnValue();
  v3 = v2[5];

  return v3;
}

- (BOOL)isLimitOverridden
{
  return (LOBYTE(self->mLimit) & 1) != 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (unint64_t)hash
{
  unint64_t v2;
  objc_super v4;

  v2 = (unint64_t)*((float *)&self->super.super + 5);
  v4.receiver = self;
  v4.super_class = (Class)OADMiterLineJoin;
  return (-[OADProperties hash](&v4, sel_hash) + 256 * v2) ^ LOBYTE(self->mLimit) & 1;
}

@end
