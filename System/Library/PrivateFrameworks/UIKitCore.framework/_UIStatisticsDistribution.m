@implementation _UIStatisticsDistribution

- (void)startTimingForObject:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedLongLong:", +[_UIStatistics currentTime](_UIStatistics, "currentTime"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(v5, self, v6, (void *)0x303);

}

- (void)recordTimingForObject:(id)a3
{
  void *v4;
  void *v5;
  id object;

  object = a3;
  objc_getAssociatedObject(object, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    -[_UIStatistics _recordDistributionTime:](self, "_recordDistributionTime:", objc_msgSend(v4, "unsignedLongLongValue"));
    objc_setAssociatedObject(object, self, 0, (void *)0x303);
  }

}

- (BOOL)isTimingForObject:(id)a3
{
  void *v3;
  BOOL v4;

  objc_getAssociatedObject(a3, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)cancelTimingForObject:(id)a3
{
  objc_setAssociatedObject(a3, self, 0, (void *)0x303);
}

@end
