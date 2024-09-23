@implementation RMPlatformInfo

+ (BOOL)isInternalBuild
{
  if (qword_10002C928 != -1)
    dispatch_once(&qword_10002C928, &stru_100024E48);
  return byte_10002C920;
}

+ (BOOL)supportsOpportunisticAnchoredTracking
{
  if (qword_10002C938 != -1)
    dispatch_once(&qword_10002C938, &stru_100024E68);
  return byte_10002C930;
}

@end
