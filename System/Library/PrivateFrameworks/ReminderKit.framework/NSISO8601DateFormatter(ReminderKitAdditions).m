@implementation NSISO8601DateFormatter(ReminderKitAdditions)

+ (id)rem_formatterWithTimeZone:()ReminderKitAdditions
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setTimeZone:", v3);
    objc_msgSend(v5, "setFormatOptions:", objc_msgSend(v5, "formatOptions") | 0x80);
  }

  return v5;
}

- (id)rem_dateComponentsFromString:()ReminderKitAdditions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "dateFromString:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0C99D78];
    objc_msgSend(a1, "timeZone");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "rem_dateComponentsWithDate:timeZone:isAllDay:", v2, v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)rem_stringFromDateComponents:()ReminderKitAdditions
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0C99D78];
  v5 = a3;
  objc_msgSend(a1, "timeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rem_dateWithDateComponents:timeZone:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "stringFromDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
