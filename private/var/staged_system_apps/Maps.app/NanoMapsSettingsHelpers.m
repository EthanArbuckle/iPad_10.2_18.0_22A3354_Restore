@implementation NanoMapsSettingsHelpers

+ (NSUserDefaults)nanoMapsUserDefaults
{
  if (qword_1014D3218 != -1)
    dispatch_once(&qword_1014D3218, &stru_1011C63B0);
  return (NSUserDefaults *)(id)qword_1014D3210;
}

+ (NSUserDefaults)companionUserDefaults
{
  if (qword_1014D3228 != -1)
    dispatch_once(&qword_1014D3228, &stru_1011C63D0);
  return (NSUserDefaults *)(id)qword_1014D3220;
}

@end
