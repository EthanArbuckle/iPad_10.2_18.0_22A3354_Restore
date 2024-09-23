@implementation SBDeviceApplicationRemoteTransientOverlayContainerViewController

- (SBDeviceApplicationRemoteTransientOverlayContainerViewController)initWithViewProvider:(id)a3
{
  id v4;
  SBDeviceApplicationRemoteTransientOverlayContainerViewController *v5;
  SBDeviceApplicationRemoteTransientOverlayContainerViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBDeviceApplicationRemoteTransientOverlayContainerViewController;
  v5 = -[SBDeviceApplicationRemoteTransientOverlayContainerViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_viewProvider, v4);

  return v6;
}

- (int64_t)preferredStatusBarStyle
{
  id WeakRetained;
  int64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_viewProvider);
  v3 = objc_msgSend(WeakRetained, "preferredStatusBarStyle");

  return v3;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  id WeakRetained;
  int64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_viewProvider);
  v3 = objc_msgSend(WeakRetained, "preferredInterfaceOrientationForPresentation");

  return v3;
}

- (unint64_t)supportedInterfaceOrientations
{
  id WeakRetained;
  unint64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_viewProvider);
  v3 = objc_msgSend(WeakRetained, "supportedInterfaceOrientations");

  return v3;
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)SBDeviceApplicationRemoteTransientOverlayContainerViewController;
  -[SBDeviceApplicationRemoteTransientOverlayContainerViewController viewWillLayoutSubviews](&v14, sel_viewWillLayoutSubviews);
  -[SBDeviceApplicationRemoteTransientOverlayContainerViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(v3, "subviews", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        objc_msgSend(v3, "bounds");
        objc_msgSend(v9, "setFrame:");
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v6);
  }

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewProvider);
}

@end
