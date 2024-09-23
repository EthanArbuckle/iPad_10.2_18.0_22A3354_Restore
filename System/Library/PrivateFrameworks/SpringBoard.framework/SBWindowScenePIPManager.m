@implementation SBWindowScenePIPManager

- (NSDictionary)_sourceToEdgeInsets
{
  void *v2;
  void *v3;
  NSDictionary *v4;

  v2 = (void *)-[NSMutableDictionary copy](self->_sourceToEdgeInsets, "copy");
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x1E0C9AA70];
  v4 = v2;

  return v4;
}

- (void)applyPictureInPictureInsets:(UIEdgeInsets)a3 forSource:(int64_t)a4
{
  void *v6;
  NSMutableDictionary *sourceToEdgeInsets;
  void *v8;
  SBWindowScene *v9;
  SBPIPControllerCoordinator *globalCoordinator;
  SBWindowScene *v11;
  _QWORD v12[4];
  SBWindowScene *v13;
  UIEdgeInsets v14;

  v14 = a3;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v14, "{UIEdgeInsets=dddd}");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  sourceToEdgeInsets = self->_sourceToEdgeInsets;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](sourceToEdgeInsets, "setObject:forKeyedSubscript:", v6, v8);

  v9 = self->_windowScene;
  globalCoordinator = self->_globalCoordinator;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__SBWindowScenePIPManager_applyPictureInPictureInsets_forSource___block_invoke;
  v12[3] = &unk_1E8E9E3D8;
  v13 = v9;
  v11 = v9;
  -[SBPIPControllerCoordinator _enumerateControllersByDescendingPriority:](globalCoordinator, "_enumerateControllersByDescendingPriority:", v12);

}

uint64_t __65__SBWindowScenePIPManager_applyPictureInPictureInsets_forSource___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_edgeInsetsDidChangeOnWindowScene:", *(_QWORD *)(a1 + 32));
}

uint64_t __67__SBWindowScenePIPManager_isPointWithinAnyPictureInPictureContent___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "_isPointInsidePictureInPictureContent:onWindowScene:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56));
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (void)_keyboardWillRotate:(id)a3
{
  -[SBWindowScenePIPManager _adjustPIPInsetsForKeyboardFrameChangeNotification:]((uint64_t)self, a3);
}

- (BOOL)isPointWithinAnyPictureInPictureContent:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  SBWindowScene *v6;
  SBPIPControllerCoordinator *globalCoordinator;
  SBWindowScene *v8;
  _QWORD v10[4];
  SBWindowScene *v11;
  uint64_t *v12;
  CGFloat v13;
  CGFloat v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  y = a3.y;
  x = a3.x;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v6 = self->_windowScene;
  globalCoordinator = self->_globalCoordinator;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__SBWindowScenePIPManager_isPointWithinAnyPictureInPictureContent___block_invoke;
  v10[3] = &unk_1E8E9E440;
  v13 = x;
  v14 = y;
  v8 = v6;
  v11 = v8;
  v12 = &v15;
  -[SBPIPControllerCoordinator _enumerateControllersByDescendingPriority:](globalCoordinator, "_enumerateControllersByDescendingPriority:", v10);
  LOBYTE(globalCoordinator) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)globalCoordinator;
}

- (void)_keyboardWillShowOrHide:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CEB900]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if ((v7 & 1) != 0)
  {
    if (self && !-[SBWindowScene isMainDisplayWindowScene](self->_windowScene, "isMainDisplayWindowScene"))
      -[SBPIPControllerCoordinator _enumerateControllersByDescendingPriority:](self->_globalCoordinator, "_enumerateControllersByDescendingPriority:", &__block_literal_global_4);
    SBLogPIP();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[SBWindowScenePIPManager _keyboardWillShowOrHide:].cold.1(v4);

  }
  else
  {
    objc_msgSend(v4, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self->_assumingKeyboardIsVisible = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CEB930]);

    -[SBWindowScenePIPManager _adjustPIPInsetsForKeyboardFrameChangeNotification:]((uint64_t)self, v4);
  }

}

- (void)_keyboardWillChangeFrame:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CEB900]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v7)
  {
    if (self && !-[SBWindowScene isMainDisplayWindowScene](self->_windowScene, "isMainDisplayWindowScene"))
      -[SBPIPControllerCoordinator _enumerateControllersByDescendingPriority:](self->_globalCoordinator, "_enumerateControllersByDescendingPriority:", &__block_literal_global_4);
    SBLogPIP();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[SBWindowScenePIPManager _keyboardWillChangeFrame:].cold.1(v4);

  }
  else
  {
    -[SBWindowScenePIPManager _adjustPIPInsetsForKeyboardFrameChangeNotification:]((uint64_t)self, v4);
  }

}

- (void)_adjustPIPInsetsForKeyboardFrameChangeNotification:(uint64_t)a1
{
  id v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  NSObject *v24;
  NSObject *v25;
  double v26;
  double v27;
  double MaxY;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  _QWORD v38[4];
  _QWORD v39[4];
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CEAAC8], "activeTextEffectsWindowForWindowScene:", *(_QWORD *)(a1 + 80));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v13 = -[SBWindowScenePIPManager _keyboardFrameInScreenSpaceFromNotification:](a1, v3);
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v36 = v8;
    v37 = v6;
    v49.origin.x = v6;
    v49.origin.y = v8;
    v34 = v12;
    v35 = v10;
    v49.size.width = v10;
    v49.size.height = v12;
    v56.origin.x = v13;
    v56.origin.y = v15;
    v56.size.width = v17;
    v56.size.height = v19;
    v50 = CGRectIntersection(v49, v56);
    x = v50.origin.x;
    y = v50.origin.y;
    width = v50.size.width;
    height = v50.size.height;
    if (*(_BYTE *)(a1 + 8) && CGRectIsEmpty(v50))
    {
      if ((objc_msgSend(*(id *)(a1 + 80), "isMainDisplayWindowScene") & 1) == 0)
        objc_msgSend(*(id *)(a1 + 72), "_enumerateControllersByDescendingPriority:", &__block_literal_global_4);
      SBLogPIP();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        -[SBWindowScenePIPManager _adjustPIPInsetsForKeyboardFrameChangeNotification:].cold.1(v3);

    }
    else
    {
      v33 = width;
      SBLogPIP();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v3, "name");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(double *)v39 = v13;
        *(CGFloat *)&v39[1] = v15;
        *(CGFloat *)&v39[2] = v17;
        *(CGFloat *)&v39[3] = v19;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v39, "{CGRect={CGPoint=dd}{CGSize=dd}}");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(CGFloat *)v38 = x;
        *(CGFloat *)&v38[1] = y;
        *(CGFloat *)&v38[2] = width;
        *(CGFloat *)&v38[3] = height;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v38, "{CGRect={CGPoint=dd}{CGSize=dd}}");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315906;
        v41 = "-[SBWindowScenePIPManager _adjustPIPInsetsForKeyboardFrameChangeNotification:]";
        v42 = 2114;
        v43 = v30;
        v44 = 2112;
        v45 = v31;
        v46 = 2114;
        v47 = v32;
        _os_log_debug_impl(&dword_1D0540000, v25, OS_LOG_TYPE_DEBUG, "insets: %s %{public}@ newFrame: %@ intersectionWithContainer: %{public}@", buf, 0x2Au);

      }
      v51.origin.x = v13;
      v51.origin.y = v15;
      v51.size.width = v17;
      v51.size.height = v19;
      v26 = CGRectGetWidth(v51);
      v52.origin.x = v37;
      v52.origin.y = v36;
      v52.size.width = v35;
      v52.size.height = v34;
      v27 = 0.0;
      if (v26 == CGRectGetWidth(v52))
      {
        v53.origin.x = v37;
        v53.origin.y = v36;
        v53.size.width = v35;
        v53.size.height = v34;
        MaxY = CGRectGetMaxY(v53);
        v54.origin.x = x;
        v54.origin.y = y;
        v54.size.width = v33;
        v54.size.height = height;
        if (MaxY == CGRectGetMaxY(v54))
        {
          v55.origin.x = x;
          v55.origin.y = y;
          v55.size.width = v33;
          v55.size.height = height;
          v27 = CGRectGetHeight(v55);
          if (+[SBSpotlightMultiplexingViewController isShownWithinWindowScene:](SBSpotlightMultiplexingViewController, "isShownWithinWindowScene:", *(_QWORD *)(a1 + 80)))
          {
            +[SBSpotlightMultiplexingViewController effectiveSpotlightSearchFieldAvoidanceHeight](SBSpotlightMultiplexingViewController, "effectiveSpotlightSearchFieldAvoidanceHeight");
            v27 = v27 + v29;
          }
        }
      }
      objc_msgSend((id)a1, "applyPictureInPictureInsets:forSource:", 5, 0.0, 0.0, v27, 0.0, *(_QWORD *)&v33, *(_QWORD *)&height);
    }

  }
}

- (double)_keyboardFrameInScreenSpaceFromNotification:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  void *v17;
  void *v18;
  CGRect v20;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CEB928]);

    if (v6)
    {
      v7 = *MEMORY[0x1E0C9D648];
    }
    else
    {
      objc_msgSend(v4, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0CEB890]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "rectValue");
      v7 = v10;
      v12 = v11;
      v14 = v13;
      v16 = v15;

      objc_msgSend(v4, "userInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKey:", *MEMORY[0x1E0CEB860]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v18, "floatValue");
        v20.origin.x = v7;
        v20.origin.y = v12;
        v20.size.width = v14;
        v20.size.height = v16;
        CGRectGetHeight(v20);
      }

    }
  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

- (SBWindowScenePIPManager)initWithGlobalCoordinator:(id)a3
{
  id v5;
  SBWindowScenePIPManager *v6;
  SBWindowScenePIPManager *v7;
  uint64_t v8;
  NSMutableDictionary *contentTypeToWindowMargins;
  uint64_t v10;
  NSMutableDictionary *sourceToEdgeInsets;
  void *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBWindowScenePIPManager;
  v6 = -[SBWindowScenePIPManager init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_globalCoordinator, a3);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
    contentTypeToWindowMargins = v7->_contentTypeToWindowMargins;
    v7->_contentTypeToWindowMargins = (NSMutableDictionary *)v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 11);
    sourceToEdgeInsets = v7->_sourceToEdgeInsets;
    v7->_sourceToEdgeInsets = (NSMutableDictionary *)v10;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v7, sel__shelfHeightDidChange_, CFSTR("SBSwitcherShelfHeightDidChangeNotification"), 0);
    objc_msgSend(v12, "addObserver:selector:name:object:", v7, sel__systemApertureInsetsDidChange_, CFSTR("SBSystemApertureLayoutDidChangeNotification"), 0);
    if (+[SBFloatingDockController isFloatingDockSupported](SBFloatingDockController, "isFloatingDockSupported"))
    {
      objc_msgSend(v12, "addObserver:selector:name:object:", v7, sel__floatingDockHeightWillChange_, CFSTR("SBFloatingDockControllerHeightWillChangeNotification"), 0);
    }

  }
  return v7;
}

- (void)windowSceneDidConnect:(id)a3
{
  id v6;
  _SBPIPEndStashTabSuppressionGestureManager *v7;
  void *v8;
  _SBPIPEndStashTabSuppressionGestureManager *v9;
  _SBPIPEndStashTabSuppressionGestureManager *endStashTabSuppressionGestureManager;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  SBPIPControllerCoordinator *globalCoordinator;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;

  v6 = a3;
  if (self->_windowScene)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWindowScenePIPManager.m"), 93, CFSTR("Cannot assign a new window scene to a PIP manager"));

  }
  objc_storeStrong((id *)&self->_windowScene, a3);
  v7 = [_SBPIPEndStashTabSuppressionGestureManager alloc];
  objc_msgSend(v6, "systemGestureManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_SBPIPEndStashTabSuppressionGestureManager initWithSystemGestureManager:](v7, "initWithSystemGestureManager:", v8);
  endStashTabSuppressionGestureManager = self->_endStashTabSuppressionGestureManager;
  self->_endStashTabSuppressionGestureManager = v9;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_fbsDisplayIdentity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isMainDisplay");

  if (v13)
  {
    objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__keyboardWillShowOrHide_, *MEMORY[0x1E0CEB930], 0);
    objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__keyboardWillShowOrHide_, *MEMORY[0x1E0CEB928], 0);
    objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__keyboardWillChangeFrame_, *MEMORY[0x1E0CEB920], 0);
    objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__keyboardWillRotate_, *MEMORY[0x1E0CEC0A8], 0);
  }
  objc_msgSend(v6, "switcherController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__windowManagementStyleDidChange_, CFSTR("SBSwitcherControllerWindowManagementStyleDidChangeNotification"), v14);

  globalCoordinator = self->_globalCoordinator;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __49__SBWindowScenePIPManager_windowSceneDidConnect___block_invoke;
  v18[3] = &unk_1E8E9E3D8;
  v19 = v6;
  v16 = v6;
  -[SBPIPControllerCoordinator _enumerateControllersByDescendingPriority:](globalCoordinator, "_enumerateControllersByDescendingPriority:", v18);

}

uint64_t __49__SBWindowScenePIPManager_windowSceneDidConnect___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_windowSceneDidConnect:", *(_QWORD *)(a1 + 32));
}

- (void)windowSceneDidDisconnect:(id)a3
{
  SBWindowScene *v5;
  SBWindowScene *windowScene;
  _SBPIPEndStashTabSuppressionGestureManager *endStashTabSuppressionGestureManager;
  SBPIPControllerCoordinator *globalCoordinator;
  SBWindowScene *v9;
  void *v10;
  _QWORD v11[4];
  SBWindowScene *v12;

  v5 = (SBWindowScene *)a3;
  windowScene = v5;
  if (self->_windowScene != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWindowScenePIPManager.m"), 113, CFSTR("Disconnecting an unrelated window scene"));

    windowScene = self->_windowScene;
  }
  self->_windowScene = 0;

  endStashTabSuppressionGestureManager = self->_endStashTabSuppressionGestureManager;
  self->_endStashTabSuppressionGestureManager = 0;

  globalCoordinator = self->_globalCoordinator;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__SBWindowScenePIPManager_windowSceneDidDisconnect___block_invoke;
  v11[3] = &unk_1E8E9E3D8;
  v12 = v5;
  v9 = v5;
  -[SBPIPControllerCoordinator _enumerateControllersByDescendingPriority:](globalCoordinator, "_enumerateControllersByDescendingPriority:", v11);

}

uint64_t __52__SBWindowScenePIPManager_windowSceneDidDisconnect___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_windowSceneDidDisconnect:", *(_QWORD *)(a1 + 32));
}

- (void)configureInsetsForIconController:(id)a3
{
  void *v4;
  double v5;
  double v6;
  id v7;

  v7 = a3;
  if (!+[SBFloatingDockController isFloatingDockSupported](SBFloatingDockController, "isFloatingDockSupported"))
  {
    objc_msgSend(v7, "_rootFolderController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dockHeight");
    v6 = v5;

    -[SBWindowScenePIPManager applyPictureInPictureInsets:forSource:](self, "applyPictureInPictureInsets:forSource:", 1, 0.0, 0.0, v6, 0.0);
  }

}

- (uint64_t)_visualizeKeyboardFrameIfNeeded
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    result = objc_msgSend(*(id *)(result + 80), "isMainDisplayWindowScene");
    if ((result & 1) == 0)
      return objc_msgSend(*(id *)(v1 + 72), "_enumerateControllersByDescendingPriority:", &__block_literal_global_4);
  }
  return result;
}

- (void)_updateFloatingDockInsetsWithoutNotifyingControllers
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];

  -[SBWindowScenePIPManager windowScene](self, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isMainDisplayWindowScene"))
  {
    objc_msgSend(v3, "floatingDockController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isFloatingDockPresented");
    v6 = 0;
    if (v5)
      objc_msgSend(v4, "floatingDockHeight", 0.0);
    v8[0] = 0;
    v8[1] = 0;
    v8[2] = v6;
    v8[3] = 0;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v8, "{UIEdgeInsets=dddd}");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sourceToEdgeInsets, "setObject:forKeyedSubscript:", v7, &unk_1E91CFC18);

  }
}

- (void)_floatingDockHeightWillChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  id v10;

  v10 = a3;
  -[SBWindowScene floatingDockController](self->_windowScene, "floatingDockController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    objc_msgSend(v10, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("SBFloatingDockControllerHeight"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v9 = v8;

    -[SBWindowScenePIPManager applyPictureInPictureInsets:forSource:](self, "applyPictureInPictureInsets:forSource:", 7, 0.0, 0.0, v9, 0.0);
  }

}

- (void)_shelfHeightDidChange:(id)a3
{
  void *v4;
  void *v5;
  float v6;
  double v7;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("SBSwitcherShelfHeight"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  v7 = v6;

  -[SBWindowScenePIPManager applyPictureInPictureInsets:forSource:](self, "applyPictureInPictureInsets:forSource:", 9, 0.0, 0.0, v7, 0.0);
}

- (void)_systemApertureInsetsDidChange:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("SBSystemApertureEdgeInsets"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UIEdgeInsetsValue");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[SBWindowScenePIPManager applyPictureInPictureInsets:forSource:](self, "applyPictureInPictureInsets:forSource:", 10, v7, v9, v11, v13);
}

uint64_t __58__SBWindowScenePIPManager__visualizeKeyboardFrameIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_visualizeKeyboardFrameIfNeeded");
}

- (id)acquireStashAssertionForReason:(int64_t)a3 identifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  SBWindowScene *v11;
  SBPIPCompoundAssertion *v12;
  SBPIPControllerCoordinator *globalCoordinator;
  SBPIPCompoundAssertion *v14;
  SBWindowScene *v15;
  NSMapTable *stashAssertionsToCompoundAssertionMap;
  NSMapTable *v17;
  NSMapTable *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void *v23;
  SBPIPCompoundAssertion *v24;
  SBWindowScene *v25;
  _QWORD v26[4];
  id v27;
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  v7 = objc_alloc(MEMORY[0x1E0D01868]);
  SBStringForPIPBehaviorOverrideReason(a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __69__SBWindowScenePIPManager_acquireStashAssertionForReason_identifier___block_invoke;
  v26[3] = &unk_1E8E9E468;
  objc_copyWeak(&v27, &location);
  v10 = (void *)objc_msgSend(v7, "initWithIdentifier:forReason:invalidationBlock:", v6, v8, v26);

  v11 = self->_windowScene;
  v12 = -[SBPIPCompoundAssertion initWithIdentifier:reason:]([SBPIPCompoundAssertion alloc], "initWithIdentifier:reason:", v6, a3);
  globalCoordinator = self->_globalCoordinator;
  v20 = v9;
  v21 = 3221225472;
  v22 = __69__SBWindowScenePIPManager_acquireStashAssertionForReason_identifier___block_invoke_2;
  v23 = &unk_1E8E9E490;
  v14 = v12;
  v24 = v14;
  v15 = v11;
  v25 = v15;
  -[SBPIPControllerCoordinator _enumerateControllersByDescendingPriority:](globalCoordinator, "_enumerateControllersByDescendingPriority:", &v20);
  stashAssertionsToCompoundAssertionMap = self->_stashAssertionsToCompoundAssertionMap;
  if (!stashAssertionsToCompoundAssertionMap)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable", v20, v21, v22, v23, v24);
    v17 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v18 = self->_stashAssertionsToCompoundAssertionMap;
    self->_stashAssertionsToCompoundAssertionMap = v17;

    stashAssertionsToCompoundAssertionMap = self->_stashAssertionsToCompoundAssertionMap;
  }
  -[NSMapTable setObject:forKey:](stashAssertionsToCompoundAssertionMap, "setObject:forKey:", v14, v10, v20, v21, v22, v23);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

  return v10;
}

void __69__SBWindowScenePIPManager_acquireStashAssertionForReason_identifier___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[6], "objectForKey:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");
    objc_msgSend(v4[6], "removeObjectForKey:", v6);

  }
}

uint64_t __69__SBWindowScenePIPManager_acquireStashAssertionForReason_identifier___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAssertionForController:windowScene:", a2, *(_QWORD *)(a1 + 40));
}

- (void)applyStashedPictureInPicturePadding:(UIEdgeInsets)a3 forPIPSource:(int64_t)a4
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  NSMutableDictionary *v10;
  NSMutableDictionary *contentTypeToStashedPadding;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  SBWindowScene *v15;
  SBPIPControllerCoordinator *globalCoordinator;
  SBWindowScene *v17;
  _QWORD v18[4];
  SBWindowScene *v19;
  _QWORD v20[4];

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  if (!self->_contentTypeToStashedPadding)
  {
    v10 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
    contentTypeToStashedPadding = self->_contentTypeToStashedPadding;
    self->_contentTypeToStashedPadding = v10;

  }
  *(CGFloat *)v20 = top;
  *(CGFloat *)&v20[1] = left;
  *(CGFloat *)&v20[2] = bottom;
  *(CGFloat *)&v20[3] = right;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v20, "{UIEdgeInsets=dddd}");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = self->_contentTypeToStashedPadding;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v12, v14);

  v15 = self->_windowScene;
  globalCoordinator = self->_globalCoordinator;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __76__SBWindowScenePIPManager_applyStashedPictureInPicturePadding_forPIPSource___block_invoke;
  v18[3] = &unk_1E8E9E3D8;
  v19 = v15;
  v17 = v15;
  -[SBPIPControllerCoordinator _enumerateControllersByDescendingPriority:](globalCoordinator, "_enumerateControllersByDescendingPriority:", v18);

}

uint64_t __76__SBWindowScenePIPManager_applyStashedPictureInPicturePadding_forPIPSource___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_minimumStashedPaddingDidChangeOnWindowScene:", *(_QWORD *)(a1 + 32));
}

- (UIEdgeInsets)_minimumStashedPadding
{
  double v3;
  double v4;
  double v5;
  double v6;
  NSMutableDictionary *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;
  UIEdgeInsets result;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0CEB4B0];
  v3 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v6 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v5 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = self->_contentTypeToStashedPadding;
  v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_contentTypeToStashedPadding, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v11), (_QWORD)v21);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "UIEdgeInsetsValue");

        UIEdgeInsetsMax();
        v4 = v13;
        v3 = v14;
        v6 = v15;
        v5 = v16;
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }

  v17 = v4;
  v18 = v3;
  v19 = v6;
  v20 = v5;
  result.right = v20;
  result.bottom = v19;
  result.left = v18;
  result.top = v17;
  return result;
}

- (void)addStashTabSuppressionTarget:(id)a3 action:(SEL)a4
{
  -[_SBPIPEndStashTabSuppressionGestureManager addTarget:action:](self->_endStashTabSuppressionGestureManager, "addTarget:action:", a3, a4);
}

- (void)removeStashTabSuppressionTarget:(id)a3 action:(SEL)a4
{
  -[_SBPIPEndStashTabSuppressionGestureManager removeTarget:action:](self->_endStashTabSuppressionGestureManager, "removeTarget:action:", a3, a4);
}

- (id)acquireWindowLevelOverrideAssertionForControllerWithContentType:(int64_t)a3 toWindowLevel:(unint64_t)a4 withReason:(int64_t)a5 identifier:(id)a6
{
  id v11;
  SBPIPWindowLevelOverrideAssertion *v12;
  SBPIPWindowLevelOverrideAssertion *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v18;
  _QWORD v19[4];
  id v20[2];
  id location;
  uint8_t buf[4];
  SBPIPWindowLevelOverrideAssertion *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v11 = a6;
  if (!a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWindowScenePIPManager.m"), 341, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

  }
  objc_initWeak(&location, self);
  v12 = [SBPIPWindowLevelOverrideAssertion alloc];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __127__SBWindowScenePIPManager_acquireWindowLevelOverrideAssertionForControllerWithContentType_toWindowLevel_withReason_identifier___block_invoke;
  v19[3] = &unk_1E8E9E4B8;
  objc_copyWeak(v20, &location);
  v20[1] = (id)a3;
  v13 = -[SBPIPWindowLevelOverrideAssertion initWithWindowLevel:reason:identifier:invalidationBlock:](v12, "initWithWindowLevel:reason:identifier:invalidationBlock:", a4, a5, v11, v19);
  if (v13)
  {
    SBLogPIP();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v23 = v13;
      _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "[Assertions] Window level assertion was acquired: %{public}@", buf, 0xCu);
    }

    -[SBWindowScenePIPManager _mutableWindowLevelOverrideAssertionsForContentType:createIfNeeded:]((uint64_t)self, a3, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v13);

    -[SBPIPControllerCoordinator controllerForType:](self->_globalCoordinator, "controllerForType:", a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "updatePictureInPictureWindowLevelForWindowScene:", self->_windowScene);

  }
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);

  return v13;
}

void __127__SBWindowScenePIPManager_acquireWindowLevelOverrideAssertionForControllerWithContentType_toWindowLevel_withReason_identifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    -[SBWindowScenePIPManager _mutableWindowLevelOverrideAssertionsForContentType:createIfNeeded:]((uint64_t)WeakRetained, *(_QWORD *)(a1 + 40), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", v3);

    SBLogPIP();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543362;
      v10 = v3;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "[Assertions] Window level assertion was invalidated: %{public}@", (uint8_t *)&v9, 0xCu);
    }

    objc_msgSend(v5[9], "controllerForType:", *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updatePictureInPictureWindowLevelForWindowScene:", v5[10]);

  }
}

- (id)_mutableWindowLevelOverrideAssertionsForContentType:(int)a3 createIfNeeded:
{
  void *v6;
  BOOL v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;

  if (a1)
  {
    v6 = *(void **)(a1 + 32);
    if (v6)
      v7 = 1;
    else
      v7 = a3 == 0;
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v8;

      v6 = *(void **)(a1 + 32);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      v12 = 1;
    else
      v12 = a3 == 0;
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, v14);

    }
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)_windowLevelOverrideAssertionsForContentType:(int64_t)a3
{
  void *v3;
  void *v4;
  id v5;

  -[SBWindowScenePIPManager _mutableWindowLevelOverrideAssertionsForContentType:createIfNeeded:]((uint64_t)self, a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

- (void)updatePictureInPictureWindowLevels
{
  SBWindowScene *v3;
  SBPIPControllerCoordinator *globalCoordinator;
  SBWindowScene *v5;
  _QWORD v6[4];
  SBWindowScene *v7;

  v3 = self->_windowScene;
  globalCoordinator = self->_globalCoordinator;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__SBWindowScenePIPManager_updatePictureInPictureWindowLevels__block_invoke;
  v6[3] = &unk_1E8E9E3D8;
  v7 = v3;
  v5 = v3;
  -[SBPIPControllerCoordinator _enumerateControllersByDescendingPriority:](globalCoordinator, "_enumerateControllersByDescendingPriority:", v6);

}

uint64_t __61__SBWindowScenePIPManager_updatePictureInPictureWindowLevels__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updatePictureInPictureWindowLevelForWindowScene:", *(_QWORD *)(a1 + 32));
}

- (void)setNeedsUpdateZStackParticipantPreferencesWithReason:(id)a3
{
  void *v4;
  SBFZStackParticipant *v5;
  SBFZStackParticipant *zStackParticipant;
  id v7;

  -[SBFZStackParticipant setNeedsUpdatePreferencesWithReason:](self->_zStackParticipant, "setNeedsUpdatePreferencesWithReason:", a3);
  if (!self->_zStackParticipant)
  {
    -[SBWindowScenePIPManager windowScene](self, "windowScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "zStackResolver");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "acquireParticipantWithIdentifier:delegate:", 16, self);
    v5 = (SBFZStackParticipant *)objc_claimAutoreleasedReturnValue();
    zStackParticipant = self->_zStackParticipant;
    self->_zStackParticipant = v5;

  }
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  id v5;
  void *v6;
  SBPIPControllerCoordinator *globalCoordinator;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a4;
  -[SBWindowScenePIPManager windowScene](self, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  globalCoordinator = self->_globalCoordinator;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__SBWindowScenePIPManager_zStackParticipant_updatePreferences___block_invoke;
  v10[3] = &unk_1E8E9E4E0;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  -[SBPIPControllerCoordinator _enumerateControllersByDescendingPriority:](globalCoordinator, "_enumerateControllersByDescendingPriority:", v10);

}

uint64_t __63__SBWindowScenePIPManager_zStackParticipant_updatePreferences___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateZStackParticipantPreferencesIfNeeded:windowScene:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (BOOL)isZStackForegroundActive
{
  return -[SBFZStackParticipant activationState](self->_zStackParticipant, "activationState") == 0;
}

- (void)_windowManagementStyleDidChange:(id)a3
{
  void *v4;
  char v5;
  SBPIPControllerCoordinator *globalCoordinator;
  _QWORD v7[5];
  char v8;

  -[SBWindowScene switcherController](self->_windowScene, "switcherController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isChamoisWindowingUIEnabled");

  globalCoordinator = self->_globalCoordinator;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__SBWindowScenePIPManager__windowManagementStyleDidChange___block_invoke;
  v7[3] = &unk_1E8E9E508;
  v8 = v5;
  v7[4] = self;
  -[SBPIPControllerCoordinator _enumerateControllersByDescendingPriority:](globalCoordinator, "_enumerateControllersByDescendingPriority:", v7);
}

uint64_t __59__SBWindowScenePIPManager__windowManagementStyleDidChange___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setEnhancedWindowingModeEnabled:windowScene:", *(unsigned __int8 *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
}

- (SBPIPControllerCoordinator)globalCoordinator
{
  return self->_globalCoordinator;
}

- (SBWindowScene)windowScene
{
  return self->_windowScene;
}

- (void)setSourceToEdgeInsets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowScene, 0);
  objc_storeStrong((id *)&self->_globalCoordinator, 0);
  objc_storeStrong((id *)&self->_endStashTabSuppressionGestureManager, 0);
  objc_storeStrong((id *)&self->_zStackParticipant, 0);
  objc_storeStrong((id *)&self->_stashAssertionsToCompoundAssertionMap, 0);
  objc_storeStrong((id *)&self->_sourceToEdgeInsets, 0);
  objc_storeStrong((id *)&self->_contentTypeToWindowLevelOverrideAssertions, 0);
  objc_storeStrong((id *)&self->_contentTypeToWindowMargins, 0);
  objc_storeStrong((id *)&self->_contentTypeToStashedPadding, 0);
}

- (void)_adjustPIPInsetsForKeyboardFrameChangeNotification:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1D0540000, v2, v3, "insets: %s ignoring %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)_keyboardWillChangeFrame:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1D0540000, v2, v3, "insets: %s ignoring %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)_keyboardWillShowOrHide:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1D0540000, v2, v3, "insets: %s ignoring %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

@end
