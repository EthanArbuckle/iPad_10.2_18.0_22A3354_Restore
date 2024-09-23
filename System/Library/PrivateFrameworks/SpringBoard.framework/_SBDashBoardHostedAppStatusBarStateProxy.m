@implementation _SBDashBoardHostedAppStatusBarStateProxy

- (int64_t)_fallbackInterfaceOrientation
{
  id WeakRetained;
  int64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_hostedAppVCBackReference);
  v3 = objc_msgSend(WeakRetained, "contentInterfaceOrientation");

  return v3;
}

- (BOOL)_suppressInheritedPartStyles
{
  if (_suppressInheritedPartStyles_onceToken != -1)
    dispatch_once(&_suppressInheritedPartStyles_onceToken, &__block_literal_global_255);
  return _suppressInheritedPartStyles_sAllowSplitView;
}

- (double)_statusBarAlpha
{
  id WeakRetained;
  void *v4;
  double v5;
  double v6;
  objc_super v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_hostedAppVCBackReference);
  objc_msgSend(WeakRetained, "_appViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "statusBarAlpha");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_SBDashBoardHostedAppStatusBarStateProxy;
    -[SBDeviceApplicationSceneStatusBarStateProxy _statusBarAlpha](&v8, sel__statusBarAlpha);
  }
  v6 = v5;

  return v6;
}

- (SBDashBoardHostedAppViewController)hostedAppVCBackReference
{
  return (SBDashBoardHostedAppViewController *)objc_loadWeakRetained((id *)&self->_hostedAppVCBackReference);
}

- (void)setHostedAppVCBackReference:(id)a3
{
  objc_storeWeak((id *)&self->_hostedAppVCBackReference, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hostedAppVCBackReference);
}

@end
