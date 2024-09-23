@implementation SBMainWorkspaceTransaction

- (SBMainWorkspaceTransaction)initWithTransitionRequest:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBMainWorkspaceTransaction;
  return -[SBWorkspaceTransaction initWithTransitionRequest:](&v4, sel_initWithTransitionRequest_, a3);
}

- (void)_didComplete
{
  unint64_t v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  __CFString *v11;
  int IsActive;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  __CFString *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t v34;
  char v35;
  char v36;
  void *v37;
  void *v38;
  NSObject *v39;
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
  const __CFString *v50;
  uint64_t v51;
  objc_super v52;
  const __CFString *v53;
  void *v54;
  uint8_t buf[4];
  __CFString *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  if (!-[SBMainWorkspaceTransaction _isRootTransaction](self, "_isRootTransaction"))
    goto LABEL_35;
  v3 = 0x1E0DAF000uLL;
  objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEnabled");

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("SBMainWorkspaceTransaction"), CFSTR("LogSource"));
    v50 = CFSTR("VisibleUI");
  }
  else
  {
    v50 = 0;
    v6 = 0;
  }
  -[SBWorkspaceTransaction windowScene](self, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v8, "activeInterfaceOrientation");

  +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isVisible");

  if ((v10 & 1) == 0)
  {
    IsActive = SBWorkspaceSpringBoardIsActive();
    v49 = v7;
    objc_msgSend(v7, "switcherController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layoutState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "unlockedEnvironmentMode");

    if (IsActive)
    {
      if (v15 != 2)
      {
        v11 = CFSTR("HomeScreen");
LABEL_26:
        v7 = v49;
        goto LABEL_29;
      }
      v16 = objc_msgSend(v13, "interfaceOrientation");
      v7 = v49;
      if (!v5)
      {
        v11 = CFSTR("AppSwitcher");
LABEL_29:

        goto LABEL_30;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, CFSTR("SwitcherInterfaceOrientation"));
      v11 = CFSTR("AppSwitcher");
    }
    else
    {
      if (v15 == 2)
      {
        v18 = objc_msgSend(v13, "interfaceOrientation");
        if (!v5)
        {
          v11 = CFSTR("AppSwitcher");
          goto LABEL_26;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v18);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, CFSTR("SwitcherInterfaceOrientation"));
        v11 = CFSTR("AppSwitcher");
      }
      else
      {
        objc_msgSend(v13, "layoutState");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "elementWithRole:", 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "workspaceEntity");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "deviceApplicationSceneEntity");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "sceneHandle");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v23, "application");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "bundleIdentifier");
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = (void *)v25;
        v27 = CFSTR("Unknown");
        if (v25)
          v27 = (__CFString *)v25;
        v11 = v27;

        v17 = v23;
        v28 = objc_msgSend(v23, "currentInterfaceOrientation");
        if (v5)
        {
          v47 = v17;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v29, CFSTR("AppInterfaceOrientation"));

          v48 = v13;
          objc_msgSend(v13, "layoutStateStudyLogData");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addEntriesFromDictionary:", v30);

          -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "workspace");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "pipCoordinator");
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          v34 = 0;
          v35 = 1;
          do
          {
            v36 = v35;
            objc_msgSend(v33, "controllerForType:", v34);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v37, "isPictureInPictureWindowVisibleOnWindowScene:", 0))
            {
              SBStringFromSBPIPContentType(v34);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("Visible"), v38);

            }
            v35 = 0;
            v34 = 1;
          }
          while ((v36 & 1) != 0);

          v3 = 0x1E0DAF000;
          v13 = v48;
          v7 = v49;
          v17 = v47;
          goto LABEL_28;
        }
      }
      v7 = v49;
    }
LABEL_28:

    goto LABEL_29;
  }
  v11 = CFSTR("CoverSheet");
LABEL_30:
  SBLogSystemGestureAppSwitcher();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
  {
    BSInterfaceOrientationDescription();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    BSInterfaceOrientationDescription();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    BSInterfaceOrientationDescription();
    v42 = v7;
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v56 = v11;
    v57 = 2112;
    v58 = v40;
    v59 = 2112;
    v60 = v41;
    v61 = 2112;
    v62 = v43;
    _os_log_impl(&dword_1D0540000, v39, OS_LOG_TYPE_INFO, "Visible UI change seen by Main Workspace Transaction: transition to %@ (SB interface orientation: %@, switcher interface orientation: %@,  app interface orientation: %@)", buf, 0x2Au);

    v7 = v42;
  }

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v51);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v44, CFSTR("SBInterfaceOrientation"));

    objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, v50);
    objc_msgSend(*(id *)(v3 + 3776), "sharedInstance");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = CFSTR("VisibleUIChanged");
    v54 = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "log:", v46);

  }
LABEL_35:
  v52.receiver = self;
  v52.super_class = (Class)SBMainWorkspaceTransaction;
  -[SBWorkspaceTransaction _didComplete](&v52, sel__didComplete);
}

@end
