@implementation TelephonyBasebandControllerInsertInCoredumpReadyQueue

void ___TelephonyBasebandControllerInsertInCoredumpReadyQueue_block_invoke(uint64_t a1)
{
  dispatch_group_enter(**(dispatch_group_t **)(a1 + 32));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 104) + 8);
  **(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 104) + 8) = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 104) + 8) = *(_QWORD *)(a1 + 32) + 8;
}

@end
