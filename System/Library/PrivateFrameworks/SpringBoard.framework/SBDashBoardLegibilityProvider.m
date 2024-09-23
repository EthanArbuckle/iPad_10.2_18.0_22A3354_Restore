@implementation SBDashBoardLegibilityProvider

- (SBDashBoardLegibilityProvider)init
{
  void *v3;
  SBDashBoardLegibilityProvider *v4;

  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBDashBoardLegibilityProvider initWithWallpaperController:](self, "initWithWallpaperController:", v3);

  return v4;
}

- (SBDashBoardLegibilityProvider)initWithWallpaperController:(id)a3
{
  id v5;
  SBDashBoardLegibilityProvider *v6;
  SBDashBoardLegibilityProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBDashBoardLegibilityProvider;
  v6 = -[SBDashBoardLegibilityProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_wallpaperController, a3);
    -[SBWallpaperController addObserver:forVariant:](v7->_wallpaperController, "addObserver:forVariant:", v7, 0);
  }

  return v7;
}

- (void)wallpaperLegibilitySettingsDidChange:(id)a3 forVariant:(int64_t)a4
{
  if (!a4)
    -[SBDashBoardLegibilityProvider _notifyDelegate](self, "_notifyDelegate", a3);
}

- (void)wallpaperDidChangeForVariant:(int64_t)a3
{
  if (!a3)
    -[SBDashBoardLegibilityProvider _notifyDelegate](self, "_notifyDelegate");
}

- (id)_wallpaperLegibilitySettings
{
  return -[SBWallpaperController legibilitySettingsForVariant:](self->_wallpaperController, "legibilitySettingsForVariant:", 0);
}

- (void)_notifyDelegate
{
  id v3;

  -[SBDashBoardLegibilityProvider legibilityProviderDelegate](self, "legibilityProviderDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "coverSheetLegibilityProviderDidUpdate:", self);

}

- (CSLegibilityProviderDelegate)legibilityProviderDelegate
{
  return (CSLegibilityProviderDelegate *)objc_loadWeakRetained((id *)&self->_legibilityProviderDelegate);
}

- (void)setLegibilityProviderDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_legibilityProviderDelegate, a3);
}

- (SBWallpaperController)wallpaperController
{
  return self->_wallpaperController;
}

- (void)setWallpaperController:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaperController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperController, 0);
  objc_destroyWeak((id *)&self->_legibilityProviderDelegate);
}

@end
