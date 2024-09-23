@implementation UIProtocolCreationQueue

void ___UIProtocolCreationQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.uikit.protocol-creation-queue", 0);
  v1 = (void *)_MergedGlobals_1299;
  _MergedGlobals_1299 = (uint64_t)v0;

}

@end
