@implementation BLSPauseWhenSceneBackgroundAttribute(UIKitBacklightServices)

+ (id)pauseWhenBackgroundScene:()UIKitBacklightServices
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = [a1 alloc];
  objc_msgSend(v4, "_FBSScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithFBSScene:", v6);
  return v7;
}

@end
