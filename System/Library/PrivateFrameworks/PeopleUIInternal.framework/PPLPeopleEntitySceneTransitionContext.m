@implementation PPLPeopleEntitySceneTransitionContext

- (BOOL)shouldDismiss
{
  void *v2;
  char v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 9000);

  return v3;
}

- (void)setShouldDismiss:(BOOL)a3
{
  id v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFlag:forSetting:", BSSettingFlagIfYes(), 9000);

}

@end
