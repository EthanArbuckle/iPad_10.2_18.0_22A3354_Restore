@implementation SBSUserNotificationImageDefinition

+ (id)definitionWithImagePath:(id)a3
{
  id v3;
  SBSUserNotificationImageAssetDefinition *v4;

  v3 = a3;
  v4 = -[SBSUserNotificationImageAssetDefinition initWithImagePath:]([SBSUserNotificationImageAssetDefinition alloc], "initWithImagePath:", v3);

  return v4;
}

+ (id)definitionWithImageCatalogPath:(id)a3 catalogImageKey:(id)a4
{
  id v5;
  id v6;
  SBSUserNotificationImageAssetDefinition *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[SBSUserNotificationImageAssetDefinition initWithImageCatalogPath:catalogImageKey:]([SBSUserNotificationImageAssetDefinition alloc], "initWithImageCatalogPath:catalogImageKey:", v6, v5);

  return v7;
}

+ (id)definitionWithSystemImageName:(id)a3
{
  id v3;
  SBSUserNotificationSystemImageDefinition *v4;

  v3 = a3;
  v4 = -[SBSUserNotificationSystemImageDefinition initWithSystemImageName:]([SBSUserNotificationSystemImageDefinition alloc], "initWithSystemImageName:", v3);

  return v4;
}

+ (id)definitionWithSystemImageName:(id)a3 tintColorDefinition:(id)a4
{
  id v5;
  id v6;
  SBSUserNotificationSystemImageDefinition *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[SBSUserNotificationSystemImageDefinition initWithSystemImageName:tintColor:]([SBSUserNotificationSystemImageDefinition alloc], "initWithSystemImageName:tintColor:", v6, v5);

  return v7;
}

+ (id)definitionWithSystemImageName:(id)a3 tintColor:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  +[SBSUserNotificationColorDefinition definitionWithColor:](SBSUserNotificationColorDefinition, "definitionWithColor:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "definitionWithSystemImageName:tintColorDefinition:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)definitionWithSystemImageName:(id)a3 tintColorName:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  +[SBSUserNotificationColorDefinition definitionWithColorName:](SBSUserNotificationColorDefinition, "definitionWithColorName:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "definitionWithSystemImageName:tintColorDefinition:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
