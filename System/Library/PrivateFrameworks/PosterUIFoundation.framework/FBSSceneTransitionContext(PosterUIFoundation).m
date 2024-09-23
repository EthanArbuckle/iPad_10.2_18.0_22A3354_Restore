@implementation FBSSceneTransitionContext(PosterUIFoundation)

- (uint64_t)pui_significantEvent
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
  objc_msgSend(v1, "objectForSetting:", 20512);
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

  v7 = objc_msgSend(v6, "unsignedIntegerValue");
  return v7;
}

- (void)pui_setSignificantEvent:()PosterUIFoundation
{
  void *v4;
  id v5;

  objc_msgSend(a1, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 20512);

}

- (uint64_t)pui_deviceOrientation
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
  objc_msgSend(v1, "objectForSetting:", 20513);
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
    v7 = objc_msgSend(v6, "integerValue");
  else
    v7 = 0;

  return v7;
}

- (void)pui_setDeviceOrientation:()PosterUIFoundation
{
  void *v4;
  id v5;

  objc_msgSend(a1, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 20513);

}

@end
