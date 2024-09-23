@implementation SBHomeGestureRootSwitcherModifier

- (SBHomeGestureRootSwitcherModifier)initWithStartingEnvironmentMode:(int64_t)a3 multitaskingModifier:(id)a4
{
  id v8;
  SBHomeGestureRootSwitcherModifier *v9;
  void *v11;
  objc_super v12;

  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBHomeGestureRootSwitcherModifier;
  v9 = -[SBGestureRootSwitcherModifier initWithStartingEnvironmentMode:](&v12, sel_initWithStartingEnvironmentMode_, a3);
  if (v9)
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("SBHomeGestureRootSwitcherModifier.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("multitaskingModifier"));

    }
    objc_storeStrong((id *)&v9->_multitaskingModifier, a4);
  }

  return v9;
}

- (int64_t)gestureType
{
  return 1;
}

- (id)handleGestureEvent:(id)a3
{
  id v5;
  void *v6;
  objc_super v8;

  objc_storeStrong((id *)&self->_lastGestureEvent, a3);
  v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBHomeGestureRootSwitcherModifier;
  -[SBGestureRootSwitcherModifier handleGestureEvent:](&v8, sel_handleGestureEvent_, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)gestureChildModifierForGestureEvent:(id)a3 activeTransitionModifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int64_t v9;
  char isKindOfClass;
  uint64_t v11;
  SBReduceMotionHomeGestureSwitcherModifier *v12;
  void *v13;
  SBReduceMotionHomeGestureSwitcherModifier *v14;
  id v15;
  SBHomeGestureSwitcherModifier *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  _BOOL4 v21;

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
  v11 = objc_msgSend(v6, "type");
  if (-[SBHomeGestureRootSwitcherModifier isReduceMotionEnabled](self, "isReduceMotionEnabled"))
  {
    v12 = [SBReduceMotionHomeGestureSwitcherModifier alloc];
    objc_msgSend(v6, "gestureID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SBReduceMotionHomeGestureSwitcherModifier initWithGestureID:selectedAppLayout:startingEnvironmentMode:scrunchInitiated:continuingGesture:lastGestureWasAnArcSwipe:](v12, "initWithGestureID:selectedAppLayout:startingEnvironmentMode:scrunchInitiated:continuingGesture:lastGestureWasAnArcSwipe:", v13, v8, v9, v11 == 3, v7 != 0, isKindOfClass & 1);

    -[SBReduceMotionHomeGestureSwitcherModifier setShouldProvideBlur:](v14, "setShouldProvideBlur:", -[SBHomeGestureRootSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled") ^ 1);
    -[SBReduceMotionHomeGestureSwitcherModifier setLaysOutNeighboringCards:](v14, "setLaysOutNeighboringCards:", -[SBHomeGestureRootSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled") ^ 1);
  }
  else
  {
    v21 = v11 == 3;
    v15 = -[SBHomeGestureRootSwitcherModifier _newMultitaskingModifier](self, "_newMultitaskingModifier");
    v16 = [SBHomeGestureSwitcherModifier alloc];
    objc_msgSend(v6, "gestureID");
    v17 = v8;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v20) = isKindOfClass & 1;
    v14 = -[SBHomeGestureSwitcherModifier initWithGestureID:selectedAppLayout:startingEnvironmentMode:multitaskingModifier:scrunchInitiated:continuingGesture:lastGestureWasAnArcSwipe:](v16, "initWithGestureID:selectedAppLayout:startingEnvironmentMode:multitaskingModifier:scrunchInitiated:continuingGesture:lastGestureWasAnArcSwipe:", v18, v17, v9, v15, v21, v7 != 0, v20);

    v8 = v17;
    -[SBReduceMotionHomeGestureSwitcherModifier setProvidesHomeScreenDimmingAlpha:](v14, "setProvidesHomeScreenDimmingAlpha:", -[SBHomeGestureRootSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled") ^ 1);

  }
  return v14;
}

- (id)transitionChildModifierForMainTransitionEvent:(id)a3 activeGestureModifier:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  SBHomeGestureToHomeSwitcherModifier *v24;
  void *v25;
  uint64_t v26;
  SBArcSwipeSwitcherModifier *v27;
  void *v28;
  void *v29;
  SBHomeGestureToSwitcherSwitcherModifier *v30;
  SBFullScreenToHomePIPSwitcherModifier *v31;
  SBHomeGestureToZoomDownSwitcherModifier *v32;
  void *v33;
  void *v34;
  SBFullScreenToHomePIPSwitcherModifier *v35;
  uint64_t v36;
  double v37;
  double v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  double v55;
  void *v57;
  uint64_t v58;
  int64_t v59;
  uint64_t v60;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, "toEnvironmentMode");
  v60 = objc_msgSend(v7, "fromEnvironmentMode");
  objc_msgSend(v7, "transitionID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBGestureRootSwitcherModifier selectedAppLayout](self, "selectedAppLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = -[SBGestureRootSwitcherModifier currentEnvironmentMode](self, "currentEnvironmentMode");
  -[SBHomeGestureRootSwitcherModifier switcherSettings](self, "switcherSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v12, "effectiveSwitcherStyle");

  v13 = -[SBHomeGestureRootSwitcherModifier isReduceMotionEnabled](self, "isReduceMotionEnabled");
  if ((v13 & 1) != 0)
  {
    v14 = 0;
    v15 = *MEMORY[0x1E0C9D538];
    v16 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v17 = v16;
    v18 = *MEMORY[0x1E0C9D538];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeGestureRootSwitcherModifier.m"), 101, CFSTR("If reduce motion is disabled, the gesture modifier should be an instance of SBHomeGestureSwitcherModifier"));

    }
    v19 = v8;
    if (objc_msgSend(v19, "isShowingOrAnimatingCardsForFlyIn"))
      v14 = -[SBHomeGestureRootSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled") ^ 1;
    else
      v14 = 0;
    objc_msgSend(v19, "liftOffVelocityForGestureEnd");
    v18 = v20;
    v17 = v21;
    objc_msgSend(v19, "liftOffTranslationForGestureEnd");
    v15 = v22;
    v16 = v23;

  }
  switch(v9)
  {
    case 3:
      v27 = [SBArcSwipeSwitcherModifier alloc];
      objc_msgSend(v7, "fromAppLayout");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "toAppLayout");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = -[SBArcSwipeSwitcherModifier initWithTransitionID:fromAppLayout:toAppLayout:pinSpaceCornerRadiiToDisplayCornerRadii:](v27, "initWithTransitionID:fromAppLayout:toAppLayout:pinSpaceCornerRadiiToDisplayCornerRadii:", v10, v28, v29, -[SBHomeGestureRootSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled") ^ 1);

      break;
    case 2:
      if (!self->_resignsTransitionIntoAppSwitcher
        || v58 == 1
        || SBPeekConfigurationIsValid(objc_msgSend(v7, "toPeekConfiguration")))
      {
        v31 = -[SBHomeGestureRootSwitcherModifier _newMultitaskingModifier](self, "_newMultitaskingModifier");
        v30 = -[SBHomeGestureToSwitcherSwitcherModifier initWithTransitionID:multitaskingModifier:selectedAppLayout:startingEnvironmentMode:liftOffVelocity:liftOffTranslation:adjustAppLayoutsBeforeTransition:keepSelectedAppLayoutAsTopMostElement:]([SBHomeGestureToSwitcherSwitcherModifier alloc], "initWithTransitionID:multitaskingModifier:selectedAppLayout:startingEnvironmentMode:liftOffVelocity:liftOffTranslation:adjustAppLayoutsBeforeTransition:keepSelectedAppLayoutAsTopMostElement:", v10, v31, v11, v59, -[SBHomeGestureRootSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled"), -[SBHomeGestureRootSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled"), v18, v17, v15, v16);
        -[SBHomeGestureToSwitcherSwitcherModifier setHidEventSenderID:](v30, "setHidEventSenderID:", -[SBGestureSwitcherModifierEvent hidEventSenderID](self->_lastGestureEvent, "hidEventSenderID"));
LABEL_38:

        break;
      }
      break;
    case 1:
      if (v60 == 1)
      {
        v24 = [SBHomeGestureToHomeSwitcherModifier alloc];
        v25 = v10;
        v26 = v14;
LABEL_36:
        v30 = -[SBHomeGestureToHomeSwitcherModifier initWithTransitionID:showingOrAnimatingCardsForFlyIn:](v24, "initWithTransitionID:showingOrAnimatingCardsForFlyIn:", v25, v26);
        break;
      }
      if (objc_msgSend(v7, "isMorphToPIPTransition"))
      {
        if (v11)
        {
          v31 = -[SBFullScreenToHomePIPSwitcherModifier initWithTransitionID:appLayout:layoutRole:]([SBFullScreenToHomePIPSwitcherModifier alloc], "initWithTransitionID:appLayout:layoutRole:", v10, v11, objc_msgSend(v7, "morphingPIPLayoutRole"));
          if (-[SBHomeGestureRootSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled"))-[SBFullScreenToHomePIPSwitcherModifier setShouldForceDefaultAnchorPointForTransition:](v31, "setShouldForceDefaultAnchorPointForTransition:", 1);
          v32 = [SBHomeGestureToZoomDownSwitcherModifier alloc];
          v33 = v10;
          v34 = v11;
          v35 = v31;
          v36 = v60;
          v37 = v18;
          v38 = v17;
          v39 = 1;
          goto LABEL_28;
        }
      }
      else if (-[SBSwitcherModifier shouldZoomToSystemApertureForEvent:activeLayout:](self, "shouldZoomToSystemApertureForEvent:activeLayout:", v7, v11))
      {
        if (v11)
        {
          -[SBHomeGestureRootSwitcherModifier appLayouts](self, "appLayouts");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v40, "indexOfObject:", v11);

          -[SBHomeGestureRootSwitcherModifier frameForIndex:](self, "frameForIndex:", v41);
          v43 = v42;
          v45 = v44;
          v47 = v46;
          v49 = v48;
          -[SBHomeGestureRootSwitcherModifier scaleForIndex:](self, "scaleForIndex:", v41);
          v31 = -[SBFullScreenToHomeSystemApertureSwitcherModifier initWithTransitionID:zoomModifier:appLayout:direction:expandedCardFrame:cardScale:cardVelocity:]([SBFullScreenToHomeSystemApertureSwitcherModifier alloc], "initWithTransitionID:zoomModifier:appLayout:direction:expandedCardFrame:cardScale:cardVelocity:", v10, 0, v11, 1, v43, v45, v47, v49, v50, v18, v17);
          v32 = [SBHomeGestureToZoomDownSwitcherModifier alloc];
          v33 = v10;
          v34 = v11;
          v35 = v31;
          v36 = v60;
          v37 = v18;
          v38 = v17;
          v39 = 0;
LABEL_28:
          v30 = -[SBHomeGestureToZoomDownSwitcherModifier initWithTransitionID:appLayout:nonGestureInitiatedZoomModifier:effectiveStartingEnvironmentMode:liftOffVelocity:adjustAnimationAttributes:](v32, "initWithTransitionID:appLayout:nonGestureInitiatedZoomModifier:effectiveStartingEnvironmentMode:liftOffVelocity:adjustAnimationAttributes:", v33, v34, v35, v36, v39, v37, v38);
          goto LABEL_38;
        }
      }
      else
      {
        if (objc_msgSend(v7, "isIconZoomDisabled"))
        {
          v51 = *MEMORY[0x1E0C9D628];
          v52 = *(_QWORD *)(MEMORY[0x1E0C9D628] + 8);
          v53 = *(_QWORD *)(MEMORY[0x1E0C9D628] + 16);
          v54 = *(_QWORD *)(MEMORY[0x1E0C9D628] + 24);
        }
        else
        {
          -[SBHomeGestureRootSwitcherModifier homeScreenIconFrameForAppLayout:](self, "homeScreenIconFrameForAppLayout:", v11);
        }
        if (((v13 | CGRectIsNull(*(CGRect *)&v51)) & 1) == 0)
        {
          v31 = -[SBFullScreenToHomeIconZoomSwitcherModifier initWithTransitionID:appLayout:direction:]([SBFullScreenToHomeIconZoomSwitcherModifier alloc], "initWithTransitionID:appLayout:direction:", v10, v11, 1);
          v30 = -[SBHomeGestureToZoomDownSwitcherModifier initWithTransitionID:appLayout:nonGestureInitiatedZoomModifier:effectiveStartingEnvironmentMode:liftOffVelocity:adjustAnimationAttributes:]([SBHomeGestureToZoomDownSwitcherModifier alloc], "initWithTransitionID:appLayout:nonGestureInitiatedZoomModifier:effectiveStartingEnvironmentMode:liftOffVelocity:adjustAnimationAttributes:", v10, v11, v31, v60, 1, v18, v17);
          -[SBFullScreenToHomePIPSwitcherModifier setShouldForceDefaultAnchorPointForTransition:](v31, "setShouldForceDefaultAnchorPointForTransition:", self->_ensuresSelectedAppLayoutUsesAnchorPointSpacePinning);
          -[SBFullScreenToHomePIPSwitcherModifier setShouldDockOrderFrontDuringTransition:](v31, "setShouldDockOrderFrontDuringTransition:", self->_ensuresSelectedAppLayoutUsesAnchorPointSpacePinning);
          goto LABEL_38;
        }
        if (v11)
        {
          -[SBHomeGestureRootSwitcherModifier homeGestureSettings](self, "homeGestureSettings");
          v31 = (SBFullScreenToHomePIPSwitcherModifier *)objc_claimAutoreleasedReturnValue();
          -[SBFullScreenToHomePIPSwitcherModifier homeGestureCenterZoomDownCenterYOffsetFactor](v31, "homeGestureCenterZoomDownCenterYOffsetFactor");
          v30 = -[SBFullScreenToHomeCenterZoomDownSwitcherModifier initWithTransitionID:appLayout:offsetYPercentOfScreenHeight:]([SBFullScreenToHomeCenterZoomDownSwitcherModifier alloc], "initWithTransitionID:appLayout:offsetYPercentOfScreenHeight:", v10, v11, v55);
          -[SBHomeGestureToSwitcherSwitcherModifier setShouldForceDefaultAnchorPointForTransition:](v30, "setShouldForceDefaultAnchorPointForTransition:", self->_ensuresSelectedAppLayoutUsesAnchorPointSpacePinning);
          goto LABEL_38;
        }
      }
      v24 = [SBHomeGestureToHomeSwitcherModifier alloc];
      v25 = v10;
      v26 = 1;
      goto LABEL_36;
    default:
      v30 = 0;
      break;
  }

  return v30;
}

- (BOOL)wantsAsynchronousSurfaceRetentionAssertion
{
  return 1;
}

- (id)_newMultitaskingModifier
{
  return (id)-[SBSwitcherModifier copy](self->_multitaskingModifier, "copy");
}

- (BOOL)shouldPinLayoutRolesToSpace:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  BOOL v9;
  objc_super v11;

  -[SBHomeGestureRootSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_ensuresSelectedAppLayoutUsesAnchorPointSpacePinning
    && (-[SBGestureRootSwitcherModifier selectedAppLayout](self, "selectedAppLayout"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v6, "isOrContainsAppLayout:", v7),
        v7,
        (v8 & 1) != 0))
  {
    v9 = 1;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBHomeGestureRootSwitcherModifier;
    v9 = -[SBHomeGestureRootSwitcherModifier shouldPinLayoutRolesToSpace:](&v11, sel_shouldPinLayoutRolesToSpace_, a3);
  }

  return v9;
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  BOOL v9;
  objc_super v11;

  -[SBHomeGestureRootSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_ensuresSelectedAppLayoutUsesAnchorPointSpacePinning
    && (-[SBGestureRootSwitcherModifier selectedAppLayout](self, "selectedAppLayout"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v6, "isOrContainsAppLayout:", v7),
        v7,
        (v8 & 1) != 0))
  {
    v9 = 1;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBHomeGestureRootSwitcherModifier;
    v9 = -[SBHomeGestureRootSwitcherModifier shouldUseAnchorPointToPinLayoutRolesToSpace:](&v11, sel_shouldUseAnchorPointToPinLayoutRolesToSpace_, a3);
  }

  return v9;
}

- (BOOL)resignsTransitionIntoAppSwitcher
{
  return self->_resignsTransitionIntoAppSwitcher;
}

- (void)setResignsTransitionIntoAppSwitcher:(BOOL)a3
{
  self->_resignsTransitionIntoAppSwitcher = a3;
}

- (BOOL)ensuresSelectedAppLayoutUsesAnchorPointSpacePinning
{
  return self->_ensuresSelectedAppLayoutUsesAnchorPointSpacePinning;
}

- (void)setEnsuresSelectedAppLayoutUsesAnchorPointSpacePinning:(BOOL)a3
{
  self->_ensuresSelectedAppLayoutUsesAnchorPointSpacePinning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastGestureEvent, 0);
  objc_storeStrong((id *)&self->_multitaskingModifier, 0);
}

@end
