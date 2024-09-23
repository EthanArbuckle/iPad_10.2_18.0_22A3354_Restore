@implementation SKUISpringBoardServicesFramework

void *__SKUISpringBoardServicesFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/SpringBoardServices.framework/SpringBoardServices", 1);
  SKUISpringBoardServicesFramework_sHandle = (uint64_t)result;
  return result;
}

@end
