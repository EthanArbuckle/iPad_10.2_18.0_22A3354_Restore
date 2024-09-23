@implementation SBCoverSheetIconFlyInAnimator

- (SBCoverSheetIconFlyInAnimator)initWithFolderController:(id)a3
{
  SBCoverSheetIconFlyInAnimator *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  CAMediaTimingFunction *timingFunction;
  NSObject *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBCoverSheetIconFlyInAnimator;
  v3 = -[SBCenterIconZoomAnimator initWithFolderController:](&v11, sel_initWithFolderController_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D1BBD8], "rootSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "coverSheetTransitionsSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "flyInSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "addKeyObserver:", v3);
    -[SBCoverSheetIconFlyInAnimator _updateWithSettings:](v3, "_updateWithSettings:", v6);
    -[SBCoverSheetIconFlyInAnimator _createAnimatableProperties](v3, "_createAnimatableProperties");
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
    v7 = objc_claimAutoreleasedReturnValue();
    timingFunction = v3->_timingFunction;
    v3->_timingFunction = (CAMediaTimingFunction *)v7;

    SBLogCoverSheet();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[SBCoverSheetIconFlyInAnimator initWithFolderController:].cold.1((uint64_t)v3, v9);

  }
  return v3;
}

- (void)_prepareAnimation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBCoverSheetIconFlyInAnimator;
  -[SBCenterIconZoomAnimator _prepareAnimation](&v5, sel__prepareAnimation);
  -[SBCenterIconZoomAnimator folderController](self, "folderController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pageControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBCoverSheetIconFlyInAnimator setPageControl:](self, "setPageControl:", v4);

}

- (void)_setAnimationFraction:(double)a3 withCenter:(CGPoint)a4
{
  NSObject *v6;
  double v7;
  double v8;
  _QWORD v9[6];
  objc_super v10;
  uint8_t buf[4];
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)SBCoverSheetIconFlyInAnimator;
  -[SBCenterIconZoomAnimator _setAnimationFraction:withCenter:](&v10, sel__setAnimationFraction_withCenter_, a3, a4.x, a4.y);
  SBLogCoverSheet();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v12 = a3;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "set icon animator fraction: %.2f", buf, 0xCu);
  }

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__SBCoverSheetIconFlyInAnimator__setAnimationFraction_withCenter___block_invoke;
  v9[3] = &unk_1E8E9DE88;
  v9[4] = self;
  *(double *)&v9[5] = a3;
  LODWORD(v7) = *(_DWORD *)(MEMORY[0x1E0CD23C0] + 4);
  LODWORD(v8) = *(_DWORD *)(MEMORY[0x1E0CD23C0] + 8);
  objc_msgSend(MEMORY[0x1E0CEABB0], "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 0, v9, COERCE_DOUBLE((unint64_t)*MEMORY[0x1E0CD23C0]), v7, v8);
}

void __66__SBCoverSheetIconFlyInAnimator__setAnimationFraction_withCenter___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "labelAlphaDrivingProgressAnimatableProperty");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:", *(double *)(a1 + 40));

}

- (void)_updateDockForFraction:(double)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBCoverSheetIconFlyInAnimator;
  -[SBCenterIconZoomAnimator _updateDockForFraction:](&v5, sel__updateDockForFraction_, a3 * 4.0);
  -[SBCenterIconZoomAnimator dockOffscreenFractionModifier](self, "dockOffscreenFractionModifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeededForDockOffscreenFractionChanged");

}

- (double)_zPositionForView:(id)a3 center:(CGPoint)a4 andFraction:(double)a5
{
  double y;
  double x;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  NSObject *v22;
  int v24;
  id v25;
  __int16 v26;
  double v27;
  __int16 v28;
  double v29;
  __int16 v30;
  double v31;
  uint64_t v32;

  y = a4.y;
  x = a4.x;
  v32 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  -[SBIconZoomAnimator iconListView](self, "iconListView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "center");
  v12 = v11;
  v14 = v13;
  objc_msgSend(v9, "superview");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "convertPoint:fromView:", v15, v12, v14);
  objc_msgSend(v10, "fractionalCoordinateAtPoint:");
  v17 = v16;
  v19 = v18;

  -[SBCoverSheetIconFlyInAnimator _zPositionForPoint:center:andFraction:](self, "_zPositionForPoint:center:andFraction:", v17, v19, x, y, a5);
  v21 = v20;
  SBLogCoverSheet();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    v24 = 138413058;
    v25 = v9;
    v26 = 2048;
    v27 = v17;
    v28 = 2048;
    v29 = v19;
    v30 = 2048;
    v31 = v21;
    _os_log_debug_impl(&dword_1D0540000, v22, OS_LOG_TYPE_DEBUG, "extraView: %@, viewCenter: (%.2f, %.2f), zPosition: %.2f", (uint8_t *)&v24, 0x2Au);
  }

  return v21;
}

- (double)_zPositionForPoint:(CGPoint)a3 center:(CGPoint)a4 andFraction:(double)a5
{
  double y;
  double x;
  double v8;
  double v9;
  void *v11;
  double v13;
  double v14;
  double v15;
  unint64_t v16;
  double v17;
  unint64_t v18;
  double v19;
  double v20;
  double effectMultiplier;
  double v22;
  double v23;

  y = a4.y;
  x = a4.x;
  v8 = a3.y;
  v9 = a3.x;
  -[SBIconZoomAnimator iconListView](self, "iconListView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (x == *(double *)&SBCoverSheetIconFlyInDefaultCenter && y == unk_1EFC446B8)
  {
    -[SBCenterIconZoomAnimator centerCol](self, "centerCol");
    x = v13;
    -[SBCenterIconZoomAnimator centerRow](self, "centerRow");
    y = v14;
  }
  v15 = sqrt((v8 - y) * (v8 - y) + (v9 - x) * (v9 - x));
  v16 = objc_msgSend(v11, "iconRowsForCurrentOrientation");
  v17 = (double)v16 * (double)v16;
  v18 = objc_msgSend(v11, "iconColumnsForCurrentOrientation");
  -[SBCoverSheetIconFlyInAnimator _functionWithProgress:distance:](self, "_functionWithProgress:distance:", 1.0, sqrt(v17 + (double)v18 * (double)v18));
  v20 = v19;
  effectMultiplier = self->_effectMultiplier;
  -[SBCoverSheetIconFlyInAnimator _functionWithProgress:distance:](self, "_functionWithProgress:distance:", a5, v15);
  v23 = effectMultiplier * v22 / v20;

  return v23;
}

- (void)_cleanupAnimation
{
  NSObject *v3;
  void *v4;
  objc_super v5;
  uint8_t buf[4];
  SBCoverSheetIconFlyInAnimator *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)SBCoverSheetIconFlyInAnimator;
  -[SBCenterIconZoomAnimator _cleanupAnimation](&v5, sel__cleanupAnimation);
  SBLogCoverSheet();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v7 = self;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "icon animator: %p cleanup animation", buf, 0xCu);
  }

  -[SBCoverSheetIconFlyInAnimator labelAlphaDrivingProgressAnimatableProperty](self, "labelAlphaDrivingProgressAnimatableProperty");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:", 0.0);

  -[SBCoverSheetIconFlyInAnimator setLabelAlphaDrivingProgressAnimatableProperty:](self, "setLabelAlphaDrivingProgressAnimatableProperty:", 0);
}

- (void)_createAnimatableProperties
{
  UIViewFloatAnimatableProperty *v3;
  UIViewFloatAnimatableProperty *labelAlphaDrivingProgressAnimatableProperty;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E0CEABC0]);
  labelAlphaDrivingProgressAnimatableProperty = self->_labelAlphaDrivingProgressAnimatableProperty;
  self->_labelAlphaDrivingProgressAnimatableProperty = v3;

  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E0CEABB0];
  v13[0] = self->_labelAlphaDrivingProgressAnimatableProperty;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__SBCoverSheetIconFlyInAnimator__createAnimatableProperties__block_invoke;
  v10[3] = &unk_1E8E9DF28;
  objc_copyWeak(&v11, &location);
  v8[0] = v7;
  v8[1] = 3221225472;
  v8[2] = __60__SBCoverSheetIconFlyInAnimator__createAnimatableProperties__block_invoke_2;
  v8[3] = &unk_1E8E9DF28;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v5, "_createTransformerWithInputAnimatableProperties:modelValueSetter:presentationValueSetter:", v6, v10, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __60__SBCoverSheetIconFlyInAnimator__createAnimatableProperties__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateLabelAlphaForPresentationValue:", 0);

}

void __60__SBCoverSheetIconFlyInAnimator__createAnimatableProperties__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateLabelAlphaForPresentationValue:", 1);

}

- (void)_updateLabelAlphaForPresentationValue:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  NSObject *v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  char v23;
  _QWORD v24[5];
  _QWORD v25[5];
  uint8_t buf[4];
  SBCoverSheetIconFlyInAnimator *v27;
  __int16 v28;
  double v29;
  __int16 v30;
  double v31;
  uint64_t v32;

  v3 = a3;
  v32 = *MEMORY[0x1E0C80C00];
  if (-[SBCenterIconZoomAnimator animatingIcons](self, "animatingIcons"))
  {
    -[SBCoverSheetIconFlyInAnimator labelAlphaDrivingProgressAnimatableProperty](self, "labelAlphaDrivingProgressAnimatableProperty");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
    {
      objc_msgSend(v5, "presentationValue");
      v8 = v7;

      -[SBCoverSheetIconFlyInAnimator _labelAlphaForFraction:](self, "_labelAlphaForFraction:", v8);
      v10 = v9;
      SBLogCoverSheet();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218496;
        v27 = self;
        v28 = 2048;
        v29 = v8;
        v30 = 2048;
        v31 = v10;
        _os_log_debug_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEBUG, "icon animator: %p fractionPresentationValue:\t%.2f\tlabelAlpha: %2f", buf, 0x20u);
      }

      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __71__SBCoverSheetIconFlyInAnimator__updateLabelAlphaForPresentationValue___block_invoke;
      v25[3] = &__block_descriptor_40_e34_v28__0__SBIcon_8__SBIconView_16B24l;
      *(double *)&v25[4] = v10;
      -[SBIconZoomAnimator enumerateIconsAndIconViewsWithHandler:](self, "enumerateIconsAndIconViewsWithHandler:", v25);
      -[SBCoverSheetIconFlyInAnimator pageControl](self, "pageControl");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_setPresentationValue:forKey:", v13, CFSTR("opacity"));
    }
    else
    {
      objc_msgSend(v5, "value");
      v15 = v14;

      -[SBCoverSheetIconFlyInAnimator _labelAlphaForFraction:](self, "_labelAlphaForFraction:", v15);
      v17 = v16;
      SBLogCoverSheet();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218496;
        v27 = self;
        v28 = 2048;
        v29 = v15;
        v30 = 2048;
        v31 = v17;
        _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_INFO, "icon animator: %p fractionModelValue:\t\t%.2f\tlabelAlpha: %2f", buf, 0x20u);
      }

      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __71__SBCoverSheetIconFlyInAnimator__updateLabelAlphaForPresentationValue___block_invoke_16;
      v24[3] = &__block_descriptor_40_e34_v28__0__SBIcon_8__SBIconView_16B24l;
      *(double *)&v24[4] = v17;
      -[SBIconZoomAnimator enumerateIconsAndIconViewsWithHandler:](self, "enumerateIconsAndIconViewsWithHandler:", v24);
      -[SBCenterIconZoomAnimator folderController](self, "folderController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_opt_class();
      v12 = v19;
      if (v20)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v21 = v12;
        else
          v21 = 0;
      }
      else
      {
        v21 = 0;
      }
      v22 = v21;

      v23 = objc_msgSend(v22, "isPageManagementUIVisible");
      if ((v23 & 1) != 0)
        goto LABEL_16;
      -[SBCoverSheetIconFlyInAnimator pageControl](self, "pageControl");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setAlpha:", v17);
    }

LABEL_16:
  }
}

void __71__SBCoverSheetIconFlyInAnimator__updateLabelAlphaForPresentationValue___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "effectiveIconLabelAlpha");
  if ((BSFloatIsZero() & 1) == 0)
  {
    objc_msgSend(v8, "labelView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setPresentationValue:forKey:", v5, CFSTR("opacity"));

    objc_msgSend(v8, "labelAccessoryView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setPresentationValue:forKey:", v7, CFSTR("opacity"));

  }
}

void __71__SBCoverSheetIconFlyInAnimator__updateLabelAlphaForPresentationValue___block_invoke_16(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "effectiveIconLabelAlpha");
  if ((BSFloatIsZero() & 1) == 0)
  {
    objc_msgSend(v6, "labelView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlpha:", *(double *)(a1 + 32));

    objc_msgSend(v6, "labelAccessoryView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlpha:", *(double *)(a1 + 32));

  }
}

- (double)_labelAlphaForFraction:(double)a3
{
  double v4;
  float v5;

  BSIntervalSubIntervalValueForValue();
  *(float *)&v4 = v4;
  -[CAMediaTimingFunction _solveForInput:](self->_timingFunction, "_solveForInput:", v4, 0, 1, 0x3FF0000000000000, 1, 0, 1, 0x3FC999999999999ALL, 1, 0, 1, 0x3FF0000000000000, 1);
  return 1.0 - v5;
}

- (void)_updateWithSettings:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(v4, "baselineDistance");
  self->_baselineDistance = v5;
  objc_msgSend(v4, "effectMultiplier");
  self->_effectMultiplier = v6;
  objc_msgSend(v4, "distanceExponent");
  v8 = v7;

  self->_distanceExponent = v8;
}

- (double)_functionWithProgress:(double)a3 distance:(double)a4
{
  long double v6;
  double baselineDistance;

  v6 = exp(a3) + -1.0;
  baselineDistance = self->_baselineDistance;
  return v6 * (baselineDistance + pow(a4, self->_distanceExponent));
}

- (UIViewFloatAnimatableProperty)labelAlphaDrivingProgressAnimatableProperty
{
  return self->_labelAlphaDrivingProgressAnimatableProperty;
}

- (void)setLabelAlphaDrivingProgressAnimatableProperty:(id)a3
{
  objc_storeStrong((id *)&self->_labelAlphaDrivingProgressAnimatableProperty, a3);
}

- (CAMediaTimingFunction)timingFunction
{
  return self->_timingFunction;
}

- (void)setTimingFunction:(id)a3
{
  objc_storeStrong((id *)&self->_timingFunction, a3);
}

- (UIPageControl)pageControl
{
  return self->_pageControl;
}

- (void)setPageControl:(id)a3
{
  objc_storeStrong((id *)&self->_pageControl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_storeStrong((id *)&self->_timingFunction, 0);
  objc_storeStrong((id *)&self->_labelAlphaDrivingProgressAnimatableProperty, 0);
}

- (void)initWithFolderController:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_debug_impl(&dword_1D0540000, a2, OS_LOG_TYPE_DEBUG, "icon animator: %p init", (uint8_t *)&v2, 0xCu);
}

@end
