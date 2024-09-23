@implementation WFWeatherDataServiceParserV1(ParseNextHour)

+ (id)dateFormatter
{
  if (dateFormatter_onceToken != -1)
    dispatch_once(&dateFormatter_onceToken, &__block_literal_global);
  return (id)dateFormatter_dateFormatter;
}

@end
