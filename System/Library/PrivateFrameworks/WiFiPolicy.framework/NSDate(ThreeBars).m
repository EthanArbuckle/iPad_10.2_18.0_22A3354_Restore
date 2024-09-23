@implementation NSDate(ThreeBars)

- (id)dateByAddingDays:()ThreeBars
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v5 = (void *)MEMORY[0x1D17AC818]();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:", 28, a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateFromComponents:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v9, "setDay:", a3);
  objc_msgSend(v6, "dateByAddingComponents:toDate:options:", v9, v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v5);
  return v10;
}

@end
