@implementation SBSAcquireBiometricUnlockSuppressionAssertion

uint64_t __SBSAcquireBiometricUnlockSuppressionAssertion_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

@end
