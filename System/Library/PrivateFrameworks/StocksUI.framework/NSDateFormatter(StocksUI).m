@implementation NSDateFormatter(StocksUI)

+ (uint64_t)su_localizedYearFormat
{
  return CPDateFormatStringForFormatType();
}

@end
