@implementation NSMeasurement(VGExtras)

- (BOOL)isGreaterThanMeasurement:()VGExtras
{
  return objc_msgSend(a1, "compare:") == 1;
}

- (BOOL)isLessThanMeasurement:()VGExtras
{
  return objc_msgSend(a1, "compare:") == -1;
}

- (BOOL)isEqualToMeasurement:()VGExtras
{
  return objc_msgSend(a1, "compare:") == 0;
}

- (uint64_t)isGreaterThanOrEqualToMeasurement:()VGExtras
{
  return objc_msgSend(a1, "isLessThanMeasurement:") ^ 1;
}

- (uint64_t)isLessThanOrEqualToMeasurement:()VGExtras
{
  return objc_msgSend(a1, "isGreaterThanMeasurement:") ^ 1;
}

- (uint64_t)compare:()VGExtras
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v4 = a3;
  objc_msgSend(v4, "unit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "measurementByConvertingToUnit:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  objc_msgSend(v4, "doubleValue");
  v10 = v9;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "compare:", v12);

  return v13;
}

@end
