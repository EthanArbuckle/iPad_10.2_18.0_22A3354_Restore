@implementation MesaCoreAnalyticsHelper

+ (id)mesaCaDeviceTypeFromBioDeviceType:(unsigned int)a3
{
  if (a3 == 1)
    return &unk_251CB33F8;
  else
    return 0;
}

@end
