@implementation SBExternalDisplayWallpaperViewController

- (SBExternalDisplayWallpaperViewController)initWithWindowScene:(id)a3
{
  id v4;
  SBExternalDisplayWallpaperViewController *v5;
  SBExternalDisplayWallpaperEffectView *v6;
  SBExternalDisplayWallpaperEffectView *wallpaperEffectView;
  id v8;
  void *v9;
  uint64_t v10;
  UIView *wallpaperContainerView;
  UIView *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SBExternalDisplayWallpaperViewController;
  v5 = -[SBExternalDisplayWallpaperViewController init](&v23, sel_init);
  if (v5)
  {
    v6 = -[SBExternalDisplayWallpaperEffectView initExternalDisplayWithDelegate:wallpaperVariant:transformOptions:]([SBExternalDisplayWallpaperEffectView alloc], "initExternalDisplayWithDelegate:wallpaperVariant:transformOptions:", v5, 1, 15);
    wallpaperEffectView = v5->_wallpaperEffectView;
    v5->_wallpaperEffectView = v6;

    -[SBExternalDisplayWallpaperEffectView setClipsToBounds:](v5->_wallpaperEffectView, "setClipsToBounds:", 1);
    -[SBExternalDisplayWallpaperEffectView setTranslatesAutoresizingMaskIntoConstraints:](v5->_wallpaperEffectView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v8 = objc_alloc(MEMORY[0x1E0CEABB0]);
    objc_msgSend(v4, "screen");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v10 = objc_msgSend(v8, "initWithFrame:");
    wallpaperContainerView = v5->_wallpaperContainerView;
    v5->_wallpaperContainerView = (UIView *)v10;

    v12 = v5->_wallpaperContainerView;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v12, "setBackgroundColor:", v13);

    -[UIView setUserInteractionEnabled:](v5->_wallpaperContainerView, "setUserInteractionEnabled:", 0);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5->_wallpaperContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SBExternalDisplayWallpaperViewController view](v5, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v5->_wallpaperContainerView);

    -[SBExternalDisplayWallpaperViewController view](v5, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)SBHPinViewWithinView();

    -[SBExternalDisplayWallpaperViewController wallpaperContainerView](v5, "wallpaperContainerView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBExternalDisplayWallpaperViewController wallpaperEffectView](v5, "wallpaperEffectView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", v18);

    -[SBExternalDisplayWallpaperViewController wallpaperEffectView](v5, "wallpaperEffectView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBExternalDisplayWallpaperViewController wallpaperContainerView](v5, "wallpaperContainerView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (id)SBHPinViewWithinView();

  }
  return v5;
}

- (BOOL)enableBlurEffects
{
  return 0;
}

- (UIView)wallpaperContainerView
{
  return self->_wallpaperContainerView;
}

- (void)setWallpaperContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaperContainerView, a3);
}

- (SBExternalDisplayWallpaperEffectView)wallpaperEffectView
{
  return self->_wallpaperEffectView;
}

- (void)setWallpaperEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaperEffectView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperEffectView, 0);
  objc_storeStrong((id *)&self->_wallpaperContainerView, 0);
}

@end
