@implementation SBUIStartupToHomescreenAnimationController

- (SBUIStartupToHomescreenAnimationController)initWithTransitionContextProvider:(id)a3
{
  return -[SBUIStartupToHomescreenAnimationController initWithTransitionContextProvider:overlay:](self, "initWithTransitionContextProvider:overlay:", a3, 0);
}

- (SBUIStartupToHomescreenAnimationController)initWithTransitionContextProvider:(id)a3 overlay:(id)a4
{
  id v7;
  id v8;
  SBUIStartupToHomescreenAnimationController *v9;
  void *v10;
  uint64_t v11;
  void *v13;
  void *v14;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIStartupToHomescreenAnimationController.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transitionRequest"));

  }
  v15.receiver = self;
  v15.super_class = (Class)SBUIStartupToHomescreenAnimationController;
  v9 = -[SBUIMainScreenAnimationController initWithTransitionContextProvider:](&v15, sel_initWithTransitionContextProvider_, v7);
  if (v9)
  {
    objc_msgSend(v7, "toApplicationSceneEntities");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("SBUIStartupToHomescreenAnimationController.m"), 34, CFSTR("cannot have an app we're activating"));

    }
    objc_storeStrong((id *)&v9->_persistentSnapshotOverlay, a4);
  }

  return v9;
}

- (BOOL)_shouldDismissBanner
{
  return 0;
}

- (id)animationSettings
{
  void *v2;
  double v3;

  v2 = (void *)MEMORY[0x1E0D016B0];
  -[SBUIStartupToHomescreenAnimationController _animationDelay](self, "_animationDelay");
  return (id)objc_msgSend(v2, "settingsWithDuration:", v3 + 0.5);
}

- (void)_startAnimation
{
  void *v3;
  BKSDisplayRenderOverlay *persistentSnapshotOverlay;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  +[SBUIController sharedInstance](SBUIController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "beginRequiringContentForReason:", CFSTR("SBUIHomeScreenActiveContentRequirementReason"));

  persistentSnapshotOverlay = self->_persistentSnapshotOverlay;
  if (persistentSnapshotOverlay)
  {
    objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:", 1.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKSDisplayRenderOverlay dismissWithAnimation:](persistentSnapshotOverlay, "dismissWithAnimation:", v5);

  }
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "iconManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUIStartupToHomescreenAnimationController _animationDelay](self, "_animationDelay");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__SBUIStartupToHomescreenAnimationController__startAnimation__block_invoke;
  v8[3] = &unk_1E8E9E980;
  v8[4] = self;
  objc_msgSend(v7, "unscatterAnimated:afterDelay:withCompletion:", 1, v8);

}

uint64_t __61__SBUIStartupToHomescreenAnimationController__startAnimation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_noteAnimationDidFinish");
}

- (void)_cleanupAnimation
{
  void *v3;
  objc_super v4;

  +[SBUIController sharedInstance](SBUIController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "beginRequiringContentForReason:", CFSTR("SBUIHomeScreenActiveContentRequirementReason"));

  v4.receiver = self;
  v4.super_class = (Class)SBUIStartupToHomescreenAnimationController;
  -[SBUIMainScreenAnimationController _cleanupAnimation](&v4, sel__cleanupAnimation);
}

- (double)_animationDelay
{
  double result;

  result = 0.75;
  if (!self->_persistentSnapshotOverlay)
    return 0.0;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentSnapshotOverlay, 0);
}

@end
