@implementation FBSSceneClientSettings(PREditingScene)

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

@end
