@implementation SBExternalDisplayWallpaperEffectView

- (id)initExternalDisplayWithDelegate:(id)a3 wallpaperVariant:(int64_t)a4 transformOptions:(unint64_t)a5
{
  id v8;
  SBExternalDisplayWallpaperEffectView *v9;
  id *p_isa;
  SBWallpaperEffectView *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  objc_super v19;

  v8 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SBExternalDisplayWallpaperEffectView;
  v9 = -[SBExternalDisplayWallpaperEffectView init](&v19, sel_init);
  p_isa = (id *)&v9->super.super.super.isa;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    v11 = -[SBWallpaperEffectView initWithWallpaperVariant:transformOptions:]([SBWallpaperEffectView alloc], "initWithWallpaperVariant:transformOptions:", a4, a5);
    v12 = p_isa[54];
    p_isa[54] = v11;

    objc_msgSend(p_isa[54], "setClipsToBounds:", 1);
    objc_msgSend(p_isa[54], "setForcesOpaque:", 1);
    v13 = p_isa[54];
    objc_msgSend(MEMORY[0x1E0D65260], "defaultConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setExternalDisplayConfiguration:", v14);

    objc_msgSend(p_isa[54], "setStyle:", 0);
    objc_msgSend(p_isa[54], "setFullscreen:", 1);
    objc_msgSend(p_isa[54], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(p_isa, "addSubview:", p_isa[54]);
    v15 = (id)SBHPinViewWithinView();
    if (objc_msgSend(p_isa, "enableBlurEffects"))
    {
      objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:options:initialWeighting:", 51, 2, 1.0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setGroupNameBase:", CFSTR("SBExternalDisplayWallpaperEffectView"));
      objc_msgSend(v16, "setUseBuiltInAlphaTransformerAndBackdropScaleAdjustmentIfNecessary:", 1);
      objc_msgSend(v16, "bs_setHitTestingDisabled:", 1);
      objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(p_isa, "addSubview:", v16);
      v17 = (id)SBHPinViewWithinView();

    }
  }

  return p_isa;
}

- (BOOL)enableBlurEffects
{
  void *v2;
  char v3;

  -[SBExternalDisplayWallpaperEffectView delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "enableBlurEffects");
  else
    v3 = 0;

  return v3;
}

- (SBExternalDisplayWallpaperConfigurations)delegate
{
  return (SBExternalDisplayWallpaperConfigurations *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)blurBackgroundView
{
  return self->_blurBackgroundView;
}

- (void)setBlurBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_blurBackgroundView, a3);
}

- (SBWallpaperEffectView)wallpaperEffectView
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
  objc_storeStrong((id *)&self->_blurBackgroundView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
