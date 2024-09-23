@implementation SFPowerLogEvent

void __SFPowerLogEvent_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("PowerLogQueue", 0);
  v1 = (void *)SFPowerLogEvent_sPowerLogQueue;
  SFPowerLogEvent_sPowerLogQueue = (uint64_t)v0;

}

uint64_t __SFPowerLogEvent_block_invoke_2(uint64_t a1)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLinkPLLogRegisteredEvent[0])(65, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);
}

@end
