@implementation SLDClientGlobalWorkloop

void __SLDClientGlobalWorkloop_block_invoke()
{
  dispatch_workloop_t v0;
  void *v1;

  v0 = dispatch_workloop_create("SocialLayerClientGlobalWorkloop");
  v1 = (void *)SLDClientGlobalWorkloop_workloop;
  SLDClientGlobalWorkloop_workloop = (uint64_t)v0;

}

@end
