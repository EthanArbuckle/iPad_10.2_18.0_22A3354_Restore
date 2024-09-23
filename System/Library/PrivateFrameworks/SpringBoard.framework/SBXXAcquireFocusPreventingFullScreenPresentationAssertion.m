@implementation SBXXAcquireFocusPreventingFullScreenPresentationAssertion

void ___SBXXAcquireFocusPreventingFullScreenPresentationAssertion_block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  SBLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v14 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "Disabling certain system gestures for assertion with reason=%@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E91CE2A8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBSystemGestureManager mainDisplayManager](SBSystemGestureManager, "mainDisplayManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "acquireSystemGestureDisableAssertionForReason:forSystemGestureTypes:", *(_QWORD *)(a1 + 32), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D017A0]), "initWithPort:", *(unsigned int *)(a1 + 40));
  v8 = (void *)MEMORY[0x1E0D01810];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = ___SBXXAcquireFocusPreventingFullScreenPresentationAssertion_block_invoke_139;
  v10[3] = &unk_1E8E9E820;
  v11 = *(id *)(a1 + 32);
  v12 = v6;
  v9 = v6;
  objc_msgSend(v8, "monitorSendRight:withHandler:", v7, v10);

}

void ___SBXXAcquireFocusPreventingFullScreenPresentationAssertion_block_invoke_139(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = ___SBXXAcquireFocusPreventingFullScreenPresentationAssertion_block_invoke_2;
  v2[3] = &unk_1E8E9E820;
  v3 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], v2);

}

uint64_t ___SBXXAcquireFocusPreventingFullScreenPresentationAssertion_block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SBLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "Re-enabling certain system gestures for assertion with reason=%@", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 40), "invalidate");
}

@end
