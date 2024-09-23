@implementation SBSceneHandle(SceneViewControlling)

- (uint64_t)newSceneViewWithReferenceSize:()SceneViewControlling contentOrientation:containerOrientation:hostRequester:
{
  objc_class *v12;
  id v13;
  uint64_t v14;

  v12 = (objc_class *)MEMORY[0x1E0DAC258];
  v13 = a7;
  v14 = objc_msgSend([v12 alloc], "initWithSceneHandle:referenceSize:contentOrientation:containerOrientation:hostRequester:", a1, a5, a6, v13, a2, a3);

  return v14;
}

- (uint64_t)newScenePlaceholderContentContextWithActivationSettings:()SceneViewControlling
{
  return 0;
}

- (SBSceneViewController)newSceneViewController
{
  return -[SBSceneViewController initWithSceneHandle:]([SBSceneViewController alloc], "initWithSceneHandle:", a1);
}

@end
