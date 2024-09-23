@implementation OITSUPositiveZeroNumberFormatter

- (id)stringForObjectValue:(id)a3
{
  float v5;
  double v6;
  float v7;
  double v8;
  BOOL v9;
  double v10;
  double v11;
  objc_super v14;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a3, "floatValue");
    v6 = v5;
    objc_msgSend((id)-[OITSUPositiveZeroNumberFormatter multiplier](self, "multiplier"), "floatValue");
    v8 = v7;
    v9 = v7 == 0.0;
    v10 = 1.0;
    if (!v9)
      v10 = v8;
    v11 = v10 * v6;
    if (v11 > pow(0.1, (double)(unint64_t)-[OITSUPositiveZeroNumberFormatter maximumFractionDigits](self, "maximumFractionDigits"))* -0.5&& v11 <= 0.0)
    {
      a3 = &unk_24F46A3A8;
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)OITSUPositiveZeroNumberFormatter;
  return -[OITSUPositiveZeroNumberFormatter stringForObjectValue:](&v14, sel_stringForObjectValue_, a3);
}

@end
