@implementation PRUISMutableModalSceneSettings

- (void)setEntryPoint:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 2606278161);

}

- (PRUISModalEntryPoint)entryPoint
{
  void *v2;
  void *v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 2606278161);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PRUISModalEntryPoint *)v3;
}

- (void)setShouldInheritHostDisplayConfiguration:(BOOL)a3
{
  id v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFlag:forSetting:", BSSettingFlagForBool(), 2606278162);

}

- (BOOL)shouldInheritHostDisplayConfiguration
{
  void *v2;
  char v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 2606278162);

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[FBSSettings initWithSettings:]([PRUISModalSceneSettings alloc], "initWithSettings:", self);
}

@end
