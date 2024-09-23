@implementation UISCalloutBarFontSize

void __UISCalloutBarFontSize_block_invoke()
{
  const __CTFontDescriptor *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v0 = (const __CTFontDescriptor *)CTFontDescriptorCreateWithTextStyleAndAttributes();
  v1 = (void *)CTFontDescriptorCopyAttribute(v0, (CFStringRef)*MEMORY[0x1E0CA83D8]);
  objc_msgSend(v1, "doubleValue");
  v3 = v2;

  CFRelease(v0);
  qword_1ECDA5868 = v3;
}

@end
