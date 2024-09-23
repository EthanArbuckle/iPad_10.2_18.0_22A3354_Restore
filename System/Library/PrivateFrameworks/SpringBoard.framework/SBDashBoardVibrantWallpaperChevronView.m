@implementation SBDashBoardVibrantWallpaperChevronView

- (SBDashBoardVibrantWallpaperChevronView)init
{
  void *v3;
  SBDashBoardVibrantWallpaperChevronView *v4;

  if ((objc_msgSend(MEMORY[0x1E0D1BC68], "supportsVibrancy") & 1) != 0)
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBDashBoardVibrantWallpaperChevronView initWithColor:](self, "initWithColor:", v3);

  return v4;
}

- (SBDashBoardVibrantWallpaperChevronView)initWithColor:(id)a3
{
  SBDashBoardVibrantWallpaperChevronView *v3;
  SBWallpaperEffectView *v4;
  SBWallpaperEffectView *effectView;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBDashBoardVibrantWallpaperChevronView;
  v3 = -[SBUIChevronView initWithColor:](&v7, sel_initWithColor_, a3);
  if (v3)
  {
    v4 = -[SBWallpaperEffectView initWithWallpaperVariant:]([SBWallpaperEffectView alloc], "initWithWallpaperVariant:", 0);
    effectView = v3->_effectView;
    v3->_effectView = v4;

    -[PBUIWallpaperEffectViewBase setStyle:](v3->_effectView, "setStyle:", 10);
  }
  return v3;
}

- (void)setLegibilitySettings:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[_UILegibilitySettings sb_isEqualToLegibilitySettings:](self->_legibilitySettings, "sb_isEqualToLegibilitySettings:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    -[SBDashBoardVibrantWallpaperChevronView _updateVibrancy](self, "_updateVibrancy");
  }

}

- (void)_updateVibrancy
{
  void *v3;
  SBWallpaperEffectView *effectView;
  id WeakRetained;

  if (objc_msgSend(MEMORY[0x1E0D1BC68], "supportsVibrancy"))
  {
    v3 = (void *)MEMORY[0x1E0D1BC68];
    effectView = self->_effectView;
    WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperColorProvider);
    objc_msgSend(v3, "updateVibrantView:backgroundView:colorProvider:", self, effectView);
  }
  else
  {
    -[_UILegibilitySettings secondaryColor](self->_legibilitySettings, "secondaryColor");
    WeakRetained = (id)objc_claimAutoreleasedReturnValue();
    -[SBUIChevronView setVibrantSettings:](self, "setVibrantSettings:", 0);
    -[SBUIChevronView setBackgroundView:](self, "setBackgroundView:", 0);
    -[SBDashBoardVibrantWallpaperChevronView setBackgroundColor:](self, "setBackgroundColor:", 0);
    -[SBUIChevronView setColor:](self, "setColor:", WeakRetained);
  }

}

- (double)strength
{
  return self->_legibilityStrength;
}

- (void)setStrength:(double)a3
{
  self->_legibilityStrength = a3;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (CSWallpaperColorProvider)wallpaperColorProvider
{
  return (CSWallpaperColorProvider *)objc_loadWeakRetained((id *)&self->_wallpaperColorProvider);
}

- (void)setWallpaperColorProvider:(id)a3
{
  objc_storeWeak((id *)&self->_wallpaperColorProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_wallpaperColorProvider);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
}

@end
