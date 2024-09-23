@implementation SBLockScreenDefaults

- (void)_bindAndRegisterDefaults
{
  void *v3;
  uint64_t v4;
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
  uint64_t v15;
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
  id v31;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "limitFeaturesForRemoteLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C9AAA0];
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v3, CFSTR("SBFeaturesLockedForRemoteLock"), MEMORY[0x1E0C9AAA0], 6);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "showLegalText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MEMORY[0x18D773CC8]("-[SBLockScreenDefaults _bindAndRegisterDefaults]"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v5, CFSTR("SBShowLegalTextOnLockScreen"), v6, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "showAuthenticationEngineeringUI");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v7, CFSTR("SBShowAuthenticationEngineeringUI"), v4, 4);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "showSupervisionText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v8, CFSTR("SBShowSupervisionTextOnLockScreen"), v4, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "showQuickNoteFingerGestureRecognizer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v9, CFSTR("SBShowQuickNoteFingerGestureRecognizer"), v4, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "forceWakeToMaps");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v10, CFSTR("SBCoverSheetForceWakeToMaps"), v4, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nowPlayingTimeout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v11, CFSTR("SBCoverSheetPlayerTimeout"), &unk_1E203B538, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "weDontNeedNoEducation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v12, CFSTR("SBCoverSheetWeDontNeedNoEducation"), v4, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "useDefaultsValuesForCameraPrewarm");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v13, CFSTR("SBCoverSheetUseDefaultsValuesForCameraPrewarm"), v4, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "prewarmCameraOnSwipe");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C9AAB0];
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v14, CFSTR("SBCoverSheetPrewarmCameraOnSwipe"), MEMORY[0x1E0C9AAB0], 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "cameraSwipePrewarmThreshold");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v16, CFSTR("SBCoverSheetCameraPrewarmThreshold"), &unk_1E203B548, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "prelaunchCameraOnSwipe");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v17, CFSTR("SBCoverSheetPrelaunchCameraOnSwipe"), v15, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "cameraSwipePrelaunchThreshold");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v18, CFSTR("SBCoverSheetCameraPrelaunchThreshold"), &unk_1E203B548, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "prewarmCameraOnButtonTouch");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v19, CFSTR("SBCoverSheetPrewarmCameraOnButtonTouch"), v15, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "prelaunchCameraOnButtonTouch");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v20, CFSTR("SBCoverSheetPrelaunchCameraOnButtonTouch"), v15, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "useDefaultsValuesForDateTimeOverrides");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v21, CFSTR("SBCoverSheetUseDefaultsForDateTimeOverrides"), v4, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "dateTimeOverridesIntervalSince1970");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v22, CFSTR("SBCoverSheetOverridesDateTimeIntervalSince1970"), &unk_1E203A8D0, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "overridesDateTimeToDefaultToday");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v23, CFSTR("SBCoverSheetOverridesDateTimeToDefaultToday"), v4, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "overridesDateTimeToDefaultPast");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v24, CFSTR("SBCoverSheetOverridesDateTimeToDefaultPast"), v4, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "sessionTestWidgetInfo");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v25, CFSTR("SBCoverSheetSessionTestWidgetInfo"), 0, 4);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "quickActionOverrideBundleLeading");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v26, CFSTR("SBCoverSheetQuickActionOverrideBundleLeading"), 0, 4);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "quickActionOverrideContainerLeading");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v27, CFSTR("SBCoverSheetQuickActionOverrideContainerLeading"), 0, 4);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "quickActionOverrideKindLeading");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v28, CFSTR("SBCoverSheetQuickActionOverrideKindLeading"), 0, 4);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "quickActionOverrideBundleTrailing");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v29, CFSTR("SBCoverSheetQuickActionOverrideBundleTrailing"), 0, 4);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "quickActionOverrideContainerTrailing");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v30, CFSTR("SBCoverSheetQuickActionOverrideContainerTrailing"), 0, 4);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "quickActionOverrideKindTrailing");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v31, CFSTR("SBCoverSheetQuickActionOverrideKindTrailing"), 0, 4);

}

@end
