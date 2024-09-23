@implementation UIApplicationSceneClientSettings

- (BOOL)homeIndicatorAutoHidden
{
  void *v2;
  char v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 27);

  return v3;
}

- (unint64_t)proximityDetectionModes
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 15);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (int64_t)interfaceOrientation
{
  void *v2;
  void *v3;
  int64_t v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (BOOL)statusBarHidden
{
  void *v2;
  char v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 2);

  return v3;
}

- (double)statusBarAlpha
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 36);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[FBSSettings initWithSettings:]([UIMutableApplicationSceneClientSettings alloc], "initWithSettings:", self);
}

- (BOOL)isUISubclass
{
  return 1;
}

- (int64_t)statusBarModernStyle
{
  void *v2;
  void *v3;
  int64_t v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 35);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (unint64_t)screenEdgesDeferringSystemGestures
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 26);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (unsigned)statusBarContextID
{
  void *v2;
  void *v3;
  unsigned int v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntValue");

  return v4;
}

- (NSDictionary)statusBarPartStyles
{
  void *v2;
  void *v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 34);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (BOOL)idleTimerDisabled
{
  void *v2;
  char v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 14);

  return v3;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (NSString)canvasTitle
{
  void *v2;
  void *v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 37);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int64_t)statusBarStyle
{
  void *v2;
  void *v3;
  int64_t v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (UIEdgeInsets)primaryWindowOverlayInsets
{
  void *v2;
  NSString *v3;
  CGFloat top;
  CGFloat left;
  CGFloat bottom;
  CGFloat right;
  double v8;
  double v9;
  double v10;
  double v11;
  UIEdgeInsets v12;
  UIEdgeInsets result;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 19);
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  v12 = UIEdgeInsetsFromString(v3);
  top = v12.top;
  left = v12.left;
  bottom = v12.bottom;
  right = v12.right;

  v8 = top;
  v9 = left;
  v10 = bottom;
  v11 = right;
  result.right = v11;
  result.bottom = v10;
  result.left = v9;
  result.top = v8;
  return result;
}

- (FBSDisplayConfigurationRequest)displayConfigurationRequest
{
  void *v2;
  void *v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 24);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FBSDisplayConfigurationRequest *)v3;
}

- (NSData)activationConditionsData
{
  void *v2;
  void *v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 38);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (_UIPhysicalButtonConfigurationSet)physicalButtonConfigurations
{
  void *v2;
  void *v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 47);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UIPhysicalButtonConfigurationSet *)v3;
}

- (NSArray)audioCategoriesDisablingVolumeHUD
{
  void *v2;
  void *v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 31);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (int64_t)backgroundStyle
{
  void *v2;
  void *v3;
  int64_t v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 20);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (BOOL)isReachabilitySupported
{
  void *v2;
  char v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 25);

  return v3;
}

- (BOOL)isStatusBarForegroundTransparent
{
  void *v2;
  char v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 3);

  return v3;
}

- (int64_t)defaultStatusBarStyle
{
  void *v2;
  void *v3;
  int64_t v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (BOOL)defaultStatusBarHidden
{
  void *v2;
  char v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 6);

  return v3;
}

- (NSString)defaultPNGName
{
  void *v2;
  void *v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (double)defaultPNGExpirationTime
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (int64_t)compatibilityMode
{
  void *v2;
  void *v3;
  int64_t v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (BOOL)deviceOrientationEventsEnabled
{
  void *v2;
  char v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 10);

  return v3;
}

- (BOOL)interfaceOrientationChangesDisabled
{
  void *v2;
  char v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 11);

  return v3;
}

- (double)controlCenterAmbiguousActivationMargin
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 16);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (int64_t)controlCenterRevealMode
{
  void *v2;
  void *v3;
  int64_t v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 17);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (int64_t)notificationCenterRevealMode
{
  void *v2;
  void *v3;
  int64_t v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 18);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (int64_t)editingInteractionConfiguration
{
  void *v2;
  void *v3;
  int64_t v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 46);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "integerValue");
  else
    v4 = 1;

  return v4;
}

- (BOOL)idleModeVisualEffectsEnabled
{
  void *v2;
  char v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 21);

  return v3;
}

- (int64_t)whitePointAdaptivityStyle
{
  void *v2;
  void *v3;
  int64_t v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 22);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (FBSDisplayMode)requestedDisplayMode
{
  void *v2;
  void *v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 23);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FBSDisplayMode *)v3;
}

- (BOOL)wantsExclusiveForeground
{
  void *v2;
  char v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 28);

  return v3;
}

- (int64_t)userInterfaceStyle
{
  void *v2;
  void *v3;
  int64_t v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 29);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (unint64_t)visibleMiniAlertCount
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 30);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (double)brightnessLevel
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (BOOL)disablesMirroring
{
  void *v2;
  char v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 33);

  return v3;
}

- (int64_t)sceneActivationBias
{
  void *v2;
  void *v3;
  int64_t v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 39);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (CGRect)screenFocusedFrame
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
  objc_msgSend(v2, "objectForSetting:", 40);
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

- (int64_t)preferredPointerLockStatus
{
  void *v2;
  void *v3;
  int64_t v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 41);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (NSArray)multitaskingDragExclusionRects
{
  void *v2;
  void *v3;
  void *v4;
  NSArray *v5;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 42);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

- (unint64_t)_debugValidationOrientationMask
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 43);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (int64_t)playbackControlsState
{
  void *v2;
  void *v3;
  int64_t v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 44);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (BOOL)containsSearchView
{
  void *v2;
  char v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 48);

  return v3;
}

- (BOOL)discardSessionOnUserDisconnect
{
  void *v2;
  char v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 45);

  return v3;
}

- (BOOL)systemInputActive
{
  void *v2;
  char v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 49);

  return v3;
}

- (id)keyDescriptionForOtherSetting:(unint64_t)a3
{
  return UIApplicationSceneClientSettingKeyDescription(a3);
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofOtherSetting:(unint64_t)a5
{
  return UIApplicationSceneClientSettingValueDescription(a5, a3, a4);
}

- (BOOL)settings:(id)a3 appendDescriptionToBuilder:(id)a4 forFlag:(int64_t)a5 object:(id)a6 ofSetting:(unint64_t)a7
{
  return UIApplicationSceneClientSettingAppendCustomDescription(a7, a4, a6);
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  return UIApplicationSceneClientSettingKeyDescription(a3);
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  return UIApplicationSceneClientSettingValueDescription(a5, a3, a4);
}

@end
