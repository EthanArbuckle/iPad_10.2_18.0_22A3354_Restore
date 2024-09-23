@implementation SBHomeGestureFloatingSwitcherModifier

- (SBHomeGestureFloatingSwitcherModifier)initWithGestureID:(id)a3 selectedAppLayout:(id)a4 continuingGesture:(BOOL)a5 lastGestureWasAnArcSwipe:(BOOL)a6 floatingConfiguration:(int64_t)a7
{
  id v13;
  id v14;
  SBHomeGestureFloatingSwitcherModifier *v15;
  SBHomeGestureFloatingSwitcherModifier *v16;
  SBStackedFloatingSwitcherModifier *v17;
  SBStackedFloatingSwitcherModifier *stackedLayoutModifier;
  SBDismissSiriSwitcherModifier *v19;
  SBDismissSiriSwitcherModifier *dismissSiriModifier;
  void *v22;
  objc_super v23;

  v13 = a3;
  v14 = a4;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeGestureFloatingSwitcherModifier.m"), 118, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("selectedAppLayout"));

  }
  v23.receiver = self;
  v23.super_class = (Class)SBHomeGestureFloatingSwitcherModifier;
  v15 = -[SBGestureSwitcherModifier initWithGestureID:](&v23, sel_initWithGestureID_, v13);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_selectedAppLayout, a4);
    v16->_continuingGesture = a5;
    v16->_lastGestureWasAnArcSwipe = a6;
    v16->_floatingConfiguration = a7;
    v17 = objc_alloc_init(SBStackedFloatingSwitcherModifier);
    stackedLayoutModifier = v16->_stackedLayoutModifier;
    v16->_stackedLayoutModifier = v17;

    v19 = objc_alloc_init(SBDismissSiriSwitcherModifier);
    dismissSiriModifier = v16->_dismissSiriModifier;
    v16->_dismissSiriModifier = v19;

    -[SBChainableModifier addChildModifier:](v16, "addChildModifier:", v16->_dismissSiriModifier);
  }

  return v16;
}

- (void)didMoveToParentModifier:(id)a3
{
  SBHomeGestureFinalDestinationSwitcherModifier *v5;
  void *v6;
  double v7;
  SBHomeGestureFinalDestinationSwitcherModifier *v8;
  SBHomeGestureFinalDestinationSwitcherModifier *finalDestinationModifier;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBHomeGestureFloatingSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v10, sel_didMoveToParentModifier_);
  if (a3)
  {
    if (!self->_finalDestinationModifier)
    {
      v5 = [SBHomeGestureFinalDestinationSwitcherModifier alloc];
      -[SBHomeGestureFloatingSwitcherModifier homeGestureSettings](self, "homeGestureSettings");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "minimumYDistanceForHomeOrAppSwitcher");
      v8 = -[SBHomeGestureFinalDestinationSwitcherModifier initWithDelegate:initialTranslationAdjustment:minYDistanceForHomeOrSwitcher:startingEnvironmentMode:continuingGesture:dockModifier:](v5, "initWithDelegate:initialTranslationAdjustment:minYDistanceForHomeOrSwitcher:startingEnvironmentMode:continuingGesture:dockModifier:", self, 3, self->_continuingGesture, 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v7);
      finalDestinationModifier = self->_finalDestinationModifier;
      self->_finalDestinationModifier = v8;

      -[SBChainableModifier addChildModifier:](self, "addChildModifier:", self->_finalDestinationModifier);
    }
    -[SBHomeGestureFloatingSwitcherModifier _applyPrototypeSettings](self, "_applyPrototypeSettings");
  }
}

- (id)handleHomeGestureSettingsChangedEvent:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  -[SBHomeGestureFloatingSwitcherModifier _applyPrototypeSettings](self, "_applyPrototypeSettings");
  v7.receiver = self;
  v7.super_class = (Class)SBHomeGestureFloatingSwitcherModifier;
  -[SBSwitcherModifier handleHomeGestureSettingsChangedEvent:](&v7, sel_handleHomeGestureSettingsChangedEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBHomeGestureFloatingSwitcherModifier;
  v4 = a3;
  -[SBGestureSwitcherModifier handleTransitionEvent:](&v8, sel_handleTransitionEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "phase", v8.receiver, v8.super_class);

  if (v6 >= 2)
    -[SBChainableModifier setState:](self, "setState:", 1);
  return v5;
}

- (id)handleGestureEvent:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBHomeGestureFloatingSwitcherModifier;
  -[SBGestureSwitcherModifier handleGestureEvent:](&v12, sel_handleGestureEvent_, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v5, "phase"))
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeGestureFloatingSwitcherModifier.m"), 179, CFSTR("Should not be getting PhasePossible"));

      goto LABEL_3;
    case 1:
      -[SBHomeGestureFloatingSwitcherModifier _updateForGestureDidBeginWithEvent:](self, "_updateForGestureDidBeginWithEvent:", v5);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      -[SBHomeGestureFloatingSwitcherModifier _updateForGestureDidChangeWithEvent:](self, "_updateForGestureDidChangeWithEvent:", v5);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3:
      -[SBHomeGestureFloatingSwitcherModifier _updateForGestureDidEndWithEvent:](self, "_updateForGestureDidEndWithEvent:", v5);
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v8 = (void *)v9;
      break;
    default:
LABEL_3:
      v8 = 0;
      break;
  }
  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v8, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_updateForGestureDidBeginWithEvent:(id)a3
{
  id v5;
  SBSwitcherModifierEventResponse *v6;
  CADisplayLink *v7;
  CADisplayLink *displayLink;
  CADisplayLink *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  SBInvalidateAdjustedAppLayoutsSwitcherEventResponse *v17;
  void *v18;
  unint64_t v19;
  SBUpdateLayoutSwitcherEventResponse *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;

  v5 = a3;
  if (self->_gestureHasBegun)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeGestureFloatingSwitcherModifier.m"), 196, CFSTR("Can't begin a gesture that has already begun."));

  }
  if (self->_gestureHasEnded)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeGestureFloatingSwitcherModifier.m"), 197, CFSTR("Can't begin a gesture that has already ended."));

  }
  self->_gestureHasBegun = 1;
  v6 = objc_alloc_init(SBSwitcherModifierEventResponse);
  objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__displayLinkFired_);
  v7 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
  displayLink = self->_displayLink;
  self->_displayLink = v7;

  v9 = self->_displayLink;
  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CADisplayLink addToRunLoop:forMode:](v9, "addToRunLoop:forMode:", v10, *MEMORY[0x1E0C99860]);

  self->_inMultitasking = 0;
  -[SBHomeGestureFloatingSwitcherModifier containerViewBounds](self, "containerViewBounds");
  objc_msgSend(v5, "locationInContainerView");
  v12 = v11;
  v14 = v13;
  UIRectGetCenter();
  self->_touchOffset.x = v12 - v15;
  self->_touchOffset.y = v14 - v16;
  self->_initialTouchLocation.x = v12;
  self->_initialTouchLocation.y = v14;
  self->_lastTouchLocation.x = v12;
  self->_lastTouchLocation.y = v14;
  -[SBHomeGestureFloatingSwitcherModifier _updateGestureTranslationVelocityAndProgressWithEvent:](self, "_updateGestureTranslationVelocityAndProgressWithEvent:", v5);
  v17 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
  -[SBChainableModifierEventResponse addChildResponse:](v6, "addChildResponse:", v17);
  if (self->_continuingGesture
    && (-[SBHomeGestureFloatingSwitcherModifier appLayouts](self, "appLayouts"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v19 = objc_msgSend(v18, "count"),
        v18,
        v19 >= 2))
  {
    -[SBHomeGestureFloatingSwitcherModifier switcherSettings](self, "switcherSettings");
    v20 = (SBUpdateLayoutSwitcherEventResponse *)objc_claimAutoreleasedReturnValue();
    -[SBUpdateLayoutSwitcherEventResponse animationSettings](v20, "animationSettings");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "layoutSettings");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHomeGestureFloatingSwitcherModifier _beginAnimatingRampingPropertyWithSettings:](self, "_beginAnimatingRampingPropertyWithSettings:", v22);

  }
  else
  {
    v20 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 8, 2);
    -[SBChainableModifierEventResponse addChildResponse:](v6, "addChildResponse:", v20);
  }

  return v6;
}

- (id)_updateForGestureDidChangeWithEvent:(id)a3
{
  id v5;
  SBSwitcherModifierEventResponse *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  void *v13;
  void *v14;

  v5 = a3;
  if (!self->_gestureHasBegun)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeGestureFloatingSwitcherModifier.m"), 234, CFSTR("Can't update a gesture that has not begun."));

  }
  if (self->_gestureHasEnded)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeGestureFloatingSwitcherModifier.m"), 235, CFSTR("Can't update a gesture that has already ended."));

  }
  -[SBHomeGestureFloatingSwitcherModifier _updateGestureTranslationVelocityAndProgressWithEvent:](self, "_updateGestureTranslationVelocityAndProgressWithEvent:", v5);
  if (-[SBHomeGestureFloatingSwitcherModifier _isTranslationPastDistanceThresholdToUnconditionallyGoHome:](self, "_isTranslationPastDistanceThresholdToUnconditionallyGoHome:", self->_translation.y))
  {
    self->_gestureHoldTimer = 0;
  }
  v6 = objc_alloc_init(SBSwitcherModifierEventResponse);
  objc_msgSend(v5, "locationInContainerView");
  v8 = v7;
  v10 = v9;
  -[SBHomeGestureFloatingSwitcherModifier _updateInMultitaskingIfNeededWithEvent:](self, "_updateInMultitaskingIfNeededWithEvent:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    -[SBChainableModifierEventResponse addChildResponse:](v6, "addChildResponse:", v11);
  self->_lastTouchLocation.x = v8;
  self->_lastTouchLocation.y = v10;

  return v6;
}

- (id)_updateForGestureDidEndWithEvent:(id)a3
{
  id v5;
  CADisplayLink *displayLink;
  CGFloat v7;
  CGFloat v8;
  unint64_t v9;
  void *v10;
  SBSwitcherModifierEventResponse *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double a;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  uint64_t v30;
  double v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  uint64_t v38;
  SBInjectVelocitySwitcherEventResponse *v39;
  void *v40;
  SBInjectVelocitySwitcherEventResponse *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  uint64_t v59;
  uint64_t j;
  uint64_t v61;
  SBInjectVelocitySwitcherEventResponse *v62;
  void *v63;
  SBInjectVelocitySwitcherEventResponse *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  SBSwitcherModifierEventResponse *v75;
  void *v76;
  SBHomeGestureFloatingSwitcherModifier *v77;
  id obj;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  void *v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  CGAffineTransform v94;
  CATransform3D v95;
  uint8_t v96[128];
  _BYTE buf[24];
  __int128 v98;
  double v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  uint64_t v104;
  double v105;
  _BYTE v106[128];
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!self->_gestureHasBegun)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeGestureFloatingSwitcherModifier.m"), 257, CFSTR("Can't end a gesture that has not begun."));

  }
  if (self->_gestureHasEnded)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeGestureFloatingSwitcherModifier.m"), 258, CFSTR("Can't end a gesture that has already ended."));

  }
  self->_gestureHasEnded = 1;
  -[SBHomeGestureFloatingSwitcherModifier _updateGestureTranslationVelocityAndProgressWithEvent:](self, "_updateGestureTranslationVelocityAndProgressWithEvent:", v5);
  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  displayLink = self->_displayLink;
  self->_displayLink = 0;

  self->_gestureLiftOffVelocity = self->_velocity;
  self->_gestureLiftOffTranslation = self->_translation;
  objc_msgSend(v5, "locationInContainerView");
  self->_lastTouchLocation.x = v7;
  self->_lastTouchLocation.y = v8;
  v9 = -[SBHomeGestureFinalDestinationSwitcherModifier currentFinalDestination](self->_finalDestinationModifier, "currentFinalDestination");
  -[SBHomeGestureFinalDestinationSwitcherModifier finalDestinationReason](self->_finalDestinationModifier, "finalDestinationReason");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(SBSwitcherModifierEventResponse);
  if ((objc_msgSend(v5, "isCanceled") & 1) == 0 && objc_msgSend(v5, "touchType") == 1)
  {
    -[SBHomeGestureFloatingSwitcherModifier homeGestureSettings](self, "homeGestureSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v9 == 4 && self->_selectedAppLayout && objc_msgSend(v12, "injectGestureVelocityForZoomDown"))
    {
      -[SBHomeGestureFloatingSwitcherModifier visibleAppLayouts](self, "visibleAppLayouts");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "velocityInContainerView");
      v16 = v15;
      v18 = v17;
      -[SBHomeGestureFloatingSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
      v20 = v19;
      -[SBHomeGestureFloatingSwitcherModifier homeGestureSettings](self, "homeGestureSettings");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHomeGestureFloatingSwitcherModifier currentVelocityValueForVisibleAppLayout:key:](self, "currentVelocityValueForVisibleAppLayout:key:", self->_selectedAppLayout, CFSTR("transform"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v22)
      {
        objc_msgSend(v22, "CATransform3DValue");
        CATransform3DGetAffineTransform(&v94, &v95);
        a = v94.a;
      }
      else
      {
        a = 0.0;
      }
      objc_msgSend(v21, "scaleVelocityPercentOfGestureVelocityYDividedByViewHeight");
      v26 = v18 / v20 * v25;
      if (objc_msgSend(v21, "onlyInjectVelocityForShortFlicks") && fabs(a / v26) >= 0.15)
      {
        v27 = 0;
      }
      else
      {
        v71 = v23;
        v73 = v13;
        v74 = v10;
        v75 = v11;
        v77 = self;
        v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
        v28 = fabs(v26);
        v76 = v21;
        objc_msgSend(v21, "maximumScaleVelocity");
        if (v28 > v29)
          v28 = v29;
        v30 = MEMORY[0x1E0CD2610];
        v31 = *(double *)(MEMORY[0x1E0CD2610] + 120);
        v90 = 0u;
        v91 = 0u;
        if (v26 >= 0.0)
          v32 = v31;
        else
          v32 = NAN;
        v92 = 0uLL;
        v93 = 0uLL;
        v72 = v14;
        obj = v14;
        v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v106, 16);
        if (v33)
        {
          v34 = v33;
          v35 = *(_QWORD *)v91;
          v83 = *(_OWORD *)(v30 + 24);
          v84 = *(_OWORD *)(v30 + 8);
          v81 = *(_OWORD *)(v30 + 96);
          v82 = *(_OWORD *)(v30 + 80);
          v36 = *(_QWORD *)(v30 + 112);
          v79 = *(_OWORD *)(v30 + 48);
          v80 = *(_OWORD *)(v30 + 64);
          do
          {
            for (i = 0; i != v34; ++i)
            {
              if (*(_QWORD *)v91 != v35)
                objc_enumerationMutation(obj);
              v38 = *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * i);
              v39 = [SBInjectVelocitySwitcherEventResponse alloc];
              *(_OWORD *)&buf[8] = v84;
              v98 = v83;
              *(double *)buf = v28;
              v99 = v28;
              v102 = v82;
              v103 = v81;
              v104 = v36;
              v100 = v79;
              v101 = v80;
              v105 = v32;
              objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", buf);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = -[SBInjectVelocitySwitcherEventResponse initWithVelocity:forKey:appLayout:](v39, "initWithVelocity:forKey:appLayout:", v40, CFSTR("transform"), v38);
              objc_msgSend(v27, "addObject:", v41);

            }
            v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v106, 16);
          }
          while (v34);
        }

        -[SBHomeGestureFloatingSwitcherModifier currentVelocityValueForVisibleAppLayout:key:](v77, "currentVelocityValueForVisibleAppLayout:key:", v77->_selectedAppLayout, CFSTR("position"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = v42;
        if (v42)
        {
          objc_msgSend(v42, "CGPointValue");
          v44 = v43;
          v46 = v45;
        }
        else
        {
          v44 = *MEMORY[0x1E0C9D538];
          v46 = *(double *)(MEMORY[0x1E0C9D538] + 8);
        }
        objc_msgSend(v76, "positionVelocityXPercentOfGestureVelocityX");
        v48 = v47;
        objc_msgSend(v76, "positionVelocityYPercentOfGestureVelocityY");
        v50 = v49;
        v86 = 0u;
        v87 = 0u;
        v88 = 0u;
        v89 = 0u;
        v51 = obj;
        v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v86, v96, 16);
        if (v52)
        {
          v53 = v52;
          v54 = fabs(v44);
          if (fabs(v16) >= v54)
            v55 = v16;
          else
            v55 = v44;
          if (fabs(v55) >= v54)
            v56 = v18;
          else
            v56 = v46;
          v57 = v50 * v56;
          v58 = v48 * v55;
          v59 = *(_QWORD *)v87;
          do
          {
            for (j = 0; j != v53; ++j)
            {
              if (*(_QWORD *)v87 != v59)
                objc_enumerationMutation(v51);
              v61 = *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * j);
              v62 = [SBInjectVelocitySwitcherEventResponse alloc];
              objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v58, v57);
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              v64 = -[SBInjectVelocitySwitcherEventResponse initWithVelocity:forKey:appLayout:](v62, "initWithVelocity:forKey:appLayout:", v63, CFSTR("position"), v61);
              objc_msgSend(v27, "addObject:", v64);

            }
            v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v86, v96, 16);
          }
          while (v53);
        }

        v21 = v76;
        self = v77;
        v10 = v74;
        v11 = v75;
        v13 = v73;
        v9 = 4;
        v23 = v71;
        v14 = v72;
      }
      if (objc_msgSend(v27, "count"))
        -[SBChainableModifierEventResponse addChildResponses:](v11, "addChildResponses:", v27);

    }
  }
  SBLogSystemGestureAppSwitcher();
  v65 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
  {
    NSStringFromSBHomeGestureFinalDestination(v9);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v66;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2112;
    *(_QWORD *)&v98 = v10;
    _os_log_impl(&dword_1D0540000, v65, OS_LOG_TYPE_INFO, "Floating Home Gesture Modifier - Final Response: %@ (%lu), Reason: %@", buf, 0x20u);

  }
  -[SBHomeGestureFloatingSwitcherModifier _responseForActivatingFinalDestination:](self, "_responseForActivatingFinalDestination:", v9);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBChainableModifierEventResponse addChildResponse:](v11, "addChildResponse:", v67);

  return v11;
}

- (void)_beginAnimatingRampingPropertyWithSettings:(id)a3
{
  id v4;
  UIViewFloatAnimatableProperty *rampingProperty;
  UIViewFloatAnimatableProperty *v6;
  UIViewFloatAnimatableProperty *v7;
  UIViewFloatAnimatableProperty *v8;
  UIViewFloatAnimatableProperty *v9;
  void *v10;
  UIViewFloatAnimatableProperty *v11;
  _QWORD v12[4];
  UIViewFloatAnimatableProperty *v13;
  id v14;
  _QWORD v15[5];
  id location;

  v4 = a3;
  rampingProperty = self->_rampingProperty;
  if (rampingProperty)
  {
    -[UIViewFloatAnimatableProperty invalidate](rampingProperty, "invalidate");
    v6 = self->_rampingProperty;
    self->_rampingProperty = 0;

  }
  v7 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E0CEABC0]);
  v8 = self->_rampingProperty;
  self->_rampingProperty = v7;

  -[UIViewFloatAnimatableProperty setValue:](self->_rampingProperty, "setValue:", 0.0);
  objc_initWeak(&location, self);
  v9 = self->_rampingProperty;
  v10 = (void *)MEMORY[0x1E0CEABB0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __84__SBHomeGestureFloatingSwitcherModifier__beginAnimatingRampingPropertyWithSettings___block_invoke;
  v15[3] = &unk_1E8E9DED8;
  v15[4] = self;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __84__SBHomeGestureFloatingSwitcherModifier__beginAnimatingRampingPropertyWithSettings___block_invoke_2;
  v12[3] = &unk_1E8EA6DD8;
  objc_copyWeak(&v14, &location);
  v11 = v9;
  v13 = v11;
  objc_msgSend(v10, "sb_animateWithSettings:mode:animations:completion:", v4, 3, v15, v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

uint64_t __84__SBHomeGestureFloatingSwitcherModifier__beginAnimatingRampingPropertyWithSettings___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "setValue:", 1.0);
}

void __84__SBHomeGestureFloatingSwitcherModifier__beginAnimatingRampingPropertyWithSettings___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  void *v4;
  id v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v3 = WeakRetained[24];
    v4 = v3;
    if (v3 && v3 == *(id *)(a1 + 32))
    {
      v5 = v6[24];
      v6[24] = 0;

    }
    WeakRetained = v6;
  }

}

- (void)_updateGestureTranslationVelocityAndProgressWithEvent:(id)a3
{
  id v4;
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
  double v18;
  double v19;
  double v20;
  double v21;
  int v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  double v26;

  v4 = a3;
  objc_msgSend(v4, "translationInContainerView");
  v6 = v5
     + self->_translationAdjustmentForStartingFromSwitcher.x
     + self->_translationAdjustmentForStartingFromHomeScreen.x;
  v8 = v7
     + self->_translationAdjustmentForStartingFromSwitcher.y
     + self->_translationAdjustmentForStartingFromHomeScreen.y;
  -[SBHomeGestureFloatingSwitcherModifier _distanceYToInSwitcherCardScale](self, "_distanceYToInSwitcherCardScale");
  v10 = -v8 / v9;
  -[SBHomeGestureFloatingSwitcherModifier _gestureProgressToMaxTranslationForTranslation:](self, "_gestureProgressToMaxTranslationForTranslation:", v8);
  self->_translation.x = v6;
  self->_translation.y = v8;
  self->_progressToInSwitcherCardScale = v10;
  self->_progressToMaxTranslation = v11;
  objc_msgSend(v4, "lastTouchTimestamp");
  self->_lastTouchTimestamp = v12;
  -[SBHomeGestureFloatingSwitcherModifier containerViewBounds](self, "containerViewBounds");
  v14 = v13;
  if (-[SBHomeGestureFloatingSwitcherModifier isRTLEnabled](self, "isRTLEnabled"))
    v15 = -v6;
  else
    v15 = v6;
  -[SBHomeGestureFloatingSwitcherModifier scaleForIndex:](self, "scaleForIndex:", 0);
  v17 = v16;
  v18 = v16 * v14 * -0.55;
  if (v15 < v18)
  {
    BSUIConstrainValueWithRubberBand();
    v15 = v18 - v19;
  }
  v20 = v14 * v17 * 0.55;
  if (v15 > v20)
  {
    BSUIConstrainValueWithRubberBand();
    v15 = v20 + v21;
  }
  v22 = -[SBHomeGestureFloatingSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
  v23 = -v15;
  if (!v22)
    v23 = v15;
  self->_translation.x = v23;
  self->_translation.y = v8;
  objc_msgSend(v4, "averageTouchVelocityOverTimeDuration:", 0.0416666667);
  self->_velocity.x = v24;
  self->_velocity.y = v25;
  BSUIConstrainValueToIntervalWithRubberBand();
  self->_rubberbandedYTranslation = v26;
  self->_scaleProgress = v26 / 475.0 + 0.0;
  self->_multitaskingHintProgress = self->_rubberbandedYTranslation / 150.0 + 0.0;

}

- (int64_t)currentFinalDestination
{
  return -[SBHomeGestureFinalDestinationSwitcherModifier currentFinalDestination](self->_finalDestinationModifier, "currentFinalDestination");
}

- (double)unconditionalDistanceThresholdForHome
{
  double v3;
  double v4;
  double v5;
  double result;
  double v7;

  v3 = *(double *)&kHomeGestureNormalizedDistanceYThresholdForUnconditionalHome_0;
  v4 = *(double *)&kHomeGestureNormalizedDistanceYThresholdRangeForUnconditionalHome_0;
  -[SBHomeGestureFloatingSwitcherModifier containerViewBounds](self, "containerViewBounds");
  result = v3 * v5;
  if (self->_hasTriggeredCardFlyIn)
  {
    v7 = result - v4 * v5;
    result = result + v4 * v5;
    if (v7 < 100.0 - self->_translationYWhenTriggeredCardFlyIn)
      v7 = 100.0 - self->_translationYWhenTriggeredCardFlyIn;
    if (result > v7)
      result = v7;
    if (!self->_inMultitasking)
      return result + -50.0;
  }
  return result;
}

- (id)_responseForActivatingFinalDestination:(int64_t)a3
{
  void *v5;
  void *v6;
  SBAppLayout *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int64_t floatingConfiguration;
  uint64_t v19;
  SBMutableSwitcherTransitionRequest *v20;
  SBPerformTransitionSwitcherEventResponse *v21;

  -[SBHomeGestureFloatingSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  switch(a3)
  {
    case 0:
      v7 = self->_selectedAppLayout;
      v8 = 0;
      goto LABEL_4;
    case 1:
      v10 = objc_msgSend(v5, "indexOfObject:", self->_selectedAppLayout);
      v9 = 0x7FFFFFFFFFFFFFFFLL;
      if (v10 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_18;
      v11 = v10;
      if (!objc_msgSend(v6, "count"))
        goto LABEL_18;
      if (!v11)
      {
        objc_msgSend(v6, "lastObject");
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_27;
      }
      if (v11 <= 1)
        v12 = 1;
      else
        v12 = v11;
      v13 = v12 - 1;
      goto LABEL_17;
    case 2:
      v14 = objc_msgSend(v5, "indexOfObject:", self->_selectedAppLayout);
      v9 = 0x7FFFFFFFFFFFFFFFLL;
      if (v14 == 0x7FFFFFFFFFFFFFFFLL || (v15 = v14, !objc_msgSend(v6, "count")))
      {
LABEL_18:
        v8 = 0;
        v7 = 0;
      }
      else
      {
        v16 = objc_msgSend(v6, "count");
        if (v15 + 1 < v16 - 1)
          v13 = v15 + 1;
        else
          v13 = v16 - 1;
LABEL_17:
        objc_msgSend(v6, "objectAtIndex:", v13);
        v17 = objc_claimAutoreleasedReturnValue();
LABEL_27:
        v7 = (SBAppLayout *)v17;
        v8 = 0;
      }
LABEL_28:
      v20 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
      -[SBSwitcherTransitionRequest setAppLayout:](v20, "setAppLayout:", v7);
      -[SBSwitcherTransitionRequest setFloatingSwitcherVisible:](v20, "setFloatingSwitcherVisible:", v9);
      -[SBSwitcherTransitionRequest setFloatingConfiguration:](v20, "setFloatingConfiguration:", v8);
      v21 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:]([SBPerformTransitionSwitcherEventResponse alloc], "initWithTransitionRequest:gestureInitiated:", v20, 1);

      return v21;
    case 3:
      v7 = self->_selectedAppLayout;
      v8 = 0;
      v9 = 1;
      goto LABEL_28;
    case 4:
      floatingConfiguration = self->_floatingConfiguration;
      v19 = 4;
      if (floatingConfiguration != 2)
        v19 = 0;
      if (floatingConfiguration == 1)
        v8 = 3;
      else
        v8 = v19;
      v9 = 0x7FFFFFFFFFFFFFFFLL;
      v7 = 0;
      goto LABEL_28;
    default:
      v8 = 0;
      v7 = 0;
LABEL_4:
      v9 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_28;
  }
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBHomeGestureFloatingSwitcherModifier;
  -[SBHomeGestureFloatingSwitcherModifier adjustedAppLayoutsForAppLayouts:](&v16, sel_adjustedAppLayoutsForAppLayouts_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBGestureSwitcherModifier gesturePhase](self, "gesturePhase") != 3
    && (unint64_t)objc_msgSend(v4, "count") >= 5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "indexOfObject:", self->_selectedAppLayout);
    if (v7 == 0x7FFFFFFFFFFFFFFFLL || v7 == 0)
    {
      objc_msgSend(v6, "addObjectsFromArray:", v4);
    }
    else
    {
      v9 = v7;
      objc_msgSend(v4, "subarrayWithRange:", v9, objc_msgSend(v4, "count") - v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObjectsFromArray:", v10);

      objc_msgSend(v4, "subarrayWithRange:", 0, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObjectsFromArray:", v11);

    }
    objc_msgSend(v6, "subarrayWithRange:", 0, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    objc_msgSend(v6, "lastObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v14);

    v5 = v13;
  }

  return v5;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  __int128 v5;
  SBStackedFloatingSwitcherModifier *stackedLayoutModifier;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double x;
  double multitaskingHintProgress;
  void *v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  int v20;
  double v21;
  CGFloat v22;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v26;
  double v27;
  double v28;
  double v29;
  _QWORD v30[7];
  uint64_t v31;
  CGRect *v32;
  uint64_t v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  CGRect v37;
  CGRect result;

  v31 = 0;
  v32 = (CGRect *)&v31;
  v33 = 0x4010000000;
  v34 = &unk_1D0FA064E;
  v5 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v35 = *MEMORY[0x1E0C9D648];
  v36 = v5;
  stackedLayoutModifier = self->_stackedLayoutModifier;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __55__SBHomeGestureFloatingSwitcherModifier_frameForIndex___block_invoke;
  v30[3] = &unk_1E8E9FD08;
  v30[4] = self;
  v30[5] = &v31;
  v30[6] = a3;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", stackedLayoutModifier, v30);
  -[SBHomeGestureFloatingSwitcherModifier _frameOffsetForTranslation:](self, "_frameOffsetForTranslation:", self->_translation.x, self->_translation.y);
  v8 = v7;
  v10 = v9;
  if (!-[SBHomeGestureFloatingSwitcherModifier _isSelectedAppLayoutAtIndex:](self, "_isSelectedAppLayoutAtIndex:", a3)
    && self->_inMultitasking)
  {
    x = self->_translation.x;
    if (-[SBHomeGestureFloatingSwitcherModifier isRTLEnabled](self, "isRTLEnabled"))
      x = -x;
    multitaskingHintProgress = self->_multitaskingHintProgress;
    -[SBHomeGestureFloatingSwitcherModifier appLayouts](self, "appLayouts");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = x * -0.4;
    v15 = objc_msgSend(v13, "count") - 1;

    v16 = (v14 + -70.0) * multitaskingHintProgress + (1.0 - multitaskingHintProgress) * v14;
    if (x >= 0.0)
    {
      x = (v14 * 0.25 + -105.0) * multitaskingHintProgress + (1.0 - multitaskingHintProgress) * v14;
      v19 = x;
    }
    else
    {
      v17 = (v14 + -70.0) * multitaskingHintProgress + (1.0 - multitaskingHintProgress) * v14;
      if (v15 != 1)
      {
        v17 = (v14 + -70.0) * multitaskingHintProgress + (1.0 - multitaskingHintProgress) * v14;
        if (v16 > x)
        {
          BSUIConstrainValueWithRubberBand();
          v17 = x + v18;
        }
      }
      v19 = v16 + multitaskingHintProgress * -35.0;
      if (v19 <= x)
        x = v19;
      v16 = v17;
    }
    v20 = -[SBHomeGestureFloatingSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
    if (v15 == a3)
      v21 = v19;
    else
      v21 = x;
    if (a3 == 1)
      v21 = v16;
    if (v20)
      v8 = -v21;
    else
      v8 = v21;
  }
  v37 = CGRectOffset(v32[1], v8, v10);
  v22 = v37.origin.x;
  y = v37.origin.y;
  width = v37.size.width;
  height = v37.size.height;
  v32[1] = v37;
  _Block_object_dispose(&v31, 8);
  v26 = v22;
  v27 = y;
  v28 = width;
  v29 = height;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

uint64_t __55__SBHomeGestureFloatingSwitcherModifier_frameForIndex___block_invoke(_QWORD *a1)
{
  uint64_t result;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = objc_msgSend(*(id *)(a1[4] + 120), "frameForIndex:", a1[6]);
  v3 = *(_QWORD **)(a1[5] + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  double result;
  unint64_t v6;
  SBStackedFloatingSwitcherModifier *stackedLayoutModifier;
  double v8;
  double v9;
  _QWORD v10[7];
  uint64_t v11;
  double *v12;
  uint64_t v13;
  uint64_t v14;

  if (-[SBHomeGestureFloatingSwitcherModifier _isSelectedAppLayoutAtIndex:](self, "_isSelectedAppLayoutAtIndex:"))
  {
    -[SBHomeGestureFloatingSwitcherModifier _scaleForTranslation:](self, "_scaleForTranslation:", self->_translation.x, self->_translation.y);
  }
  else
  {
    v6 = 2;
    if (a3 < 2)
      v6 = a3;
    v11 = 0;
    v12 = (double *)&v11;
    v13 = 0x2020000000;
    v14 = 0x3FF0000000000000;
    stackedLayoutModifier = self->_stackedLayoutModifier;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __55__SBHomeGestureFloatingSwitcherModifier_scaleForIndex___block_invoke;
    v10[3] = &unk_1E8E9FD08;
    v10[4] = self;
    v10[5] = &v11;
    v10[6] = v6;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", stackedLayoutModifier, v10);
    -[SBHomeGestureFloatingSwitcherModifier _scaleForTranslation:](self, "_scaleForTranslation:", self->_translation.x, self->_translation.y);
    v9 = v8 * v12[3];
    v12[3] = v9;
    _Block_object_dispose(&v11, 8);
    return v9;
  }
  return result;
}

uint64_t __55__SBHomeGestureFloatingSwitcherModifier_scaleForIndex___block_invoke(_QWORD *a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1[4] + 120), "scaleForIndex:", a1[6]);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v3;
  return result;
}

- (id)visibleAppLayouts
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[SBHomeGestureFloatingSwitcherModifier appLayouts](self, "appLayouts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_msgSend(v4, "count") - 1;
    if (v5 >= 2)
      v5 = 2;
    objc_msgSend(v4, "subarrayWithRange:", 0, v5 + 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v6);

    objc_msgSend(v4, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  return v3;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  void *v3;
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
  UIRectCornerRadii result;

  -[SBHomeGestureFloatingSwitcherModifier medusaSettings](self, "medusaSettings", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cornerRadiusForFloatingApps");
  SBRectCornerRadiiForRadius();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.topRight = v15;
  result.bottomRight = v14;
  result.bottomLeft = v13;
  result.topLeft = v12;
  return result;
}

- (CGPoint)_frameOffsetForTranslation:(CGPoint)a3
{
  double x;
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
  CGPoint result;

  x = a3.x;
  v6 = *MEMORY[0x1E0C9D538];
  v5 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[SBHomeGestureFloatingSwitcherModifier _gestureProgressToMaxTranslationForTranslation:](self, "_gestureProgressToMaxTranslationForTranslation:", a3.y);
  v8 = v7;
  -[SBHomeGestureFloatingSwitcherModifier _centerYOffsetDuringGesture](self, "_centerYOffsetDuringGesture");
  v10 = v5 + v8 * v9 + 0.0;
  -[SBHomeGestureFloatingSwitcherModifier _scaleForTranslation:](self, "_scaleForTranslation:", self->_translation.x, self->_translation.y);
  v12 = v11;
  -[SBHomeGestureFloatingSwitcherModifier containerViewBounds](self, "containerViewBounds");
  v14 = x + v6 + self->_touchOffset.x / (v13 * 0.5) * ((v13 - v12 * v13) * 0.5);
  v15 = v10;
  result.y = v15;
  result.x = v14;
  return result;
}

- (double)_scaleForTranslation:(CGPoint)a3
{
  double v3;
  double result;
  double v5;
  double v6;

  -[SBHomeGestureFloatingSwitcherModifier _gestureProgressToMaxTranslationForTranslation:](self, "_gestureProgressToMaxTranslationForTranslation:", a3.y);
  result = 1.0 - v3;
  if (result < 0.0)
    result = 0.0;
  if (result >= 0.4)
  {
    if (result > 1.0)
    {
      BSUIConstrainValueWithRubberBand();
      return v6 + 1.0;
    }
  }
  else
  {
    BSUIConstrainValueWithRubberBand();
    return 0.4 - v5;
  }
  return result;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  return 1.0;
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  double x;
  double v9;
  double v10;
  int v11;
  double v12;
  void *v13;
  uint64_t v14;
  double result;
  double v16;

  v5 = a4;
  -[SBHomeGestureFloatingSwitcherModifier appLayouts](self, "appLayouts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObject:", v5);

  x = self->_translation.x;
  -[SBHomeGestureFloatingSwitcherModifier containerViewBounds](self, "containerViewBounds");
  v10 = v9;
  v11 = -[SBHomeGestureFloatingSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
  v12 = self->_translation.x;
  if (v11)
    v12 = -v12;
  if (v12 >= 0.0)
  {
    v14 = 1;
  }
  else
  {
    -[SBHomeGestureFloatingSwitcherModifier appLayouts](self, "appLayouts");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count") - 1;

  }
  result = 0.0;
  if (v7)
  {
    if (v7 == v14)
    {
      v16 = fmin(fmax(fabs(x) / (v10 / 1.5) + 0.0, 0.0), 1.0);
      return v16 * 0.0 + (1.0 - v16) * 0.05625;
    }
    else
    {
      return 0.075;
    }
  }
  return result;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  unint64_t v11;
  int v12;
  double x;

  if (!a4)
    return 1.0;
  if (!self->_inMultitasking)
    return 0.0;
  v6 = fabs(self->_translation.x);
  -[SBHomeGestureFloatingSwitcherModifier containerViewBounds](self, "containerViewBounds", a3);
  v8 = fmin(fmax(fmin(fmax(v6 / (v7 * 0.25) + 0.0, 0.0), 1.0) + self->_multitaskingHintProgress, 0.0), 1.0);
  v9 = v8 * 0.75 + (1.0 - v8) * 0.0;
  -[SBHomeGestureFloatingSwitcherModifier appLayouts](self, "appLayouts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11 >= 4)
  {
    v12 = -[SBHomeGestureFloatingSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
    x = self->_translation.x;
    if (v12)
      x = -x;
    if (x >= 0.0 && v11 - 1 == a4)
      return 0.0;
    if (x < 0.0 && v11 - 2 == a4)
      return 0.0;
  }
  return v9;
}

- (double)shadowOffsetForIndex:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double result;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  result = 0.0;
  if (!a3)
  {
    v16 = v8;
    v17 = v7;
    v18 = v6;
    v19 = v5;
    v20 = v3;
    v21 = v4;
    v11 = fabs(self->_translation.x);
    -[SBHomeGestureFloatingSwitcherModifier containerViewBounds](self, "containerViewBounds");
    v13 = fmin(fmax(fmin(fmax(v11 / (v12 * 0.25) + 0.0, 0.0), 1.0) + self->_multitaskingHintProgress, 0.0), 1.0);
    v15.receiver = self;
    v15.super_class = (Class)SBHomeGestureFloatingSwitcherModifier;
    -[SBHomeGestureFloatingSwitcherModifier shadowOffsetForIndex:](&v15, sel_shadowOffsetForIndex_, 0);
    return v13 * 0.0 + (1.0 - v13) * v14;
  }
  return result;
}

- (BOOL)isContentStatusBarVisibleForIndex:(unint64_t)a3
{
  return 0;
}

- (id)appLayoutsToCacheSnapshots
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  if (self->_selectedAppLayout)
  {
    -[SBHomeGestureFloatingSwitcherModifier appLayouts](self, "appLayouts");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "indexOfObject:", self->_selectedAppLayout);

  }
  else
  {
    v4 = 0;
  }
  -[SBHomeGestureFloatingSwitcherModifier switcherSettings](self, "switcherSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfSnapshotsToCacheInSwitcher");

  return -[SBSwitcherModifier appLayoutsToCacheSnapshotsWithVisibleRange:numberOfSnapshotsToCache:biasForward:](self, "appLayoutsToCacheSnapshotsWithVisibleRange:numberOfSnapshotsToCache:biasForward:", v4, 1, v6, 1);
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v23;
  objc_super v24;
  CAFrameRateRange v25;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SBHomeGestureFloatingSwitcherModifier;
  -[SBGestureSwitcherModifier animationAttributesForLayoutElement:](&v24, sel_animationAttributesForLayoutElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "switcherLayoutElementType"))
  {
    v6 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v5, "layoutSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHomeGestureFloatingSwitcherModifier _layoutSettingsForAppLayout:layoutSettings:](self, "_layoutSettingsForAppLayout:layoutSettings:", v4, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLayoutSettings:", v8);

    v5 = v6;
  }
  if (self->_rampingProperty && !objc_msgSend(v4, "switcherLayoutElementType"))
  {
    -[SBHomeGestureFloatingSwitcherModifier appLayouts](self, "appLayouts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");
    v11 = objc_msgSend(v9, "indexOfObject:", v4);
    if (v10 >= 2 && v11 == v10 - 1)
    {
      v12 = (void *)objc_msgSend(v5, "mutableCopy");
      objc_msgSend(v12, "layoutSettings");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E08]), "initWithDefaultValues");
      -[SBHomeGestureFloatingSwitcherModifier switcherSettings](self, "switcherSettings");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "animationSettings");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "arcSwipeSettings");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIViewFloatAnimatableProperty presentationValue](self->_rampingProperty, "presentationValue");
      v18 = v17;
      objc_msgSend(v16, "response");
      v20 = v19;
      objc_msgSend(v23, "trackingResponse");
      objc_msgSend(v13, "setTrackingResponse:", v18 * v21 + (1.0 - v18) * v20);
      objc_msgSend(v16, "dampingRatio");
      objc_msgSend(v13, "setTrackingDampingRatio:");
      v25 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
      objc_msgSend(v13, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v25.minimum, *(double *)&v25.maximum, *(double *)&v25.preferred);
      objc_msgSend(v12, "setLayoutSettings:", v13);

      v5 = v12;
    }

  }
  return v5;
}

- (id)_layoutSettingsForAppLayout:(id)a3 layoutSettings:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CAFrameRateRange v24;

  v6 = a4;
  if (-[SBAppLayout isEqual:](self->_selectedAppLayout, "isEqual:", a3) || !self->_inMultitaskingChangedProperty)
  {
    v10 = v6;
  }
  else
  {
    -[SBHomeGestureFloatingSwitcherModifier switcherSettings](self, "switcherSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "animationSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cardFlyInSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_alloc_init(MEMORY[0x1E0DA9E08]);
    objc_msgSend(v10, "setDefaultValues");
    if (self->_inMultitasking)
    {
      -[UIViewFloatAnimatableProperty presentationValue](self->_inMultitaskingChangedProperty, "presentationValue");
      v12 = v11;
      v13 = fabs(self->_translation.x);
      -[SBHomeGestureFloatingSwitcherModifier containerViewBounds](self, "containerViewBounds");
      v15 = fmax(v13 / v14 + 0.0, 0.0);
      if (v15 >= 1.0)
        v16 = 0.0;
      else
        v16 = 1.0 - v15;
      v17 = fmin(fmax(1.0 - (1.0 - v12) * v16, 0.0), 1.0);
    }
    else
    {
      v17 = 0.0;
    }
    objc_msgSend(v6, "trackingResponse");
    v19 = v18;
    objc_msgSend(v9, "response");
    v21 = v17 * (v19 - v20);
    objc_msgSend(v9, "response");
    objc_msgSend(v10, "setTrackingResponse:", v22 + v21);
    objc_msgSend(v6, "dampingRatio");
    objc_msgSend(v10, "setTrackingDampingRatio:");
    v24 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    objc_msgSend(v10, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v24.minimum, *(double *)&v24.maximum, *(double *)&v24.preferred);

  }
  return v10;
}

- (id)appLayoutsToResignActive
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = (void *)MEMORY[0x1E0C99E60];
  -[SBHomeGestureFloatingSwitcherModifier appLayouts](self, "appLayouts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithObject:forKey:", v5, &unk_1E91D1670);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)keyboardSuppressionMode
{
  return +[SBSwitcherKeyboardSuppressionMode suppressionModeForAllScenes](SBSwitcherKeyboardSuppressionMode, "suppressionModeForAllScenes");
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  return (SBSwitcherAsyncRenderingAttributes)SBSwitcherAsyncRenderingAttributesMake(1u, 1);
}

- (unint64_t)slideOverTongueState
{
  return 0;
}

- (unint64_t)slideOverTongueDirection
{
  if (SBFloatingConfigurationIsLeft(self->_floatingConfiguration))
    return 2;
  else
    return 1;
}

- (id)appLayoutToAttachSlideOverTongue
{
  return self->_selectedAppLayout;
}

- (id)_updateInMultitaskingIfNeededWithEvent:(id)a3
{
  id v4;
  SBSwitcherModifierEventResponse *v5;
  int inMultitasking;
  double v7;
  double v8;
  double v9;
  double v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = objc_alloc_init(SBSwitcherModifierEventResponse);
  inMultitasking = self->_inMultitasking;
  objc_msgSend(v4, "locationInContainerView");
  v8 = v7;
  v10 = v9;

  v11 = -[SBHomeGestureFloatingSwitcherModifier _inMultitaskingForLocation:translation:](self, "_inMultitaskingForLocation:translation:", v8, v10, self->_translation.x, self->_translation.y);
  self->_inMultitasking = v11;
  if (inMultitasking != v11)
  {
    if (v11)
    {
      self->_hasTriggeredCardFlyIn = 1;
      self->_translationYWhenTriggeredCardFlyIn = self->_translation.y;
    }
    -[SBHomeGestureFloatingSwitcherModifier switcherSettings](self, "switcherSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "animationSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layoutSettings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHomeGestureFloatingSwitcherModifier _beginAnimatingMultitaskingPropertyWithMode:settings:](self, "_beginAnimatingMultitaskingPropertyWithMode:settings:", 3, v14);

  }
  return v5;
}

- (BOOL)_hasPausedEnoughForFlyIn
{
  double v4;

  if (-[SBHomeGestureFinalDestinationSwitcherModifier hasSeenAccelerationDipForAppSwitcher](self->_finalDestinationModifier, "hasSeenAccelerationDipForAppSwitcher"))
  {
    return 1;
  }
  v4 = *(double *)&kCardFlyInDelayAfterEnteringAppSwitcher_0;
  return self->_gestureHoldTimer > (unint64_t)(v4 * SBScreenMaximumFramesPerSecond());
}

- (BOOL)_hasTraveledSufficientDistanceForHomeOrAppSwitcher
{
  double v3;

  -[SBHomeGestureFloatingSwitcherModifier containerViewBounds](self, "containerViewBounds");
  return self->_lastTouchLocation.y <= v3 - *(double *)&kMinimumYDistanceForHomeOrAppSwitcher_1;
}

- (void)_displayLinkFired:(id)a3
{
  int64_t v4;
  BOOL v5;

  if (-[SBGestureSwitcherModifier gesturePhase](self, "gesturePhase", a3) == 2)
  {
    -[SBHomeGestureFloatingSwitcherModifier gestureHandlingModifier:averageVelocityOverDuration:](self, "gestureHandlingModifier:averageVelocityOverDuration:", self, 0.0416666667);
    v4 = -[SBHomeGestureFinalDestinationSwitcherModifier currentFinalDestination](self->_finalDestinationModifier, "currentFinalDestination");
    if (v4)
      v5 = v4 == 4;
    else
      v5 = 1;
    if (v5)
    {
      self->_gestureHoldTimer = 0;
    }
    else if (v4 == 3 && BSFloatLessThanFloat())
    {
      ++self->_gestureHoldTimer;
    }
    if (!self->_inMultitasking)
    {
      if (-[SBHomeGestureFloatingSwitcherModifier _hasPausedEnoughForFlyIn](self, "_hasPausedEnoughForFlyIn"))
        -[SBHomeGestureFloatingSwitcherModifier gestureHandlingModifierRequestsUpdate:](self, "gestureHandlingModifierRequestsUpdate:", self);
    }
  }
}

- (void)_beginAnimatingMultitaskingPropertyWithMode:(int64_t)a3 settings:(id)a4
{
  id v6;
  UIViewFloatAnimatableProperty *inMultitaskingChangedProperty;
  UIViewFloatAnimatableProperty *v8;
  UIViewFloatAnimatableProperty *v9;
  UIViewFloatAnimatableProperty *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  id v15;
  UIViewFloatAnimatableProperty *v16;
  void *v17;
  UIViewFloatAnimatableProperty *v18;
  _QWORD v19[4];
  UIViewFloatAnimatableProperty *v20;
  id v21;
  _QWORD v22[5];
  id location;

  v6 = a4;
  inMultitaskingChangedProperty = self->_inMultitaskingChangedProperty;
  if (inMultitaskingChangedProperty)
  {
    -[UIViewFloatAnimatableProperty invalidate](inMultitaskingChangedProperty, "invalidate");
    v8 = self->_inMultitaskingChangedProperty;
    self->_inMultitaskingChangedProperty = 0;

  }
  v9 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E0CEABC0]);
  v10 = self->_inMultitaskingChangedProperty;
  self->_inMultitaskingChangedProperty = v9;

  -[UIViewFloatAnimatableProperty setValue:](self->_inMultitaskingChangedProperty, "setValue:", 0.0);
  v11 = (void *)objc_msgSend(v6, "copy");
  LODWORD(v12) = *MEMORY[0x1E0CD23C0];
  LODWORD(v13) = *(_DWORD *)(MEMORY[0x1E0CD23C0] + 4);
  LODWORD(v14) = *(_DWORD *)(MEMORY[0x1E0CD23C0] + 8);
  objc_msgSend(v11, "setFrameRateRange:highFrameRateReason:", 0, v12, v13, v14);
  v15 = v11;

  objc_initWeak(&location, self);
  v16 = self->_inMultitaskingChangedProperty;
  v17 = (void *)MEMORY[0x1E0CEABB0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __94__SBHomeGestureFloatingSwitcherModifier__beginAnimatingMultitaskingPropertyWithMode_settings___block_invoke;
  v22[3] = &unk_1E8E9DED8;
  v22[4] = self;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __94__SBHomeGestureFloatingSwitcherModifier__beginAnimatingMultitaskingPropertyWithMode_settings___block_invoke_2;
  v19[3] = &unk_1E8EA6DD8;
  objc_copyWeak(&v21, &location);
  v18 = v16;
  v20 = v18;
  objc_msgSend(v17, "sb_animateWithSettings:mode:animations:completion:", v15, a3, v22, v19);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

uint64_t __94__SBHomeGestureFloatingSwitcherModifier__beginAnimatingMultitaskingPropertyWithMode_settings___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "setValue:", 1.0);
}

void __94__SBHomeGestureFloatingSwitcherModifier__beginAnimatingMultitaskingPropertyWithMode_settings___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  void *v4;
  id v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v3 = WeakRetained[26];
    v4 = v3;
    if (v3 && v3 == *(id *)(a1 + 32))
    {
      v5 = v6[26];
      v6[26] = 0;

    }
    WeakRetained = v6;
  }

}

- (BOOL)_inMultitaskingForLocation:(CGPoint)a3 translation:(CGPoint)a4
{
  double y;
  double x;
  _BOOL4 inMultitasking;
  int64_t v8;
  char v10;
  void *v11;
  uint64_t v12;
  char v14;
  char v15;
  char v16;

  y = a4.y;
  x = a4.x;
  inMultitasking = self->_inMultitasking;
  v8 = -[SBHomeGestureFinalDestinationSwitcherModifier currentFinalDestination](self->_finalDestinationModifier, "currentFinalDestination", a3.x, a3.y);
  v10 = inMultitasking || (unint64_t)(v8 - 1) < 2;
  -[SBHomeGestureFloatingSwitcherModifier appLayouts](self, "appLayouts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (fabs(x) <= fabs(y) || v8 == 4)
    v14 = v10;
  else
    v14 = 1;
  if (v12)
    v15 = v14;
  else
    v15 = v10;
  v16 = -[SBHomeGestureFloatingSwitcherModifier _hasPausedEnoughForFlyIn](self, "_hasPausedEnoughForFlyIn") | v15;
  return v16 & ~-[SBHomeGestureFloatingSwitcherModifier _isTranslationPastDistanceThresholdToUnconditionallyGoHome:](self, "_isTranslationPastDistanceThresholdToUnconditionallyGoHome:", y);
}

- (BOOL)_isTranslationPastDistanceThresholdToUnconditionallyGoHome:(double)a3
{
  double v3;
  double v4;

  v3 = -a3;
  -[SBHomeGestureFloatingSwitcherModifier unconditionalDistanceThresholdForHome](self, "unconditionalDistanceThresholdForHome");
  return v4 < v3;
}

- (double)_gestureProgressToMaxTranslationForTranslation:(double)a3
{
  double v4;

  -[SBHomeGestureFloatingSwitcherModifier _distanceYToMaxTranslation](self, "_distanceYToMaxTranslation");
  return -a3 / v4;
}

- (double)_distanceYToInSwitcherCardScale
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[SBHomeGestureFloatingSwitcherModifier _switcherCardScale](self, "_switcherCardScale");
  v4 = v3;
  -[SBHomeGestureFloatingSwitcherModifier _inSwitcherCenterYOffsetWhenPresented](self, "_inSwitcherCenterYOffsetWhenPresented");
  v6 = v5;
  -[SBHomeGestureFloatingSwitcherModifier containerViewBounds](self, "containerViewBounds");
  return (1.0 - v4) * v7 * 0.5 - v6;
}

- (double)_distanceYToMaxTranslation
{
  double v3;
  double v4;
  double v5;

  -[SBHomeGestureFloatingSwitcherModifier containerViewBounds](self, "containerViewBounds");
  v4 = v3;
  -[SBHomeGestureFloatingSwitcherModifier _centerYOffsetDuringGesture](self, "_centerYOffsetDuringGesture");
  return v4 * 0.5 - v5;
}

- (double)_inSwitcherCenterYOffsetWhenPresented
{
  void *v3;
  double result;

  -[SBHomeGestureFloatingSwitcherModifier switcherSettings](self, "switcherSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "switcherCenterYOffsetPercentOfScreenHeight");

  -[SBHomeGestureFloatingSwitcherModifier containerViewBounds](self, "containerViewBounds");
  -[SBHomeGestureFloatingSwitcherModifier screenScale](self, "screenScale");
  BSFloatRoundForScale();
  return result;
}

- (double)_centerYOffsetDuringGesture
{
  void *v3;
  double v4;
  double v5;

  -[SBHomeGestureFloatingSwitcherModifier homeGestureSettings](self, "homeGestureSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeGestureCenterZoomDownCenterYOffsetFactor");
  -[SBHomeGestureFloatingSwitcherModifier containerViewBounds](self, "containerViewBounds");
  -[SBHomeGestureFloatingSwitcherModifier screenScale](self, "screenScale");
  BSFloatRoundForScale();
  v5 = v4;

  return v5;
}

- (double)_switcherCardScale
{
  void *v2;
  double v3;
  double v4;

  -[SBHomeGestureFloatingSwitcherModifier switcherSettings](self, "switcherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deckSwitcherPageScale");
  v4 = v3;

  return v4;
}

- (unint64_t)_selectedAppLayoutIndex
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[SBHomeGestureFloatingSwitcherModifier appLayouts](self, "appLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && self->_selectedAppLayout)
    v5 = objc_msgSend(v3, "indexOfObject:");
  else
    v5 = 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

- (BOOL)_isSelectedAppLayoutAtIndex:(unint64_t)a3
{
  SBHomeGestureFloatingSwitcherModifier *v4;
  void *v5;
  void *v6;

  v4 = self;
  -[SBHomeGestureFloatingSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isEqual:", v4->_selectedAppLayout);
  return (char)v4;
}

- (void)_applyPrototypeSettings
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  uint64_t v8;
  id v9;

  v3 = SBMainScreenPointsPerMillimeter();
  -[SBHomeGestureFloatingSwitcherModifier homeGestureSettings](self, "homeGestureSettings");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "normalizedDistanceYThresholdForUnconditionalHomeInSlideOver");
  kHomeGestureNormalizedDistanceYThresholdForUnconditionalHome_0 = v4;
  objc_msgSend(v9, "normalizedDistanceYThresholdRangeForUnconditionalHomeInSlideOver");
  kHomeGestureNormalizedDistanceYThresholdRangeForUnconditionalHome_0 = v5;
  objc_msgSend(v9, "pauseVelocityThresholdForAppSwitcher");
  objc_msgSend(v9, "velocityXThresholdForUnconditionalArcSwipe");
  objc_msgSend(v9, "minimumYDistanceForHomeOrAppSwitcher");
  *(double *)&kMinimumYDistanceForHomeOrAppSwitcher_1 = v3 * v6;
  objc_msgSend(v9, "cardFlyInMaximumVelocityThreshold");
  *(double *)&kCardFlyInMaximumVelocityThreshold_0 = v3 * v7;
  objc_msgSend(v9, "cardFlyInDelayAfterEnteringAppSwitcher");
  kCardFlyInDelayAfterEnteringAppSwitcher_0 = v8;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_inMultitaskingChangedProperty, 0);
  objc_storeStrong((id *)&self->_rampingProperty, 0);
  objc_storeStrong((id *)&self->_selectedAppLayout, 0);
  objc_storeStrong((id *)&self->_dismissSiriModifier, 0);
  objc_storeStrong((id *)&self->_finalDestinationModifier, 0);
  objc_storeStrong((id *)&self->_stackedLayoutModifier, 0);
}

@end
