@implementation PRGetChipPowerState

uint64_t __PRGetChipPowerState_block_invoke_2(uint64_t result, char a2, char a3)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = a3;
  return result;
}

@end
