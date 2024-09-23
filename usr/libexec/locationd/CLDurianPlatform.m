@implementation CLDurianPlatform

+ (BOOL)isTinkerWatch
{
  return 0;
}

+ (BOOL)isWatch
{
  return 0;
}

+ (BOOL)isInternalInstall
{
  if (qword_10230F8A8 != -1)
    dispatch_once(&qword_10230F8A8, &stru_1021BBE28);
  return byte_10230F8A0;
}

+ (BOOL)isPhone
{
  if (qword_10230F8B8 != -1)
    dispatch_once(&qword_10230F8B8, &stru_1021BBE48);
  return byte_10230F8B0;
}

+ (NSString)systemVersion
{
  if (qword_10230F8C8 != -1)
    dispatch_once(&qword_10230F8C8, &stru_1021BBE68);
  return (NSString *)qword_10230F8C0;
}

+ (NSString)systemModel
{
  if (qword_10230F8D8 != -1)
    dispatch_once(&qword_10230F8D8, &stru_1021BBE88);
  return (NSString *)qword_10230F8D0;
}

@end
