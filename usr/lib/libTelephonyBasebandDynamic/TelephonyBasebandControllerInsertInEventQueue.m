@implementation TelephonyBasebandControllerInsertInEventQueue

uint64_t ___TelephonyBasebandControllerInsertInEventQueue_block_invoke(uint64_t result)
{
  **(_QWORD **)(result + 32) = *(_QWORD *)(result + 40);
  *(_QWORD *)(*(_QWORD *)(result + 32) + 8) = 0;
  *(_QWORD *)(*(_QWORD *)(result + 32) + 16) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 96) + 8);
  **(_QWORD **)(*(_QWORD *)(*(_QWORD *)(result + 48) + 96) + 8) = *(_QWORD *)(result + 32);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 96) + 8) = *(_QWORD *)(result + 32) + 8;
  return result;
}

@end
