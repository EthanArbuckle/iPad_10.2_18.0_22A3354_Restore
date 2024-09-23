@implementation PPTState

void __31___PPTState_leaveDispatchGroup__block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(int *)(v1 + 24) >= 1)
  {
    dispatch_group_leave(*(dispatch_group_t *)(v1 + 16));
    --*(_DWORD *)(*(_QWORD *)(a1 + 32) + 24);
  }
}

void __31___PPTState_enterDispatchGroup__block_invoke(uint64_t a1)
{
  ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 24);
  dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 16));
}

@end
