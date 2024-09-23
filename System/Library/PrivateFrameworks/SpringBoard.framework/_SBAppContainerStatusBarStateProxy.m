@implementation _SBAppContainerStatusBarStateProxy

- (int64_t)_statusBarStyle
{
  uint64_t v3;
  objc_super v5;

  v3 = -[_SBAppContainerStatusBarStateProxy overrideStatusBarStyle](self, "overrideStatusBarStyle");
  if (v3 != -1)
    return _SBStatusBarStyleFromLegacyStyle(v3);
  v5.receiver = self;
  v5.super_class = (Class)_SBAppContainerStatusBarStateProxy;
  return -[SBDeviceApplicationSceneStatusBarStateProxy _statusBarStyle](&v5, sel__statusBarStyle);
}

- (int64_t)_statusBarStyleForPartWithIdentifier:(id)a3 suppressingInherited:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  objc_super v11;

  v4 = a4;
  v6 = a3;
  v7 = -[_SBAppContainerStatusBarStateProxy overrideStatusBarStyle](self, "overrideStatusBarStyle");
  if (v7 == -1)
  {
    v11.receiver = self;
    v11.super_class = (Class)_SBAppContainerStatusBarStateProxy;
    v8 = -[SBDeviceApplicationSceneStatusBarStateProxy _statusBarStyleForPartWithIdentifier:suppressingInherited:](&v11, sel__statusBarStyleForPartWithIdentifier_suppressingInherited_, v6, v4);
  }
  else
  {
    v8 = _SBStatusBarStyleFromLegacyStyle(v7);
  }
  v9 = v8;

  return v9;
}

- (double)_statusBarAlpha
{
  id WeakRetained;
  void *v4;
  double v5;
  double v6;
  objc_super v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_appVCBackReference);
  objc_msgSend(WeakRetained, "_applicationSceneViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "statusBarAlpha");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_SBAppContainerStatusBarStateProxy;
    -[SBDeviceApplicationSceneStatusBarStateProxy _statusBarAlpha](&v8, sel__statusBarAlpha);
  }
  v6 = v5;

  return v6;
}

- (int64_t)overrideStatusBarStyle
{
  id WeakRetained;
  void *v3;
  int64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_appVCBackReference);
  objc_msgSend(WeakRetained, "_applicationSceneViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "overrideStatusBarStyle");
  else
    v4 = -1;

  return v4;
}

- (int64_t)_statusBarOrientationGivenFallbackOrientation:(int64_t)a3
{
  id WeakRetained;
  int64_t v6;
  objc_super v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_appVCBackReference);
  v6 = objc_msgSend(WeakRetained, "_overrideStatusBarOrientationGivenFallbackOrientation:", a3);

  if (!v6)
  {
    v8.receiver = self;
    v8.super_class = (Class)_SBAppContainerStatusBarStateProxy;
    return -[SBDeviceApplicationSceneStatusBarStateProxy _statusBarOrientationGivenFallbackOrientation:](&v8, sel__statusBarOrientationGivenFallbackOrientation_, a3);
  }
  return v6;
}

- (int64_t)_fallbackInterfaceOrientation
{
  id WeakRetained;
  int64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_appVCBackReference);
  v3 = objc_msgSend(WeakRetained, "contentOrientation");

  return v3;
}

- (SBAppContainerViewController)appVCBackReference
{
  return (SBAppContainerViewController *)objc_loadWeakRetained((id *)&self->_appVCBackReference);
}

- (void)setAppVCBackReference:(id)a3
{
  objc_storeWeak((id *)&self->_appVCBackReference, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_appVCBackReference);
}

@end
