@implementation VLFDeviceInfo

+ (BOOL)isNotchDevice
{
  if (qword_1014D3658 != -1)
    dispatch_once(&qword_1014D3658, &stru_1011D92F0);
  return byte_1014D3650;
}

+ (BOOL)isIslandDevice
{
  if (qword_1014D3660 != -1)
    dispatch_once(&qword_1014D3660, &stru_1011D9310);
  return byte_1014D3651;
}

@end
