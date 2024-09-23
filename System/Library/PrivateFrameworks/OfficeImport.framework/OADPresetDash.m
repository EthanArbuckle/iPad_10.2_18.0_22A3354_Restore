@implementation OADPresetDash

+ (id)defaultProperties
{
  if (+[OADPresetDash defaultProperties]::once != -1)
    dispatch_once(&+[OADPresetDash defaultProperties]::once, &__block_literal_global_119);
  return (id)+[OADPresetDash defaultProperties]::defaultProperties;
}

- (OADPresetDash)initWithDefaults
{
  OADPresetDash *v2;
  OADPresetDash *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OADPresetDash;
  v2 = -[OADProperties initWithDefaults](&v5, sel_initWithDefaults);
  v3 = v2;
  if (v2)
    -[OADPresetDash setType:](v2, "setType:", 0);
  return v3;
}

- (void)setType:(char)a3
{
  *((_BYTE *)&self->super.super + 17) = a3;
  *((_BYTE *)&self->super.super + 18) |= 1u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if ((*((_BYTE *)&self->super.super + 18) & 1) != 0)
    objc_msgSend(v4, "setType:", *((char *)&self->super.super + 17));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unsigned __int8 *v5;
  int v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)OADPresetDash;
  if (-[OADDash isEqual:](&v9, sel_isEqual_, v4))
  {
    v5 = (unsigned __int8 *)v4;
    v6 = *((unsigned __int8 *)&self->super.super + 18);
    v7 = ((v5[18] ^ v6) & 1) == 0 && ((v6 & 1) == 0 || *((unsigned __int8 *)&self->super.super + 17) == v5[17]);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  if ((*((_BYTE *)&self->super.super + 18) & 1) != 0)
    return *((char *)&self->super.super + 17);
  else
    return 0;
}

- (char)type
{
  _BYTE *v2;
  char v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_isTypeOverridden);
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  v3 = v2[17];

  return v3;
}

- (BOOL)isTypeOverridden
{
  return (*((_BYTE *)&self->super.super + 18) & 1) != 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (id)equivalentCustomDash
{
  uint64_t v2;
  _DWORD *v3;
  OADCustomDash *v4;
  void *v5;
  double v6;
  double v7;
  float *v8;
  float v9;

  v2 = *((char *)&self->super.super + 17) - 1;
  if (v2 > 0xD)
  {
    v4 = 0;
  }
  else
  {
    v3 = *(&off_24F39DEA0 + v2);
    v4 = objc_alloc_init(OADCustomDash);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 3);
    LODWORD(v7) = *v3;
    if (*(float *)v3 != -1.0)
    {
      v8 = (float *)(v3 + 2);
      do
      {
        *(float *)&v6 = *(v8 - 1);
        +[OADDashStop addStopWithDash:space:toArray:](OADDashStop, "addStopWithDash:space:toArray:", v5, v7, v6);
        v9 = *v8;
        v8 += 2;
        *(float *)&v7 = v9;
      }
      while (v9 != -1.0);
    }
    -[OADCustomDash setStops:](v4, "setStops:", v5, v7);

  }
  return v4;
}

void __34__OADPresetDash_defaultProperties__block_invoke()
{
  OADPresetDash *v0;
  void *v1;

  v0 = -[OADPresetDash initWithDefaults]([OADPresetDash alloc], "initWithDefaults");
  v1 = (void *)+[OADPresetDash defaultProperties]::defaultProperties;
  +[OADPresetDash defaultProperties]::defaultProperties = (uint64_t)v0;

}

- (BOOL)isAnythingOverridden
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OADPresetDash;
  return -[OADProperties isAnythingOverridden](&v4, sel_isAnythingOverridden)
      || -[OADPresetDash isTypeOverridden](self, "isTypeOverridden");
}

- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3
{
  id v4;
  id v5;
  int v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)OADPresetDash;
  -[OADProperties fixPropertiesForChangingParentPreservingEffectiveValues:](&v7, sel_fixPropertiesForChangingParentPreservingEffectiveValues_, v4);
  if ((*((_BYTE *)&self->super.super + 18) & 1) != 0
    || (-[OADProperties parent](self, "parent"), v5 = (id)objc_claimAutoreleasedReturnValue(),
                                                 v5,
                                                 v5 != v4))
  {
    v6 = -[OADPresetDash type](self, "type");
    if (v6 == objc_msgSend(v4, "type"))
    {
      *((_BYTE *)&self->super.super + 18) &= ~1u;
    }
    else if ((*((_BYTE *)&self->super.super + 18) & 1) == 0)
    {
      -[OADPresetDash setType:](self, "setType:", -[OADPresetDash type](self, "type"));
    }
  }

}

@end
