@implementation SBSceneResizeFluidGestureWorkspaceTransaction

- (int64_t)_gestureType
{
  return 7;
}

- (id)layoutState
{
  void *v2;
  void *v3;
  void *v4;

  -[SBFluidSwitcherGestureWorkspaceTransaction switcherViewController](self, "switcherViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)selectedAppLayout
{
  void *v2;
  void *v3;

  -[SBSceneResizeFluidGestureWorkspaceTransaction layoutState](self, "layoutState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_willAddChildTransaction:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  objc_super v9;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  if (v8)
  {
    objc_msgSend(v8, "addObserver:", self);
    objc_msgSend(v8, "setOptions:", 2);
  }
  v9.receiver = self;
  v9.super_class = (Class)SBSceneResizeFluidGestureWorkspaceTransaction;
  -[SBSceneResizeFluidGestureWorkspaceTransaction _willAddChildTransaction:](&v9, sel__willAddChildTransaction_, v6);

}

@end
