@implementation OITSUDurationFormatter

- (OITSUDurationFormatter)initWithLocale:(id)a3
{
  OITSUDurationFormatter *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OITSUDurationFormatter;
  v4 = -[OITSUDurationFormatter init](&v6, sel_init);
  if (v4)
  {
    v4->mLocale = (OITSULocale *)a3;
    -[OITSUDurationFormatter p_commonInit](v4, "p_commonInit");
  }
  return v4;
}

- (OITSUDurationFormatter)init
{
  OITSUDurationFormatter *v2;
  OITSUDurationFormatter *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OITSUDurationFormatter;
  v2 = -[OITSUDurationFormatter init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[OITSUDurationFormatter p_commonInit](v2, "p_commonInit");
  return v3;
}

- (OITSUDurationFormatter)initWithCoder:(id)a3
{
  OITSUDurationFormatter *v3;
  OITSUDurationFormatter *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OITSUDurationFormatter;
  v3 = -[OITSUDurationFormatter initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[OITSUDurationFormatter p_commonInit](v3, "p_commonInit");
  return v4;
}

- (void)p_commonInit
{
  self->mFormat = (NSString *)objc_msgSend(CFSTR("hh:mm:ss"), "copy");
  self->mCompactStyleStartUnit = 0;
  if (!self->mLocale)
    self->mLocale = (OITSULocale *)+[OITSULocale currentLocale](OITSULocale, "currentLocale");
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OITSUDurationFormatter;
  -[OITSUDurationFormatter dealloc](&v3, sel_dealloc);
}

- (id)stringForObjectValue:(id)a3
{
  double v5;

  if (!a3 || (objc_opt_respondsToSelector() & 1) == 0)
    return &stru_24F3BFFF8;
  objc_msgSend(a3, "doubleValue");
  return (id)TSUDurationFormatterStringFromTimeIntervalWithFormatAndRounding(-[OITSUDurationFormatter format](self, "format"), 1, -[OITSUDurationFormatter locale](self, "locale"), v5);
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  int started;
  double v9;

  v9 = NAN;
  started = TSUDurationFormatterTimeIntervalFromStringWithCompactStyleStartUnit(a4, &v9, 0, 0, -[OITSUDurationFormatter compactStyleStartUnit](self, "compactStyleStartUnit"), -[OITSUDurationFormatter locale](self, "locale"));
  if (started)
  {
    *a3 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v9);
  }
  else if (a5)
  {
    *a5 = (id)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("The time is invalid."), &stru_24F3BFFF8, CFSTR("TSUtility"));
  }
  return started;
}

- (NSString)format
{
  return self->mFormat;
}

- (void)setFormat:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (OITSULocale)locale
{
  return self->mLocale;
}

- (int)compactStyleStartUnit
{
  return self->mCompactStyleStartUnit;
}

- (void)setCompactStyleStartUnit:(int)a3
{
  self->mCompactStyleStartUnit = a3;
}

@end
