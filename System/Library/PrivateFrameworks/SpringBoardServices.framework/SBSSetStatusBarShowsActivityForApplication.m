@implementation SBSSetStatusBarShowsActivityForApplication

uint64_t __SBSSetStatusBarShowsActivityForApplication_block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = SBSSpringBoardServerPort();
  return SBSetApplicationShowsProgress(v2, objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"), *(unsigned __int8 *)(a1 + 44), *(unsigned int *)(a1 + 40));
}

@end
