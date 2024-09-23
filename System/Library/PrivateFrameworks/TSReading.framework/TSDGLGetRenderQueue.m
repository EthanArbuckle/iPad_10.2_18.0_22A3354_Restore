@implementation TSDGLGetRenderQueue

void __TSDGLGetRenderQueue_block_invoke()
{
  NSObject *v0;

  v0 = dispatch_queue_create("TSDGLRenderQueue", 0);
  TSDGLGetRenderQueue_renderQueue = (uint64_t)v0;
  if (v0)
    dispatch_queue_set_specific(v0, (const void *)TSDGLRenderQueueContext, (void *)TSDGLRenderQueueContext, 0);
}

@end
