@implementation OADCustomPattern

+ (id)defaultProperties
{
  if (+[OADCustomPattern defaultProperties]::once != -1)
    dispatch_once(&+[OADCustomPattern defaultProperties]::once, &__block_literal_global_375);
  return (id)+[OADCustomPattern defaultProperties]::defaultProperties;
}

- (OADCustomPattern)initWithDefaults
{
  OADCustomPattern *v2;
  OADCustomPattern *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OADCustomPattern;
  v2 = -[OADProperties initWithDefaults](&v5, sel_initWithDefaults);
  v3 = v2;
  if (v2)
    -[OADCustomPattern setBlipRef:](v2, "setBlipRef:", 0);
  return v3;
}

- (void)setBlipRef:(id)a3
{
  OADBlipRef *v5;
  OADBlipRef *v6;

  v5 = (OADBlipRef *)a3;
  if (self->mBlipRef != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mBlipRef, a3);
    v5 = v6;
    self->mIsBlipRefOverridden = 1;
  }

}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  if (self->mIsBlipRefOverridden)
    v3 = -[OADBlipRef hash](self->mBlipRef, "hash");
  else
    v3 = 0;
  v5.receiver = self;
  v5.super_class = (Class)OADCustomPattern;
  return -[OADPattern hash](&v5, sel_hash) ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)OADCustomPattern;
  if (-[OADPattern isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = v4;
    if (self->mIsBlipRefOverridden == *((unsigned __int8 *)v5 + 32))
      v6 = !self->mIsBlipRefOverridden || -[OADBlipRef isEqual:](self->mBlipRef, "isEqual:", v5[3]);
    else
      v6 = 0;

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
  id v6;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (self->mIsBlipRefOverridden)
  {
    v6 = -[OADBlipRef copyWithZone:](self->mBlipRef, "copyWithZone:", a3);
    objc_msgSend(v5, "setBlipRef:", v6);

  }
  return v5;
}

void __37__OADCustomPattern_defaultProperties__block_invoke()
{
  OADCustomPattern *v0;
  void *v1;

  v0 = -[OADCustomPattern initWithDefaults]([OADCustomPattern alloc], "initWithDefaults");
  v1 = (void *)+[OADCustomPattern defaultProperties]::defaultProperties;
  +[OADCustomPattern defaultProperties]::defaultProperties = (uint64_t)v0;

}

- (BOOL)isAnythingOverridden
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OADCustomPattern;
  return -[OADProperties isAnythingOverridden](&v4, sel_isAnythingOverridden)
      || -[OADCustomPattern isBlipRefOverridden](self, "isBlipRefOverridden");
}

- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_object *v7;
  void *v8;
  objc_object *v9;
  OADBlipRef *mBlipRef;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)OADCustomPattern;
  -[OADProperties fixPropertiesForChangingParentPreservingEffectiveValues:](&v11, sel_fixPropertiesForChangingParentPreservingEffectiveValues_, v4);
  if (self->mIsBlipRefOverridden
    || (-[OADProperties parent](self, "parent"), v5 = (id)objc_claimAutoreleasedReturnValue(),
                                                 v5,
                                                 v5 != v4))
  {
    -[OADProperties possiblyInexistentOverrideForSelector:](self, "possiblyInexistentOverrideForSelector:", sel_isBlipRefOverridden);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[OADCustomPattern blipRef](self, "blipRef");
      v7 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_isBlipRefOverridden);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "blipRef");
      v9 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    if (TCObjectEqual(v7, v9))
    {
      mBlipRef = self->mBlipRef;
      self->mBlipRef = 0;

      self->mIsBlipRefOverridden = 0;
    }
    else if (!self->mIsBlipRefOverridden && v6)
    {
      -[OADCustomPattern setBlipRef:](self, "setBlipRef:", v7);
    }

  }
}

- (id)blipRef
{
  id *v2;
  id v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_isBlipRefOverridden);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[3];

  return v3;
}

- (BOOL)isBlipRefOverridden
{
  return self->mIsBlipRefOverridden
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mBlipRef, 0);
}

@end
