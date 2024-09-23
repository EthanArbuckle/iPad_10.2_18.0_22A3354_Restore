@implementation SBCenterAppIconZoomAnimator

- (SBCenterAppIconZoomAnimator)initWithFolderController:(id)a3 appView:(id)a4
{
  id v6;
  SBCenterAppIconZoomAnimator *v7;
  SBCenterAppIconZoomAnimator *v8;
  double *p_x;
  uint64_t v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  SBZoomableView *v14;
  UIView *appView;
  NSMutableArray *v16;
  NSMutableArray *animationCompletions;
  objc_super v19;

  v6 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SBCenterAppIconZoomAnimator;
  v7 = -[SBCenterIconZoomAnimator initWithFolderController:](&v19, sel_initWithFolderController_, a3);
  v8 = v7;
  if (v7)
  {
    p_x = &v7->_destinationFrame.origin.x;
    objc_msgSend(v6, "frame");
    *(_QWORD *)p_x = v10;
    v8->_destinationFrame.origin.y = v11;
    v8->_destinationFrame.size.width = v12;
    v8->_destinationFrame.size.height = v13;
    v14 = -[SBZoomableView initWithFrame:]([SBZoomableView alloc], "initWithFrame:", *p_x, v8->_destinationFrame.origin.y, v8->_destinationFrame.size.width, v8->_destinationFrame.size.height);
    appView = v8->_appView;
    v8->_appView = &v14->super;

    BSRectWithSize();
    objc_msgSend(v6, "setFrame:");
    -[UIView addSubview:](v8->_appView, "addSubview:", v6);
    v8->_distantScale = 0.01;
    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    animationCompletions = v8->_animationCompletions;
    v8->_animationCompletions = v16;

    if (-[SBIconAnimator _isDelayedForRotation](v8, "_isDelayedForRotation"))
      -[SBCenterAppIconZoomAnimator _delayedForRotation](v8, "_delayedForRotation");
  }

  return v8;
}

- (void)_delayedForRotation
{
  void *v3;
  id v4;

  -[UIView setHidden:](self->_appView, "setHidden:", 1);
  +[SBUIController sharedInstance](SBUIController, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", self->_appView);

}

- (void)_prepareAnimation
{
  void *v3;
  void *v4;
  void *v5;
  UIView *appView;
  double v7;
  double v8;
  double v9;
  double v10;
  UIView *v11;
  UIView *appZoomView;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  UIView *v26;
  objc_super v27[8];
  objc_super v28;

  -[UIView setHidden:](self->_appView, "setHidden:", 0);
  v28.receiver = self;
  v28.super_class = (Class)SBCenterAppIconZoomAnimator;
  -[SBCenterIconZoomAnimator _prepareAnimation](&v28, sel__prepareAnimation);
  -[SBCenterIconZoomAnimator zoomView](self, "zoomView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconAnimator referenceView](self, "referenceView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconAnimator settings](self, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "zoomViewBelowIcons"))
  {
    appView = self->_appView;
    objc_msgSend(v4, "bounds");
    UIRectGetCenter();
    objc_msgSend(v3, "convertPoint:fromView:", v4);
    -[UIView setCenter:](appView, "setCenter:");
    objc_msgSend(v3, "insertSubview:atIndex:", self->_appView, 0);
  }
  else
  {
    objc_msgSend(v3, "bounds");
    objc_msgSend(v4, "convertRect:fromView:", v3);
    v11 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v7, v8, v9, v10);
    appZoomView = self->_appZoomView;
    self->_appZoomView = v11;

    -[UIView layer](self->_appZoomView, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
      objc_msgSend(v14, "sublayerTransform");
    else
      memset(v27, 0, sizeof(v27));
    objc_msgSend(v13, "setSublayerTransform:", v27);

    -[UIView frame](self->_appZoomView, "frame");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    -[UIView layer](self->_appZoomView, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "anchorPoint");
    objc_msgSend(v24, "setAnchorPoint:");

    -[UIView setFrame:](self->_appZoomView, "setFrame:", v17, v19, v21, v23);
    v26 = self->_appView;
    objc_msgSend(v4, "bounds");
    UIRectGetCenter();
    -[UIView setCenter:](v26, "setCenter:");
    -[UIView addSubview:](self->_appZoomView, "addSubview:", self->_appView);
    objc_msgSend(v4, "addSubview:", self->_appZoomView);
  }

}

- (void)_setAnimationFraction:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBCenterAppIconZoomAnimator;
  -[SBCenterIconZoomAnimator _setAnimationFraction:](&v5, sel__setAnimationFraction_);
  -[SBCenterAppIconZoomAnimator _zoomAppForZoomFraction:](self, "_zoomAppForZoomFraction:", a3);
  -[SBCenterAppIconZoomAnimator _translateAppForZoomFraction:](self, "_translateAppForZoomFraction:", a3);
  -[SBCenterAppIconZoomAnimator _fadeAppForZoomFraction:](self, "_fadeAppForZoomFraction:", a3);
}

- (void)_cleanupAnimation
{
  UIView *appView;
  __int128 v4;
  void *v5;
  UIView *v6;
  UIView *appZoomView;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _OWORD v21[3];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  appView = self->_appView;
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v21[0] = *MEMORY[0x1E0C9BAA8];
  v21[1] = v4;
  v21[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[UIView setTransform:](appView, "setTransform:", v21);
  -[UIView layer](self->_appView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setZPosition:", 0.0);

  -[UIView removeFromSuperview](self->_appView, "removeFromSuperview");
  v6 = self->_appView;
  self->_appView = 0;

  -[UIView removeFromSuperview](self->_appZoomView, "removeFromSuperview");
  appZoomView = self->_appZoomView;
  self->_appZoomView = 0;

  -[SBCenterAppIconZoomAnimator animationCompletions](self, "animationCompletions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  if (objc_msgSend(v9, "count"))
  {
    -[SBCenterAppIconZoomAnimator animationCompletions](self, "animationCompletions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeAllObjects");

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v18;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v11);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v15++) + 16))();
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v13);
    }

  }
  -[SBReversibleLayerPropertyAnimator invalidate](self->_appZoomAnimator, "invalidate");
  -[SBCenterAppIconZoomAnimator setAppZoomAnimator:](self, "setAppZoomAnimator:", 0);
  v16.receiver = self;
  v16.super_class = (Class)SBCenterAppIconZoomAnimator;
  -[SBCenterIconZoomAnimator _cleanupAnimation](&v16, sel__cleanupAnimation);

}

- (unint64_t)_numberOfSignificantAnimations
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBCenterAppIconZoomAnimator;
  return -[SBCenterIconZoomAnimator _numberOfSignificantAnimations](&v3, sel__numberOfSignificantAnimations) + 2;
}

- (void)_performAnimationToFraction:(double)a3 withCentralAnimationSettings:(id)a4 delay:(double)a5 alreadyAnimating:(BOOL)a6 sharedCompletion:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  id *v18;
  const __CFString *v19;
  int v20;
  id v21;
  const __CFString *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  _QWORD v56[6];
  _QWORD v57[6];
  _QWORD v58[4];
  id v59;
  id v60;
  id location;
  _QWORD v62[5];
  id v63;
  objc_super v64;

  v8 = a6;
  v12 = a4;
  v13 = a7;
  v64.receiver = self;
  v64.super_class = (Class)SBCenterAppIconZoomAnimator;
  -[SBCenterIconZoomAnimator _performAnimationToFraction:withCentralAnimationSettings:delay:alreadyAnimating:sharedCompletion:](&v64, sel__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion_, v12, v8, v13, a3, a5);
  -[SBCenterAppIconZoomAnimator _appZoomDelay](self, "_appZoomDelay");
  v15 = v14 + a5;
  -[SBIconAnimator settings](self, "settings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 4;
  if (!v8)
    v17 = 0;
  v54 = v17;
  if (v8)
    v15 = 0.0;
  v18 = (id *)MEMORY[0x1E0CEB258];
  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "isRunningTest"))
  {
    v19 = CFSTR("AppOpenCenterZoom");
    v20 = objc_msgSend(*v18, "isRunningTest:", CFSTR("AppOpenCenterZoom"));
    v21 = *v18;
    if (v20)
    {
      v22 = CFSTR("workspaceActivate");
LABEL_10:
      objc_msgSend(v21, "finishedSubTest:forTest:", v22, v19);
      goto LABEL_11;
    }
    v19 = CFSTR("AppCloseCenterZoom");
    if (objc_msgSend(v21, "isRunningTest:", CFSTR("AppCloseCenterZoom")))
    {
      v21 = *v18;
      v22 = CFSTR("workspaceDeactivate");
      goto LABEL_10;
    }
  }
LABEL_11:
  v62[0] = MEMORY[0x1E0C809B0];
  v62[1] = 3221225472;
  v62[2] = __128__SBCenterAppIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke;
  v62[3] = &unk_1E8E9F230;
  v62[4] = self;
  v51 = v13;
  v63 = v51;
  v23 = MEMORY[0x1D17E5550](v62);
  v53 = v16;
  objc_msgSend(v16, "appZoomSettings");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "BSAnimationSettings");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)objc_msgSend(v25, "mutableCopy");
  objc_msgSend(v26, "delay");
  objc_msgSend(v26, "setDelay:", v15 + v27);
  -[SBCenterAppIconZoomAnimator animationCompletions](self, "animationCompletions");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = (void *)v23;
  v29 = (void *)MEMORY[0x1D17E5550](v23);
  objc_msgSend(v28, "addObject:", v29);

  ++self->_testCompletionCount;
  -[SBCenterAppIconZoomAnimator appZoomAnimator](self, "appZoomAnimator");
  v30 = objc_claimAutoreleasedReturnValue();
  v52 = v12;
  if (v30
    && (v31 = (void *)v30,
        -[SBCenterAppIconZoomAnimator appZoomAnimator](self, "appZoomAnimator"),
        v32 = (void *)objc_claimAutoreleasedReturnValue(),
        v33 = objc_msgSend(v32, "hasReversed"),
        v32,
        v31,
        (v33 & 1) == 0))
  {
    if (BSFloatIsOne())
    {
      objc_msgSend(MEMORY[0x1E0D01870], "settingsWithMass:stiffness:damping:", 3.0, 1000.0, 500.0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DAA470], "rootSettings");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "iconAnimationSettings");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "crossfadeAcceleratedSuspendSettings");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "centralAnimationSettings");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "BSAnimationSettings");
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      -[SBCenterAppIconZoomAnimator appZoomAnimator](self, "appZoomAnimator");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "reverseWithSettings:directionChangeSettings:headStart:", v34, v50, 0.0002);

    }
    else
    {
      -[SBCenterAppIconZoomAnimator appZoomAnimator](self, "appZoomAnimator");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "reverse");
    }
  }
  else
  {
    -[SBCenterAppIconZoomAnimator _appZPositionForZoomFraction:](self, "_appZPositionForZoomFraction:", a3);
    -[UIView layer](self->_appView, "layer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_alloc(MEMORY[0x1E0DAA638]);
    objc_msgSend(v34, "zPosition");
    v36 = (void *)objc_msgSend(v35, "initWithLayer:keyPath:initialValue:targetValue:", v34, CFSTR("zPosition"));
    -[SBCenterAppIconZoomAnimator setAppZoomAnimator:](self, "setAppZoomAnimator:", v36);
    objc_initWeak(&location, self);
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __128__SBCenterAppIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_2;
    v58[3] = &unk_1E8EA1598;
    objc_copyWeak(&v60, &location);
    v37 = v36;
    v59 = v37;
    v38 = (void *)MEMORY[0x1D17E5550](v58);
    objc_msgSend(v37, "animateWithSettings:completion:", v26, v38);

    objc_destroyWeak(&v60);
    objc_destroyWeak(&location);

  }
  v39 = v53;

  objc_msgSend(MEMORY[0x1E0D01908], "factoryWithSettings:", v25);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8 || BSFloatIsZero())
    objc_msgSend(v40, "setAllowsAdditiveAnimations:", 1, v50);
  ++self->_testCompletionCount;
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __128__SBCenterAppIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_3;
  v57[3] = &unk_1E8E9DE88;
  v57[4] = self;
  *(double *)&v57[5] = a3;
  objc_msgSend(MEMORY[0x1E0D01908], "animateWithFactory:additionalDelay:options:actions:completion:", v40, v54, v57, v55, v15, v50);
  if ((BSFloatIsZero() & 1) != 0 || BSFloatIsOne())
  {
    objc_msgSend(v53, "appFadeSettings");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "BSAnimationSettings");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)objc_msgSend(v42, "mutableCopy");

    if (v8)
      objc_msgSend(v43, "setDelay:", 0.0);
    objc_msgSend(MEMORY[0x1E0D01908], "factoryWithSettings:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8 || BSFloatIsZero())
      objc_msgSend(v44, "setAllowsAdditiveAnimations:", 1);
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __128__SBCenterAppIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_6;
    v56[3] = &unk_1E8E9DE88;
    v56[4] = self;
    *(double *)&v56[5] = a3;
    objc_msgSend(MEMORY[0x1E0D01908], "animateWithFactory:additionalDelay:options:actions:completion:", v44, v54, v56, 0, v15);

    v39 = v53;
  }

}

uint64_t __128__SBCenterAppIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  id *v4;
  const __CFString *v5;
  int v6;
  id v7;
  const __CFString *v8;
  uint64_t result;

  if (--*(_BYTE *)(*(_QWORD *)(a1 + 32) + 280))
    goto LABEL_8;
  v4 = (id *)MEMORY[0x1E0CEB258];
  if (!objc_msgSend((id)*MEMORY[0x1E0CEB258], "isRunningTest"))
    goto LABEL_8;
  v5 = CFSTR("AppOpenCenterZoom");
  v6 = objc_msgSend(*v4, "isRunningTest:", CFSTR("AppOpenCenterZoom"));
  v7 = *v4;
  if (v6)
  {
    v8 = CFSTR("AppOpenCenterZoomAnimation");
  }
  else
  {
    v5 = CFSTR("AppCloseCenterZoom");
    if (!objc_msgSend(v7, "isRunningTest:", CFSTR("AppCloseCenterZoom")))
      goto LABEL_8;
    v7 = *v4;
    v8 = CFSTR("AppCloseCenterZoomAnimation");
  }
  objc_msgSend(v7, "finishedSubTest:forTest:", v8, v5);
LABEL_8:
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

void __128__SBCenterAppIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v1 = a1;
  v17 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "appZoomAnimator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v1) = objc_msgSend(v3, "isEqual:", *(_QWORD *)(v1 + 32));

  if ((_DWORD)v1)
  {
    objc_msgSend(WeakRetained, "setAppZoomAnimator:", 0);
    objc_msgSend(WeakRetained, "animationCompletions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");

    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(WeakRetained, "animationCompletions");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeAllObjects");

      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v7 = v5;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v13;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v13 != v10)
              objc_enumerationMutation(v7);
            (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11) + 16))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11));
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v9);
      }

    }
  }

}

uint64_t __128__SBCenterAppIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_3(uint64_t a1)
{
  id *v1;
  uint64_t result;
  int v3;
  id v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_translateAppForZoomFraction:", *(double *)(a1 + 40));
  v1 = (id *)MEMORY[0x1E0CEB258];
  result = objc_msgSend((id)*MEMORY[0x1E0CEB258], "isRunningTest");
  if ((_DWORD)result)
  {
    v3 = objc_msgSend(*v1, "isRunningTest:", CFSTR("AppOpenCenterZoom"));
    v4 = *v1;
    if (v3)
    {
      v5 = &__block_literal_global_339;
    }
    else
    {
      result = objc_msgSend(v4, "isRunningTest:", CFSTR("AppCloseCenterZoom"));
      if (!(_DWORD)result)
        return result;
      v4 = *v1;
      v5 = &__block_literal_global_34_0;
    }
    return objc_msgSend(v4, "installCACommitCompletionBlock:", v5);
  }
  return result;
}

uint64_t __128__SBCenterAppIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_4()
{
  return objc_msgSend((id)*MEMORY[0x1E0CEB258], "startedSubTest:forTest:", CFSTR("AppOpenCenterZoomAnimation"), CFSTR("AppOpenCenterZoom"));
}

uint64_t __128__SBCenterAppIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_5()
{
  return objc_msgSend((id)*MEMORY[0x1E0CEB258], "startedSubTest:forTest:", CFSTR("AppCloseCenterZoomAnimation"), CFSTR("AppCloseCenterZoom"));
}

uint64_t __128__SBCenterAppIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fadeAppForZoomFraction:", *(double *)(a1 + 40));
}

- (double)_iconZoomDelay
{
  void *v2;
  double v3;
  double v4;

  -[SBIconAnimator settings](self, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appHeadStart");
  v4 = v3;

  return fmax(v4, 0.0);
}

- (CGPoint)cameraPosition
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  -[SBIconAnimator referenceView](self, "referenceView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIRectGetCenter();
  v5 = v4;
  v7 = v6;
  -[SBCenterIconZoomAnimator zoomView](self, "zoomView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "convertPoint:toView:", v8, v5, v7);
  v10 = v9;
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.y = v14;
  result.x = v13;
  return result;
}

- (double)_appZoomDelay
{
  void *v2;
  double v3;
  double v4;
  double result;

  -[SBIconAnimator settings](self, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appHeadStart");
  v4 = v3;

  result = -v4;
  if (v4 >= 0.0)
    return 0.0;
  return result;
}

- (void)_zoomAppForZoomFraction:(double)a3
{
  double v4;
  double v5;
  id v6;

  -[SBCenterAppIconZoomAnimator _appZPositionForZoomFraction:](self, "_appZPositionForZoomFraction:", a3);
  v5 = v4;
  -[UIView layer](self->_appView, "layer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setZPosition:", v5);

}

- (double)_appZPositionForZoomFraction:(double)a3
{
  double v4;

  SBHZPositionForScale();
  return (1.0 - a3) * v4;
}

- (void)_translateAppForZoomFraction:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIView *appView;
  CGAffineTransform v12;

  -[UIView center](self->_appView, "center");
  v6 = v5;
  v8 = v7;
  -[SBCenterAppIconZoomAnimator cameraPosition](self, "cameraPosition");
  appView = self->_appView;
  CGAffineTransformMakeTranslation(&v12, (v9 - v6) * a3, (v10 - v8) * a3);
  -[UIView setTransform:](appView, "setTransform:", &v12);
}

- (void)_fadeAppForZoomFraction:(double)a3
{
  -[UIView setAlpha:](self->_appView, "setAlpha:", a3);
}

- (double)distantScale
{
  return self->_distantScale;
}

- (void)setDistantScale:(double)a3
{
  self->_distantScale = a3;
}

- (SBReversibleLayerPropertyAnimator)appZoomAnimator
{
  return self->_appZoomAnimator;
}

- (void)setAppZoomAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_appZoomAnimator, a3);
}

- (NSMutableArray)animationCompletions
{
  return self->_animationCompletions;
}

- (void)setAnimationCompletions:(id)a3
{
  objc_storeStrong((id *)&self->_animationCompletions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationCompletions, 0);
  objc_storeStrong((id *)&self->_appZoomAnimator, 0);
  objc_storeStrong((id *)&self->_appZoomView, 0);
  objc_storeStrong((id *)&self->_appView, 0);
}

@end
