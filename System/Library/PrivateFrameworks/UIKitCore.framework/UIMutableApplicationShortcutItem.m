@implementation UIMutableApplicationShortcutItem

- (id)copyWithZone:(_NSZone *)a3
{
  UIApplicationShortcutItem *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  id v12;

  v4 = [UIApplicationShortcutItem alloc];
  -[UIApplicationShortcutItem type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIApplicationShortcutItem localizedTitle](self, "localizedTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIApplicationShortcutItem localizedSubtitle](self, "localizedSubtitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIApplicationShortcutItem icon](self, "icon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIApplicationShortcutItem userInfoData](self, "userInfoData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[UIApplicationShortcutItem activationMode](self, "activationMode");
  -[UIApplicationShortcutItem targetContentIdentifier](self, "targetContentIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[UIApplicationShortcutItem _initWithType:localizedTitle:localizedSubtitle:icon:userInfoData:activationMode:targetContentIdentifier:](v4, "_initWithType:localizedTitle:localizedSubtitle:icon:userInfoData:activationMode:targetContentIdentifier:", v5, v6, v7, v8, v9, v10, v11);

  return v12;
}

@end
