@implementation UIStatusBarCarPlayRadarTimeItemView

- (UIStatusBarCarPlayRadarTimeItemView)initWithFrame:(CGRect)a3
{
  UIStatusBarCarPlayRadarTimeItemView *v3;
  char isInternalInstall;
  BOOL v5;
  void *v6;
  void *v7;
  int v9;
  int v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UIStatusBarCarPlayRadarTimeItemView;
  v3 = -[UIView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v3->_isInternalInstall = os_variant_has_internal_diagnostics();
    if (CFPreferencesGetAppBooleanValue(CFSTR("UIStatusBarRadarTimeItemEnabled"), CFSTR("com.apple.UIKit"), 0))
    {
      isInternalInstall = 1;
    }
    else
    {
      isInternalInstall = v3->_isInternalInstall;
      if (isInternalInstall)
      {
        if (_UIInternalPreferencesRevisionOnce != -1)
          dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
        if (_UIInternalPreferencesRevisionVar < 1
          || (v9 = _UIInternalPreference_UIStatusBarInternalRadarTimeItemEnabled,
              _UIInternalPreferencesRevisionVar == _UIInternalPreference_UIStatusBarInternalRadarTimeItemEnabled))
        {
          v5 = 1;
        }
        else
        {
          v10 = _UIInternalPreferencesRevisionVar;
          do
          {
            v5 = v10 >= v9;
            if (v10 < v9)
              break;
            _UIInternalPreferenceSync(v10, &_UIInternalPreference_UIStatusBarInternalRadarTimeItemEnabled, (uint64_t)CFSTR("UIStatusBarInternalRadarTimeItemEnabled"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
            v9 = _UIInternalPreference_UIStatusBarInternalRadarTimeItemEnabled;
          }
          while (v10 != _UIInternalPreference_UIStatusBarInternalRadarTimeItemEnabled);
        }
        if (byte_1EDDA82A4)
          isInternalInstall = 1;
        else
          isInternalInstall = v5;
      }
    }
    v3->_radarItemEnabled = isInternalInstall;
    if (v3->_isInternalInstall)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObserver:selector:name:object:", v3, sel__gatheringLogsDidChangeStatusNotification_, CFSTR("UIStatusBarCarPlayDiagnosticsStartedNotification"), 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObserver:selector:name:object:", v3, sel__gatheringLogsDidChangeStatusNotification_, CFSTR("UIStatusBarCarPlayDiagnosticsCompletedNotification"), 0);

    }
  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = CFSTR("UIStatusBarCarPlayDiagnosticsStartedNotification");
  v6[1] = CFSTR("UIStatusBarCarPlayDiagnosticsCompletedNotification");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  v5.receiver = self;
  v5.super_class = (Class)UIStatusBarCarPlayRadarTimeItemView;
  -[UIStatusBarItemView dealloc](&v5, sel_dealloc);
}

- (id)highlightImage
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;

  -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v2, "scale");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("_internal_radar_time_highlight_%ix.png"), (int)v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB34D0];
  _UIKitResourceBundlePath(CFSTR("CarPlayArtwork.bundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleWithPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIImage imageNamed:inBundle:](UIImage, "imageNamed:inBundle:", v5, v8);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = objc_msgSend(v9, "CGImage");
  objc_msgSend(v2, "scale");
  +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[_UILegibilityImageSet imageFromImage:withShadowImage:](_UILegibilityImageSet, "imageFromImage:withShadowImage:", v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (int64_t)buttonType
{
  return 1;
}

- (BOOL)allowsUserInteraction
{
  return self->_radarItemEnabled;
}

- (BOOL)usesAdvancedActions
{
  return 1;
}

- (id)contentsImage
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  objc_super v15;

  if (-[UIStatusBarCarPlayRadarTimeItemView _showRadarButtonForInternalInstalls](self, "_showRadarButtonForInternalInstalls")&& -[UIView isFocused](self, "isFocused"))
  {
    -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "scale");
    objc_msgSend(v4, "stringWithFormat:", CFSTR("_internal_radar_time_%ix.png"), (int)v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB34D0];
    _UIKitResourceBundlePath(CFSTR("CarPlayArtwork.bundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleWithPath:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[UIImage imageNamed:inBundle:](UIImage, "imageNamed:inBundle:", v6, v9);
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = objc_msgSend(v10, "CGImage");
    objc_msgSend(v3, "scale");
    +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    +[_UILegibilityImageSet imageFromImage:withShadowImage:](_UILegibilityImageSet, "imageFromImage:withShadowImage:", v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    return v13;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)UIStatusBarCarPlayRadarTimeItemView;
    -[UIStatusBarCarPlayTimeItemView contentsImage](&v15, sel_contentsImage);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)_timeImageSet
{
  void *v3;
  void *v4;
  objc_super v6;

  if (self->_currentlyGatheringLogs)
  {
    +[UIColor systemPurpleColor](UIColor, "systemPurpleColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStatusBarCarPlayTimeItemView _timeImageSetForColor:](self, "_timeImageSetForColor:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIStatusBarCarPlayRadarTimeItemView;
    -[UIStatusBarCarPlayTimeItemView _timeImageSet](&v6, sel__timeImageSet);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)_gatheringLogsDidChangeStatusNotification:(id)a3
{
  void *v4;
  int v5;

  objc_msgSend(a3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("UIStatusBarCarPlayDiagnosticsStartedNotification"));

  if (self->_currentlyGatheringLogs != v5)
  {
    self->_currentlyGatheringLogs = v5;
    -[UIStatusBarButtonActionItemView updateContentsAndWidth](self, "updateContentsAndWidth");
  }
}

- (BOOL)_showRadarButtonForInternalInstalls
{
  return self->_isInternalInstall && self->_radarItemEnabled;
}

@end
