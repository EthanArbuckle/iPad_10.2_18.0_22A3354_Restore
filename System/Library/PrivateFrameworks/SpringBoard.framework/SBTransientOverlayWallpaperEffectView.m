@implementation SBTransientOverlayWallpaperEffectView

- (SBTransientOverlayWallpaperEffectView)initWithFrame:(CGRect)a3 wallpaperVariant:(int64_t)a4
{
  SBTransientOverlayWallpaperEffectView *v5;
  id v6;
  uint64_t v7;
  _UIDirectionalRotationView *wallpaperRotationView;
  SBWallpaperEffectView *v9;
  SBWallpaperEffectView *wallpaperEffectView;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBTransientOverlayWallpaperEffectView;
  v5 = -[SBTransientOverlayWallpaperEffectView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0CEACF8]);
    -[SBTransientOverlayWallpaperEffectView bounds](v5, "bounds");
    v7 = objc_msgSend(v6, "initWithFrame:");
    wallpaperRotationView = v5->_wallpaperRotationView;
    v5->_wallpaperRotationView = (_UIDirectionalRotationView *)v7;

    -[_UIDirectionalRotationView setCounterTransformView:](v5->_wallpaperRotationView, "setCounterTransformView:", 1);
    -[SBTransientOverlayWallpaperEffectView addSubview:](v5, "addSubview:", v5->_wallpaperRotationView);
    v9 = -[SBWallpaperEffectView initWithWallpaperVariant:transformOptions:]([SBWallpaperEffectView alloc], "initWithWallpaperVariant:transformOptions:", a4, 1);
    wallpaperEffectView = v5->_wallpaperEffectView;
    v5->_wallpaperEffectView = v9;

    -[PBUIWallpaperEffectViewBase setForcesOpaque:](v5->_wallpaperEffectView, "setForcesOpaque:", 1);
    -[PBUIWallpaperEffectViewBase setFullscreen:](v5->_wallpaperEffectView, "setFullscreen:", 1);
    -[SBWallpaperEffectView setAlpha:](v5->_wallpaperEffectView, "setAlpha:", 1.0);
    -[_UIDirectionalRotationView addSubview:](v5->_wallpaperRotationView, "addSubview:", v5->_wallpaperEffectView);
    -[SBTransientOverlayWallpaperEffectView _updateWallpaperGeometry](v5, "_updateWallpaperGeometry");
  }
  return v5;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBTransientOverlayWallpaperEffectView;
  -[SBTransientOverlayWallpaperEffectView layoutSubviews](&v3, sel_layoutSubviews);
  -[SBTransientOverlayWallpaperEffectView _updateWallpaperGeometry](self, "_updateWallpaperGeometry");
}

- (BOOL)prepareToAnimateToTransitionState:(id *)a3
{
  return -[PBUIWallpaperEffectViewBase prepareToAnimateToTransitionState:](self->_wallpaperEffectView, "prepareToAnimateToTransitionState:", a3);
}

- (void)setContainerOrientation:(int64_t)a3
{
  if (self->_containerOrientation != a3)
  {
    self->_containerOrientation = a3;
    -[SBTransientOverlayWallpaperEffectView _updateWallpaperGeometry](self, "_updateWallpaperGeometry");
  }
}

- (void)setTransitionState:(id *)a3
{
  SBWallpaperEffectView *wallpaperEffectView;
  $1D129F7B4C980C50E70029647222EF17 v4;

  wallpaperEffectView = self->_wallpaperEffectView;
  v4 = *a3;
  -[PBUIWallpaperEffectViewBase setTransitionState:](wallpaperEffectView, "setTransitionState:", &v4);
}

- (void)setWallpaperStyle:(int64_t)a3
{
  -[PBUIWallpaperEffectViewBase setWallpaperStyle:](self->_wallpaperEffectView, "setWallpaperStyle:", a3);
}

- (int64_t)wallpaperStyle
{
  return -[PBUIWallpaperEffectViewBase wallpaperStyle](self->_wallpaperEffectView, "wallpaperStyle");
}

- (CATransform3D)_currentWallpaperTransform
{
  CATransform3D *result;
  _OWORD *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  CGFloat v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  CATransform3D v15;

  result = -[SBTransientOverlayWallpaperEffectView containerOrientation](self, "containerOrientation");
  v5 = (_OWORD *)MEMORY[0x1E0CD2610];
  v6 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  *(_OWORD *)&retstr->m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  *(_OWORD *)&retstr->m33 = v6;
  v7 = v5[7];
  *(_OWORD *)&retstr->m41 = v5[6];
  *(_OWORD *)&retstr->m43 = v7;
  v8 = v5[1];
  *(_OWORD *)&retstr->m11 = *v5;
  *(_OWORD *)&retstr->m13 = v8;
  v9 = v5[3];
  *(_OWORD *)&retstr->m21 = v5[2];
  *(_OWORD *)&retstr->m23 = v9;
  if (result != (CATransform3D *)1)
  {
    BSDegreesToRadians();
    result = CATransform3DMakeRotation(&v15, v10, 0.0, 0.0, 1.0);
    v11 = *(_OWORD *)&v15.m33;
    *(_OWORD *)&retstr->m31 = *(_OWORD *)&v15.m31;
    *(_OWORD *)&retstr->m33 = v11;
    v12 = *(_OWORD *)&v15.m43;
    *(_OWORD *)&retstr->m41 = *(_OWORD *)&v15.m41;
    *(_OWORD *)&retstr->m43 = v12;
    v13 = *(_OWORD *)&v15.m13;
    *(_OWORD *)&retstr->m11 = *(_OWORD *)&v15.m11;
    *(_OWORD *)&retstr->m13 = v13;
    v14 = *(_OWORD *)&v15.m23;
    *(_OWORD *)&retstr->m21 = *(_OWORD *)&v15.m21;
    *(_OWORD *)&retstr->m23 = v14;
  }
  return result;
}

- (void)_updateWallpaperGeometry
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  int64_t v11;
  double Height;
  double Width;
  _UIDirectionalRotationView *wallpaperRotationView;
  _UIDirectionalRotationView *v15;
  SBWallpaperEffectView *wallpaperEffectView;
  _OWORD v17[8];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  CGRect v26;
  CGRect v27;

  -[SBTransientOverlayWallpaperEffectView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[SBTransientOverlayWallpaperEffectView _currentWallpaperTransform](self, "_currentWallpaperTransform");
  v11 = -[SBTransientOverlayWallpaperEffectView containerOrientation](self, "containerOrientation");
  Height = v8;
  Width = v10;
  if ((unint64_t)(v11 - 3) <= 1)
  {
    v26.origin.x = v4;
    v26.origin.y = v6;
    v26.size.width = v8;
    v26.size.height = v10;
    Height = CGRectGetHeight(v26);
    v27.origin.x = v4;
    v27.origin.y = v6;
    v27.size.width = v8;
    v27.size.height = v10;
    Width = CGRectGetWidth(v27);
  }
  -[_UIDirectionalRotationView setBounds:](self->_wallpaperRotationView, "setBounds:", v4, v6, Height, Width);
  wallpaperRotationView = self->_wallpaperRotationView;
  UIRectGetCenter();
  -[_UIDirectionalRotationView setCenter:](wallpaperRotationView, "setCenter:");
  v15 = self->_wallpaperRotationView;
  v17[4] = v22;
  v17[5] = v23;
  v17[6] = v24;
  v17[7] = v25;
  v17[0] = v18;
  v17[1] = v19;
  v17[2] = v20;
  v17[3] = v21;
  -[_UIDirectionalRotationView setTransform3D:](v15, "setTransform3D:", v17);
  wallpaperEffectView = self->_wallpaperEffectView;
  -[_UIDirectionalRotationView bounds](self->_wallpaperRotationView, "bounds");
  -[SBWallpaperEffectView setFrame:](wallpaperEffectView, "setFrame:");
  -[_UIDirectionalRotationView layoutIfNeeded](self->_wallpaperRotationView, "layoutIfNeeded");
  -[SBWallpaperEffectView layoutIfNeeded](self->_wallpaperEffectView, "layoutIfNeeded");
}

- (int64_t)containerOrientation
{
  return self->_containerOrientation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperRotationView, 0);
  objc_storeStrong((id *)&self->_wallpaperEffectView, 0);
}

@end
