@implementation NCUserAlertDefaultActionRunner

- (void)executeAction:(id)a3 fromOrigin:(id)a4 endpoint:(id)a5 withParameters:(id)a6 completion:(id)a7
{
  id v8;
  void *v9;
  SBLockScreenUnlockRequest *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a7;
  -[NCUserAlertActionRunner alertItem](self, "alertItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = objc_alloc_init(SBLockScreenUnlockRequest);
    -[SBLockScreenUnlockRequest setSource:](v10, "setSource:", 10);
    -[SBLockScreenUnlockRequest setIntent:](v10, "setIntent:", 3);
    -[SBLockScreenUnlockRequest setName:](v10, "setName:", CFSTR("NCUserAlertDefaultActionRunner"));
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __94__NCUserAlertDefaultActionRunner_executeAction_fromOrigin_endpoint_withParameters_completion___block_invoke;
    v12[3] = &unk_1E8E9F230;
    v13 = v9;
    v14 = v8;
    objc_msgSend(v11, "unlockWithRequest:completion:", v10, v12);

  }
}

uint64_t __94__NCUserAlertDefaultActionRunner_executeAction_fromOrigin_endpoint_withParameters_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if ((_DWORD)a2)
    objc_msgSend(*(id *)(a1 + 32), "performUnlockAction");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

@end
