@implementation SBLockScreenPluginOverlayViewController

+ (BOOL)_pluginNeedsOverlay:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v12;

  v3 = a3;
  objc_msgSend(v3, "appearance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "backgroundStyle");

  if (v5 == 3)
  {
    +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "legibilitySettingsForVariant:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appearance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "legibilitySettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v7, "style");
    v12 = objc_msgSend(v9, "style") != 2 && v10 == 2;

  }
  else
  {
    v12 = v5 != 0;
  }

  return v12;
}

- (SBLockScreenPluginOverlayViewController)initWithPlugin:(id)a3
{
  id v4;
  SBLockScreenPluginOverlayViewController *v5;
  SBLockScreenPluginOverlayViewController *v6;
  SBLockScreenPluginOverlayViewController *v7;
  objc_super v9;

  v4 = a3;
  if (+[SBLockScreenPluginOverlayViewController _pluginNeedsOverlay:](SBLockScreenPluginOverlayViewController, "_pluginNeedsOverlay:", v4))
  {
    v9.receiver = self;
    v9.super_class = (Class)SBLockScreenPluginOverlayViewController;
    v5 = -[SBLockScreenPluginOverlayViewController init](&v9, sel_init);
    v6 = v5;
    if (v5)
      objc_storeWeak((id *)&v5->_plugin, v4);
    self = v6;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)loadView
{
  id v3;

  v3 = -[SBLockScreenPluginOverlayViewController _newOverlayView](self, "_newOverlayView");
  -[SBLockScreenPluginOverlayViewController setView:](self, "setView:", v3);

}

- (id)_newOverlayView
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  SBLockOverlayView *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_plugin);
  objc_msgSend(WeakRetained, "appearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "backgroundStyle");

  if (!v4)
    return 0;
  if (v4 != 2)
    v4 = 1;
  v5 = [SBLockOverlayView alloc];
  return -[SBUILockOverlayView initWithFrame:style:](v5, "initWithFrame:style:", v4, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_plugin);
}

@end
