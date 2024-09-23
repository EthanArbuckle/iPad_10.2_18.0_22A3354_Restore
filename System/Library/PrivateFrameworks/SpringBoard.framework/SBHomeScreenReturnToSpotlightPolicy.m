@implementation SBHomeScreenReturnToSpotlightPolicy

+ (BOOL)areSpotlightBreadcrumbsEnabled
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  return (v3 & 0xFFFFFFFFFFFFFFFBLL) == 1;
}

- (unint64_t)homeScreenZStackParticipantDidChange:(id)a3 launchingForSpotlight:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  int64_t lastKnownActivationState;
  int64_t v9;
  _BOOL8 shouldReactivateSpotlight;
  double v11;
  double reactivationWindowDuration;
  void *v13;
  void *v14;
  UIApplicationSceneDeactivationAssertion *v15;
  UIApplicationSceneDeactivationAssertion *homeScreenInactiveReason;
  UIApplicationSceneDeactivationAssertion *spotlightSceneDeactivationAssertion;
  UIApplicationSceneDeactivationAssertion *v18;

  v4 = a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "activationState");
  lastKnownActivationState = self->_lastKnownActivationState;
  v9 = objc_msgSend(v6, "activationState");

  self->_lastKnownActivationState = v9;
  if (v7 != lastKnownActivationState)
  {
    if (v7 == 1 && !self->_homeScreenInactiveReason)
    {
      +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "sceneDeactivationManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (UIApplicationSceneDeactivationAssertion *)objc_msgSend(v14, "newAssertionWithReason:", 3);
      homeScreenInactiveReason = self->_homeScreenInactiveReason;
      self->_homeScreenInactiveReason = v15;

      -[UIApplicationSceneDeactivationAssertion acquireWithPredicate:transitionContext:](self->_homeScreenInactiveReason, "acquireWithPredicate:transitionContext:", &__block_literal_global_286, 0);
      if (lastKnownActivationState)
      {
LABEL_6:
        if (self->_shouldReactivateSpotlight)
        {
          -[SBHomeScreenReturnToSpotlightPolicy _elapsedTime](self, "_elapsedTime");
          reactivationWindowDuration = self->_reactivationWindowDuration;
          if (v7 == 2)
          {
            shouldReactivateSpotlight = 0;
            self->_shouldReactivateSpotlight = v11 <= reactivationWindowDuration;
            goto LABEL_24;
          }
          if (!v4)
          {
            if (self->_shouldAnimateReactivation)
            {
              if (v7 == 1 || lastKnownActivationState == 2)
                self->_shouldReactivateSpotlight = v11 <= reactivationWindowDuration;
              if (!v7)
              {
                shouldReactivateSpotlight = self->_shouldReactivateSpotlight;
                goto LABEL_24;
              }
            }
            else if (lastKnownActivationState == 2)
            {
              shouldReactivateSpotlight = v11 <= reactivationWindowDuration;
              self->_shouldReactivateSpotlight = shouldReactivateSpotlight;
              goto LABEL_23;
            }
          }
        }
        shouldReactivateSpotlight = 0;
LABEL_23:
        if (v7 == 1)
          return shouldReactivateSpotlight;
LABEL_24:
        -[UIApplicationSceneDeactivationAssertion relinquish](self->_spotlightSceneDeactivationAssertion, "relinquish");
        spotlightSceneDeactivationAssertion = self->_spotlightSceneDeactivationAssertion;
        self->_spotlightSceneDeactivationAssertion = 0;

        -[UIApplicationSceneDeactivationAssertion relinquish](self->_homeScreenInactiveReason, "relinquish");
        v18 = self->_homeScreenInactiveReason;
        self->_homeScreenInactiveReason = 0;

        return shouldReactivateSpotlight;
      }
    }
    else if (lastKnownActivationState)
    {
      goto LABEL_6;
    }
    if (v4)
      self->_anchorTimeForReactivationWindow = CFAbsoluteTimeGetCurrent();
    shouldReactivateSpotlight = 0;
    self->_shouldReactivateSpotlight = v4;
    goto LABEL_23;
  }
  return 0;
}

- (SBHomeScreenReturnToSpotlightPolicy)init
{
  SBHomeScreenReturnToSpotlightPolicy *v2;
  SBHomeScreenReturnToSpotlightPolicy *v3;
  void *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBHomeScreenReturnToSpotlightPolicy;
  v2 = -[SBHomeScreenReturnToSpotlightPolicy init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_reactivationWindowDuration = 8.0;
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    v3->_shouldAnimateReactivation = (v5 & 0xFFFFFFFFFFFFFFFBLL) == 1;
  }
  return v3;
}

- (void)setReactivationWindowDuration:(double)a3
{
  self->_reactivationWindowDuration = a3;
}

- (double)_elapsedTime
{
  return CFAbsoluteTimeGetCurrent() - self->_anchorTimeForReactivationWindow;
}

uint64_t __98__SBHomeScreenReturnToSpotlightPolicy_homeScreenZStackParticipantDidChange_launchingForSpotlight___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "clientHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.Spotlight"));

  return v4;
}

- (void)willReactivateSpotlight
{
  void *v3;
  void *v4;
  UIApplicationSceneDeactivationAssertion *v5;
  UIApplicationSceneDeactivationAssertion *spotlightSceneDeactivationAssertion;

  if (self->_lastKnownActivationState)
  {
    if (!self->_spotlightSceneDeactivationAssertion)
    {
      +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "sceneDeactivationManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (UIApplicationSceneDeactivationAssertion *)objc_msgSend(v4, "newAssertionWithReason:", 5);
      spotlightSceneDeactivationAssertion = self->_spotlightSceneDeactivationAssertion;
      self->_spotlightSceneDeactivationAssertion = v5;

      -[UIApplicationSceneDeactivationAssertion acquireWithPredicate:transitionContext:](self->_spotlightSceneDeactivationAssertion, "acquireWithPredicate:transitionContext:", &__block_literal_global_1_1, 0);
    }
  }
  else
  {
    self->_shouldReactivateSpotlight = 0;
  }
}

uint64_t __62__SBHomeScreenReturnToSpotlightPolicy_willReactivateSpotlight__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "clientHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.Spotlight"));

  return v4;
}

- (double)reactivationWindowDuration
{
  return self->_reactivationWindowDuration;
}

- (BOOL)shouldAnimateReactivation
{
  return self->_shouldAnimateReactivation;
}

- (void)setShouldAnimateReactivation:(BOOL)a3
{
  self->_shouldAnimateReactivation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeScreenInactiveReason, 0);
  objc_storeStrong((id *)&self->_spotlightSceneDeactivationAssertion, 0);
}

@end
