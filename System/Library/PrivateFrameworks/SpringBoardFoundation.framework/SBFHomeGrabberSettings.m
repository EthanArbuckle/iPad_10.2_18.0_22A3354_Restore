@implementation SBFHomeGrabberSettings

- (int64_t)autoHideOverride
{
  return self->_autoHideOverride;
}

- (int64_t)edgeProtectOverride
{
  return self->_edgeProtectOverride;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (double)delayForUnhideOnAppRequest
{
  return self->_delayForUnhideOnAppRequest;
}

- (int64_t)initializationStyle
{
  return self->_initializationStyle;
}

- (double)autoHideTimeOnAppRequest
{
  return self->_autoHideTimeOnAppRequest;
}

- (SBFAnimationSettings)lumaResponseAnimationSettings
{
  return self->_lumaResponseAnimationSettings;
}

- (BOOL)visualizeHitTestRect
{
  return self->_visualizeHitTestRect;
}

- (SBFAnimationSettings)unhideAnimationSettings
{
  return self->_unhideAnimationSettings;
}

- (BOOL)removeViewOnHide
{
  return self->_removeViewOnHide;
}

- (SBFAnimationSettings)initialLumaResponseAnimationSettings
{
  return self->_initialLumaResponseAnimationSettings;
}

- (double)autoHideTime
{
  return self->_autoHideTime;
}

- (SBFAnimationSettings)unhideForHomeGestureOwnershipAnimationSettings
{
  return self->_unhideForHomeGestureOwnershipAnimationSettings;
}

- (SBFAnimationSettings)thinToProminentAnimationSettings
{
  return self->_thinToProminentAnimationSettings;
}

- (SBFAnimationSettings)prominentToThinAnimationSettings
{
  return self->_prominentToThinAnimationSettings;
}

- (void)setDefaultValues
{
  void *v3;
  uint64_t v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  float v11;
  float v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;
  CAFrameRateRange v28;

  v27.receiver = self;
  v27.super_class = (Class)SBFHomeGrabberSettings;
  -[PTSettings setDefaultValues](&v27, sel_setDefaultValues);
  if (SBFEffectiveHomeButtonType() == 2)
    -[SBFHomeGrabberSettings setEnabled:](self, "setEnabled:", 1);
  -[SBFHomeGrabberSettings setInitializationStyle:](self, "setInitializationStyle:", 0);
  -[SBFHomeGrabberSettings setRemoveViewOnHide:](self, "setRemoveViewOnHide:", 1);
  -[SBFHomeGrabberSettings setEdgeProtectOverride:](self, "setEdgeProtectOverride:", 0x7FFFFFFFFFFFFFFFLL);
  -[SBFHomeGrabberSettings setAutoHideOverride:](self, "setAutoHideOverride:", 0x7FFFFFFFFFFFFFFFLL);
  -[SBFHomeGrabberSettings setAutoHideTime:](self, "setAutoHideTime:", 2.0);
  -[SBFHomeGrabberSettings setAutoHideTimeOnAppRequest:](self, "setAutoHideTimeOnAppRequest:", 1.5);
  -[SBFHomeGrabberSettings setResetAutoHideTimeOnRotation:](self, "setResetAutoHideTimeOnRotation:", 1);
  -[SBFHomeGrabberSettings setDelayForUnhideOnTouch:](self, "setDelayForUnhideOnTouch:", 0.1);
  -[SBFHomeGrabberSettings setDelayForUnhideOnAppRequest:](self, "setDelayForUnhideOnAppRequest:", 0.1);
  -[SBFHomeGrabberSettings setVisualizeHitTestRect:](self, "setVisualizeHitTestRect:", 0);
  -[SBFHomeGrabberSettings setConstrainHitTestRectToSafeAreaInset:](self, "setConstrainHitTestRectToSafeAreaInset:", 1);
  -[SBFHomeGrabberSettings setHitTestOutsetTop:](self, "setHitTestOutsetTop:", 10.0);
  -[SBFHomeGrabberSettings setHitTestOutsetSides:](self, "setHitTestOutsetSides:", 10.0);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v5 = 0.0;
  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v5 = 5.0;
  -[SBFHomeGrabberSettings setHitTestOutsetDoubleTap:](self, "setHitTestOutsetDoubleTap:", v5);
  -[SBFHomeGrabberSettings setSingleTapGatingEnabled:](self, "setSingleTapGatingEnabled:", 1);
  -[SBFHomeGrabberSettings setCoverSheetHomeAffordanceCursorTopEdgeInset:](self, "setCoverSheetHomeAffordanceCursorTopEdgeInset:", -4.0);
  -[SBFHomeGrabberSettings setCoverSheetHomeAffordanceCursorBottomEdgeInset:](self, "setCoverSheetHomeAffordanceCursorBottomEdgeInset:", -4.0);
  -[SBFHomeGrabberSettings setCoverSheetHomeAffordanceCursorLeftEdgeInset:](self, "setCoverSheetHomeAffordanceCursorLeftEdgeInset:", -7.0);
  -[SBFHomeGrabberSettings setCoverSheetHomeAffordanceCursorRightEdgeInset:](self, "setCoverSheetHomeAffordanceCursorRightEdgeInset:", -7.0);
  -[SBFHomeGrabberSettings setCoverSheetSuppressAnimationForPointerTopEdgeInset:](self, "setCoverSheetSuppressAnimationForPointerTopEdgeInset:", -300.0);
  -[SBFHomeGrabberSettings setCoverSheetSuppressAnimationForPointerBottomEdgeInset:](self, "setCoverSheetSuppressAnimationForPointerBottomEdgeInset:", 0.0);
  -[SBFHomeGrabberSettings setCoverSheetSuppressAnimationForPointerLeftEdgeInset:](self, "setCoverSheetSuppressAnimationForPointerLeftEdgeInset:", -200.0);
  -[SBFHomeGrabberSettings setCoverSheetSuppressAnimationForPointerRightEdgeInset:](self, "setCoverSheetSuppressAnimationForPointerRightEdgeInset:", -200.0);
  -[SBFHomeGrabberSettings setBounceTranslation:](self, "setBounceTranslation:", 2.0);
  -[SBFHomeGrabberSettings setBounceReverseAnimationDelay:](self, "setBounceReverseAnimationDelay:", 0.2);
  -[SBFHomeGrabberSettings bounceAnimationSettings](self, "bounceAnimationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDefaultValues");

  -[SBFHomeGrabberSettings bounceAnimationSettings](self, "bounceAnimationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDampingRatio:", 0.375278);

  -[SBFHomeGrabberSettings bounceAnimationSettings](self, "bounceAnimationSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setResponse:", 0.36276);

  -[SBFHomeGrabberSettings hideAnimationSettings](self, "hideAnimationSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0CD23C0];
  v11 = *(float *)(MEMORY[0x1E0CD23C0] + 4);
  v12 = *(float *)(MEMORY[0x1E0CD23C0] + 8);
  __42__SBFHomeGrabberSettings_setDefaultValues__block_invoke(0.6, *MEMORY[0x1E0CD23C0], v11, v12, (uint64_t)v9, v9, 0);

  -[SBFHomeGrabberSettings unhideAnimationSettings](self, "unhideAnimationSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  __42__SBFHomeGrabberSettings_setDefaultValues__block_invoke(0.25, v10, v11, v12, (uint64_t)v13, v13, 0);

  -[SBFHomeGrabberSettings hideForHomeGestureOwnershipAnimationSettings](self, "hideForHomeGestureOwnershipAnimationSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  __42__SBFHomeGrabberSettings_setDefaultValues__block_invoke(0.25, v10, v11, v12, (uint64_t)v14, v14, 0);

  -[SBFHomeGrabberSettings unhideForHomeGestureOwnershipAnimationSettings](self, "unhideForHomeGestureOwnershipAnimationSettings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  __42__SBFHomeGrabberSettings_setDefaultValues__block_invoke(0.25, v10, v11, v12, (uint64_t)v15, v15, 0);

  -[SBFHomeGrabberSettings thinToProminentAnimationSettings](self, "thinToProminentAnimationSettings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  __42__SBFHomeGrabberSettings_setDefaultValues__block_invoke(0.25, v10, v11, v12, (uint64_t)v16, v16, 0);

  -[SBFHomeGrabberSettings prominentToThinAnimationSettings](self, "prominentToThinAnimationSettings");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  __42__SBFHomeGrabberSettings_setDefaultValues__block_invoke(0.25, v10, v11, v12, (uint64_t)v17, v17, 0);

  -[SBFHomeGrabberSettings forcedProminentToThinAnimationSettings](self, "forcedProminentToThinAnimationSettings");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  __42__SBFHomeGrabberSettings_setDefaultValues__block_invoke(0.6, v10, v11, v12, (uint64_t)v18, v18, 0);

  -[SBFHomeGrabberSettings lumaResponseAnimationSettings](self, "lumaResponseAnimationSettings");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = CAFrameRateRangeMake(30.0, 120.0, 30.0);
  __42__SBFHomeGrabberSettings_setDefaultValues__block_invoke(3.0, v28.minimum, v28.maximum, v28.preferred, v20, v19, 21);

  -[SBFHomeGrabberSettings initialLumaResponseAnimationSettings](self, "initialLumaResponseAnimationSettings");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  __42__SBFHomeGrabberSettings_setDefaultValues__block_invoke(0.5, v10, v11, v12, (uint64_t)v21, v21, 0);

  -[SBFHomeGrabberSettings rotationFadeOutAnimationSettings](self, "rotationFadeOutAnimationSettings");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  __42__SBFHomeGrabberSettings_setDefaultValues__block_invoke(0.1, v10, v11, v12, (uint64_t)v22, v22, 0);

  -[SBFHomeGrabberSettings rotationFadeInAnimationSettings](self, "rotationFadeInAnimationSettings");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  __42__SBFHomeGrabberSettings_setDefaultValues__block_invoke(0.3, v10, v11, v12, (uint64_t)v23, v23, 0);

  -[SBFHomeGrabberSettings setEdgeProtectOverride:](self, "setEdgeProtectOverride:", 0x7FFFFFFFFFFFFFFFLL);
  -[SBFHomeGrabberSettings edgeProtectAnimationSettings](self, "edgeProtectAnimationSettings");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setDefaultValues");

  -[SBFHomeGrabberSettings edgeProtectAnimationSettings](self, "edgeProtectAnimationSettings");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setResponse:", 0.444);

  -[SBFHomeGrabberSettings edgeProtectAnimationSettings](self, "edgeProtectAnimationSettings");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setDampingRatio:", 0.884);

}

void __42__SBFHomeGrabberSettings_setDefaultValues__block_invoke(double a1, float a2, float a3, float a4, uint64_t a5, void *a6, uint64_t a7)
{
  double v12;
  double v13;
  double v14;
  id v15;

  v15 = a6;
  objc_msgSend(v15, "setDefaultValues");
  objc_msgSend(v15, "setCurve:", 196608);
  objc_msgSend(v15, "setDuration:", a1);
  *(float *)&v12 = a2;
  *(float *)&v13 = a3;
  *(float *)&v14 = a4;
  objc_msgSend(v15, "setFrameRateRange:highFrameRateReason:", a7, v12, v13, v14);

}

- (UIEdgeInsets)coverSheetHomeAffordanceCursorEdgeInsets
{
  double coverSheetHomeAffordanceCursorTopEdgeInset;
  double coverSheetHomeAffordanceCursorLeftEdgeInset;
  double coverSheetHomeAffordanceCursorBottomEdgeInset;
  double coverSheetHomeAffordanceCursorRightEdgeInset;
  UIEdgeInsets result;

  coverSheetHomeAffordanceCursorTopEdgeInset = self->_coverSheetHomeAffordanceCursorTopEdgeInset;
  coverSheetHomeAffordanceCursorLeftEdgeInset = self->_coverSheetHomeAffordanceCursorLeftEdgeInset;
  coverSheetHomeAffordanceCursorBottomEdgeInset = self->_coverSheetHomeAffordanceCursorBottomEdgeInset;
  coverSheetHomeAffordanceCursorRightEdgeInset = self->_coverSheetHomeAffordanceCursorRightEdgeInset;
  result.right = coverSheetHomeAffordanceCursorRightEdgeInset;
  result.bottom = coverSheetHomeAffordanceCursorBottomEdgeInset;
  result.left = coverSheetHomeAffordanceCursorLeftEdgeInset;
  result.top = coverSheetHomeAffordanceCursorTopEdgeInset;
  return result;
}

- (UIEdgeInsets)coverSheetSuppressAnimationForPointerInsets
{
  double coverSheetSuppressAnimationForPointerTopEdgeInset;
  double coverSheetSuppressAnimationForPointerLeftEdgeInset;
  double coverSheetSuppressAnimationForPointerBottomEdgeInset;
  double coverSheetSuppressAnimationForPointerRightEdgeInset;
  UIEdgeInsets result;

  coverSheetSuppressAnimationForPointerTopEdgeInset = self->_coverSheetSuppressAnimationForPointerTopEdgeInset;
  coverSheetSuppressAnimationForPointerLeftEdgeInset = self->_coverSheetSuppressAnimationForPointerLeftEdgeInset;
  coverSheetSuppressAnimationForPointerBottomEdgeInset = self->_coverSheetSuppressAnimationForPointerBottomEdgeInset;
  coverSheetSuppressAnimationForPointerRightEdgeInset = self->_coverSheetSuppressAnimationForPointerRightEdgeInset;
  result.right = coverSheetSuppressAnimationForPointerRightEdgeInset;
  result.bottom = coverSheetSuppressAnimationForPointerBottomEdgeInset;
  result.left = coverSheetSuppressAnimationForPointerLeftEdgeInset;
  result.top = coverSheetSuppressAnimationForPointerTopEdgeInset;
  return result;
}

+ (id)settingsControllerModule
{
  _BOOL8 v2;
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
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
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
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  _QWORD v96[3];
  _QWORD v97[13];
  _QWORD v98[43];
  _QWORD v99[3];

  v99[1] = *MEMORY[0x1E0C80C00];
  v2 = SBFIsSAETappyHomeAffordanceAvailable();
  v3 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "action");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rowWithTitle:action:", CFSTR("Restore Defaults"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v99[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v99, 1);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83070], "sectionWithRows:", v70);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Enabled"), CFSTR("enabled"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v98[0] = v92;
  objc_msgSend(MEMORY[0x1E0D83020], "rowWithTitle:valueKeyPath:", CFSTR("Initialization"), CFSTR("initializationStyle"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "possibleValues:titles:", &unk_1E203B498, &unk_1E203B4B0);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v98[1] = v88;
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Remove On Hide"), CFSTR("removeViewOnHide"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v98[2] = v86;
  objc_msgSend(MEMORY[0x1E0D83020], "rowWithTitle:valueKeyPath:", CFSTR("Edge Protect Override"), CFSTR("edgeProtectOverride"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "possibleValues:titles:", &unk_1E203B4C8, &unk_1E203B4E0);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v98[3] = v83;
  objc_msgSend(MEMORY[0x1E0D83020], "rowWithTitle:valueKeyPath:", CFSTR("Auto Hide Override"), CFSTR("autoHideOverride"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "possibleValues:titles:", &unk_1E203B4F8, &unk_1E203B510);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v98[4] = v81;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Auto Hide Time - Default"), CFSTR("autoHideTime"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v98[5] = v80;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", 0, CFSTR("autoHideTime"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "minValue:maxValue:", 0.0, 10.0);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v98[6] = v78;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Auto Hide Time - App Request"), CFSTR("autoHideTimeOnAppRequest"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v98[7] = v77;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", 0, CFSTR("autoHideTimeOnAppRequest"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "minValue:maxValue:", 0.0, 10.0);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v98[8] = v75;
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Reset Hide Timer On Rotation"), CFSTR("resetAutoHideTimeOnRotation"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v98[9] = v74;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Touch Unhide Delay"), CFSTR("delayForUnhideOnTouch"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v98[10] = v73;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", 0, CFSTR("delayForUnhideOnTouch"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "minValue:maxValue:", 0.0, 3.0);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v98[11] = v71;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("App Request Unhide Delay"), CFSTR("delayForUnhideOnAppRequest"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v98[12] = v69;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", 0, CFSTR("delayForUnhideOnAppRequest"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "minValue:maxValue:", 0.0, 3.0);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v98[13] = v67;
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Visualize Grabber Hit-Test Area"), CFSTR("visualizeHitTestRect"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v98[14] = v66;
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Constrain Grabber Hit-Test Area"), CFSTR("constrainHitTestRectToSafeAreaInset"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v98[15] = v65;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Grabber Hit-Test Outset (Top)"), CFSTR("hitTestOutsetTop"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v98[16] = v64;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", 0, CFSTR("hitTestOutsetTop"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "minValue:maxValue:", 0.0, 30.0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v98[17] = v62;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Grabber Hit-Test Outset (Sides)"), CFSTR("hitTestOutsetSides"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v98[18] = v61;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", 0, CFSTR("hitTestOutsetSides"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "minValue:maxValue:", 0.0, 60.0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v98[19] = v59;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Grabber Hit-Test Outset (Double-Tap)"), CFSTR("hitTestOutsetDoubleTap"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", v2);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "condition:", v57);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v98[20] = v56;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", 0, CFSTR("hitTestOutsetDoubleTap"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "minValue:maxValue:", 0.0, 60.0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", v2);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "condition:", v53);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v98[21] = v52;
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Gate Single Tap Delivery"), CFSTR("singleTapGatingEnabled"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v98[22] = v51;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Bounce Translation"), CFSTR("bounceTranslation"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v98[23] = v50;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", 0, CFSTR("bounceTranslation"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "minValue:maxValue:", 0.0, 5.0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v98[24] = v48;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Bounce Reversal Delay"), CFSTR("bounceReverseAnimationDelay"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v98[25] = v47;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", 0, CFSTR("bounceReverseAnimationDelay"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "minValue:maxValue:", 0.0, 1.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v98[26] = v45;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Cover Sheet Home Affordance Cursor - Top Inset"), CFSTR("coverSheetHomeAffordanceCursorTopEdgeInset"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v98[27] = v44;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", 0, CFSTR("coverSheetHomeAffordanceCursorTopEdgeInset"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "minValue:maxValue:", 0.0, 10.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v98[28] = v42;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Cover Sheet Home Affordance Cursor - Left Inset"), CFSTR("coverSheetHomeAffordanceCursorLeftEdgeInset"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v98[29] = v41;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", 0, CFSTR("coverSheetHomeAffordanceCursorLeftEdgeInset"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "minValue:maxValue:", 0.0, 10.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v98[30] = v39;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Cover Sheet Home Affordance Cursor - Bottom Inset"), CFSTR("coverSheetHomeAffordanceCursorBottomEdgeInset"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v98[31] = v38;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", 0, CFSTR("coverSheetHomeAffordanceCursorBottomEdgeInset"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "minValue:maxValue:", 0.0, 10.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v98[32] = v36;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Cover Sheet Home Affordance Cursor - Right Inset"), CFSTR("coverSheetHomeAffordanceCursorRightEdgeInset"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v98[33] = v35;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", 0, CFSTR("coverSheetHomeAffordanceCursorRightEdgeInset"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "minValue:maxValue:", 0.0, 10.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v98[34] = v33;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Cover Sheet Suppress Animation For Pointer - Top Inset"), CFSTR("coverSheetSuppressAnimationForPointerTopEdgeInset"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v98[35] = v32;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", 0, CFSTR("coverSheetSuppressAnimationForPointerTopEdgeInset"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "minValue:maxValue:", 0.0, 10.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v98[36] = v6;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Cover Sheet Suppress Animation For Pointer - Left Inset"), CFSTR("coverSheetSuppressAnimationForPointerLeftEdgeInset"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v98[37] = v7;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", 0, CFSTR("coverSheetSuppressAnimationForPointerLeftEdgeInset"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "minValue:maxValue:", 0.0, 10.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v98[38] = v9;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Cover Sheet Suppress Animation For Pointer - Bottom Inset"), CFSTR("coverSheetSuppressAnimationForPointerBottomEdgeInset"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v98[39] = v10;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", 0, CFSTR("coverSheetSuppressAnimationForPointerBottomEdgeInset"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minValue:maxValue:", 0.0, 10.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v98[40] = v12;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Cover Sheet Suppress Animation For Pointer - Right Inset"), CFSTR("coverSheetSuppressAnimationForPointerRightEdgeInset"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v98[41] = v13;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", 0, CFSTR("coverSheetSuppressAnimationForPointerRightEdgeInset"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "minValue:maxValue:", 0.0, 10.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v98[42] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v98, 43);
  v95 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83070], "sectionWithRows:title:", v95, CFSTR("Setup"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Bounce"), CFSTR("bounceAnimationSettings"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v97[0] = v91;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Hide"), CFSTR("hideAnimationSettings"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v97[1] = v89;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Unhide"), CFSTR("unhideAnimationSettings"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v97[2] = v87;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Hide For Ownership"), CFSTR("hideForHomeGestureOwnershipAnimationSettings"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v97[3] = v85;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Unhide For Ownership"), CFSTR("unhideForHomeGestureOwnershipAnimationSettings"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v97[4] = v16;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Thin to Prominent"), CFSTR("thinToProminentAnimationSettings"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v97[5] = v17;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Prominent to Thin"), CFSTR("prominentToThinAnimationSettings"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v97[6] = v18;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Forced Prominent to Thin"), CFSTR("forcedProminentToThinAnimationSettings"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v97[7] = v19;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Luma Response"), CFSTR("lumaResponseAnimationSettings"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v97[8] = v20;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Initial Luma Response"), CFSTR("initialLumaResponseAnimationSettings"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v97[9] = v21;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Edge Protect Rubberbanding"), CFSTR("edgeProtectAnimationSettings"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v97[10] = v22;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Rotation: FadeOut"), CFSTR("rotationFadeOutAnimationSettings"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v97[11] = v23;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Rotation: FadeIn"), CFSTR("rotationFadeInAnimationSettings"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v97[12] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v97, 13);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83070], "sectionWithRows:title:", v25, CFSTR("Animations"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)MEMORY[0x1E0D83070];
  v96[0] = v94;
  v96[1] = v93;
  v96[2] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v96, 3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "moduleWithTitle:contents:", 0, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void)setInitializationStyle:(int64_t)a3
{
  self->_initializationStyle = a3;
}

- (void)setRemoveViewOnHide:(BOOL)a3
{
  self->_removeViewOnHide = a3;
}

- (void)setEdgeProtectOverride:(int64_t)a3
{
  self->_edgeProtectOverride = a3;
}

- (void)setAutoHideOverride:(int64_t)a3
{
  self->_autoHideOverride = a3;
}

- (void)setAutoHideTime:(double)a3
{
  self->_autoHideTime = a3;
}

- (void)setAutoHideTimeOnAppRequest:(double)a3
{
  self->_autoHideTimeOnAppRequest = a3;
}

- (BOOL)resetAutoHideTimeOnRotation
{
  return self->_resetAutoHideTimeOnRotation;
}

- (void)setResetAutoHideTimeOnRotation:(BOOL)a3
{
  self->_resetAutoHideTimeOnRotation = a3;
}

- (double)delayForUnhideOnTouch
{
  return self->_delayForUnhideOnTouch;
}

- (void)setDelayForUnhideOnTouch:(double)a3
{
  self->_delayForUnhideOnTouch = a3;
}

- (void)setDelayForUnhideOnAppRequest:(double)a3
{
  self->_delayForUnhideOnAppRequest = a3;
}

- (void)setVisualizeHitTestRect:(BOOL)a3
{
  self->_visualizeHitTestRect = a3;
}

- (BOOL)constrainHitTestRectToSafeAreaInset
{
  return self->_constrainHitTestRectToSafeAreaInset;
}

- (void)setConstrainHitTestRectToSafeAreaInset:(BOOL)a3
{
  self->_constrainHitTestRectToSafeAreaInset = a3;
}

- (double)hitTestOutsetTop
{
  return self->_hitTestOutsetTop;
}

- (void)setHitTestOutsetTop:(double)a3
{
  self->_hitTestOutsetTop = a3;
}

- (double)hitTestOutsetSides
{
  return self->_hitTestOutsetSides;
}

- (void)setHitTestOutsetSides:(double)a3
{
  self->_hitTestOutsetSides = a3;
}

- (double)hitTestOutsetDoubleTap
{
  return self->_hitTestOutsetDoubleTap;
}

- (void)setHitTestOutsetDoubleTap:(double)a3
{
  self->_hitTestOutsetDoubleTap = a3;
}

- (BOOL)isSingleTapGatingEnabled
{
  return self->_singleTapGatingEnabled;
}

- (void)setSingleTapGatingEnabled:(BOOL)a3
{
  self->_singleTapGatingEnabled = a3;
}

- (double)bounceTranslation
{
  return self->_bounceTranslation;
}

- (void)setBounceTranslation:(double)a3
{
  self->_bounceTranslation = a3;
}

- (double)bounceReverseAnimationDelay
{
  return self->_bounceReverseAnimationDelay;
}

- (void)setBounceReverseAnimationDelay:(double)a3
{
  self->_bounceReverseAnimationDelay = a3;
}

- (SBFFluidBehaviorSettings)bounceAnimationSettings
{
  return self->_bounceAnimationSettings;
}

- (void)setBounceAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_bounceAnimationSettings, a3);
}

- (SBFAnimationSettings)hideAnimationSettings
{
  return self->_hideAnimationSettings;
}

- (void)setHideAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_hideAnimationSettings, a3);
}

- (void)setUnhideAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_unhideAnimationSettings, a3);
}

- (SBFAnimationSettings)hideForHomeGestureOwnershipAnimationSettings
{
  return self->_hideForHomeGestureOwnershipAnimationSettings;
}

- (void)setHideForHomeGestureOwnershipAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_hideForHomeGestureOwnershipAnimationSettings, a3);
}

- (void)setUnhideForHomeGestureOwnershipAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_unhideForHomeGestureOwnershipAnimationSettings, a3);
}

- (void)setThinToProminentAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_thinToProminentAnimationSettings, a3);
}

- (void)setProminentToThinAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_prominentToThinAnimationSettings, a3);
}

- (SBFAnimationSettings)forcedProminentToThinAnimationSettings
{
  return self->_forcedProminentToThinAnimationSettings;
}

- (void)setForcedProminentToThinAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_forcedProminentToThinAnimationSettings, a3);
}

- (void)setLumaResponseAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_lumaResponseAnimationSettings, a3);
}

- (void)setInitialLumaResponseAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_initialLumaResponseAnimationSettings, a3);
}

- (SBFAnimationSettings)rotationFadeOutAnimationSettings
{
  return self->_rotationFadeOutAnimationSettings;
}

- (void)setRotationFadeOutAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_rotationFadeOutAnimationSettings, a3);
}

- (SBFAnimationSettings)rotationFadeInAnimationSettings
{
  return self->_rotationFadeInAnimationSettings;
}

- (void)setRotationFadeInAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_rotationFadeInAnimationSettings, a3);
}

- (SBFFluidBehaviorSettings)edgeProtectAnimationSettings
{
  return self->_edgeProtectAnimationSettings;
}

- (void)setEdgeProtectAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_edgeProtectAnimationSettings, a3);
}

- (double)coverSheetHomeAffordanceCursorTopEdgeInset
{
  return self->_coverSheetHomeAffordanceCursorTopEdgeInset;
}

- (void)setCoverSheetHomeAffordanceCursorTopEdgeInset:(double)a3
{
  self->_coverSheetHomeAffordanceCursorTopEdgeInset = a3;
}

- (double)coverSheetHomeAffordanceCursorBottomEdgeInset
{
  return self->_coverSheetHomeAffordanceCursorBottomEdgeInset;
}

- (void)setCoverSheetHomeAffordanceCursorBottomEdgeInset:(double)a3
{
  self->_coverSheetHomeAffordanceCursorBottomEdgeInset = a3;
}

- (double)coverSheetHomeAffordanceCursorLeftEdgeInset
{
  return self->_coverSheetHomeAffordanceCursorLeftEdgeInset;
}

- (void)setCoverSheetHomeAffordanceCursorLeftEdgeInset:(double)a3
{
  self->_coverSheetHomeAffordanceCursorLeftEdgeInset = a3;
}

- (double)coverSheetHomeAffordanceCursorRightEdgeInset
{
  return self->_coverSheetHomeAffordanceCursorRightEdgeInset;
}

- (void)setCoverSheetHomeAffordanceCursorRightEdgeInset:(double)a3
{
  self->_coverSheetHomeAffordanceCursorRightEdgeInset = a3;
}

- (double)coverSheetSuppressAnimationForPointerTopEdgeInset
{
  return self->_coverSheetSuppressAnimationForPointerTopEdgeInset;
}

- (void)setCoverSheetSuppressAnimationForPointerTopEdgeInset:(double)a3
{
  self->_coverSheetSuppressAnimationForPointerTopEdgeInset = a3;
}

- (double)coverSheetSuppressAnimationForPointerBottomEdgeInset
{
  return self->_coverSheetSuppressAnimationForPointerBottomEdgeInset;
}

- (void)setCoverSheetSuppressAnimationForPointerBottomEdgeInset:(double)a3
{
  self->_coverSheetSuppressAnimationForPointerBottomEdgeInset = a3;
}

- (double)coverSheetSuppressAnimationForPointerLeftEdgeInset
{
  return self->_coverSheetSuppressAnimationForPointerLeftEdgeInset;
}

- (void)setCoverSheetSuppressAnimationForPointerLeftEdgeInset:(double)a3
{
  self->_coverSheetSuppressAnimationForPointerLeftEdgeInset = a3;
}

- (double)coverSheetSuppressAnimationForPointerRightEdgeInset
{
  return self->_coverSheetSuppressAnimationForPointerRightEdgeInset;
}

- (void)setCoverSheetSuppressAnimationForPointerRightEdgeInset:(double)a3
{
  self->_coverSheetSuppressAnimationForPointerRightEdgeInset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edgeProtectAnimationSettings, 0);
  objc_storeStrong((id *)&self->_rotationFadeInAnimationSettings, 0);
  objc_storeStrong((id *)&self->_rotationFadeOutAnimationSettings, 0);
  objc_storeStrong((id *)&self->_initialLumaResponseAnimationSettings, 0);
  objc_storeStrong((id *)&self->_lumaResponseAnimationSettings, 0);
  objc_storeStrong((id *)&self->_forcedProminentToThinAnimationSettings, 0);
  objc_storeStrong((id *)&self->_prominentToThinAnimationSettings, 0);
  objc_storeStrong((id *)&self->_thinToProminentAnimationSettings, 0);
  objc_storeStrong((id *)&self->_unhideForHomeGestureOwnershipAnimationSettings, 0);
  objc_storeStrong((id *)&self->_hideForHomeGestureOwnershipAnimationSettings, 0);
  objc_storeStrong((id *)&self->_unhideAnimationSettings, 0);
  objc_storeStrong((id *)&self->_hideAnimationSettings, 0);
  objc_storeStrong((id *)&self->_bounceAnimationSettings, 0);
}

@end
