@implementation TelephonyBasebandControllerRemoveAllFromCoredumpReadyQueue

void ___TelephonyBasebandControllerRemoveAllFromCoredumpReadyQueue_block_invoke(uint64_t a1)
{
  uint64_t *v1;
  uint64_t i;
  uint64_t v4;
  _QWORD *v5;
  NSObject *v6;

  v1 = *(uint64_t **)(*(_QWORD *)(a1 + 32) + 104);
  if (v1)
  {
    for (i = *v1; *v1; i = *v1)
    {
      v4 = *(_QWORD *)(i + 8);
      v5 = *(_QWORD **)(i + 16);
      if (v4)
      {
        *(_QWORD *)(v4 + 16) = v5;
        v5 = *(_QWORD **)(i + 16);
      }
      else
      {
        v1[1] = (uint64_t)v5;
      }
      *v5 = v4;
      v6 = *(NSObject **)i;
      *(_QWORD *)i = 0;
      dispatch_group_leave(v6);
      v1 = *(uint64_t **)(*(_QWORD *)(a1 + 32) + 104);
    }
  }
}

@end
