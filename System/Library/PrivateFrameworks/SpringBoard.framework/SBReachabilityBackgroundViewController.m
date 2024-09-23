@implementation SBReachabilityBackgroundViewController

- (SBReachabilityBackgroundViewController)initWithWallpaperVariant:(int64_t)a3
{
  void *v3;
  SBReachabilityBackgroundViewController *v5;
  SBReachabilityBackgroundView *v6;
  int v7;
  char v8;
  SBReachabilityBackgroundView *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBReachabilityBackgroundViewController;
  v5 = -[SBReachabilityBackgroundViewController init](&v11, sel_init);
  if (v5)
  {
    v6 = [SBReachabilityBackgroundView alloc];
    v7 = __sb__runningInSpringBoard();
    v8 = v7;
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_referenceBounds");
    }
    v9 = -[SBReachabilityBackgroundView initWithFrame:wallpaperVariant:](v6, "initWithFrame:wallpaperVariant:", a3);
    if ((v8 & 1) == 0)

    -[SBReachabilityBackgroundViewController setView:](v5, "setView:", v9);
  }
  return v5;
}

- (id)view
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBReachabilityBackgroundViewController;
  -[SBReachabilityBackgroundViewController view](&v3, sel_view);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)shouldAutorotate
{
  return SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleReachability"));
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

@end
