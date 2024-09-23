@implementation NSString(TSUDateFormatStringUtilities)

- (id)stringByReplacing4DigitYearStringWith2DigitYearString
{
  void *v1;

  v1 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("yyyy"), CFSTR("yy"), 0, 0, objc_msgSend(v1, "length"));
  return v1;
}

- (id)stringByReplacing2DigitYearStringWith4DigitYearString
{
  void *v1;

  v1 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("yy"), CFSTR("yyyy"), 0, 0, objc_msgSend(v1, "length"));
  return v1;
}

@end
