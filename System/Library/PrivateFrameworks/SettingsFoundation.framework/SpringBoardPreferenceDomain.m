@implementation SpringBoardPreferenceDomain

uint64_t __SpringBoardPreferenceDomain_block_invoke()
{
  uint64_t result;

  result = CPCopySharedResourcesPreferencesDomainForDomain();
  SpringBoardPreferenceDomain_springBoardDomain = result;
  return result;
}

@end
