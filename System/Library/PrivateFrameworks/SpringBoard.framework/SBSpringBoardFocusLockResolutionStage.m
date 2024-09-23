@implementation SBSpringBoardFocusLockResolutionStage

- (void)resolveKeyboardFocusPolicy:(id)a3 context:(id)a4 stop:(BOOL *)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  NSObject *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  const __CFString *v66;
  NSObject *v67;
  const char *v68;
  NSObject *v69;
  uint32_t v70;
  NSObject *v71;
  void *v72;
  void *v73;
  const __CFString *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  char v80;
  NSObject *v81;
  NSObject *log;
  id v83;
  id WeakRetained;
  unsigned __int8 v85;
  uint8_t buf[4];
  NSObject *v87;
  __int16 v88;
  NSObject *v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_sceneProvider);
  v9 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v7, "keyboardFocusTarget");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sceneIdentityToken");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringRepresentation");
  v12 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "auditHistory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addItemWithFormat:", CFSTR("-- SBSpringBoardFocusLockResolutionStage --"));

  objc_msgSend(v9, "springBoardFocusLockReasons");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");
  +[SBKeyboardFocusLockReason coverSheet](SBKeyboardFocusLockReason, "coverSheet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "containsObject:", v16) & 1) != 0)
    v17 = 1;
  else
    v17 = objc_msgSend(v9, "isCoverSheetHostingAnApp");

  +[SBKeyboardFocusLockReason controlCenter](SBKeyboardFocusLockReason, "controlCenter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v14, "containsObject:", v18);

  if (!v15)
  {
    v21 = 1;
    goto LABEL_67;
  }
  if (v19)
  {
    SBLogKeyboardFocus();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v20, OS_LOG_TYPE_DEFAULT, "policy: control center is visible and overriding transient overlays", buf, 2u);
    }
LABEL_20:
    v21 = 0;
    goto LABEL_21;
  }
  if (objc_msgSend(v9, "hasActiveTransientOverlayPresentation"))
  {
    if (!objc_msgSend(v9, "activeTransientOverlayPresentationShouldUseSceneBasedKeyboardFocus"))
    {
      SBLogKeyboardFocus();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        -[SBSpringBoardFocusLockResolutionStage resolveKeyboardFocusPolicy:context:stop:].cold.5(v20, v25, v26, v27, v28, v29, v30, v31);
      goto LABEL_20;
    }
    if (v17)
    {
      v21 = objc_msgSend(v7, "advicePolicy");
      objc_msgSend(v7, "auditHistory");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addItemWithFormat:", CFSTR("accepting policy: secret scene - transient overlay hosted above coversheet"));

      SBLogKeyboardFocus();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v23 = "policy: activeTransientOverlay with scene-based deferring above coversheet -- not deferring to SB";
LABEL_17:
        _os_log_impl(&dword_1D0540000, v20, OS_LOG_TYPE_DEFAULT, v23, buf, 2u);
        goto LABEL_21;
      }
    }
    else
    {
      if (!objc_msgSend(v9, "isActiveTransientOverlayPresentationFromSceneWithIdentityTokenString:", v12))
      {
        objc_msgSend(v9, "focusTargetForActiveTransientOverlayPresentation");
        v20 = objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          v21 = objc_msgSend(v7, "advicePolicy");
          objc_msgSend(v7, "setKeyboardFocusTarget:", v20);
          SBLogKeyboardFocus();
          log = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v87 = v12;
            v88 = 2114;
            v89 = v20;
            _os_log_impl(&dword_1D0540000, log, OS_LOG_TYPE_DEFAULT, "policy: activeTransientOverlay is not %{public}@. Using topmost: %{public}@.", buf, 0x16u);
          }
          v71 = log;
        }
        else
        {
          SBLogKeyboardFocus();
          v81 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v87 = v12;
            _os_log_impl(&dword_1D0540000, v81, OS_LOG_TYPE_DEFAULT, "policy: activeTransientOverlay is not %{public}@ and has no keyboardFocusTarget; ignoring request.",
              buf,
              0xCu);
          }
          v71 = v81;
          v21 = 0;
        }

        goto LABEL_21;
      }
      v21 = objc_msgSend(v7, "advicePolicy");
      objc_msgSend(v7, "auditHistory");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "addItemWithFormat:", CFSTR("accepting policy: secret scene - transient overlay hosted"));

      SBLogKeyboardFocus();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v23 = "policy: activeTransientOverlay with scene-based deferring is arbiter target -- not deferring to SB";
        goto LABEL_17;
      }
    }
    goto LABEL_21;
  }
  if (objc_msgSend(v8, "isSpotlightVisible"))
  {
    v21 = objc_msgSend(v7, "advicePolicy");
    objc_msgSend(v7, "auditHistory");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addItemWithFormat:", CFSTR("accepting policy: spotlight visible (non-transient overlay)"));

    SBLogKeyboardFocus();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v23 = "policy: spotlight visible (non-transient overlay)";
      goto LABEL_17;
    }
LABEL_21:

    goto LABEL_22;
  }
  v21 = 0;
LABEL_22:
  if (objc_msgSend(v9, "isBannerKitHostingSceneWithIdentityTokenString:", v12))
  {
    v21 = objc_msgSend(v7, "advicePolicy");
    objc_msgSend(v7, "auditHistory");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addItemWithFormat:", CFSTR("accepting policy: secret scene - banner hosted"));

    SBLogKeyboardFocus();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v87 = v12;
      _os_log_impl(&dword_1D0540000, v33, OS_LOG_TYPE_DEFAULT, "policy: arbiter target %{public}@ is scene-backed banner, not deferring to SB", buf, 0xCu);
    }
  }
  else
  {
    SBLogKeyboardFocus();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      -[SBSpringBoardFocusLockResolutionStage resolveKeyboardFocusPolicy:context:stop:].cold.4((uint64_t)v12, v33, v34, v35, v36, v37, v38, v39);
  }

  if ((objc_msgSend(v8, "isSiriVisible") & v17) == 1)
  {
    v21 = objc_msgSend(v7, "advicePolicy");
    objc_msgSend(v7, "auditHistory");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addItemWithFormat:", CFSTR("accepting policy: secret scene - siri above coversheet"));

    SBLogKeyboardFocus();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v41, OS_LOG_TYPE_DEFAULT, "policy: Siri -- not deferring to SB", buf, 2u);
    }
  }
  else
  {
    SBLogKeyboardFocus();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      -[SBSpringBoardFocusLockResolutionStage resolveKeyboardFocusPolicy:context:stop:].cold.3((uint64_t)v12, v41, v42, v43, v44, v45, v46, v47);
  }

  if (!v21)
  {
    objc_msgSend(v7, "auditHistory");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "allObjects");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "componentsJoinedByString:", CFSTR(", "));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "addItemWithFormat:", CFSTR("rejecting target: preferring SB for reasons: %@"), v50);

    SBLogKeyboardFocus();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v14, "allObjects");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "componentsJoinedByString:", CFSTR(", "));
      v53 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v87 = v53;
      _os_log_impl(&dword_1D0540000, v51, OS_LOG_TYPE_DEFAULT, "policy: preferSpringBoardFocus for reasons:(%{public}@)", buf, 0xCu);

    }
    objc_msgSend(WeakRetained, "springBoardSceneFocusTarget");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setKeyboardFocusTarget:", v54);
    v83 = v8;
    if (v19)
    {
      SBLogKeyboardFocus();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
        -[SBSpringBoardFocusLockResolutionStage resolveKeyboardFocusPolicy:context:stop:].cold.1(v55, v56, v57, v58, v59, v60, v61, v62);
      goto LABEL_63;
    }
    if (!objc_msgSend(v9, "isCoverSheetHostingAnApp")
      || (objc_msgSend(v9, "hasActiveTransientOverlayPresentation") & 1) != 0)
    {
      SBLogKeyboardFocus();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
        -[SBSpringBoardFocusLockResolutionStage resolveKeyboardFocusPolicy:context:stop:].cold.2(v9, v55);
      goto LABEL_63;
    }
    v85 = 0;
    objc_msgSend(v9, "focusTargetForCoverSheetHostedAppGetCameraIsHosted:", &v85);
    v55 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCameraIsHosted:", v85);
    if (v55)
    {
      objc_msgSend(v7, "setKeyboardFocusTarget:", v55);
      objc_msgSend(v7, "auditHistory");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = v64;
      if (v85)
        v66 = CFSTR("YES");
      else
        v66 = CFSTR("NO");
      objc_msgSend(v64, "addItemWithFormat:", CFSTR("deferring events to coversheet hosted app %@ - camera is hosted: %@"), v55, v66);

      SBLogKeyboardFocus();
      v67 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        goto LABEL_62;
      *(_DWORD *)buf = 138543618;
      v87 = v55;
      v88 = 1024;
      LODWORD(v89) = v85;
      v68 = "policy: deferring events from SpringBoard to CoverSheet hosted app: %{public}@ (camera is hosted:%{BOOL}u)";
      v69 = v67;
      v70 = 18;
    }
    else
    {
      objc_msgSend(v7, "auditHistory");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = v72;
      if (v85)
        v74 = CFSTR("YES");
      else
        v74 = CFSTR("NO");
      objc_msgSend(v72, "addItemWithFormat:", CFSTR("deferring events to coversheet hosted app but scene doesn't exist yet - camera is hosted: %@"), v74);

      SBLogKeyboardFocus();
      v67 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        goto LABEL_62;
      *(_DWORD *)buf = 67109120;
      LODWORD(v87) = v85;
      v68 = "policy: deferring events from SpringBoard to CoverSheet hosted app, but scene doesn't exist yet (camera is hosted:%{BOOL}u)";
      v69 = v67;
      v70 = 8;
    }
    _os_log_impl(&dword_1D0540000, v69, OS_LOG_TYPE_DEFAULT, v68, buf, v70);
LABEL_62:

LABEL_63:
    objc_msgSend(v7, "keyboardFocusTarget");
    v75 = objc_claimAutoreleasedReturnValue();
    if (v75)
    {
      v76 = (void *)v75;
      objc_msgSend(WeakRetained, "springBoardSceneFocusTarget");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "keyboardFocusTarget");
      v78 = v54;
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = BSEqualObjects();

      v54 = v78;
      if ((v80 & 1) == 0)
        objc_msgSend(v7, "setShouldSuppressRemoteDeferring:", 1);
    }

    v21 = 0;
    v8 = v83;
  }
LABEL_67:
  objc_msgSend(v7, "setAdvicePolicy:", v21);

}

- (SBKeyboardFocusResolutionStageSceneProviding)sceneProvider
{
  return (SBKeyboardFocusResolutionStageSceneProviding *)objc_loadWeakRetained((id *)&self->_sceneProvider);
}

- (void)setSceneProvider:(id)a3
{
  objc_storeWeak((id *)&self->_sceneProvider, a3);
}

- (SBSpringBoardFocusLockResolutionStageDelegate)delegate
{
  return (SBSpringBoardFocusLockResolutionStageDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_sceneProvider);
}

- (void)resolveKeyboardFocusPolicy:(uint64_t)a3 context:(uint64_t)a4 stop:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D0540000, a1, a3, "policy: control center is visible", a5, a6, a7, a8, 0);
}

- (void)resolveKeyboardFocusPolicy:(void *)a1 context:(NSObject *)a2 stop:.cold.2(void *a1, NSObject *a2)
{
  const char *v4;
  int v5;
  const char *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "isCoverSheetHostingAnApp"))
    v4 = "is";
  else
    v4 = "is NOT";
  v5 = objc_msgSend(a1, "hasActiveTransientOverlayPresentation");
  v6 = "NO";
  if (v5)
    v6 = "has";
  v7 = 136315394;
  v8 = v4;
  v9 = 2080;
  v10 = v6;
  _os_log_debug_impl(&dword_1D0540000, a2, OS_LOG_TYPE_DEBUG, "policy: coversheet %s hosting an app and %s active transient overlay presentation", (uint8_t *)&v7, 0x16u);
}

- (void)resolveKeyboardFocusPolicy:(uint64_t)a3 context:(uint64_t)a4 stop:(uint64_t)a5 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, a2, a3, "policy: %{public}@ not siri secret scene", a5, a6, a7, a8, 2u);
}

- (void)resolveKeyboardFocusPolicy:(uint64_t)a3 context:(uint64_t)a4 stop:(uint64_t)a5 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, a2, a3, "policy: %{public}@ is not a banner kit hosted secret scene", a5, a6, a7, a8, 2u);
}

- (void)resolveKeyboardFocusPolicy:(uint64_t)a3 context:(uint64_t)a4 stop:(uint64_t)a5 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D0540000, a1, a3, "policy: active transient overlay presentation but doesn't want scene based focus", a5, a6, a7, a8, 0);
}

@end
