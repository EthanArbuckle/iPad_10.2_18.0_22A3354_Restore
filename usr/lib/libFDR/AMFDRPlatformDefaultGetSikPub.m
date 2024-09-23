@implementation AMFDRPlatformDefaultGetSikPub

void ___AMFDRPlatformDefaultGetSikPub_block_invoke(uint64_t a1)
{
  const __CFAllocator *v2;
  const void *v3;
  CFTypeID v4;
  const __CFString *v5;
  const __CFString *v6;

  v2 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v3 = *(const void **)(a1 + 32);
  if (v3)
  {
    v4 = CFGetTypeID(v3);
    if (v4 == AMFDRGetTypeID())
      v2 = CFGetAllocator(*(CFTypeRef *)(a1 + 32));
  }
  v5 = (const __CFString *)AMFDRDeviceCopySikPub(v2);
  if (v5)
  {
    v6 = v5;
    _AMFDRPlatformDefaultGetSikPub_key = (uint64_t)AMFDRCreateInstanceString(v2, v5);
    CFRelease(v6);
  }
}

@end
