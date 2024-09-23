@implementation PBBestMatchToConformingType

BOOL __PBBestMatchToConformingType_block_invoke(int a1, CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return UTTypeConformsTo(inUTI, inConformsToUTI) != 0;
}

@end
