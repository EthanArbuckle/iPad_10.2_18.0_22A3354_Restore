@implementation FBSSceneClientSettings(PosterUIFoundation)

- (uint64_t)pui_inExtendedRenderSession
{
  void *v1;
  uint64_t IsYes;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "flagForSetting:", 20513);
  IsYes = BSSettingFlagIsYes();

  return IsYes;
}

- (uint64_t)pui_significantEventOptions
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
  objc_msgSend(v1, "objectForSetting:", 20515);
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

  v7 = objc_msgSend(v6, "integerValue");
  return v7;
}

- (uint64_t)pui_didFinishInitialization
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLForSetting:", 20512);

  return v2;
}

- (uint64_t)pui_significantEventTime
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
  objc_msgSend(v1, "objectForSetting:", 20514);
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

  v7 = objc_msgSend(v6, "unsignedLongLongValue");
  return v7;
}

- (uint64_t)pui_userTapEventsRequested
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

  v7 = objc_msgSend(v6, "BOOLValue");
  return v7;
}

@end
