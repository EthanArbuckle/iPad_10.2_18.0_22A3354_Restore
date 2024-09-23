@implementation NSString(RemoteManagementStore)

+ (__CFString)rms_stringWithScope:()RemoteManagementStore
{
  if (a3)
    return CFSTR("device");
  else
    return CFSTR("user");
}

@end
