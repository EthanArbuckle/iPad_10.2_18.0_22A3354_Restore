@implementation UIMutableApplicationSceneSettings

- (void)setArtworkSubtype:(unint64_t)a3
{
  void *v4;
  id v5;

  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 21);

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[FBSSettings initWithSettings:]([UIApplicationSceneSettings alloc], "initWithSettings:", self);
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  void *v4;
  id v5;

  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 10);

}

- (BOOL)isUISubclass
{
  return 1;
}

- (void)setScreenReferenceDisplayModeStatus:(int64_t)a3
{
  void *v4;
  id v5;

  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 39);

}

- (void)setHomeAffordanceOverlayAllowance:(double)a3
{
  void *v4;
  id v5;

  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 22);

}

- (unint64_t)deactivationReasons
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (void)setDeactivationReasons:(unint64_t)a3
{
  void *v5;
  id v6;

  if (((-[UIMutableApplicationSceneSettings deactivationReasons](self, "deactivationReasons") >> 11) & 1) != ((a3 >> 11) & 1))
    -[UIMutableApplicationSceneSettings setOccluded:](self, "setOccluded:", (a3 & 0x800) != 0);
  -[FBSSettings otherSettings](self, "otherSettings");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forSetting:", v5, 3);

}

- (void)setSafeAreaInsetsPortrait:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  void *v7;
  void *v8;
  _QWORD v9[4];

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[FBSSettings otherSettings](self, "otherSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(CGFloat *)v9 = top;
  *(CGFloat *)&v9[1] = left;
  *(CGFloat *)&v9[2] = bottom;
  *(CGFloat *)&v9[3] = right;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v9, "{UIEdgeInsets=dddd}");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forSetting:", v8, 15);

}

- (void)setPeripheryInsets:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  void *v7;
  void *v8;
  _QWORD v9[4];

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[FBSSettings otherSettings](self, "otherSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(CGFloat *)v9 = top;
  *(CGFloat *)&v9[1] = left;
  *(CGFloat *)&v9[2] = bottom;
  *(CGFloat *)&v9[3] = right;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v9, "{UIEdgeInsets=dddd}");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forSetting:", v8, 12);

}

- (void)setScenePresenterRenderIdentifierForSnapshotting:(unint64_t)a3
{
  void *v4;
  id v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  -[FBSSettings otherSettings](self, "otherSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forSetting:", v5, 31);

}

- (void)setInLiveResize:(BOOL)a3
{
  id v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFlag:forSetting:", BSSettingFlagForBool(), 40);

}

- (void)setScreenBoundsIgnoresSceneOrientation:(BOOL)a3
{
  id v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFlag:forSetting:", BSSettingFlagForBool(), 42);

}

- (void)setEnhancedWindowingEnabled:(BOOL)a3
{
  id v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFlag:forSetting:", BSSettingFlagForBool(), 41);

}

- (void)setCanShowAlerts:(BOOL)a3
{
  id v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFlag:forSetting:", BSSettingFlagForBool(), 7);

}

- (void)setDefaultStatusBarHeight:(double)a3 forOrientation:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  switch(a4)
  {
    case 1:
      -[FBSSettings otherSettings](self, "otherSettings");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v9;
      v7 = v5;
      v8 = 25;
      goto LABEL_6;
    case 2:
      -[FBSSettings otherSettings](self, "otherSettings");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v9;
      v7 = v5;
      v8 = 26;
      goto LABEL_6;
    case 3:
      -[FBSSettings otherSettings](self, "otherSettings");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v9;
      v7 = v5;
      v8 = 28;
      goto LABEL_6;
    case 4:
      -[FBSSettings otherSettings](self, "otherSettings");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v9;
      v7 = v5;
      v8 = 27;
LABEL_6:
      objc_msgSend(v6, "setObject:forSetting:", v7, v8);

      break;
    default:
      return;
  }
}

- (void)setInterfaceOrientationMode:(int64_t)a3
{
  void *v4;
  id v5;

  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 35);

}

- (void)setInterfaceOrientationMapResolver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 38);

}

- (void)setHostReferenceAngleMode:(unint64_t)a3
{
  void *v4;
  id v5;

  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 44);

}

- (void)setDeviceOrientation:(int64_t)a3
{
  void *v4;
  id v5;

  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 13);

}

- (void)setAngleFromHostReferenceUprightDirection:(double)a3
{
  void *v4;
  id v5;

  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 43);

}

- (void)setTargetOfEventDeferringEnvironments:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (v4 && objc_msgSend(v4, "count"))
    v5 = -[_UIEventDeferringEnvironmentsContainer _initWithEnvironments:]([_UIEventDeferringEnvironmentsContainer alloc], v7);
  else
    v5 = 0;
  -[FBSSettings otherSettings](self, "otherSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forSetting:", v5, 36);

}

- (void)setPersistenceIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 29);

}

- (void)setCornerRadiusConfiguration:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 23);

}

- (void)setStatusBarParts:(int64_t)a3
{
  void *v4;
  id v5;

  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 19);

}

- (void)setHostContextIdentifierForSnapshotting:(unsigned int)a3
{
  void *v4;
  id v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  -[FBSSettings otherSettings](self, "otherSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forSetting:", v5, 30);

}

- (void)setStatusBarAvoidanceFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v7;
  void *v8;
  _QWORD v9[4];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[FBSSettings otherSettings](self, "otherSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(CGFloat *)v9 = x;
  *(CGFloat *)&v9[1] = y;
  *(CGFloat *)&v9[2] = width;
  *(CGFloat *)&v9[3] = height;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v9, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forSetting:", v8, 20);

}

- (NSString)persistenceIdentifier
{
  void *v2;
  void *v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 29);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)underLock
{
  void *v3;
  int v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForSetting:", 1);

  return v4 | (-[UIMutableApplicationSceneSettings deactivationReasons](self, "deactivationReasons") >> 30) & 1;
}

- (void)setUnderLock:(BOOL)a3
{
  id v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFlag:forSetting:", BSSettingFlagForBool(), 1);

}

- (unint64_t)statusBarStyleOverridesToSuppress
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (void)setStatusBarStyleOverridesToSuppress:(unint64_t)a3
{
  void *v4;
  id v5;

  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 2);

}

- (int64_t)userInterfaceStyle
{
  void *v2;
  void *v3;
  int64_t v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (NSNumber)forcedStatusBarStyle
{
  void *v2;
  void *v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)setForcedStatusBarStyle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 4);

}

- (BOOL)forcedStatusBarForegroundTransparent
{
  void *v2;
  char v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 11);

  return v3;
}

- (void)setForcedStatusBarForegroundTransparent:(BOOL)a3
{
  id v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFlag:forSetting:", BSSettingFlagForBool(), 11);

}

- (UIEdgeInsets)peripheryInsets
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
  UIEdgeInsets result;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UIEdgeInsetsValue");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (int64_t)statusBarParts
{
  void *v2;
  void *v3;
  int64_t v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 19);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "integerValue");
  else
    v4 = 0xFFFFLL;

  return v4;
}

- (CGRect)statusBarAvoidanceFrame
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
  objc_msgSend(v2, "objectForSetting:", 20);
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

- (double)statusBarHeight
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 24);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (void)setStatusBarHeight:(double)a3
{
  void *v4;
  id v5;

  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 24);

}

- (double)defaultStatusBarHeightForOrientation:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double result;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;

  v16 = v3;
  switch(a3)
  {
    case 1:
      -[FBSSettings otherSettings](self, "otherSettings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = 25;
      goto LABEL_7;
    case 2:
      -[FBSSettings otherSettings](self, "otherSettings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = 26;
      goto LABEL_7;
    case 3:
      -[FBSSettings otherSettings](self, "otherSettings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = 28;
      goto LABEL_7;
    case 4:
      -[FBSSettings otherSettings](self, "otherSettings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = 27;
LABEL_7:
      objc_msgSend(v9, "objectForSetting:", v11, v8, v7, v4, v16, v5, v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "doubleValue");
      v15 = v14;

      result = v15;
      break;
    default:
      result = 0.0;
      break;
  }
  return result;
}

- (double)systemMinimumMargin
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (void)setSystemMinimumMargin:(double)a3
{
  void *v4;
  id v5;

  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 14);

}

- (UIEdgeInsets)safeAreaInsetsPortrait
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
  UIEdgeInsets result;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 15);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UIEdgeInsetsValue");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (double)homeAffordanceOverlayAllowance
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 22);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (UIEdgeInsets)safeAreaInsetsLandscapeLeft
{
  void *v3;
  void *v4;
  void *v5;
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
  double v16;
  double v17;
  UIEdgeInsets result;

  -[FBSSettings otherSettings](self, "otherSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForSetting:", 16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4
    || (-[FBSSettings otherSettings](self, "otherSettings"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "objectForSetting:", 18),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4))
  {
    objc_msgSend(v4, "UIEdgeInsetsValue");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    v14 = v7;
    v15 = v9;
    v16 = v11;
    v17 = v13;
  }
  else
  {
    -[UIMutableApplicationSceneSettings safeAreaInsetsPortrait](self, "safeAreaInsetsPortrait");
  }
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (void)setSafeAreaInsetsLandscapeLeft:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  void *v7;
  void *v8;
  _QWORD v9[4];

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[FBSSettings otherSettings](self, "otherSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(CGFloat *)v9 = top;
  *(CGFloat *)&v9[1] = left;
  *(CGFloat *)&v9[2] = bottom;
  *(CGFloat *)&v9[3] = right;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v9, "{UIEdgeInsets=dddd}");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forSetting:", v8, 16);

}

- (UIEdgeInsets)safeAreaInsetsPortraitUpsideDown
{
  void *v3;
  void *v4;
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
  double v16;
  UIEdgeInsets result;

  -[FBSSettings otherSettings](self, "otherSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForSetting:", 17);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(v4, "UIEdgeInsetsValue");
  else
    -[UIMutableApplicationSceneSettings safeAreaInsetsPortrait](self, "safeAreaInsetsPortrait");
  v9 = v5;
  v10 = v6;
  v11 = v7;
  v12 = v8;

  v13 = v9;
  v14 = v10;
  v15 = v11;
  v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (void)setSafeAreaInsetsPortraitUpsideDown:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  void *v7;
  void *v8;
  _QWORD v9[4];

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[FBSSettings otherSettings](self, "otherSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(CGFloat *)v9 = top;
  *(CGFloat *)&v9[1] = left;
  *(CGFloat *)&v9[2] = bottom;
  *(CGFloat *)&v9[3] = right;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v9, "{UIEdgeInsets=dddd}");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forSetting:", v8, 17);

}

- (UIEdgeInsets)safeAreaInsetsLandscapeRight
{
  void *v3;
  void *v4;
  void *v5;
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
  double v16;
  double v17;
  UIEdgeInsets result;

  -[FBSSettings otherSettings](self, "otherSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForSetting:", 18);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4
    || (-[FBSSettings otherSettings](self, "otherSettings"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "objectForSetting:", 16),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4))
  {
    objc_msgSend(v4, "UIEdgeInsetsValue");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    v14 = v7;
    v15 = v9;
    v16 = v11;
    v17 = v13;
  }
  else
  {
    -[UIMutableApplicationSceneSettings safeAreaInsetsPortrait](self, "safeAreaInsetsPortrait");
  }
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (void)setSafeAreaInsetsLandscapeRight:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  void *v7;
  void *v8;
  _QWORD v9[4];

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[FBSSettings otherSettings](self, "otherSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(CGFloat *)v9 = top;
  *(CGFloat *)&v9[1] = left;
  *(CGFloat *)&v9[2] = bottom;
  *(CGFloat *)&v9[3] = right;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v9, "{UIEdgeInsets=dddd}");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forSetting:", v8, 18);

}

- (BSCornerRadiusConfiguration)cornerRadiusConfiguration
{
  void *v2;
  void *v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 23);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (BSCornerRadiusConfiguration *)v3;
}

- (BOOL)deviceOrientationEventsEnabled
{
  int64_t v3;
  void *v5;
  char v6;

  v3 = -[UIMutableApplicationSceneSettings interfaceOrientationMode](self, "interfaceOrientationMode");
  if (v3)
    return v3 == 100;
  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLForSetting:", 6);

  return v6;
}

- (void)setDeviceOrientationEventsEnabled:(BOOL)a3
{
  id v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFlag:forSetting:", BSSettingFlagForBool(), 6);

}

- (BOOL)canShowAlerts
{
  void *v2;
  char v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 7);

  return v3;
}

- (BOOL)idleModeEnabled
{
  void *v2;
  char v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 8);

  return v3;
}

- (void)setIdleModeEnabled:(BOOL)a3
{
  id v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFlag:forSetting:", BSSettingFlagForBool(), 8);

}

- (BOOL)statusBarDisabled
{
  void *v2;
  char v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 9);

  return v3;
}

- (void)setStatusBarDisabled:(BOOL)a3
{
  id v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFlag:forSetting:", BSSettingFlagForBool(), 9);

}

- (int64_t)deviceOrientation
{
  void *v2;
  void *v3;
  int64_t v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (unint64_t)artworkSubtype
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 21);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (unsigned)hostContextIdentifierForSnapshotting
{
  void *v2;
  void *v3;
  unsigned int v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 30);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (unint64_t)scenePresenterRenderIdentifierForSnapshotting
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 31);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (int64_t)accessibilityContrast
{
  void *v2;
  void *v3;
  int64_t v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "integerValue");
  else
    v4 = -1;

  return v4;
}

- (void)setAccessibilityContrast:(int64_t)a3
{
  void *v4;
  id v5;

  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 32);

}

- (int64_t)pointerLockStatus
{
  void *v2;
  void *v3;
  int64_t v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 33);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (void)setPointerLockStatus:(int64_t)a3
{
  void *v4;
  id v5;

  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 33);

}

- (int64_t)interfaceOrientationMode
{
  void *v2;
  void *v3;
  int64_t v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 35);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (BOOL)screenBoundsIgnoresSceneOrientation
{
  void *v2;
  char v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 42);

  return v3;
}

- (int64_t)screenReferenceDisplayModeStatus
{
  void *v2;
  void *v3;
  int64_t v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 39);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (BOOL)enhancedWindowingEnabled
{
  void *v2;
  char v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 41);

  return v3;
}

- (unint64_t)hostReferenceAngleMode
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 44);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (double)angleFromHostReferenceUprightDirection
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 43);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (NSSet)targetOfEventDeferringEnvironments
{
  void *v2;
  _QWORD *v3;
  void *v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 36);
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  -[_UIEventDeferringEnvironmentsContainer environments](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (BOOL)_debugValidationOrientationMaskEnabled
{
  void *v2;
  char v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 37);

  return v3;
}

- (void)_setDebugValidationOrientationMaskEnabled:(BOOL)a3
{
  id v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFlag:forSetting:", BSSettingFlagForBool(), 37);

}

- (BSInterfaceOrientationMapResolving)interfaceOrientationMapResolver
{
  void *v2;
  void *v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 38);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (BSInterfaceOrientationMapResolving *)v3;
}

- (BOOL)inLiveResize
{
  void *v2;
  char v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 40);

  return v3;
}

- (BOOL)isCapturingContentForAdditionalRenderingDestination
{
  void *v2;
  char v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 45);

  return v3;
}

- (void)setIsCapturingContentForAdditionalRenderingDestination:(BOOL)a3
{
  id v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFlag:forSetting:", BSSettingFlagForBool(), 45);

}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  return UIApplicationSceneSettingKeyDescription(a3);
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  return UIApplicationSceneSettingValueDescription(a5, a3, a4);
}

@end
