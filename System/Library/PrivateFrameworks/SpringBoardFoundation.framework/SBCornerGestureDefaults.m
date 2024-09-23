@implementation SBCornerGestureDefaults

- (void)_migrateSkyDefaultsIfNecessary
{
  void *v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  const char *v11;
  int v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  __CFString *v16;
  int v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  const __CFString *v22;
  const char *v23;
  int v24;
  int v25;
  int v26;
  int v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  const __CFString *v31;
  const __CFString *v32;
  void *v33;
  _BYTE v34[22];
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  -[BSAbstractDefaultDomain _store](self, "_store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "bs_defaultExists:", CFSTR("SBBottomLeftCornerGestureFeature"));
  if (v4 != objc_msgSend(v3, "bs_defaultExists:", CFSTR("SBBottomLeftCornerGestureTouchTypes")))
  {
    SBLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      _SBFLoggingMethodProem(self, 0);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      *(_DWORD *)v34 = 138543874;
      if (v4)
        v8 = CFSTR("SBBottomLeftCornerGestureFeature");
      else
        v8 = CFSTR("SBBottomLeftCornerGestureTouchTypes");
      if (v4)
        v9 = CFSTR("SBBottomLeftCornerGestureTouchTypes");
      else
        v9 = CFSTR("SBBottomLeftCornerGestureFeature");
      *(_QWORD *)&v34[4] = v6;
      *(_WORD *)&v34[12] = 2114;
      *(_QWORD *)&v34[14] = v8;
      v35 = 2114;
      v36 = v9;
      _os_log_error_impl(&dword_18AB69000, v5, OS_LOG_TYPE_ERROR, "%{public}@ expecting both new left corner defaults to exist but only %{public}@ does (%{public}@ doesn't exist)", v34, 0x20u);

    }
    goto LABEL_25;
  }
  if ((v4 & 1) != 0)
  {
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("SBApplePencilScreenshotFromCorner"));
    SBLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      goto LABEL_25;
    _SBFLoggingMethodProem(self, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v34 = 138543362;
    *(_QWORD *)&v34[4] = v10;
    v11 = "%{public}@ keys exist for bottom left corner; skipping migration.";
LABEL_24:
    _os_log_impl(&dword_18AB69000, v5, OS_LOG_TYPE_DEFAULT, v11, v34, 0xCu);

    goto LABEL_25;
  }
  if (!objc_msgSend(v3, "bs_defaultExists:", CFSTR("SBApplePencilScreenshotFromCorner")))
  {
    SBLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      goto LABEL_25;
    _SBFLoggingMethodProem(self, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v34 = 138543362;
    *(_QWORD *)&v34[4] = v10;
    v11 = "%{public}@ new and legacy keys do not exist for bottom left corner; skipping migration.";
    goto LABEL_24;
  }
  objc_msgSend(v3, "setInteger:forKey:", 0, CFSTR("SBBottomLeftCornerGestureFeature"));
  v12 = objc_msgSend(v3, "BOOLForKey:", CFSTR("SBApplePencilScreenshotFromCorner"));
  if (v12)
    v13 = 2;
  else
    v13 = 0;
  objc_msgSend(v3, "setInteger:forKey:", v13, CFSTR("SBBottomLeftCornerGestureTouchTypes"));
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("SBApplePencilScreenshotFromCorner"));
  SBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem(self, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      v15 = CFSTR("ENABLED");
    else
      v15 = CFSTR("DISABLED");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v34 = 138543874;
    *(_QWORD *)&v34[4] = v14;
    *(_WORD *)&v34[12] = 2114;
    *(_QWORD *)&v34[14] = v15;
    v35 = 2114;
    v36 = v16;
    _os_log_impl(&dword_18AB69000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ migrated screenshot %{public}@ default to bottom left corner mapped to screenshot for touch types %{public}@", v34, 0x20u);

  }
LABEL_25:

  v17 = objc_msgSend(v3, "bs_defaultExists:", CFSTR("SBBottomRightCornerGestureFeature"));
  if (v17 == objc_msgSend(v3, "bs_defaultExists:", CFSTR("SBBottomRightCornerGestureTouchTypes")))
  {
    if ((v17 & 1) != 0)
    {
      objc_msgSend(v3, "removeObjectForKey:", CFSTR("SBApplePencilPaperFromCorner"));
      objc_msgSend(v3, "removeObjectForKey:", CFSTR("SBFingerSwipePaperFromCorner"));
      SBLogCommon();
      v18 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        goto LABEL_58;
      _SBFLoggingMethodProem(self, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v34 = 138543362;
      *(_QWORD *)&v34[4] = v20;
      v23 = "%{public}@ keys exist for bottom right corner; skipping migration.";
    }
    else
    {
      v24 = objc_msgSend(v3, "bs_defaultExists:", CFSTR("SBApplePencilPaperFromCorner"));
      v25 = objc_msgSend(v3, "bs_defaultExists:", CFSTR("SBFingerSwipePaperFromCorner"));
      v26 = v25;
      if ((v24 & 1) != 0 || v25)
      {
        v27 = 1;
        objc_msgSend(v3, "setInteger:forKey:", 1, CFSTR("SBBottomRightCornerGestureFeature"), *(_OWORD *)v34);
        if (v24)
          v27 = objc_msgSend(v3, "BOOLForKey:", CFSTR("SBApplePencilPaperFromCorner"));
        if (v26)
          v28 = objc_msgSend(v3, "BOOLForKey:", CFSTR("SBFingerSwipePaperFromCorner"));
        else
          v28 = 1;
        v29 = 2;
        if (!v27)
          v29 = 0;
        v30 = v29 | v28;
        objc_msgSend(v3, "setInteger:forKey:", v30, CFSTR("SBBottomRightCornerGestureTouchTypes"));
        objc_msgSend(v3, "removeObjectForKey:", CFSTR("SBApplePencilPaperFromCorner"));
        objc_msgSend(v3, "removeObjectForKey:", CFSTR("SBFingerSwipePaperFromCorner"));
        SBLogCommon();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          _SBFLoggingMethodProem(self, 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v28)
            v31 = CFSTR("ENABLED");
          else
            v31 = CFSTR("DISABLED");
          if (v27)
            v32 = CFSTR("ENABLED");
          else
            v32 = CFSTR("DISABLED");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v30);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v34 = 138544130;
          *(_QWORD *)&v34[4] = v20;
          *(_WORD *)&v34[12] = 2114;
          *(_QWORD *)&v34[14] = v31;
          v35 = 2114;
          v36 = v32;
          v37 = 2114;
          v38 = v33;
          _os_log_impl(&dword_18AB69000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ migrated quick notes finger:%{public}@ pencil:%{public}@ default to bottom right corner mapped to quick notes for touch types %{public}@", v34, 0x2Au);

          goto LABEL_57;
        }
        goto LABEL_58;
      }
      SBLogCommon();
      v18 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        goto LABEL_58;
      _SBFLoggingMethodProem(self, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v34 = 138543362;
      *(_QWORD *)&v34[4] = v20;
      v23 = "%{public}@ new and legacy keys do not exist for bottom right corner; skipping migration.";
    }
    _os_log_impl(&dword_18AB69000, v18, OS_LOG_TYPE_DEFAULT, v23, v34, 0xCu);
LABEL_57:

    goto LABEL_58;
  }
  SBLogCommon();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    _SBFLoggingMethodProem(self, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    *(_DWORD *)v34 = 138543874;
    if (v17)
      v21 = CFSTR("SBBottomRightCornerGestureFeature");
    else
      v21 = CFSTR("SBBottomRightCornerGestureTouchTypes");
    if (v17)
      v22 = CFSTR("SBBottomRightCornerGestureTouchTypes");
    else
      v22 = CFSTR("SBBottomRightCornerGestureFeature");
    *(_QWORD *)&v34[4] = v19;
    *(_WORD *)&v34[12] = 2114;
    *(_QWORD *)&v34[14] = v21;
    v35 = 2114;
    v36 = v22;
    _os_log_error_impl(&dword_18AB69000, v18, OS_LOG_TYPE_ERROR, "%{public}@ expecting both new right corner defaults to exist but only %{public}@ does (%{public}@ doesn't exist)", v34, 0x20u);
    goto LABEL_57;
  }
LABEL_58:

  -[BSAbstractDefaultDomain synchronizeDefaults](self, "synchronizeDefaults");
}

- (void)_bindAndRegisterDefaults
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[SBCornerGestureDefaults _migrateSkyDefaultsIfNecessary](self, "_migrateSkyDefaultsIfNecessary");
  -[BSAbstractDefaultDomain _store](self, "_store");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "bs_defaultExists:", CFSTR("SBGestureRequiresEducation-Corner")) & 1) == 0)
  {
    objc_msgSend(v8, "setInteger:forKey:", 1, CFSTR("SBGestureRequiresEducation-Corner"));
    objc_msgSend(v8, "setValue:forKey:", &unk_1E203ACD8, CFSTR("SBBottomLeftCornerGestureTouchTypes"));
    objc_msgSend(v8, "setValue:forKey:", &unk_1E203ACD8, CFSTR("SBBottomRightCornerGestureTouchTypes"));
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "bottomLeftCornerGestureFeature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v3, CFSTR("SBBottomLeftCornerGestureFeature"), &unk_1E203ACF0, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "bottomLeftCornerGestureTouchTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v4, CFSTR("SBBottomLeftCornerGestureTouchTypes"), &unk_1E203ACD8, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "bottomRightCornerGestureFeature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v5, CFSTR("SBBottomRightCornerGestureFeature"), &unk_1E203AD08, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "bottomRightCornerGestureTouchTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v6, CFSTR("SBBottomRightCornerGestureTouchTypes"), &unk_1E203ACD8, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "cornerGestureRequiresEducation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v7, CFSTR("SBGestureRequiresEducation-Corner"), 0, 1);

}

@end
