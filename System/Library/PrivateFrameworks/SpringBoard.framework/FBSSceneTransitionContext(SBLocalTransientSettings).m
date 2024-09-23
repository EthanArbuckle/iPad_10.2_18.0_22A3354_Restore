@implementation FBSSceneTransitionContext(SBLocalTransientSettings)

- (void)setWatchdogScaleFactor:()SBLocalTransientSettings
{
  void *v3;
  id v4;

  objc_msgSend(a1, "transientLocalClientSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forSetting:", v3, 1);

}

- (double)watchdogScaleFactor
{
  void *v1;
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "transientLocalClientSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForSetting:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v4 = v3;
  }
  else
  {
    v4 = 1.0;
  }

  return v4;
}

@end
