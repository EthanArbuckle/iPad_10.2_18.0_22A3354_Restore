@implementation SADeviceControlStartScreenRecording

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.devicecontrol");
}

- (id)encodedClassName
{
  return CFSTR("StartScreenRecording");
}

+ (id)startScreenRecording
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
