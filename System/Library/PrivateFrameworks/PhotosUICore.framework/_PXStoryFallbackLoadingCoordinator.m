@implementation _PXStoryFallbackLoadingCoordinator

- (void)dispatchTimelineWorkAsyncOnQueue:(id)a3 block:(id)a4
{
  dispatch_async((dispatch_queue_t)a3, a4);
}

@end
