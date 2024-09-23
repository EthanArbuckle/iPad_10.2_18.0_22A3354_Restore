@implementation SXScaleAndFadeComponentAnimationHandler

- (SXScaleAndFadeComponentAnimationHandler)initWithComponent:(id)a3 withAnimation:(id)a4
{
  SXScaleAndFadeComponentAnimationHandler *v4;
  SXScaleAndFadeComponentAnimationHandler *v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SXScaleAndFadeComponentAnimationHandler;
  v4 = -[SXComponentAnimationHandler initWithComponent:withAnimation:](&v15, sel_initWithComponent_withAnimation_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[SXComponentAnimationHandler animation](v4, "animation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "initialAlpha");
    if (v7 == 1.79769313e308)
    {
      v5->_initialAlpha = 0.3;
    }
    else
    {
      -[SXComponentAnimationHandler animation](v5, "animation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "initialAlpha");
      v5->_initialAlpha = v9;

    }
    -[SXComponentAnimationHandler animation](v5, "animation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "initialAlpha");
    if (v11 == 1.79769313e308)
    {
      v5->_initialScale = 0.75;
    }
    else
    {
      -[SXComponentAnimationHandler animation](v5, "animation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "initialScale");
      v5->_initialScale = v13;

    }
  }
  return v5;
}

- (void)prepareAnimation
{
  double v3;
  CGFloat v4;
  CGFloat v5;
  double v6;
  double v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  CATransform3D v17;
  CATransform3D v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)SXScaleAndFadeComponentAnimationHandler;
  -[SXComponentAnimationHandler prepareAnimation](&v19, sel_prepareAnimation);
  memset(&v18, 0, sizeof(v18));
  -[SXScaleAndFadeComponentAnimationHandler initialScale](self, "initialScale");
  v4 = v3;
  -[SXScaleAndFadeComponentAnimationHandler initialScale](self, "initialScale");
  CATransform3DMakeScale(&v18, v4, v5, 1.0);
  -[SXScaleAndFadeComponentAnimationHandler initialAlpha](self, "initialAlpha");
  v7 = v6;
  if (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsReduceMotionEnabled())
  {
    v8 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
    *(_OWORD *)&v18.m31 = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
    *(_OWORD *)&v18.m33 = v8;
    v9 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
    *(_OWORD *)&v18.m41 = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
    *(_OWORD *)&v18.m43 = v9;
    v10 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
    *(_OWORD *)&v18.m11 = *MEMORY[0x24BDE5598];
    *(_OWORD *)&v18.m13 = v10;
    v11 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
    *(_OWORD *)&v18.m21 = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
    *(_OWORD *)&v18.m23 = v11;
    v7 = 1.0;
  }
  -[SXComponentAnimationHandler component](self, "component");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v18;
  objc_msgSend(v13, "setTransform:", &v17);

  -[SXComponentAnimationHandler component](self, "component");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v16 = v7;
  objc_msgSend(v15, "setOpacity:", v16);

}

- (void)startAnimation
{
  void *v3;
  void *v4;
  void *v5;
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
  double v20;
  CATransform3D v21;
  CATransform3D v22;
  objc_super v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  v23.receiver = self;
  v23.super_class = (Class)SXScaleAndFadeComponentAnimationHandler;
  -[SXComponentAnimationHandler startAnimation](&v23, sel_startAnimation);
  -[SXComponentAnimationHandler component](self, "component");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentationLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[SXComponentAnimationHandler component](self, "component");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x24BDE5638], "animation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", self);
  objc_msgSend(v7, "setDuration:", 0.3);
  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "opacity");
  objc_msgSend(v9, "numberWithFloat:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFromValue:", v10);

  objc_msgSend(v8, "setToValue:", &unk_24D6FEF08);
  objc_msgSend(v5, "valueForKeyPath:", CFSTR("transform.scale"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.scale"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFromValue:", v11);
  objc_msgSend(v12, "setToValue:", &unk_24D6FEF08);
  v24[0] = v8;
  v24[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAnimations:", v13);

  -[SXComponentAnimationHandler component](self, "component");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addAnimation:forKey:", v7, CFSTR("scaleAndFade"));

  memset(&v22, 0, sizeof(v22));
  CATransform3DMakeScale(&v22, 1.0, 1.0, 1.0);
  -[SXComponentAnimationHandler component](self, "component");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v22;
  objc_msgSend(v17, "setTransform:", &v21);

  -[SXComponentAnimationHandler component](self, "component");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v20) = 1.0;
  objc_msgSend(v19, "setOpacity:", v20);

}

- (void)updateAnimationWithFactor:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  CATransform3D v19;
  CATransform3D v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)SXScaleAndFadeComponentAnimationHandler;
  -[SXComponentAnimationHandler updateAnimationWithFactor:](&v21, sel_updateAnimationWithFactor_);
  -[SXScaleAndFadeComponentAnimationHandler initialAlpha](self, "initialAlpha");
  v6 = v5;
  -[SXScaleAndFadeComponentAnimationHandler initialAlpha](self, "initialAlpha");
  v8 = v7;
  -[SXScaleAndFadeComponentAnimationHandler initialScale](self, "initialScale");
  v10 = v9;
  -[SXScaleAndFadeComponentAnimationHandler initialScale](self, "initialScale");
  v12 = v11;
  if (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsReduceMotionEnabled())
    v13 = 1.0;
  else
    v13 = v12 + (1.0 - v10) * a3;
  memset(&v20, 0, sizeof(v20));
  CATransform3DMakeScale(&v20, v13, v13, 1.0);
  -[SXComponentAnimationHandler component](self, "component");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v20;
  objc_msgSend(v15, "setTransform:", &v19);

  -[SXComponentAnimationHandler component](self, "component");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v18 = v8 + (1.0 - v6) * a3;
  objc_msgSend(v17, "setOpacity:", v18);

}

- (void)finishAnimation
{
  void *v3;
  void *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  void *v9;
  void *v10;
  double v11;
  _OWORD v12[8];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SXScaleAndFadeComponentAnimationHandler;
  -[SXComponentAnimationHandler finishAnimation](&v13, sel_finishAnimation);
  -[SXComponentAnimationHandler component](self, "component");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
  v12[4] = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
  v12[5] = v5;
  v6 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
  v12[6] = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
  v12[7] = v6;
  v7 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
  v12[0] = *MEMORY[0x24BDE5598];
  v12[1] = v7;
  v8 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
  v12[2] = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
  v12[3] = v8;
  objc_msgSend(v4, "setTransform:", v12);

  -[SXComponentAnimationHandler component](self, "component");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = 1.0;
  objc_msgSend(v10, "setOpacity:", v11);

}

- (double)initialAlpha
{
  return self->_initialAlpha;
}

- (void)setInitialAlpha:(double)a3
{
  self->_initialAlpha = a3;
}

- (double)initialScale
{
  return self->_initialScale;
}

- (void)setInitialScale:(double)a3
{
  self->_initialScale = a3;
}

@end
