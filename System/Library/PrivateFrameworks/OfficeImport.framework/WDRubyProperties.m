@implementation WDRubyProperties

- (WDRubyProperties)init
{
  WDRubyProperties *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDRubyProperties;
  result = -[WDRubyProperties init](&v3, sel_init);
  if (result)
  {
    result->mOriginalProperties = 0;
    *((_BYTE *)result + 8) |= 1u;
  }
  return result;
}

- (void)dealloc
{
  $7CA38995D2C7B2F315991FE40B01BD5D *mOriginalProperties;
  objc_super v4;

  mOriginalProperties = self->mOriginalProperties;
  if (mOriginalProperties)
  {
    MEMORY[0x22E2DD408](mOriginalProperties, 0x1000C40977131E8);
    self->mOriginalProperties = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)WDRubyProperties;
  -[WDRubyProperties dealloc](&v4, sel_dealloc);
}

- (BOOL)isAnythingOverridden
{
  return -[WDRubyProperties isAnythingOverriddenIn:](self, "isAnythingOverriddenIn:", self->mOriginalProperties);
}

- (int)alignment
{
  $7CA38995D2C7B2F315991FE40B01BD5D *mOriginalProperties;
  int result;

  mOriginalProperties = self->mOriginalProperties;
  if (!mOriginalProperties)
    return 0;
  result = mOriginalProperties->var0;
  if (!mOriginalProperties->var0)
    return 0;
  return result;
}

- (void)setAlignment:(int)a3
{
  uint64_t mOriginalProperties;

  mOriginalProperties = (uint64_t)self->mOriginalProperties;
  if (!mOriginalProperties)
  {
    mOriginalProperties = operator new();
    *(_QWORD *)(mOriginalProperties + 8) = 0;
    *(_QWORD *)(mOriginalProperties + 16) = 0;
    *(_QWORD *)mOriginalProperties = 0;
    self->mOriginalProperties = ($7CA38995D2C7B2F315991FE40B01BD5D *)mOriginalProperties;
  }
  *(_DWORD *)mOriginalProperties = a3;
  *(_BYTE *)(mOriginalProperties + 16) = 1;
}

- (BOOL)isAlignmentOverridden
{
  $7CA38995D2C7B2F315991FE40B01BD5D *mOriginalProperties;

  mOriginalProperties = self->mOriginalProperties;
  return mOriginalProperties && mOriginalProperties->var5;
}

- (void)clearAlignment
{
  $7CA38995D2C7B2F315991FE40B01BD5D *mOriginalProperties;

  mOriginalProperties = self->mOriginalProperties;
  mOriginalProperties->var5 = 0;
  mOriginalProperties->var0 = 0;
}

- (unsigned)phoneticGuideFontSize
{
  $7CA38995D2C7B2F315991FE40B01BD5D *mOriginalProperties;
  unsigned __int16 result;

  mOriginalProperties = self->mOriginalProperties;
  if (!mOriginalProperties)
    return 0;
  result = mOriginalProperties->var1;
  if (!result)
    return 0;
  return result;
}

- (void)setPhoneticGuideFontSize:(unsigned __int16)a3
{
  uint64_t mOriginalProperties;

  mOriginalProperties = (uint64_t)self->mOriginalProperties;
  if (!mOriginalProperties)
  {
    mOriginalProperties = operator new();
    *(_QWORD *)(mOriginalProperties + 8) = 0;
    *(_QWORD *)(mOriginalProperties + 16) = 0;
    *(_QWORD *)mOriginalProperties = 0;
    self->mOriginalProperties = ($7CA38995D2C7B2F315991FE40B01BD5D *)mOriginalProperties;
  }
  *(_WORD *)(mOriginalProperties + 4) = a3;
  *(_BYTE *)(mOriginalProperties + 17) = 1;
}

- (BOOL)isPhoneticGuideFontSizeOverridden
{
  $7CA38995D2C7B2F315991FE40B01BD5D *mOriginalProperties;

  mOriginalProperties = self->mOriginalProperties;
  return mOriginalProperties && mOriginalProperties->var6;
}

- (void)clearPhoneticGuideFontSize
{
  $7CA38995D2C7B2F315991FE40B01BD5D *mOriginalProperties;

  mOriginalProperties = self->mOriginalProperties;
  mOriginalProperties->var6 = 0;
  mOriginalProperties->var1 = 0;
}

- (unsigned)baseFontSize
{
  $7CA38995D2C7B2F315991FE40B01BD5D *mOriginalProperties;
  unsigned __int16 result;

  mOriginalProperties = self->mOriginalProperties;
  if (!mOriginalProperties)
    return 0;
  result = mOriginalProperties->var2;
  if (!result)
    return 0;
  return result;
}

- (void)setBaseFontSize:(unsigned __int16)a3
{
  uint64_t mOriginalProperties;

  mOriginalProperties = (uint64_t)self->mOriginalProperties;
  if (!mOriginalProperties)
  {
    mOriginalProperties = operator new();
    *(_QWORD *)(mOriginalProperties + 8) = 0;
    *(_QWORD *)(mOriginalProperties + 16) = 0;
    *(_QWORD *)mOriginalProperties = 0;
    self->mOriginalProperties = ($7CA38995D2C7B2F315991FE40B01BD5D *)mOriginalProperties;
  }
  *(_WORD *)(mOriginalProperties + 6) = a3;
  *(_BYTE *)(mOriginalProperties + 18) = 1;
}

- (BOOL)isBaseFontSizeOverridden
{
  $7CA38995D2C7B2F315991FE40B01BD5D *mOriginalProperties;

  mOriginalProperties = self->mOriginalProperties;
  return mOriginalProperties && mOriginalProperties->var7;
}

- (void)clearBaseFontSize
{
  $7CA38995D2C7B2F315991FE40B01BD5D *mOriginalProperties;

  mOriginalProperties = self->mOriginalProperties;
  mOriginalProperties->var7 = 0;
  mOriginalProperties->var2 = 0;
}

- (unsigned)distanceBetween
{
  $7CA38995D2C7B2F315991FE40B01BD5D *mOriginalProperties;
  unsigned __int16 result;

  mOriginalProperties = self->mOriginalProperties;
  if (!mOriginalProperties)
    return 0;
  result = mOriginalProperties->var3;
  if (!result)
    return 0;
  return result;
}

- (void)setDistanceBetween:(unsigned __int16)a3
{
  uint64_t mOriginalProperties;

  mOriginalProperties = (uint64_t)self->mOriginalProperties;
  if (!mOriginalProperties)
  {
    mOriginalProperties = operator new();
    *(_QWORD *)(mOriginalProperties + 8) = 0;
    *(_QWORD *)(mOriginalProperties + 16) = 0;
    *(_QWORD *)mOriginalProperties = 0;
    self->mOriginalProperties = ($7CA38995D2C7B2F315991FE40B01BD5D *)mOriginalProperties;
  }
  *(_WORD *)(mOriginalProperties + 8) = a3;
  *(_BYTE *)(mOriginalProperties + 19) = 1;
}

- (BOOL)isDistanceBetweenOverridden
{
  $7CA38995D2C7B2F315991FE40B01BD5D *mOriginalProperties;

  mOriginalProperties = self->mOriginalProperties;
  return mOriginalProperties && mOriginalProperties->var8;
}

- (void)clearDistanceBetween
{
  $7CA38995D2C7B2F315991FE40B01BD5D *mOriginalProperties;

  mOriginalProperties = self->mOriginalProperties;
  mOriginalProperties->var8 = 0;
  mOriginalProperties->var3 = 0;
}

- (int)phoneticGuideLanguage
{
  $7CA38995D2C7B2F315991FE40B01BD5D *mOriginalProperties;
  int result;

  mOriginalProperties = self->mOriginalProperties;
  if (!mOriginalProperties)
    return 9;
  result = mOriginalProperties->var4;
  if (!result)
    return 9;
  return result;
}

- (void)setPhoneticGuideLanguage:(int)a3
{
  uint64_t mOriginalProperties;

  mOriginalProperties = (uint64_t)self->mOriginalProperties;
  if (!mOriginalProperties)
  {
    mOriginalProperties = operator new();
    *(_QWORD *)(mOriginalProperties + 8) = 0;
    *(_QWORD *)(mOriginalProperties + 16) = 0;
    *(_QWORD *)mOriginalProperties = 0;
    self->mOriginalProperties = ($7CA38995D2C7B2F315991FE40B01BD5D *)mOriginalProperties;
  }
  *(_DWORD *)(mOriginalProperties + 12) = a3;
  *(_BYTE *)(mOriginalProperties + 20) = 1;
}

- (BOOL)isPhoneticGuideLanguageOverridden
{
  $7CA38995D2C7B2F315991FE40B01BD5D *mOriginalProperties;

  mOriginalProperties = self->mOriginalProperties;
  return mOriginalProperties && mOriginalProperties->var9;
}

- (void)clearPhoneticGuideLanguage
{
  $7CA38995D2C7B2F315991FE40B01BD5D *mOriginalProperties;

  mOriginalProperties = self->mOriginalProperties;
  mOriginalProperties->var9 = 0;
  mOriginalProperties->var4 = 0xFFFF;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDRubyProperties;
  -[WDRubyProperties description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isAnythingOverriddenIn:(id *)a3
{
  if (!a3)
    return 0;
  if (a3->var5 || a3->var6 || a3->var7 || a3->var8)
    return 1;
  return a3->var9;
}

@end
