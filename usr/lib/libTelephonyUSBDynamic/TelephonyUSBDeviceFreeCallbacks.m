@implementation TelephonyUSBDeviceFreeCallbacks

void ___TelephonyUSBDeviceFreeCallbacks_block_invoke(uint64_t a1)
{
  const void *v2;

  v2 = **(const void ***)(a1 + 32);
  if (!v2)
  {
    __TUAssertTrigger();
    v2 = **(const void ***)(a1 + 32);
  }
  _Block_release(v2);
  free(*(void **)(a1 + 32));
}

@end
