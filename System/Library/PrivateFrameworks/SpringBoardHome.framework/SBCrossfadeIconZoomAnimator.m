@implementation SBCrossfadeIconZoomAnimator

- (SBCrossfadeIconZoomAnimator)initWithFolderController:(id)a3 crossfadeView:(id)a4 icon:(id)a5
{
  id v9;
  SBCrossfadeIconZoomAnimator *v10;
  SBCrossfadeIconZoomAnimator *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBCrossfadeIconZoomAnimator;
  v10 = -[SBScaleIconZoomAnimator initWithAnimationContainer:targetIcon:](&v13, sel_initWithAnimationContainer_targetIcon_, a3, a5);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_crossfadeView, a4);
    -[SBCrossfadeIconZoomAnimator _assertCrossfadeViewSizeIfNecessary](v11, "_assertCrossfadeViewSizeIfNecessary");
    if (-[SBIconAnimator _isDelayedForRotation](v11, "_isDelayedForRotation"))
      -[SBCrossfadeIconZoomAnimator _delayedForRotation](v11, "_delayedForRotation");
  }

  return v11;
}

- (double)maxHomeScreenZoomScale
{
  return 3.0;
}

- (BOOL)fadesHomeScreen
{
  return 1;
}

- (void)_delayedForRotation
{
  void *v3;
  id v4;

  -[UIView setHidden:](self->_crossfadeView, "setHidden:", 1);
  -[SBIconAnimator animationContainer](self, "animationContainer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "animationWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", self->_crossfadeView);

}

- (void)_prepareAnimation
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  objc_super v24;

  -[SBCrossfadeIconZoomAnimator _assertCrossfadeViewSizeIfNecessary](self, "_assertCrossfadeViewSizeIfNecessary");
  -[UIView setHidden:](self->_crossfadeView, "setHidden:", 0);
  v24.receiver = self;
  v24.super_class = (Class)SBCrossfadeIconZoomAnimator;
  -[SBScaleIconZoomAnimator _prepareAnimation](&v24, sel__prepareAnimation);
  -[SBCrossfadeIconZoomAnimator _zoomedIconCenter](self, "_zoomedIconCenter");
  v4 = v3;
  v6 = v5;
  -[SBScaleIconZoomAnimator zoomScale](self, "zoomScale");
  v8 = v7;
  -[SBCrossfadeIconZoomAnimator _zoomedFrame](self, "_zoomedFrame");
  v10 = v9;
  v12 = v11;
  -[SBScaleIconZoomAnimator targetIconView](self, "targetIconView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "iconImageVisibleSize");
  v15 = v14;
  v17 = v16;

  v18 = v8 * v15;
  v19 = v8 * v17;
  v20 = 0.5;
  v21 = 0.5;
  if ((SBFFloatEqualsFloat() & 1) == 0 && v10 > v18)
    v21 = (v4 + v18 * -0.5) / (v10 - v18);
  if ((SBFFloatEqualsFloat() & 1) == 0 && v12 > v19)
    v20 = (v6 + v19 * -0.5) / (v12 - v19);
  -[SBScaleIconZoomAnimator targetIconView](self, "targetIconView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBCrossfadeIconZoomAnimator performsTrueCrossfade](self, "performsTrueCrossfade"))
    v23 = 3;
  else
    v23 = 1;
  objc_msgSend(v22, "prepareToCrossfadeImageWithView:anchorPoint:options:", self->_crossfadeView, v23, v21, v20);

}

- (void)_setAnimationFraction:(double)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBCrossfadeIconZoomAnimator;
  -[SBScaleIconZoomAnimator _setAnimationFraction:](&v6, sel__setAnimationFraction_);
  -[SBScaleIconZoomAnimator targetIconView](self, "targetIconView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCrossfadeFraction:", a3);
  -[SBCrossfadeIconZoomAnimator _appSnapshotCornerRadiusForFraction:](self, "_appSnapshotCornerRadiusForFraction:", a3);
  objc_msgSend(v5, "setCrossfadeCornerRadius:");
  objc_msgSend(v5, "setMorphFraction:", a3);

}

- (void)_cleanupZoom
{
  void *v3;
  void *v4;
  objc_super v5;

  -[SBScaleIconZoomAnimator targetIcon](self, "targetIcon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconZoomAnimator iconViewForIcon:](self, "iconViewForIcon:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setIconImageAlpha:", 0.0);
  v5.receiver = self;
  v5.super_class = (Class)SBCrossfadeIconZoomAnimator;
  -[SBIconZoomAnimator _cleanupZoom](&v5, sel__cleanupZoom);

}

- (void)_cleanupAnimation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  -[SBScaleIconZoomAnimator targetIcon](self, "targetIcon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconZoomAnimator iconViewForIcon:](self, "iconViewForIcon:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setIconImageAlpha:", 1.0);
  objc_msgSend(v4, "cleanupAfterCrossfade");
  -[SBScaleIconZoomAnimator targetIcon](self, "targetIcon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconZoomAnimator iconViewForIcon:](self, "iconViewForIcon:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", 0);

  v7.receiver = self;
  v7.super_class = (Class)SBCrossfadeIconZoomAnimator;
  -[SBScaleIconZoomAnimator _cleanupAnimation](&v7, sel__cleanupAnimation);

}

- (unint64_t)_numberOfSignificantAnimations
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBCrossfadeIconZoomAnimator;
  return -[SBScaleIconZoomAnimator _numberOfSignificantAnimations](&v3, sel__numberOfSignificantAnimations) + 2;
}

- (void)_performAnimationToFraction:(double)a3 withCentralAnimationSettings:(id)a4 delay:(double)a5 alreadyAnimating:(BOOL)a6 sharedCompletion:(id)a7
{
  _BOOL8 v7;
  id v12;
  int IsZero;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  _QWORD v36[6];
  _QWORD v37[6];
  _QWORD v38[4];
  id v39;
  objc_super v40;

  v7 = a6;
  v12 = a7;
  v40.receiver = self;
  v40.super_class = (Class)SBCrossfadeIconZoomAnimator;
  -[SBScaleIconZoomAnimator _performAnimationToFraction:withCentralAnimationSettings:delay:alreadyAnimating:sharedCompletion:](&v40, sel__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion_, a4, v7, v12, a3, a5);
  IsZero = BSFloatIsZero();
  v14 = MEMORY[0x1E0C809B0];
  if (IsZero)
  {
    -[SBIconAnimator backgroundDarkeningView](self, "backgroundDarkeningView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0DC3F10];
    v38[0] = v14;
    v38[1] = 3221225472;
    v38[2] = __128__SBCrossfadeIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke;
    v38[3] = &unk_1E8D84C50;
    v39 = v15;
    v17 = v15;
    objc_msgSend(v16, "animateWithDuration:delay:options:animations:completion:", 0, v38, 0, 0.25, a5);

  }
  if ((BSFloatIsZero() & 1) != 0 || BSFloatIsOne())
  {
    -[SBIconAnimator settings](self, "settings");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v7)
      v20 = 6;
    else
      v20 = 2;
    objc_msgSend(v18, "crossfadeSettings");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "BSAnimationSettings");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "mutableCopy");

    objc_msgSend(v19, "appSnapshotCornerRadiusSettings");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "BSAnimationSettings");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v25, "mutableCopy");

    objc_msgSend(v19, "effectiveMorphAnimationSettings");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "BSAnimationSettings");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v28, "mutableCopy");

    if (v7)
    {
      objc_msgSend(v23, "setDelay:", 0.0);
      objc_msgSend(v26, "setDelay:", 0.0);
      objc_msgSend(v29, "setDelay:", 0.0);
    }
    v35 = v23;
    objc_msgSend(MEMORY[0x1E0D01908], "factoryWithSettings:", v23);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v26;
    objc_msgSend(MEMORY[0x1E0D01908], "factoryWithSettings:", v26);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D01908], "factoryWithSettings:", v29);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7 || BSFloatIsZero())
    {
      objc_msgSend(v30, "setAllowsAdditiveAnimations:", 1);
      objc_msgSend(v31, "setAllowsAdditiveAnimations:", 1);
      objc_msgSend(v32, "setAllowsAdditiveAnimations:", 1);
    }
    v33 = MEMORY[0x1E0C809B0];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __128__SBCrossfadeIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_2;
    v37[3] = &unk_1E8D84C78;
    v37[4] = self;
    *(double *)&v37[5] = a3;
    objc_msgSend(MEMORY[0x1E0D01908], "animateWithFactory:additionalDelay:options:actions:completion:", v30, v20, v37, v12, a5);
    v36[0] = v33;
    v36[1] = 3221225472;
    v36[2] = __128__SBCrossfadeIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_3;
    v36[3] = &unk_1E8D84C78;
    v36[4] = self;
    *(double *)&v36[5] = a3;
    objc_msgSend(MEMORY[0x1E0D01908], "animateWithFactory:additionalDelay:options:actions:completion:", v32, v20, v36, v12, a5);

  }
}

uint64_t __128__SBCrossfadeIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

void __128__SBCrossfadeIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "targetIconView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCrossfadeFraction:", *(double *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "targetIconView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_appSnapshotCornerRadiusForFraction:", *(double *)(a1 + 40));
  objc_msgSend(v3, "setCrossfadeCornerRadius:");

}

void __128__SBCrossfadeIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "targetIconView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMorphFraction:", *(double *)(a1 + 40));

}

- (CGRect)_zoomedFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UIView frame](self->_crossfadeView, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGPoint)_zoomedIconCenter
{
  void *v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGPoint result;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  -[SBScaleIconZoomAnimator targetIconView](self, "targetIconView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBScaleIconZoomAnimator zoomScale](self, "zoomScale");
  v5 = v4;
  -[SBCrossfadeIconZoomAnimator _zoomedFrame](self, "_zoomedFrame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v3, "iconImageCenter");
  v15 = v14;
  v17 = v16;
  -[SBIconAnimator referenceView](self, "referenceView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "convertPoint:toView:", v18, v15, v17);
  v20 = v19;
  v22 = v21;

  objc_msgSend(v3, "iconImageVisibleSize");
  v24 = v5 * v23;
  v37 = v5 * v25;
  v39.origin.x = v7;
  v39.origin.y = v9;
  v39.size.width = v11;
  v39.size.height = v13;
  v26 = v24 * 0.5;
  v27 = CGRectGetMinX(v39) + v24 * 0.5;
  v40.origin.x = v7;
  v40.origin.y = v9;
  v40.size.width = v11;
  v40.size.height = v13;
  v28 = CGRectGetMaxX(v40) - v26;
  if (v27 >= v20)
    v29 = v27;
  else
    v29 = v20;
  if (v28 <= v29)
    v30 = v28;
  else
    v30 = v29;
  v41.origin.x = v7;
  v41.origin.y = v9;
  v41.size.width = v11;
  v41.size.height = v13;
  v31 = v37 * 0.5 + CGRectGetMinY(v41);
  v42.origin.x = v7;
  v42.origin.y = v9;
  v42.size.width = v11;
  v42.size.height = v13;
  v32 = CGRectGetMaxY(v42) - v37 * 0.5;
  if (v31 >= v22)
    v33 = v31;
  else
    v33 = v22;
  if (v32 <= v33)
    v34 = v32;
  else
    v34 = v33;

  v35 = v30;
  v36 = v34;
  result.y = v36;
  result.x = v35;
  return result;
}

- (double)_appSnapshotCornerRadiusForFraction:(double)a3
{
  void *v4;
  double v5;
  double v6;

  -[SBScaleIconZoomAnimator targetIconView](self, "targetIconView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iconImageInfo");
  v6 = (1.0 - a3) * v5;

  return v6;
}

- (BOOL)performsTrueCrossfade
{
  return self->_performsTrueCrossfade;
}

- (void)setPerformsTrueCrossfade:(BOOL)a3
{
  self->_performsTrueCrossfade = a3;
}

- (BOOL)masksCorners
{
  return self->_masksCorners;
}

- (void)setMasksCorners:(BOOL)a3
{
  self->_masksCorners = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crossfadeView, 0);
}

@end
