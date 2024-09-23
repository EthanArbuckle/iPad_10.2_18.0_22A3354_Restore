@implementation SBSUIStarkNotificationsSceneClientSettings

- (BOOL)isDisplayingNotification
{
  void *v2;
  char v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 2998744415);

  return v3;
}

- (BOOL)shouldBorrowScreen
{
  void *v2;
  char v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 2998744416);

  return v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[FBSSettings initWithSettings:]([SBSUIMutableStarkNotificationsSceneClientSettings alloc], "initWithSettings:", self);
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  const __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  objc_super v12;

  if (a3 == 2998744416)
    v5 = CFSTR("shouldBorrowScreen");
  else
    v5 = 0;
  if (a3 == 2998744415)
    v6 = CFSTR("displayingNotification");
  else
    v6 = (__CFString *)v5;
  v7 = v6;
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SBSUIStarkNotificationsSceneClientSettings;
    -[FBSSettings keyDescriptionForSetting:](&v12, sel_keyDescriptionForSetting_, a3);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  return v10;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  objc_super v14;

  v8 = a4;
  SBSUIStarkNotificationsSceneClientSettingValueDescription(a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)SBSUIStarkNotificationsSceneClientSettings;
    -[FBSSettings valueDescriptionForFlag:object:ofSetting:](&v14, sel_valueDescriptionForFlag_object_ofSetting_, a3, v8, a5);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  return v12;
}

@end
