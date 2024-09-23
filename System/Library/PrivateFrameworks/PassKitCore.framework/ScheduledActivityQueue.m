@implementation ScheduledActivityQueue

void ___ScheduledActivityQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.passd.scheduledactivity", 0);
  v1 = (void *)qword_1ECF22380;
  qword_1ECF22380 = (uint64_t)v0;

}

@end
