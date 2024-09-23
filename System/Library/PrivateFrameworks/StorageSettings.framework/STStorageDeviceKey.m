@implementation STStorageDeviceKey

void __STStorageDeviceKey_block_invoke()
{
  unsigned int v0;
  const __CFString *v1;
  void *v2;
  id v3;

  v3 = (id)MGCopyAnswer();
  v0 = objc_msgSend(v3, "intValue") - 1;
  if (v0 > 2)
    v1 = CFSTR("OTHER");
  else
    v1 = off_24C756918[v0];
  v2 = (void *)STStorageDeviceKey_deviceKey;
  STStorageDeviceKey_deviceKey = (uint64_t)v1;

}

@end
