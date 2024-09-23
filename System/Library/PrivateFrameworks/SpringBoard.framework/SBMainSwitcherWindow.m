@implementation SBMainSwitcherWindow

- (BOOL)_canBecomeKeyWindow
{
  return 1;
}

+ (BOOL)sb_autorotates
{
  return 0;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  SBMainSwitcherWindow *v8;
  SBMainSwitcherWindow *v9;
  SBMainSwitcherWindow *v10;
  objc_super v12;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBMainSwitcherWindow;
  -[SBMainSwitcherWindow hitTest:withEvent:](&v12, sel_hitTest_withEvent_, v7, x, y);
  v8 = (SBMainSwitcherWindow *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 == self)
    v10 = 0;
  else
    v10 = v8;
  if (objc_msgSend(v7, "type") == 9 && (objc_msgSend(v7, "_isTouchRoutingPolicyBased") & 1) == 0)
  {

    v10 = 0;
  }

  return v10;
}

- (unint64_t)_edgesForSystemGesturesTouchDelay
{
  return 0;
}

- (id)_hitTest:(CGPoint)a3 withEvent:(id)a4 windowServerHitTestWindow:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  objc_super v9;
  uint64_t v10;
  uint64_t v11;

  if (self == a5)
  {
    v10 = v5;
    v11 = v6;
    v9.receiver = self;
    v9.super_class = (Class)SBMainSwitcherWindow;
    -[SBMainSwitcherWindow _hitTest:withEvent:windowServerHitTestWindow:](&v9, sel__hitTest_withEvent_windowServerHitTestWindow_, a4, self, a3.x, a3.y);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (BOOL)_usesWindowServerHitTesting
{
  return 1;
}

@end
