@implementation SFDeviceModel

void __SFDeviceModel_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = MGCopyAnswer();
  v1 = (void *)SFDeviceModel_result;
  SFDeviceModel_result = v0;

  if (!SFDeviceModel_result)
  {
    SFDeviceModel_result = (uint64_t)CFSTR("?");

  }
}

@end
