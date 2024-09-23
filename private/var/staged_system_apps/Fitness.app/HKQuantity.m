@implementation HKQuantity

+ (id)ch_quantityWithBeatsPerMinute:(double)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[HKUnit _countPerMinuteUnit](HKUnit, "_countPerMinuteUnit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v4, a3));

  return v5;
}

- (double)ch_beatsPerMinute
{
  void *v3;
  double v4;
  double v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[HKUnit _countPerMinuteUnit](HKUnit, "_countPerMinuteUnit"));
  -[HKQuantity doubleValueForUnit:](self, "doubleValueForUnit:", v3);
  v5 = v4;

  return v5;
}

@end
