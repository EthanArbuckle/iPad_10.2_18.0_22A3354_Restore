@implementation SBHDoubleSidedIconImageCrossfadeView

- (SBHDoubleSidedIconImageCrossfadeView)initWithSource:(id)a3 crossfadeView:(id)a4
{
  SBHDoubleSidedIconImageCrossfadeView *v4;
  SBHDoubleSidedIconImageCrossfadeView *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBHDoubleSidedIconImageCrossfadeView;
  v4 = -[SBIconImageCrossfadeView initWithSource:crossfadeView:](&v8, sel_initWithSource_crossfadeView_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[SBIconImageCrossfadeView iconImageView](v4, "iconImageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_iconImageViewClipsToBounds = objc_msgSend(v6, "clipsToBounds");

  }
  return v5;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

+ (Class)_containerViewClass
{
  return (Class)objc_opt_self();
}

- (void)prepareGeometry
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBHDoubleSidedIconImageCrossfadeView;
  -[SBIconImageCrossfadeView prepareGeometry](&v11, sel_prepareGeometry);
  -[SBIconImageCrossfadeView iconImageView](self, "iconImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setZPosition:", 0.01);
  objc_msgSend(v4, "setDoubleSided:", 0);
  -[SBIconImageCrossfadeView backgroundView](self, "backgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDoubleSided:", 0);

  -[SBIconImageCrossfadeView crossfadeContainerView](self, "crossfadeContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setZPosition:", -0.01);
  -[SBIconImageCrossfadeView crossfadeView](self, "crossfadeView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDoubleSided:", 0);

}

- (void)_applyCrossfadeScaleX:(double)a3 scaleY:(double)a4
{
  void *v5;
  CATransform3D v6;
  CATransform3D a;
  CATransform3D v8;
  CATransform3D v9;
  CATransform3D v10;

  self->_scaleX = a3;
  self->_scaleY = a4;
  memset(&v10, 0, sizeof(v10));
  CATransform3DMakeScale(&v10, a3, a4, 1.0);
  memset(&v9, 0, sizeof(v9));
  CATransform3DMakeRotation(&v9, -3.14159265, 0.0, 1.0, 0.0);
  -[SBIconImageCrossfadeView crossfadeView](self, "crossfadeView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  a = v9;
  v6 = v10;
  CATransform3DConcat(&v8, &a, &v6);
  objc_msgSend(v5, "setTransform3D:", &v8);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHDoubleSidedIconImageCrossfadeView;
  -[SBIconImageCrossfadeView layoutSubviews](&v3, sel_layoutSubviews);
  -[SBHDoubleSidedIconImageCrossfadeView _applyCornerRadiusToViews](self, "_applyCornerRadiusToViews");
}

- (void)cleanup
{
  void *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _OWORD v15[8];
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SBHDoubleSidedIconImageCrossfadeView;
  -[SBIconImageCrossfadeView cleanup](&v16, sel_cleanup);
  -[SBIconImageCrossfadeView crossfadeView](self, "crossfadeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  v15[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v15[5] = v4;
  v5 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v15[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v15[7] = v5;
  v6 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  v15[0] = *MEMORY[0x1E0CD2610];
  v15[1] = v6;
  v7 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v15[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v15[3] = v7;
  objc_msgSend(v3, "setTransform3D:", v15);
  -[SBIconImageCrossfadeView iconImageView](self, "iconImageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClipsToBounds:", self->_iconImageViewClipsToBounds);
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setZPosition:", 0.0);
  objc_msgSend(v9, "setDoubleSided:", 1);
  -[SBIconImageCrossfadeView backgroundView](self, "backgroundView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDoubleSided:", 1);

  -[SBIconImageCrossfadeView crossfadeContainerView](self, "crossfadeContainerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setZPosition:", 0.0);
  objc_msgSend(v3, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDoubleSided:", 1);

}

- (void)_setCornerRadiusEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = a3;
  -[SBIconImageCrossfadeView iconImageView](self, "iconImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    objc_msgSend(v5, "setClipsToBounds:", 1);

    -[SBIconImageCrossfadeView backgroundView](self, "backgroundView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setClipsToBounds:", 1);

    -[SBIconImageCrossfadeView crossfadeView](self, "crossfadeView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v8;
    v9 = 1;
  }
  else
  {
    objc_msgSend(v5, "setClipsToBounds:", 0);

    -[SBIconImageCrossfadeView backgroundView](self, "backgroundView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setClipsToBounds:", 0);

    -[SBIconImageCrossfadeView crossfadeView](self, "crossfadeView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v8;
    v9 = 0;
  }
  objc_msgSend(v8, "setClipsToBounds:", v9);

}

- (void)_applyCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
  -[SBHDoubleSidedIconImageCrossfadeView _applyCornerRadiusToViews](self, "_applyCornerRadiusToViews");
}

- (void)_applyCornerRadiusToViews
{
  -[SBHDoubleSidedIconImageCrossfadeView _applyCornerRadiusToIconImageView](self, "_applyCornerRadiusToIconImageView");
  -[SBHDoubleSidedIconImageCrossfadeView _applyCornerRadiusToBackgroundView](self, "_applyCornerRadiusToBackgroundView");
  -[SBHDoubleSidedIconImageCrossfadeView _applyCornerRadiusToCrossfadeView](self, "_applyCornerRadiusToCrossfadeView");
}

- (void)_applyCornerRadiusToIconImageView
{
  double v3;
  double v4;
  double v5;
  id v6;

  if (1.0 / self->_scaleX <= 1.0 / self->_scaleY)
    v3 = 1.0 / self->_scaleX;
  else
    v3 = 1.0 / self->_scaleY;
  -[SBIconImageCrossfadeView morphFraction](self, "morphFraction");
  v5 = 1.0 - v4 * (1.0 - v3);
  -[SBIconImageCrossfadeView iconImageView](self, "iconImageView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setContinuousCornerRadius:", self->_cornerRadius / v5);

}

- (void)_applyCornerRadiusToBackgroundView
{
  id v3;

  -[SBIconImageCrossfadeView backgroundView](self, "backgroundView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setContinuousCornerRadius:", self->_cornerRadius);

}

- (void)_applyCornerRadiusToCrossfadeView
{
  double scaleX;
  double v4;
  double v5;
  id v6;

  if (self->_scaleX <= self->_scaleY)
    scaleX = self->_scaleX;
  else
    scaleX = self->_scaleY;
  -[SBIconImageCrossfadeView morphFraction](self, "morphFraction");
  v5 = 1.0 - (1.0 - v4) * (1.0 - scaleX);
  -[SBIconImageCrossfadeView crossfadeView](self, "crossfadeView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setContinuousCornerRadius:", self->_cornerRadius / v5);

}

@end
