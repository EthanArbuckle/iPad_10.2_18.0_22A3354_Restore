@implementation SBAutoPIPWorkspaceTransaction

+ (BOOL)shouldAutoPIPEnteringBackgroundForRequest:(id)a3 tetheringMode:(int64_t *)a4 reason:(int64_t)a5
{
  return +[SBAutoPIPWorkspaceTransaction shouldAutoPIPEnteringBackgroundForRequest:foundEntity:tetheringMode:transitionStyle:reason:](SBAutoPIPWorkspaceTransaction, "shouldAutoPIPEnteringBackgroundForRequest:foundEntity:tetheringMode:transitionStyle:reason:", a3, 0, a4, 0, a5);
}

+ (BOOL)shouldAutoPIPEnteringBackgroundForRequest:(id)a3 foundEntity:(id *)a4 tetheringMode:(int64_t *)a5 transitionStyle:(int64_t *)a6 reason:(int64_t)a7
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  int64_t v55;
  BOOL v56;
  NSObject *v57;
  NSObject *v58;
  int64_t *v60;
  void *v61;
  int64_t v62;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint8_t buf[4];
  id v74;
  __int16 v75;
  _BOOL4 v76;
  __int16 v77;
  int64_t v78;
  __int16 v79;
  int64_t v80;
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  objc_msgSend((id)SBApp, "windowSceneManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayIdentity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "windowSceneForDisplayIdentity:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13
    && (objc_msgSend(v13, "uiLockStateProvider"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "isUILocked"),
        v14,
        (v15 & 1) == 0))
  {
    v60 = a5;
    v62 = a7;
    objc_msgSend(v10, "applicationContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "workspace");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "pipCoordinator");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)SBApp, "windowSceneManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "displayIdentity");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "windowSceneForDisplayIdentity:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v61 = v22;
    objc_msgSend(v22, "switcherController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "windowManagementStyle");

    if (v24 == 2)
    {
      v71 = 0u;
      v72 = 0u;
      v69 = 0u;
      v70 = 0u;
      objc_msgSend(v17, "previousEntities");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v70;
        while (2)
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v70 != v28)
              objc_enumerationMutation(v25);
            v30 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
            if (objc_msgSend(v30, "isApplicationSceneEntity")
              && +[SBAutoPIPWorkspaceTransaction _doesPegasusAllowEntityToAutoPIP:pipCoordinator:]((uint64_t)a1, v30, v19))
            {
              v31 = v30;
              goto LABEL_25;
            }
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
          if (v27)
            continue;
          break;
        }
      }
      v31 = 0;
LABEL_25:

    }
    else
    {
      objc_msgSend(v17, "previousApplicationSceneEntityForLayoutRole:", 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "previousApplicationSceneEntityForLayoutRole:", 2);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (v33)
      {
        v34 = objc_opt_class();
        objc_msgSend(v10, "applicationContext");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "previousLayoutState");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        SBSafeCast(v34, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37 && objc_msgSend(v37, "spaceConfiguration") == 2)
        {
          v38 = v33;

          v32 = v38;
        }

      }
      if (+[SBAutoPIPWorkspaceTransaction _doesPegasusAllowEntityToAutoPIP:pipCoordinator:]((uint64_t)a1, v32, v19))v39 = v32;
      else
        v39 = 0;
      v31 = v39;

    }
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    objc_msgSend(v17, "applicationSceneEntities");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v65, v81, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v66;
      while (2)
      {
        for (j = 0; j != v42; ++j)
        {
          if (*(_QWORD *)v66 != v43)
            objc_enumerationMutation(v40);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * j), "isAnalogousToEntity:", v31))
          {

            v31 = 0;
            goto LABEL_36;
          }
        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v65, v81, 16);
        if (v42)
          continue;
        break;
      }
    }
LABEL_36:

    objc_msgSend(v31, "application");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "info");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "isBlockedForScreenTimeExpiration");

    if (v47)
    {

      v31 = 0;
    }
    objc_msgSend(v17, "removalContextForEntity:", v31);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {

      v31 = 0;
    }
    if (objc_msgSend(v10, "isCrossingDisplays"))
    {

      v31 = 0;
    }

    if (v31)
    {
      objc_msgSend(v31, "application");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "processState");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v50, "pid");

      objc_msgSend(v31, "sceneHandle");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "persistenceIdentifier");
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      v54 = objc_msgSend(v19, "tetheringModeForScenePersistenceIdentifier:pipContentType:", v53, 0);
      v55 = v54;
      v56 = (unint64_t)(v62 - 1) >= 3 && v54 == 1;
      v16 = !v56;
      if (!v56)
      {
        if (a6)
          *a6 = +[SBAutoPIPWorkspaceTransaction transitionStyleForProcessIdentifier:entityToPIP:withTransitionContext:request:reason:]((uint64_t)a1, v51, v31, v17, v10, v62);
        if (a4)
          *a4 = objc_retainAutorelease(v31);
      }
      if (v60)
        *v60 = v55;
      SBLogPIP();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218752;
        v74 = v10;
        v75 = 1024;
        v76 = v16;
        v77 = 2048;
        v78 = v55;
        v79 = 2048;
        v80 = v62;
        _os_log_impl(&dword_1D0540000, v57, OS_LOG_TYPE_DEFAULT, "[ShouldAutoPiP] Request(%p) shouldStart: %{BOOL}u; tetheringMode: %ld; reason:%li",
          buf,
          0x26u);
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }
  SBLogPIP();
  v58 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v74 = v10;
    v75 = 1024;
    v76 = v16;
    _os_log_impl(&dword_1D0540000, v58, OS_LOG_TYPE_DEFAULT, "[ShouldAutoPiP] For request(%p): %{BOOL}u", buf, 0x12u);
  }

  return v16;
}

+ (uint64_t)_doesPegasusAllowEntityToAutoPIP:(void *)a3 pipCoordinator:
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  v5 = a2;
  objc_opt_self();
  objc_msgSend(v5, "application");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "processState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "pid");

  objc_msgSend(v5, "sceneHandle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "persistenceIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v4, "shouldStartPictureInPictureForApplicationWithProcessIdentifierEnteringBackground:scenePersistenceIdentifier:pipContentType:", v8, v10, 0);
  return v11;
}

+ (BOOL)shouldAutoPIPEnteringBackgroundForRequest:(id)a3
{
  return +[SBAutoPIPWorkspaceTransaction shouldAutoPIPEnteringBackgroundForRequest:foundEntity:tetheringMode:transitionStyle:reason:](SBAutoPIPWorkspaceTransaction, "shouldAutoPIPEnteringBackgroundForRequest:foundEntity:tetheringMode:transitionStyle:reason:", a3, 0, 0, 0, 0);
}

+ (BOOL)shouldAutoPIPEnteringBackgroundForRequest:(id)a3 reason:(int64_t)a4
{
  return +[SBAutoPIPWorkspaceTransaction shouldAutoPIPEnteringBackgroundForRequest:foundEntity:tetheringMode:transitionStyle:reason:](SBAutoPIPWorkspaceTransaction, "shouldAutoPIPEnteringBackgroundForRequest:foundEntity:tetheringMode:transitionStyle:reason:", a3, 0, 0, 0, a4);
}

+ (BOOL)shouldAutoPIPEnteringBackgroundForRequest:(id)a3 foundEntity:(id *)a4
{
  return +[SBAutoPIPWorkspaceTransaction shouldAutoPIPEnteringBackgroundForRequest:foundEntity:tetheringMode:transitionStyle:reason:](SBAutoPIPWorkspaceTransaction, "shouldAutoPIPEnteringBackgroundForRequest:foundEntity:tetheringMode:transitionStyle:reason:", a3, a4, 0, 0, 0);
}

+ (BOOL)shouldAutoPIPEnteringBackgroundForRequest:(id)a3 transitionStyle:(int64_t *)a4
{
  return +[SBAutoPIPWorkspaceTransaction shouldAutoPIPEnteringBackgroundForRequest:foundEntity:tetheringMode:transitionStyle:reason:](SBAutoPIPWorkspaceTransaction, "shouldAutoPIPEnteringBackgroundForRequest:foundEntity:tetheringMode:transitionStyle:reason:", a3, 0, 0, a4, 0);
}

+ (BOOL)shouldAutoPIPEnteringBackgroundForRequest:(id)a3 foundEntity:(id *)a4 transitionStyle:(int64_t *)a5
{
  return +[SBAutoPIPWorkspaceTransaction shouldAutoPIPEnteringBackgroundForRequest:foundEntity:tetheringMode:transitionStyle:reason:](SBAutoPIPWorkspaceTransaction, "shouldAutoPIPEnteringBackgroundForRequest:foundEntity:tetheringMode:transitionStyle:reason:", a3, a4, 0, a5, 0);
}

+ (uint64_t)transitionStyleForProcessIdentifier:(void *)a3 entityToPIP:(void *)a4 withTransitionContext:(void *)a5 request:(uint64_t)a6 reason:
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  _BOOL4 v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;
  uint64_t v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  SBPIPMorphAnimatorController *v41;
  void *v42;
  void *v43;
  _BOOL4 v44;
  void *v45;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_opt_self();
  v13 = objc_opt_class();
  v14 = v11;
  if (v13)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
  }
  else
  {
    v15 = 0;
  }
  v16 = v15;

  v17 = objc_opt_class();
  v18 = v14;
  if (v17)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
  }
  else
  {
    v19 = 0;
  }
  v20 = v19;

  v21 = +[SBAutoPIPWorkspaceTransaction isSystemGesture:]((uint64_t)SBAutoPIPWorkspaceTransaction, v12);
  objc_msgSend(v16, "previousLayoutState");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "unlockedEnvironmentMode");

  if (a6 == 3)
  {
    v24 = 2;
    goto LABEL_26;
  }
  if (SBReduceMotion())
    goto LABEL_25;
  if (!v16 || v23 == 2)
  {
    if (!v20)
      goto LABEL_25;
    v26 = 0;
    goto LABEL_20;
  }
  v25 = objc_msgSend(v16, "animationDisabled");
  if (v20)
  {
    v26 = v25 ^ 1;
LABEL_20:
    if ((objc_msgSend(v20, "isAnimated") & 1) != 0 || (v26 & 1) != 0)
    {
      if ((v21 | v26) != 1)
      {
        v24 = 1;
        goto LABEL_26;
      }
      goto LABEL_27;
    }
LABEL_25:
    v24 = 0;
    goto LABEL_26;
  }
  if ((v25 & 1) != 0)
    goto LABEL_25;
LABEL_27:
  v28 = objc_opt_class();
  v29 = v10;
  if (v28)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v30 = v29;
    else
      v30 = 0;
  }
  else
  {
    v30 = 0;
  }
  v31 = v30;

  objc_msgSend(v31, "sceneHandle");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "persistenceIdentifier");
  v33 = objc_claimAutoreleasedReturnValue();

  v44 = objc_msgSend(v12, "source") == 11;
  objc_msgSend(v31, "objectForActivationSetting:", 57);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = objc_msgSend(v34, "integerValue");
  objc_msgSend(v12, "workspace");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "pipCoordinator");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v45, "controllerForType:", v35);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)SBApp, "windowSceneManager");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v33;
  v43 = (void *)v33;
  objc_msgSend(v38, "windowSceneForPersistentIdentifier:", v33);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = -[SBPIPMorphAnimatorController initWithTargetProcessIdentifier:scenePersistenceIdentifier:windowScene:direction:gestureInitiated:delegate:uuid:]([SBPIPMorphAnimatorController alloc], "initWithTargetProcessIdentifier:scenePersistenceIdentifier:windowScene:direction:gestureInitiated:delegate:uuid:", a2, v39, v40, 0, v44, v37, 0);
  -[SBPIPMorphAnimatorController viewMorphAnimator](v41, "viewMorphAnimator");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v39) = objc_msgSend(v42, "preflightCheck");

  if ((_DWORD)v39)
    v24 = 3;
  else
    v24 = 0;

LABEL_26:
  return v24;
}

+ (BOOL)isSystemGesture:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  void *v4;
  _BOOL8 v5;

  v2 = a2;
  objc_opt_self();
  v3 = objc_opt_class();
  SBSafeCast(v3, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "source") == 11;
  else
    v5 = 0;

  return v5;
}

- (SBAutoPIPWorkspaceTransaction)initWithTransitionRequest:(id)a3
{
  return -[SBAutoPIPWorkspaceTransaction initWithTransitionRequest:includeActiveAppEntity:reason:](self, "initWithTransitionRequest:includeActiveAppEntity:reason:", a3, 0, 0);
}

- (SBAutoPIPWorkspaceTransaction)initWithTransitionRequest:(id)a3 includeActiveAppEntity:(BOOL)a4 reason:(int64_t)a5
{
  id v7;
  SBAutoPIPWorkspaceTransaction *v8;
  SBAutoPIPWorkspaceTransaction *v9;
  _BOOL4 v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  SBPIPControllerCoordinator *pipCoordinator;
  id v18;
  objc_class *v19;
  void *v20;
  uint64_t v21;
  NSString *reason;
  id v24;
  objc_super v25;

  v7 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SBAutoPIPWorkspaceTransaction;
  v8 = -[SBWorkspaceTransaction initWithTransitionRequest:](&v25, sel_initWithTransitionRequest_, v7);
  v9 = v8;
  if (v8)
  {
    v8->_inferredTransitionStyle = 2;
    v24 = 0;
    v10 = +[SBAutoPIPWorkspaceTransaction shouldAutoPIPEnteringBackgroundForRequest:foundEntity:tetheringMode:transitionStyle:reason:](SBAutoPIPWorkspaceTransaction, "shouldAutoPIPEnteringBackgroundForRequest:foundEntity:tetheringMode:transitionStyle:reason:", v7, &v24, 0, &v8->_transitionStyle, a5);
    v11 = v24;
    v12 = v24;
    objc_msgSend(v12, "application");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "processState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_pidToPIP = objc_msgSend(v14, "pid");

    objc_storeStrong((id *)&v9->_entityToPIP, v11);
    objc_msgSend(v7, "workspace");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pipCoordinator");
    v16 = objc_claimAutoreleasedReturnValue();
    pipCoordinator = v9->_pipCoordinator;
    v9->_pipCoordinator = (SBPIPControllerCoordinator *)v16;

    if (v10 && v9->_pidToPIP)
    {
      if (-[SBAutoPIPWorkspaceTransaction isAuditHistoryEnabled](v9, "isAuditHistoryEnabled"))
        -[SBAutoPIPWorkspaceTransaction _addAuditHistoryItem:](v9, "_addAuditHistoryItem:", CFSTR("PIPController says to start!"));
      v18 = objc_alloc(MEMORY[0x1E0CB3940]);
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v18, "initWithFormat:", CFSTR("%@-%p"), v20, v9);
      reason = v9->_reason;
      v9->_reason = (NSString *)v21;

    }
    else if (-[SBAutoPIPWorkspaceTransaction isAuditHistoryEnabled](v9, "isAuditHistoryEnabled"))
    {
      -[SBAutoPIPWorkspaceTransaction _addAuditHistoryItem:](v9, "_addAuditHistoryItem:", CFSTR("PIPController is not interested."));
    }

  }
  return v9;
}

- (int64_t)transitionStyle
{
  int64_t transitionStyle;

  if (!self)
    return 0;
  transitionStyle = self->_transitionStyle;
  if (!transitionStyle)
    return self->_inferredTransitionStyle;
  return transitionStyle;
}

- (uint64_t)_transitionStyle
{
  uint64_t v1;

  if (!a1)
    return 0;
  v1 = *(_QWORD *)(a1 + 256);
  if (!v1)
    return *(_QWORD *)(a1 + 216);
  return v1;
}

- (void)_begin
{
  SBApplicationSceneEntity *entityToPIP;
  uint64_t v4;
  SBApplicationSceneEntity *v5;
  SBApplicationSceneEntity *v6;
  SBApplicationSceneEntity *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int64_t transitionStyle;
  SBPIPController *v13;
  SBPIPController *pipController;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  dispatch_time_t v21;
  NSObject *v22;
  id v23;
  _QWORD block[4];
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  int64_t v29;
  _QWORD v30[5];
  id v31;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)SBAutoPIPWorkspaceTransaction;
  -[SBAutoPIPWorkspaceTransaction _begin](&v32, sel__begin);
  entityToPIP = self->_entityToPIP;
  if (entityToPIP)
  {
    v4 = objc_opt_class();
    v5 = entityToPIP;
    if (v4)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v5;
      else
        v6 = 0;
    }
    else
    {
      v6 = 0;
    }
    v7 = v6;

    -[SBApplicationSceneEntity sceneHandle](v7, "sceneHandle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "persistenceIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBWorkspaceEntity objectForActivationSetting:](v7, "objectForActivationSetting:", 57);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "integerValue");

    transitionStyle = self->_transitionStyle;
    if (!transitionStyle)
      transitionStyle = self->_inferredTransitionStyle;
    -[SBPIPControllerCoordinator controllerForType:](self->_pipCoordinator, "controllerForType:", v11);
    v13 = (SBPIPController *)objc_claimAutoreleasedReturnValue();
    pipController = self->_pipController;
    self->_pipController = v13;

    -[SBAutoPIPWorkspaceTransaction addMilestone:](self, "addMilestone:", CFSTR("PIPTransition"));
    v15 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __39__SBAutoPIPWorkspaceTransaction__begin__block_invoke;
    v30[3] = &unk_1E8EA93C0;
    v30[4] = self;
    v16 = v9;
    v31 = v16;
    v17 = (void *)MEMORY[0x1D17E5550](v30);
    v18 = (void *)*MEMORY[0x1E0CEB258];
    v26[0] = v15;
    v26[1] = 3221225472;
    v26[2] = __39__SBAutoPIPWorkspaceTransaction__begin__block_invoke_21;
    v26[3] = &unk_1E8EA10F0;
    v29 = transitionStyle;
    v26[4] = self;
    v27 = v16;
    v19 = v17;
    v28 = v19;
    v20 = v16;
    objc_msgSend(v18, "_performBlockAfterCATransactionCommits:", v26);
    v21 = dispatch_time(0, 5000000000);
    -[SBTransaction queue](self, "queue");
    v22 = objc_claimAutoreleasedReturnValue();
    block[0] = v15;
    block[1] = 3221225472;
    block[2] = __39__SBAutoPIPWorkspaceTransaction__begin__block_invoke_3;
    block[3] = &unk_1E8E9E8D0;
    v25 = v19;
    v23 = v19;
    dispatch_after(v21, v22, block);

  }
  else if (-[SBAutoPIPWorkspaceTransaction isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))
  {
    -[SBAutoPIPWorkspaceTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("Nothing to PIP."));
  }
}

void __39__SBAutoPIPWorkspaceTransaction__begin__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v6 + 248))
  {
    *(_BYTE *)(v6 + 248) = 1;
    if (objc_msgSend(*(id *)(a1 + 32), "isWaitingForMilestone:", CFSTR("PIPTransition")))
      objc_msgSend(*(id *)(a1 + 32), "satisfyMilestone:", CFSTR("PIPTransition"));
    SBLogPIP();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "localizedDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109378;
      v15 = a2;
      v16 = 2114;
      v17 = v8;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "PiP did start with success{%{BOOL}u} error{%{public}@}", buf, 0x12u);

    }
    if ((a2 & 1) == 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "pictureInPictureMorphAnimatorControllerForProcessIdentifier:scenePersistenceIdentifier:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 208), *(_QWORD *)(a1 + 40));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
        objc_msgSend(v9, "cancel");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "cancelPictureInPictureForApplicationWithProcessIdentifierEnteringBackground:scenePersistenceIdentifier:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 208), *(_QWORD *)(a1 + 40));
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "uniqueIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("Couldn't start PIP for %@ (pid %d)"), v12, *(unsigned int *)(*(_QWORD *)(a1 + 32) + 208));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "_failWithReason:description:precipitatingError:", CFSTR("startingPIPFailed"), v13, v5);
    }
  }

}

void __39__SBAutoPIPWorkspaceTransaction__begin__block_invoke_21(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  _BOOL4 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 56);
  SBLogPIP();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v11 = v2 == 1;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "AutoPIP Workspace transaction did begin animated{%{BOOL}u}", buf, 8u);
  }

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(v4 + 232);
  v7 = *(unsigned int *)(v4 + 208);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__SBAutoPIPWorkspaceTransaction__begin__block_invoke_22;
  v8[3] = &unk_1E8E9F638;
  v8[4] = v4;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v6, "startPictureInPictureForApplicationWithProcessIdentifierEnteringBackground:scenePersistenceIdentifier:animated:completionHandler:", v7, v5, v2 == 1, v8);

}

void __39__SBAutoPIPWorkspaceTransaction__begin__block_invoke_22(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__SBAutoPIPWorkspaceTransaction__begin__block_invoke_2;
  block[3] = &unk_1E8EB0F28;
  v7 = *(id *)(a1 + 40);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __39__SBAutoPIPWorkspaceTransaction__begin__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __39__SBAutoPIPWorkspaceTransaction__begin__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_canBeInterrupted
{
  return 1;
}

- (void)_didComplete
{
  objc_super v3;

  -[SBPIPController setPictureInPictureWindowsHidden:forReason:](self->_pipController, "setPictureInPictureWindowsHidden:forReason:", 0, self->_reason);
  v3.receiver = self;
  v3.super_class = (Class)SBAutoPIPWorkspaceTransaction;
  -[SBWorkspaceTransaction _didComplete](&v3, sel__didComplete);
}

- (id)_customizedDescriptionProperties
{
  void *v3;
  void *v4;
  SBApplicationSceneEntity *entityToPIP;
  void *v6;
  unint64_t transitionStyle;
  __CFString *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_pidToPIP >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("pidToPIP"));

  }
  entityToPIP = self->_entityToPIP;
  if (entityToPIP)
  {
    -[SBWorkspaceEntity succinctDescription](entityToPIP, "succinctDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("entityToPIP"));

  }
  transitionStyle = self->_transitionStyle;
  if (!transitionStyle)
    transitionStyle = self->_inferredTransitionStyle;
  if (transitionStyle > 3)
    v8 = 0;
  else
    v8 = off_1E8EB0F48[transitionStyle];
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("transitionStyle"));
  return v3;
}

- (void)setTransitionStyle:(int64_t)a3
{
  self->_transitionStyle = a3;
}

- (SBApplicationSceneEntity)entityToPIP
{
  return self->_entityToPIP;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityToPIP, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_pipController, 0);
  objc_storeStrong((id *)&self->_pipCoordinator, 0);
}

@end
