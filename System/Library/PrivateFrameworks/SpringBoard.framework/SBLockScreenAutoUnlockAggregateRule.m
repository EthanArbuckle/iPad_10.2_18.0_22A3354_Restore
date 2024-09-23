@implementation SBLockScreenAutoUnlockAggregateRule

- (SBLockScreenAutoUnlockAggregateRule)initWithUserAuthenticationController:(id)a3
{
  id v4;
  void *v5;
  SBLockScreenAutoUnlockAggregateRule *v6;

  v4 = a3;
  +[SBSyncController sharedInstance](SBSyncController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBLockScreenAutoUnlockAggregateRule _initWithUserAuthenticationController:syncController:](self, "_initWithUserAuthenticationController:syncController:", v4, v5);

  return v6;
}

- (id)_initWithUserAuthenticationController:(id)a3 syncController:(id)a4
{
  id v7;
  id v8;
  SBLockScreenAutoUnlockAggregateRule *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBLockScreenAutoUnlockAggregateRule;
  v9 = -[SBAutoUnlockComposableRule init](&v12, sel_init);
  p_isa = (id *)&v9->super.super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userAuthenticationController, a3);
    objc_storeStrong(p_isa + 3, a4);
  }

  return p_isa;
}

- (BOOL)shouldAutoUnlockForSource:(int)a3
{
  uint64_t v3;
  int v5;
  void *v6;
  char v7;
  objc_super v9;

  v3 = *(_QWORD *)&a3;
  v5 = -[SBFUserAuthenticationController isAuthenticated](self->_userAuthenticationController, "isAuthenticated");
  if (v5)
  {
    -[SBLockScreenAutoUnlockAggregateRule _syncController](self, "_syncController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isInUse");

    if ((v7 & 1) != 0)
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      v9.receiver = self;
      v9.super_class = (Class)SBLockScreenAutoUnlockAggregateRule;
      LOBYTE(v5) = -[SBAutoUnlockComposableRule shouldAutoUnlockForSource:](&v9, sel_shouldAutoUnlockForSource_, v3);
    }
  }
  return v5;
}

- (SBFUserAuthenticationController)userAuthenticationController
{
  return self->_userAuthenticationController;
}

- (SBSyncController)_syncController
{
  return self->_syncController;
}

- (void)_setSyncController:(id)a3
{
  objc_storeStrong((id *)&self->_syncController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncController, 0);
  objc_storeStrong((id *)&self->_userAuthenticationController, 0);
}

@end
