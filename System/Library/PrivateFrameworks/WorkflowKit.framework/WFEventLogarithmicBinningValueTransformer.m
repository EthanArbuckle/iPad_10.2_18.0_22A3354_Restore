@implementation WFEventLogarithmicBinningValueTransformer

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
  double v3;
  double v4;
  double v5;
  long double v6;

  if (!a3)
    return 0;
  objc_msgSend(a3, "doubleValue");
  v4 = v3;
  v5 = log2(fabs(v3));
  v6 = exp2(round(v5));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)(v6 * round(v4 / v6)));
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
