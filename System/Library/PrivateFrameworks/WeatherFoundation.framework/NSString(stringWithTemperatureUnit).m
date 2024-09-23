@implementation NSString(stringWithTemperatureUnit)

- (id)stringWithTemperatureUnit:()stringWithTemperatureUnit
{
  const __CFString *v3;
  const __CFString *v4;

  v3 = CFSTR("℃");
  if (a3 == 3)
    v3 = CFSTR("K");
  if (a3 == 1)
    v4 = CFSTR("℉");
  else
    v4 = v3;
  objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("°"), v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
