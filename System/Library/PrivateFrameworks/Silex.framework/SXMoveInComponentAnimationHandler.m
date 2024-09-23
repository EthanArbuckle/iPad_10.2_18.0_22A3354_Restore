@implementation SXMoveInComponentAnimationHandler

- (void)prepareAnimation
{
  void *v3;
  void *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  double v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  _BOOL8 v34;
  int v35;
  double v36;
  void *v37;
  double MinX;
  double v39;
  double MinY;
  double v41;
  double MaxX;
  CATransform3D v43;
  CATransform3D v44;
  objc_super v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;

  v45.receiver = self;
  v45.super_class = (Class)SXMoveInComponentAnimationHandler;
  -[SXComponentAnimationHandler prepareAnimation](&v45, sel_prepareAnimation);
  -[SXComponentAnimationHandler component](self, "component");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsReduceMotionEnabled())
  {
    objc_msgSend(v3, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
    *(_OWORD *)&v44.m31 = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
    *(_OWORD *)&v44.m33 = v5;
    v6 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
    *(_OWORD *)&v44.m41 = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
    *(_OWORD *)&v44.m43 = v6;
    v7 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
    *(_OWORD *)&v44.m11 = *MEMORY[0x24BDE5598];
    *(_OWORD *)&v44.m13 = v7;
    v8 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
    *(_OWORD *)&v44.m21 = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
    *(_OWORD *)&v44.m23 = v8;
    objc_msgSend(v4, "setTransform:", &v44);
    goto LABEL_4;
  }
  objc_msgSend(v3, "viewport");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "absoluteFrame");
  x = v46.origin.x;
  y = v46.origin.y;
  width = v46.size.width;
  height = v46.size.height;
  v39 = CGRectGetWidth(v46);
  v47.origin.x = x;
  v47.origin.y = y;
  v47.size.width = width;
  v47.size.height = height;
  MinX = CGRectGetMinX(v47);
  v48.origin.x = x;
  v48.origin.y = y;
  v48.size.width = width;
  v48.size.height = height;
  MinY = CGRectGetMinY(v48);
  v49.origin.x = x;
  v49.origin.y = y;
  v49.size.width = width;
  v49.size.height = height;
  v13 = CGRectGetMinX(v49);
  v50.origin.x = x;
  v50.origin.y = y;
  v50.size.width = width;
  v50.size.height = height;
  v14 = CGRectGetHeight(v50);
  v51.origin.x = x;
  v51.origin.y = y;
  v51.size.width = width;
  v51.size.height = height;
  MaxX = CGRectGetMaxX(v51);
  v52.origin.x = x;
  v52.origin.y = y;
  v52.size.width = width;
  v52.size.height = height;
  v41 = CGRectGetMinY(v52);
  objc_msgSend(v4, "bounds");
  v15 = CGRectGetWidth(v53);
  v54.origin.x = x;
  v54.origin.y = y;
  v54.size.width = width;
  v54.size.height = height;
  v16 = v15 - CGRectGetMaxX(v54);
  v55.origin.x = x;
  v55.origin.y = y;
  v55.size.width = width;
  v55.size.height = height;
  v17 = CGRectGetHeight(v55);
  objc_msgSend(v3, "presentationDelegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "componentController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "componentsInRect:", 0.0, MinY, v13, v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  objc_msgSend(v3, "presentationDelegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "componentController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "componentsInRect:", MaxX, v41, v16, v17);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");

  -[SXComponentAnimationHandler animation](self, "animation");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "preferredStartingPosition");

  if (!v21 && v27 == 1)
    goto LABEL_7;
  -[SXComponentAnimationHandler animation](self, "animation");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "preferredStartingPosition");

  if (!v25 && v30 == 2)
    goto LABEL_28;
  -[SXComponentAnimationHandler animation](self, "animation");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "preferredStartingPosition");

  if (v32 || !v21)
  {
    if (!v32)
    {
LABEL_7:
      v28 = -(v39 + MinX);
      goto LABEL_29;
    }
    v33 = 2 * (v25 == 0);
  }
  else
  {
    if (!v25)
    {
      v33 = 2;
      goto LABEL_25;
    }
    v33 = 0;
  }
  if (v25)
    v34 = v21 == 0;
  else
    v34 = 1;
  v35 = !v34;
  if (!v21)
    v35 = 1;
  if (v35)
    v33 = v34;
LABEL_25:
  if (v33 != 2)
  {
    if (v33 != 1)
      goto LABEL_4;
    goto LABEL_7;
  }
LABEL_28:
  objc_msgSend(v4, "bounds");
  v36 = CGRectGetWidth(v56);
  v57.origin.x = x;
  v57.origin.y = y;
  v57.size.width = width;
  v57.size.height = height;
  v28 = v36 - CGRectGetMinX(v57);
LABEL_29:
  if (v28 != 0.0)
  {
    memset(&v44, 0, sizeof(v44));
    CATransform3DMakeTranslation(&v44, v28, 0.0, 0.0);
    objc_msgSend(v3, "layer");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v44;
    objc_msgSend(v37, "setTransform:", &v43);

    -[SXMoveInComponentAnimationHandler setStartXOffset:](self, "setStartXOffset:", v28);
  }
LABEL_4:

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
  v10.super_class = (Class)SXMoveInComponentAnimationHandler;
  -[SXComponentAnimationHandler updateAnimationWithFactor:](&v10, sel_updateAnimationWithFactor_);
  -[SXMoveInComponentAnimationHandler startXOffset](self, "startXOffset");
  memset(&v9, 0, sizeof(v9));
  CATransform3DMakeTranslation(&v9, (1.0 - a3) * v5, 0.0, 0.0);
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
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _OWORD v16[8];
  objc_super v17;

  if (!UIAccessibilityIsVoiceOverRunning() && !UIAccessibilityIsReduceMotionEnabled())
  {
    v17.receiver = self;
    v17.super_class = (Class)SXMoveInComponentAnimationHandler;
    -[SXComponentAnimationHandler startAnimation](&v17, sel_startAnimation);
    -[SXComponentAnimationHandler component](self, "component");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentationLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "valueForKeyPath:", CFSTR("transform"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
    v16[4] = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
    v16[5] = v7;
    v8 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
    v16[6] = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
    v16[7] = v8;
    v9 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
    v16[0] = *MEMORY[0x24BDE5598];
    v16[1] = v9;
    v10 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
    v16[2] = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
    v16[3] = v10;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCATransform3D:", v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDelegate:", self);
    objc_msgSend(v12, "setFromValue:", v6);
    objc_msgSend(v12, "setToValue:", v11);
    objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D28]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTimingFunction:", v13);

    objc_msgSend(v12, "setFillMode:", *MEMORY[0x24BDE5978]);
    objc_msgSend(v12, "setRemovedOnCompletion:", 0);
    objc_msgSend(v12, "setDuration:", 0.6);
    -[SXComponentAnimationHandler component](self, "component");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addAnimation:forKey:", v12, CFSTR("moveIn"));

  }
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
  objc_super v11;
  _OWORD v12[8];

  -[SXComponentAnimationHandler component](self, "component");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAnimationForKey:", CFSTR("moveIn"));

  -[SXComponentAnimationHandler component](self, "component");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
  v12[4] = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
  v12[5] = v7;
  v8 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
  v12[6] = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
  v12[7] = v8;
  v9 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
  v12[0] = *MEMORY[0x24BDE5598];
  v12[1] = v9;
  v10 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
  v12[2] = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
  v12[3] = v10;
  objc_msgSend(v6, "setTransform:", v12);

  v11.receiver = self;
  v11.super_class = (Class)SXMoveInComponentAnimationHandler;
  -[SXComponentAnimationHandler finishAnimation](&v11, sel_finishAnimation);
}

- (double)startXOffset
{
  return self->_startXOffset;
}

- (void)setStartXOffset:(double)a3
{
  self->_startXOffset = a3;
}

@end
