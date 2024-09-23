@implementation SBContinuousExposeHomeGestureRootSwitcherModifier

- (SBContinuousExposeHomeGestureRootSwitcherModifier)initWithStartingEnvironmentMode:(int64_t)a3 multitaskingModifier:(id)a4
{
  id v8;
  SBContinuousExposeHomeGestureRootSwitcherModifier *v9;
  void *v11;
  objc_super v12;

  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBContinuousExposeHomeGestureRootSwitcherModifier;
  v9 = -[SBGestureRootSwitcherModifier initWithStartingEnvironmentMode:](&v12, sel_initWithStartingEnvironmentMode_, a3);
  if (v9)
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("SBContinuousExposeHomeGestureRootSwitcherModifier.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("multitaskingModifier"));

    }
    objc_storeStrong((id *)&v9->_multitaskingModifier, a4);
  }

  return v9;
}

- (int64_t)gestureType
{
  return 1;
}

- (id)gestureChildModifierForGestureEvent:(id)a3 activeTransitionModifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int64_t v9;
  char isKindOfClass;
  _BOOL8 v11;
  SBReduceMotionHomeGestureSwitcherModifier *v12;
  void *v13;
  SBReduceMotionHomeGestureSwitcherModifier *v14;
  SBContinuousExposeHomeGestureSwitcherModifier *v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  -[SBGestureRootSwitcherModifier selectedAppLayout](self, "selectedAppLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SBGestureRootSwitcherModifier currentEnvironmentMode](self, "currentEnvironmentMode");
  if (v7)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    isKindOfClass = 0;
  }
  v11 = objc_msgSend(v6, "type") == 3;
  if (-[SBContinuousExposeHomeGestureRootSwitcherModifier isReduceMotionEnabled](self, "isReduceMotionEnabled"))
  {
    v12 = [SBReduceMotionHomeGestureSwitcherModifier alloc];
    objc_msgSend(v6, "gestureID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SBReduceMotionHomeGestureSwitcherModifier initWithGestureID:selectedAppLayout:startingEnvironmentMode:scrunchInitiated:continuingGesture:lastGestureWasAnArcSwipe:](v12, "initWithGestureID:selectedAppLayout:startingEnvironmentMode:scrunchInitiated:continuingGesture:lastGestureWasAnArcSwipe:", v13, v8, v9, v11, v7 != 0, isKindOfClass & 1);

    -[SBReduceMotionHomeGestureSwitcherModifier setShouldProvideBlur:](v14, "setShouldProvideBlur:", -[SBContinuousExposeHomeGestureRootSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled") ^ 1);
    -[SBReduceMotionHomeGestureSwitcherModifier setLaysOutNeighboringCards:](v14, "setLaysOutNeighboringCards:", -[SBContinuousExposeHomeGestureRootSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled") ^ 1);
  }
  else
  {
    v15 = [SBContinuousExposeHomeGestureSwitcherModifier alloc];
    objc_msgSend(v6, "gestureID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SBContinuousExposeHomeGestureSwitcherModifier initWithGestureID:selectedAppLayout:startingEnvironmentMode:scrunchInitiated:continuingGesture:lastGestureWasAnArcSwipe:](v15, "initWithGestureID:selectedAppLayout:startingEnvironmentMode:scrunchInitiated:continuingGesture:lastGestureWasAnArcSwipe:", v16, v8, v9, v11, v7 != 0, isKindOfClass & 1);

    -[SBReduceMotionHomeGestureSwitcherModifier setProvidesHomeScreenDimmingAlpha:](v14, "setProvidesHomeScreenDimmingAlpha:", -[SBContinuousExposeHomeGestureRootSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled") ^ 1);
  }

  return v14;
}

- (id)handleGestureEvent:(id)a3
{
  id v5;
  void *v6;
  NSArray *v7;
  NSArray *initiallyVisibleAppLayouts;
  void *v9;
  objc_super v11;
  objc_super v12;

  v5 = a3;
  objc_storeStrong((id *)&self->_lastGestureEvent, a3);
  if (objc_msgSend(v5, "phase") == 1)
  {
    v12.receiver = self;
    v12.super_class = (Class)SBContinuousExposeHomeGestureRootSwitcherModifier;
    -[SBContinuousExposeHomeGestureRootSwitcherModifier visibleAppLayouts](&v12, sel_visibleAppLayouts);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (NSArray *)objc_msgSend(v6, "copy");
    initiallyVisibleAppLayouts = self->_initiallyVisibleAppLayouts;
    self->_initiallyVisibleAppLayouts = v7;

  }
  v11.receiver = self;
  v11.super_class = (Class)SBContinuousExposeHomeGestureRootSwitcherModifier;
  -[SBGestureRootSwitcherModifier handleGestureEvent:](&v11, sel_handleGestureEvent_, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)transitionChildModifierForMainTransitionEvent:(id)a3 activeGestureModifier:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int64_t v13;
  int v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  double v24;
  double v25;
  double v26;
  double v27;
  SBHomeGestureToHomeSwitcherModifier *v28;
  void *v29;
  uint64_t v30;
  SBContinuousExposeArcSwipeSwitcherModifier *v31;
  SBFullScreenToHomePIPSwitcherModifier *v32;
  void *v33;
  void *v34;
  SBHomeGestureToSwitcherSwitcherModifier *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  SBFullScreenToHomeSystemApertureSwitcherModifier *v48;
  SBHomeGestureToZoomDownSwitcherModifier *v49;
  void *v50;
  void *v51;
  SBFullScreenToHomeSystemApertureSwitcherModifier *v52;
  uint64_t v53;
  double v54;
  double v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  void *v63;
  int64_t v64;
  int64_t v65;
  void *v66;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, "toEnvironmentMode");
  v10 = objc_msgSend(v7, "fromEnvironmentMode");
  objc_msgSend(v7, "transitionID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBGestureRootSwitcherModifier selectedAppLayout](self, "selectedAppLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[SBGestureRootSwitcherModifier currentEnvironmentMode](self, "currentEnvironmentMode");
  v14 = -[SBContinuousExposeHomeGestureRootSwitcherModifier isReduceMotionEnabled](self, "isReduceMotionEnabled");
  if ((v14 & 1) != 0)
  {
    v15 = 0;
    v16 = *MEMORY[0x1E0C9D538];
    v17 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v18 = v17;
    v19 = *MEMORY[0x1E0C9D538];
  }
  else
  {
    v64 = v13;
    v20 = v11;
    v21 = v12;
    v22 = v10;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuousExposeHomeGestureRootSwitcherModifier.m"), 102, CFSTR("If reduce motion is disabled, the gesture modifier should be an instance of SBHomeGestureSwitcherModifier"));

    }
    v23 = v8;
    if (objc_msgSend(v23, "isShowingOrAnimatingCardsForFlyIn"))
      v15 = -[SBContinuousExposeHomeGestureRootSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled") ^ 1;
    else
      v15 = 0;
    objc_msgSend(v23, "liftOffVelocityForGestureEnd", v64, v7);
    v19 = v24;
    v18 = v25;
    objc_msgSend(v23, "liftOffTranslationForGestureEnd");
    v16 = v26;
    v17 = v27;

    v10 = v22;
    v12 = v21;
    v11 = v20;
    v13 = v65;
    v7 = v66;
  }
  switch(v9)
  {
    case 3:
      v31 = [SBContinuousExposeArcSwipeSwitcherModifier alloc];
      objc_msgSend(v7, "fromAppLayout");
      v32 = (SBFullScreenToHomePIPSwitcherModifier *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "toAppLayout");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBGestureRootSwitcherModifier selectedAppLayout](self, "selectedAppLayout");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[SBContinuousExposeArcSwipeSwitcherModifier initWithTransitionID:fromAppLayout:toAppLayout:selectedAppLayout:initialVisibleAppLayouts:pinSpaceCornerRadiiToDisplayCornerRadii:](v31, "initWithTransitionID:fromAppLayout:toAppLayout:selectedAppLayout:initialVisibleAppLayouts:pinSpaceCornerRadiiToDisplayCornerRadii:", v11, v32, v33, v34, self->_initiallyVisibleAppLayouts, -[SBContinuousExposeHomeGestureRootSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled") ^ 1);

      break;
    case 2:
      v32 = -[SBContinuousExposeHomeGestureRootSwitcherModifier _newMultitaskingModifier](self, "_newMultitaskingModifier");
      v35 = -[SBHomeGestureToSwitcherSwitcherModifier initWithTransitionID:multitaskingModifier:selectedAppLayout:startingEnvironmentMode:liftOffVelocity:liftOffTranslation:adjustAppLayoutsBeforeTransition:keepSelectedAppLayoutAsTopMostElement:]([SBHomeGestureToSwitcherSwitcherModifier alloc], "initWithTransitionID:multitaskingModifier:selectedAppLayout:startingEnvironmentMode:liftOffVelocity:liftOffTranslation:adjustAppLayoutsBeforeTransition:keepSelectedAppLayoutAsTopMostElement:", v11, v32, v12, v13, -[SBContinuousExposeHomeGestureRootSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled"), -[SBContinuousExposeHomeGestureRootSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled"), v19, v18, v16, v17);
      -[SBHomeGestureToSwitcherSwitcherModifier setHidEventSenderID:](v35, "setHidEventSenderID:", -[SBGestureSwitcherModifierEvent hidEventSenderID](self->_lastGestureEvent, "hidEventSenderID"));
      break;
    case 1:
      if (v10 == 1)
      {
        v28 = [SBHomeGestureToHomeSwitcherModifier alloc];
        v29 = v11;
        v30 = v15;
LABEL_33:
        v35 = -[SBHomeGestureToHomeSwitcherModifier initWithTransitionID:showingOrAnimatingCardsForFlyIn:](v28, "initWithTransitionID:showingOrAnimatingCardsForFlyIn:", v29, v30);
        goto LABEL_37;
      }
      if (objc_msgSend(v7, "isMorphToPIPTransition"))
      {
        if (v12)
        {
          v32 = -[SBFullScreenToHomePIPSwitcherModifier initWithTransitionID:appLayout:layoutRole:]([SBFullScreenToHomePIPSwitcherModifier alloc], "initWithTransitionID:appLayout:layoutRole:", v11, v12, objc_msgSend(v7, "morphingPIPLayoutRole"));
          if (-[SBContinuousExposeHomeGestureRootSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled"))-[SBFullScreenToHomePIPSwitcherModifier setShouldForceDefaultAnchorPointForTransition:](v32, "setShouldForceDefaultAnchorPointForTransition:", 1);
          v35 = -[SBHomeGestureToZoomDownSwitcherModifier initWithTransitionID:appLayout:nonGestureInitiatedZoomModifier:effectiveStartingEnvironmentMode:liftOffVelocity:adjustAnimationAttributes:]([SBHomeGestureToZoomDownSwitcherModifier alloc], "initWithTransitionID:appLayout:nonGestureInitiatedZoomModifier:effectiveStartingEnvironmentMode:liftOffVelocity:adjustAnimationAttributes:", v11, v12, v32, v10, 1, v19, v18);
          break;
        }
LABEL_32:
        v28 = [SBHomeGestureToHomeSwitcherModifier alloc];
        v29 = v11;
        v30 = 1;
        goto LABEL_33;
      }
      if (-[SBSwitcherModifier shouldZoomToSystemApertureForEvent:activeLayout:](self, "shouldZoomToSystemApertureForEvent:activeLayout:", v7, v12))
      {
        if (!v12)
          goto LABEL_32;
        -[SBContinuousExposeHomeGestureRootSwitcherModifier appLayouts](self, "appLayouts");
        v36 = v10;
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "indexOfObject:", v12);

        -[SBContinuousExposeHomeGestureRootSwitcherModifier frameForIndex:](self, "frameForIndex:", v38);
        v40 = v39;
        v42 = v41;
        v44 = v43;
        v46 = v45;
        -[SBContinuousExposeHomeGestureRootSwitcherModifier scaleForIndex:](self, "scaleForIndex:", v38);
        v48 = -[SBFullScreenToHomeSystemApertureSwitcherModifier initWithTransitionID:zoomModifier:appLayout:direction:expandedCardFrame:cardScale:cardVelocity:]([SBFullScreenToHomeSystemApertureSwitcherModifier alloc], "initWithTransitionID:zoomModifier:appLayout:direction:expandedCardFrame:cardScale:cardVelocity:", v11, 0, v12, 1, v40, v42, v44, v46, v47, v19, v18);
        v49 = [SBHomeGestureToZoomDownSwitcherModifier alloc];
        v50 = v11;
        v51 = v12;
        v52 = v48;
        v53 = v36;
        v54 = v19;
        v55 = v18;
        v56 = 0;
      }
      else
      {
        if (objc_msgSend(v7, "isIconZoomDisabled"))
        {
          v57 = *MEMORY[0x1E0C9D628];
          v58 = *(_QWORD *)(MEMORY[0x1E0C9D628] + 8);
          v59 = *(_QWORD *)(MEMORY[0x1E0C9D628] + 16);
          v60 = *(_QWORD *)(MEMORY[0x1E0C9D628] + 24);
        }
        else
        {
          -[SBContinuousExposeHomeGestureRootSwitcherModifier homeScreenIconFrameForAppLayout:](self, "homeScreenIconFrameForAppLayout:", v12);
        }
        if (((v14 | CGRectIsNull(*(CGRect *)&v57)) & 1) != 0)
        {
          if (!v12)
            goto LABEL_32;
          -[SBContinuousExposeHomeGestureRootSwitcherModifier homeGestureSettings](self, "homeGestureSettings");
          v48 = (SBFullScreenToHomeSystemApertureSwitcherModifier *)objc_claimAutoreleasedReturnValue();
          -[SBFullScreenToHomeSystemApertureSwitcherModifier homeGestureCenterZoomDownCenterYOffsetFactor](v48, "homeGestureCenterZoomDownCenterYOffsetFactor");
          v35 = -[SBFullScreenToHomeCenterZoomDownSwitcherModifier initWithTransitionID:appLayout:offsetYPercentOfScreenHeight:]([SBFullScreenToHomeCenterZoomDownSwitcherModifier alloc], "initWithTransitionID:appLayout:offsetYPercentOfScreenHeight:", v11, v12, v61);
          -[SBHomeGestureToSwitcherSwitcherModifier setShouldForceDefaultAnchorPointForTransition:](v35, "setShouldForceDefaultAnchorPointForTransition:", 1);
LABEL_36:

          goto LABEL_37;
        }
        v48 = -[SBFullScreenToHomeIconZoomSwitcherModifier initWithTransitionID:appLayout:direction:]([SBFullScreenToHomeIconZoomSwitcherModifier alloc], "initWithTransitionID:appLayout:direction:", v11, v12, 1);
        -[SBFullScreenToHomeSystemApertureSwitcherModifier setShouldForceDefaultAnchorPointForTransition:](v48, "setShouldForceDefaultAnchorPointForTransition:", 1);
        -[SBFullScreenToHomeSystemApertureSwitcherModifier setShouldDockOrderFrontDuringTransition:](v48, "setShouldDockOrderFrontDuringTransition:", 1);
        v49 = [SBHomeGestureToZoomDownSwitcherModifier alloc];
        v50 = v11;
        v51 = v12;
        v52 = v48;
        v53 = v10;
        v54 = v19;
        v55 = v18;
        v56 = 1;
      }
      v35 = -[SBHomeGestureToZoomDownSwitcherModifier initWithTransitionID:appLayout:nonGestureInitiatedZoomModifier:effectiveStartingEnvironmentMode:liftOffVelocity:adjustAnimationAttributes:](v49, "initWithTransitionID:appLayout:nonGestureInitiatedZoomModifier:effectiveStartingEnvironmentMode:liftOffVelocity:adjustAnimationAttributes:", v50, v51, v52, v53, v56, v54, v55);
      goto LABEL_36;
    default:
      v35 = 0;
      goto LABEL_37;
  }

LABEL_37:
  return v35;
}

- (BOOL)wantsAsynchronousSurfaceRetentionAssertion
{
  return 1;
}

- (id)_newMultitaskingModifier
{
  return (id)-[SBSwitcherModifier copy](self->_multitaskingModifier, "copy");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastGestureEvent, 0);
  objc_storeStrong((id *)&self->_initiallyVisibleAppLayouts, 0);
  objc_storeStrong((id *)&self->_multitaskingModifier, 0);
}

@end
