@implementation SBLoginAppContainerPluginWrapperViewController

- (SBLoginAppContainerPluginWrapperViewController)initWithPlugin:(id)a3
{
  id v5;
  SBLoginAppContainerPluginWrapperViewController *v6;
  SBLoginAppContainerPluginWrapperViewController *v7;
  SBLockScreenPluginOverlayViewController *v8;
  SBLockScreenPluginOverlayViewController *overlayController;
  SBLoginAppContainerOverlayWrapperView *v10;
  void *v11;
  uint64_t v12;
  SBLoginAppContainerOverlayWrapperView *overlayWrapperView;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBLoginAppContainerPluginWrapperViewController;
  v6 = -[SBLoginAppContainerPluginWrapperViewController initWithNibName:bundle:](&v15, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_plugin, a3);
    v8 = -[SBLockScreenPluginOverlayViewController initWithPlugin:]([SBLockScreenPluginOverlayViewController alloc], "initWithPlugin:", v7->_plugin);
    overlayController = v7->_overlayController;
    v7->_overlayController = v8;

    v10 = [SBLoginAppContainerOverlayWrapperView alloc];
    -[SBLockOverlayViewController overlayView](v7->_overlayController, "overlayView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SBLoginAppContainerOverlayWrapperView initWithFrame:overlayView:](v10, "initWithFrame:overlayView:", v11, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    overlayWrapperView = v7->_overlayWrapperView;
    v7->_overlayWrapperView = (SBLoginAppContainerOverlayWrapperView *)v12;

  }
  return v7;
}

- (void)loadView
{
  void *v3;
  void *v4;
  SBLoginAppContainerPluginWrapperView *v5;
  SBLoginAppContainerOverlayWrapperView *overlayWrapperView;
  void *v7;
  void *v8;
  SBLoginAppContainerPluginWrapperView *v9;
  SBLoginAppContainerPluginWrapperView *containerView;
  id v11;

  -[SBLockScreenPlugin viewController](self->_plugin, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "willMoveToParentViewController:", self);

  -[SBLockScreenPlugin viewController](self->_plugin, "viewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBLoginAppContainerPluginWrapperViewController addChildViewController:](self, "addChildViewController:", v4);

  v5 = [SBLoginAppContainerPluginWrapperView alloc];
  overlayWrapperView = self->_overlayWrapperView;
  -[SBLockScreenPlugin viewController](self->_plugin, "viewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SBLoginAppContainerPluginWrapperView initWithFrame:overlayWrapperView:pluginView:](v5, "initWithFrame:overlayWrapperView:pluginView:", overlayWrapperView, v8, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  containerView = self->_containerView;
  self->_containerView = v9;

  -[SBLoginAppContainerPluginWrapperViewController setView:](self, "setView:", self->_containerView);
  -[SBLockScreenPlugin viewController](self->_plugin, "viewController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "didMoveToParentViewController:", self);

}

- (BOOL)handleVolumeUpButtonPress
{
  SBLockScreenPlugin *plugin;
  void *v3;

  plugin = self->_plugin;
  objc_msgSend(MEMORY[0x1E0D1BBB8], "eventWithType:", 30);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(plugin) = -[SBLockScreenPlugin handleDashBoardEvent:](plugin, "handleDashBoardEvent:", v3);

  return (char)plugin;
}

- (BOOL)handleVolumeDownButtonPress
{
  SBLockScreenPlugin *plugin;
  void *v3;

  plugin = self->_plugin;
  objc_msgSend(MEMORY[0x1E0D1BBB8], "eventWithType:", 31);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(plugin) = -[SBLockScreenPlugin handleDashBoardEvent:](plugin, "handleDashBoardEvent:", v3);

  return (char)plugin;
}

- (SBLockScreenPlugin)plugin
{
  return self->_plugin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_overlayWrapperView, 0);
  objc_storeStrong((id *)&self->_overlayController, 0);
  objc_storeStrong((id *)&self->_plugin, 0);
}

@end
