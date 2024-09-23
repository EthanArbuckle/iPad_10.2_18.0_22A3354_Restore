@implementation GKGameSettingsInternal

- (id)initWithGameSettings:(id)a3
{
  id v4;
  GKGameSettingsInternal *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GKGameSettingsInternal;
  v5 = -[GKGameSettingsInternal init](&v12, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleID"));
    -[GKGameSettingsInternal setBundleID:](v5, "setBundleID:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allowFriendListAccess"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_1002DC518, "objectForKeyedSubscript:", v7));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allowFriendListAccess"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_1002DC518, "objectForKeyedSubscript:", v9));

      -[GKGameSettingsInternal setAllowFriendListAccess:](v5, "setAllowFriendListAccess:", objc_msgSend(v10, "integerValue"));
    }
    else
    {
      -[GKGameSettingsInternal setAllowFriendListAccess:](v5, "setAllowFriendListAccess:", -1);
    }
  }

  return v5;
}

@end
