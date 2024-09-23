@implementation SBNCNotificationDispatcherDelegate

- (void)dispatcher:(id)a3 requestPermissionToExecuteAction:(id)a4 forDestination:(id)a5 notificationRequest:(id)a6 withParameters:(id)a7 completionBlock:(id)a8
{
  void (**v10)(id, uint64_t);
  SBLockScreenUnlockRequest *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a5;
  v10 = (void (**)(id, uint64_t))a8;
  if (objc_msgSend(a4, "requiresAuthentication"))
  {
    v11 = objc_alloc_init(SBLockScreenUnlockRequest);
    objc_msgSend(v15, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0DC60D8]))
      v13 = 4;
    else
      v13 = 10;

    -[SBLockScreenUnlockRequest setSource:](v11, "setSource:", v13);
    -[SBLockScreenUnlockRequest setIntent:](v11, "setIntent:", 2);
    -[SBLockScreenUnlockRequest setName:](v11, "setName:", CFSTR("SBNCNotificationDispatcherDelegate"));
    -[SBLockScreenUnlockRequest setWantsBiometricPresentation:](v11, "setWantsBiometricPresentation:", 1);
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "unlockWithRequest:completion:", v11, v10);

  }
  else
  {
    v10[2](v10, 1);
  }

}

- (void)dispatcher:(id)a3 willExecuteAction:(id)a4 forDestination:(id)a5 notificationRequest:(id)a6 requestAuthentication:(BOOL)a7 withParameters:(id)a8 completionBlock:(id)a9
{
  _BOOL4 v10;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v10 = a7;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a8;
  v20 = a9;
  if (v10 && objc_msgSend(v16, "activationMode") != 1 && objc_msgSend(v16, "requiresAuthentication"))
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __155__SBNCNotificationDispatcherDelegate_dispatcher_willExecuteAction_forDestination_notificationRequest_requestAuthentication_withParameters_completionBlock___block_invoke;
    v21[3] = &unk_1E8E9F1C0;
    v22 = v20;
    -[SBNCNotificationDispatcherDelegate _requestAuthenticationWithCompletion:](self, "_requestAuthenticationWithCompletion:", v21);

  }
  else
  {
    (*((void (**)(id, uint64_t))v20 + 2))(v20, 1);
  }

}

uint64_t __155__SBNCNotificationDispatcherDelegate_dispatcher_willExecuteAction_forDestination_notificationRequest_requestAuthentication_withParameters_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_requestAuthenticationWithCompletion:(id)a3
{
  id v3;
  void *v4;
  SBLockScreenUnlockRequest *v5;

  v3 = a3;
  v5 = objc_alloc_init(SBLockScreenUnlockRequest);
  -[SBLockScreenUnlockRequest setSource:](v5, "setSource:", 10);
  -[SBLockScreenUnlockRequest setIntent:](v5, "setIntent:", 2);
  -[SBLockScreenUnlockRequest setName:](v5, "setName:", CFSTR("SBNCNotificationDispatcherDelegate"));
  -[SBLockScreenUnlockRequest setWantsBiometricPresentation:](v5, "setWantsBiometricPresentation:", 1);
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unlockWithRequest:completion:", v5, v3);

}

- (SBNotificationBannerDestination)bannerDestination
{
  return (SBNotificationBannerDestination *)objc_loadWeakRetained((id *)&self->_bannerDestination);
}

- (void)setBannerDestination:(id)a3
{
  objc_storeWeak((id *)&self->_bannerDestination, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_bannerDestination);
}

@end
