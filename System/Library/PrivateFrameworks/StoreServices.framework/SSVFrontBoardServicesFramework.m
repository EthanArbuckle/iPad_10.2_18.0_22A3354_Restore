@implementation SSVFrontBoardServicesFramework

void *__SSVFrontBoardServicesFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/FrontBoardServices.framework/FrontBoardServices", 1);
  SSVFrontBoardServicesFramework_sHandle = (uint64_t)result;
  return result;
}

@end
