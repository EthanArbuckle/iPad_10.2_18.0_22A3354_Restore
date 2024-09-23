@implementation BCDevice

+ (BOOL)isInternalInstall
{
  if (qword_30DC10 != -1)
    dispatch_once(&qword_30DC10, &stru_2903A8);
  return byte_30DC08;
}

+ (int64_t)deviceClass
{
  if (qword_30DC20 != -1)
    dispatch_once(&qword_30DC20, &stru_2903C8);
  return qword_30DC18;
}

@end
