@implementation FBSSceneTransitionContext(PosterBoard)

- (uint64_t)pb_homeAppearanceChanged
{
  void *v1;
  uint64_t IsYes;

  objc_msgSend(a1, "transientLocalClientSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "flagForSetting:", 303000);
  IsYes = BSSettingFlagIsYes();

  return IsYes;
}

- (void)pb_setHomeAppearanceChanged:()PosterBoard
{
  id v1;

  objc_msgSend(a1, "transientLocalClientSettings");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setFlag:forSetting:", BSSettingFlagIfYes(), 303000);

}

@end
