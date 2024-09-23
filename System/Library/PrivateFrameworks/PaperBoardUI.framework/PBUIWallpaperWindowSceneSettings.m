@implementation PBUIWallpaperWindowSceneSettings

- (int64_t)wallpaperVariant
{
  void *v2;
  void *v3;
  int64_t v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 727229969);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (CGRect)lockscreenWallpaperContentsRect
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 727229970);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "CGRectValue");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (double)lockscreenWallpaperAlpha
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 727229971);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (double)homescreenWallpaperAlpha
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 727229972);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (double)lockscreenOnlyWallpaperAlpha
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 727229973);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (BOOL)disallowHomescreenRasterization
{
  void *v2;
  char IsYes;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flagForSetting:", 727229974);
  IsYes = BSSettingFlagIsYes();

  return IsYes;
}

- (BOOL)disallowLockscreenRasterization
{
  void *v2;
  char IsYes;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flagForSetting:", 727229975);
  IsYes = BSSettingFlagIsYes();

  return IsYes;
}

- (BOOL)homescreenWallpaperHidden
{
  void *v2;
  char IsYes;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flagForSetting:", 727229976);
  IsYes = BSSettingFlagIsYes();

  return IsYes;
}

- (BOOL)lockscreenWallpaperHidden
{
  void *v2;
  char IsYes;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flagForSetting:", 727229977);
  IsYes = BSSettingFlagIsYes();

  return IsYes;
}

- (BOOL)wallpaperAnimationSuspended
{
  void *v2;
  char IsYes;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flagForSetting:", 727229978);
  IsYes = BSSettingFlagIsYes();

  return IsYes;
}

- (BOOL)wallpaperRequired
{
  void *v2;
  char IsYes;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flagForSetting:", 727229979);
  IsYes = BSSettingFlagIsYes();

  return IsYes;
}

- (BOOL)homescreenStyleChangesDelayed
{
  void *v2;
  char IsYes;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flagForSetting:", 727229980);
  IsYes = BSSettingFlagIsYes();

  return IsYes;
}

- (NSString)cachingIdentifier
{
  void *v2;
  void *v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 727229981);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (PBUIWallpaperWindowSceneStyleTransitionState)homescreenStyleTransitionState
{
  void *v2;
  void *v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 727229982);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PBUIWallpaperWindowSceneStyleTransitionState *)v3;
}

- (PBUIWallpaperWindowSceneStyleTransitionState)lockscreenStyleTransitionState
{
  void *v2;
  void *v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 727229983);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PBUIWallpaperWindowSceneStyleTransitionState *)v3;
}

- (BOOL)liveWallpaperTouchActive
{
  void *v2;
  char IsYes;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flagForSetting:", 727229984);
  IsYes = BSSettingFlagIsYes();

  return IsYes;
}

- (BOOL)liveWallpaperInteractive
{
  void *v2;
  char IsYes;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flagForSetting:", 727229985);
  IsYes = BSSettingFlagIsYes();

  return IsYes;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[FBSSettings initWithSettings:]([PBUIMutableWallpaperWindowSceneSettings alloc], "initWithSettings:", self);
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  PBUIWallpaperWindowSceneSettingKeyDescription(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PBUIWallpaperWindowSceneSettings;
    -[FBSSettings keyDescriptionForSetting:](&v10, sel_keyDescriptionForSetting_, a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
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
  PBUIWallpaperWindowSceneSettingValueDescription(a5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)PBUIWallpaperWindowSceneSettings;
    -[FBSSettings valueDescriptionForFlag:object:ofSetting:](&v14, sel_valueDescriptionForFlag_object_ofSetting_, a3, v8, a5);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  return v12;
}

@end
