@implementation SKUIOffscreenRenderOperationGetRendererStackAccessQueue

void ___SKUIOffscreenRenderOperationGetRendererStackAccessQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.StoreKitUI.SKUIOffscreenRenderOperation.RendererStackAccessQueue", MEMORY[0x1E0C80D50]);
  v1 = (void *)_SKUIOffscreenRenderOperationGetRendererStackAccessQueue_sRendererStacAccessQueue;
  _SKUIOffscreenRenderOperationGetRendererStackAccessQueue_sRendererStacAccessQueue = (uint64_t)v0;

}

@end
