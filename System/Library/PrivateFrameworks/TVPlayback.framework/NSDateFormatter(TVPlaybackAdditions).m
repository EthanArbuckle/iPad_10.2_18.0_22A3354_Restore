@implementation NSDateFormatter(TVPlaybackAdditions)

- (BOOL)tvp_doCurrentSettingsUse24HourFormat
{
  void *v0;
  void *v1;
  void *v2;
  _BOOL8 v3;

  v0 = (void *)MEMORY[0x24BDD1500];
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dateFormatFromTemplate:options:locale:", CFSTR("j"), 0, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "rangeOfString:", CFSTR("a")) == 0x7FFFFFFFFFFFFFFFLL;
  return v3;
}

- (id)tvp_hourMinuteDisplayStringFromDate:()TVPlaybackAdditions
{
  void *v4;
  id v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v4 = (void *)MEMORY[0x24BDBCEA0];
  v5 = a3;
  objc_msgSend(v4, "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("HH:mm");
  if ((objc_msgSend(a1, "tvp_doCurrentSettingsUse24HourFormat") & 1) == 0)
  {
    if (objc_msgSend(v6, "positionOfDayPeriodInFormattedTime") == 1)
    {
      v7 = CFSTR("a h:mm");
    }
    else if (objc_msgSend(v6, "positionOfDayPeriodInFormattedTime") == 2)
    {
      v7 = CFSTR("h:mm a");
    }
  }
  objc_msgSend(a1, "setDateFormat:", v7);
  objc_msgSend(a1, "stringFromDate:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)tvp_ISO8601CombinedDateAndTimeFormatter
{
  if (tvp_ISO8601CombinedDateAndTimeFormatter_onceToken != -1)
    dispatch_once(&tvp_ISO8601CombinedDateAndTimeFormatter_onceToken, &__block_literal_global_12);
  return (id)tvp_ISO8601CombinedDateAndTimeFormatter_iso8601Formatter;
}

+ (id)tvp_RFC1123DateFormatter
{
  if (tvp_RFC1123DateFormatter_pred != -1)
    dispatch_once(&tvp_RFC1123DateFormatter_pred, &__block_literal_global_20);
  return (id)tvp_RFC1123DateFormatter_rfc1123Formatter;
}

+ (id)tvp_RFC850DateFormatter
{
  if (tvp_RFC850DateFormatter_pred != -1)
    dispatch_once(&tvp_RFC850DateFormatter_pred, &__block_literal_global_23);
  return (id)tvp_RFC850DateFormatter_rfc850Formatter;
}

+ (id)tvp_asctimeDateFormatter
{
  if (tvp_asctimeDateFormatter_pred != -1)
    dispatch_once(&tvp_asctimeDateFormatter_pred, &__block_literal_global_26);
  return (id)tvp_asctimeDateFormatter_asctimeFormatter;
}

@end
