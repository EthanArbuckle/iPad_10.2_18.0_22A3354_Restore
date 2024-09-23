@implementation SBDeviceApplicationInputUIViewProvider

- (int64_t)priority
{
  return 3;
}

- (id)acquireSystemUIScenePresentingAssertion
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend((id)SBApp, "systemUIScenesCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputUISceneController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addPresenter:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
