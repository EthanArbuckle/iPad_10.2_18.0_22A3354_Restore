@implementation NSDate(RelativeDateKnowledge)

- (BOOL)ics_isTodayWithCalendar:()RelativeDateKnowledge
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL8 v13;

  v4 = (void *)MEMORY[0x24BDBCE60];
  v5 = a3;
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 30, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "components:fromDate:", 30, a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "day");
  if (v9 == objc_msgSend(v8, "day")
    && (v10 = objc_msgSend(v7, "month"), v10 == objc_msgSend(v8, "month"))
    && (v11 = objc_msgSend(v7, "year"), v11 == objc_msgSend(v8, "year")))
  {
    v12 = objc_msgSend(v7, "era");
    v13 = v12 == objc_msgSend(v8, "era");
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
