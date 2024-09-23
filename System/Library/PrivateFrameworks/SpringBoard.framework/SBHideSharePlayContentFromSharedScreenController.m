@implementation SBHideSharePlayContentFromSharedScreenController

- (SBHideSharePlayContentFromSharedScreenController)init
{
  SBHideSharePlayContentFromSharedScreenController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBHideSharePlayContentFromSharedScreenController;
  v2 = -[SBHideSharePlayContentFromSharedScreenController init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend((id)SBApp, "bannerManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addTransitionObserver:", v2);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel__handleControlCenterDidPresent, CFSTR("SBControlCenterControllerDidPresentNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__handleControlCenterWillDismiss, CFSTR("SBControlCenterControllerWillDismissNotification"), 0);

    +[SBDraggingSystemManager sharedInstance](SBDraggingSystemManager, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:", v2);

    objc_msgSend((id)SBApp, "mousePointerManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:", v2);

    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "transientOverlayPresentationManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:", v2);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  objc_msgSend((id)SBApp, "bannerManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeTransitionObserver:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("SBControlCenterControllerDidPresentNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("SBControlCenterControllerWillDismissNotification"), 0);

  +[SBDraggingSystemManager sharedInstance](SBDraggingSystemManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  objc_msgSend((id)SBApp, "mousePointerManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:", self);

  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transientOverlayPresentationManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObserver:", self);

  v10.receiver = self;
  v10.super_class = (Class)SBHideSharePlayContentFromSharedScreenController;
  -[SBHideSharePlayContentFromSharedScreenController dealloc](&v10, sel_dealloc);
}

- (id)acquireHideSharePlayContentFromClonedDisplaysAssertionForReason:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  _QWORD v12[4];
  id v13;
  id location;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHideSharePlayContentFromSharedScreenController.m"), 76, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason != nil"));

  }
  objc_initWeak(&location, self);
  v6 = objc_alloc(MEMORY[0x1E0D01868]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __116__SBHideSharePlayContentFromSharedScreenController_acquireHideSharePlayContentFromClonedDisplaysAssertionForReason___block_invoke;
  v12[3] = &unk_1E8E9E468;
  objc_copyWeak(&v13, &location);
  v9 = (void *)objc_msgSend(v6, "initWithIdentifier:forReason:invalidationBlock:", v8, v5, v12);

  -[SBHideSharePlayContentFromSharedScreenController _addAssertion:](self, "_addAssertion:", v9);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v9;
}

void __116__SBHideSharePlayContentFromSharedScreenController_acquireHideSharePlayContentFromClonedDisplaysAssertionForReason___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_removeAssertion:", v3);

}

- (void)_handleControlCenterDidPresent
{
  self->_isControlCenterFullyPresentedOnMainDisplay = 1;
  -[SBHideSharePlayContentFromSharedScreenController _resolveHidingBehavior](self, "_resolveHidingBehavior");
}

- (void)_handleControlCenterWillDismiss
{
  self->_isControlCenterFullyPresentedOnMainDisplay = 0;
  -[SBHideSharePlayContentFromSharedScreenController _resolveHidingBehavior](self, "_resolveHidingBehavior");
}

- (void)_windowVisibilityDidChange:(id)a3
{
  UIWindow *v4;
  UIWindow *cloneTerminatingWindow;

  objc_msgSend(a3, "object");
  v4 = (UIWindow *)objc_claimAutoreleasedReturnValue();
  cloneTerminatingWindow = self->_cloneTerminatingWindow;

  if (v4 != cloneTerminatingWindow)
    -[SBHideSharePlayContentFromSharedScreenController _resolveHidingBehavior](self, "_resolveHidingBehavior");
}

- (void)_resolveHidingBehavior
{
  uint64_t v3;
  id WeakRetained;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  int v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  int v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  void *v37;
  id v38;
  double v39;
  double v40;
  double v41;
  int v42;
  int v43;
  void *v44;
  void *v45;
  uint64_t v46;
  double *v47;
  void *v48;
  int v49;
  int v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  void *v66;
  double v67;
  double v68;
  void *v69;
  double v70;
  double v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  double v76;
  void *v77;
  double v78;
  double v79;
  double v80;
  int v81;
  BOOL v82;
  UIWindow *cloneTerminatingWindow;
  void *v84;
  void *v85;
  UIWindow *v86;
  UIWindow *v87;
  void *v88;
  UIWindow *v89;
  void *v90;
  CALayer *v91;
  CALayer *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  CALayer *cloneTerminatingLayer;
  UIWindow *v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t k;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  uint64_t m;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t n;
  void *v115;
  void *v116;
  void *v117;
  int v118;
  UIWindow *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  UIWindow *v124;
  void *v125;
  uint64_t v126;
  id v127;
  void *v128;
  id v129;
  int v130;
  double v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t ii;
  _BOOL4 v137;
  void *v138;
  id v139;
  uint64_t v140;
  id obj;
  id v142;
  id v143;
  int v144;
  int v145;
  void *v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  _BYTE v175[128];
  _BYTE v176[128];
  _BYTE v177[128];
  _BYTE v178[128];
  _BYTE v179[128];
  _BYTE v180[128];
  _BYTE v181[128];
  uint64_t v182;

  v182 = *MEMORY[0x1E0C80C00];
  v140 = -[NSMutableSet count](self->_activeAssertions, "count");
  if (v140)
  {
    -[SBHideSharePlayContentFromSharedScreenController _startObservingForActiveHideAssertionIfNeeded](self, "_startObservingForActiveHideAssertionIfNeeded");
    -[SBHideSharePlayContentFromSharedScreenController _pipViewControllerToHide](self, "_pipViewControllerToHide");
    v3 = objc_claimAutoreleasedReturnValue();
    v137 = -[SBHideSharePlayContentFromSharedScreenController _isPipViewControllerToHideOnMainDisplay](self, "_isPipViewControllerToHideOnMainDisplay");
  }
  else
  {
    -[SBHideSharePlayContentFromSharedScreenController _stopObservingForActiveHideAssertionIfNeeded](self, "_stopObservingForActiveHideAssertionIfNeeded");
    -[SBHideSharePlayContentFromSharedScreenController _pipViewControllerToHide](self, "_pipViewControllerToHide");
    v3 = objc_claimAutoreleasedReturnValue();
    v137 = 0;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_pipViewControllerBeingHiddenWithDisableUpdateMask);
  v5 = WeakRetained;
  if (WeakRetained && WeakRetained != (id)v3)
    -[SBHideSharePlayContentFromSharedScreenController _stopHidingViewControllerFromClonedDisplaysIfNeeded:](self, "_stopHidingViewControllerFromClonedDisplaysIfNeeded:", WeakRetained);
  v139 = (id)v3;
  if (v140)
  {
    -[NSHashTable allObjects](self->_trackedPresentables, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v173 = 0u;
  v174 = 0u;
  v171 = 0u;
  v172 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v171, v181, 16);
  if (!v7)
  {
    v144 = 0;
    v145 = 0;
    goto LABEL_32;
  }
  v8 = v7;
  v144 = 0;
  v145 = 0;
  v142 = *(id *)v172;
  while (2)
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(id *)v172 != v142)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v171 + 1) + 8 * i);
      UIViewControllerFromPresentable();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "window");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "windowScene");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_opt_class();
      v16 = v14;
      if (v15)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v17 = v16;
        else
          v17 = 0;
      }
      else
      {
        v17 = 0;
      }
      v18 = v17;

      objc_msgSend(v10, "requesterIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v19, "isEqualToString:", CFSTR("com.apple.ConversationKit")) & 1) == 0)
      {

LABEL_24:
        v145 |= objc_msgSend(v18, "isMainDisplayWindowScene");
        goto LABEL_25;
      }
      objc_msgSend(v10, "requestIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "hasPrefix:", CFSTR("com.apple.conversationController"));

      if (!v21)
        goto LABEL_24;
      objc_msgSend(v13, "windowLevel");
      v23 = v22;
      -[SBHideSharePlayContentFromSharedScreenController _coverSheetWindowLevel](self, "_coverSheetWindowLevel");
      v144 |= v23 < v24;
LABEL_25:

      if ((v144 & 1) != 0 && (v145 & 1) != 0)
      {
        v144 = 1;
        v145 = 1;
        goto LABEL_32;
      }
    }
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v171, v181, 16);
    if (v8)
      continue;
    break;
  }
LABEL_32:

  if (v140)
  {
    -[NSHashTable allObjects](self->_trackedTransientOverlays, "allObjects");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = 0;
  }
  v138 = v5;
  v169 = 0u;
  v170 = 0u;
  v167 = 0u;
  v168 = 0u;
  v143 = v25;
  v26 = objc_msgSend(v143, "countByEnumeratingWithState:objects:count:", &v167, v180, 16);
  if (v26)
  {
    v27 = v26;
    v28 = 0;
    v29 = 0;
    v30 = *(_QWORD *)v168;
    while (2)
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v168 != v30)
          objc_enumerationMutation(v143);
        objc_msgSend(*(id *)(*((_QWORD *)&v167 + 1) + 8 * j), "view");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "window");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v33, "windowScene");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_opt_class();
        v36 = v34;
        if (v35)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v37 = v36;
          else
            v37 = 0;
        }
        else
        {
          v37 = 0;
        }
        v38 = v37;

        objc_msgSend(v33, "windowLevel");
        v40 = v39;
        -[SBHideSharePlayContentFromSharedScreenController _coverSheetWindowLevel](self, "_coverSheetWindowLevel");
        v29 |= v40 < v41;
        v42 = objc_msgSend(v38, "isMainDisplayWindowScene");

        v28 |= v42;
        if ((v29 & 1) != 0 && (v28 & 1) != 0)
        {
          v28 = 1;
          v29 = 1;
          goto LABEL_52;
        }
      }
      v27 = objc_msgSend(v143, "countByEnumeratingWithState:objects:count:", &v167, v180, 16);
      if (v27)
        continue;
      break;
    }
  }
  else
  {
    v28 = 0;
    v29 = 0;
  }
LABEL_52:

  if (v140)
    v43 = -[SBHideSharePlayContentFromSharedScreenController _deviceHasDaemonSceneThatShouldBeShared](self, "_deviceHasDaemonSceneThatShouldBeShared");
  else
    v43 = 0;
  objc_msgSend((id)SBApp, "windowSceneManager");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "connectedWindowScenes");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = objc_msgSend(v45, "count");
  v47 = (double *)MEMORY[0x1E0CEBBD8];
  if (v46 == 1)
  {
    objc_msgSend(v45, "anyObject");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "isMainDisplayWindowScene");

    v50 = v49 & ~v43;
    v51 = *v47;
    if (v49)
    {
      -[SBHideSharePlayContentFromSharedScreenController _pipViewControllerToHide](self, "_pipViewControllerToHide");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "view");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "window");
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      if (((v145 | v28) & 1) != 0)
      {
        v55 = v51;
        if ((v145 & 1) != 0)
        {
          -[NSHashTable anyObject](self->_trackedPresentables, "anyObject");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          UIViewControllerFromPresentable();
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "view");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "window");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "windowLevel");
          v55 = v60;

        }
        if ((v28 & 1) != 0)
        {
          -[NSHashTable anyObject](self->_trackedTransientOverlays, "anyObject");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "view");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "window");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "windowLevel");
          v51 = v64;

        }
        if (v55 + 0.01 >= v51 + 0.01)
          v65 = v55 + 0.01;
        else
          v65 = v51 + 0.01;
        LOBYTE(v66) = v144 | v29;
        if (((v144 | v29) & 1) == 0 && v137)
        {
          objc_msgSend(v54, "windowLevel");
          if (v55 >= v67)
          {
            LOBYTE(v66) = 1;
          }
          else
          {
            objc_msgSend(v54, "windowLevel");
            LOBYTE(v66) = v51 >= v68;
          }
        }
      }
      else if (self->_isControlCenterFullyPresentedOnMainDisplay)
      {
        +[SBControlCenterController sharedInstanceIfExists](SBControlCenterController, "sharedInstanceIfExists");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "_controlCenterWindow");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "windowLevel");
        v71 = v70;

        LOBYTE(v66) = 0;
        v65 = v71 + 0.001;
      }
      else if (v137)
      {
        -[SBHideSharePlayContentFromSharedScreenController _systemNotesWindow](self, "_systemNotesWindow");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "windowLevel");
        v74 = v73;

        objc_msgSend(v54, "windowLevel");
        v76 = v75;
        v65 = v75 + -0.001;
        -[SBHideSharePlayContentFromSharedScreenController _systemNotesWindow](self, "_systemNotesWindow");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v66) = (v74 >= v76) & ~objc_msgSend(v77, "isHidden");

      }
      else
      {
        LOBYTE(v66) = 0;
        v65 = v51;
      }

      v51 = v65;
    }
    else
    {
      LOBYTE(v66) = 0;
    }
  }
  else
  {
    v50 = 0;
    LOBYTE(v66) = 0;
    v51 = *MEMORY[0x1E0CEBBD8];
  }
  v78 = 0.0;
  if (!-[SBHideSharePlayContentFromSharedScreenController _isCoverSheetFullyPresented](self, "_isCoverSheetFullyPresented"))
  {
    if (-[SBHideSharePlayContentFromSharedScreenController _isCoverSheetVisible](self, "_isCoverSheetVisible"))
    {
      -[SBHideSharePlayContentFromSharedScreenController _coverSheetWindowLevel](self, "_coverSheetWindowLevel");
      v80 = v79 + -0.01;
      if (v51 >= v80)
        v78 = v80;
      else
        v78 = v51;
    }
    else
    {
      v78 = v51;
    }
  }
  if (v140)
    v81 = v50;
  else
    v81 = 0;
  if (v50)
    v82 = (char)v66;
  else
    v82 = v140 != 0;
  cloneTerminatingWindow = self->_cloneTerminatingWindow;
  if (v81 != 1)
  {
    -[UIWindow setHidden:](cloneTerminatingWindow, "setHidden:", 1);
    cloneTerminatingLayer = self->_cloneTerminatingLayer;
    self->_cloneTerminatingLayer = 0;

    v98 = self->_cloneTerminatingWindow;
    self->_cloneTerminatingWindow = 0;

    if (v82)
      goto LABEL_117;
    goto LABEL_97;
  }
  if (!cloneTerminatingWindow)
  {
    v84 = v45;
    objc_msgSend(v45, "anyObject");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = (UIWindow *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAC18]), "initWithWindowScene:", v85);
    v87 = self->_cloneTerminatingWindow;
    self->_cloneTerminatingWindow = v86;

    -[UIWindow setUserInteractionEnabled:](self->_cloneTerminatingWindow, "setUserInteractionEnabled:", 0);
    -[UIWindow layer](self->_cloneTerminatingWindow, "layer");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "setAllowsHitTesting:", 0);

    v89 = self->_cloneTerminatingWindow;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIWindow setBackgroundColor:](v89, "setBackgroundColor:", v90);

    -[UIWindow setWindowLevel:](self->_cloneTerminatingWindow, "setWindowLevel:", v78);
    -[UIWindow setHidden:](self->_cloneTerminatingWindow, "setHidden:", 0);
    if (!self->_cloneTerminatingLayer)
    {
      v91 = (CALayer *)objc_opt_new();
      v92 = self->_cloneTerminatingLayer;
      self->_cloneTerminatingLayer = v91;

      -[UIWindow layer](self->_cloneTerminatingWindow, "layer");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "superlayer");
      v94 = (void *)objc_claimAutoreleasedReturnValue();

      if (v94)
      {
        do
        {
          objc_msgSend(v93, "superlayer");
          v95 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v95, "superlayer");
          v96 = (void *)objc_claimAutoreleasedReturnValue();

          v93 = v95;
        }
        while (v96);
      }
      else
      {
        v95 = v93;
      }
      objc_msgSend(v95, "addSublayer:", self->_cloneTerminatingLayer);

    }
    cloneTerminatingWindow = self->_cloneTerminatingWindow;
    v45 = v84;
  }
  -[UIWindow setWindowLevel:](cloneTerminatingWindow, "setWindowLevel:", v78);
  if (!v82)
  {
LABEL_97:
    v153 = 0u;
    v154 = 0u;
    v151 = 0u;
    v152 = 0u;
    -[NSHashTable allObjects](self->_viewControllersWithDisableUpdateMasks, "allObjects");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v151, v176, 16);
    if (v100)
    {
      v101 = v100;
      v102 = *(_QWORD *)v152;
      do
      {
        for (k = 0; k != v101; ++k)
        {
          if (*(_QWORD *)v152 != v102)
            objc_enumerationMutation(v99);
          -[SBHideSharePlayContentFromSharedScreenController _stopHidingViewControllerFromClonedDisplaysIfNeeded:](self, "_stopHidingViewControllerFromClonedDisplaysIfNeeded:", *(_QWORD *)(*((_QWORD *)&v151 + 1) + 8 * k));
        }
        v101 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v151, v176, 16);
      }
      while (v101);
    }

    v149 = 0u;
    v150 = 0u;
    v147 = 0u;
    v148 = 0u;
    -[NSHashTable allObjects](self->_windowsBeingHiddenWithDisableUpdateMask, "allObjects");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v147, v175, 16);
    if (v105)
    {
      v106 = v105;
      v107 = *(_QWORD *)v148;
      v108 = v139;
      do
      {
        for (m = 0; m != v106; ++m)
        {
          if (*(_QWORD *)v148 != v107)
            objc_enumerationMutation(v104);
          -[SBHideSharePlayContentFromSharedScreenController _stopHidingWindowFromClonedDisplaysIfNeeded:](self, "_stopHidingWindowFromClonedDisplaysIfNeeded:", *(_QWORD *)(*((_QWORD *)&v147 + 1) + 8 * m));
        }
        v106 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v147, v175, 16);
      }
      while (v106);
    }
    else
    {
      v108 = v139;
    }
    goto LABEL_158;
  }
LABEL_117:
  v146 = v45;
  objc_storeWeak((id *)&self->_pipViewControllerBeingHiddenWithDisableUpdateMask, v139);
  -[SBHideSharePlayContentFromSharedScreenController _startHidingViewControllerFromClonedDisplaysIfNeeded:](self, "_startHidingViewControllerFromClonedDisplaysIfNeeded:", v139);
  v165 = 0u;
  v166 = 0u;
  v163 = 0u;
  v164 = 0u;
  -[NSHashTable allObjects](self->_trackedPresentables, "allObjects");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v163, v179, 16);
  if (v111)
  {
    v112 = v111;
    v113 = *(_QWORD *)v164;
    do
    {
      for (n = 0; n != v112; ++n)
      {
        if (*(_QWORD *)v164 != v113)
          objc_enumerationMutation(v110);
        v115 = *(void **)(*((_QWORD *)&v163 + 1) + 8 * n);
        objc_msgSend(v115, "requesterIdentifier");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v116, "isEqualToString:", CFSTR("com.apple.ConversationKit")))
        {
          objc_msgSend(v115, "requestIdentifier");
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          v118 = objc_msgSend(v117, "hasPrefix:", CFSTR("com.apple.conversationController"));

          if (!v118)
            continue;
          UIViewControllerFromPresentable();
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBHideSharePlayContentFromSharedScreenController _startHidingViewControllerFromClonedDisplaysIfNeeded:](self, "_startHidingViewControllerFromClonedDisplaysIfNeeded:", v116);
        }

      }
      v112 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v163, v179, 16);
    }
    while (v112);
  }

  v119 = self->_cloneTerminatingWindow;
  if (v119 && (-[UIWindow isHidden](v119, "isHidden") & 1) == 0)
  {
    v161 = 0u;
    v162 = 0u;
    v159 = 0u;
    v160 = 0u;
    -[NSHashTable allObjects](self->_windowsBeingHiddenWithDisableUpdateMask, "allObjects");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v133 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v159, v178, 16);
    if (!v133)
      goto LABEL_157;
    v134 = v133;
    v135 = *(_QWORD *)v160;
    v108 = v139;
    v45 = v146;
    do
    {
      for (ii = 0; ii != v134; ++ii)
      {
        if (*(_QWORD *)v160 != v135)
          objc_enumerationMutation(v104);
        -[SBHideSharePlayContentFromSharedScreenController _stopHidingWindowFromClonedDisplaysIfNeeded:](self, "_stopHidingWindowFromClonedDisplaysIfNeeded:", *(_QWORD *)(*((_QWORD *)&v159 + 1) + 8 * ii));
      }
      v134 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v159, v178, 16);
    }
    while (v134);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEAC18], "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 0, 1);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v155 = 0u;
    v156 = 0u;
    v157 = 0u;
    v158 = 0u;
    v120 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v155, v177, 16);
    if (v120)
    {
      v121 = v120;
      v122 = *(_QWORD *)v156;
      do
      {
        v123 = 0;
        do
        {
          if (*(_QWORD *)v156 != v122)
            objc_enumerationMutation(v104);
          v124 = *(UIWindow **)(*((_QWORD *)&v155 + 1) + 8 * v123);
          -[UIWindow windowScene](v124, "windowScene");
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          v126 = objc_opt_class();
          v127 = v125;
          if (v126)
          {
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v128 = v127;
            else
              v128 = 0;
          }
          else
          {
            v128 = 0;
          }
          v129 = v128;

          v130 = objc_msgSend(v129, "isMainDisplayWindowScene");
          if (v130
            && v124 != self->_cloneTerminatingWindow
            && (-[UIWindow windowLevel](v124, "windowLevel"), v131 >= v78))
          {
            -[SBHideSharePlayContentFromSharedScreenController _startHidingWindowFromClonedDisplaysIfNeeded:](self, "_startHidingWindowFromClonedDisplaysIfNeeded:", v124);
          }
          else
          {
            -[SBHideSharePlayContentFromSharedScreenController _stopHidingWindowFromClonedDisplaysIfNeeded:](self, "_stopHidingWindowFromClonedDisplaysIfNeeded:", v124);
          }
          ++v123;
        }
        while (v121 != v123);
        v132 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v155, v177, 16);
        v121 = v132;
      }
      while (v132);
    }
LABEL_157:
    v108 = v139;
    v45 = v146;
  }
LABEL_158:

}

- (void)_startObservingForActiveHideAssertionIfNeeded
{
  id v3;

  if (!self->_isObservingPIPWindowLevelsAndVisibility)
  {
    self->_isObservingPIPWindowLevelsAndVisibility = 1;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__windowVisibilityDidChange_, *MEMORY[0x1E0CEBDF0], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__windowVisibilityDidChange_, *MEMORY[0x1E0CEBE00], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__resolveHidingBehavior, CFSTR("SBCoverSheetWillPresentNotification"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__resolveHidingBehavior, CFSTR("SBCoverSheetDidPresentNotification"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__resolveHidingBehavior, CFSTR("SBCoverSheetWillDismissNotification"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__resolveHidingBehavior, CFSTR("SBCoverSheetDidDismissNotification"), 0);

  }
}

- (void)_stopObservingForActiveHideAssertionIfNeeded
{
  id v3;

  if (self->_isObservingPIPWindowLevelsAndVisibility)
  {
    self->_isObservingPIPWindowLevelsAndVisibility = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CEBDF0], 0);
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CEBE00], 0);
    objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SBCoverSheetWillPresentNotification"), 0);
    objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SBCoverSheetDidDismissNotification"), 0);

  }
}

- (void)_addAssertion:(id)a3
{
  id v4;
  NSMutableSet *v5;
  NSMutableSet *activeAssertions;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    if (!self->_activeAssertions)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v5 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
      activeAssertions = self->_activeAssertions;
      self->_activeAssertions = v5;

    }
    SBLogInCallPresentation();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543362;
      v9 = v4;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "acquiring hide SharePlay content from cloned displays assertion %{public}@", (uint8_t *)&v8, 0xCu);
    }

    -[NSMutableSet addObject:](self->_activeAssertions, "addObject:", v4);
  }
  -[SBHideSharePlayContentFromSharedScreenController _resolveHidingBehavior](self, "_resolveHidingBehavior");

}

- (void)_removeAssertion:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableSet *activeAssertions;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    SBLogInCallPresentation();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543362;
      v8 = v4;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "removing hide SharePlay content from cloned displays assertion %{public}@", (uint8_t *)&v7, 0xCu);
    }

    -[NSMutableSet removeObject:](self->_activeAssertions, "removeObject:", v4);
  }
  if (!-[NSMutableSet count](self->_activeAssertions, "count"))
  {
    activeAssertions = self->_activeAssertions;
    self->_activeAssertions = 0;

  }
  -[SBHideSharePlayContentFromSharedScreenController _resolveHidingBehavior](self, "_resolveHidingBehavior");

}

- (void)bannerManager:(id)a3 willPresentPresentable:(id)a4 withTransitionCoordinator:(id)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v7 = a4;
  v8 = a5;
  -[SBHideSharePlayContentFromSharedScreenController _startTrackingPresentable:](self, "_startTrackingPresentable:", v7);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __115__SBHideSharePlayContentFromSharedScreenController_bannerManager_willPresentPresentable_withTransitionCoordinator___block_invoke;
  v10[3] = &unk_1E8EA1AD8;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "animateAlongsideTransition:completion:", 0, v10);

}

uint64_t __115__SBHideSharePlayContentFromSharedScreenController_bannerManager_willPresentPresentable_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isCancelled");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_stopTrackingPresentable:", *(_QWORD *)(a1 + 40));
  return result;
}

- (void)bannerManager:(id)a3 willDismissPresentable:(id)a4 withTransitionCoordinator:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v7 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __115__SBHideSharePlayContentFromSharedScreenController_bannerManager_willDismissPresentable_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_1E8EA1AD8;
  v9[4] = self;
  v10 = v7;
  v8 = v7;
  objc_msgSend(a5, "animateAlongsideTransition:completion:", 0, v9);

}

uint64_t __115__SBHideSharePlayContentFromSharedScreenController_bannerManager_willDismissPresentable_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isCancelled");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "_stopTrackingPresentable:", *(_QWORD *)(a1 + 40));
  return result;
}

- (void)_startTrackingPresentable:(id)a3
{
  id v4;
  NSHashTable *trackedPresentables;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  trackedPresentables = self->_trackedPresentables;
  v8 = v4;
  if (!trackedPresentables)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_trackedPresentables;
    self->_trackedPresentables = v6;

    v4 = v8;
    trackedPresentables = self->_trackedPresentables;
  }
  -[NSHashTable addObject:](trackedPresentables, "addObject:", v4);
  -[SBHideSharePlayContentFromSharedScreenController _resolveHidingBehavior](self, "_resolveHidingBehavior");

}

- (void)_stopTrackingPresentable:(id)a3
{
  id v4;
  void *v5;
  NSHashTable *trackedPresentables;

  v4 = a3;
  UIViewControllerFromPresentable();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHideSharePlayContentFromSharedScreenController _stopHidingViewControllerFromClonedDisplaysIfNeeded:](self, "_stopHidingViewControllerFromClonedDisplaysIfNeeded:", v5);

  -[NSHashTable removeObject:](self->_trackedPresentables, "removeObject:", v4);
  if (!-[NSHashTable count](self->_trackedPresentables, "count"))
  {
    trackedPresentables = self->_trackedPresentables;
    self->_trackedPresentables = 0;

  }
  -[SBHideSharePlayContentFromSharedScreenController _resolveHidingBehavior](self, "_resolveHidingBehavior");
}

- (id)_pipViewControllerToHide
{
  void *v2;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  if (self->_isControlCenterFullyPresentedOnMainDisplay)
  {
    v2 = 0;
  }
  else
  {
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pipControllerForType:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHideSharePlayContentFromSharedScreenController.m"), 382, CFSTR("Instance should respond to protocol method"));

    }
    objc_msgSend(v6, "containerViewControllersOnWindowScene:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bs_firstObjectPassingTest:", &__block_literal_global_154);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

uint64_t __76__SBHideSharePlayContentFromSharedScreenController__pipViewControllerToHide__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "prefersHiddenFromClonedDisplay");
}

- (BOOL)_isPipViewControllerToHideOnMainDisplay
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  char v10;

  -[SBHideSharePlayContentFromSharedScreenController _pipViewControllerToHide](self, "_pipViewControllerToHide");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_opt_class();
  v7 = v5;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  v10 = objc_msgSend(v9, "isMainDisplayWindowScene");
  return v10;
}

- (id)_systemNotesWindow
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend((id)SBApp, "windowSceneManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "embeddedDisplayWindowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pipControllerForType:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_leadingWindowForWindowScene:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_isCoverSheetVisible
{
  void *v2;
  char v3;

  +[SBCoverSheetPresentationManager sharedInstanceIfExists](SBCoverSheetPresentationManager, "sharedInstanceIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isVisible");

  return v3;
}

- (BOOL)_isCoverSheetFullyPresented
{
  void *v2;
  void *v3;
  int v4;

  +[SBCoverSheetPresentationManager sharedInstanceIfExists](SBCoverSheetPresentationManager, "sharedInstanceIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isVisible"))
  {
    +[SBCoverSheetPresentationManager sharedInstanceIfExists](SBCoverSheetPresentationManager, "sharedInstanceIfExists");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isTransitioning") ^ 1;

  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (double)_coverSheetWindowLevel
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  +[SBCoverSheetPresentationManager sharedInstanceIfExists](SBCoverSheetPresentationManager, "sharedInstanceIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "coverSheetWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowLevel");
  v5 = v4;

  return v5;
}

- (void)_startHidingViewControllerFromClonedDisplaysIfNeeded:(id)a3
{
  id v4;
  NSHashTable *viewControllersWithDisableUpdateMasks;
  NSHashTable *v6;
  NSHashTable *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4 && !-[NSHashTable containsObject:](self->_viewControllersWithDisableUpdateMasks, "containsObject:", v4))
  {
    viewControllersWithDisableUpdateMasks = self->_viewControllersWithDisableUpdateMasks;
    if (!viewControllersWithDisableUpdateMasks)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v7 = self->_viewControllersWithDisableUpdateMasks;
      self->_viewControllersWithDisableUpdateMasks = v6;

      viewControllersWithDisableUpdateMasks = self->_viewControllersWithDisableUpdateMasks;
    }
    -[NSHashTable addObject:](viewControllersWithDisableUpdateMasks, "addObject:", v4);
    objc_msgSend(v4, "viewIfLoaded");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setDisableUpdateMask:", objc_msgSend(v9, "disableUpdateMask") | 0x10);
    SBLogInCallPresentation();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543362;
      v12 = v4;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "Started hiding %{public}@ from cloned display", (uint8_t *)&v11, 0xCu);
    }

  }
}

- (void)_stopHidingViewControllerFromClonedDisplaysIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSHashTable *viewControllersWithDisableUpdateMasks;
  UIViewController **p_pipViewControllerBeingHiddenWithDisableUpdateMask;
  id WeakRetained;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4 && -[NSHashTable containsObject:](self->_viewControllersWithDisableUpdateMasks, "containsObject:", v4))
  {
    -[NSHashTable removeObject:](self->_viewControllersWithDisableUpdateMasks, "removeObject:", v4);
    objc_msgSend(v4, "viewIfLoaded");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setDisableUpdateMask:", objc_msgSend(v6, "disableUpdateMask") & 0xFFFFFFEFLL);
    SBLogInCallPresentation();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543362;
      v12 = v4;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Stopped hiding %{public}@ from cloned display", (uint8_t *)&v11, 0xCu);
    }

  }
  if (!-[NSHashTable count](self->_viewControllersWithDisableUpdateMasks, "count"))
  {
    viewControllersWithDisableUpdateMasks = self->_viewControllersWithDisableUpdateMasks;
    self->_viewControllersWithDisableUpdateMasks = 0;

  }
  p_pipViewControllerBeingHiddenWithDisableUpdateMask = &self->_pipViewControllerBeingHiddenWithDisableUpdateMask;
  WeakRetained = objc_loadWeakRetained((id *)p_pipViewControllerBeingHiddenWithDisableUpdateMask);

  if (WeakRetained == v4)
    objc_storeWeak((id *)p_pipViewControllerBeingHiddenWithDisableUpdateMask, 0);

}

- (void)_startHidingWindowFromClonedDisplaysIfNeeded:(id)a3
{
  id v4;
  NSHashTable *windowsBeingHiddenWithDisableUpdateMask;
  NSHashTable *v6;
  NSHashTable *v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4 && !-[NSHashTable containsObject:](self->_windowsBeingHiddenWithDisableUpdateMask, "containsObject:", v4))
  {
    windowsBeingHiddenWithDisableUpdateMask = self->_windowsBeingHiddenWithDisableUpdateMask;
    if (!windowsBeingHiddenWithDisableUpdateMask)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v7 = self->_windowsBeingHiddenWithDisableUpdateMask;
      self->_windowsBeingHiddenWithDisableUpdateMask = v6;

      windowsBeingHiddenWithDisableUpdateMask = self->_windowsBeingHiddenWithDisableUpdateMask;
    }
    -[NSHashTable addObject:](windowsBeingHiddenWithDisableUpdateMask, "addObject:", v4);
    objc_msgSend(v4, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDisableUpdateMask:", objc_msgSend(v8, "disableUpdateMask") | 0x10);
    SBLogInCallPresentation();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543362;
      v11 = v4;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Started hiding %{public}@ from cloned display", (uint8_t *)&v10, 0xCu);
    }

  }
}

- (void)_stopHidingWindowFromClonedDisplaysIfNeeded:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSHashTable *windowsBeingHiddenWithDisableUpdateMask;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4 && -[NSHashTable containsObject:](self->_windowsBeingHiddenWithDisableUpdateMask, "containsObject:", v4))
  {
    -[NSHashTable removeObject:](self->_windowsBeingHiddenWithDisableUpdateMask, "removeObject:", v4);
    objc_msgSend(v4, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDisableUpdateMask:", objc_msgSend(v5, "disableUpdateMask") & 0xFFFFFFEFLL);
    SBLogInCallPresentation();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543362;
      v9 = v4;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Stopped hiding %{public}@ from cloned display", (uint8_t *)&v8, 0xCu);
    }

  }
  if (!-[NSHashTable count](self->_windowsBeingHiddenWithDisableUpdateMask, "count"))
  {
    windowsBeingHiddenWithDisableUpdateMask = self->_windowsBeingHiddenWithDisableUpdateMask;
    self->_windowsBeingHiddenWithDisableUpdateMask = 0;

  }
}

- (BOOL)_deviceHasDaemonSceneThatShouldBeShared
{
  BOOL v3;
  BOOL v4;
  uint64_t v5;

  if (!-[SBHideSharePlayContentFromSharedScreenController _canShareDaemonScenes](self, "_canShareDaemonScenes"))
    return 0;
  v3 = -[SBHideSharePlayContentFromSharedScreenController _deviceHasDaemonSceneThatShouldBeSharedIfPossible](self, "_deviceHasDaemonSceneThatShouldBeSharedIfPossible");
  v4 = 1;
  if (!v3)
  {
    v5 = SBFEffectiveArtworkSubtype();
    if (v5 > 2795)
    {
      if (v5 != 2796 && v5 != 2868)
        return 0;
    }
    else if (v5 != 2556 && v5 != 2622)
    {
      return 0;
    }
  }
  return v4;
}

- (BOOL)_canShareDaemonScenes
{
  if ((_os_feature_enabled_impl() & 1) != 0)
    return 0;
  else
    return !-[SBHideSharePlayContentFromSharedScreenController _isCoverSheetVisible](self, "_isCoverSheetVisible");
}

- (BOOL)_deviceHasDaemonSceneThatShouldBeSharedIfPossible
{
  void *v3;
  BOOL v4;

  objc_msgSend((id)SBApp, "mousePointerManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_msgSend(v3, "isHardwarePointingDeviceAttached") & 1) != 0 || self->_numberOfActiveDragSessions > 0;

  return v4;
}

- (void)dragSessionDidBegin:(id)a3
{
  ++self->_numberOfActiveDragSessions;
  -[SBHideSharePlayContentFromSharedScreenController _resolveHidingBehavior](self, "_resolveHidingBehavior", a3);
}

- (void)dragSessionDidEnd:(id)a3
{
  --self->_numberOfActiveDragSessions;
  -[SBHideSharePlayContentFromSharedScreenController _resolveHidingBehavior](self, "_resolveHidingBehavior", a3);
}

- (void)mousePointerManager:(id)a3 hardwarePointingDeviceAttachedDidChange:(BOOL)a4
{
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __112__SBHideSharePlayContentFromSharedScreenController_mousePointerManager_hardwarePointingDeviceAttachedDidChange___block_invoke;
  v4[3] = &unk_1E8E9DF28;
  objc_copyWeak(&v5, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __112__SBHideSharePlayContentFromSharedScreenController_mousePointerManager_hardwarePointingDeviceAttachedDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_resolveHidingBehavior");

}

- (void)transientOverlayPresentationManager:(id)a3 willPresentViewController:(id)a4
{
  -[SBHideSharePlayContentFromSharedScreenController _startTrackingTransientOverlayViewController:](self, "_startTrackingTransientOverlayViewController:", a4);
  -[SBHideSharePlayContentFromSharedScreenController _resolveHidingBehavior](self, "_resolveHidingBehavior");
}

- (void)transientOverlayPresentationManager:(id)a3 didDismissViewController:(id)a4 wasTopmostPresentation:(BOOL)a5
{
  -[SBHideSharePlayContentFromSharedScreenController _stopTrackingTransientOverlayViewController:](self, "_stopTrackingTransientOverlayViewController:", a4);
  -[SBHideSharePlayContentFromSharedScreenController _resolveHidingBehavior](self, "_resolveHidingBehavior");
}

- (void)_startTrackingTransientOverlayViewController:(id)a3
{
  id v4;
  NSHashTable *trackedTransientOverlays;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  trackedTransientOverlays = self->_trackedTransientOverlays;
  v8 = v4;
  if (!trackedTransientOverlays)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_trackedTransientOverlays;
    self->_trackedTransientOverlays = v6;

    v4 = v8;
    trackedTransientOverlays = self->_trackedTransientOverlays;
  }
  -[NSHashTable addObject:](trackedTransientOverlays, "addObject:", v4);
  -[SBHideSharePlayContentFromSharedScreenController _resolveHidingBehavior](self, "_resolveHidingBehavior");

}

- (void)_stopTrackingTransientOverlayViewController:(id)a3
{
  id v4;
  NSHashTable *trackedTransientOverlays;

  v4 = a3;
  -[SBHideSharePlayContentFromSharedScreenController _stopHidingViewControllerFromClonedDisplaysIfNeeded:](self, "_stopHidingViewControllerFromClonedDisplaysIfNeeded:", v4);
  -[NSHashTable removeObject:](self->_trackedTransientOverlays, "removeObject:", v4);

  if (!-[NSHashTable count](self->_trackedTransientOverlays, "count"))
  {
    trackedTransientOverlays = self->_trackedTransientOverlays;
    self->_trackedTransientOverlays = 0;

  }
  -[SBHideSharePlayContentFromSharedScreenController _resolveHidingBehavior](self, "_resolveHidingBehavior");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simulatedAssertion, 0);
  objc_storeStrong((id *)&self->_cloneTerminatingLayer, 0);
  objc_storeStrong((id *)&self->_cloneTerminatingWindow, 0);
  objc_storeStrong((id *)&self->_activeAssertions, 0);
  objc_destroyWeak((id *)&self->_pipViewControllerBeingHiddenWithDisableUpdateMask);
  objc_storeStrong((id *)&self->_viewControllersWithDisableUpdateMasks, 0);
  objc_storeStrong((id *)&self->_windowsBeingHiddenWithDisableUpdateMask, 0);
  objc_storeStrong((id *)&self->_trackedTransientOverlays, 0);
  objc_storeStrong((id *)&self->_trackedPresentables, 0);
}

@end
