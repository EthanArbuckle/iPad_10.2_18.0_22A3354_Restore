@implementation SBSystemNotesBackgroundView

- (SBSystemNotesBackgroundView)initWithFrame:(CGRect)a3
{
  SBSystemNotesBackgroundView *v3;
  void *v4;
  uint64_t v5;
  SBSystemNotesAppearanceSettings *appearanceSettings;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  UIView *tintView;
  void *v17;
  uint64_t v18;
  UIVisualEffectView *backgroundEffectView;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)SBSystemNotesBackgroundView;
  v3 = -[SBSystemNotesBackgroundView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[SBSystemNotesSettingsDomain rootSettings](SBSystemNotesSettingsDomain, "rootSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appearanceSettings");
    v5 = objc_claimAutoreleasedReturnValue();
    appearanceSettings = v3->_appearanceSettings;
    v3->_appearanceSettings = (SBSystemNotesAppearanceSettings *)v5;

    -[PTSettings addKeyObserver:](v3->_appearanceSettings, "addKeyObserver:", v3);
    -[SBSystemNotesBackgroundView bounds](v3, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v7, v9, v11, v13);
    tintView = v3->_tintView;
    v3->_tintView = (UIView *)v15;

    -[SBSystemNotesBackgroundView _updateTintView](v3, "_updateTintView");
    -[SBSystemNotesBackgroundView addSubview:](v3, "addSubview:", v3->_tintView);
    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", v17);
    backgroundEffectView = v3->_backgroundEffectView;
    v3->_backgroundEffectView = (UIVisualEffectView *)v18;

    -[UIVisualEffectView setFrame:](v3->_backgroundEffectView, "setFrame:", v8, v10, v12, v14);
    -[UIVisualEffectView setAutoresizingMask:](v3->_backgroundEffectView, "setAutoresizingMask:", 18);
    -[SBSystemNotesBackgroundView addSubview:](v3, "addSubview:", v3->_backgroundEffectView);

  }
  return v3;
}

- (void)_updateTintView
{
  UIView *tintView;
  id v3;

  tintView = self->_tintView;
  -[SBSystemNotesBackgroundView _backgroundColorFromSettings:](self, "_backgroundColorFromSettings:", self->_appearanceSettings);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](tintView, "setBackgroundColor:", v3);

}

- (id)_backgroundColorFromSettings:(id)a3
{
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v3 = (void *)MEMORY[0x1E0CEA478];
  v4 = a3;
  objc_msgSend(v4, "platterTintRed");
  v6 = v5;
  objc_msgSend(v4, "platterTintGreen");
  v8 = v7;
  objc_msgSend(v4, "platterTintBlue");
  v10 = v9;
  objc_msgSend(v4, "platterTintAlpha");
  v12 = v11;

  return (id)objc_msgSend(v3, "colorWithRed:green:blue:alpha:", v6, v8, v10, v12);
}

- (void)dealloc
{
  objc_super v3;

  -[PTSettings removeKeyObserver:](self->_appearanceSettings, "removeKeyObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)SBSystemNotesBackgroundView;
  -[SBSystemNotesBackgroundView dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appearanceSettings, 0);
  objc_storeStrong((id *)&self->_backgroundEffectView, 0);
  objc_storeStrong((id *)&self->_tintView, 0);
}

@end
