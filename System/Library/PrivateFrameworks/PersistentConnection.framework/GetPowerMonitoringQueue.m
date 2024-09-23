@implementation GetPowerMonitoringQueue

void ___GetPowerMonitoringQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("PCSimpleTimer-powermonitoringq", 0);
  v1 = (void *)sPowerMonitoringQueue;
  sPowerMonitoringQueue = (uint64_t)v0;

}

@end
