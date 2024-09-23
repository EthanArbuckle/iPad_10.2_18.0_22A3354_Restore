@implementation TelephonyBasebandControllerRemoveFromCoredumpReadyQueue

void ___TelephonyBasebandControllerRemoveFromCoredumpReadyQueue_block_invoke(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  NSObject **v5;
  NSObject *v6;

  v1 = *(_QWORD **)(a1 + 32);
  if (*v1)
  {
    v3 = v1[1];
    v2 = v1[2];
    if (v3)
      v4 = (_QWORD *)(v3 + 16);
    else
      v4 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 104) + 8);
    *v4 = v2;
    **(_QWORD **)(*(_QWORD *)(a1 + 32) + 16) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(NSObject ***)(a1 + 32);
    v6 = *v5;
    *v5 = 0;
    dispatch_group_leave(v6);
  }
}

@end
