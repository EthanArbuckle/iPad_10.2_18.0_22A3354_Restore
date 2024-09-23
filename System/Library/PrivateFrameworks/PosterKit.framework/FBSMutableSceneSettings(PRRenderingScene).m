@implementation FBSMutableSceneSettings(PRRenderingScene)

- (void)pr_setWakeSourceIsSwipeToUnlock:()PRRenderingScene
{
  id v1;

  objc_msgSend(a1, "otherSettings");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setFlag:forSetting:", BSSettingFlagForBool(), 20663);

}

- (void)pr_setUnlockProgress:()PRRenderingScene
{
  void *v3;
  id v4;

  objc_msgSend(a1, "otherSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forSetting:", v3, 20664);

}

- (void)pr_setTitleAlignment:()PRRenderingScene
{
  void *v4;
  id v5;

  objc_msgSend(a1, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 20662);

}

- (void)pr_setAdjustedLuminance:()PRRenderingScene
{
  void *v4;
  id v5;

  objc_msgSend(a1, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 20665);

}

@end
