@implementation PKCapabilities

+ (id)frameworkQueueAttr
{
  return 0;
}

+ (BOOL)supportsAutoreleasePoolDuringPlugInLaunch
{
  return dyld_program_sdk_at_least();
}

@end
