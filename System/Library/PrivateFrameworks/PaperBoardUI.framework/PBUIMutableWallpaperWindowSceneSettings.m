@implementation PBUIMutableWallpaperWindowSceneSettings

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

- (void)setWallpaperVariant:(int64_t)a3
{
  void *v4;
  id v5;

  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 727229969);

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

- (void)setLockscreenWallpaperContentsRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;
  id v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[FBSSettings otherSettings](self, "otherSettings");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", x, y, width, height);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forSetting:", v7, 727229970);

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

- (void)setLockscreenWallpaperAlpha:(double)a3
{
  void *v4;
  id v5;

  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 727229971);

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

- (void)setHomescreenWallpaperAlpha:(double)a3
{
  void *v4;
  id v5;

  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 727229972);

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

- (void)setLockscreenOnlyWallpaperAlpha:(double)a3
{
  void *v4;
  id v5;

  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 727229973);

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

- (void)setDisallowHomescreenRasterization:(BOOL)a3
{
  id v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFlag:forSetting:", BSSettingFlagIfYes(), 727229974);

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

- (void)setDisallowLockscreenRasterization:(BOOL)a3
{
  id v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFlag:forSetting:", BSSettingFlagIfYes(), 727229975);

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

- (void)setHomescreenWallpaperHidden:(BOOL)a3
{
  id v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFlag:forSetting:", BSSettingFlagIfYes(), 727229976);

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

- (void)setLockscreenWallpaperHidden:(BOOL)a3
{
  id v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFlag:forSetting:", BSSettingFlagIfYes(), 727229977);

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

- (void)setWallpaperAnimationSuspended:(BOOL)a3
{
  id v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFlag:forSetting:", BSSettingFlagIfYes(), 727229978);

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

- (void)setWallpaperRequired:(BOOL)a3
{
  id v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFlag:forSetting:", BSSettingFlagIfYes(), 727229979);

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

- (void)setHomescreenStyleChangesDelayed:(BOOL)a3
{
  id v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFlag:forSetting:", BSSettingFlagIfYes(), 727229980);

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

- (void)setCachingIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 727229981);

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

- (void)setHomescreenStyleTransitionState:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 727229982);

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

- (void)setLockscreenStyleTransitionState:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 727229983);

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

- (void)setLiveWallpaperTouchActive:(BOOL)a3
{
  id v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFlag:forSetting:", BSSettingFlagIfYes(), 727229984);

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

- (void)setLiveWallpaperInteractive:(BOOL)a3
{
  id v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFlag:forSetting:", BSSettingFlagIfYes(), 727229985);

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[FBSSettings initWithSettings:]([PBUIWallpaperWindowSceneSettings alloc], "initWithSettings:", self);
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
    v10.super_class = (Class)PBUIMutableWallpaperWindowSceneSettings;
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
    v14.super_class = (Class)PBUIMutableWallpaperWindowSceneSettings;
    -[FBSSettings valueDescriptionForFlag:object:ofSetting:](&v14, sel_valueDescriptionForFlag_object_ofSetting_, a3, v8, a5);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  return v12;
}

@end
