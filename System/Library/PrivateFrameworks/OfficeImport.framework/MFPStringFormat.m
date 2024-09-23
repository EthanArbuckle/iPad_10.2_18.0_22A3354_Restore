@implementation MFPStringFormat

- (MFPStringFormat)init
{
  MFPStringFormat *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFPStringFormat;
  result = -[MFPStringFormat init](&v3, sel_init);
  if (result)
    result->mTrimming = 1;
  return result;
}

- (void)dealloc
{
  float *mTabStops;
  objc_super v4;

  mTabStops = self->mTabStops;
  if (mTabStops)
    MEMORY[0x22E2DD3F0](mTabStops, 0x1000C8052888210);
  v4.receiver = self;
  v4.super_class = (Class)MFPStringFormat;
  -[MFPStringFormat dealloc](&v4, sel_dealloc);
}

- (int)alignment
{
  return self->mAlignment;
}

- (void)setAlignment:(int)a3
{
  self->mAlignment = a3;
}

- (unsigned)digitSubstitutionLanguage
{
  return self->mDigitSubstitutionLanguage;
}

- (void)setDigitSubstitutionLanguage:(unsigned __int16)a3
{
  self->mDigitSubstitutionLanguage = a3;
}

- (int)digitSubstitutionMethod
{
  return self->mDigitSubstitutionMethod;
}

- (void)setDigitSubstitutionMethod:(int)a3
{
  self->mDigitSubstitutionMethod = a3;
}

- (unsigned)formatFlags
{
  return self->mFormatFlags;
}

- (void)setFormatFlags:(unsigned int)a3
{
  self->mFormatFlags = a3;
}

- (int)hotkeyPrefix
{
  return self->mHotkeyPrefix;
}

- (void)setHotkeyPrefix:(int)a3
{
  self->mHotkeyPrefix = a3;
}

- (int)lineAlignment
{
  return self->mLineAlignment;
}

- (void)setLineAlignment:(int)a3
{
  self->mLineAlignment = a3;
}

- (float)firstTabOffset
{
  return self->mFirstTabOffset;
}

- (void)setFirstTabOffset:(float)a3
{
  self->mFirstTabOffset = a3;
}

- (int)tabStopCount
{
  return self->mTabStopCount;
}

- (const)tabStops
{
  return self->mTabStops;
}

- (void)setTabStops:(const float *)a3 count:(int)a4
{
  float *v6;
  uint64_t mTabStopCount;

  self->mTabStopCount = a4;
  v6 = (float *)operator new[]();
  self->mTabStops = v6;
  mTabStopCount = self->mTabStopCount;
  if ((int)mTabStopCount >= 1)
    memcpy(v6, a3, 4 * mTabStopCount);
}

- (int)trimming
{
  return self->mTrimming;
}

- (void)setTrimming:(int)a3
{
  self->mTrimming = a3;
}

@end
