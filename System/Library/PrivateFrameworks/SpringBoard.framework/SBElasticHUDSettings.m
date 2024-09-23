@implementation SBElasticHUDSettings

- (float)volumeStepDelta
{
  return self->_volumeStepDelta;
}

- (void)setDefaultValues
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  NSStringFromCGRect(*(CGRect *)&a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_10(&dword_1D0540000, v5, v6, "(ElasticHUD) volumeUpButtonNormalizedFrame is invalid: %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_2_2();
}

double __40__SBElasticHUDSettings_setDefaultValues__block_invoke(int a1, CFTypeRef cf)
{
  double v2;
  CFTypeID v4;

  v2 = *MEMORY[0x1E0C9D628];
  if (cf)
  {
    v4 = CFGetTypeID(cf);
    if (v4 == CFDataGetTypeID())
      v2 = *(double *)CFDataGetBytePtr((CFDataRef)cf);
    CFRelease(cf);
  }
  return v2;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v65;
  void *v66;
  _QWORD v67[10];

  v67[9] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v3 = (void *)MEMORY[0x1E0D83070];
  __48__SBElasticHUDSettings_settingsControllerModule__block_invoke();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionWithRows:title:", v4, CFSTR("Volume Control"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "addObject:", v5);
  v6 = (void *)MEMORY[0x1E0D83070];
  __48__SBElasticHUDSettings_settingsControllerModule__block_invoke_2();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionWithRows:title:", v7, CFSTR("Brightness Control"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "addObject:", v8);
  v9 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Default (Transition)"), CFSTR("defaultTransitionSettings"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67[0] = v66;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Default (Position)"), CFSTR("defaultPositionSettings"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v67[1] = v65;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Base-to-Initial (Transition)"), CFSTR("baseToInitialTransitionSettings"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v67[2] = v10;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Base-to-Initial (Position)"), CFSTR("baseToInitialPositionSettings"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v67[3] = v11;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Deflation Transition"), CFSTR("deflationTransitionSettings"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v67[4] = v12;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Deflated-to-Base (Transition)"), CFSTR("deflatingToBaseTransitionSettings"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v67[5] = v13;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Deflated-to-Base (Position)"), CFSTR("deflatingToBasePositionSettings"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v67[6] = v14;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("General To-Base Transition"), CFSTR("generalToBaseTransitionSettings"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v67[7] = v15;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Compact-To-Base Transition"), CFSTR("compactToBaseTransitionSettings"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v67[8] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sectionWithRows:title:", v17, CFSTR("Animation Settings"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "addObject:", v18);
  v19 = (void *)MEMORY[0x1E0D83070];
  __48__SBElasticHUDSettings_settingsControllerModule__block_invoke_3();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sectionWithRows:title:", v20, CFSTR("Metrics"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "addObject:", v21);
  v22 = (void *)MEMORY[0x1E0D83070];
  __48__SBElasticHUDSettings_settingsControllerModule__block_invoke_4();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "sectionWithRows:title:", v23, CFSTR("Dismissal Timing"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "addObject:", v24);
  v25 = (void *)MEMORY[0x1E0D83070];
  __48__SBElasticHUDSettings_settingsControllerModule__block_invoke_5();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "sectionWithRows:title:", v26, CFSTR("Interaction Legibility"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "addObject:", v27);
  v28 = (void *)MEMORY[0x1E0D83070];
  __48__SBElasticHUDSettings_settingsControllerModule__block_invoke_6();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "sectionWithRows:title:", v29, CFSTR("General Landscape"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "addObject:", v30);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "userInterfaceIdiom");

  if ((v32 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    v33 = (void *)MEMORY[0x1E0D83070];
    __48__SBElasticHUDSettings_settingsControllerModule__block_invoke_7();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "sectionWithRows:title:", v34, CFSTR("General Portrait"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "addObject:", v35);
  }
  v36 = (void *)MEMORY[0x1E0D83070];
  __48__SBElasticHUDSettings_settingsControllerModule__block_invoke_8();
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "sectionWithRows:title:", v37, CFSTR("Initial State Landscape"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "addObject:", v38);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "userInterfaceIdiom");

  if ((v40 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    v41 = (void *)MEMORY[0x1E0D83070];
    __48__SBElasticHUDSettings_settingsControllerModule__block_invoke_9();
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "sectionWithRows:title:", v42, CFSTR("Initial State Portrait"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "addObject:", v43);
  }
  v44 = (void *)MEMORY[0x1E0D83070];
  __48__SBElasticHUDSettings_settingsControllerModule__block_invoke_10();
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "sectionWithRows:title:", v45, CFSTR("Compact State Landscape"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "addObject:", v46);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "userInterfaceIdiom");

  if ((v48 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    v49 = (void *)MEMORY[0x1E0D83070];
    __48__SBElasticHUDSettings_settingsControllerModule__block_invoke_11();
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "sectionWithRows:title:", v50, CFSTR("Compact State Portrait"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "addObject:", v51);
  }
  v52 = (void *)MEMORY[0x1E0D83070];
  __48__SBElasticHUDSettings_settingsControllerModule__block_invoke_12();
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "sectionWithRows:title:", v53, CFSTR("Interacting State Landscape"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "addObject:", v54);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "userInterfaceIdiom");

  if ((v56 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    v57 = (void *)MEMORY[0x1E0D83070];
    __48__SBElasticHUDSettings_settingsControllerModule__block_invoke_13();
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "sectionWithRows:title:", v58, CFSTR("Interacting State Portrait"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "addObject:", v59);
  }
  v60 = (void *)MEMORY[0x1E0D83070];
  __41__SBHUDSettings_settingsControllerModule__block_invoke_2();
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "sectionWithRows:", v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "addObject:", v62);
  objc_msgSend(MEMORY[0x1E0D83070], "moduleWithTitle:contents:", CFSTR("Elastic HUD Settings"), v2);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  return v63;
}

id __48__SBElasticHUDSettings_settingsControllerModule__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Volume Step"), CFSTR("volumeStepDelta"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setMaxValue:", 0.1);
  objc_msgSend(v1, "setMinValue:", 0.01);
  objc_msgSend(v0, "addObject:", v1);
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Show Debug UI"), CFSTR("showDebugUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Auto Dismiss"), CFSTR("autoDismiss"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v2);
  objc_msgSend(v0, "addObject:", v3);

  return v0;
}

id __48__SBElasticHUDSettings_settingsControllerModule__block_invoke_2()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Change Display with ⌘+↑↓"), CFSTR("displayBrightnessKeyCommandsEnabled"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Change Keyboard with ^+⌘+↑↓"), CFSTR("keyboardBrightnessKeyCommandsEnabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v1);
  objc_msgSend(v0, "addObject:", v2);

  return v0;
}

id __48__SBElasticHUDSettings_settingsControllerModule__block_invoke_3()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[6];

  v10[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Base Scale Factor"), CFSTR("baseScaleFactor"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Deflated Scale Factor"), CFSTR("deflatedScaleFactor"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Compact Stretch Amount"), CFSTR("compactStretchAmount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "precision:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Interacting Stretch Amount"), CFSTR("interactingStretchAmount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "precision:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Label Padding"), CFSTR("labelPadding"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "precision:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v0;
  v10[1] = v1;
  v10[2] = v3;
  v10[3] = v5;
  v10[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __48__SBElasticHUDSettings_settingsControllerModule__block_invoke_4()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Dismissal Interval"), CFSTR("dismissalInterval"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "precision:", 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Deflation Dismissal Interval"), CFSTR("deflationDismissalInterval"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "precision:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Post-Transition Dismissal Interval"), CFSTR("postTransitionDismissalInterval"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "precision:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = v1;
  v8[1] = v3;
  v8[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __48__SBElasticHUDSettings_settingsControllerModule__block_invoke_5()
{
  void *v0;
  void *v1;
  void *v2;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Dimming Alpha"), CFSTR("dimmingAlpha"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Legibility Strength"), CFSTR("legibilityStrength"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  v4[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __48__SBElasticHUDSettings_settingsControllerModule__block_invoke_6()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("On-screen Top Margin"), CFSTR("onscreenTopMargin"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "precision:", 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Off-screen Top Margin"), CFSTR("offscreenTopMargin"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "precision:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Landscape Corner Radius Fraction"), CFSTR("landscapeCornerRadiusFraction"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "precision:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = v3;
  v8[1] = v1;
  v8[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __48__SBElasticHUDSettings_settingsControllerModule__block_invoke_7()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Center Y Position"), CFSTR("volumeButtonsCenterY"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "precision:", 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("On-screen Leading Margin"), CFSTR("onscreenLeadingMargin"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "precision:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Off-screen Leading Margin"), CFSTR("offscreenLeadingMargin"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "precision:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Portrait Corner Radius Fraction"), CFSTR("portraitCornerRadiusFraction"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "precision:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v1;
  v10[1] = v3;
  v10[2] = v5;
  v10[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __48__SBElasticHUDSettings_settingsControllerModule__block_invoke_8()
{
  void *v0;
  void *v1;
  void *v2;
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;

  v0 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("width"), CFSTR("landscapeState1Width"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  objc_msgSend(v1, "minValue:maxValue:", 50.0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v0, "addObject:", v4);
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("width"), CFSTR("landscapeState1Width"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v5);
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("height"), CFSTR("landscapeState1Height"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  objc_msgSend(v6, "minValue:maxValue:", 5.0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v0, "addObject:", v9);
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("height"), CFSTR("landscapeState1Height"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v10);

  return v0;
}

id __48__SBElasticHUDSettings_settingsControllerModule__block_invoke_9()
{
  void *v0;
  void *v1;
  void *v2;
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;

  v0 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("width (slider)"), CFSTR("portraitState1Width"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  objc_msgSend(v1, "minValue:maxValue:", 50.0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v0, "addObject:", v4);
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("width"), CFSTR("portraitState1Width"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v5);
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("height (slider)"), CFSTR("portraitState1Height"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  objc_msgSend(v6, "minValue:maxValue:", 5.0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v0, "addObject:", v9);
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("height"), CFSTR("portraitState1Height"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v10);

  return v0;
}

id __48__SBElasticHUDSettings_settingsControllerModule__block_invoke_10()
{
  void *v0;
  void *v1;
  void *v2;
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;

  v0 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("width (slider)"), CFSTR("landscapeState2Width"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  objc_msgSend(v1, "minValue:maxValue:", 50.0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v0, "addObject:", v4);
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("width"), CFSTR("landscapeState2Width"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v5);
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("height (slider)"), CFSTR("landscapeState2Height"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  objc_msgSend(v6, "minValue:maxValue:", 5.0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v0, "addObject:", v9);
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("height"), CFSTR("landscapeState2Height"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v10);

  return v0;
}

id __48__SBElasticHUDSettings_settingsControllerModule__block_invoke_11()
{
  void *v0;
  void *v1;
  void *v2;
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;

  v0 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("width (slider)"), CFSTR("portraitState2Width"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  objc_msgSend(v1, "minValue:maxValue:", 50.0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v0, "addObject:", v4);
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("width"), CFSTR("portraitState2Width"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v5);
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("height (slider)"), CFSTR("portraitState2Height"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  objc_msgSend(v6, "minValue:maxValue:", 5.0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v0, "addObject:", v9);
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("height"), CFSTR("portraitState2Height"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v10);

  return v0;
}

id __48__SBElasticHUDSettings_settingsControllerModule__block_invoke_12()
{
  void *v0;
  void *v1;
  void *v2;
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;

  v0 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("width (slider)"), CFSTR("landscapeState3Width"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  objc_msgSend(v1, "minValue:maxValue:", 50.0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v0, "addObject:", v4);
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("width"), CFSTR("landscapeState3Width"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v5);
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("height (slider)"), CFSTR("landscapeState3Height"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  objc_msgSend(v6, "minValue:maxValue:", 5.0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v0, "addObject:", v9);
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("height"), CFSTR("landscapeState3Height"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v10);

  return v0;
}

id __48__SBElasticHUDSettings_settingsControllerModule__block_invoke_13()
{
  void *v0;
  void *v1;
  void *v2;
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;

  v0 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("width (slider)"), CFSTR("portraitState3Width"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  objc_msgSend(v1, "minValue:maxValue:", 50.0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v0, "addObject:", v4);
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("width"), CFSTR("portraitState3Width"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v5);
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("height (slider)"), CFSTR("portraitState3Height"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  objc_msgSend(v6, "minValue:maxValue:", 5.0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v0, "addObject:", v9);
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("height"), CFSTR("portraitState3Height"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v10);

  return v0;
}

- (SBFFluidBehaviorSettings)defaultTransitionSettings
{
  return self->_defaultTransitionSettings;
}

- (void)setDefaultTransitionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_defaultTransitionSettings, a3);
}

- (SBFFluidBehaviorSettings)defaultPositionSettings
{
  return self->_defaultPositionSettings;
}

- (void)setDefaultPositionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_defaultPositionSettings, a3);
}

- (SBFFluidBehaviorSettings)baseToInitialTransitionSettings
{
  return self->_baseToInitialTransitionSettings;
}

- (void)setBaseToInitialTransitionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_baseToInitialTransitionSettings, a3);
}

- (SBFFluidBehaviorSettings)baseToInitialPositionSettings
{
  return self->_baseToInitialPositionSettings;
}

- (void)setBaseToInitialPositionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_baseToInitialPositionSettings, a3);
}

- (SBFFluidBehaviorSettings)deflationTransitionSettings
{
  return self->_deflationTransitionSettings;
}

- (void)setDeflationTransitionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_deflationTransitionSettings, a3);
}

- (SBFFluidBehaviorSettings)deflatingToBaseTransitionSettings
{
  return self->_deflatingToBaseTransitionSettings;
}

- (void)setDeflatingToBaseTransitionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_deflatingToBaseTransitionSettings, a3);
}

- (SBFFluidBehaviorSettings)deflatingToBasePositionSettings
{
  return self->_deflatingToBasePositionSettings;
}

- (void)setDeflatingToBasePositionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_deflatingToBasePositionSettings, a3);
}

- (SBFFluidBehaviorSettings)generalToBaseTransitionSettings
{
  return self->_generalToBaseTransitionSettings;
}

- (void)setGeneralToBaseTransitionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_generalToBaseTransitionSettings, a3);
}

- (SBFFluidBehaviorSettings)compactToBaseTransitionSettings
{
  return self->_compactToBaseTransitionSettings;
}

- (void)setCompactToBaseTransitionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_compactToBaseTransitionSettings, a3);
}

- (double)baseScaleFactor
{
  return self->_baseScaleFactor;
}

- (void)setBaseScaleFactor:(double)a3
{
  self->_baseScaleFactor = a3;
}

- (double)deflatedScaleFactor
{
  return self->_deflatedScaleFactor;
}

- (void)setDeflatedScaleFactor:(double)a3
{
  self->_deflatedScaleFactor = a3;
}

- (double)compactStretchAmount
{
  return self->_compactStretchAmount;
}

- (void)setCompactStretchAmount:(double)a3
{
  self->_compactStretchAmount = a3;
}

- (double)interactingStretchAmount
{
  return self->_interactingStretchAmount;
}

- (void)setInteractingStretchAmount:(double)a3
{
  self->_interactingStretchAmount = a3;
}

- (double)labelPadding
{
  return self->_labelPadding;
}

- (void)setLabelPadding:(double)a3
{
  self->_labelPadding = a3;
}

- (double)dismissalInterval
{
  return self->_dismissalInterval;
}

- (void)setDismissalInterval:(double)a3
{
  self->_dismissalInterval = a3;
}

- (double)deflationDismissalInterval
{
  return self->_deflationDismissalInterval;
}

- (void)setDeflationDismissalInterval:(double)a3
{
  self->_deflationDismissalInterval = a3;
}

- (double)postTransitionDismissalInterval
{
  return self->_postTransitionDismissalInterval;
}

- (void)setPostTransitionDismissalInterval:(double)a3
{
  self->_postTransitionDismissalInterval = a3;
}

- (double)dimmingAlpha
{
  return self->_dimmingAlpha;
}

- (void)setDimmingAlpha:(double)a3
{
  self->_dimmingAlpha = a3;
}

- (double)legibilityStrength
{
  return self->_legibilityStrength;
}

- (void)setLegibilityStrength:(double)a3
{
  self->_legibilityStrength = a3;
}

- (double)onscreenTopMargin
{
  return self->_onscreenTopMargin;
}

- (void)setOnscreenTopMargin:(double)a3
{
  self->_onscreenTopMargin = a3;
}

- (double)offscreenTopMargin
{
  return self->_offscreenTopMargin;
}

- (void)setOffscreenTopMargin:(double)a3
{
  self->_offscreenTopMargin = a3;
}

- (double)landscapeCornerRadiusFraction
{
  return self->_landscapeCornerRadiusFraction;
}

- (void)setLandscapeCornerRadiusFraction:(double)a3
{
  self->_landscapeCornerRadiusFraction = a3;
}

- (double)volumeButtonsCenterY
{
  return self->_volumeButtonsCenterY;
}

- (void)setVolumeButtonsCenterY:(double)a3
{
  self->_volumeButtonsCenterY = a3;
}

- (double)onscreenLeadingMargin
{
  return self->_onscreenLeadingMargin;
}

- (void)setOnscreenLeadingMargin:(double)a3
{
  self->_onscreenLeadingMargin = a3;
}

- (double)offscreenLeadingMargin
{
  return self->_offscreenLeadingMargin;
}

- (void)setOffscreenLeadingMargin:(double)a3
{
  self->_offscreenLeadingMargin = a3;
}

- (double)portraitCornerRadiusFraction
{
  return self->_portraitCornerRadiusFraction;
}

- (void)setPortraitCornerRadiusFraction:(double)a3
{
  self->_portraitCornerRadiusFraction = a3;
}

- (double)landscapeState1Width
{
  return self->_landscapeState1Width;
}

- (void)setLandscapeState1Width:(double)a3
{
  self->_landscapeState1Width = a3;
}

- (double)landscapeState2Width
{
  return self->_landscapeState2Width;
}

- (void)setLandscapeState2Width:(double)a3
{
  self->_landscapeState2Width = a3;
}

- (double)landscapeState3Width
{
  return self->_landscapeState3Width;
}

- (void)setLandscapeState3Width:(double)a3
{
  self->_landscapeState3Width = a3;
}

- (double)landscapeState1Height
{
  return self->_landscapeState1Height;
}

- (void)setLandscapeState1Height:(double)a3
{
  self->_landscapeState1Height = a3;
}

- (double)landscapeState2Height
{
  return self->_landscapeState2Height;
}

- (void)setLandscapeState2Height:(double)a3
{
  self->_landscapeState2Height = a3;
}

- (double)landscapeState3Height
{
  return self->_landscapeState3Height;
}

- (void)setLandscapeState3Height:(double)a3
{
  self->_landscapeState3Height = a3;
}

- (double)portraitState1Width
{
  return self->_portraitState1Width;
}

- (void)setPortraitState1Width:(double)a3
{
  self->_portraitState1Width = a3;
}

- (double)portraitState2Width
{
  return self->_portraitState2Width;
}

- (void)setPortraitState2Width:(double)a3
{
  self->_portraitState2Width = a3;
}

- (double)portraitState3Width
{
  return self->_portraitState3Width;
}

- (void)setPortraitState3Width:(double)a3
{
  self->_portraitState3Width = a3;
}

- (double)portraitState1Height
{
  return self->_portraitState1Height;
}

- (void)setPortraitState1Height:(double)a3
{
  self->_portraitState1Height = a3;
}

- (double)portraitState2Height
{
  return self->_portraitState2Height;
}

- (void)setPortraitState2Height:(double)a3
{
  self->_portraitState2Height = a3;
}

- (double)portraitState3Height
{
  return self->_portraitState3Height;
}

- (void)setPortraitState3Height:(double)a3
{
  self->_portraitState3Height = a3;
}

- (BOOL)showDebugUI
{
  return self->_showDebugUI;
}

- (void)setShowDebugUI:(BOOL)a3
{
  self->_showDebugUI = a3;
}

- (BOOL)autoDismiss
{
  return self->_autoDismiss;
}

- (void)setAutoDismiss:(BOOL)a3
{
  self->_autoDismiss = a3;
}

- (void)setVolumeStepDelta:(float)a3
{
  self->_volumeStepDelta = a3;
}

- (BOOL)displayBrightnessKeyCommandsEnabled
{
  return self->_displayBrightnessKeyCommandsEnabled;
}

- (void)setDisplayBrightnessKeyCommandsEnabled:(BOOL)a3
{
  self->_displayBrightnessKeyCommandsEnabled = a3;
}

- (BOOL)keyboardBrightnessKeyCommandsEnabled
{
  return self->_keyboardBrightnessKeyCommandsEnabled;
}

- (void)setKeyboardBrightnessKeyCommandsEnabled:(BOOL)a3
{
  self->_keyboardBrightnessKeyCommandsEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compactToBaseTransitionSettings, 0);
  objc_storeStrong((id *)&self->_generalToBaseTransitionSettings, 0);
  objc_storeStrong((id *)&self->_deflatingToBasePositionSettings, 0);
  objc_storeStrong((id *)&self->_deflatingToBaseTransitionSettings, 0);
  objc_storeStrong((id *)&self->_deflationTransitionSettings, 0);
  objc_storeStrong((id *)&self->_baseToInitialPositionSettings, 0);
  objc_storeStrong((id *)&self->_baseToInitialTransitionSettings, 0);
  objc_storeStrong((id *)&self->_defaultPositionSettings, 0);
  objc_storeStrong((id *)&self->_defaultTransitionSettings, 0);
}

@end
