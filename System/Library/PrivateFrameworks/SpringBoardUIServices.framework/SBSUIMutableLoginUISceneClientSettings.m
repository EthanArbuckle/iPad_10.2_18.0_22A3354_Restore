@implementation SBSUIMutableLoginUISceneClientSettings

- (int64_t)idleTimerMode
{
  void *v2;
  void *v3;
  int64_t v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 736840726);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (void)setIdleTimerMode:(int64_t)a3
{
  void *v4;
  id v5;

  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 736840726);

}

- (NSString)statusBarUserNameOverride
{
  void *v2;
  void *v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 736840727);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setStatusBarUserNameOverride:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[FBSSettings otherSettings](self, "otherSettings");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(v6, "setObject:forSetting:", v5, 736840727);
}

- (int64_t)rotationMode
{
  void *v2;
  void *v3;
  int64_t v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 736840728);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (void)setRotationMode:(int64_t)a3
{
  void *v4;
  id v5;

  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 736840728);

}

- (unint64_t)wallpaperMode
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 736840729);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (void)setWallpaperMode:(unint64_t)a3
{
  void *v4;
  id v5;

  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 736840729);

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[FBSSettings initWithSettings:]([SBSUILoginUISceneClientSettings alloc], "initWithSettings:", self);
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  objc_super v4;

  if (a3 - 736840726 <= 3)
    return off_1E4C3FAA8[a3 - 736840726];
  v4.receiver = self;
  v4.super_class = (Class)SBSUIMutableLoginUISceneClientSettings;
  -[FBSSettings keyDescriptionForSetting:](&v4, sel_keyDescriptionForSetting_);
  return (id)objc_claimAutoreleasedReturnValue();
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
  SBSUILoginUISceneClientSettingValueDescription(a5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)SBSUIMutableLoginUISceneClientSettings;
    -[FBSSettings valueDescriptionForFlag:object:ofSetting:](&v14, sel_valueDescriptionForFlag_object_ofSetting_, a3, v8, a5);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  return v12;
}

@end
