@implementation SBWorkspaceActivateSpringBoardWithResult

uint64_t ____SBWorkspaceActivateSpringBoardWithResult_block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  int v15;
  id (*v16)(uint64_t, uint64_t);
  uint64_t *v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v3 = a2;
  if (*(_BYTE *)(a1 + 72))
  {
LABEL_2:
    objc_msgSend((id)SBApp, "lockOutController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "authenticationStatusProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      objc_msgSend((id)SBApp, "authenticationController");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v7;

    objc_msgSend(*(id *)(a1 + 48), "uiLockStateProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;

    if ((objc_msgSend(v4, "isBlocked") & 1) != 0 || !objc_msgSend(v9, "isAuthenticated"))
      v14 = 1;
    else
      v14 = objc_msgSend(v13, "isUILocked");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = objc_msgSend(v13, "isUIUnlocking") ^ 1;
    else
      v15 = 1;
    if ((v14 & v15) == 1)
    {
      v24 = MEMORY[0x1E0C809B0];
      v16 = ____SBWorkspaceActivateSpringBoardWithResult_block_invoke_5;
      v17 = &v24;
    }
    else
    {
      v23 = MEMORY[0x1E0C809B0];
      v16 = ____SBWorkspaceActivateSpringBoardWithResult_block_invoke_6;
      v17 = &v23;
    }
    v17[1] = 3221225472;
    v17[2] = (uint64_t)v16;
    v17[3] = (uint64_t)&unk_1E8E9F978;
    v17[4] = (uint64_t)*(id *)(a1 + 32);
    v17[5] = (uint64_t)*(id *)(a1 + 56);
    objc_msgSend(v3, "setTransactionProvider:", v17);

    v18 = 1;
    goto LABEL_22;
  }
  if (*(_BYTE *)(a1 + 73))
  {
    objc_msgSend(*(id *)(a1 + 32), "transientOverlayPresentationManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "hasActivePresentation"))
    {

      goto LABEL_2;
    }
    v20 = objc_msgSend(*(id *)(a1 + 40), "unlockedEnvironmentMode");

    if (v20 == 3)
      goto LABEL_2;
  }
  else if (objc_msgSend(*(id *)(a1 + 40), "unlockedEnvironmentMode") == 3)
  {
    goto LABEL_2;
  }
  v21 = *(_QWORD *)(a1 + 64);
  if (v21)
    (*(void (**)(uint64_t, _QWORD))(v21 + 16))(v21, 0);
  v22 = *(_QWORD *)(a1 + 56);
  if (v22)
    (*(void (**)(uint64_t, _QWORD))(v22 + 16))(v22, 0);
  v18 = 0;
LABEL_22:

  return v18;
}

void ____SBWorkspaceActivateSpringBoardWithResult_block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setResultBlock:", v2);
  +[SBWorkspaceEntity entity](SBHomeScreenEntity, "entity");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setActivatingEntity:", v4);

}

id ____SBWorkspaceActivateSpringBoardWithResult_block_invoke_6(uint64_t a1, uint64_t a2)
{
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_selectTransactionForAppActivationRequest:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCompletionBlock:", *(_QWORD *)(a1 + 40));
  return v3;
}

void ____SBWorkspaceActivateSpringBoardWithResult_block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "currentTransaction");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "failWithReason:", CFSTR("force activate SpringBoard"));

}

uint64_t ____SBWorkspaceActivateSpringBoardWithResult_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "interruptWithReason:", CFSTR("home"));
}

id ____SBWorkspaceActivateSpringBoardWithResult_block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_selectTransactionForReturningToTheLockScreenWithRequest:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCompletionBlock:", *(_QWORD *)(a1 + 40));
  return v3;
}

@end
