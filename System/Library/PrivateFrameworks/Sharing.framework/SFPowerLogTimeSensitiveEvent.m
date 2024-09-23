@implementation SFPowerLogTimeSensitiveEvent

void __SFPowerLogTimeSensitiveEvent_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("PowerLogSensitiveQueue", 0);
  v1 = (void *)SFPowerLogTimeSensitiveEvent_sPowerLogQueue;
  SFPowerLogTimeSensitiveEvent_sPowerLogQueue = (uint64_t)v0;

}

uint64_t __SFPowerLogTimeSensitiveEvent_block_invoke_2(uint64_t a1)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLinkPLLogTimeSensitiveRegisteredEvent[0])(65, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);
}

@end
