@implementation SBInCallTransientOverlayManager

- (void)presentTransientOverlay
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;

  v7 = -[SBInCallTransientOverlayManager _newAlertDefinition](self, "_newAlertDefinition");
  -[SBInCallTransientOverlayManager _remoteTransientOverlaySessionManager](self, "_remoteTransientOverlaySessionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sessionWithDefinition:options:", v7, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0DAAF70]);
  objc_msgSend(v4, "prepareWithConfigurationContext:", v5);
  v6 = objc_alloc_init(MEMORY[0x1E0DAAF58]);
  objc_msgSend(v4, "activateWithContext:", v6);

}

- (void)presentTransientOverlayForActivityContinuationWithActivityIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  v4 = a3;
  v9 = -[SBInCallTransientOverlayManager _newAlertDefinition](self, "_newAlertDefinition");
  -[SBInCallTransientOverlayManager _remoteTransientOverlaySessionManager](self, "_remoteTransientOverlaySessionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sessionWithDefinition:options:", v9, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0DAAF70]);
  objc_msgSend(v6, "prepareWithConfigurationContext:", v7);
  v8 = objc_alloc_init(MEMORY[0x1E0DAAF58]);
  objc_msgSend(v8, "setActivityContinuationIdentifier:", v4);

  objc_msgSend(v6, "activateWithContext:", v8);
}

- (void)presentTransientOverlayForUILock
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = -[SBInCallTransientOverlayManager _newAlertDefinition](self, "_newAlertDefinition");
  -[SBInCallTransientOverlayManager _remoteTransientOverlaySessionManager](self, "_remoteTransientOverlaySessionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionWithDefinition:options:", v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0DAAF70]);
  objc_msgSend(v5, "prepareWithConfigurationContext:", v6);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__SBInCallTransientOverlayManager_presentTransientOverlayForUILock__block_invoke;
  v8[3] = &unk_1E8EA5E10;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v7, "getActionForHandlingButtonEvents:completion:", 1, v8);

}

void __67__SBInCallTransientOverlayManager_presentTransientOverlayForUILock__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = objc_alloc_init(MEMORY[0x1E0DAAF58]);
  objc_msgSend(v3, "setReason:", *MEMORY[0x1E0DAC918]);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setActions:", v4);

  }
  objc_msgSend(*(id *)(a1 + 32), "activateWithContext:", v3);

}

- (id)_newAlertDefinition
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0DAAF78]);
  TUInCallRemoteAlertViewControllerClassName();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithServiceName:viewControllerClassName:", CFSTR("com.apple.InCallService"), v3);

  return v4;
}

- (id)_remoteTransientOverlaySessionManager
{
  return (id)objc_msgSend((id)SBApp, "remoteTransientOverlaySessionManager");
}

@end
