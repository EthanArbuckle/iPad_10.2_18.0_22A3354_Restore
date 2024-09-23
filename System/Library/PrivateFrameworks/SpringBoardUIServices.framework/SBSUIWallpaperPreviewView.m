@implementation SBSUIWallpaperPreviewView

- (SBSUIWallpaperPreviewView)initWithFrame:(CGRect)a3 wallpaperView:(id)a4 disableParallax:(BOOL)a5
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  SBSUIWallpaperPreviewView *v13;
  void *v14;
  id *p_wallpaperView;
  BOOL v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  _UILegibilityLabel *irisInstructionsLabel1;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  _UILegibilityLabel *irisInstructionsLabel2;
  unint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  unint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  unint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  _SBSUIWallpaperGradientView *v62;
  UIView *gradientView;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  _SBUIWallpaperInstructionView *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  _SBUIWallpaperInstructionView *cropInstructionView;
  _SBUIWallpaperInstructionView *v73;
  void *v74;
  UILabel *v75;
  UILabel *effectStateLabel;
  UILabel *v77;
  void *v78;
  SBSUIWallpaperPreviewView *v79;
  uint64_t v81;
  void *v82;
  void *v83;
  int v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  void *v89;
  void *v90;
  objc_super v91;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a4;
  v91.receiver = self;
  v91.super_class = (Class)SBSUIWallpaperPreviewView;
  v13 = -[SBSUIWallpaperPreviewView initWithFrame:](&v91, sel_initWithFrame_, x, y, width, height);
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSUIWallpaperPreviewView setBackgroundColor:](v13, "setBackgroundColor:", v14);

    p_wallpaperView = (id *)&v13->_wallpaperView;
    objc_storeStrong((id *)&v13->_wallpaperView, a4);
    if (v13->_wallpaperView)
      -[SBSUIWallpaperPreviewView addSubview:](v13, "addSubview:");
    v84 = objc_msgSend(v12, "supportsCropping");
    v88 = v12;
    if (objc_msgSend(MEMORY[0x1E0CEABB0], "_motionEffectsEnabled"))
      v16 = objc_msgSend((id)objc_opt_class(), "allowsParallax") & !a5;
    else
      v16 = 0;
    v13->_parallaxPossible = v16;
    v17 = *p_wallpaperView;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;
    v19 = v18;

    v13->_irisPossible = v19 != 0;
    v20 = *MEMORY[0x1E0CEB590];
    objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "fontDescriptorWithSymbolicTraits:", 0);
    v22 = objc_claimAutoreleasedReturnValue();

    v87 = (void *)v22;
    objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v22, 0.0);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithFont:");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x1E0CEA5E8];
    objc_msgSend(MEMORY[0x1E0DA9E68], "dateLabelFontSize");
    objc_msgSend(v24, "systemFontOfSize:");
    v89 = (void *)v23;
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0x1E0CB3000;
    if (v13->_irisPossible)
    {
      -[SBSUIWallpaperPreviewView _makeButtonWithVisualEffectBlur](v13, "_makeButtonWithVisualEffectBlur");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("livephoto.slash"), v23);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setImage:forState:", v27, 0);

      objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("livephoto"), v23);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setImage:forState:", v28, 4);

      objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setTintColor:", v29);

      objc_msgSend(v26, "addTarget:action:forControlEvents:", v13, sel__userDidTapOnIrisButton_, 64);
      -[SBSUIWallpaperPreviewView setIrisButton:](v13, "setIrisButton:", v26);
      v30 = objc_alloc(MEMORY[0x1E0CEADE0]);
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("IRIS_INSTRUCTIONS_LINE_1"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices-OrbHW"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v30, "initWithSettings:strength:string:font:", 0, v32, v90, 5.0);
      irisInstructionsLabel1 = v13->_irisInstructionsLabel1;
      v13->_irisInstructionsLabel1 = (_UILegibilityLabel *)v33;

      -[_UILegibilityLabel setAlpha:](v13->_irisInstructionsLabel1, "setAlpha:", 0.0);
      -[SBSUIWallpaperPreviewView addSubview:](v13, "addSubview:", v13->_irisInstructionsLabel1);
      v35 = objc_alloc(MEMORY[0x1E0CEADE0]);
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("IRIS_INSTRUCTIONS_LINE_2"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices-OrbHW"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v35, "initWithSettings:strength:string:font:", 0, v37, v90, 5.0);
      irisInstructionsLabel2 = v13->_irisInstructionsLabel2;
      v13->_irisInstructionsLabel2 = (_UILegibilityLabel *)v38;

      -[_UILegibilityLabel setAlpha:](v13->_irisInstructionsLabel2, "setAlpha:", 0.0);
      -[SBSUIWallpaperPreviewView addSubview:](v13, "addSubview:", v13->_irisInstructionsLabel2);
      objc_msgSend(*p_wallpaperView, "setIrisDelegate:", v13);

      v25 = 0x1E0CB3000uLL;
    }
    v40 = v25;
    if (v13->_parallaxPossible)
    {
      -[SBSUIWallpaperPreviewView _makeButtonWithVisualEffectBlur](v13, "_makeButtonWithVisualEffectBlur");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("rectangle.and.arrow.up.right.and.arrow.down.left.slash"), v23);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setImage:forState:", v42, 0);

      objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("rectangle.and.arrow.up.right.and.arrow.down.left"), v23);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setImage:forState:", v43, 4);

      objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setTintColor:", v44);

      objc_msgSend(v41, "addTarget:action:forControlEvents:", v13, sel__userDidTapOnParallaxButton_, 64);
      -[SBSUIWallpaperPreviewView setParallaxButton:](v13, "setParallaxButton:", v41);

    }
    v81 = v20;
    objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:", v20);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "fontDescriptorWithSymbolicTraits:", 2);
    v46 = objc_claimAutoreleasedReturnValue();

    -[SBSUIWallpaperPreviewView _makeButtonWithVisualEffectBlur](v13, "_makeButtonWithVisualEffectBlur");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "layer");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = *MEMORY[0x1E0CD2A68];
    objc_msgSend(v48, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);

    objc_msgSend(v47, "titleLabel");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v46, 0.0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setFont:", v51);

    v52 = v40;
    objc_msgSend(*(id *)(v40 + 1232), "bundleForClass:", objc_opt_class());
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "localizedStringForKey:value:table:", CFSTR("WALLPAPER_PREVIEW_VIEW_CANCEL"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices"));
    v54 = objc_claimAutoreleasedReturnValue();

    v82 = (void *)v54;
    objc_msgSend(v47, "setTitle:forState:", v54, 0);
    objc_msgSend(v47, "addTarget:action:forControlEvents:", v13, sel__userDidTapOnCancelButton_, 64);
    -[SBSUIWallpaperPreviewView setCancelButton:](v13, "setCancelButton:", v47);
    -[SBSUIWallpaperPreviewView _makeButtonWithVisualEffectBlur](v13, "_makeButtonWithVisualEffectBlur");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "layer");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setCornerCurve:", v49);

    objc_msgSend(v55, "titleLabel");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v52;
    v83 = (void *)v46;
    objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v46, 0.0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setFont:", v59);

    objc_msgSend(*(id *)(v52 + 1232), "bundleForClass:", objc_opt_class());
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "localizedStringForKey:value:table:", CFSTR("WALLPAPER_PREVIEW_VIEW_SET"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v55, "setTitle:forState:", v61, 0);
    objc_msgSend(v55, "addTarget:action:forControlEvents:", v13, sel__userDidTapOnSetButton_, 64);
    -[SBSUIWallpaperPreviewView setSetButton:](v13, "setSetButton:", v55);
    v62 = objc_alloc_init(_SBSUIWallpaperGradientView);
    gradientView = v13->_gradientView;
    v13->_gradientView = &v62->super;

    -[SBSUIWallpaperPreviewView addSubview:](v13, "addSubview:", v13->_gradientView);
    objc_msgSend(MEMORY[0x1E0D01928], "preferredFontProvider");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "preferredFontForTextStyle:hiFontStyle:", v81, 4);
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    if (v84)
    {
      objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithFont:", v65);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("crop"), v85);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "imageWithRenderingMode:", 2);
      v67 = (void *)objc_claimAutoreleasedReturnValue();

      v68 = [_SBUIWallpaperInstructionView alloc];
      objc_msgSend(*(id *)(v58 + 1232), "bundleForClass:", objc_opt_class());
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "localizedStringForKey:value:table:", CFSTR("WALLPAPER_MOVE_ROTATE_SCALE"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices"));
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = -[_SBUIWallpaperInstructionView initWithImage:text:font:](v68, "initWithImage:text:font:", v67, v70, v65);
      cropInstructionView = v13->_cropInstructionView;
      v13->_cropInstructionView = (_SBUIWallpaperInstructionView *)v71;

      v73 = v13->_cropInstructionView;
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SBUIWallpaperInstructionView setTintColor:](v73, "setTintColor:", v74);

      -[SBSUIWallpaperPreviewView addSubview:](v13, "addSubview:", v13->_cropInstructionView);
    }
    v75 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    effectStateLabel = v13->_effectStateLabel;
    v13->_effectStateLabel = v75;

    v77 = v13->_effectStateLabel;
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v77, "setTextColor:", v78);

    -[UILabel setFont:](v13->_effectStateLabel, "setFont:", v65);
    -[UILabel setAlpha:](v13->_effectStateLabel, "setAlpha:", 0.0);
    -[UILabel setNumberOfLines:](v13->_effectStateLabel, "setNumberOfLines:", 0);
    -[SBSUIWallpaperPreviewView addSubview:](v13, "addSubview:", v13->_effectStateLabel);
    v79 = v13;

    v12 = v88;
  }

  return v13;
}

- (id)_makeButtonWithVisualEffectBlur
{
  return objc_alloc_init(SBSUIWallpaperButton);
}

- (void)_userDidTapOnIrisButton:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBSUIWallpaperPreviewView delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userDidTapOnIrisButton:", v4);

}

- (void)_userDidTapOnParallaxButton:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBSUIWallpaperPreviewView delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userDidTapOnParallaxButton:", v4);

}

- (void)_userDidTapOnCancelButton:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBSUIWallpaperPreviewView delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userDidTapOnCancelButton:", v4);

}

- (void)_userDidTapOnSetButton:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBSUIWallpaperPreviewView delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userDidTapOnSetButton:", v4);

}

- (void)dealloc
{
  objc_super v3;

  if (self->_irisPossible)
    -[PBUIWallpaperView setIrisDelegate:](self->_wallpaperView, "setIrisDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SBSUIWallpaperPreviewView;
  -[SBSUIWallpaperPreviewView dealloc](&v3, sel_dealloc);
}

- (void)setDateView:(id)a3
{
  SBFLockScreenDateView *dateView;
  id v6;

  v6 = a3;
  dateView = self->_dateView;
  if (dateView)
    -[SBFLockScreenDateView removeFromSuperview](dateView, "removeFromSuperview");
  objc_storeStrong((id *)&self->_dateView, a3);
  if (self->_dateView)
    -[SBSUIWallpaperPreviewView addSubview:](self, "addSubview:");

}

- (void)setIrisButton:(id)a3
{
  UIButton *irisButton;
  id v6;

  v6 = a3;
  irisButton = self->_irisButton;
  if (irisButton)
    -[UIButton removeFromSuperview](irisButton, "removeFromSuperview");
  objc_storeStrong((id *)&self->_irisButton, a3);
  if (self->_irisButton)
    -[SBSUIWallpaperPreviewView addSubview:](self, "addSubview:");

}

- (void)setParallaxButton:(id)a3
{
  UIButton *parallaxButton;
  id v6;

  v6 = a3;
  parallaxButton = self->_parallaxButton;
  if (parallaxButton)
    -[UIButton removeFromSuperview](parallaxButton, "removeFromSuperview");
  objc_storeStrong((id *)&self->_parallaxButton, a3);
  if (self->_parallaxButton)
    -[SBSUIWallpaperPreviewView addSubview:](self, "addSubview:");

}

- (void)setCancelButton:(id)a3
{
  UIButton *cancelButton;
  id v6;

  v6 = a3;
  cancelButton = self->_cancelButton;
  if (cancelButton)
    -[UIButton removeFromSuperview](cancelButton, "removeFromSuperview");
  objc_storeStrong((id *)&self->_cancelButton, a3);
  if (self->_cancelButton)
    -[SBSUIWallpaperPreviewView addSubview:](self, "addSubview:");

}

- (void)setSetButton:(id)a3
{
  UIButton *setButton;
  id v6;

  v6 = a3;
  setButton = self->_setButton;
  if (setButton)
    -[UIButton removeFromSuperview](setButton, "removeFromSuperview");
  objc_storeStrong((id *)&self->_setButton, a3);
  if (self->_setButton)
    -[SBSUIWallpaperPreviewView addSubview:](self, "addSubview:");

}

- (void)setWallpaperView:(id)a3
{
  PBUIWallpaperView **p_wallpaperView;
  PBUIWallpaperView *wallpaperView;
  id v7;

  v7 = a3;
  p_wallpaperView = &self->_wallpaperView;
  wallpaperView = self->_wallpaperView;
  if (wallpaperView)
    -[PBUIWallpaperView removeFromSuperview](wallpaperView, "removeFromSuperview");
  objc_storeStrong((id *)&self->_wallpaperView, a3);
  if (*p_wallpaperView)
  {
    -[SBSUIWallpaperPreviewView addSubview:](self, "addSubview:");
    -[SBSUIWallpaperPreviewView sendSubviewToBack:](self, "sendSubviewToBack:", *p_wallpaperView);
    if (self->_irisPossible)
      -[PBUIWallpaperView setIrisDelegate:](*p_wallpaperView, "setIrisDelegate:", self);
  }

}

- (BOOL)shouldEnableParallax
{
  double v2;

  -[PBUIWallpaperView parallaxFactor](self->_wallpaperView, "parallaxFactor");
  return v2 > 0.0;
}

- (void)updateForChangedSettings:(id)a3
{
  _UILegibilityLabel *irisInstructionsLabel1;
  id v5;

  irisInstructionsLabel1 = self->_irisInstructionsLabel1;
  v5 = a3;
  -[_UILegibilityLabel updateForChangedSettings:](irisInstructionsLabel1, "updateForChangedSettings:", v5);
  -[_UILegibilityLabel updateForChangedSettings:](self->_irisInstructionsLabel2, "updateForChangedSettings:", v5);

}

- (void)displayInstructionsForEffect:(unint64_t)a3 enabled:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _QWORD v9[5];
  id v10[2];
  BOOL v11;
  BOOL v12;
  id location;

  v5 = a5;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__SBSUIWallpaperPreviewView_displayInstructionsForEffect_enabled_animated___block_invoke;
  v9[3] = &unk_1E4C3FF30;
  v11 = v5;
  v10[1] = (id)a3;
  v9[4] = self;
  v12 = a4;
  objc_copyWeak(v10, &location);
  -[SBSUIWallpaperPreviewView _fadeOutInstructionsWithDelay:animated:completion:](self, "_fadeOutInstructionsWithDelay:animated:completion:", v5, v9, 0.0);
  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

void __75__SBSUIWallpaperPreviewView_displayInstructionsForEffect_enabled_animated___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void *v21;
  uint64_t v22;
  id v23;
  _QWORD v24[6];

  v2 = 0.0;
  if (*(_BYTE *)(a1 + 56))
    v3 = 0.25;
  else
    v3 = 0.0;
  v4 = *(_QWORD *)(a1 + 48);
  if (v4 == 1)
  {
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 480))
    {
      if (*(_BYTE *)(a1 + 57))
        v2 = 1.0;
      else
        v2 = 0.0;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = *(unsigned __int8 *)(a1 + 57);
      v8 = CFSTR("WALLPAPER_LIVE_PHOTO_ON");
      v9 = CFSTR("WALLPAPER_LIVE_PHOTO_OFF");
      goto LABEL_13;
    }
LABEL_17:
    v11 = 0;
    goto LABEL_18;
  }
  if (v4 || !*(_BYTE *)(*(_QWORD *)(a1 + 32) + 481))
    goto LABEL_17;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = *(unsigned __int8 *)(a1 + 57);
  v8 = CFSTR("WALLPAPER_PERSPECTIVE_ZOOM_ON");
  v9 = CFSTR("WALLPAPER_PERSPECTIVE_ZOOM_OFF");
LABEL_13:
  if (v7)
    v10 = v8;
  else
    v10 = v9;
  objc_msgSend(v5, "localizedStringForKey:value:table:", v10, &stru_1E4C40DE8, CFSTR("SpringBoardUIServices"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "setText:", v11);
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  v12 = objc_alloc(MEMORY[0x1E0CEABC8]);
  v13 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __75__SBSUIWallpaperPreviewView_displayInstructionsForEffect_enabled_animated___block_invoke_2;
  v24[3] = &unk_1E4C3E678;
  v24[4] = *(_QWORD *)(a1 + 32);
  *(double *)&v24[5] = v2;
  v14 = objc_msgSend(v12, "initWithDuration:curve:animations:", 0, v24, v3);
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(void **)(v15 + 424);
  *(_QWORD *)(v15 + 424) = v14;

  v17 = *(void **)(*(_QWORD *)(a1 + 32) + 424);
  v18 = v13;
  v19 = 3221225472;
  v20 = __75__SBSUIWallpaperPreviewView_displayInstructionsForEffect_enabled_animated___block_invoke_3;
  v21 = &unk_1E4C3FF08;
  objc_copyWeak(&v23, (id *)(a1 + 40));
  v22 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v17, "addCompletion:", &v18);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "startAnimation", v18, v19, v20, v21);
  objc_destroyWeak(&v23);

}

uint64_t __75__SBSUIWallpaperPreviewView_displayInstructionsForEffect_enabled_animated___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setAlpha:", *(double *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setAlpha:", *(double *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "setAlpha:", 1.0);
}

void __75__SBSUIWallpaperPreviewView_displayInstructionsForEffect_enabled_animated___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  id WeakRetained;
  _QWORD v6[9];

  if (!a2)
  {
    v6[7] = v2;
    v6[8] = v3;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __75__SBSUIWallpaperPreviewView_displayInstructionsForEffect_enabled_animated___block_invoke_4;
    v6[3] = &unk_1E4C3E510;
    v6[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(WeakRetained, "_fadeOutInstructionsWithDelay:animated:completion:", 1, v6, 4.0);

  }
}

void __75__SBSUIWallpaperPreviewView_displayInstructionsForEffect_enabled_animated___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __75__SBSUIWallpaperPreviewView_displayInstructionsForEffect_enabled_animated___block_invoke_5;
  v5[3] = &unk_1E4C3E408;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CEABC8], "runningPropertyAnimatorWithDuration:delay:options:animations:completion:", 0, v5, 0, 0.25, 0.0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 416);
  *(_QWORD *)(v3 + 416) = v2;

}

uint64_t __75__SBSUIWallpaperPreviewView_displayInstructionsForEffect_enabled_animated___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setAlpha:", 1.0);
}

- (void)_fadeOutInstructionsWithDelay:(double)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  id v8;
  double v9;
  id v10;
  uint64_t v11;
  UIViewPropertyAnimator *v12;
  UIViewPropertyAnimator *fadeOutInstructionsAnimator;
  UIViewPropertyAnimator *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void *v19;
  id v20;
  _QWORD v21[5];

  v5 = a4;
  v8 = a5;
  if (v5)
    v9 = 0.25;
  else
    v9 = 0.0;
  -[UIViewPropertyAnimator stopAnimation:](self->_cropInstructionsAnimator, "stopAnimation:", 1);
  -[UIViewPropertyAnimator stopAnimation:](self->_effectInstructionsAnimator, "stopAnimation:", 1);
  -[UIViewPropertyAnimator stopAnimation:](self->_fadeOutInstructionsAnimator, "stopAnimation:", 1);
  v10 = objc_alloc(MEMORY[0x1E0CEABC8]);
  v11 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __79__SBSUIWallpaperPreviewView__fadeOutInstructionsWithDelay_animated_completion___block_invoke;
  v21[3] = &unk_1E4C3E408;
  v21[4] = self;
  v12 = (UIViewPropertyAnimator *)objc_msgSend(v10, "initWithDuration:curve:animations:", 0, v21, v9);
  fadeOutInstructionsAnimator = self->_fadeOutInstructionsAnimator;
  self->_fadeOutInstructionsAnimator = v12;

  v14 = self->_fadeOutInstructionsAnimator;
  v16 = v11;
  v17 = 3221225472;
  v18 = __79__SBSUIWallpaperPreviewView__fadeOutInstructionsWithDelay_animated_completion___block_invoke_2;
  v19 = &unk_1E4C3FF58;
  v20 = v8;
  v15 = v8;
  -[UIViewPropertyAnimator addCompletion:](v14, "addCompletion:", &v16);
  -[UIViewPropertyAnimator startAnimationAfterDelay:](self->_fadeOutInstructionsAnimator, "startAnimationAfterDelay:", a3, v16, v17, v18, v19);

}

uint64_t __79__SBSUIWallpaperPreviewView__fadeOutInstructionsWithDelay_animated_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setAlpha:", 0.0);
}

uint64_t __79__SBSUIWallpaperPreviewView__fadeOutInstructionsWithDelay_animated_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 == 0);
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBSUIWallpaperPreviewView;
  -[SBSUIWallpaperPreviewView layoutSubviews](&v3, sel_layoutSubviews);
  -[SBSUIWallpaperPreviewView _layoutGradientView](self, "_layoutGradientView");
  -[SBSUIWallpaperPreviewView _layoutStackedButtons](self, "_layoutStackedButtons");
  -[SBSUIWallpaperPreviewView _layoutIrisButton](self, "_layoutIrisButton");
  -[SBSUIWallpaperPreviewView _layoutParallaxButton](self, "_layoutParallaxButton");
  -[SBSUIWallpaperPreviewView _layoutCancelButton](self, "_layoutCancelButton");
  -[SBSUIWallpaperPreviewView _layoutSetButton](self, "_layoutSetButton");
  -[SBSUIWallpaperPreviewView _layoutDateView](self, "_layoutDateView");
  -[SBSUIWallpaperPreviewView _layoutWallpaperView](self, "_layoutWallpaperView");
  -[SBSUIWallpaperPreviewView _layoutIrisInstructionLabels](self, "_layoutIrisInstructionLabels");
}

- (void)_layoutGradientView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect v9;

  if (self->_gradientView)
  {
    -[SBSUIWallpaperPreviewView addSubview:](self, "addSubview:");
    -[SBSUIWallpaperPreviewView bounds](self, "bounds");
    -[SBSUIWallpaperPreviewView bounds](self, "bounds");
    CGRectGetMaxY(v9);
    -[SBSUIWallpaperPreviewView bounds](self, "bounds");
    UIPointRoundToViewScale();
    v4 = v3;
    v6 = v5;
    UISizeRoundToViewScale();
    -[UIView setFrame:](self->_gradientView, "setFrame:", v4, v6, v7, v8);
  }
}

- (void)_layoutWallpaperView
{
  PBUIWallpaperView *wallpaperView;

  wallpaperView = self->_wallpaperView;
  if (wallpaperView)
  {
    -[SBSUIWallpaperPreviewView bounds](self, "bounds");
    -[PBUIWallpaperView setFrame:](wallpaperView, "setFrame:");
  }
}

- (void)_layoutDateView
{
  SBFLockScreenDateView *dateView;
  SBFLockScreenDateView *v4;
  void *v5;

  dateView = self->_dateView;
  if (dateView)
  {
    -[SBFLockScreenDateView layoutIfNeeded](dateView, "layoutIfNeeded");
    v4 = self->_dateView;
    -[SBSUIWallpaperPreviewView bounds](self, "bounds");
    -[SBFLockScreenDateView setFrame:](v4, "setFrame:");
    if ((_os_feature_enabled_impl() & 1) == 0)
    {
      v5 = (void *)MEMORY[0x1E0DA9DE0];
      -[SBSUIWallpaperPreviewView bounds](self, "bounds");
      objc_msgSend(v5, "suggestedFrameForDateTimeViewInScreenCoordinates:centeredX:", 0);
      -[SBFLockScreenDateView setFrame:](self->_dateView, "setFrame:");
    }
  }
}

- (double)_segmentedControlInset
{
  double v2;

  -[SBSUIWallpaperPreviewView safeAreaInsets](self, "safeAreaInsets");
  return v2 + 104.0;
}

- (void)_layoutStackedButtons
{
  UIButton **p_cancelButton;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  UIButton **p_parallaxButton;
  UIButton *parallaxButton;
  double v22;
  UIButton **p_irisButton;
  UIButton *irisButton;
  BOOL v25;
  double v26;
  double v27;
  double v28;
  double v29;
  unint64_t v30;
  double v31;
  double v32;
  void *v33;
  double MaxY;
  double v35;
  double v36;
  double v37;
  CGFloat v38;
  CGFloat x;
  double v40;
  double v41;
  double v42;
  BOOL v43;
  _BOOL4 v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double MinX;
  double v53;
  CGFloat v54;
  double v55;
  _BOOL4 v56;
  UIButton **p_setButton;
  _BOOL4 v58;
  UIButton **v59;
  UIButton *v60;
  UIButton **v61;
  UIButton *v62;
  UIButton **v63;
  UIButton *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double MinY;
  double v88;
  double v89;
  double v90;
  double v91;
  _SBUIWallpaperInstructionView *cropInstructionView;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  UILabel *effectStateLabel;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  void *v104;
  double v105;
  CGFloat v106;
  double v107;
  double v108;
  double rect;
  double rect_8;
  double rect_8a;
  double rect_16;
  double rect_24;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  id v120;
  UIButton *v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;

  p_cancelButton = &self->_cancelButton;
  -[UIButton titleLabel](self->_cancelButton, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pointSize");
  v7 = v6 * 1.8;

  v8 = fmax(v7, 34.0);
  -[SBSUIWallpaperPreviewView readableContentGuide](self, "readableContentGuide");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layoutFrame");
  v11 = v10;

  -[SBSUIWallpaperPreviewView readableContentGuide](self, "readableContentGuide");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layoutFrame");
  v120 = v13;

  -[UIButton titleLabel](*p_cancelButton, "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "intrinsicContentSize");
  v16 = v15;

  -[UIButton titleLabel](self->_setButton, "titleLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "intrinsicContentSize");
  v19 = v18;

  p_parallaxButton = &self->_parallaxButton;
  parallaxButton = self->_parallaxButton;
  if (parallaxButton)
    v22 = v8;
  else
    v22 = 0.0;
  p_irisButton = &self->_irisButton;
  irisButton = self->_irisButton;
  if (parallaxButton)
    v25 = irisButton == 0;
  else
    v25 = 1;
  if (v25)
    v26 = 0.0;
  else
    v26 = 24.0;
  v114 = v26;
  v116 = v22;
  if (v16 >= v19)
    v27 = v16;
  else
    v27 = v19;
  v28 = v27 + 32.0;
  v29 = v8 + v27;
  v30 = (unint64_t)irisButton | (unint64_t)parallaxButton;
  if (irisButton)
    v31 = v8;
  else
    v31 = 0.0;
  if (v30)
    v32 = 24.0;
  else
    v32 = 0.0;
  -[SBSUIWallpaperPreviewView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "layoutFrame");
  MaxY = CGRectGetMaxY(v122);

  -[SBSUIWallpaperPreviewView bounds](self, "bounds");
  v35 = CGRectGetMaxY(v123) + -35.0;
  if (MaxY < v35)
    v35 = MaxY;
  v36 = v35 - v8;
  v118 = v28 * 2.0 + 16.0;
  if (v118 > v11)
  {
    if (v11 >= v29)
      v37 = v29;
    else
      v37 = v11;
    v124.origin.x = 0.0;
    v124.origin.y = v36;
    v124.size.width = v37;
    v124.size.height = v8;
    v38 = CGRectGetMinY(v124) - v8 + -10.0;
    -[SBSUIWallpaperPreviewView bounds](self, "bounds");
    v126.origin.x = CGRectGetMidX(v125) + v37 * -0.5;
    x = v126.origin.x;
    v126.origin.y = v38;
    v126.size.width = v37;
    v126.size.height = v8;
    CGRectGetMinY(v126);
    v40 = v11;
    if (*p_irisButton && *p_parallaxButton)
    {
      v127.origin.x = x;
      v127.origin.y = v36;
      v127.size.width = v37;
      v127.size.height = v8;
      CGRectGetMaxX(v127);
    }
    else
    {
      v133.origin.x = x;
      v133.origin.y = v36;
      v133.size.width = v37;
      v133.size.height = v8;
      CGRectGetMidX(v133);
    }
    goto LABEL_50;
  }
  v41 = v116;
  v42 = v32 + v116 + v114 + v31 + v32 + v28 * 2.0;
  if (v31 >= v116)
    v41 = v31;
  v43 = v42 <= v11 || v32 + v32 + v28 * 2.0 + v41 > v11;
  rect_8 = v11;
  v44 = !v43 && *p_irisButton && *p_parallaxButton != 0;
  v45 = v28 * 2.0 + 16.0;
  if (v42 <= v11)
    v45 = v32 + v116 + v114 + v31 + v32 + v28 * 2.0;
  v46 = v11 - v45;
  v47 = fmax(v29 - v28, 0.0);
  if (v47 >= v46 * 0.5)
    v48 = v46 * 0.5;
  else
    v48 = v47;
  -[SBSUIWallpaperPreviewView bounds](self, "bounds");
  v49 = v28 + v48;
  v50 = fmin(*(double *)&v120 + (v46 + (v28 + v48 - v28) * -2.0) * 0.5, 35.0);
  v51 = CGRectGetMaxX(v128) - v50 - (v28 + v48);
  if (v42 <= rect_8)
  {
    if (*p_irisButton && *p_parallaxButton)
    {
      v129.origin.x = v51;
      v129.origin.y = v36;
      v129.size.width = v49;
      v129.size.height = v8;
      MinX = CGRectGetMinX(v129);
      v130.origin.x = v50;
      v130.origin.y = v36;
      v130.size.width = v49;
      v130.size.height = v8;
      v53 = MinX - CGRectGetMaxX(v130) - v8 - v8;
      v54 = v50;
      v55 = v53 / 3.0;
      v131.origin.x = v54;
      v131.origin.y = v36;
      v131.size.width = v49;
      v131.size.height = v8;
      v132.origin.x = CGRectGetMaxX(v131) + v55;
      v132.origin.y = v36;
      v132.size.width = v8;
      v132.size.height = v8;
      CGRectGetMaxX(v132);
LABEL_49:
      v40 = rect_8;
      goto LABEL_50;
    }
LABEL_48:
    -[SBSUIWallpaperPreviewView center](self, "center");
    goto LABEL_49;
  }
  v134.origin.x = v50;
  v134.origin.y = v36;
  v134.size.width = v49;
  v134.size.height = v8;
  CGRectGetMinY(v134);
  if (v44)
    goto LABEL_48;
  v40 = rect_8;
  if (*p_irisButton && *p_parallaxButton)
  {
    v139.origin.x = v50;
    v139.origin.y = v36;
    v139.size.width = v49;
    v139.size.height = v8;
    CGRectGetMidX(v139);
    v140.origin.x = v51;
    v140.origin.y = v36;
    v140.size.width = v49;
    v140.size.height = v8;
    CGRectGetMidX(v140);
  }
  else
  {
    -[SBSUIWallpaperPreviewView readableContentGuide](self, "readableContentGuide");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "layoutFrame");
    CGRectGetMidX(v141);

  }
LABEL_50:
  v56 = -[SBSUIWallpaperPreviewView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 0;
  if (v118 > v40)
    v56 = 1;
  if (v56)
    p_setButton = p_cancelButton;
  else
    p_setButton = &self->_setButton;
  v121 = *p_setButton;
  v58 = -[SBSUIWallpaperPreviewView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 0;
  if (v118 > v40)
    v58 = 1;
  if (v58)
    v59 = &self->_setButton;
  else
    v59 = p_cancelButton;
  v60 = *v59;
  if (-[SBSUIWallpaperPreviewView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection"))
    v61 = &self->_parallaxButton;
  else
    v61 = &self->_irisButton;
  v62 = *v61;
  if (-[SBSUIWallpaperPreviewView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection"))
    v63 = &self->_irisButton;
  else
    v63 = &self->_parallaxButton;
  v64 = *v63;
  UIPointRoundToViewScale();
  v66 = v65;
  v108 = v67;
  UISizeRoundToViewScale();
  v69 = v68;
  v71 = v70;
  UIPointRoundToViewScale();
  v73 = v72;
  v75 = v74;
  UISizeRoundToViewScale();
  v107 = v76;
  rect_8a = v77;
  UIPointRoundToViewScale();
  rect = v78;
  v119 = v79;
  UISizeRoundToViewScale();
  v115 = v81;
  v117 = v80;
  UIPointRoundToViewScale();
  rect_16 = v83;
  rect_24 = v82;
  UISizeRoundToViewScale();
  v85 = v84;
  v105 = v86;
  v106 = v84;
  -[UIButton setFrame:](v121, "setFrame:", v66, v108, v69, v71);
  -[UIButton setFrame:](v60, "setFrame:", v73, v75, v107, rect_8a);
  -[UIButton setFrame:](v62, "setFrame:", rect, v119, v117, v115);
  -[UIButton setFrame:](v64, "setFrame:", rect_24, rect_16, v85, v105);
  v135.origin.x = v66;
  v135.origin.y = v108;
  v135.size.width = v69;
  v135.size.height = v71;
  MinY = CGRectGetMinY(v135);
  v136.origin.x = v73;
  v136.origin.y = v75;
  v136.size.width = v107;
  v136.size.height = rect_8a;
  v88 = CGRectGetMinY(v136);
  if (MinY >= v88)
    MinY = v88;
  v137.origin.x = rect;
  v137.size.width = v117;
  v137.origin.y = v119;
  v137.size.height = v115;
  v89 = CGRectGetMinY(v137);
  if (MinY >= v89)
    MinY = v89;
  v138.origin.y = rect_16;
  v138.origin.x = rect_24;
  v138.size.width = v106;
  v138.size.height = v105;
  v90 = CGRectGetMinY(v138);
  if (MinY >= v90)
    v91 = v90;
  else
    v91 = MinY;
  cropInstructionView = self->_cropInstructionView;
  -[SBSUIWallpaperPreviewView size](self, "size");
  -[_SBUIWallpaperInstructionView sizeThatFits:](cropInstructionView, "sizeThatFits:");
  v94 = v93;
  BSRectWithSize();
  -[SBSUIWallpaperPreviewView bounds](self, "bounds");
  UIRectCenteredXInRectScale();
  -[_SBUIWallpaperInstructionView setFrame:](self->_cropInstructionView, "setFrame:", v95, SBUIFloatFloorForScale(v91 - v94 + -20.0, 0.0), v96, v97, 0);
  -[SBSUIWallpaperPreviewView bringSubviewToFront:](self, "bringSubviewToFront:", self->_cropInstructionView);
  effectStateLabel = self->_effectStateLabel;
  -[SBSUIWallpaperPreviewView size](self, "size");
  -[UILabel sizeThatFits:](effectStateLabel, "sizeThatFits:");
  v100 = v99;
  BSRectWithSize();
  -[SBSUIWallpaperPreviewView bounds](self, "bounds");
  UIRectCenteredXInRectScale();
  -[UILabel setFrame:](self->_effectStateLabel, "setFrame:", v101, SBUIFloatFloorForScale(v91 - v100 + -20.0, 0.0), v102, v103, 0);
  -[SBSUIWallpaperPreviewView bringSubviewToFront:](self, "bringSubviewToFront:", self->_effectStateLabel);

}

- (void)_layoutIrisInstructionLabels
{
  _UILegibilityLabel *irisInstructionsLabel2;
  _UILegibilityLabel *irisInstructionsLabel1;

  irisInstructionsLabel2 = self->_irisInstructionsLabel2;
  -[SBSUIWallpaperPreviewView size](self, "size");
  -[_UILegibilityLabel sizeThatFits:](irisInstructionsLabel2, "sizeThatFits:");
  BSRectWithSize();
  -[SBSUIWallpaperPreviewView bounds](self, "bounds");
  UIRectCenteredIntegralRect();
  -[_UILegibilityLabel setFrame:](self->_irisInstructionsLabel2, "setFrame:");
  irisInstructionsLabel1 = self->_irisInstructionsLabel1;
  -[SBSUIWallpaperPreviewView size](self, "size");
  -[_UILegibilityLabel sizeThatFits:](irisInstructionsLabel1, "sizeThatFits:");
  BSRectWithSize();
  -[SBSUIWallpaperPreviewView bounds](self, "bounds");
  UIRectCenteredIntegralRect();
  -[_UILegibilityLabel setFrame:](self->_irisInstructionsLabel1, "setFrame:");
}

- (void)_layoutIrisButton
{
  UIButton *irisButton;
  void *v4;
  CGRect v5;

  irisButton = self->_irisButton;
  if (irisButton)
  {
    -[UIButton layer](irisButton, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton frame](self->_irisButton, "frame");
    objc_msgSend(v4, "setCornerRadius:", CGRectGetHeight(v5) * 0.5);

    -[SBSUIWallpaperPreviewView bringSubviewToFront:](self, "bringSubviewToFront:", self->_irisButton);
  }
}

- (void)_layoutParallaxButton
{
  UIButton *parallaxButton;
  void *v4;
  CGRect v5;

  parallaxButton = self->_parallaxButton;
  if (parallaxButton)
  {
    -[UIButton layer](parallaxButton, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton frame](self->_parallaxButton, "frame");
    objc_msgSend(v4, "setCornerRadius:", CGRectGetHeight(v5) * 0.5);

    -[SBSUIWallpaperPreviewView bringSubviewToFront:](self, "bringSubviewToFront:", self->_parallaxButton);
  }
}

- (void)_layoutCancelButton
{
  UIButton *cancelButton;
  void *v4;
  CGRect v5;

  cancelButton = self->_cancelButton;
  if (cancelButton)
  {
    -[UIButton layer](cancelButton, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton frame](self->_cancelButton, "frame");
    objc_msgSend(v4, "setCornerRadius:", CGRectGetHeight(v5) * 0.5);

    -[SBSUIWallpaperPreviewView bringSubviewToFront:](self, "bringSubviewToFront:", self->_cancelButton);
  }
}

- (void)_layoutSetButton
{
  UIButton *setButton;
  void *v4;
  CGRect v5;

  setButton = self->_setButton;
  if (setButton)
  {
    -[UIButton layer](setButton, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton frame](self->_setButton, "frame");
    objc_msgSend(v4, "setCornerRadius:", CGRectGetHeight(v5) * 0.5);

    -[SBSUIWallpaperPreviewView bringSubviewToFront:](self, "bringSubviewToFront:", self->_setButton);
  }
}

- (void)irisWallpaperPlayerPlaybackStateDidChange:(id)a3
{
  if (objc_msgSend(a3, "irisPlaybackState") == 4)
    -[SBSUIWallpaperPreviewView _fadeOutInstructionsWithDelay:animated:completion:](self, "_fadeOutInstructionsWithDelay:animated:completion:", 1, 0, 0.0);
}

- (SBSUIWallpaperPreviewViewDelegate)delegate
{
  return (SBSUIWallpaperPreviewViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBFLockScreenDateView)dateView
{
  return self->_dateView;
}

- (PBUIWallpaperView)wallpaperView
{
  return self->_wallpaperView;
}

- (UIButton)irisButton
{
  return self->_irisButton;
}

- (UIButton)parallaxButton
{
  return self->_parallaxButton;
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (UIButton)setButton
{
  return self->_setButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_parallaxButton, 0);
  objc_storeStrong((id *)&self->_irisButton, 0);
  objc_storeStrong((id *)&self->_wallpaperView, 0);
  objc_storeStrong((id *)&self->_dateView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_gradientView, 0);
  objc_storeStrong((id *)&self->_cropInstructionView, 0);
  objc_storeStrong((id *)&self->_effectStateLabel, 0);
  objc_storeStrong((id *)&self->_irisInstructionsLabel2, 0);
  objc_storeStrong((id *)&self->_irisInstructionsLabel1, 0);
  objc_storeStrong((id *)&self->_fadeOutInstructionsAnimator, 0);
  objc_storeStrong((id *)&self->_effectInstructionsAnimator, 0);
  objc_storeStrong((id *)&self->_cropInstructionsAnimator, 0);
}

@end
