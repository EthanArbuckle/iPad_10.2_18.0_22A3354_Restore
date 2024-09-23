@implementation CRLPositiveZeroNumberFormatter

- (id)stringForObjectValue:(id)a3
{
  _UNKNOWN **v4;
  float v5;
  double v6;
  void *v7;
  float v8;
  float v9;
  double v10;
  double v11;
  double v12;
  id v14;
  void *v15;
  objc_super v17;

  v4 = (_UNKNOWN **)a3;
  if ((objc_opt_respondsToSelector(v4, "floatValue") & 1) != 0)
  {
    objc_msgSend(v4, "floatValue");
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPositiveZeroNumberFormatter multiplier](self, "multiplier"));
    objc_msgSend(v7, "floatValue");
    v9 = v8;

    v10 = v9;
    if (v9 == 0.0)
      v10 = 1.0;
    v11 = v10 * v6;
    v12 = pow(0.1, (double)(unint64_t)-[CRLPositiveZeroNumberFormatter maximumFractionDigits](self, "maximumFractionDigits"))* -0.5;
    if (v11 <= 0.0 && v11 > v12)
    {

      v4 = &off_1012CC2F8;
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)CRLPositiveZeroNumberFormatter;
  v14 = -[CRLPositiveZeroNumberFormatter stringForObjectValue:](&v17, "stringForObjectValue:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  return v15;
}

@end
