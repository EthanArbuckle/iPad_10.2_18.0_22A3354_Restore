@implementation SBSwipeUpFloatingApplicationGestureWorkspaceTransaction

- (int64_t)_gestureType
{
  return 3;
}

- (id)selectedAppLayoutForGestureRecognizer:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[SBFluidSwitcherGestureWorkspaceTransaction switcherViewController](self, "switcherViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appLayouts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
