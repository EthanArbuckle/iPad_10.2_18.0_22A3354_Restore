@implementation NSDateComponentsFormatter(ScreenTimeAdditions)

+ (id)st_sharedAbbreviatedSecondsDateFormatter
{
  if (st_sharedAbbreviatedSecondsDateFormatter_onceToken != -1)
    dispatch_once(&st_sharedAbbreviatedSecondsDateFormatter_onceToken, &__block_literal_global_21);
  return (id)st_sharedAbbreviatedSecondsDateFormatter_usageTimeFormatter;
}

+ (id)st_sharedShortDynamicDateFormatter
{
  if (st_sharedShortDynamicDateFormatter_onceToken != -1)
    dispatch_once(&st_sharedShortDynamicDateFormatter_onceToken, &__block_literal_global_10);
  return (id)st_sharedShortDynamicDateFormatter_usageTimeFormatter;
}

@end
