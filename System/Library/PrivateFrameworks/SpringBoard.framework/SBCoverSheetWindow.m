@implementation SBCoverSheetWindow

+ (BOOL)sb_autorotates
{
  return SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleCoverSheet")) ^ 1;
}

- (BOOL)_canBecomeKeyWindow
{
  return 1;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  SBCoverSheetWindow *v5;
  SBCoverSheetWindow *v6;
  SBCoverSheetWindow *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBCoverSheetWindow;
  -[SBCoverSheetWindow hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (SBCoverSheetWindow *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
    v7 = 0;
  else
    v7 = v5;

  return v7;
}

- (BOOL)resignFirstResponder
{
  void *v3;
  void *v4;
  BOOL v5;
  objc_super v7;

  -[SBCoverSheetWindow rootViewController](self, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "preserveInputViews");
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBCoverSheetWindow;
    v5 = -[SBCoverSheetWindow resignFirstResponder](&v7, sel_resignFirstResponder);
  }

  return v5;
}

- (BOOL)becomeFirstResponder
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  BOOL v6;
  objc_super v8;

  -[SBCoverSheetWindow rootViewController](self, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = objc_msgSend(v4, "restoreInputViews");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBCoverSheetWindow;
    v5 = -[SBCoverSheetWindow becomeFirstResponder](&v8, sel_becomeFirstResponder);
  }
  v6 = v5;

  return v6;
}

@end
