@implementation OADLineEnd

+ (id)defaultProperties
{
  if (+[OADLineEnd defaultProperties]::once != -1)
    dispatch_once(&+[OADLineEnd defaultProperties]::once, &__block_literal_global_62);
  return (id)+[OADLineEnd defaultProperties]::defaultProperties;
}

- (OADLineEnd)initWithDefaults
{
  OADLineEnd *v2;
  OADLineEnd *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OADLineEnd;
  v2 = -[OADProperties initWithDefaults](&v5, sel_initWithDefaults);
  v3 = v2;
  if (v2)
  {
    -[OADLineEnd setType:](v2, "setType:", 0);
    -[OADLineEnd setWidth:](v3, "setWidth:", 1);
    -[OADLineEnd setLength:](v3, "setLength:", 1);
  }
  return v3;
}

- (void)setType:(unsigned __int8)a3
{
  *((_BYTE *)&self->super + 17) = a3;
  *((_BYTE *)&self->super + 20) |= 1u;
}

- (void)setWidth:(unsigned __int8)a3
{
  *((_BYTE *)&self->super + 18) = a3;
  *((_BYTE *)&self->super + 20) |= 2u;
}

- (void)setLength:(unsigned __int8)a3
{
  *((_BYTE *)&self->super + 19) = a3;
  *((_BYTE *)&self->super + 20) |= 4u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if ((*((_BYTE *)&self->super + 20) & 1) != 0)
    objc_msgSend(v4, "setType:", *((unsigned __int8 *)&self->super + 17));
  if ((*((_BYTE *)&self->super + 20) & 2) != 0)
    objc_msgSend(v5, "setWidth:", *((unsigned __int8 *)&self->super + 18));
  if ((*((_BYTE *)&self->super + 20) & 4) != 0)
    objc_msgSend(v5, "setLength:", *((unsigned __int8 *)&self->super + 19));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  unsigned __int8 *v7;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = (unsigned __int8 *)v4;
    v6 = *((unsigned __int8 *)&self->super + 17) == v7[17]
      && *((unsigned __int8 *)&self->super + 18) == v7[18]
      && *((unsigned __int8 *)&self->super + 19) == v7[19];

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return ((unint64_t)*((unsigned __int8 *)&self->super + 17) << 16) | ((unint64_t)*((unsigned __int8 *)&self->super
                                                                                                + 19) << 8) | *((unsigned __int8 *)&self->super + 18);
}

- (unsigned)type
{
  _BYTE *v2;
  unsigned __int8 v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_isTypeOverridden);
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  v3 = v2[17];

  return v3;
}

- (BOOL)isTypeOverridden
{
  return (*((_BYTE *)&self->super + 20) & 1) != 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (unsigned)width
{
  _BYTE *v2;
  unsigned __int8 v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_isWidthOverridden);
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  v3 = v2[18];

  return v3;
}

- (BOOL)isWidthOverridden
{
  return (*((_BYTE *)&self->super + 20) & 2) != 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (unsigned)length
{
  _BYTE *v2;
  unsigned __int8 v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_isLengthOverridden);
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  v3 = v2[19];

  return v3;
}

- (BOOL)isLengthOverridden
{
  return (*((_BYTE *)&self->super + 20) & 4) != 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (OADLineEnd)initWithType:(unsigned __int8)a3 width:(unsigned __int8)a4 length:(unsigned __int8)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  OADLineEnd *v8;
  OADLineEnd *v9;
  objc_super v11;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)OADLineEnd;
  v8 = -[OADProperties init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[OADLineEnd setType:](v8, "setType:", v7);
    -[OADLineEnd setWidth:](v9, "setWidth:", v6);
    -[OADLineEnd setLength:](v9, "setLength:", v5);
  }
  return v9;
}

void __31__OADLineEnd_defaultProperties__block_invoke()
{
  OADLineEnd *v0;
  void *v1;

  v0 = -[OADLineEnd initWithDefaults]([OADLineEnd alloc], "initWithDefaults");
  v1 = (void *)+[OADLineEnd defaultProperties]::defaultProperties;
  +[OADLineEnd defaultProperties]::defaultProperties = (uint64_t)v0;

}

- (BOOL)isAnythingOverridden
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OADLineEnd;
  return -[OADProperties isAnythingOverridden](&v4, sel_isAnythingOverridden)
      || -[OADLineEnd isTypeOverridden](self, "isTypeOverridden")
      || -[OADLineEnd isWidthOverridden](self, "isWidthOverridden")
      || -[OADLineEnd isLengthOverridden](self, "isLengthOverridden");
}

- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3
{
  id v4;
  id v5;
  int v6;
  id v7;
  int v8;
  id v9;
  int v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)OADLineEnd;
  -[OADProperties fixPropertiesForChangingParentPreservingEffectiveValues:](&v11, sel_fixPropertiesForChangingParentPreservingEffectiveValues_, v4);
  if ((*((_BYTE *)&self->super + 20) & 1) != 0
    || (-[OADProperties parent](self, "parent"), v5 = (id)objc_claimAutoreleasedReturnValue(),
                                                 v5,
                                                 v5 != v4))
  {
    v6 = -[OADLineEnd type](self, "type");
    if (v6 == objc_msgSend(v4, "type"))
    {
      *((_BYTE *)&self->super + 20) &= ~1u;
    }
    else if ((*((_BYTE *)&self->super + 20) & 1) == 0)
    {
      -[OADLineEnd setType:](self, "setType:", -[OADLineEnd type](self, "type"));
    }
  }
  if ((*((_BYTE *)&self->super + 20) & 2) != 0
    || (-[OADProperties parent](self, "parent"), v7 = (id)objc_claimAutoreleasedReturnValue(),
                                                 v7,
                                                 v7 != v4))
  {
    v8 = -[OADLineEnd width](self, "width");
    if (v8 == objc_msgSend(v4, "width"))
    {
      *((_BYTE *)&self->super + 20) &= ~2u;
    }
    else if ((*((_BYTE *)&self->super + 20) & 2) == 0)
    {
      -[OADLineEnd setWidth:](self, "setWidth:", -[OADLineEnd width](self, "width"));
    }
  }
  if ((*((_BYTE *)&self->super + 20) & 4) != 0
    || (-[OADProperties parent](self, "parent"), v9 = (id)objc_claimAutoreleasedReturnValue(),
                                                 v9,
                                                 v9 != v4))
  {
    v10 = -[OADLineEnd length](self, "length");
    if (v10 == objc_msgSend(v4, "length"))
    {
      *((_BYTE *)&self->super + 20) &= ~4u;
    }
    else if ((*((_BYTE *)&self->super + 20) & 4) == 0)
    {
      -[OADLineEnd setLength:](self, "setLength:", -[OADLineEnd length](self, "length"));
    }
  }

}

- (void)removeUnnecessaryOverrides
{
  void *v3;
  _BOOL8 v4;
  _BOOL8 v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
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
    if (-[OADLineEnd isTypeOverridden](self, "isTypeOverridden"))
    {
      -[OADProperties parent](self, "parent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[OADLineEnd type](self, "type");
      if (v7 == objc_msgSend(v6, "type"))
      {
        -[OADLineEnd setType:](self, "setType:", 0);
        *((_BYTE *)&self->super + 20) &= ~1u;
      }

    }
    if (-[OADLineEnd isWidthOverridden](self, "isWidthOverridden"))
    {
      -[OADProperties parent](self, "parent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[OADLineEnd width](self, "width");
      if (v9 == objc_msgSend(v8, "width"))
      {
        -[OADLineEnd setWidth:](self, "setWidth:", 1);
        *((_BYTE *)&self->super + 20) &= ~2u;
      }

    }
    if (-[OADLineEnd isLengthOverridden](self, "isLengthOverridden"))
    {
      -[OADProperties parent](self, "parent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[OADLineEnd length](self, "length");
      if (v11 == objc_msgSend(v10, "length"))
      {
        -[OADLineEnd setLength:](self, "setLength:", 1);
        *((_BYTE *)&self->super + 20) &= ~4u;
      }

    }
    -[OADProperties setMerged:](self, "setMerged:", v4);
    -[OADProperties setMergedWithParent:](self, "setMergedWithParent:", v5);
    v12.receiver = self;
    v12.super_class = (Class)OADLineEnd;
    -[OADProperties removeUnnecessaryOverrides](&v12, sel_removeUnnecessaryOverrides);
  }
}

+ (id)stringForLineEndType:(unsigned __int8)a3
{
  if (a3 > 5u)
    return CFSTR("unknown");
  else
    return off_24F39DE58[(char)a3];
}

+ (id)stringForLineEndWidth:(unsigned __int8)a3
{
  if (a3 > 2u)
    return CFSTR("unknown");
  else
    return off_24F39DE88[(char)a3];
}

+ (id)stringForLineEndLength:(unsigned __int8)a3
{
  if (a3 > 2u)
    return CFSTR("unknown");
  else
    return off_24F39DE88[(char)a3];
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADLineEnd;
  -[OADProperties description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
