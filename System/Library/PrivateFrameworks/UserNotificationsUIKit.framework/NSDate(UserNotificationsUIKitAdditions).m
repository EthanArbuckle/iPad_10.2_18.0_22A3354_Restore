@implementation NSDate(UserNotificationsUIKitAdditions)

- (uint64_t)_nc_hour
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "components:fromDate:", 32, a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimeZone:", v4);

  v5 = objc_msgSend(v3, "hour");
  return v5;
}

- (BOOL)nc_isMorning
{
  return (unint64_t)(objc_msgSend(a1, "_nc_hour") - 6) < 6;
}

- (BOOL)nc_isAfternoon
{
  return (unint64_t)(objc_msgSend(a1, "_nc_hour") - 12) < 5;
}

- (BOOL)nc_isEvening
{
  return (unint64_t)(objc_msgSend(a1, "_nc_hour") - 17) < 5;
}

- (BOOL)nc_isNight
{
  return (objc_msgSend(a1, "_nc_hour") & 0xFFFFFFFFFFFFFFFELL) == 22;
}

@end
