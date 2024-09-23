@implementation SXScaleComponentAnimationHandler

- (void)prepareAnimation
{
  void *v3;
  void *v4;
  CATransform3D v5;
  CATransform3D v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SXScaleComponentAnimationHandler;
  -[SXComponentAnimationHandler prepareAnimation](&v7, sel_prepareAnimation);
  memset(&v6, 0, sizeof(v6));
  CATransform3DMakeScale(&v6, 0.5, 0.5, 1.0);
  -[SXComponentAnimationHandler component](self, "component");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v6;
  objc_msgSend(v4, "setTransform:", &v5);

}

- (void)updateAnimationWithFactor:(double)a3
{
  double v5;
  void *v6;
  void *v7;
  CATransform3D v8;
  CATransform3D v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SXScaleComponentAnimationHandler;
  -[SXComponentAnimationHandler updateAnimationWithFactor:](&v10, sel_updateAnimationWithFactor_);
  if (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsReduceMotionEnabled())
    v5 = 1.0;
  else
    v5 = a3 * 0.5 + 0.5;
  memset(&v9, 0, sizeof(v9));
  CATransform3DMakeScale(&v9, v5, v5, 1.0);
  -[SXComponentAnimationHandler component](self, "component");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v9;
  objc_msgSend(v7, "setTransform:", &v8);

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
  CATransform3D v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SXScaleComponentAnimationHandler;
  -[SXComponentAnimationHandler startAnimation](&v14, sel_startAnimation);
  -[SXComponentAnimationHandler component](self, "component");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentationLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.scale"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKeyPath:", CFSTR("transform.scale"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFromValue:", v7);

  objc_msgSend(v6, "setToValue:", &unk_24D6FEF20);
  objc_msgSend(v6, "setDuration:", 0.3);
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTimingFunction:", v8);

  objc_msgSend(v6, "setDelegate:", self);
  objc_msgSend(v6, "setRemovedOnCompletion:", 0);
  objc_msgSend(v6, "setFillMode:", *MEMORY[0x24BDE5978]);
  -[SXComponentAnimationHandler component](self, "component");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAnimation:forKey:", v6, CFSTR("scaleAnimation"));

  -[SXComponentAnimationHandler component](self, "component");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  CATransform3DMakeScale(&v13, 1.0, 1.0, 1.0);
  objc_msgSend(v12, "setTransform:", &v13);

}

- (void)finishAnimation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _OWORD v11[8];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SXScaleComponentAnimationHandler;
  -[SXComponentAnimationHandler finishAnimation](&v12, sel_finishAnimation);
  -[SXComponentAnimationHandler component](self, "component");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAnimationForKey:", CFSTR("scaleAnimation"));

  -[SXComponentAnimationHandler component](self, "component");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
  v11[4] = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
  v11[5] = v7;
  v8 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
  v11[6] = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
  v11[7] = v8;
  v9 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
  v11[0] = *MEMORY[0x24BDE5598];
  v11[1] = v9;
  v10 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
  v11[2] = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
  v11[3] = v10;
  objc_msgSend(v6, "setTransform:", v11);

}

@end
