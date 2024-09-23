@implementation PBUIColorSamplingQueue

void __PBUIColorSamplingQueue_block_invoke()
{
  uint64_t SerialWithQoS;
  void *v1;

  SerialWithQoS = BSDispatchQueueCreateSerialWithQoS();
  v1 = (void *)PBUIColorSamplingQueue_queue;
  PBUIColorSamplingQueue_queue = SerialWithQoS;

}

@end
