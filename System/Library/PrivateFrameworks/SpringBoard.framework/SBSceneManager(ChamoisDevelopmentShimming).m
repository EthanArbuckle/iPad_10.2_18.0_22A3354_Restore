@implementation SBSceneManager(ChamoisDevelopmentShimming)

- (SBLayoutState)currentLayoutState
{
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  -[SBSceneManager _sbWindowScene](self, "_sbWindowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutStateProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneManager.m"), 1467, CFSTR("%@ has no layout state- does your corresponding window scene exist yet?"), self);

  }
  return (SBLayoutState *)v6;
}

@end
