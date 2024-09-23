@implementation WDTableRowProperties

- (WDTableRowProperties)initWithDocument:(id)a3
{
  id v4;
  WDTableRowProperties *v5;
  WDTableProperties *v6;
  WDTableProperties *mTableProperties;
  WDCharacterProperties *v8;
  WDCharacterProperties *mCharacterProperties;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WDTableRowProperties;
  v5 = -[WDTableRowProperties init](&v11, sel_init);
  if (v5)
  {
    v6 = -[WDTableProperties initWithDocument:]([WDTableProperties alloc], "initWithDocument:", v4);
    mTableProperties = v5->mTableProperties;
    v5->mTableProperties = v6;

    v8 = -[WDCharacterProperties initWithDocument:]([WDCharacterProperties alloc], "initWithDocument:", v4);
    mCharacterProperties = v5->mCharacterProperties;
    v5->mCharacterProperties = v8;

    *((_BYTE *)v5 + 24) = *((_BYTE *)v5 + 24) & 0xF8 | 1;
  }

  return v5;
}

- (id)tableProperties
{
  return self->mTableProperties;
}

- (void)setResolveMode:(int)a3
{
  *((_BYTE *)self + 24) = (2 * (a3 == 1)) | (4 * (a3 == 2)) | (a3 == 0) | *((_BYTE *)self + 24) & 0xF8;
}

- (id)characterProperties
{
  return self->mCharacterProperties;
}

- (BOOL)isHeightOverridden
{
  int v2;
  _BOOL4 v3;

  if ((*((_BYTE *)self + 24) & 2) != 0)
  {
    v2 = *((_BYTE *)&self->mTrackedProperties + 28) & 0x10;
  }
  else
  {
    if ((*((_BYTE *)self + 24) & 4) == 0)
    {
      if ((*((_BYTE *)self + 24) & 1) != 0)
        return (*((unsigned __int8 *)&self->mOriginalProperties + 28) >> 4) & 1;
      goto LABEL_10;
    }
    if ((*((_BYTE *)&self->mTrackedProperties + 28) & 0x10) == 0)
    {
      if ((*((_BYTE *)self + 24) & 1) != 0 || (*((_BYTE *)&self->mOriginalProperties + 28) & 0x10) != 0)
        return (*((unsigned __int8 *)&self->mOriginalProperties + 28) >> 4) & 1;
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    v2 = *((_BYTE *)&self->mTrackedProperties + 28) & 0x10;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (void)setHeightType:(int)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((*((_BYTE *)self + 24) & 2) != 0)
  {
    v3 = 92;
    v4 = 88;
  }
  else
  {
    if ((*((_BYTE *)self + 24) & 1) == 0)
      return;
    v3 = 60;
    v4 = 56;
  }
  *(_DWORD *)((char *)&self->super.isa + v4) = a3;
  *((_BYTE *)&self->super.isa + v3) |= 0x20u;
}

- (void)setHeight:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((*((_BYTE *)self + 24) & 2) != 0)
  {
    v3 = 92;
    v4 = 80;
  }
  else
  {
    if ((*((_BYTE *)self + 24) & 1) == 0)
      return;
    v3 = 60;
    v4 = 48;
  }
  *(Class *)((char *)&self->super.isa + v4) = (Class)a3;
  *((_BYTE *)&self->super.isa + v3) |= 0x10u;
}

- (int64_t)height
{
  uint64_t v3;

  if ((*((_BYTE *)self + 24) & 6) != 0 && (*((_BYTE *)&self->mTrackedProperties + 28) & 0x10) != 0)
  {
    v3 = 80;
  }
  else
  {
    if ((*((_BYTE *)self + 24) & 5) == 0 || (*((_BYTE *)&self->mOriginalProperties + 28) & 0x10) == 0)
      return 0;
    v3 = 48;
  }
  return *(int64_t *)((char *)&self->super.isa + v3);
}

- (void)setWidthBefore:(signed __int16)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((*((_BYTE *)self + 24) & 2) != 0)
  {
    v3 = 92;
    v4 = 64;
  }
  else
  {
    if ((*((_BYTE *)self + 24) & 1) == 0)
      return;
    v3 = 60;
    v4 = 32;
  }
  *(_WORD *)((char *)&self->super.isa + v4) = a3;
  *((_BYTE *)&self->super.isa + v3) |= 1u;
}

- (void)setWidthBeforeType:(int)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((*((_BYTE *)self + 24) & 2) != 0)
  {
    v3 = 92;
    v4 = 68;
  }
  else
  {
    if ((*((_BYTE *)self + 24) & 1) == 0)
      return;
    v3 = 60;
    v4 = 36;
  }
  *(_DWORD *)((char *)&self->super.isa + v4) = a3;
  *((_BYTE *)&self->super.isa + v3) |= 2u;
}

- (void)setHeader:(BOOL)a3
{
  uint64_t v3;
  char v4;

  if ((*((_BYTE *)self + 24) & 2) != 0)
  {
    v3 = 92;
  }
  else
  {
    if ((*((_BYTE *)self + 24) & 1) == 0)
      return;
    v3 = 60;
  }
  if (a3)
    v4 = -64;
  else
    v4 = 0x80;
  *((_BYTE *)&self->super.isa + v3) = v4 & 0xC0 | *((_BYTE *)&self->super.isa + v3) & 0x3F;
}

- (void)setWidthAfter:(signed __int16)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((*((_BYTE *)self + 24) & 2) != 0)
  {
    v3 = 92;
    v4 = 72;
  }
  else
  {
    if ((*((_BYTE *)self + 24) & 1) == 0)
      return;
    v3 = 60;
    v4 = 40;
  }
  *(_WORD *)((char *)&self->super.isa + v4) = a3;
  *((_BYTE *)&self->super.isa + v3) |= 4u;
}

- (void)setWidthAfterType:(int)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((*((_BYTE *)self + 24) & 2) != 0)
  {
    v3 = 92;
    v4 = 76;
  }
  else
  {
    if ((*((_BYTE *)self + 24) & 1) == 0)
      return;
    v3 = 60;
    v4 = 44;
  }
  *(_DWORD *)((char *)&self->super.isa + v4) = a3;
  *((_BYTE *)&self->super.isa + v3) |= 8u;
}

- (WDTableRowProperties)init
{

  return 0;
}

- (int)resolveMode
{
  unsigned int v2;
  int v3;

  v2 = *((unsigned __int8 *)self + 24);
  if ((v2 & 2) != 0)
    v3 = 1;
  else
    v3 = (v2 >> 1) & 2;
  if ((v2 & 1) != 0)
    return 0;
  else
    return v3;
}

- (void)addProperties:(id)a3
{
  char *v4;

  v4 = (char *)a3;
  -[WDTableRowProperties addPropertiesValues:to:](self, "addPropertiesValues:to:", v4 + 32, &self->mOriginalProperties);
  -[WDTableRowProperties addPropertiesValues:to:](self, "addPropertiesValues:to:", v4 + 64, &self->mTrackedProperties);

}

- (signed)widthBefore
{
  uint64_t v3;

  if ((*((_BYTE *)self + 24) & 6) != 0 && (*((_BYTE *)&self->mTrackedProperties + 28) & 1) != 0)
  {
    v3 = 64;
    return *(_WORD *)((char *)&self->super.isa + v3);
  }
  if ((*((_BYTE *)self + 24) & 5) != 0 && (*((_BYTE *)&self->mOriginalProperties + 28) & 1) != 0)
  {
    v3 = 32;
    return *(_WORD *)((char *)&self->super.isa + v3);
  }
  return 0;
}

- (BOOL)isWidthBeforeOverridden
{
  uint64_t v2;

  if ((*((_BYTE *)self + 24) & 2) != 0)
  {
    v2 = 92;
    return *((_BYTE *)&self->super.isa + v2) & 1;
  }
  if ((*((_BYTE *)self + 24) & 4) == 0)
  {
    if ((*((_BYTE *)self + 24) & 1) != 0)
    {
LABEL_10:
      v2 = 60;
      return *((_BYTE *)&self->super.isa + v2) & 1;
    }
    return 0;
  }
  if ((*((_BYTE *)&self->mTrackedProperties + 28) & 1) == 0)
  {
    if ((*((_BYTE *)self + 24) & 1) != 0 || (*((_BYTE *)&self->mOriginalProperties + 28) & 1) != 0)
      goto LABEL_10;
    return 0;
  }
  return 1;
}

- (int)widthBeforeType
{
  uint64_t v3;

  if ((*((_BYTE *)self + 24) & 6) != 0 && (*((_BYTE *)&self->mTrackedProperties + 28) & 2) != 0)
  {
    v3 = 68;
  }
  else
  {
    if ((*((_BYTE *)self + 24) & 5) == 0 || (*((_BYTE *)&self->mOriginalProperties + 28) & 2) == 0)
      return 1;
    v3 = 36;
  }
  return *(_DWORD *)((char *)&self->super.isa + v3);
}

- (BOOL)isWidthBeforeTypeOverridden
{
  int v2;
  _BOOL4 v3;

  if ((*((_BYTE *)self + 24) & 2) != 0)
  {
    v2 = *((_BYTE *)&self->mTrackedProperties + 28) & 2;
  }
  else
  {
    if ((*((_BYTE *)self + 24) & 4) == 0)
    {
      if ((*((_BYTE *)self + 24) & 1) != 0)
        return (*((unsigned __int8 *)&self->mOriginalProperties + 28) >> 1) & 1;
      goto LABEL_10;
    }
    if ((*((_BYTE *)&self->mTrackedProperties + 28) & 2) == 0)
    {
      if ((*((_BYTE *)self + 24) & 1) != 0 || (*((_BYTE *)&self->mOriginalProperties + 28) & 2) != 0)
        return (*((unsigned __int8 *)&self->mOriginalProperties + 28) >> 1) & 1;
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    v2 = *((_BYTE *)&self->mTrackedProperties + 28) & 2;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (signed)widthAfter
{
  uint64_t v3;

  if ((*((_BYTE *)self + 24) & 6) != 0 && (*((_BYTE *)&self->mTrackedProperties + 28) & 4) != 0)
  {
    v3 = 72;
    return *(_WORD *)((char *)&self->super.isa + v3);
  }
  if ((*((_BYTE *)self + 24) & 5) != 0 && (*((_BYTE *)&self->mOriginalProperties + 28) & 4) != 0)
  {
    v3 = 40;
    return *(_WORD *)((char *)&self->super.isa + v3);
  }
  return 0;
}

- (BOOL)isWidthAfterOverridden
{
  int v2;
  _BOOL4 v3;

  if ((*((_BYTE *)self + 24) & 2) != 0)
  {
    v2 = *((_BYTE *)&self->mTrackedProperties + 28) & 4;
  }
  else
  {
    if ((*((_BYTE *)self + 24) & 4) == 0)
    {
      if ((*((_BYTE *)self + 24) & 1) != 0)
        return (*((unsigned __int8 *)&self->mOriginalProperties + 28) >> 2) & 1;
      goto LABEL_10;
    }
    if ((*((_BYTE *)&self->mTrackedProperties + 28) & 4) == 0)
    {
      if ((*((_BYTE *)self + 24) & 1) != 0 || (*((_BYTE *)&self->mOriginalProperties + 28) & 4) != 0)
        return (*((unsigned __int8 *)&self->mOriginalProperties + 28) >> 2) & 1;
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    v2 = *((_BYTE *)&self->mTrackedProperties + 28) & 4;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (int)widthAfterType
{
  uint64_t v3;

  if ((*((_BYTE *)self + 24) & 6) != 0 && (*((_BYTE *)&self->mTrackedProperties + 28) & 8) != 0)
  {
    v3 = 76;
  }
  else
  {
    if ((*((_BYTE *)self + 24) & 5) == 0 || (*((_BYTE *)&self->mOriginalProperties + 28) & 8) == 0)
      return 1;
    v3 = 44;
  }
  return *(_DWORD *)((char *)&self->super.isa + v3);
}

- (BOOL)isWidthAfterTypeOverridden
{
  int v2;
  _BOOL4 v3;

  if ((*((_BYTE *)self + 24) & 2) != 0)
  {
    v2 = *((_BYTE *)&self->mTrackedProperties + 28) & 8;
  }
  else
  {
    if ((*((_BYTE *)self + 24) & 4) == 0)
    {
      if ((*((_BYTE *)self + 24) & 1) != 0)
        return (*((unsigned __int8 *)&self->mOriginalProperties + 28) >> 3) & 1;
      goto LABEL_10;
    }
    if ((*((_BYTE *)&self->mTrackedProperties + 28) & 8) == 0)
    {
      if ((*((_BYTE *)self + 24) & 1) != 0 || (*((_BYTE *)&self->mOriginalProperties + 28) & 8) != 0)
        return (*((unsigned __int8 *)&self->mOriginalProperties + 28) >> 3) & 1;
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    v2 = *((_BYTE *)&self->mTrackedProperties + 28) & 8;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (int)heightType
{
  uint64_t v3;

  if ((*((_BYTE *)self + 24) & 6) != 0 && (*((_BYTE *)&self->mTrackedProperties + 28) & 0x20) != 0)
  {
    v3 = 88;
  }
  else
  {
    if ((*((_BYTE *)self + 24) & 5) == 0 || (*((_BYTE *)&self->mOriginalProperties + 28) & 0x20) == 0)
      return 1;
    v3 = 56;
  }
  return *(_DWORD *)((char *)&self->super.isa + v3);
}

- (BOOL)isHeightTypeOverridden
{
  int v2;
  _BOOL4 v3;

  if ((*((_BYTE *)self + 24) & 2) != 0)
  {
    v2 = *((_BYTE *)&self->mTrackedProperties + 28) & 0x20;
  }
  else
  {
    if ((*((_BYTE *)self + 24) & 4) == 0)
    {
      if ((*((_BYTE *)self + 24) & 1) != 0)
        return (*((unsigned __int8 *)&self->mOriginalProperties + 28) >> 5) & 1;
      goto LABEL_10;
    }
    if ((*((_BYTE *)&self->mTrackedProperties + 28) & 0x20) == 0)
    {
      if ((*((_BYTE *)self + 24) & 1) != 0 || (*((_BYTE *)&self->mOriginalProperties + 28) & 0x20) != 0)
        return (*((unsigned __int8 *)&self->mOriginalProperties + 28) >> 5) & 1;
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    v2 = *((_BYTE *)&self->mTrackedProperties + 28) & 0x20;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (BOOL)header
{
  if ((*((_BYTE *)self + 24) & 6) != 0 && *((char *)&self->mTrackedProperties + 28) < 0)
    LODWORD(self) = (*((unsigned __int8 *)&self->mTrackedProperties + 28) >> 6) & 1;
  else
    LOBYTE(self) = (*((_BYTE *)self + 24) & 5) != 0
                && *((char *)&self->mOriginalProperties + 28) < 0
                && (*((_BYTE *)&self->mOriginalProperties + 28) & 0x40) != 0;
  return (char)self;
}

- (BOOL)isHeaderOverridden
{
  int v2;
  int v3;

  if ((*((_BYTE *)self + 24) & 2) != 0)
  {
    LOBYTE(v2) = *((_BYTE *)&self->mTrackedProperties + 28);
  }
  else
  {
    if ((*((_BYTE *)self + 24) & 4) == 0)
    {
      if ((*((_BYTE *)self + 24) & 1) != 0)
      {
LABEL_11:
        v3 = *((char *)&self->mOriginalProperties + 28);
        return v3 < 0;
      }
      return 0;
    }
    v2 = *((char *)&self->mTrackedProperties + 28);
    if ((v2 & 0x80000000) == 0)
    {
      if ((*((_BYTE *)self + 24) & 1) != 0 || *((char *)&self->mOriginalProperties + 28) < 0)
        goto LABEL_11;
      return 0;
    }
  }
  v3 = (char)v2;
  return v3 < 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  WDTableRowProperties *v4;
  uint64_t v5;
  WDTableProperties *mTableProperties;
  char v7;
  char v8;
  __int128 v9;
  __int128 v10;
  WDTableRowProperties *v11;

  v4 = -[WDTableRowProperties init](+[WDTableRowProperties allocWithZone:](WDTableRowProperties, "allocWithZone:", a3), "init");
  if (v4)
  {
    v5 = -[WDTableProperties copy](self->mTableProperties, "copy");
    mTableProperties = v4->mTableProperties;
    v4->mTableProperties = (WDTableProperties *)v5;

    v7 = *((_BYTE *)v4 + 24) & 0xFE | *((_BYTE *)self + 24) & 1;
    *((_BYTE *)v4 + 24) = v7;
    v8 = v7 & 0xFD | (2 * ((*((_BYTE *)self + 24) & 2) != 0));
    *((_BYTE *)v4 + 24) = v8;
    *((_BYTE *)v4 + 24) = v8 & 0xFB | *((_BYTE *)self + 24) & 4;
    v9 = *(_OWORD *)&self->mOriginalProperties.height;
    *(_OWORD *)&v4->mOriginalProperties.widthBefore = *(_OWORD *)&self->mOriginalProperties.widthBefore;
    *(_OWORD *)&v4->mOriginalProperties.height = v9;
    v10 = *(_OWORD *)&self->mTrackedProperties.height;
    *(_OWORD *)&v4->mTrackedProperties.widthBefore = *(_OWORD *)&self->mTrackedProperties.widthBefore;
    *(_OWORD *)&v4->mTrackedProperties.height = v10;
    v11 = v4;
  }

  return v4;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDTableRowProperties;
  -[WDTableRowProperties description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mCharacterProperties, 0);
  objc_storeStrong((id *)&self->mTableProperties, 0);
}

- (void)addPropertiesValues:(id *)a3 to:(id *)a4
{
  char v4;
  char v5;

  v4 = *((_BYTE *)a4 + 28);
  if ((v4 & 1) == 0 && (*((_BYTE *)a3 + 28) & 1) != 0)
  {
    v4 |= 1u;
    *((_BYTE *)a4 + 28) = v4;
    a4->var0 = a3->var0;
  }
  if ((v4 & 2) == 0 && (*((_BYTE *)a3 + 28) & 2) != 0)
  {
    v4 |= 2u;
    *((_BYTE *)a4 + 28) = v4;
    a4->var1 = a3->var1;
  }
  if ((v4 & 4) == 0 && (*((_BYTE *)a3 + 28) & 4) != 0)
  {
    v4 |= 4u;
    *((_BYTE *)a4 + 28) = v4;
    a4->var2 = a3->var2;
  }
  if ((v4 & 8) == 0 && (*((_BYTE *)a3 + 28) & 8) != 0)
  {
    v4 |= 8u;
    *((_BYTE *)a4 + 28) = v4;
    a4->var3 = a3->var3;
  }
  if ((v4 & 0x10) == 0 && (*((_BYTE *)a3 + 28) & 0x10) != 0)
  {
    v4 |= 0x10u;
    *((_BYTE *)a4 + 28) = v4;
    a4->var4 = a3->var4;
  }
  if ((v4 & 0x20) == 0 && (*((_BYTE *)a3 + 28) & 0x20) != 0)
  {
    v4 |= 0x20u;
    *((_BYTE *)a4 + 28) = v4;
    a4->var5 = a3->var5;
  }
  if ((v4 & 0x80) == 0 && *((char *)a3 + 28) < 0)
  {
    v5 = v4 | 0x80;
    *((_BYTE *)a4 + 28) = v5;
    *((_BYTE *)a4 + 28) = *((_BYTE *)a3 + 28) & 0x40 | v5 & 0xBF;
  }
}

@end
