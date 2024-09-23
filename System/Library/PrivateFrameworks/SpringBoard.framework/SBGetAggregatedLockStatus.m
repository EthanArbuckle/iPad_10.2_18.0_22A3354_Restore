@implementation SBGetAggregatedLockStatus

void __SBGetAggregatedLockStatus_block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  char v6;

  objc_msgSend(a2, "uiLockStateProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isUILocked");

  if ((v6 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a3 = 1;
  }
}

void __SBGetAggregatedLockStatus_block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  int v6;

  objc_msgSend(a2, "authenticationStatusProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAuthenticated");

  if (v6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a3 = 1;
  }
}

@end
