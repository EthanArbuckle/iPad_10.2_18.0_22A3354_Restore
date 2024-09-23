@implementation NSDate(WBAdditions)

+ (id)tc_dateWithWordDate:()WBAdditions
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setYear:", a3[10] + 1900);
  objc_msgSend(v4, "setMonth:", a3[9]);
  objc_msgSend(v4, "setDay:", a3[8]);
  objc_msgSend(v4, "setHour:", a3[7]);
  objc_msgSend(v4, "setMinute:", a3[6]);
  objc_msgSend(v5, "dateFromComponents:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)tc_copyToWordDate:()WBAdditions
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = a1;
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x24BDBCE60]);
    objc_msgSend(a1, "timeIntervalSinceReferenceDate");
    v5 = (id)objc_msgSend(v6, "initWithTimeIntervalSinceReferenceDate:");
  }
  v9 = v5;
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "components:fromDate:", 638, v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  *(_WORD *)(a3 + 12) = objc_msgSend(v8, "minute");
  *(_WORD *)(a3 + 14) = objc_msgSend(v8, "hour");
  *(_DWORD *)(a3 + 8) = objc_msgSend(v8, "weekday") - 1;
  *(_WORD *)(a3 + 16) = objc_msgSend(v8, "day");
  *(_WORD *)(a3 + 18) = objc_msgSend(v8, "month");
  *(_WORD *)(a3 + 20) = objc_msgSend(v8, "year") - 1900;

}

@end
