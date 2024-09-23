@implementation OADPercentTextSpacing

- (OADPercentTextSpacing)initWithPercent:(float)a3
{
  OADPercentTextSpacing *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OADPercentTextSpacing;
  result = -[OADPercentTextSpacing init](&v5, sel_init);
  if (result)
    result->mPercent = a3;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  float mPercent;
  float v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    mPercent = self->mPercent;
    objc_msgSend(v4, "percent");
    v7 = mPercent == v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (float)percent
{
  return self->mPercent;
}

- (unint64_t)hash
{
  return (unint64_t)self->mPercent;
}

@end
