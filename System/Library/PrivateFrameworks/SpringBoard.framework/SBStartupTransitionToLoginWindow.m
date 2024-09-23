@implementation SBStartupTransitionToLoginWindow

- (id)suggestedLockAnimationForTransitionRequest:(id)a3
{
  id v4;
  void *v5;
  int v6;
  SBUIStartupToLoginWindowAnimationController *v7;
  void *v8;
  void *v9;
  SBUIStartupToLoginWindowAnimationController *v10;
  objc_super v12;

  v4 = a3;
  -[SBBaseStartupTransition context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isLogout");

  if (v6)
  {
    v7 = [SBUIStartupToLoginWindowAnimationController alloc];
    -[SBBaseStartupTransition context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "overlay");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SBUIStartupToLoginWindowAnimationController initWithTransitionContextProvider:overlay:](v7, "initWithTransitionContextProvider:overlay:", v4, v9);

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SBStartupTransitionToLoginWindow;
    -[SBStartupTransitionToLockOut suggestedLockAnimationForTransitionRequest:](&v12, sel_suggestedLockAnimationForTransitionRequest_, v4);
    v10 = (SBUIStartupToLoginWindowAnimationController *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

@end
