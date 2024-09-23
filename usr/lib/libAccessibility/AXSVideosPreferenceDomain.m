@implementation AXSVideosPreferenceDomain

CFStringRef ___AXSVideosPreferenceDomain_block_invoke()
{
  const __CFAllocator *v0;
  const void *v1;
  CFStringRef result;

  v0 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v1 = AXCPSharedResourcesDirectory();
  result = CFStringCreateWithFormat(v0, 0, CFSTR("%@/Library/Preferences/%@"), v1, CFSTR("com.apple.videos"));
  _AXSVideosPreferenceDomain_Domain = (uint64_t)result;
  return result;
}

@end
