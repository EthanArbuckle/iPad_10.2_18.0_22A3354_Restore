@implementation FBSMutableSceneClientSettings(PRRenderingScene)

- (void)pr_setPreferredProminentColor:()PRRenderingScene
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 20719);

}

- (void)pr_setAverageColor:()PRRenderingScene
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 20714);

}

- (id)pr_desiredLegibilitySettings
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForSetting:", 20717);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)pr_setDesiredLegibilitySettings:()PRRenderingScene
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 20717);

}

- (void)pr_setHandlesWakeAnimation:()PRRenderingScene
{
  void *v4;
  id v5;

  objc_msgSend(a1, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 20713);

}

- (void)pr_setContentSize:()PRRenderingScene
{
  void *v5;
  id v6;

  if (a2 == *MEMORY[0x1E0C9D820] && a3 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "bs_valueWithCGSize:");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(a1, "otherSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v6, 20715);

}

- (void)pr_setHideChrome:()PRRenderingScene
{
  void *v4;
  id v5;

  objc_msgSend(a1, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 20716);

}

- (void)pr_setHideDimmingLayer:()PRRenderingScene
{
  void *v4;
  id v5;

  objc_msgSend(a1, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 20718);

}

@end
