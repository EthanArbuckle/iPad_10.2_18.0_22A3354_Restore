@implementation TelephonyBasebandControllerIsEmptyEventQueue

uint64_t ___TelephonyBasebandControllerIsEmptyEventQueue_block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = **(_QWORD **)(*(_QWORD *)(result + 40) + 96) == 0;
  return result;
}

@end
