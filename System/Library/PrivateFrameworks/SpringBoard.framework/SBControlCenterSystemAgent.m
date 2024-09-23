@implementation SBControlCenterSystemAgent

- (BOOL)isRingerMuted
{
  void *v2;
  char v3;
  void *v5;
  void *v6;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBControlCenterSystemAgent isRingerMuted]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("SBControlCenterSystemAgent.m"), 29, CFSTR("this call must be made on the main thread"));

  }
  objc_msgSend((id)SBApp, "ringerControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[SBRingerControl isRingerMuted]((uint64_t)v2);

  return v3;
}

- (void)setRingerMuted:(BOOL)a3 reason:(id)a4
{
  _BOOL8 v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3978];
  v6 = a4;
  if ((objc_msgSend(v5, "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBControlCenterSystemAgent setRingerMuted:reason:]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("SBControlCenterSystemAgent.m"), 34, CFSTR("this call must be made on the main thread"));

  }
  objc_msgSend((id)SBApp, "ringerControl");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRingerMuted:withFeedback:reason:clientType:", v4, 1, v6, 2);

}

- (id)observeRingerMutedWithBlock:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3978];
  v4 = a3;
  if ((objc_msgSend(v3, "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBControlCenterSystemAgent observeRingerMutedWithBlock:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("SBControlCenterSystemAgent.m"), 39, CFSTR("this call must be made on the main thread"));

  }
  objc_msgSend((id)SBApp, "ringerControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "observeRingerMutedWithBlock:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)lockOrientation
{
  void *v2;
  void *v3;
  id v4;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBControlCenterSystemAgent lockOrientation]");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SBControlCenterSystemAgent.m"), 46, CFSTR("this call must be made on the main thread"));

  }
  +[SBOrientationLockManager sharedInstance](SBOrientationLockManager, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lock");

}

- (void)unlockOrientation
{
  void *v2;
  void *v3;
  id v4;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBControlCenterSystemAgent unlockOrientation]");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SBControlCenterSystemAgent.m"), 51, CFSTR("this call must be made on the main thread"));

  }
  +[SBOrientationLockManager sharedInstance](SBOrientationLockManager, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unlock");

}

- (BOOL)isOrientationLocked
{
  void *v2;
  char v3;
  void *v5;
  void *v6;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBControlCenterSystemAgent isOrientationLocked]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("SBControlCenterSystemAgent.m"), 56, CFSTR("this call must be made on the main thread"));

  }
  +[SBOrientationLockManager sharedInstance](SBOrientationLockManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUserLocked");

  return v3;
}

- (BOOL)isUILocked
{
  void *v2;
  char v3;
  void *v5;
  void *v6;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBControlCenterSystemAgent isUILocked]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("SBControlCenterSystemAgent.m"), 62, CFSTR("this call must be made on the main thread"));

  }
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUILocked");

  return v3;
}

- (BOOL)isPasscodeLocked
{
  void *v3;
  void *v4;
  char v5;
  void *v7;
  void *v8;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBControlCenterSystemAgent isPasscodeLocked]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("SBControlCenterSystemAgent.m"), 68, CFSTR("this call must be made on the main thread"));

  }
  -[SBControlCenterSystemAgent windowScene](self, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "authenticationStatusProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAuthenticated") ^ 1;

  return v5;
}

- (BOOL)isRestoring
{
  void *v2;
  char v3;
  void *v5;
  void *v6;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBControlCenterSystemAgent isRestoring]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("SBControlCenterSystemAgent.m"), 75, CFSTR("this call must be made on the main thread"));

  }
  +[SBSyncController sharedInstance](SBSyncController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRestoring");

  return v3;
}

- (BOOL)hasApplicationPlaceholderForDisplayID:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3978];
  v4 = a3;
  if ((objc_msgSend(v3, "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBControlCenterSystemAgent hasApplicationPlaceholderForDisplayID:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("SBControlCenterSystemAgent.m"), 80, CFSTR("this call must be made on the main thread"));

  }
  +[SBApplicationPlaceholderController sharedInstance](SBApplicationPlaceholderController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "placeholderForDisplayID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

- (BOOL)hasApplicationForDisplayID:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3978];
  v4 = a3;
  if ((objc_msgSend(v3, "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBControlCenterSystemAgent hasApplicationForDisplayID:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("SBControlCenterSystemAgent.m"), 86, CFSTR("this call must be made on the main thread"));

  }
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applicationWithBundleIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

- (id)reasonToDisallowEditing
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v8;
  void *v9;
  id v10;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBControlCenterSystemAgent reasonToDisallowEditing]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("SBControlCenterSystemAgent.m"), 94, CFSTR("this call must be made on the main thread"));

  }
  -[SBControlCenterSystemAgent windowScene](self, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sceneManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "policyAggregator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  objc_msgSend(v5, "allowsCapability:explanation:", 29, &v10);
  v6 = v10;

  return v6;
}

- (SBWindowScene)windowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (void)setWindowScene:(id)a3
{
  objc_storeWeak((id *)&self->_windowScene, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
}

@end
