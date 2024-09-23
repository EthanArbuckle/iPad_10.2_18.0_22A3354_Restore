@implementation NSDate(TestFlightCoreAdditions)

- (id)tf_timeFromNow
{
  void *v2;
  id v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x24BDBCE60]);
  objc_msgSend(v2, "components:fromDate:toDate:options:", 112, v3, a1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)tf_posixTimestampInMilliseconds
{
  double v1;

  objc_msgSend(a1, "timeIntervalSince1970");
  return (unint64_t)(v1 * 1000.0);
}

@end
