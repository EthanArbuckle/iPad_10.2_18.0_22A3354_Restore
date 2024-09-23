@implementation SBPIPInteractionSettings

- (BOOL)shouldUnstashOnTransitionFromHomescreen
{
  return self->_shouldUnstashOnTransitionFromHomescreen;
}

- (BOOL)shouldUnstashOnTransitionFromSwitcher
{
  return self->_shouldUnstashOnTransitionFromSwitcher;
}

- (void)setDefaultValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBPIPInteractionSettings;
  -[PTSettings setDefaultValues](&v7, sel_setDefaultValues);
  -[SBPIPInteractionSettings setShouldStashOnTransitionToSwitcher:](self, "setShouldStashOnTransitionToSwitcher:", 1);
  -[SBPIPInteractionSettings setShouldUnstashOnTransitionFromSwitcher:](self, "setShouldUnstashOnTransitionFromSwitcher:", 1);
  -[SBPIPInteractionSettings setShouldStashOnTransitionToHomescreen:](self, "setShouldStashOnTransitionToHomescreen:", 0);
  -[SBPIPInteractionSettings setShouldUnstashOnTransitionFromHomescreen:](self, "setShouldUnstashOnTransitionFromHomescreen:", 0);
  -[SBPIPInteractionSettings setShouldStashOnAppToAppTransitions:](self, "setShouldStashOnAppToAppTransitions:", 0);
  -[SBPIPInteractionSettings setUsesKeyboards:](self, "setUsesKeyboards:", 0);
  -[SBPIPInteractionSettings setKeyboardDismissesOnTransitionToHomescreen:](self, "setKeyboardDismissesOnTransitionToHomescreen:", 0);
  -[SBPIPInteractionSettings setKeyboardDismissesOnOutsideUserInteractionOnHomescreen:](self, "setKeyboardDismissesOnOutsideUserInteractionOnHomescreen:", 0);
  -[SBPIPInteractionSettings setKeyboardDismissesOnOutsideUserInteractionOutsideHomescreen:](self, "setKeyboardDismissesOnOutsideUserInteractionOutsideHomescreen:", 0);
  -[SBPIPInteractionSettings setAlwaysStartAtSmallestSize:](self, "setAlwaysStartAtSmallestSize:", 0);
  -[SBPIPInteractionSettings setPanGestureEnabled:](self, "setPanGestureEnabled:", 1);
  -[SBPIPInteractionSettings setEdgeResizeGestureEnabled:](self, "setEdgeResizeGestureEnabled:", 1);
  -[SBPIPInteractionSettings setPinchGestureEnabled:](self, "setPinchGestureEnabled:", 1);
  -[SBPIPInteractionSettings setRotationGestureEnabled:](self, "setRotationGestureEnabled:", 1);
  -[SBPIPInteractionSettings setStashingEnabled:](self, "setStashingEnabled:", 1);
  -[SBPIPInteractionSettings setFreePositioning:](self, "setFreePositioning:", 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E08]), "initWithDefaultValues");
  objc_msgSend(v3, "setName:", CFSTR("PIP Behavior"));
  objc_msgSend(v3, "setBehaviorType:", 2);
  objc_msgSend(v3, "setRetargetImpulse:", 0.0);
  objc_msgSend(v3, "setTrackingRetargetImpulse:", 0.0);
  objc_msgSend(v3, "setDampingRatio:", 0.86);
  objc_msgSend(v3, "setResponse:", 0.55);
  objc_msgSend(v3, "setTrackingDampingRatio:", 0.92);
  objc_msgSend(v3, "setTrackingResponse:", 0.18);
  -[SBPIPInteractionSettings setInteractiveFluidBehavior:](self, "setInteractiveFluidBehavior:", v3);
  v4 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v4, "setName:", CFSTR("Region Update Behavior"));
  -[SBPIPInteractionSettings setRegionUpdateFluidBehavior:](self, "setRegionUpdateFluidBehavior:", v4);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E08]), "initWithDefaultValues");
  objc_msgSend(v5, "setName:", CFSTR("Stash Tab Behavior"));
  objc_msgSend(v5, "setBehaviorType:", 2);
  objc_msgSend(v5, "setRetargetImpulse:", 0.0);
  objc_msgSend(v5, "setTrackingRetargetImpulse:", 0.0);
  objc_msgSend(v5, "setDampingRatio:", 0.92);
  objc_msgSend(v5, "setResponse:", 0.35);
  objc_msgSend(v5, "setTrackingDampingRatio:", 0.92);
  objc_msgSend(v5, "setTrackingResponse:", 0.18);
  -[SBPIPInteractionSettings setStashTabFluidBehavior:](self, "setStashTabFluidBehavior:", v5);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E08]), "initWithDefaultValues");
  objc_msgSend(v6, "setName:", CFSTR("Rotation Behavior"));
  objc_msgSend(v6, "setBehaviorType:", 1);
  objc_msgSend(v6, "setRetargetImpulse:", 0.14);
  objc_msgSend(v6, "setTrackingRetargetImpulse:", 0.0);
  objc_msgSend(v6, "setDampingRatio:", 1.0);
  objc_msgSend(v6, "setResponse:", 0.8);
  -[SBPIPInteractionSettings setRotationFluidBehavior:](self, "setRotationFluidBehavior:", v6);
  -[SBPIPInteractionSettings setDefaultContentSizeResetTimeout:](self, "setDefaultContentSizeResetTimeout:", 8.0);
  -[SBPIPInteractionSettings setInFlightHitTestPadding:](self, "setInFlightHitTestPadding:", 50.0);
  -[SBPIPInteractionSettings setMaximumSizeSpanForPreferredSizeTuning:](self, "setMaximumSizeSpanForPreferredSizeTuning:", 0.5);
  -[SBPIPInteractionSettings setMinimumSizeSpanBetweenPreferredSizes:](self, "setMinimumSizeSpanBetweenPreferredSizes:", 0.2);
  -[SBPIPInteractionSettings setPositionDecelerationRate:](self, "setPositionDecelerationRate:", 0.995);
  -[SBPIPInteractionSettings setPositionExtenderMaximumDistance:](self, "setPositionExtenderMaximumDistance:", 50.0);
  -[SBPIPInteractionSettings setPositionVelocityYWeightOverVelocityX:](self, "setPositionVelocityYWeightOverVelocityX:", 0.25);
  -[SBPIPInteractionSettings setRotationExtenderMaximumDistance:](self, "setRotationExtenderMaximumDistance:", 1.57079633);
  -[SBPIPInteractionSettings setRotationPreRecognitionWeight:](self, "setRotationPreRecognitionWeight:", 1.0);
  -[SBPIPInteractionSettings setRotationRubberBandCoefficient:](self, "setRotationRubberBandCoefficient:", 0.3);
  -[SBPIPInteractionSettings setScaleDecelerationRate:](self, "setScaleDecelerationRate:", 0.99);
  -[SBPIPInteractionSettings setScaleExtenderMaximumDistance:](self, "setScaleExtenderMaximumDistance:", 1.0);
  -[SBPIPInteractionSettings setScaleLowPassFilterPreviousWeight:](self, "setScaleLowPassFilterPreviousWeight:", 0.25);
  -[SBPIPInteractionSettings setStashProgressTabAppearanceThresholdX:](self, "setStashProgressTabAppearanceThresholdX:", 0.85);

}

+ (id)settingsControllerModule
{
  void *v2;
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
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
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  _QWORD v76[6];
  _QWORD v77[22];
  _QWORD v78[3];
  _QWORD v79[5];
  _QWORD v80[3];

  v80[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rowWithTitle:action:", CFSTR("Restore Defaults"), v3);
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0D83040];
  NSStringFromSelector(sel_edgeResizeSettings);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rowWithTitle:childSettingsKeyPath:", CFSTR("Edge resize settings"), v5);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0D83070];
  v80[0] = v59;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionWithRows:title:", v7, CFSTR("Pointer Edge Resize Behavior"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Transition to Switcher Stashes PIP"), CFSTR("shouldStashOnTransitionToSwitcher"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Transition from Switcher Unstashes PIP"), CFSTR("shouldUnstashOnTransitionFromSwitcher"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Transition to Homescreen Stashes PIP"), CFSTR("shouldStashOnTransitionToHomescreen"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Transition from Homescreen Unstashes PIP"), CFSTR("shouldUnstashOnTransitionFromHomescreen"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Transition between Apps Stashes PIP"), CFSTR("shouldStashOnAppToAppTransitions"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0D83070];
  v79[0] = v58;
  v79[1] = v57;
  v79[2] = v56;
  v79[3] = v55;
  v79[4] = v54;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sectionWithRows:title:", v9, CFSTR("Stashing Behavior"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Transition to Homescreen Dismisses Keyboards"), CFSTR("keyboardDismissesOnTransitionToHomescreen"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Outside User Interaction on Homescreen Dismisses Keyboards"), CFSTR("keyboardDismissesOnOutsideUserInteractionOnHomescreen"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Outside User Interaction Outside of Homescreen Dismisses Keyboards"), CFSTR("keyboardDismissesOnOutsideUserInteractionOutsideHomescreen"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0D83070];
  v78[0] = v53;
  v78[1] = v52;
  v78[2] = v51;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("usesKeyboards == YES"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sectionWithRows:title:condition:", v11, CFSTR("Keyboard Dismissal Behavior"), v12);
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0DA9E08], "_moduleWithSectionTitle:", CFSTR("Interaction Spring Behavior"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "submoduleWithModule:childSettingsKeyPath:", v14, CFSTR("interactiveFluidBehavior"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0DA9E08], "_moduleWithSectionTitle:", CFSTR("Stash Tab Spring Behavior"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "submoduleWithModule:childSettingsKeyPath:", v16, CFSTR("stashTabFluidBehavior"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Always Start Smallest Possible"), CFSTR("alwaysStartAtSmallestSize"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83020], "rowWithTitle:valueKeyPath:", CFSTR("Freely Positionable"), CFSTR("freePositioning"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "setPossibleTitles:", &unk_1E91CF478);
  objc_msgSend(v71, "setPossibleShortTitles:", &unk_1E91CF490);
  objc_msgSend(v71, "setPossibleValues:", &unk_1E91CF4A8);
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Pan Gesture Enabled"), CFSTR("panGestureEnabled"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Pich Gesture Enabled"), CFSTR("pinchGestureEnabled"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Rotation Gesture Enabled"), CFSTR("rotationGestureEnabled"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Stashing Enabled"), CFSTR("stashingEnabled"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Edge Resize Gesture Enabled"), CFSTR("edgeResizeGestureEnabled"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Default Content Size Resize Timeout (minutes)"), CFSTR("defaultContentSizeResetTimeout"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Gesture Retargeting Touch Inset"), CFSTR("inFlightHitTestPadding"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Size Span Percentage for Preferred Size Tuning"), CFSTR("maximumSizeSpanForPreferredSizeTuning"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Size Span Percentage between User Preferred Sizes"), CFSTR("minimumSizeSpanBetweenPreferredSizes"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Position Extender Maximum Distance"), CFSTR("positionExtenderMaximumDistance"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Position Deceleration Rate"), CFSTR("positionDecelerationRate"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Position Velocity Y over Velocity X Weight"), CFSTR("positionVelocityYWeightOverVelocityX"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Rotation Extender Maximum Distance"), CFSTR("rotationExtenderMaximumDistance"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Rotation Pre-Recognition Weight"), CFSTR("rotationPreRecognitionWeight"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Rotation Rubber Band Coefficient"), CFSTR("rotationRubberBandCoefficient"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Scale Low Pass Filter Previous Weight"), CFSTR("scaleLowPassFilterPreviousWeight"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Scale Extender Maximum Distance"), CFSTR("scaleExtenderMaximumDistance"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Scale Deceleration Rate"), CFSTR("scaleDecelerationRate"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Stash Progress Threshold for Tab Appearance"), CFSTR("stashProgressTabAppearanceThresholdX"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "minValue:maxValue:", 0.0, 60.0);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "minValue:maxValue:", 0.0, 300.0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "minValue:maxValue:", 0.0, 0.5);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "minValue:maxValue:", 0.05, 0.8);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "minValue:maxValue:", 0.0, 200.0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "minValue:maxValue:", 0.88, 1.0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "minValue:maxValue:", 0.0, 1.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "minValue:maxValue:", 0.0, 1.57079633);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v43, "minValue:maxValue:", 0.0, 1.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v45, "minValue:maxValue:", 0.0, 1.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v46, "minValue:maxValue:", 0.0, 1.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v47, "minValue:maxValue:", 0.0, 1.0);
  v27 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v48, "minValue:maxValue:", 0.88, 1.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = v25;
  objc_msgSend(v25, "minValue:maxValue:", 0.0, 1.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = (void *)MEMORY[0x1E0D83070];
  v77[0] = v75;
  v77[1] = v70;
  v77[2] = v68;
  v77[3] = v67;
  v77[4] = v65;
  v77[5] = v66;
  v77[6] = v71;
  v77[7] = v64;
  v77[8] = v72;
  v77[9] = v61;
  v77[10] = v60;
  v77[11] = v41;
  v77[12] = v62;
  v77[13] = v30;
  v77[14] = v63;
  v77[15] = v42;
  v77[16] = v40;
  v77[17] = v39;
  v77[18] = v44;
  v77[19] = v26;
  v77[20] = v27;
  v77[21] = v28;
  v32 = (void *)v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 22);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "sectionWithRows:title:", v33, CFSTR("Gestures, Projection, and Rubberbanding Behavior"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = (void *)MEMORY[0x1E0D83070];
  v76[0] = v74;
  v76[1] = v73;
  v76[2] = v69;
  v76[3] = v50;
  v76[4] = v49;
  v76[5] = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 6);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "moduleWithTitle:contents:", CFSTR("PIP Interaction Behavior"), v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  return v37;
}

- (SBPIPEdgeResizeSettings)edgeResizeSettings
{
  return self->_edgeResizeSettings;
}

- (void)setEdgeResizeSettings:(id)a3
{
  objc_storeStrong((id *)&self->_edgeResizeSettings, a3);
}

- (BOOL)shouldStashOnTransitionToSwitcher
{
  return self->_shouldStashOnTransitionToSwitcher;
}

- (void)setShouldStashOnTransitionToSwitcher:(BOOL)a3
{
  self->_shouldStashOnTransitionToSwitcher = a3;
}

- (void)setShouldUnstashOnTransitionFromSwitcher:(BOOL)a3
{
  self->_shouldUnstashOnTransitionFromSwitcher = a3;
}

- (BOOL)shouldStashOnTransitionToHomescreen
{
  return self->_shouldStashOnTransitionToHomescreen;
}

- (void)setShouldStashOnTransitionToHomescreen:(BOOL)a3
{
  self->_shouldStashOnTransitionToHomescreen = a3;
}

- (void)setShouldUnstashOnTransitionFromHomescreen:(BOOL)a3
{
  self->_shouldUnstashOnTransitionFromHomescreen = a3;
}

- (BOOL)shouldStashOnAppToAppTransitions
{
  return self->_shouldStashOnAppToAppTransitions;
}

- (void)setShouldStashOnAppToAppTransitions:(BOOL)a3
{
  self->_shouldStashOnAppToAppTransitions = a3;
}

- (BOOL)usesKeyboards
{
  return self->_usesKeyboards;
}

- (void)setUsesKeyboards:(BOOL)a3
{
  self->_usesKeyboards = a3;
}

- (BOOL)keyboardDismissesOnTransitionToHomescreen
{
  return self->_keyboardDismissesOnTransitionToHomescreen;
}

- (void)setKeyboardDismissesOnTransitionToHomescreen:(BOOL)a3
{
  self->_keyboardDismissesOnTransitionToHomescreen = a3;
}

- (BOOL)keyboardDismissesOnOutsideUserInteractionOnHomescreen
{
  return self->_keyboardDismissesOnOutsideUserInteractionOnHomescreen;
}

- (void)setKeyboardDismissesOnOutsideUserInteractionOnHomescreen:(BOOL)a3
{
  self->_keyboardDismissesOnOutsideUserInteractionOnHomescreen = a3;
}

- (BOOL)keyboardDismissesOnOutsideUserInteractionOutsideHomescreen
{
  return self->_keyboardDismissesOnOutsideUserInteractionOutsideHomescreen;
}

- (void)setKeyboardDismissesOnOutsideUserInteractionOutsideHomescreen:(BOOL)a3
{
  self->_keyboardDismissesOnOutsideUserInteractionOutsideHomescreen = a3;
}

- (BOOL)alwaysStartAtSmallestSize
{
  return self->_alwaysStartAtSmallestSize;
}

- (void)setAlwaysStartAtSmallestSize:(BOOL)a3
{
  self->_alwaysStartAtSmallestSize = a3;
}

- (BOOL)panGestureEnabled
{
  return self->_panGestureEnabled;
}

- (void)setPanGestureEnabled:(BOOL)a3
{
  self->_panGestureEnabled = a3;
}

- (BOOL)edgeResizeGestureEnabled
{
  return self->_edgeResizeGestureEnabled;
}

- (void)setEdgeResizeGestureEnabled:(BOOL)a3
{
  self->_edgeResizeGestureEnabled = a3;
}

- (BOOL)pinchGestureEnabled
{
  return self->_pinchGestureEnabled;
}

- (void)setPinchGestureEnabled:(BOOL)a3
{
  self->_pinchGestureEnabled = a3;
}

- (BOOL)rotationGestureEnabled
{
  return self->_rotationGestureEnabled;
}

- (void)setRotationGestureEnabled:(BOOL)a3
{
  self->_rotationGestureEnabled = a3;
}

- (BOOL)stashingEnabled
{
  return self->_stashingEnabled;
}

- (void)setStashingEnabled:(BOOL)a3
{
  self->_stashingEnabled = a3;
}

- (unint64_t)freePositioning
{
  return self->_freePositioning;
}

- (void)setFreePositioning:(unint64_t)a3
{
  self->_freePositioning = a3;
}

- (double)defaultContentSizeResetTimeout
{
  return self->_defaultContentSizeResetTimeout;
}

- (void)setDefaultContentSizeResetTimeout:(double)a3
{
  self->_defaultContentSizeResetTimeout = a3;
}

- (double)inFlightHitTestPadding
{
  return self->_inFlightHitTestPadding;
}

- (void)setInFlightHitTestPadding:(double)a3
{
  self->_inFlightHitTestPadding = a3;
}

- (double)maximumSizeSpanForPreferredSizeTuning
{
  return self->_maximumSizeSpanForPreferredSizeTuning;
}

- (void)setMaximumSizeSpanForPreferredSizeTuning:(double)a3
{
  self->_maximumSizeSpanForPreferredSizeTuning = a3;
}

- (double)minimumSizeSpanBetweenPreferredSizes
{
  return self->_minimumSizeSpanBetweenPreferredSizes;
}

- (void)setMinimumSizeSpanBetweenPreferredSizes:(double)a3
{
  self->_minimumSizeSpanBetweenPreferredSizes = a3;
}

- (double)positionDecelerationRate
{
  return self->_positionDecelerationRate;
}

- (void)setPositionDecelerationRate:(double)a3
{
  self->_positionDecelerationRate = a3;
}

- (double)positionExtenderMaximumDistance
{
  return self->_positionExtenderMaximumDistance;
}

- (void)setPositionExtenderMaximumDistance:(double)a3
{
  self->_positionExtenderMaximumDistance = a3;
}

- (double)positionVelocityYWeightOverVelocityX
{
  return self->_positionVelocityYWeightOverVelocityX;
}

- (void)setPositionVelocityYWeightOverVelocityX:(double)a3
{
  self->_positionVelocityYWeightOverVelocityX = a3;
}

- (double)rotationExtenderMaximumDistance
{
  return self->_rotationExtenderMaximumDistance;
}

- (void)setRotationExtenderMaximumDistance:(double)a3
{
  self->_rotationExtenderMaximumDistance = a3;
}

- (double)rotationPreRecognitionWeight
{
  return self->_rotationPreRecognitionWeight;
}

- (void)setRotationPreRecognitionWeight:(double)a3
{
  self->_rotationPreRecognitionWeight = a3;
}

- (double)rotationRubberBandCoefficient
{
  return self->_rotationRubberBandCoefficient;
}

- (void)setRotationRubberBandCoefficient:(double)a3
{
  self->_rotationRubberBandCoefficient = a3;
}

- (double)scaleDecelerationRate
{
  return self->_scaleDecelerationRate;
}

- (void)setScaleDecelerationRate:(double)a3
{
  self->_scaleDecelerationRate = a3;
}

- (double)scaleExtenderMaximumDistance
{
  return self->_scaleExtenderMaximumDistance;
}

- (void)setScaleExtenderMaximumDistance:(double)a3
{
  self->_scaleExtenderMaximumDistance = a3;
}

- (double)scaleLowPassFilterPreviousWeight
{
  return self->_scaleLowPassFilterPreviousWeight;
}

- (void)setScaleLowPassFilterPreviousWeight:(double)a3
{
  self->_scaleLowPassFilterPreviousWeight = a3;
}

- (double)stashProgressTabAppearanceThresholdX
{
  return self->_stashProgressTabAppearanceThresholdX;
}

- (void)setStashProgressTabAppearanceThresholdX:(double)a3
{
  self->_stashProgressTabAppearanceThresholdX = a3;
}

- (SBFFluidBehaviorSettings)interactiveFluidBehavior
{
  return self->_interactiveFluidBehavior;
}

- (void)setInteractiveFluidBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_interactiveFluidBehavior, a3);
}

- (SBFFluidBehaviorSettings)stashTabFluidBehavior
{
  return self->_stashTabFluidBehavior;
}

- (void)setStashTabFluidBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_stashTabFluidBehavior, a3);
}

- (SBFFluidBehaviorSettings)rotationFluidBehavior
{
  return self->_rotationFluidBehavior;
}

- (void)setRotationFluidBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_rotationFluidBehavior, a3);
}

- (SBFFluidBehaviorSettings)regionUpdateFluidBehavior
{
  return self->_regionUpdateFluidBehavior;
}

- (void)setRegionUpdateFluidBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_regionUpdateFluidBehavior, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionUpdateFluidBehavior, 0);
  objc_storeStrong((id *)&self->_rotationFluidBehavior, 0);
  objc_storeStrong((id *)&self->_stashTabFluidBehavior, 0);
  objc_storeStrong((id *)&self->_interactiveFluidBehavior, 0);
  objc_storeStrong((id *)&self->_edgeResizeSettings, 0);
}

@end
