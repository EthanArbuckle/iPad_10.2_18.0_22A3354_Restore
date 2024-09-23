@implementation WFAddRecoveryOptionsToRemoteQuarantineDenialError

void __WFAddRecoveryOptionsToRemoteQuarantineDenialError_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5;
  void (*v6)(uint64_t);
  void (**v7)(id, uint64_t, _QWORD);

  if (*(_QWORD *)(a1 + 40) == a3)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void (**)(uint64_t))(v5 + 16);
    v7 = a5;
    v6(v5);
    v7[2](v7, 1, 0);

  }
}

@end
