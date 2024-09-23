@implementation TelephonyBasebandControllerInsertInWakeQueue

void ___TelephonyBasebandControllerInsertInWakeQueue_block_invoke(uint64_t a1)
{
  dispatch_group_enter(**(dispatch_group_t **)(a1 + 32));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 88) + 8);
  **(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 88) + 8) = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 88) + 8) = *(_QWORD *)(a1 + 32) + 8;
}

@end
