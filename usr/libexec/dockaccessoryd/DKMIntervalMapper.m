@implementation DKMIntervalMapper

+ (id)unsignedOpenClosedFixedIntervalMapper:(id)a3
{
  id v3;
  UnsignedFixedIntervalMapper *v4;

  v3 = a3;
  v4 = -[UnsignedFixedIntervalMapper initWithBins:intervalCreationBlock:valueComparisonBlock:]([UnsignedFixedIntervalMapper alloc], "initWithBins:intervalCreationBlock:valueComparisonBlock:", v3, &stru_100237E88, &stru_100237EC8);

  return v4;
}

+ (id)unsignedClosedOpenFixedIntervalMapper:(id)a3
{
  id v3;
  UnsignedFixedIntervalMapper *v4;

  v3 = a3;
  v4 = -[UnsignedFixedIntervalMapper initWithBins:intervalCreationBlock:valueComparisonBlock:]([UnsignedFixedIntervalMapper alloc], "initWithBins:intervalCreationBlock:valueComparisonBlock:", v3, &stru_100237EE8, &stru_100237F08);

  return v4;
}

- (id)intervalIndexForValue:(unint64_t)a3
{
  return 0;
}

- (id)intervalForValue:(unint64_t)a3
{
  return 0;
}

@end
