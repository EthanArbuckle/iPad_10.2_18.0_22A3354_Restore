@implementation DeviceProductType

void __DeviceProductType_block_invoke()
{
  void *v0;
  void *v1;
  CFTypeID v2;

  v0 = (void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    v2 = CFGetTypeID(v0);
    if (v2 == CFStringGetTypeID())
      objc_storeStrong((id *)&DeviceProductType_type, v1);
  }
}

void __DeviceProductType_block_invoke_0()
{
  void *v0;
  void *v1;
  CFTypeID v2;

  v0 = (void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    v2 = CFGetTypeID(v0);
    if (v2 == CFStringGetTypeID())
      objc_storeStrong((id *)&DeviceProductType_type_0, v1);
  }
}

@end
