@implementation WFEventSignificantFigureValueTransformer

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 0;
}

- (id)transformedValue:(id)a3
{
  float v3;
  float v4;
  double v5;
  double v6;

  if (!a3)
    return 0;
  objc_msgSend(a3, "floatValue");
  v4 = v3;
  v5 = log10(fabsf(v3));
  v6 = __exp10((double)(int)(vcvtpd_s64_f64(v5) - 2));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6 * round(v4 / v6));
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
