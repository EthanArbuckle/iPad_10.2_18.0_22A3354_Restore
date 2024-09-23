@implementation AXSAccessibilityPreferenceDomain

CFStringRef ___AXSAccessibilityPreferenceDomain_block_invoke()
{
  uint64_t v0;
  const __CFAllocator *v1;
  const void *v2;
  CFStringRef result;

  v0 = kAXSAccessibilityPreferenceDomain;
  v1 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v2 = AXCPSharedResourcesDirectory();
  result = CFStringCreateWithFormat(v1, 0, CFSTR("%@/Library/Preferences/%@"), v2, v0);
  _AXSAccessibilityPreferenceDomain_Domain = (uint64_t)result;
  return result;
}

@end
