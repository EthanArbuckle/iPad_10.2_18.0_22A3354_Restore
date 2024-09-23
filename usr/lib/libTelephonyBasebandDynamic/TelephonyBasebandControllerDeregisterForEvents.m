@implementation TelephonyBasebandControllerDeregisterForEvents

uint64_t __TelephonyBasebandControllerDeregisterForEvents_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = _TelephonyBasebandControllerRemoveFromEventQueue_sync(*(uint64_t **)(*(_QWORD *)(a1 + 40) + 96), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
