@implementation FBSSceneTransitionContext(PRRenderingScene)

- (uint64_t)pr_updateSnapshot
{
  void *v1;
  uint64_t IsYes;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "flagForSetting:", 20563);
  IsYes = BSSettingFlagIsYes();

  return IsYes;
}

- (void)pr_setUpdateSnapshot:()PRRenderingScene
{
  id v1;

  objc_msgSend(a1, "otherSettings");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setFlag:forSetting:", BSSettingFlagIfYes(), 20563);

}

- (BOOL)pr_finishUnlockingWithParameters:()PRRenderingScene
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "otherSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForSetting:", 20564);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 && v5)
  {
    objc_msgSend(v5, "bs_CGSizeValue");
    *a3 = v6;
    a3[1] = v7;
  }

  return v5 != 0;
}

- (double)pr_finishUnlockParameters
{
  void *v1;
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForSetting:", 20564);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(v2, "bs_CGSizeValue");
    v4 = v3;
  }
  else
  {
    v4 = *MEMORY[0x1E0C9D820];
  }

  return v4;
}

- (void)pr_setFinishUnlockParameters:()PRRenderingScene
{
  void *v5;
  void *v6;
  _QWORD v7[2];

  objc_msgSend(a1, "otherSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(double *)v7 = a2;
  *(double *)&v7[1] = a3;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v7, "{CGSize=dd}");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v6, 20564);

}

@end
