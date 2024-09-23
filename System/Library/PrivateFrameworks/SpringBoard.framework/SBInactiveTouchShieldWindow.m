@implementation SBInactiveTouchShieldWindow

- (SBInactiveTouchShieldWindow)initWithDisplay:(id)a3
{
  SBInactiveTouchShieldWindow *v3;
  SBInactiveTouchShieldWindow *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBInactiveTouchShieldWindow;
  v3 = -[_UIRootWindow initWithDisplay:](&v7, sel_initWithDisplay_, a3);
  v4 = v3;
  if (v3)
  {
    -[SBInactiveTouchShieldWindow layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHitTestsAsOpaque:", 1);

  }
  return v4;
}

+ (BOOL)_isSecure
{
  return 1;
}

- (BOOL)_usesWindowServerHitTesting
{
  return 1;
}

- (BOOL)_appearsInLoupe
{
  return 0;
}

- (BOOL)_shouldPrepareScreenForWindow
{
  return 0;
}

- (BOOL)_canBecomeKeyWindow
{
  return 0;
}

@end
