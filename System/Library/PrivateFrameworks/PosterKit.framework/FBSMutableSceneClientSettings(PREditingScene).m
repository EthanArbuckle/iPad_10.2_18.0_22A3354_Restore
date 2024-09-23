@implementation FBSMutableSceneClientSettings(PREditingScene)

- (uint64_t)pr_isEditingFocusActive
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLForSetting:", 20812);

  return v2;
}

- (uint64_t)pr_areContentsCoveredByModalPresentation
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLForSetting:", 20813);

  return v2;
}

- (void)pr_setEditingFocusActive:()PREditingScene
{
  id v1;

  objc_msgSend(a1, "otherSettings");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setFlag:forSetting:", BSSettingFlagForBool(), 20812);

}

- (void)pr_setContentsCoveredByModalPresentation:()PREditingScene
{
  id v1;

  objc_msgSend(a1, "otherSettings");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setFlag:forSetting:", BSSettingFlagForBool(), 20813);

}

@end
