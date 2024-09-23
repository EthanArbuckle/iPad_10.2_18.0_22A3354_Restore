@implementation SiriSharedUIAssistantActivityAssertion

- (void)beginActivityWithReason:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  SRUIFInvokeOnMainQueue();

}

void __66__SiriSharedUIAssistantActivityAssertion_beginActivityWithReason___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  id v5;

  soft_SBUIGetUserAgent();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isScreenOn");

  if ((v3 & 1) == 0)
  {
    soft_SBUIGetUserAgent();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "undimScreen");

  }
  soft_SBUIGetUserAgent();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdleTimerDisabled:forReason:", 1, *(_QWORD *)(a1 + 32));

}

- (void)endActivityWithReason:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  SRUIFInvokeOnMainQueue();

}

void __64__SiriSharedUIAssistantActivityAssertion_endActivityWithReason___block_invoke(uint64_t a1)
{
  id v2;

  soft_SBUIGetUserAgent();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIdleTimerDisabled:forReason:", 0, *(_QWORD *)(a1 + 32));

}

@end
