@implementation SBRecordingIndicatorViewController

- (void)setIndicatorColor:(id)a3
{
  UIColor **p_indicatorColor;
  void *v6;
  id v7;

  p_indicatorColor = &self->_indicatorColor;
  objc_storeStrong((id *)&self->_indicatorColor, a3);
  v7 = a3;
  -[SBRecordingIndicatorViewController indicatorView](self, "indicatorView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", *p_indicatorColor);

  -[CASecureIndicatorLayer setBackgroundColor:](self->_contentLayer, "setBackgroundColor:", -[UIColor cgColor](*p_indicatorColor, "cgColor"));
}

- (void)updateIndicatorType:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 IsCircular;
  double v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a3)
    objc_msgSend(MEMORY[0x1E0CEA478], "systemOrangeColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGreenColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBRecordingIndicatorViewController setIndicatorColor:](self, "setIndicatorColor:", v5);
  -[SBRecordingIndicatorViewController indicatorView](self, "indicatorView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIndicatorType:", a3);

  CAPrivacyIndicatorTypeForIndicatorType((id)a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogStatusBarish();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v7;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] updating secure indicator type for layer-dot to %@", (uint8_t *)&v11, 0xCu);
  }

  -[CASecureIndicatorLayer setPrivacyIndicatorType:](self->_contentLayer, "setPrivacyIndicatorType:", v7);
  IsCircular = SBRecordingIndicatorTypeIsCircular(a3);
  v10 = 0.0;
  if (IsCircular)
    v10 = self->_size * 0.5;
  -[CASecureIndicatorLayer setCornerRadius:](self->_contentLayer, "setCornerRadius:", v10);

}

- (SBRecordingIndicatorView)indicatorView
{
  return self->_indicatorView;
}

- (unint64_t)indicatorState
{
  return self->_indicatorState;
}

- (void)updateIndicatorVisibility:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const __CFString *v6;
  unint64_t v7;
  __CFString *v8;
  __CFString *v9;
  id v10;
  uint64_t v11;
  UIViewPropertyAnimator *v12;
  UIViewPropertyAnimator *animatorScaleToOverscale;
  UIViewPropertyAnimator *v14;
  UIViewPropertyAnimator *animatorScaleToNormal;
  UIViewPropertyAnimator *v16;
  UIViewPropertyAnimator *animatorScaleToRest;
  UIViewPropertyAnimator *v18;
  UIViewPropertyAnimator *v19;
  UIViewPropertyAnimator *v20;
  double size;
  double v22;
  id v23;
  uint64_t v24;
  UIViewPropertyAnimator *v25;
  UIViewPropertyAnimator *animatorScaleToZero;
  UIViewPropertyAnimator *v27;
  _QWORD v28[4];
  id v29;
  char v30;
  _QWORD v31[5];
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[5];
  _QWORD v39[5];
  _QWORD v40[5];
  uint8_t buf[4];
  const __CFString *v42;
  __int16 v43;
  __CFString *v44;
  uint64_t v45;

  v3 = a3;
  v45 = *MEMORY[0x1E0C80C00];
  -[SBRecordingIndicatorViewController _updateLiveRenderingAssertionIfNeededForIndicatorVisible:]((uint64_t)self, a3);
  if (-[SBRecordingIndicatorViewController _usesSpringAnimations]((id *)&self->super.super.super.isa))
  {
    -[SBRecordingIndicatorViewController _updateIndicatorVisibilityWithSpringAnimation:]((id *)&self->super.super.super.isa, v3);
  }
  else if (-[SBRecordingIndicatorViewController _screenTypeForcesFastFadeAnimations]((uint64_t)self))
  {
    -[SBRecordingIndicatorViewController updateIndicatorVisibilityWithFastFadeAnimation:](self, "updateIndicatorVisibilityWithFastFadeAnimation:", v3);
  }
  else
  {
    SBLogStatusBarish();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (v3)
        v6 = CFSTR("on");
      else
        v6 = CFSTR("off");
      v7 = -[SBRecordingIndicatorViewController location](self, "location");
      v8 = CFSTR("Standalone");
      if (v7 == 1)
        v8 = CFSTR("StatusBar");
      if (v7 == 2)
        v8 = CFSTR("SystemAperture");
      v9 = v8;
      *(_DWORD *)buf = 138543618;
      v42 = v6;
      v43 = 2114;
      v44 = v9;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] Turning %{public}@ at %{public}@ location (normal animation)", buf, 0x16u);

    }
    -[SBRecordingIndicatorViewController _stopAllAnimations]((uint64_t)self);
    if (v3)
    {
      objc_initWeak((id *)buf, self);
      v10 = objc_alloc(MEMORY[0x1E0CEABC8]);
      v11 = MEMORY[0x1E0C809B0];
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __64__SBRecordingIndicatorViewController_updateIndicatorVisibility___block_invoke;
      v40[3] = &unk_1E8E9DED8;
      v40[4] = self;
      v12 = (UIViewPropertyAnimator *)objc_msgSend(v10, "initWithDuration:curve:animations:", 0, v40, 0.7);
      animatorScaleToOverscale = self->_animatorScaleToOverscale;
      self->_animatorScaleToOverscale = v12;

      v39[0] = v11;
      v39[1] = 3221225472;
      v39[2] = __64__SBRecordingIndicatorViewController_updateIndicatorVisibility___block_invoke_2;
      v39[3] = &unk_1E8E9DED8;
      v39[4] = self;
      v14 = (UIViewPropertyAnimator *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABC8]), "initWithDuration:curve:animations:", 0, v39, 0.7);
      animatorScaleToNormal = self->_animatorScaleToNormal;
      self->_animatorScaleToNormal = v14;

      v38[0] = v11;
      v38[1] = 3221225472;
      v38[2] = __64__SBRecordingIndicatorViewController_updateIndicatorVisibility___block_invoke_3;
      v38[3] = &unk_1E8E9DED8;
      v38[4] = self;
      v16 = (UIViewPropertyAnimator *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABC8]), "initWithDuration:curve:animations:", 0, v38, 2.0);
      animatorScaleToRest = self->_animatorScaleToRest;
      self->_animatorScaleToRest = v16;

      v18 = self->_animatorScaleToOverscale;
      v36[0] = v11;
      v36[1] = 3221225472;
      v36[2] = __64__SBRecordingIndicatorViewController_updateIndicatorVisibility___block_invoke_4;
      v36[3] = &unk_1E8EB5528;
      objc_copyWeak(&v37, (id *)buf);
      -[UIViewPropertyAnimator addCompletion:](v18, "addCompletion:", v36);
      v19 = self->_animatorScaleToNormal;
      v34[0] = v11;
      v34[1] = 3221225472;
      v34[2] = __64__SBRecordingIndicatorViewController_updateIndicatorVisibility___block_invoke_5;
      v34[3] = &unk_1E8EB5528;
      objc_copyWeak(&v35, (id *)buf);
      -[UIViewPropertyAnimator addCompletion:](v19, "addCompletion:", v34);
      v20 = self->_animatorScaleToRest;
      v32[0] = v11;
      v32[1] = 3221225472;
      v32[2] = __64__SBRecordingIndicatorViewController_updateIndicatorVisibility___block_invoke_6;
      v32[3] = &unk_1E8EB5528;
      objc_copyWeak(&v33, (id *)buf);
      -[UIViewPropertyAnimator addCompletion:](v20, "addCompletion:", v32);
      -[SBRecordingIndicatorViewController setIndicatorState:](self, 1);
      -[UIViewPropertyAnimator startAnimation](self->_animatorScaleToOverscale, "startAnimation");
      objc_destroyWeak(&v33);
      objc_destroyWeak(&v35);
      objc_destroyWeak(&v37);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      -[CASecureIndicatorLayer opacity](self->_contentLayer, "opacity");
      if ((BSFloatIsZero() & 1) == 0
        && !-[SBRecordingIndicatorViewController location](self, "location")
        && (-[SBRecordingIndicatorViewController _hasMedinaPadBehaviors]((id *)&self->super.super.super.isa) & 1) == 0)
      {
        -[SBRecordingIndicatorViewController _updateIndicatorLayerSize:opacity:]((uint64_t)self, 0.0, 0.0);
        if (-[SBRecordingIndicatorViewController _hasProminentIdleState]((id *)&self->super.super.super.isa))
          size = self->_size;
        else
          size = self->_size * 0.8;
        if (-[SBRecordingIndicatorViewController _hasProminentIdleState]((id *)&self->super.super.super.isa))
          v22 = 1.0;
        else
          v22 = 0.8;
        -[SBRecordingIndicatorViewController _updateIndicatorViewSize:alpha:]((double *)self, size, v22);
      }
      v23 = objc_alloc(MEMORY[0x1E0CEABC8]);
      v24 = MEMORY[0x1E0C809B0];
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __64__SBRecordingIndicatorViewController_updateIndicatorVisibility___block_invoke_7;
      v31[3] = &unk_1E8E9DED8;
      v31[4] = self;
      v25 = (UIViewPropertyAnimator *)objc_msgSend(v23, "initWithDuration:curve:animations:", 0, v31, 1.0);
      animatorScaleToZero = self->_animatorScaleToZero;
      self->_animatorScaleToZero = v25;

      objc_initWeak((id *)buf, self);
      v27 = self->_animatorScaleToZero;
      v28[0] = v24;
      v28[1] = 3221225472;
      v28[2] = __64__SBRecordingIndicatorViewController_updateIndicatorVisibility___block_invoke_8;
      v28[3] = &unk_1E8EB5550;
      objc_copyWeak(&v29, (id *)buf);
      v30 = 0;
      -[UIViewPropertyAnimator addCompletion:](v27, "addCompletion:", v28);
      -[SBRecordingIndicatorViewController setIndicatorState:](self, 3);
      -[UIViewPropertyAnimator startAnimation](self->_animatorScaleToZero, "startAnimation");
      objc_destroyWeak(&v29);
      objc_destroyWeak((id *)buf);
    }
  }
}

- (void)_updateIndicatorVisibilityWithSpringAnimation:(id *)a1
{
  NSObject *v4;
  const __CFString *v5;
  uint64_t v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  char v25;
  _QWORD v26[5];
  _QWORD v27[4];
  id v28;
  _QWORD v29[5];
  uint8_t buf[4];
  const __CFString *v31;
  __int16 v32;
  __CFString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    SBLogStatusBarish();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if (a2)
        v5 = CFSTR("on");
      else
        v5 = CFSTR("off");
      v6 = objc_msgSend(a1, "location");
      v7 = CFSTR("Standalone");
      if (v6 == 1)
        v7 = CFSTR("StatusBar");
      if (v6 == 2)
        v7 = CFSTR("SystemAperture");
      v8 = v7;
      *(_DWORD *)buf = 138543618;
      v31 = v5;
      v32 = 2114;
      v33 = v8;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] Turning %{public}@ at %{public}@ location (spring animation)", buf, 0x16u);

    }
    -[SBRecordingIndicatorViewController _stopAllAnimations]((uint64_t)a1);
    objc_initWeak((id *)buf, a1);
    objc_msgSend(a1, "indicatorView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[SBRecordingIndicatorViewController _hasMedinaPadBehaviors](a1);
    if (a2)
    {
      if ((v11 & 1) == 0)
      {
        -[SBRecordingIndicatorViewController _addBlurFilterToLayer:withBlurRadius:]((uint64_t)a1, v10, 6.0);
        -[SBRecordingIndicatorViewController _animateLayer:forKeyPath:fromValue:toValue:persistingToValue:duration:]((uint64_t)a1, v10, CFSTR("filters.gaussianBlur.inputRadius"), &unk_1E91CF7E8, &unk_1E91CF7F8, 1, 0.8);
      }
      v12 = objc_alloc(MEMORY[0x1E0CEABC8]);
      v13 = MEMORY[0x1E0C809B0];
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __84__SBRecordingIndicatorViewController__updateIndicatorVisibilityWithSpringAnimation___block_invoke;
      v29[3] = &unk_1E8E9DED8;
      v29[4] = a1;
      v14 = objc_msgSend(v12, "initWithDuration:dampingRatio:animations:", v29, 1.9, 0.35);
      v15 = a1[126];
      a1[126] = (id)v14;

      v16 = a1[126];
      v27[0] = v13;
      v27[1] = 3221225472;
      v27[2] = __84__SBRecordingIndicatorViewController__updateIndicatorVisibilityWithSpringAnimation___block_invoke_2;
      v27[3] = &unk_1E8EB5528;
      v17 = &v28;
      objc_copyWeak(&v28, (id *)buf);
      objc_msgSend(v16, "addCompletion:", v27);
      -[SBRecordingIndicatorViewController setIndicatorState:](a1, 1);
      objc_msgSend(a1[126], "startAnimation");
    }
    else
    {
      if ((v11 & 1) == 0)
      {
        -[SBRecordingIndicatorViewController _addBlurFilterToLayer:withBlurRadius:]((uint64_t)a1, v10, 0.0);
        -[SBRecordingIndicatorViewController _animateLayer:forKeyPath:fromValue:toValue:persistingToValue:duration:]((uint64_t)a1, v10, CFSTR("filters.gaussianBlur.inputRadius"), &unk_1E91CF808, &unk_1E91CF818, 0, 1.0);
      }
      v18 = objc_alloc(MEMORY[0x1E0CEABC8]);
      v19 = MEMORY[0x1E0C809B0];
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __84__SBRecordingIndicatorViewController__updateIndicatorVisibilityWithSpringAnimation___block_invoke_28;
      v26[3] = &unk_1E8E9DED8;
      v26[4] = a1;
      v20 = objc_msgSend(v18, "initWithDuration:dampingRatio:animations:", v26, 1.5, 1.02);
      v21 = a1[127];
      a1[127] = (id)v20;

      v22 = a1[127];
      v23[0] = v19;
      v23[1] = 3221225472;
      v23[2] = __84__SBRecordingIndicatorViewController__updateIndicatorVisibilityWithSpringAnimation___block_invoke_2_29;
      v23[3] = &unk_1E8EB5550;
      v17 = &v24;
      objc_copyWeak(&v24, (id *)buf);
      v25 = 0;
      objc_msgSend(v22, "addCompletion:", v23);
      -[SBRecordingIndicatorViewController setIndicatorState:](a1, 3);
      objc_msgSend(a1[127], "startAnimation");
    }
    objc_destroyWeak(v17);

    objc_destroyWeak((id *)buf);
  }
}

- (void)setIndicatorState:(_QWORD *)a1
{
  id v4;

  if (a1)
  {
    if (a1[140] != a2)
    {
      a1[140] = a2;
      objc_msgSend(a1, "delegate");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "recordingIndicatorViewController:didUpdateIndicatorState:", a1, a2);

    }
  }
}

- (SBRecordingIndicatorViewControllerDelegate)delegate
{
  return (SBRecordingIndicatorViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)_updateIndicatorViewSize:(double)a3 alpha:
{
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;

  if (a1)
  {
    objc_msgSend(a1, "indicatorView");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setSize:", a2, a2);
    objc_msgSend(v16, "setAlpha:", a3);
    if (-[SBRecordingIndicatorViewController _screenTypeForcesFastFadeAnimations]((uint64_t)a1)
      && objc_msgSend(a1, "location") == 2)
    {
      objc_msgSend(a1, "indicatorContainerView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "center");
      v8 = v7;
      v10 = v9;
      objc_msgSend(v6, "superview");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "convertPoint:fromView:", v11, v8, v10);
      v13 = v12;
      v15 = v14;

      objc_msgSend(v16, "setCenter:", v13, v15);
    }
    else
    {
      objc_msgSend(v16, "setCenter:", a1[131], a1[132]);
    }

  }
}

- (id)_usesSpringAnimations
{
  id *v1;

  if (result)
  {
    v1 = result;
    return (id *)((-[SBRecordingIndicatorViewController _hasMedinaPadBehaviors](result) & 1) != 0
               || -[SBRecordingIndicatorViewController _screenTypeForcesFastFadeAnimations]((uint64_t)v1)
               && objc_msgSend(v1, "location") == 2);
  }
  return result;
}

- (unint64_t)location
{
  return self->_location;
}

- (UIView)indicatorContainerView
{
  return self->_indicatorContainerView;
}

- (uint64_t)_stopAllAnimations
{
  id *v1;

  if (result)
  {
    v1 = (id *)result;
    objc_msgSend(*(id *)(result + 968), "stopAnimation:", 1);
    objc_msgSend(v1[122], "stopAnimation:", 1);
    objc_msgSend(v1[123], "stopAnimation:", 1);
    objc_msgSend(v1[124], "stopAnimation:", 1);
    objc_msgSend(v1[125], "stopAnimation:", 1);
    objc_msgSend(v1[126], "stopAnimation:", 1);
    return objc_msgSend(v1[127], "stopAnimation:", 1);
  }
  return result;
}

- (void)_animateLayer:(void *)a3 forKeyPath:(void *)a4 fromValue:(void *)a5 toValue:(int)a6 persistingToValue:(double)a7 duration:
{
  id v13;
  id v14;
  void *v15;
  id v16;

  v16 = a2;
  v13 = a3;
  v14 = a5;
  if (a1)
  {
    -[SBRecordingIndicatorViewController _springAnimationForKeyPath:fromValue:toValue:duration:](a1, (uint64_t)v13, a4, v14, a7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addAnimation:forKey:", v15, v13);
    if (a6)
      objc_msgSend(v16, "setValue:forKeyPath:", v14, v13);

  }
}

- (id)_springAnimationForKeyPath:(void *)a3 fromValue:(void *)a4 toValue:(double)a5 duration:
{
  void *v8;
  id v9;
  id v10;
  void *v11;

  if (a1)
  {
    v8 = (void *)MEMORY[0x1E0CD2848];
    v9 = a4;
    v10 = a3;
    objc_msgSend(v8, "animationWithKeyPath:", a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBeginTime:", CACurrentMediaTime());
    objc_msgSend(v11, "setFillMode:", *MEMORY[0x1E0CD2B50]);
    objc_msgSend(v11, "setFromValue:", v10);

    objc_msgSend(v11, "setToValue:", v9);
    objc_msgSend(v11, "setMass:", 2.0);
    objc_msgSend(v11, "setStiffness:", 300.0);
    objc_msgSend(v11, "setDamping:", 50.0);
    objc_msgSend(v11, "setDuration:", a5);
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (void)_addBlurFilterToLayer:(double)a3 withBlurRadius:
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = (void *)MEMORY[0x1E0CD2780];
    v5 = *MEMORY[0x1E0CD2C88];
    v6 = a2;
    objc_msgSend(v4, "filterWithType:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setName:", CFSTR("gaussianBlur"));
    objc_msgSend(v7, "setValue:forKey:", CFSTR("high"), CFSTR("inputQuality"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setValue:forKey:", v8, CFSTR("inputRadius"));

    v10[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFilters:", v9);

  }
}

void __84__SBRecordingIndicatorViewController__updateIndicatorVisibilityWithSpringAnimation___block_invoke(uint64_t a1)
{
  -[SBRecordingIndicatorViewController _updateIndicatorViewSize:alpha:](*(double **)(a1 + 32), *(double *)(*(_QWORD *)(a1 + 32) + 1024), 1.0);
}

- (id)initForLocation:(unint64_t)a3 windowScene:(id)a4
{
  id v6;
  SBRecordingIndicatorViewController *v7;
  uint64_t v8;
  void *v9;
  SBRecordingIndicatorView *v10;
  id v11;
  void *v12;
  id v13;
  objc_super v15;

  v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SBRecordingIndicatorViewController;
  v7 = -[SBRecordingIndicatorViewController init](&v15, sel_init);
  v8 = (uint64_t)v7;
  if (v7)
  {
    v7->_location = a3;
    v7->_activeInterfaceOrientation = 1;
    v7->_indicatorState = 0;
    objc_storeWeak((id *)&v7->_windowScene, v6);
    objc_msgSend((id)v8, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(SBRecordingIndicatorView);
    -[SBRecordingIndicatorView setAutoresizingMask:](v10, "setAutoresizingMask:", 0);
    objc_storeStrong((id *)(v8 + 1104), v10);
    if (-[SBRecordingIndicatorViewController _screenTypeForcesFastFadeAnimations](v8)
      && objc_msgSend((id)v8, "location") == 2)
    {
      v11 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
      v12 = *(void **)(v8 + 1096);
      *(_QWORD *)(v8 + 1096) = v11;
      v13 = v11;

      objc_msgSend(v9, "addSubview:", v13);
      objc_msgSend(v13, "addSubview:", v10);

    }
    else
    {
      objc_msgSend(v9, "addSubview:", v10);
    }
    if (!objc_msgSend((id)v8, "location")
      && (-[SBRecordingIndicatorViewController _hasMedinaPadBehaviors]((id *)v8) & 1) == 0)
    {
      -[SBRecordingIndicatorViewController _configureRootLayer](v8);
    }
    -[SBRecordingIndicatorViewController calculateInitialIndicatorPositionAndSize](v8);

  }
  return (id)v8;
}

- (BOOL)_usesSpringAnimationsWithContainerView
{
  void *v1;

  if (result)
  {
    v1 = (void *)result;
    return -[SBRecordingIndicatorViewController _screenTypeForcesFastFadeAnimations](result)
        && objc_msgSend(v1, "location") == 2;
  }
  return result;
}

- (id)_interchangesViewAndLayer
{
  id *v1;

  if (result)
  {
    v1 = result;
    if (objc_msgSend(result, "location"))
      return 0;
    else
      return (id *)(-[SBRecordingIndicatorViewController _hasMedinaPadBehaviors](v1) ^ 1);
  }
  return result;
}

- (uint64_t)_configureRootLayer
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  double v14;
  uint64_t v15;
  id v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  float v26;
  char v27;
  float v28;
  id v29;
  double MidY;
  id v31;
  uint64_t v32;
  id v33;
  CGAffineTransform v34;
  CGAffineTransform v35;
  CGAffineTransform v36;
  _QWORD v37[3];
  _QWORD v38[5];
  CGRect v39;
  CGRect v40;

  v38[3] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = (id *)result;
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    WeakRetained = objc_loadWeakRetained(v1 + 144);
    objc_msgSend(WeakRetained, "screen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_display");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scale");
    v6 = v5;
    v7 = objc_msgSend(WeakRetained, "isExternalDisplayWindowScene");
    v8 = *MEMORY[0x1E0C9AE50];
    v9 = *MEMORY[0x1E0CD2A50];
    v37[0] = *MEMORY[0x1E0CD2A28];
    v37[1] = v9;
    v38[0] = v8;
    v38[1] = v8;
    v37[2] = *MEMORY[0x1E0CD2A18];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v4, "displayId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v38[2] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD2720], "remoteContextWithOptions:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v1[133];
    v1[133] = (id)v12;

    LODWORD(v14) = 1148846080;
    objc_msgSend(v1[133], "setLevel:", v14);
    objc_msgSend(v1[133], "setSecure:", 1);
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v1[134];
    v1[134] = (id)v15;

    v17 = v1[134];
    CGAffineTransformMakeScale(&v36, v6, v6);
    objc_msgSend(v17, "setAffineTransform:", &v36);
    if (v7)
    {
      objc_msgSend(v3, "nativeBounds");
    }
    else
    {
      GSMainScreenPixelSize();
      BSRectWithSize();
    }
    v22 = v18;
    v23 = v19;
    v24 = v20;
    v25 = v21;
    objc_msgSend(v1[134], "setFrame:");
    GSMainScreenOrientation();
    if (v26 == 0.0)
      v27 = 1;
    else
      v27 = v7;
    if ((v27 & 1) == 0)
    {
      v28 = v26;
      v29 = v1[134];
      v39.origin.x = v22;
      v39.origin.y = v23;
      v39.size.width = v24;
      v39.size.height = v25;
      MidY = CGRectGetMidY(v39);
      v40.origin.x = v22;
      v40.origin.y = v23;
      v40.size.width = v24;
      v40.size.height = v25;
      objc_msgSend(v29, "setPosition:", MidY, CGRectGetMidX(v40));
      v31 = v1[134];
      if (v31)
        objc_msgSend(v31, "affineTransform");
      else
        memset(&v34, 0, sizeof(v34));
      CGAffineTransformRotate(&v35, &v34, (float)-v28);
      objc_msgSend(v31, "setAffineTransform:", &v35);
    }
    objc_msgSend(MEMORY[0x1E0CD2838], "layer", *(_OWORD *)&v34.a, *(_OWORD *)&v34.c, *(_OWORD *)&v34.tx);
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = v1[135];
    v1[135] = (id)v32;

    objc_msgSend(v1[135], "setMasksToBounds:", 1);
    objc_msgSend(v1[134], "addSublayer:", v1[135]);
    objc_msgSend(v1[133], "setLayer:", v1[134]);

    return objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
  return result;
}

- (void)calculateInitialIndicatorPositionAndSize
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  SBHStringForScreenType();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "[Recording Indicator] no layout info for screen type: %@", (uint8_t *)&v4, 0xCu);

}

- (void)dealloc
{
  objc_super v3;

  -[BLSAssertion invalidate](self->_liveRenderingAssertion, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBRecordingIndicatorViewController;
  -[SBRecordingIndicatorViewController dealloc](&v3, sel_dealloc);
}

- (uint64_t)_screenTypeForcesFastFadeAnimations
{
  uint64_t v1;
  uint64_t v2;

  if (!a1)
    return 0;
  v1 = 1;
  v2 = SBFEffectiveArtworkSubtype();
  if (v2 > 2795)
  {
    if (v2 != 2796 && v2 != 2868)
      return 0;
  }
  else if (v2 != 2556 && v2 != 2622)
  {
    return 0;
  }
  return v1;
}

- (id)_hasMedinaPadBehaviors
{
  id *v1;
  void *v2;
  uint64_t v3;
  id WeakRetained;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "userInterfaceIdiom");

    if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1
      && +[SBRecordingIndicatorManager _supportsSecureIndicator](SBRecordingIndicatorManager, "_supportsSecureIndicator"))
    {
      WeakRetained = objc_loadWeakRetained(v1 + 144);
      if (objc_msgSend(WeakRetained, "isMainDisplayWindowScene"))
        v1 = (id *)(objc_msgSend(v1, "location") == 0);
      else
        v1 = 0;

    }
    else
    {
      return 0;
    }
  }
  return v1;
}

- (double)_alphaForStateIdleOn
{
  int hasProminentIdle;
  double result;

  if (!a1)
    return 0.0;
  hasProminentIdle = -[SBRecordingIndicatorViewController _hasProminentIdleState](a1);
  result = 0.8;
  if (hasProminentIdle)
    return 1.0;
  return result;
}

- (uint64_t)_hasProminentIdleState
{
  uint64_t v2;
  uint64_t v3;
  id WeakRetained;

  if (!a1)
    return 0;
  v2 = 1;
  v3 = SBFEffectiveArtworkSubtype();
  if (v3 > 2795)
  {
    if (v3 == 2796 || v3 == 2868)
      return v2;
  }
  else if (v3 == 2556 || v3 == 2622)
  {
    return v2;
  }
  if ((-[SBRecordingIndicatorViewController _hasMedinaPadBehaviors](a1) & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 144);
    v2 = objc_msgSend(WeakRetained, "isExternalDisplayWindowScene");

  }
  return v2;
}

- (double)_sizeForStateIdleOn
{
  int hasProminentIdle;
  double result;

  if (!a1)
    return 0.0;
  hasProminentIdle = -[SBRecordingIndicatorViewController _hasProminentIdleState]((id *)a1);
  result = *(double *)(a1 + 1024);
  if (!hasProminentIdle)
    return result * 0.8;
  return result;
}

- (uint64_t)_ignoresActiveInterfaceOrientation
{
  id WeakRetained;
  uint64_t v2;

  if (result)
  {
    WeakRetained = objc_loadWeakRetained((id *)(result + 1152));
    v2 = objc_msgSend(WeakRetained, "isExternalDisplayWindowScene");

    return v2;
  }
  return result;
}

- (BOOL)_secureRenderingSupported
{
  if (result)
    return +[SBRecordingIndicatorManager _supportsSecureIndicator](SBRecordingIndicatorManager, "_supportsSecureIndicator");
  return result;
}

- (void)_updateLiveRenderingAssertionIfNeededForIndicatorVisible:(uint64_t)a1
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[2];
  uint8_t buf[4];
  _BOOL4 v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (a1 && ((a2 & 1) != 0 || !*(_QWORD *)(a1 + 1120)))
  {
    v4 = +[SBRecordingIndicatorManager _supportsSecureIndicator](SBRecordingIndicatorManager, "_supportsSecureIndicator");
    objc_msgSend((id)a1, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "windowScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      v8 = a2;
    else
      v8 = 0;
    if (v4)
      v9 = v8;
    else
      v9 = 0;
    SBLogStatusBarish();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      v21 = v4;
      v22 = 1024;
      v23 = a2;
      v24 = 2112;
      v25 = v7;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] updating live rendering assertion... hasSecureIndicator: %{BOOL}u, indicatorVisible: %{BOOL}u, windowScene: %@", buf, 0x18u);
    }

    objc_msgSend(*(id *)(a1 + 1088), "invalidate");
    if (v9)
    {
      v11 = (void *)MEMORY[0x1E0D00F48];
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D00FB0], "requestLiveUpdatingForScene:", v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D00FB8], "requestUnrestrictedFramerateForScene:", v7, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19[1] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "acquireWithExplanation:observer:attributes:", v13, 0, v16);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(void **)(a1 + 1088);
      *(_QWORD *)(a1 + 1088) = v17;

    }
    else
    {
      v13 = *(void **)(a1 + 1088);
      *(_QWORD *)(a1 + 1088) = 0;
    }

  }
}

- (uint64_t)_isOnExtendedDesktop
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id WeakRetained;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "userInterfaceIdiom");

    if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      WeakRetained = objc_loadWeakRetained((id *)(v1 + 1152));
      v1 = objc_msgSend(WeakRetained, "isMainDisplayWindowScene") ^ 1;

    }
    else
    {
      return 0;
    }
  }
  return v1;
}

- (void)setActiveInterfaceOrientation:(int64_t)a3 withDuration:(double)a4
{
  -[SBRecordingIndicatorViewController _updateToOrientation:withDuration:]((uint64_t)self, a3, a4);
}

- (void)_updateToOrientation:(double)a3 withDuration:
{
  unsigned int v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t);
  void *v28;
  id v29;
  id v30[2];
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  id location;

  if (a1 && *(_QWORD *)(a1 + 1128) != a2)
  {
    *(_QWORD *)(a1 + 1128) = a2;
    v6 = -[SBRecordingIndicatorViewController _hasMedinaPadBehaviors]((id *)a1);
    if (a3 > 0.0 && v6)
    {
      +[SBRecordingIndicatorDomain rootSettings](SBRecordingIndicatorDomain, "rootSettings");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (BSFloatGreaterThanOrEqualToFloat())
      {
        objc_msgSend(v7, "delayBeforeFadeOut180");
        v9 = v8;
        objc_msgSend(v7, "fadeOutDuration180");
        v11 = v10;
        objc_msgSend(v7, "delayBeforeFadeIn180");
        v13 = v12;
        objc_msgSend(v7, "fadeInDuration180");
      }
      else
      {
        objc_msgSend(v7, "delayBeforeFadeOut90");
        v9 = v15;
        objc_msgSend(v7, "fadeOutDuration90");
        v11 = v16;
        objc_msgSend(v7, "delayBeforeFadeIn90");
        v13 = v17;
        objc_msgSend(v7, "fadeInDuration90");
      }
      v18 = v14;
      objc_initWeak(&location, (id)a1);
      v19 = objc_alloc(MEMORY[0x1E0CEABC8]);
      v20 = MEMORY[0x1E0C809B0];
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __72__SBRecordingIndicatorViewController__updateToOrientation_withDuration___block_invoke;
      v33[3] = &unk_1E8E9DF28;
      objc_copyWeak(&v34, &location);
      v21 = (void *)objc_msgSend(v19, "initWithDuration:curve:animations:", 0, v33, v11);
      v22 = objc_alloc(MEMORY[0x1E0CEABC8]);
      v31[0] = v20;
      v31[1] = 3221225472;
      v31[2] = __72__SBRecordingIndicatorViewController__updateToOrientation_withDuration___block_invoke_2;
      v31[3] = &unk_1E8E9DF28;
      objc_copyWeak(&v32, &location);
      v23 = (void *)objc_msgSend(v22, "initWithDuration:curve:animations:", 0, v31, v18);
      v25 = v20;
      v26 = 3221225472;
      v27 = __72__SBRecordingIndicatorViewController__updateToOrientation_withDuration___block_invoke_3;
      v28 = &unk_1E8EB5500;
      objc_copyWeak(v30, &location);
      v24 = v23;
      v29 = v24;
      v30[1] = v13;
      objc_msgSend(v21, "addCompletion:", &v25);
      objc_msgSend(v21, "startAnimationAfterDelay:", v9, v25, v26, v27, v28);

      objc_destroyWeak(v30);
      objc_destroyWeak(&v32);

      objc_destroyWeak(&v34);
      objc_destroyWeak(&location);

    }
    else
    {
      -[SBRecordingIndicatorViewController _updateCenterWithoutAnimationForOrientation:](a1, a2);
    }
  }
}

- (uint64_t)_updateIndicatorLayerWithBounds:(double)a3 andCenter:(double)a4
{
  id *v13;
  void *v14;
  _BOOL4 IsCircular;
  double v16;

  if (result)
  {
    v13 = (id *)result;
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    objc_msgSend(v13, "indicatorView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    IsCircular = SBRecordingIndicatorTypeIsCircular(objc_msgSend(v14, "indicatorType"));

    v16 = a4 * 0.5;
    if (!IsCircular)
      v16 = 0.0;
    objc_msgSend(v13[135], "setCornerRadius:", v16);
    objc_msgSend(v13[135], "setBounds:", a2, a3, a4, a5);
    objc_msgSend(v13[135], "setPosition:", a6, a7);
    return objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
  return result;
}

- (uint64_t)_updateIndicatorLayerSize:(double)a3 opacity:
{
  uint64_t v5;
  void *v6;
  _BOOL4 IsCircular;
  double v8;
  double v9;

  if (result)
  {
    v5 = result;
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    objc_msgSend((id)v5, "indicatorView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    IsCircular = SBRecordingIndicatorTypeIsCircular(objc_msgSend(v6, "indicatorType"));

    v8 = a2 * 0.5;
    if (!IsCircular)
      v8 = 0.0;
    objc_msgSend(*(id *)(v5 + 1080), "setCornerRadius:", v8);
    objc_msgSend(*(id *)(v5 + 1080), "frame");
    objc_msgSend(*(id *)(v5 + 1080), "setFrame:");
    objc_msgSend(*(id *)(v5 + 1080), "setPosition:", *(double *)(v5 + 1048), *(double *)(v5 + 1056));
    *(float *)&v9 = a3;
    objc_msgSend(*(id *)(v5 + 1080), "setOpacity:", v9);
    return objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
  return result;
}

void __72__SBRecordingIndicatorViewController__updateToOrientation_withDuration___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  double v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "view");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setAlpha:", 0.0);

    LODWORD(v3) = 0;
    objc_msgSend(v4[134], "setOpacity:", v3);
    WeakRetained = v4;
  }

}

void __72__SBRecordingIndicatorViewController__updateToOrientation_withDuration___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  double v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "view");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setAlpha:", 1.0);

    LODWORD(v3) = 1.0;
    objc_msgSend(v4[134], "setOpacity:", v3);
    WeakRetained = v4;
  }

}

void __72__SBRecordingIndicatorViewController__updateToOrientation_withDuration___block_invoke_3(uint64_t a1)
{
  uint64_t *WeakRetained;
  uint64_t *v3;

  WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    -[SBRecordingIndicatorViewController _updateCenterWithoutAnimationForOrientation:]((uint64_t)WeakRetained, WeakRetained[141]);
    objc_msgSend(*(id *)(a1 + 32), "startAnimationAfterDelay:", *(double *)(a1 + 48));
    WeakRetained = v3;
  }

}

- (uint64_t)_updateCenterWithoutAnimationForOrientation:(uint64_t)result
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  CGFloat MidX;
  CGFloat MidY;
  void *v18;
  CGRect v19;
  CGRect v20;

  if (result)
  {
    v3 = result;
    if (-[SBRecordingIndicatorViewController _ignoresActiveInterfaceOrientation](result))
      v4 = 1;
    else
      v4 = a2;
    objc_msgSend((id)v3, "_screen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_referenceBounds");
    v7 = v6;
    v9 = v8;

    switch(v4)
    {
      case 4:
        v13 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
        v11 = *(double *)(v3 + 1040);
        v10 = *(double *)(v3 + 1024);
        if (v13 == 1)
          v11 = v7 - v11 - v10;
        v15 = 1032;
        break;
      case 3:
        v12 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
        v11 = *(double *)(v3 + 1040);
        v10 = *(double *)(v3 + 1024);
        if (v12 != 1)
          v11 = v7 - v11 - v10;
        v14 = v9 - *(double *)(v3 + 1032) - v10;
        goto LABEL_24;
      case 2:
        if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
        {
          v10 = *(double *)(v3 + 1024);
          v11 = v7 - v10 - *(double *)(v3 + 1032);
        }
        else
        {
          v11 = *(double *)(v3 + 1032);
          v10 = *(double *)(v3 + 1024);
        }
        v14 = v9 - v10 - *(double *)(v3 + 1040);
        goto LABEL_24;
      default:
        if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
        {
          v11 = *(double *)(v3 + 1032);
          v10 = *(double *)(v3 + 1024);
        }
        else
        {
          v10 = *(double *)(v3 + 1024);
          v11 = v7 - v10 - *(double *)(v3 + 1032);
        }
        v15 = 1040;
        break;
    }
    v14 = *(double *)(v3 + v15);
LABEL_24:
    v19.origin.x = v11;
    v19.origin.y = v14;
    v19.size.width = v10;
    v19.size.height = v10;
    MidX = CGRectGetMidX(v19);
    v20.origin.x = v11;
    v20.origin.y = v14;
    v20.size.width = v10;
    v20.size.height = v10;
    MidY = CGRectGetMidY(v20);
    *(CGFloat *)(v3 + 1048) = MidX;
    *(CGFloat *)(v3 + 1056) = MidY;
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    objc_msgSend(*(id *)(v3 + 1080), "setPosition:", *(double *)(v3 + 1048), *(double *)(v3 + 1056));
    objc_msgSend((id)v3, "indicatorView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setCenter:", *(double *)(v3 + 1048), *(double *)(v3 + 1056));

    return objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
  return result;
}

void __64__SBRecordingIndicatorViewController_updateIndicatorVisibility___block_invoke(uint64_t a1)
{
  -[SBRecordingIndicatorViewController _updateIndicatorViewSize:alpha:](*(double **)(a1 + 32), *(double *)(*(_QWORD *)(a1 + 32) + 1024) * 1.2, 1.0);
}

void __64__SBRecordingIndicatorViewController_updateIndicatorVisibility___block_invoke_2(uint64_t a1)
{
  -[SBRecordingIndicatorViewController _updateIndicatorViewSize:alpha:](*(double **)(a1 + 32), *(double *)(*(_QWORD *)(a1 + 32) + 1024), 1.0);
}

void __64__SBRecordingIndicatorViewController_updateIndicatorVisibility___block_invoke_3(uint64_t a1)
{
  double *v1;
  double v2;
  double v4;
  id *v5;

  v1 = *(double **)(a1 + 32);
  v2 = 0.0;
  if (v1)
  {
    if (-[SBRecordingIndicatorViewController _hasProminentIdleState](*(id **)(a1 + 32)))
      v4 = v1[128];
    else
      v4 = v1[128] * 0.8;
    v5 = *(id **)(a1 + 32);
    if (v5)
    {
      if (-[SBRecordingIndicatorViewController _hasProminentIdleState](v5))
        v2 = 1.0;
      else
        v2 = 0.8;
    }
  }
  else
  {
    v4 = 0.0;
  }
  -[SBRecordingIndicatorViewController _updateIndicatorViewSize:alpha:](v1, v4, v2);
}

void __64__SBRecordingIndicatorViewController_updateIndicatorVisibility___block_invoke_4(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[122], "startAnimation");
    WeakRetained = v2;
  }

}

void __64__SBRecordingIndicatorViewController_updateIndicatorVisibility___block_invoke_5(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[123], "startAnimationAfterDelay:", 2.0);
    WeakRetained = v2;
  }

}

void __64__SBRecordingIndicatorViewController_updateIndicatorVisibility___block_invoke_6(uint64_t a1)
{
  double v1;
  double v2;
  void *v3;
  uint64_t v4;
  double v5;
  int hasProminentIdle;
  double v7;
  double *WeakRetained;

  WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (!objc_msgSend(WeakRetained, "location")
      && (-[SBRecordingIndicatorViewController _hasMedinaPadBehaviors]((id *)WeakRetained) & 1) == 0)
    {
      if (-[SBRecordingIndicatorViewController _hasProminentIdleState]((id *)WeakRetained))
        v1 = WeakRetained[128];
      else
        v1 = WeakRetained[128] * 0.8;
      if (-[SBRecordingIndicatorViewController _hasProminentIdleState]((id *)WeakRetained))
        v2 = 1.0;
      else
        v2 = 0.8;
      -[SBRecordingIndicatorViewController _updateIndicatorLayerSize:opacity:]((uint64_t)WeakRetained, v1, v2);
      objc_msgSend(WeakRetained, "traitCollection");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "_backlightLuminance");

      v5 = 0.0;
      if (v4 == 1)
      {
        if (-[SBRecordingIndicatorViewController _hasProminentIdleState]((id *)WeakRetained))
          v5 = 1.0;
        else
          v5 = 0.8;
      }
      hasProminentIdle = -[SBRecordingIndicatorViewController _hasProminentIdleState]((id *)WeakRetained);
      v7 = WeakRetained[128];
      if (!hasProminentIdle)
        v7 = v7 * 0.8;
      -[SBRecordingIndicatorViewController _updateIndicatorViewSize:alpha:](WeakRetained, v7, v5);
    }
    -[SBRecordingIndicatorViewController setIndicatorState:](WeakRetained, 2);
  }

}

- (BOOL)_shouldForceViewToShowForCurrentBacklightLuminance
{
  void *v1;
  _BOOL8 v2;

  if (!a1)
    return 0;
  objc_msgSend(a1, "traitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "_backlightLuminance") == 1;

  return v2;
}

void __64__SBRecordingIndicatorViewController_updateIndicatorVisibility___block_invoke_7(uint64_t a1)
{
  -[SBRecordingIndicatorViewController _updateIndicatorViewSize:alpha:](*(double **)(a1 + 32), 0.0, 0.0);
}

void __64__SBRecordingIndicatorViewController_updateIndicatorVisibility___block_invoke_8(uint64_t a1)
{
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[SBRecordingIndicatorViewController setIndicatorState:](WeakRetained, 0);
  -[SBRecordingIndicatorViewController _updateLiveRenderingAssertionIfNeededForIndicatorVisible:]((uint64_t)WeakRetained, *(unsigned __int8 *)(a1 + 40));

}

- (void)updateIndicatorVisibilityWithFastFadeAnimation:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  unint64_t v7;
  __CFString *v8;
  __CFString *v9;
  id v10;
  uint64_t v11;
  UIViewPropertyAnimator *v12;
  UIViewPropertyAnimator *animatorFastFade;
  UIViewPropertyAnimator *v14;
  double size;
  double v16;
  id v17;
  uint64_t v18;
  UIViewPropertyAnimator *v19;
  UIViewPropertyAnimator *v20;
  UIViewPropertyAnimator *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  char v27;
  _QWORD v28[5];
  _QWORD v29[5];
  id v30;
  _QWORD v31[5];
  uint8_t buf[4];
  const __CFString *v33;
  __int16 v34;
  __CFString *v35;
  uint64_t v36;

  v3 = a3;
  v36 = *MEMORY[0x1E0C80C00];
  SBLogStatusBarish();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (v3)
      v6 = CFSTR("on");
    else
      v6 = CFSTR("off");
    v7 = -[SBRecordingIndicatorViewController location](self, "location");
    v8 = CFSTR("Standalone");
    if (v7 == 1)
      v8 = CFSTR("StatusBar");
    if (v7 == 2)
      v8 = CFSTR("SystemAperture");
    v9 = v8;
    *(_DWORD *)buf = 138543618;
    v33 = v6;
    v34 = 2114;
    v35 = v9;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] Turning %{public}@ at %{public}@ location (fast fade animation)", buf, 0x16u);

  }
  -[SBRecordingIndicatorViewController _stopAllAnimations]((uint64_t)self);
  if (v3)
  {
    v10 = objc_alloc(MEMORY[0x1E0CEABC8]);
    v11 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __85__SBRecordingIndicatorViewController_updateIndicatorVisibilityWithFastFadeAnimation___block_invoke;
    v31[3] = &unk_1E8E9DED8;
    v31[4] = self;
    v12 = (UIViewPropertyAnimator *)objc_msgSend(v10, "initWithDuration:curve:animations:", 0, v31, 0.2);
    animatorFastFade = self->_animatorFastFade;
    self->_animatorFastFade = v12;

    objc_initWeak((id *)buf, self);
    v14 = self->_animatorFastFade;
    v29[0] = v11;
    v29[1] = 3221225472;
    v29[2] = __85__SBRecordingIndicatorViewController_updateIndicatorVisibilityWithFastFadeAnimation___block_invoke_2;
    v29[3] = &unk_1E8EB5578;
    objc_copyWeak(&v30, (id *)buf);
    v29[4] = self;
    -[UIViewPropertyAnimator addCompletion:](v14, "addCompletion:", v29);
    -[SBRecordingIndicatorViewController setIndicatorState:](self, 1);
    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (self
      && !-[SBRecordingIndicatorViewController location](self, "location")
      && (-[SBRecordingIndicatorViewController _hasMedinaPadBehaviors]((id *)&self->super.super.super.isa) & 1) == 0)
    {
      -[SBRecordingIndicatorViewController _updateIndicatorLayerSize:opacity:]((uint64_t)self, 0.0, 0.0);
      if (-[SBRecordingIndicatorViewController _hasProminentIdleState]((id *)&self->super.super.super.isa))
        size = self->_size;
      else
        size = self->_size * 0.8;
      if (-[SBRecordingIndicatorViewController _hasProminentIdleState]((id *)&self->super.super.super.isa))
        v16 = 1.0;
      else
        v16 = 0.8;
      -[SBRecordingIndicatorViewController _updateIndicatorViewSize:alpha:]((double *)self, size, v16);
    }
    v17 = objc_alloc(MEMORY[0x1E0CEABC8]);
    v18 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __85__SBRecordingIndicatorViewController_updateIndicatorVisibilityWithFastFadeAnimation___block_invoke_3;
    v28[3] = &unk_1E8E9DED8;
    v28[4] = self;
    v19 = (UIViewPropertyAnimator *)objc_msgSend(v17, "initWithDuration:curve:animations:", 0, v28, 0.2);
    v20 = self->_animatorFastFade;
    self->_animatorFastFade = v19;

    objc_initWeak((id *)buf, self);
    v21 = self->_animatorFastFade;
    v22 = v18;
    v23 = 3221225472;
    v24 = __85__SBRecordingIndicatorViewController_updateIndicatorVisibilityWithFastFadeAnimation___block_invoke_4;
    v25 = &unk_1E8EB5550;
    objc_copyWeak(&v26, (id *)buf);
    v27 = 0;
    -[UIViewPropertyAnimator addCompletion:](v21, "addCompletion:", &v22);
    -[SBRecordingIndicatorViewController setIndicatorState:](self, 3);
    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
  }
  -[UIViewPropertyAnimator startAnimation](self->_animatorFastFade, "startAnimation", v22, v23, v24, v25);
}

void __85__SBRecordingIndicatorViewController_updateIndicatorVisibilityWithFastFadeAnimation___block_invoke(uint64_t a1)
{
  double *v1;
  double v2;
  double v4;
  id *v5;

  v1 = *(double **)(a1 + 32);
  v2 = 0.0;
  if (v1)
  {
    if (-[SBRecordingIndicatorViewController _hasProminentIdleState](*(id **)(a1 + 32)))
      v4 = v1[128];
    else
      v4 = v1[128] * 0.8;
    v5 = *(id **)(a1 + 32);
    if (v5)
    {
      if (-[SBRecordingIndicatorViewController _hasProminentIdleState](v5))
        v2 = 1.0;
      else
        v2 = 0.8;
    }
  }
  else
  {
    v4 = 0.0;
  }
  -[SBRecordingIndicatorViewController _updateIndicatorViewSize:alpha:](v1, v4, v2);
}

void __85__SBRecordingIndicatorViewController_updateIndicatorVisibilityWithFastFadeAnimation___block_invoke_2(uint64_t a1)
{
  double *WeakRetained;
  double v3;
  double v4;
  void *v5;
  uint64_t v6;
  double v7;
  id *v8;
  int hasProminentIdle;
  double v10;
  double *v11;

  WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v11 = WeakRetained;
    if (!objc_msgSend(WeakRetained, "location")
      && (-[SBRecordingIndicatorViewController _hasMedinaPadBehaviors]((id *)v11) & 1) == 0)
    {
      if (-[SBRecordingIndicatorViewController _hasProminentIdleState]((id *)v11))
        v3 = v11[128];
      else
        v3 = v11[128] * 0.8;
      if (-[SBRecordingIndicatorViewController _hasProminentIdleState]((id *)v11))
        v4 = 1.0;
      else
        v4 = 0.8;
      -[SBRecordingIndicatorViewController _updateIndicatorLayerSize:opacity:]((uint64_t)v11, v3, v4);
      objc_msgSend(v11, "traitCollection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "_backlightLuminance");

      v7 = 0.0;
      if (v6 == 1)
      {
        v8 = *(id **)(a1 + 32);
        if (v8)
        {
          if (-[SBRecordingIndicatorViewController _hasProminentIdleState](v8))
            v7 = 1.0;
          else
            v7 = 0.8;
        }
      }
      hasProminentIdle = -[SBRecordingIndicatorViewController _hasProminentIdleState]((id *)v11);
      v10 = v11[128];
      if (!hasProminentIdle)
        v10 = v10 * 0.8;
      -[SBRecordingIndicatorViewController _updateIndicatorViewSize:alpha:](v11, v10, v7);
    }
    -[SBRecordingIndicatorViewController setIndicatorState:](v11, 2);
    WeakRetained = v11;
  }

}

void __85__SBRecordingIndicatorViewController_updateIndicatorVisibilityWithFastFadeAnimation___block_invoke_3(uint64_t a1)
{
  -[SBRecordingIndicatorViewController _updateIndicatorViewSize:alpha:](*(double **)(a1 + 32), 0.0, 0.0);
}

void __85__SBRecordingIndicatorViewController_updateIndicatorVisibilityWithFastFadeAnimation___block_invoke_4(uint64_t a1)
{
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[SBRecordingIndicatorViewController setIndicatorState:](WeakRetained, 0);
  -[SBRecordingIndicatorViewController _updateLiveRenderingAssertionIfNeededForIndicatorVisible:]((uint64_t)WeakRetained, *(unsigned __int8 *)(a1 + 40));

}

void __84__SBRecordingIndicatorViewController__updateIndicatorVisibilityWithSpringAnimation___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "indicatorState") == 1)
    -[SBRecordingIndicatorViewController setIndicatorState:](WeakRetained, 2);

}

void __84__SBRecordingIndicatorViewController__updateIndicatorVisibilityWithSpringAnimation___block_invoke_28(uint64_t a1)
{
  -[SBRecordingIndicatorViewController _updateIndicatorViewSize:alpha:](*(double **)(a1 + 32), *(double *)(*(_QWORD *)(a1 + 32) + 1024) * 0.5, 0.0);
}

void __84__SBRecordingIndicatorViewController__updateIndicatorVisibilityWithSpringAnimation___block_invoke_2_29(uint64_t a1)
{
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "indicatorState") == 3)
  {
    -[SBRecordingIndicatorViewController setIndicatorState:](WeakRetained, 0);
    -[SBRecordingIndicatorViewController _updateLiveRenderingAssertionIfNeededForIndicatorVisible:]((uint64_t)WeakRetained, *(unsigned __int8 *)(a1 + 40));
  }

}

- (void)_updateIndicatorForBacklightLuminance:(uint64_t)a3 previousBacklightLuminance:
{
  double v6;
  int hasProminentIdle;
  id v8;

  if (a1
    && (-[SBRecordingIndicatorViewController _isSuppressingFlipbookRendering]((uint64_t)a1) & 1) == 0
    && objc_msgSend(a1, "indicatorState") == 2
    && !objc_msgSend(a1, "location")
    && (-[SBRecordingIndicatorViewController _hasMedinaPadBehaviors]((id *)a1) & 1) == 0
    && (a2 == 1 || a3 == 1))
  {
    objc_msgSend(a1, "indicatorView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v6 = 0.0;
    if (a2 == 1)
    {
      hasProminentIdle = -[SBRecordingIndicatorViewController _hasProminentIdleState]((id *)a1);
      v6 = 0.8;
      if (hasProminentIdle)
        v6 = 1.0;
    }
    objc_msgSend(v8, "setAlpha:", v6);

  }
}

- (uint64_t)_isSuppressingFlipbookRendering
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;

  v1 = a1;
  if (a1)
  {
    v2 = objc_opt_class();
    objc_msgSend(*(id *)(v1 + 1088), "attributes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bs_firstObjectOfClass:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = v4 != 0;

  }
  return v1;
}

- (BOOL)_shouldForceViewToShowForBacklightLuminance:(uint64_t)a1
{
  return a1 && a2 == 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  -[SBRecordingIndicatorViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_backlightLuminance");
  if (v5 != objc_msgSend(v6, "_backlightLuminance"))
    -[SBRecordingIndicatorViewController _updateIndicatorForBacklightLuminance:previousBacklightLuminance:](self, v5, objc_msgSend(v6, "_backlightLuminance"));

}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)_screen
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBRecordingIndicatorViewController;
    -[SBRecordingIndicatorViewController _screen](&v9, sel__screen);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (UIColor)indicatorColor
{
  return self->_indicatorColor;
}

- (int64_t)activeInterfaceOrientation
{
  return self->_activeInterfaceOrientation;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBWindowScene)windowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_indicatorColor, 0);
  objc_storeStrong((id *)&self->_indicatorView, 0);
  objc_storeStrong((id *)&self->_indicatorContainerView, 0);
  objc_storeStrong((id *)&self->_liveRenderingAssertion, 0);
  objc_storeStrong((id *)&self->_contentLayer, 0);
  objc_storeStrong((id *)&self->_rootLayer, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_animatorSpringToOff, 0);
  objc_storeStrong((id *)&self->_animatorSpringToOn, 0);
  objc_storeStrong((id *)&self->_animatorFastFade, 0);
  objc_storeStrong((id *)&self->_animatorScaleToZero, 0);
  objc_storeStrong((id *)&self->_animatorScaleToRest, 0);
  objc_storeStrong((id *)&self->_animatorScaleToNormal, 0);
  objc_storeStrong((id *)&self->_animatorScaleToOverscale, 0);
}

@end
