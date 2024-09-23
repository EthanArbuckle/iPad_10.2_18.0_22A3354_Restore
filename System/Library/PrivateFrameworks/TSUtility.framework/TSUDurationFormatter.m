@implementation TSUDurationFormatter

- (TSUDurationFormatter)init
{
  TSUDurationFormatter *v2;
  TSUDurationFormatter *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSUDurationFormatter;
  v2 = -[TSUDurationFormatter init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[TSUDurationFormatter p_commonInit](v2, "p_commonInit");
  return v3;
}

- (TSUDurationFormatter)initWithCoder:(id)a3
{
  TSUDurationFormatter *v3;
  TSUDurationFormatter *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSUDurationFormatter;
  v3 = -[TSUDurationFormatter initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[TSUDurationFormatter p_commonInit](v3, "p_commonInit");
  return v4;
}

- (void)p_commonInit
{
  self->mFormat = (NSString *)objc_msgSend(CFSTR("hh:mm:ss"), "copy");
  self->mCompactStyleStartUnit = 0;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSUDurationFormatter;
  -[TSUDurationFormatter dealloc](&v3, sel_dealloc);
}

- (id)stringForObjectValue:(id)a3
{
  double v5;

  if (!a3 || (objc_opt_respondsToSelector() & 1) == 0)
    return &stru_24D61C228;
  objc_msgSend(a3, "doubleValue");
  return (id)TSUDurationFormatterStringFromTimeIntervalWithFormatAndRoundingAndSingularOption(-[TSUDurationFormatter format](self, "format"), 0, 0, v5);
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  int started;
  double v9;

  v9 = NAN;
  started = TSUDurationFormatterTimeIntervalFromStringWithCompactStyleStartUnit(a4, &v9, 0, 0, -[TSUDurationFormatter compactStyleStartUnit](self, "compactStyleStartUnit"));
  if (started)
  {
    *a3 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v9);
  }
  else if (a5)
  {
    *a5 = (id)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("The time is invalid."), &stru_24D61C228, CFSTR("TSUtility"));
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

- (int)compactStyleStartUnit
{
  return self->mCompactStyleStartUnit;
}

- (void)setCompactStyleStartUnit:(int)a3
{
  self->mCompactStyleStartUnit = a3;
}

@end
