@implementation SBUIMutableBannerSceneClientSettings

- (NSString)transitionDismissalPreventionReason
{
  void *v2;
  void *v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1001);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setTransitionDismissalPreventionReason:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 1001);

}

- (NSString)wantsDefaultGesturePriorityReason
{
  void *v2;
  void *v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1002);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setWantsDefaultGesturePriorityReason:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 1002);

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[FBSSettings initWithSettings:]([SBUIBannerSceneClientSettings alloc], "initWithSettings:", self);
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  void *v4;
  __CFString *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBUIMutableBannerSceneClientSettings;
  -[BNMutableSceneClientSettings keyDescriptionForSetting:](&v7, sel_keyDescriptionForSetting_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 - 1000 <= 2)
  {
    v5 = off_1E4C40340[a3 - 1000];

    v4 = v5;
  }
  return v4;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  id v8;
  void *v9;
  id v10;
  objc_super v12;

  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBUIMutableBannerSceneClientSettings;
  -[BNMutableSceneClientSettings valueDescriptionForFlag:object:ofSetting:](&v12, sel_valueDescriptionForFlag_object_ofSetting_, a3, v8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5 - 1000 <= 2)
  {
    v10 = v8;

    v9 = v10;
  }

  return v9;
}

@end
