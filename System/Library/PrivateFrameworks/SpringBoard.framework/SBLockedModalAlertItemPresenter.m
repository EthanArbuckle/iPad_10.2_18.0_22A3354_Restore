@implementation SBLockedModalAlertItemPresenter

- (SBLockedModalAlertItemPresenter)initWithSharedModalAlertItemPresenter:(id)a3 windowSceneManager:(id)a4
{
  id v6;
  id v7;
  SBLockedModalAlertItemPresenter *v8;
  SBAlertItemPresenterWindowSceneResolver *v9;
  SBAlertItemPresenterWindowSceneResolver *windowSceneResolver;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBLockedModalAlertItemPresenter;
  v8 = -[SBLockedModalAlertItemPresenter init](&v12, sel_init);
  if (v8)
  {
    v9 = -[SBAlertItemPresenterWindowSceneResolver initWithSharedModalAlertItemPresenter:windowSceneManager:]([SBAlertItemPresenterWindowSceneResolver alloc], "initWithSharedModalAlertItemPresenter:windowSceneManager:", v6, v7);
    windowSceneResolver = v8->_windowSceneResolver;
    v8->_windowSceneResolver = v9;

  }
  return v8;
}

- (BOOL)presentsAlertItemsModally
{
  return 1;
}

- (BOOL)canPresentMultipleAlertItemsSimultaneously
{
  return 1;
}

- (void)presentAlertItem:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  _QWORD v20[2];

  v6 = a4;
  v20[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  BSDispatchQueueAssertMain();
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBiometricAutoUnlockingDisabled:forReason:", 1, CFSTR("SBDisableMesaReasonModalAlertItem"));

  if (objc_msgSend(v8, "wakeDisplay") && (objc_msgSend(v8, "_didEverActivate") & 1) == 0)
  {
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = CFSTR("SBUIUnlockOptionsTurnOnScreenFirstKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "unlockUIFromSource:withOptions:", 10, v13);

  }
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isUILocked");

  -[SBLockedModalAlertItemPresenter windowSceneResolver](self, "windowSceneResolver");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "resolvedSharedModalAlertItemPresenterForAlertItem:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "presentAlertItem:isLocked:animated:completion:", v8, v15, v6, v9);

  if (objc_msgSend(v8, "dismissesOverlaysOnLockScreen"))
  {
    +[SBControlCenterController sharedInstance](SBControlCenterController, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "isVisible"))
      objc_msgSend(v18, "dismissAnimated:", 1);

  }
}

- (void)dismissAlertItem:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  BSDispatchQueueAssertMain();
  -[SBLockedModalAlertItemPresenter windowSceneResolver](self, "windowSceneResolver");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resolvedSharedModalAlertItemPresenterForAlertItem:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dismissAlertItem:animated:completion:", v9, v5, v8);

  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBiometricAutoUnlockingDisabled:forReason:", 0, CFSTR("SBDisableMesaReasonModalAlertItem"));

}

- (void)windowSceneDidConnect:(id)a3 withSharedModalAlertItemPresenter:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  if (v12)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBLockedModalAlertItemPresenter.m"), 82, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("windowScene"));

    if (v7)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBLockedModalAlertItemPresenter.m"), 83, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sharedModalAlertItemPresenter"));

LABEL_3:
  -[SBLockedModalAlertItemPresenter windowSceneResolver](self, "windowSceneResolver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[SBLockedModalAlertItemPresenter windowSceneResolver](self, "windowSceneResolver");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "windowSceneDidConnect:withSharedModalAlertItemPresenter:", v12, v7);

  }
}

- (void)windowSceneDidDisconnect:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBLockedModalAlertItemPresenter.m"), 91, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("windowScene"));

  }
  -[SBLockedModalAlertItemPresenter windowSceneResolver](self, "windowSceneResolver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v9;
  if (v5)
  {
    -[SBLockedModalAlertItemPresenter windowSceneResolver](self, "windowSceneResolver");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "windowSceneDidDisconnect:", v9);

    v6 = v9;
  }

}

- (id)lockScreenActionContext
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SBLockedModalAlertItemPresenter windowSceneResolver](self, "windowSceneResolver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolvedSharedModalAlertItemPresenterForAlertItem:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentlyPresentedAlertItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    +[SBLockScreenActionContextFactory sharedInstance](SBLockScreenActionContextFactory, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lockScreenActionContextForAlertItem:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (SBAlertItemPresenterWindowSceneResolver)windowSceneResolver
{
  return self->_windowSceneResolver;
}

- (void)setWindowSceneResolver:(id)a3
{
  objc_storeStrong((id *)&self->_windowSceneResolver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowSceneResolver, 0);
}

@end
