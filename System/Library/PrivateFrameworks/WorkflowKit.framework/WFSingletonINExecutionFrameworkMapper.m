@implementation WFSingletonINExecutionFrameworkMapper

void __WFSingletonINExecutionFrameworkMapper_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(NSClassFromString(CFSTR("INExecutionFrameworkMapper")));
  v1 = (void *)WFSingletonINExecutionFrameworkMapper_frameworkMapper;
  WFSingletonINExecutionFrameworkMapper_frameworkMapper = (uint64_t)v0;

}

@end
