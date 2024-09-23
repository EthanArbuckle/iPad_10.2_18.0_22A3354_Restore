@implementation FBSSceneSettings(PRRenderingScene)

- (uint64_t)pr_adjustedLuminance
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;

  objc_msgSend(a1, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 20665);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  if (v7)
  {
    v8 = objc_msgSend(v7, "integerValue");
  }
  else
  {
    objc_msgSend(a1, "bls_visualState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      v8 = objc_msgSend(v9, "adjustedLuminance");
    else
      v8 = 2;

  }
  return v8;
}

- (double)pr_unlockProgress
{
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  float v7;
  double v8;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForSetting:", 20664);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (v6)
  {
    objc_msgSend(v6, "floatValue");
    v8 = v7;
  }
  else
  {
    v8 = 0.0;
  }

  return v8;
}

- (uint64_t)pr_wakeSourceIsSwipeToUnlock
{
  void *v1;
  uint64_t IsYes;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "flagForSetting:", 20663);
  IsYes = BSSettingFlagIsYes();

  return IsYes;
}

- (uint64_t)pr_titleAlignment
{
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForSetting:", 20662);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (v6)
    v7 = objc_msgSend(v6, "unsignedIntegerValue");
  else
    v7 = 0;

  return v7;
}

@end
