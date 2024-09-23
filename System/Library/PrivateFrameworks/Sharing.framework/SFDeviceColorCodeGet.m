@implementation SFDeviceColorCodeGet

void __SFDeviceColorCodeGet_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = MGCopyAnswer();
  if (v0)
  {
    v1 = (void *)v0;
    if (SFDeviceClassCodeGet_sOnce != -1)
      dispatch_once(&SFDeviceClassCodeGet_sOnce, &__block_literal_global_36);
    if (SFDeviceClassCodeGet_sResult == 4)
      SFDeviceColorCodeGet_sResult = objc_msgSend(v1, "intValue");
    CFRelease(v1);
  }
}

@end
