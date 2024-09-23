@implementation OSIntelligenceDefines

+ (id)inactivityUserDefaults
{
  if (qword_1000768D0 != -1)
    dispatch_once(&qword_1000768D0, &stru_100061288);
  return (id)qword_1000768C8;
}

+ (id)chargingUserDefaults
{
  if (qword_1000768E0 != -1)
    dispatch_once(&qword_1000768E0, &stru_1000612A8);
  return (id)qword_1000768D8;
}

@end
