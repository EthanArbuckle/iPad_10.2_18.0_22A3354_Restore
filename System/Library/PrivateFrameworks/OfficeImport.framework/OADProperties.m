@implementation OADProperties

- (OADProperties)initWithDefaults
{
  OADProperties *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADProperties;
  result = -[OADProperties init](&v3, sel_init);
  if (result)
    *((_BYTE *)result + 16) |= 3u;
  return result;
}

- (OADProperties)init
{
  OADProperties *v2;
  OADProperties *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OADProperties;
  v2 = -[OADProperties init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    *((_BYTE *)v2 + 16) |= 3u;
    objc_msgSend((id)objc_opt_class(), "defaultProperties");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADProperties setParent:](v3, "setParent:", v4);

  }
  return v3;
}

- (void)setParent:(id)a3
{
  void *v5;
  uint64_t v6;
  OADProperties *v7;

  v7 = (OADProperties *)a3;
  -[OADProperties parent](v7, "parent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    do
    {
      objc_msgSend(v5, "parent");
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v6;
    }
    while (v6);
  }
  if (v7 != self)
    objc_storeStrong((id *)&self->mParent, a3);

}

- (id)parent
{
  return self->mParent;
}

- (id)overrideForSelector:(SEL)a3
{
  return -[OADProperties overrideForSelector:mustExist:](self, "overrideForSelector:mustExist:", a3, 1);
}

- (BOOL)isMerged
{
  return *((_BYTE *)self + 16) & 1;
}

- (BOOL)isMergedWithParent
{
  return (*((unsigned __int8 *)self + 16) >> 1) & 1;
}

- (void)setMerged:(BOOL)a3
{
  *((_BYTE *)self + 16) = *((_BYTE *)self + 16) & 0xFE | a3;
}

- (void)setMergedWithParent:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 16) = *((_BYTE *)self + 16) & 0xFD | v3;
}

- (BOOL)isMergedPropertyForSelector:(SEL)a3
{
  OADProperties *mParent;

  mParent = self->mParent;
  if (mParent && (*((_BYTE *)self + 16) & 2) != 0 && (*((_BYTE *)mParent + 16) & 1) != 0)
    return ((uint64_t (*)(OADProperties *, SEL))-[OADProperties methodForSelector:](mParent, "methodForSelector:"))(self->mParent, a3);
  else
    return 0;
}

+ (id)defaultProperties
{
  return 0;
}

- (unint64_t)hash
{
  return -[OADProperties hash](self->mParent, "hash") ^ *((_BYTE *)self + 16) & 1 ^ ((unint64_t)*((unsigned __int8 *)self + 16) >> 1) & 1;
}

- (id)overrideForSelector:(SEL)a3 mustExist:(BOOL)a4
{
  OADProperties *v6;
  char v7;
  char v8;
  OADProperties *mParent;
  OADProperties *v10;

  v6 = self;
  while (1)
  {
    v7 = *((_BYTE *)v6 + 16);
    *((_BYTE *)v6 + 16) = v7 & 0xFD;
    v8 = ((uint64_t (*)(OADProperties *, SEL))-[OADProperties methodForSelector:](v6, "methodForSelector:", a3))(v6, a3);
    *((_BYTE *)v6 + 16) = *((_BYTE *)v6 + 16) & 0xFD | v7 & 2;
    if ((v8 & 1) != 0)
      break;
    mParent = v6->mParent;
    if (!mParent && a4)
      break;
    v10 = mParent;

    v6 = v10;
    if (!mParent)
    {
      v6 = 0;
      return v6;
    }
  }
  return v6;
}

- (id)possiblyInexistentOverrideForSelector:(SEL)a3
{
  return -[OADProperties overrideForSelector:mustExist:](self, "overrideForSelector:mustExist:", a3, 0);
}

- (void)changeParentPreservingEffectiveValues:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  -[OADProperties setMergedWithParent:](self, "setMergedWithParent:", 0);
  -[OADProperties fixPropertiesForChangingParentPreservingEffectiveValues:](self, "fixPropertiesForChangingParentPreservingEffectiveValues:", v5);
  -[OADProperties parent](self, "parent");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v5)
    -[OADProperties setParent:](self, "setParent:", v5);

}

- (void)flatten
{
  -[OADProperties setMergedWithParent:](self, "setMergedWithParent:", 1);
  -[OADProperties setMerged:](self, "setMerged:", 1);
  -[OADProperties flatten](self->mParent, "flatten");
}

- (BOOL)isAnythingOverridden
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char isKindOfClass;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    v6 = v4;
    objc_msgSend(v6, "parent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (v7 == 0) ^ (self->mParent != 0);

    if ((v8 & 1) != 0)
    {
      objc_msgSend(v6, "parent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9
        || (objc_msgSend(v6, "parent"),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            v11 = objc_msgSend(v10, "isEqual:", self->mParent),
            v10,
            v9,
            (v11 & 1) != 0))
      {
        if (objc_msgSend(v6, "isMerged") != ((*((_BYTE *)self + 16) & 1) == 0))
          objc_msgSend(v6, "isMergedWithParent");
      }
    }

  }
  return isKindOfClass & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADProperties;
  -[OADProperties description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mParent, 0);
}

@end
