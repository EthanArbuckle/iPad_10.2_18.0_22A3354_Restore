@implementation SLDGlobalWorkloop

void __SLDGlobalWorkloop_block_invoke()
{
  dispatch_workloop_t v0;
  void *v1;

  v0 = dispatch_workloop_create("SocialLayerDaemonGlobalWorkloop");
  v1 = (void *)SLDGlobalWorkloop_workloop;
  SLDGlobalWorkloop_workloop = (uint64_t)v0;

}

@end
