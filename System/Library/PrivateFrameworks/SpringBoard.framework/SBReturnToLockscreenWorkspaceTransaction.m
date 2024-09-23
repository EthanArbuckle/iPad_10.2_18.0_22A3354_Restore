@implementation SBReturnToLockscreenWorkspaceTransaction

- (SBReturnToLockscreenWorkspaceTransaction)initWithTransitionRequest:(id)a3 toLockScreenEnvironment:(id)a4
{
  id v6;
  id v7;
  SBReturnToLockscreenWorkspaceTransaction *v8;
  void *v9;
  uint64_t v10;
  SBApplicationSceneEntity *fromAppSceneEntity;
  void *v12;
  id v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SBReturnToLockscreenWorkspaceTransaction;
  v8 = -[SBActivateAppUnderLockScreenWorkspaceTransaction initWithTransitionRequest:lockScreenEnvironment:](&v15, sel_initWithTransitionRequest_lockScreenEnvironment_, v6, v7);
  if (v8)
  {
    objc_msgSend(v6, "applicationContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "previousApplicationSceneEntityForLayoutRole:", 1);
    v10 = objc_claimAutoreleasedReturnValue();
    fromAppSceneEntity = v8->_fromAppSceneEntity;
    v8->_fromAppSceneEntity = (SBApplicationSceneEntity *)v10;

    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isUILocked") & 1) == 0)
    {
      objc_msgSend(v12, "lockScreenEnvironment");
      v13 = (id)objc_claimAutoreleasedReturnValue();

      if (v13 == v7)
        objc_msgSend(v9, "setAnimationDisabled:", 0);
    }

  }
  return v8;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  SBApplicationSceneEntity *fromAppSceneEntity;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBReturnToLockscreenWorkspaceTransaction;
  -[SBReturnToLockscreenWorkspaceTransaction debugDescription](&v9, sel_debugDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  fromAppSceneEntity = self->_fromAppSceneEntity;
  if (!fromAppSceneEntity)
    fromAppSceneEntity = (SBApplicationSceneEntity *)CFSTR("SpringBoard");
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("\n\tfromApp = %@"), fromAppSceneEntity);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByAppendingFormat:", CFSTR("\n\ttoLockScreen = %@"), self->super._lockScreenEnvironment);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_didComplete
{
  void *v3;
  objc_super v4;

  +[SBSceneLayoutWhitePointAdaptationController sharedInstance](SBSceneLayoutWhitePointAdaptationController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateWhitePointAdaptationStrength");

  v4.receiver = self;
  v4.super_class = (Class)SBReturnToLockscreenWorkspaceTransaction;
  -[SBActivateAppUnderLockScreenWorkspaceTransaction _didComplete](&v4, sel__didComplete);
}

- (unint64_t)_serialOverlayPreDismissalOptions
{
  return -2;
}

- (id)_setupAnimation
{
  SBUIMainScreenAnimationController *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = -[SBUIMainScreenAnimationController initWithTransitionContextProvider:]([SBUIMainScreenAnimationController alloc], "initWithTransitionContextProvider:", self->super.super.super.super._transitionRequest);
  -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUIAnimationController transitionCoordinator](v3, "transitionCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__SBReturnToLockscreenWorkspaceTransaction__setupAnimation__block_invoke;
  v8[3] = &unk_1E8EB85C0;
  v9 = v4;
  v6 = v4;
  objc_msgSend(v5, "animateAlongsideTransition:completion:", v8, 0);

  return v3;
}

void __59__SBReturnToLockscreenWorkspaceTransaction__setupAnimation__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  +[SBSceneLayoutWhitePointAdaptationController sharedInstance](SBSceneLayoutWhitePointAdaptationController, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateWhitePointAdaptationStrengthWithWorkspaceTransitionRequest:animationTransitionContext:", *(_QWORD *)(a1 + 32), v3);

}

- (void)_animationWillBegin:(BOOL)a3
{
  void *v4;
  uint64_t v5;

  if (a3)
  {
    -[SBToAppsWorkspaceTransaction toApplicationSceneEntities](self, "toApplicationSceneEntities");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      self->_animatedAppDeactivation = 1;
      objc_msgSend((id)SBApp, "_accessibilityDeactivationAnimationWillBegin");
    }
  }
}

- (void)_animationDidFinish
{
  if (self->_animatedAppDeactivation)
    self->_animatedAppDeactivation = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fromAppSceneEntity, 0);
}

@end
