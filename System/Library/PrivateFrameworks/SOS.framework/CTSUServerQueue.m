@implementation CTSUServerQueue

void __CTSUServerQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.sos.ctserverqueue", 0);
  v1 = (void *)CTSUServerQueue_sCTServerQueue;
  CTSUServerQueue_sCTServerQueue = (uint64_t)v0;

}

@end
