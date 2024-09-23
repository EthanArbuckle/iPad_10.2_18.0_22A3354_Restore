@implementation PXGDeviceSupportsIOSurfaceCompression

void __PXGDeviceSupportsIOSurfaceCompression_block_invoke()
{
  const __CFDictionary *v0;
  const __CFDictionary *v1;
  const void *v2;

  v0 = (const __CFDictionary *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    v2 = (const void *)*MEMORY[0x24BDBD270];
    if (v2 == CFDictionaryGetValue(v0, CFSTR("universal-buffer-compression")))
      PXGDeviceSupportsIOSurfaceCompression__supportsIOSurfaceCompression = 1;
    CFRelease(v1);
  }
}

@end
