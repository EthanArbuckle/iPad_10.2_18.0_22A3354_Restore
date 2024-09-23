@implementation SBPPTRunner(DockPPTs)

- (id)_mainDisplayWindowScene
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend((id)SBApp, "windowSceneManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connectedWindowScenes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_firstObjectPassingTest:", &__block_literal_global_228);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
