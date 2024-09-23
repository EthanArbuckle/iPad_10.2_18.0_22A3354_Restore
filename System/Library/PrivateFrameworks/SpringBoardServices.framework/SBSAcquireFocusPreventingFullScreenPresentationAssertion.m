@implementation SBSAcquireFocusPreventingFullScreenPresentationAssertion

void __SBSAcquireFocusPreventingFullScreenPresentationAssertion_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  SBSAssertion *v5;
  uint64_t v6;
  void *v7;
  _OWORD v8[64];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  memset(v8, 0, 512);
  if (objc_msgSend(*(id *)(a1 + 32), "getCString:maxLength:encoding:", v8, 1024, 4))
  {
    v4 = SBSSpringBoardServerPort();
    if (!SBAcquireFocusPreventingFullScreenPresentationAssertion(v4, v8, a2))
    {
      v5 = -[SBSAssertion initWithAssertionName:reason:receiveRight:]([SBSAssertion alloc], "initWithAssertionName:reason:receiveRight:", CFSTR("SBSAcquireFocusPreventingFullScreenPresentationAssertion"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

    }
  }
}

@end
