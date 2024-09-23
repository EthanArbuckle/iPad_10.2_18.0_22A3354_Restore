@implementation SBXXAddBiometricAssertion

void ___SBXXAddBiometricAssertion_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  if (*(_BYTE *)(a1 + 48) == 1)
  {
    +[SBWalletPreArmController sharedInstance](SBWalletPreArmController, "sharedInstance");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "acquireSuppressPreArmAssertionOfType:forReason:", 2, *(_QWORD *)(a1 + 32));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
  else
  {
    if (*(_BYTE *)(a1 + 48))
      return;
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setMesaUnlockingDisabled:forReason:", 1, *(_QWORD *)(a1 + 32));
  }

}

void ___SBXXAddBiometricAssertion_block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD block[4];
  id v5;
  uint64_t v6;
  char v7;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___SBXXAddBiometricAssertion_block_invoke_3;
  block[3] = &unk_1E8EA3080;
  v7 = *(_BYTE *)(a1 + 48);
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = v2;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void ___SBXXAddBiometricAssertion_block_invoke_3(uint64_t a1)
{
  id v2;

  if (*(_BYTE *)(a1 + 48) == 1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate");
  }
  else if (!*(_BYTE *)(a1 + 48))
  {
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_setMesaUnlockingDisabled:forReason:", 0, *(_QWORD *)(a1 + 32));

  }
}

@end
