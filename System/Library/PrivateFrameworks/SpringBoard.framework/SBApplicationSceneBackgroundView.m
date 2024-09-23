@implementation SBApplicationSceneBackgroundView

- (void)setWallpaperStyle:(int64_t)a3
{
  if (self->_wallpaperStyle != a3)
  {
    self->_wallpaperStyle = a3;
    -[SBApplicationSceneBackgroundView _setupBackground](self, "_setupBackground");
  }
}

- (SBApplicationSceneBackgroundView)initWithFrame:(CGRect)a3
{
  SBApplicationSceneBackgroundView *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBApplicationSceneBackgroundView;
  result = -[SBApplicationSceneBackgroundView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    result->_wallpaperStyle = -1;
    result->_transformOptions = 33;
  }
  return result;
}

- (void)_setupBackground
{
  uint64_t v3;
  SBApplicationSceneBackgroundView *v4;
  id v5;

  if (self && self->_wallpaperStyle != 1)
  {
    -[SBApplicationSceneBackgroundView _backgroundWallpaperEffectView](self);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWallpaperStyle:", self->_wallpaperStyle);
    objc_msgSend(v5, "setForcesOpaque:", 1);
    -[SBApplicationSceneBackgroundView bounds](self, "bounds");
    objc_msgSend(v5, "setFrame:");
    objc_msgSend(v5, "setFullscreen:", self->_fullscreen);
    -[SBApplicationSceneBackgroundView addSubview:](self, "addSubview:", v5);
    v4 = self;
    v3 = 0;
  }
  else
  {
    -[SBApplicationSceneBackgroundView _teardownBackgroundWallpaperEffectView]((uint64_t)self);
    -[SBApplicationSceneBackgroundView _opaqueBackgroundColorOrClearColor](self);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = self;
    v5 = (id)v3;
  }
  -[SBApplicationSceneBackgroundView setBackgroundColor:](v4, "setBackgroundColor:", v3);

}

- (void)_teardownBackgroundWallpaperEffectView
{
  void *v2;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 424), "removeFromSuperview");
    v2 = *(void **)(a1 + 424);
    *(_QWORD *)(a1 + 424) = 0;

  }
}

- (_BYTE)_opaqueBackgroundColorOrClearColor
{
  if (a1)
  {
    if (a1[432])
      -[SBApplicationSceneBackgroundView _opaqueBackgroundColor](a1);
    else
      objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)setNeedsClassicModeBackground:(BOOL)a3
{
  if (self->_needsClassicModeBackground != a3)
  {
    self->_needsClassicModeBackground = a3;
    -[SBApplicationSceneBackgroundView _setupBackground](self, "_setupBackground");
  }
}

- (_BYTE)_opaqueBackgroundColor
{
  if (a1)
  {
    if (a1[434])
      objc_msgSend(MEMORY[0x1E0CEA478], "systemMidGrayColor");
    else
      objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundWallpaperEffectView, 0);
}

- (_QWORD)_backgroundWallpaperEffectView
{
  _QWORD *v1;
  void *v2;
  SBWallpaperEffectView *v3;
  void *v4;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[53];
    if (!v2)
    {
      v3 = -[SBWallpaperEffectView initWithWallpaperVariant:transformOptions:]([SBWallpaperEffectView alloc], "initWithWallpaperVariant:transformOptions:", 1, a1[55]);
      v4 = (void *)v1[53];
      v1[53] = v3;

      objc_msgSend((id)v1[53], "setAutoresizingMask:", 18);
      v2 = (void *)v1[53];
    }
    a1 = v2;
  }
  return a1;
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PBUIWallpaperStyleDescription();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("wallpaperStyle"));

  v6 = (id)objc_msgSend(v3, "appendBool:withName:", self->_wallpaperStyle != 1, CFSTR("_isTranslucent"));
  v7 = (id)objc_msgSend(v3, "appendSuper");
  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (BOOL)_isTranslucent
{
  if (result)
    return *(_QWORD *)(result + 416) != 1;
  return result;
}

- (void)setWallpaperStyle:(int64_t)a3 withAnimationSettings:(id)a4
{
  if (self->_wallpaperStyle != a3)
  {
    self->_wallpaperStyle = a3;
    -[SBApplicationSceneBackgroundView _setupBackgroundWithAnimationSettings:]((uint64_t)self, a4);
  }
}

- (void)_setupBackgroundWithAnimationSettings:(uint64_t)a1
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  uint64_t v37;
  _QWORD v38[4];
  id v39;
  uint64_t v40;
  double v41;
  double v42;
  double v43;
  double v44;
  _QWORD v45[4];
  id v46;
  uint64_t v47;

  v3 = a2;
  if (a1)
  {
    objc_msgSend((id)a1, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v12 = *(id *)(a1 + 424);
    v13 = *(void **)(a1 + 424);
    *(_QWORD *)(a1 + 424) = 0;

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v5, v7, v9, v11);
    v15 = (void *)MEMORY[0x1E0CEABB0];
    v16 = MEMORY[0x1E0C809B0];
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __74__SBApplicationSceneBackgroundView__setupBackgroundWithAnimationSettings___block_invoke;
    v45[3] = &unk_1E8E9E820;
    v17 = v14;
    v46 = v17;
    v47 = a1;
    objc_msgSend(v15, "performWithoutAnimation:", v45);
    if (*(_QWORD *)(a1 + 416) == 1)
    {
      v18 = (void *)MEMORY[0x1E0D01908];
      v29[0] = v16;
      v29[1] = 3221225472;
      v29[2] = __74__SBApplicationSceneBackgroundView__setupBackgroundWithAnimationSettings___block_invoke_5;
      v29[3] = &unk_1E8E9E820;
      v30 = v12;
      v31 = a1;
      v26[0] = v16;
      v26[1] = 3221225472;
      v26[2] = __74__SBApplicationSceneBackgroundView__setupBackgroundWithAnimationSettings___block_invoke_6;
      v26[3] = &unk_1E8E9DEB0;
      v27 = v30;
      v28 = v17;
      v19 = v17;
      objc_msgSend(v18, "animateWithSettings:options:actions:completion:", v3, 4, v29, v26);

      v20 = v30;
    }
    else
    {
      -[SBApplicationSceneBackgroundView _backgroundWallpaperEffectView]((_QWORD *)a1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x1E0CEABB0];
      v38[0] = v16;
      v38[1] = 3221225472;
      v38[2] = __74__SBApplicationSceneBackgroundView__setupBackgroundWithAnimationSettings___block_invoke_2;
      v38[3] = &unk_1E8EA0820;
      v23 = v21;
      v39 = v23;
      v40 = a1;
      v41 = v5;
      v42 = v7;
      v43 = v9;
      v44 = v11;
      objc_msgSend(v22, "performWithoutAnimation:", v38);
      v24 = (void *)MEMORY[0x1E0D01908];
      v35[0] = v16;
      v35[1] = 3221225472;
      v35[2] = __74__SBApplicationSceneBackgroundView__setupBackgroundWithAnimationSettings___block_invoke_3;
      v35[3] = &unk_1E8E9E820;
      v36 = v23;
      v37 = a1;
      v32[0] = v16;
      v32[1] = 3221225472;
      v32[2] = __74__SBApplicationSceneBackgroundView__setupBackgroundWithAnimationSettings___block_invoke_4;
      v32[3] = &unk_1E8E9DEB0;
      v33 = v12;
      v34 = v17;
      v25 = v17;
      v20 = v23;
      objc_msgSend(v24, "animateWithSettings:options:actions:completion:", v3, 4, v35, v32);

    }
  }

}

- (void)setFullscreen:(BOOL)a3
{
  if (self->_fullscreen != a3)
  {
    self->_fullscreen = a3;
    -[SBApplicationSceneBackgroundView _setupBackground](self, "_setupBackground");
  }
}

- (void)setTransformOptions:(unint64_t)a3
{
  if (self->_transformOptions != a3)
  {
    self->_transformOptions = a3 | 0x20;
    -[PBUIWallpaperEffectViewBase setTransformOptions:](self->_backgroundWallpaperEffectView, "setTransformOptions:");
  }
}

uint64_t __74__SBApplicationSceneBackgroundView__setupBackgroundWithAnimationSettings___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  -[SBApplicationSceneBackgroundView _opaqueBackgroundColor](*(_BYTE **)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  return objc_msgSend(*(id *)(a1 + 40), "insertSubview:atIndex:", *(_QWORD *)(a1 + 32), 0);
}

uint64_t __74__SBApplicationSceneBackgroundView__setupBackgroundWithAnimationSettings___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setWallpaperStyle:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 416));
  objc_msgSend(*(id *)(a1 + 32), "setForcesOpaque:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 32), "setFullscreen:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 433));
  objc_msgSend(*(id *)(a1 + 40), "addSubview:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __74__SBApplicationSceneBackgroundView__setupBackgroundWithAnimationSettings___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 40), "setBackgroundColor:", 0);
}

uint64_t __74__SBApplicationSceneBackgroundView__setupBackgroundWithAnimationSettings___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
}

void __74__SBApplicationSceneBackgroundView__setupBackgroundWithAnimationSettings___block_invoke_5(uint64_t a1)
{
  _BYTE *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  v2 = *(_BYTE **)(a1 + 40);
  -[SBApplicationSceneBackgroundView _opaqueBackgroundColorOrClearColor](v2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

}

uint64_t __74__SBApplicationSceneBackgroundView__setupBackgroundWithAnimationSettings___block_invoke_6(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
}

- (void)setShouldUseBrightMaterial:(BOOL)a3
{
  if (self->_shouldUseBrightMaterial != a3)
  {
    self->_shouldUseBrightMaterial = a3;
    -[SBApplicationSceneBackgroundView _setupBackground](self, "_setupBackground");
  }
}

- (int64_t)wallpaperStyle
{
  return self->_wallpaperStyle;
}

- (BOOL)needsClassicModeBackground
{
  return self->_needsClassicModeBackground;
}

- (BOOL)isFullscreen
{
  return self->_fullscreen;
}

- (unint64_t)transformOptions
{
  return self->_transformOptions;
}

- (BOOL)shouldUseBrightMaterial
{
  return self->_shouldUseBrightMaterial;
}

@end
