@implementation UICarPlayApplicationSceneSettings

- (BOOL)disableFiveRowKeyboards
{
  void *v2;
  char v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 34);

  return v3;
}

- (BOOL)blackWallpaperModeEnabled
{
  void *v2;
  char v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 46);

  return v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[FBSSettings initWithSettings:](+[UIMutableCarPlayApplicationSceneSettings allocWithZone:](UIMutableCarPlayApplicationSceneSettings, "allocWithZone:", a3), "initWithSettings:", self);
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  __CFString *v6;
  __CFString *v7;
  objc_super v9;
  objc_super v10;

  v6 = CFSTR("blackWallpaperModeEnabled");
  if (a3 != 46)
    v6 = 0;
  if (a3 == 34)
    v6 = CFSTR("disableFiveRowKeyboards");
  v7 = v6;
  if (!v7)
  {
    v10.receiver = self;
    v10.super_class = (Class)UICarPlayApplicationSceneSettings;
    if (-[UICarPlayApplicationSceneSettings respondsToSelector:](&v10, sel_respondsToSelector_, a2))
    {
      v9.receiver = self;
      v9.super_class = (Class)UICarPlayApplicationSceneSettings;
      -[UIApplicationSceneSettings keyDescriptionForSetting:](&v9, sel_keyDescriptionForSetting_, a3);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
  }
  return v7;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  id v9;
  void *v10;
  objc_super v12;
  objc_super v13;

  v9 = a4;
  UICarPlayApplicationSceneSettingValueDescription(a5, a3, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v13.receiver = self;
    v13.super_class = (Class)UICarPlayApplicationSceneSettings;
    if (-[UICarPlayApplicationSceneSettings respondsToSelector:](&v13, sel_respondsToSelector_, a2))
    {
      v12.receiver = self;
      v12.super_class = (Class)UICarPlayApplicationSceneSettings;
      -[UIApplicationSceneSettings valueDescriptionForFlag:object:ofSetting:](&v12, sel_valueDescriptionForFlag_object_ofSetting_, a3, v9, a5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

@end
