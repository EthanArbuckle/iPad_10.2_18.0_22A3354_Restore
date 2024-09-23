@implementation PBBestMatchConformingToTypes

BOOL __PBBestMatchConformingToTypes_block_invoke(int a1, const __CFString *a2, CFStringRef inUTI)
{
  return UTTypeConformsTo(inUTI, a2) != 0;
}

@end
