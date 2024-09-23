@implementation OADCustomDash

+ (id)defaultProperties
{
  if (+[OADCustomDash defaultProperties]::once != -1)
    dispatch_once(&+[OADCustomDash defaultProperties]::once, &__block_literal_global_106);
  return (id)+[OADCustomDash defaultProperties]::defaultProperties;
}

- (OADCustomDash)initWithDefaults
{
  OADCustomDash *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OADCustomDash;
  v2 = -[OADProperties initWithDefaults](&v5, sel_initWithDefaults);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADCustomDash setStops:](v2, "setStops:", v3);

  }
  return v2;
}

- (void)setStops:(id)a3
{
  NSArray *v4;
  NSArray *mStops;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  mStops = self->mStops;
  self->mStops = v4;

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setStops:", self->mStops);
  return v4;
}

void __34__OADCustomDash_defaultProperties__block_invoke()
{
  OADCustomDash *v0;
  void *v1;

  v0 = -[OADCustomDash initWithDefaults]([OADCustomDash alloc], "initWithDefaults");
  v1 = (void *)+[OADCustomDash defaultProperties]::defaultProperties;
  +[OADCustomDash defaultProperties]::defaultProperties = (uint64_t)v0;

}

- (BOOL)isAnythingOverridden
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OADCustomDash;
  return -[OADProperties isAnythingOverridden](&v4, sel_isAnythingOverridden)
      || -[OADCustomDash areStopsOverridden](self, "areStopsOverridden");
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
  NSArray *mStops;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)OADCustomDash;
  -[OADProperties fixPropertiesForChangingParentPreservingEffectiveValues:](&v12, sel_fixPropertiesForChangingParentPreservingEffectiveValues_, v4);
  if (-[OADCustomDash areStopsOverridden](self, "areStopsOverridden")
    || (-[OADProperties parent](self, "parent"), v5 = (id)objc_claimAutoreleasedReturnValue(),
                                                 v5,
                                                 v5 != v4))
  {
    -[OADProperties possiblyInexistentOverrideForSelector:](self, "possiblyInexistentOverrideForSelector:", sel_areStopsOverridden);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[OADCustomDash stops](self, "stops");
      v7 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_areStopsOverridden);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "stops");
      v9 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    v10 = TCObjectEqual(v7, v9);
    mStops = self->mStops;
    if (v10)
    {
      self->mStops = 0;

    }
    else if (!mStops && v6)
    {
      -[OADCustomDash setStops:](self, "setStops:", v7);
    }

  }
}

- (id)stops
{
  id *v2;
  id v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_areStopsOverridden);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[3];

  return v3;
}

- (BOOL)areStopsOverridden
{
  return self->mStops || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (unint64_t)hash
{
  unint64_t result;

  result = (unint64_t)self->mStops;
  if (result)
    return objc_msgSend((id)result, "count");
  return result;
}

- (BOOL)isEqual:(id)a3
{
  objc_object **v4;
  char v5;
  objc_super v7;

  v4 = (objc_object **)a3;
  v7.receiver = self;
  v7.super_class = (Class)OADCustomDash;
  if (-[OADDash isEqual:](&v7, sel_isEqual_, v4))
    v5 = TCObjectEqual((objc_object *)self->mStops, v4[3]);
  else
    v5 = 0;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mStops, 0);
}

@end
