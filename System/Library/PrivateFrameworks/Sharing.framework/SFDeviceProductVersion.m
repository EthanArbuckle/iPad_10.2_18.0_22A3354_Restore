@implementation SFDeviceProductVersion

void __SFDeviceProductVersion_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = MGCopyAnswer();
  v1 = (void *)SFDeviceProductVersion_result;
  SFDeviceProductVersion_result = v0;

  if (!SFDeviceProductVersion_result)
  {
    SFDeviceProductVersion_result = (uint64_t)CFSTR("?");

  }
}

@end
