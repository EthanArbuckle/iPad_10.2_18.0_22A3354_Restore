@implementation ICSDate(ReminderKitAdditions)

- (id)rem_dateAsUTC
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99D78];
  objc_msgSend(a1, "components");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rem_dateWithDateComponents:timeZone:", v4, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)rem_dateWithICSCalendar:()ReminderKitAdditions
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "systemTimeZoneForDate:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99D78];
  objc_msgSend(a1, "components");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v5, "rem_dateWithDateComponents:timeZone:", v6, v4);
  else
    objc_msgSend(v5, "rem_dateWithDateComponentsUsingArchivingTimeZone:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
