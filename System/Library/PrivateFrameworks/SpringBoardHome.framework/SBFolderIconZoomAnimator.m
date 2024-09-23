@implementation SBFolderIconZoomAnimator

- (SBFolderIconZoomAnimator)initWithAnimationContainer:(id)a3 innerFolderController:(id)a4 folderIcon:(id)a5
{
  id v8;
  id v9;
  SBFolderIconZoomAnimator *v10;
  SBFolderIconZoomAnimator *v11;
  uint64_t v12;
  SBSearchGesture *searchGesture;
  uint64_t v14;
  SBHSearchPresenting *searchPresenter;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SBFolderIconZoomAnimator;
  v10 = -[SBScaleIconZoomAnimator initWithAnimationContainer:targetIcon:](&v17, sel_initWithAnimationContainer_targetIcon_, v8, a5);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_innerFolderController, a4);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "searchGesture");
      v12 = objc_claimAutoreleasedReturnValue();
      searchGesture = v11->_searchGesture;
      v11->_searchGesture = (SBSearchGesture *)v12;

      -[SBSearchGesture addObserver:](v11->_searchGesture, "addObserver:", v11);
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "searchPresenter");
      v14 = objc_claimAutoreleasedReturnValue();
      searchPresenter = v11->_searchPresenter;
      v11->_searchPresenter = (SBHSearchPresenting *)v14;

      -[SBHSearchPresenting addSearchPresenterObserver:](v11->_searchPresenter, "addSearchPresenterObserver:", v11);
    }
  }

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[SBSearchGesture removeObserver:](self->_searchGesture, "removeObserver:", self);
  -[SBHSearchPresenting removeSearchPresenterObserver:](self->_searchPresenter, "removeSearchPresenterObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)SBFolderIconZoomAnimator;
  -[SBIconZoomAnimator dealloc](&v3, sel_dealloc);
}

- (id)defaultTargetIconContainerView
{
  return (id)-[SBFolderController view](self->_innerFolderController, "view");
}

- (SBIconView)targetIconView
{
  void *v3;
  void *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBFolderIconZoomAnimator;
  -[SBScaleIconZoomAnimator targetIconView](&v7, sel_targetIconView);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBScaleIconZoomAnimator referenceIconView](self, "referenceIconView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "visibleMiniIconListIndex");
  if (objc_msgSend(v3, "visibleMiniIconListIndex") != v5)
    objc_msgSend(v3, "scrollToTopOfPage:animated:", v5, 0);
  objc_msgSend(v4, "iconContentScale");
  objc_msgSend(v3, "setIconContentScale:");

  return (SBIconView *)v3;
}

- (BOOL)shouldMatchMoveWithDock
{
  return self->_isAnimatingInFloatingDock;
}

- (void)_prepareAnimation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _SBInnerFolderIconZoomAnimator *v7;
  SBFolderController *innerFolderController;
  _SBInnerFolderIconZoomAnimator *v9;
  _SBInnerFolderIconZoomAnimator *innerZoomAnimator;
  _SBInnerFolderIconZoomAnimator *v11;
  void *v12;
  objc_super v13;

  -[SBFolderController contentView](self->_innerFolderController, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v3;
  else
    v5 = 0;
  objc_storeStrong((id *)&self->_innerFolderView, v5);

  v13.receiver = self;
  v13.super_class = (Class)SBFolderIconZoomAnimator;
  -[SBScaleIconZoomAnimator _prepareAnimation](&v13, sel__prepareAnimation);
  -[SBFolderIconZoomAnimator targetIconView](self, "targetIconView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "prepareToCrossfadeWithFloatyFolderView:allowFolderInteraction:", self->_innerFolderView, -[SBFolderController isOpen](self->_innerFolderController, "isOpen"));
  objc_msgSend(v6, "setIconGridImageAlpha:", 0.0);
  v7 = [_SBInnerFolderIconZoomAnimator alloc];
  innerFolderController = self->_innerFolderController;
  -[SBScaleIconZoomAnimator zoomScaleDimension](self, "zoomScaleDimension");
  v9 = -[_SBInnerFolderIconZoomAnimator initWithFolderController:iconView:iconZoomScaleDimension:](v7, "initWithFolderController:iconView:iconZoomScaleDimension:", innerFolderController, v6);
  innerZoomAnimator = self->_innerZoomAnimator;
  self->_innerZoomAnimator = v9;

  v11 = self->_innerZoomAnimator;
  -[SBIconAnimator settings](self, "settings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconAnimator setSettings:](v11, "setSettings:", v12);

  -[SBIconAnimator prepare](self->_innerZoomAnimator, "prepare");
}

- (void)_updateDockMatchMoveWithFraction:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  id v25;

  if (BSFloatIsZero())
  {
    -[SBFolderIconZoomAnimator _setupMatchMoveWithDock](self, "_setupMatchMoveWithDock");
  }
  else
  {
    -[SBScaleIconZoomAnimator targetIconPositioningView](self, "targetIconPositioningView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layer");
    v25 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "animationForKey:", CFSTR("SBDockIconZoomDownMatchMoveKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v25;
    if (v5)
    {
      objc_msgSend(v25, "removeAnimationForKey:", CFSTR("SBDockIconZoomDownMatchMoveKey"));
      -[SBScaleIconZoomAnimator referenceIconView](self, "referenceIconView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "presentationLayer");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      if (v9)
        v11 = (void *)v9;
      else
        v11 = v8;
      v12 = v11;

      -[SBScaleIconZoomAnimator _referenceIconImageCenter](self, "_referenceIconImageCenter");
      v14 = v13;
      v16 = v15;
      -[SBScaleIconZoomAnimator targetIconContainerView](self, "targetIconContainerView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "layer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "convertPoint:toLayer:", v18, v14, v16);
      v20 = v19;

      -[SBScaleIconZoomAnimator targetIconCenter](self, "targetIconCenter");
      v22 = v21 - v20;
      if ((BSFloatIsZero() & 1) == 0)
      {
        -[SBScaleIconZoomAnimator targetIconPositioningView](self, "targetIconPositioningView");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "layer");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBFolderIconZoomAnimator _setupCounterDockMatchMoveAnimationWithOffset:layer:additive:](self, "_setupCounterDockMatchMoveAnimationWithOffset:layer:additive:", v24, 0, v22);

      }
      v6 = v25;
    }

  }
}

- (void)_setupMatchMoveWithDock
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
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;

  -[SBScaleIconZoomAnimator targetIconContainerView](self, "targetIconContainerView");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  -[SBScaleIconZoomAnimator targetIconCenter](self, "targetIconCenter");
  v4 = v3;
  v6 = v5;
  -[SBScaleIconZoomAnimator zoomedTargetIconCenter](self, "zoomedTargetIconCenter");
  v8 = v7;
  v10 = v9;
  -[SBScaleIconZoomAnimator zoomScaleDimension](self, "zoomScaleDimension");
  v12 = _SBScaleIconZoomAnimatorCameraPositionToScaleModelPointToTargetPoint(v4, v6, v8, v10, v11);
  v14 = v13;
  objc_msgSend(v18, "bounds");
  v16 = v12 / v15;
  objc_msgSend(v18, "bounds");
  -[SBFolderIconZoomAnimator _setupMatchMoveWithDockWithTargetIconCenter:targetIconAnchor:](self, "_setupMatchMoveWithDockWithTargetIconCenter:targetIconAnchor:", v4, v6, v16, v14 / v17);

}

- (void)_setupMatchMoveWithDockWithTargetIconCenter:(CGPoint)a3 targetIconAnchor:(CGPoint)a4
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
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
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x1E0C80C00];
  -[SBScaleIconZoomAnimator referenceIconView](self, "referenceIconView", a3.x, a3.y, a4.x, a4.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBScaleIconZoomAnimator targetIconPositioningView](self, "targetIconPositioningView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = SBIconLocationGroupContainsLocation(CFSTR("SBIconLocationGroupDock"), v7);

  if (v8)
    v9 = v6 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    objc_msgSend(v5, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD27C0], "animation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSourceLayer:", v10);
    objc_msgSend(v12, "setDuration:", INFINITY);
    objc_msgSend(v12, "setFillMode:", *MEMORY[0x1E0CD2B58]);
    objc_msgSend(v12, "setRemovedOnCompletion:", 0);
    objc_msgSend(v12, "setAppliesY:", 1);
    objc_msgSend(v12, "setAppliesX:", 1);
    -[SBScaleIconZoomAnimator targetIconContainerView](self, "targetIconContainerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "presentationLayer");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
      v16 = (void *)v14;
    else
      v16 = v10;
    v17 = v16;

    -[SBScaleIconZoomAnimator _referenceIconImageCenter](self, "_referenceIconImageCenter");
    v19 = v18;
    v21 = v20;
    objc_msgSend(v13, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "convertPoint:toLayer:", v22, v19, v21);
    v24 = v23;
    v26 = v25;

    objc_msgSend(v5, "bounds");
    v28 = v24 + v27 * -0.5;
    objc_msgSend(v13, "bounds");
    v30 = v28 + v29 * -0.5;
    objc_msgSend(v5, "bounds");
    v32 = v26 + v31 * -0.5;
    objc_msgSend(v13, "bounds");
    v34 = v32 + v33 * -0.5;
    objc_msgSend(v11, "anchorPoint");
    v36 = v35;
    v38 = v37;
    objc_msgSend(v13, "bounds");
    v40 = -(v30 - v39 * (v36 + -0.5));
    objc_msgSend(v13, "bounds");
    v42 = -(v34 - v41 * (v38 + -0.5));
    -[SBScaleIconZoomAnimator targetIconCenter](self, "targetIconCenter");
    v44 = v43 - v26;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v40 - (v45 - v24), v42 - v44);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v46;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSourcePoints:", v47);

    objc_msgSend(v11, "animationForKey:", CFSTR("SBDockIconZoomDownMatchMoveKey"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
      objc_msgSend(v11, "removeAnimationForKey:", CFSTR("SBDockIconZoomDownMatchMoveKey"));
    objc_msgSend(v11, "addAnimation:forKey:", v12, CFSTR("SBDockIconZoomDownMatchMoveKey"));
    if ((BSFloatIsZero() & 1) == 0)
      -[SBFolderIconZoomAnimator _setupCounterDockMatchMoveAnimationWithOffset:layer:additive:](self, "_setupCounterDockMatchMoveAnimationWithOffset:layer:additive:", v11, 1, v44);

  }
}

- (SBFFluidBehaviorSettings)dockAnimationSettings
{
  SBFFluidBehaviorSettings *dockAnimationSettings;
  id v4;

  dockAnimationSettings = self->_dockAnimationSettings;
  if (dockAnimationSettings)
    return dockAnimationSettings;
  v4 = objc_alloc_init(MEMORY[0x1E0DA9E08]);
  return (SBFFluidBehaviorSettings *)v4;
}

- (void)_setupCounterDockMatchMoveAnimationWithOffset:(double)a3 layer:(id)a4 additive:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;

  v5 = a5;
  v8 = a4;
  -[SBFolderIconZoomAnimator dockAnimationSettings](self, "dockAnimationSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dampingRatio");
  objc_msgSend(v9, "response");
  convertDampingRatioAndResponseToTensionAndFriction();
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("position.y"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMass:", 1.0);
  objc_msgSend(v10, "setStiffness:", 0.0);
  objc_msgSend(v10, "setDamping:", 0.0);
  objc_msgSend(v10, "settlingDuration");
  objc_msgSend(v10, "setDuration:");
  objc_msgSend(v10, "setRemovedOnCompletion:", 1);
  v11 = (void *)MEMORY[0x1E0CB37E8];
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFromValue:", v12);

    objc_msgSend(v10, "setToValue:", &unk_1E8E16B28);
    objc_msgSend(v10, "setAdditive:", 1);
  }
  else
  {
    objc_msgSend(v8, "position");
    objc_msgSend(v11, "numberWithDouble:", v13 - a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFromValue:", v14);

  }
  objc_msgSend(v8, "animationForKey:", CFSTR("SBDockIconZoomDownCounterSnapKey"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    objc_msgSend(v8, "removeAnimationForKey:", CFSTR("SBDockIconZoomDownCounterSnapKey"));
  objc_msgSend(v8, "addAnimation:forKey:", v10, CFSTR("SBDockIconZoomDownCounterSnapKey"));

}

- (void)_setupMatchMoveAnimation
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  -[SBIconAnimator animationContainer](self, "animationContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SBFolderIconZoomAnimator targetIconView](self, "targetIconView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "matchMoveSourceViewForIconView:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0CD27C0]);
      objc_msgSend(v6, "setDuration:", INFINITY);
      objc_msgSend(v6, "setFillMode:", *MEMORY[0x1E0CD2B58]);
      objc_msgSend(v6, "setRemovedOnCompletion:", 0);
      objc_msgSend(v6, "setAppliesY:", 0);
      objc_msgSend(v5, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setSourceLayer:", v7);

      objc_msgSend(v5, "window");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "window");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bounds");
      objc_msgSend(v8, "convertPoint:toView:", v5, v10 * 0.5, 0.0);
      v12 = v11;
      v14 = v13;

      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v12, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setSourcePoints:", v16);

      -[SBFolderIconZoomAnimator defaultTargetIconContainerView](self, "defaultTargetIconContainerView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "layer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addAnimation:forKey:", v6, CFSTR("SBFolderSourceViewTrackingMatchMoveAnimation"));

    }
  }

}

- (void)_setAnimationFraction:(double)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBFolderIconZoomAnimator;
  -[SBScaleIconZoomAnimator _setAnimationFraction:](&v6, sel__setAnimationFraction_);
  -[SBFolderIconZoomAnimator targetIconView](self, "targetIconView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFloatyFolderCrossfadeFraction:", a3);

  -[SBIconAnimator setFraction:](self->_innerZoomAnimator, "setFraction:", 1.0 - a3);
}

- (void)_cleanupAnimation
{
  void *v3;
  _SBInnerFolderIconZoomAnimator *innerZoomAnimator;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  -[SBFolderIconZoomAnimator targetIconView](self, "targetIconView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cleanupAfterFloatyFolderCrossfade");
  objc_msgSend(v3, "setIconGridImageAlpha:", 1.0);
  -[SBIconAnimator cleanup](self->_innerZoomAnimator, "cleanup");
  innerZoomAnimator = self->_innerZoomAnimator;
  self->_innerZoomAnimator = 0;

  -[SBFolderIconZoomAnimator searchGesture](self, "searchGesture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  -[SBFolderIconZoomAnimator setSearchGesture:](self, "setSearchGesture:", 0);
  -[SBFolderIconZoomAnimator defaultTargetIconContainerView](self, "defaultTargetIconContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAnimationForKey:", CFSTR("SBFolderSourceViewTrackingMatchMoveAnimation"));

  v8.receiver = self;
  v8.super_class = (Class)SBFolderIconZoomAnimator;
  -[SBScaleIconZoomAnimator _cleanupAnimation](&v8, sel__cleanupAnimation);

}

- (unint64_t)_numberOfSignificantAnimations
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBFolderIconZoomAnimator;
  return -[SBScaleIconZoomAnimator _numberOfSignificantAnimations](&v3, sel__numberOfSignificantAnimations) + 2;
}

- (void)_performAnimationToFraction:(double)a3 withCentralAnimationSettings:(id)a4 delay:(double)a5 alreadyAnimating:(BOOL)a6 sharedCompletion:(id)a7
{
  _BOOL8 v7;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[6];
  objc_super v22;

  v7 = a6;
  v22.receiver = self;
  v22.super_class = (Class)SBFolderIconZoomAnimator;
  v12 = a7;
  -[SBScaleIconZoomAnimator _performAnimationToFraction:withCentralAnimationSettings:delay:alreadyAnimating:sharedCompletion:](&v22, sel__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion_, a4, v7, v12, a3, a5);
  if (BSFloatIsZero())
    -[SBFolderIconZoomAnimator _setupMatchMoveAnimation](self, "_setupMatchMoveAnimation");
  if (BSFloatIsOne())
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postNotificationName:object:", CFSTR("SBIconZoomExpansionAnimationWillBeginNotification"), self);

  }
  if (-[SBFolderIconZoomAnimator shouldMatchMoveWithDock](self, "shouldMatchMoveWithDock"))
    -[SBFolderIconZoomAnimator _updateDockMatchMoveWithFraction:](self, "_updateDockMatchMoveWithFraction:", a3);
  -[SBIconAnimator settings](self, "settings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v7)
    v16 = 6;
  else
    v16 = 2;
  v17 = (void *)MEMORY[0x1E0D01908];
  objc_msgSend(v14, "effectiveCrossfadeAnimationSettings");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "BSAnimationSettings");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "factoryWithSettings:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "setAllowsAdditiveAnimations:", 1);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __125__SBFolderIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke;
  v21[3] = &unk_1E8D84C78;
  v21[4] = self;
  *(double *)&v21[5] = a3;
  objc_msgSend(MEMORY[0x1E0D01908], "animateWithFactory:additionalDelay:options:actions:completion:", v20, v16, v21, v12, a5);
  -[SBIconAnimator animateToFraction:afterDelay:withCompletion:](self->_innerZoomAnimator, "animateToFraction:afterDelay:withCompletion:", v12, 1.0 - a3, a5);

}

void __125__SBFolderIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "targetIconView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFloatyFolderCrossfadeFraction:", *(double *)(a1 + 40));

}

- (CGRect)_zoomedFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[SBFolderView scalingViewFrame](self->_innerFolderView, "scalingViewFrame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)_forceSquareZoomDimension
{
  return 0;
}

- (void)searchGesture:(id)a3 startedShowing:(BOOL)a4
{
  if (a4)
    -[SBFolderIconZoomAnimator _visuallyCompleteAnimationImmediately](self, "_visuallyCompleteAnimationImmediately", a3);
}

- (void)_visuallyCompleteAnimationImmediately
{
  void *v3;
  id v4;

  -[SBFolderIconZoomAnimator targetIconView](self, "targetIconView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[SBScaleIconZoomAnimator referenceIconView](self, "referenceIconView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllIconElementsButLabelHidden:", 0);

}

- (BOOL)isAnimatingInFloatingDock
{
  return self->_isAnimatingInFloatingDock;
}

- (void)setIsAnimatingInFloatingDock:(BOOL)a3
{
  self->_isAnimatingInFloatingDock = a3;
}

- (void)setDockAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_dockAnimationSettings, a3);
}

- (SBSearchGesture)searchGesture
{
  return self->_searchGesture;
}

- (void)setSearchGesture:(id)a3
{
  objc_storeStrong((id *)&self->_searchGesture, a3);
}

- (SBHSearchPresenting)searchPresenter
{
  return self->_searchPresenter;
}

- (void)setSearchPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_searchPresenter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchPresenter, 0);
  objc_storeStrong((id *)&self->_searchGesture, 0);
  objc_storeStrong((id *)&self->_dockAnimationSettings, 0);
  objc_storeStrong((id *)&self->_innerZoomAnimator, 0);
  objc_storeStrong((id *)&self->_innerFolderView, 0);
  objc_storeStrong((id *)&self->_innerFolderController, 0);
}

@end
