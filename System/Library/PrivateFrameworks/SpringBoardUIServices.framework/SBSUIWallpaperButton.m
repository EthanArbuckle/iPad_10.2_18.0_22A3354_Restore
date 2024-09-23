@implementation SBSUIWallpaperButton

- (SBSUIWallpaperButton)init
{
  SBSUIWallpaperButton *v2;
  SBSUIWallpaperButton *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBSUIWallpaperButton;
  v2 = -[SBSUIWallpaperButton init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SBSUIWallpaperButton _commonInit](v2, "_commonInit");
  return v3;
}

- (SBSUIWallpaperButton)initWithFrame:(CGRect)a3
{
  SBSUIWallpaperButton *v3;
  SBSUIWallpaperButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBSUIWallpaperButton;
  v3 = -[SBSUIWallpaperButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[SBSUIWallpaperButton _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  SBSUIWallpaperButton *v2;
  UIVisualEffectView *v3;
  UIVisualEffectView *effectView;
  UIVisualEffectView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v2 = self;
  -[SBSUIWallpaperButton setClipsToBounds:](v2, "setClipsToBounds:", 1);
  objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 4);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", v20);
  -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIVisualEffectView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
  effectView = v2->_effectView;
  v2->_effectView = v3;
  v5 = v3;

  -[SBSUIWallpaperButton imageView](v2, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSUIWallpaperButton insertSubview:belowSubview:](v2, "insertSubview:belowSubview:", v5, v6);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView leadingAnchor](v5, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSUIWallpaperButton leadingAnchor](v2, "leadingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v10);

  -[UIVisualEffectView trailingAnchor](v5, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSUIWallpaperButton trailingAnchor](v2, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v13);

  -[UIVisualEffectView topAnchor](v5, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSUIWallpaperButton topAnchor](v2, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v16);

  -[UIVisualEffectView bottomAnchor](v5, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSUIWallpaperButton bottomAnchor](v2, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v19);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v7);
}

- (void)setHighlighted:(BOOL)a3
{
  double v5;
  void *v6;
  BOOL v7;
  _QWORD v8[5];
  BOOL v9;
  BOOL v10;

  if (a3)
    v5 = 0.1585;
  else
    v5 = 0.317;
  -[SBSUIWallpaperButton traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceStyle") == 2;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__SBSUIWallpaperButton_setHighlighted___block_invoke;
  v8[3] = &unk_1E4C3EAA8;
  v8[4] = self;
  v9 = a3;
  v10 = v7;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v8, v5);
}

void __39__SBSUIWallpaperButton_setHighlighted___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 752);
  if (*(_BYTE *)(a1 + 40))
  {
    if (*(_BYTE *)(a1 + 41))
      v3 = 4;
    else
      v3 = 5;
  }
  else
  {
    v3 = 4;
  }
  objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEffect:", v4);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 752), "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  if (*(_BYTE *)(a1 + 40) && *(_BYTE *)(a1 + 41))
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemDarkGrayColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "colorWithAlphaComponent:", 0.4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v7);

  }
  else
  {
    objc_msgSend(v5, "setBackgroundColor:", 0);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectView, 0);
}

@end
