@implementation SBWindowSceneStatusBarLayoutManager

- (BOOL)statusBarOrientationShouldFollowWindow:(id)a3
{
  NSMutableDictionary *orientationWindowDictionary;
  void *v5;
  id v6;
  void *v7;
  id v8;

  orientationWindowDictionary = self->_orientationWindowDictionary;
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a3;
  objc_msgSend(v5, "numberWithUnsignedInteger:", -[SBWindowSceneStatusBarLayoutManager topmostActiveLayoutLayer](self, "topmostActiveLayoutLayer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](orientationWindowDictionary, "objectForKey:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  return v8 == v6;
}

- (UIEdgeInsets)statusBarEdgeInsets
{
  NSMutableDictionary *edgeInsetsDictionary;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIEdgeInsets result;

  edgeInsetsDictionary = self->_edgeInsetsDictionary;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SBWindowSceneStatusBarLayoutManager topmostActiveLayoutLayer](self, "topmostActiveLayoutLayer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](edgeInsetsDictionary, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UIEdgeInsetsValue");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (unint64_t)topmostActiveLayoutLayer
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;

  -[NSMutableSet allObjects](self->_activeLayoutLayers, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingSelector:", sel_compare_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  return v5;
}

- (SBWindowSceneStatusBarLayoutManager)initWithWindowScene:(id)a3
{
  id v4;
  SBWindowSceneStatusBarLayoutManager *v5;
  SBWindowSceneStatusBarLayoutManager *v6;
  NSMutableOrderedSet *v7;
  NSMutableOrderedSet *windowLevelOverrideReasons;
  NSMutableDictionary *v9;
  NSMutableDictionary *windowLevelOverrideMap;
  NSMutableDictionary *v11;
  NSMutableDictionary *orientationWindowDictionary;
  id v13;
  uint64_t v14;
  BSInvalidatable *stateCaptureAssertion;
  id v17;
  id location;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SBWindowSceneStatusBarLayoutManager;
  v5 = -[SBWindowSceneStatusBarLayoutManager init](&v19, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_windowScene, v4);
    v6->_defaultWindowLevel = *MEMORY[0x1E0CEBE30] + -1.0;
    v7 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    windowLevelOverrideReasons = v6->_windowLevelOverrideReasons;
    v6->_windowLevelOverrideReasons = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    windowLevelOverrideMap = v6->_windowLevelOverrideMap;
    v6->_windowLevelOverrideMap = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    orientationWindowDictionary = v6->_orientationWindowDictionary;
    v6->_orientationWindowDictionary = v11;

    objc_initWeak(&location, v6);
    v13 = MEMORY[0x1E0C80D38];
    objc_copyWeak(&v17, &location);
    BSLogAddStateCaptureBlockWithTitle();
    v14 = objc_claimAutoreleasedReturnValue();
    stateCaptureAssertion = v6->_stateCaptureAssertion;
    v6->_stateCaptureAssertion = (BSInvalidatable *)v14;

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v6;
}

id __59__SBWindowSceneStatusBarLayoutManager_initWithWindowScene___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)addActiveLayoutLayer:(unint64_t)a3
{
  uint64_t v5;
  NSMutableSet *activeLayoutLayers;
  NSMutableSet *v7;
  NSMutableSet *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v5 = -[NSMutableSet count](self->_activeLayoutLayers, "count");
  activeLayoutLayers = self->_activeLayoutLayers;
  if (!activeLayoutLayers)
  {
    v7 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", &unk_1E91D23F0, 0);
    v8 = self->_activeLayoutLayers;
    self->_activeLayoutLayers = v7;

    activeLayoutLayers = self->_activeLayoutLayers;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](activeLayoutLayers, "addObject:", v9);

  if (-[NSMutableSet count](self->_activeLayoutLayers, "count") != v5)
  {
    -[SBWindowSceneStatusBarLayoutManager _updateStatusBarOrientationForTopMostActiveLayer](self, "_updateStatusBarOrientationForTopMostActiveLayer");
    SBLogStatusBarish();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[SBWindowSceneStatusBarLayoutManager addActiveLayoutLayer:].cold.1(a3, v10, v11, v12, v13, v14, v15, v16);

    -[SBWindowSceneStatusBarLayoutManager _applyEdgeInsetsToStatusBar](self, "_applyEdgeInsetsToStatusBar");
  }
}

- (void)removeActiveLayoutLayer:(unint64_t)a3
{
  uint64_t v5;
  NSMutableSet *activeLayoutLayers;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v16;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWindowSceneStatusBarLayoutManager.m"), 84, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("layoutLayer != SBWindowSceneStatusBarLayoutLayerHomeScreen"));

  }
  v5 = -[NSMutableSet count](self->_activeLayoutLayers, "count");
  activeLayoutLayers = self->_activeLayoutLayers;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet removeObject:](activeLayoutLayers, "removeObject:", v7);

  if (-[NSMutableSet count](self->_activeLayoutLayers, "count") != v5)
  {
    -[SBWindowSceneStatusBarLayoutManager _updateStatusBarOrientationForTopMostActiveLayer](self, "_updateStatusBarOrientationForTopMostActiveLayer");
    SBLogStatusBarish();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[SBWindowSceneStatusBarLayoutManager removeActiveLayoutLayer:].cold.1(a3, v8, v9, v10, v11, v12, v13, v14);

    -[SBWindowSceneStatusBarLayoutManager _applyEdgeInsetsToStatusBar](self, "_applyEdgeInsetsToStatusBar");
  }
}

- (void)setStatusBarEdgeInsets:(UIEdgeInsets)a3 forLayoutLayer:(unint64_t)a4
{
  double right;
  double bottom;
  double left;
  double top;
  NSMutableDictionary *edgeInsetsDictionary;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  void *v13;
  void *v14;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  edgeInsetsDictionary = self->_edgeInsetsDictionary;
  if (!edgeInsetsDictionary)
  {
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v12 = self->_edgeInsetsDictionary;
    self->_edgeInsetsDictionary = v11;

    edgeInsetsDictionary = self->_edgeInsetsDictionary;
  }
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithUIEdgeInsets:", top, left, bottom, right);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](edgeInsetsDictionary, "setObject:forKey:", v13, v14);

  -[SBWindowSceneStatusBarLayoutManager _applyEdgeInsetsToStatusBar](self, "_applyEdgeInsetsToStatusBar");
}

- (void)setDefaultWindowLevel:(double)a3
{
  self->_defaultWindowLevel = a3;
  -[SBWindowSceneStatusBarLayoutManager _updateWindowLevel](self, "_updateWindowLevel");
}

- (void)setWindowLevel:(double)a3 forOverrideReason:(id)a4
{
  id v7;
  NSMutableDictionary *windowLevelOverrideMap;
  void *v9;
  void *v10;
  id v11;

  v7 = a4;
  v11 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWindowSceneStatusBarLayoutManager.m"), 122, CFSTR("windowLevelOverrideReason is not valid"));

    v7 = 0;
  }
  -[NSMutableOrderedSet addObject:](self->_windowLevelOverrideReasons, "addObject:", v7);
  windowLevelOverrideMap = self->_windowLevelOverrideMap;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](windowLevelOverrideMap, "setObject:forKey:", v9, v11);

  -[SBWindowSceneStatusBarLayoutManager _updateWindowLevel](self, "_updateWindowLevel");
}

- (void)removeWindowLevelOverrideReason:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWindowSceneStatusBarLayoutManager.m"), 131, CFSTR("windowLevelOverrideReason is not valid"));

    v5 = 0;
  }
  -[NSMutableOrderedSet removeObject:](self->_windowLevelOverrideReasons, "removeObject:", v5);
  -[NSMutableDictionary removeObjectForKey:](self->_windowLevelOverrideMap, "removeObjectForKey:", v7);
  -[SBWindowSceneStatusBarLayoutManager _updateWindowLevel](self, "_updateWindowLevel");

}

- (void)setOrientationWindow:(id)a3 forStatusBarLayoutLayer:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  const __CFString *v8;
  NSMutableDictionary *orientationWindowDictionary;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  SBLogStatusBarish();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    if (a4 > 2)
      v8 = CFSTR("invalid");
    else
      v8 = off_1E8EC1938[a4];
    v11 = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "Updating window for status bar orientation updates to %@ for layer %@.", (uint8_t *)&v11, 0x16u);
  }

  if (v6)
  {
    orientationWindowDictionary = self->_orientationWindowDictionary;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](orientationWindowDictionary, "setObject:forKey:", v6, v10);

  }
}

- (id)orientationWindowForLayoutLayer:(unint64_t)a3
{
  NSMutableDictionary *orientationWindowDictionary;
  void *v4;
  void *v5;

  orientationWindowDictionary = self->_orientationWindowDictionary;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](orientationWindowDictionary, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_updateWindowLevel
{
  double defaultWindowLevel;
  NSMutableDictionary *windowLevelOverrideMap;
  void *v5;
  void *v6;
  float v7;
  void *v8;
  void *v9;
  id WeakRetained;

  defaultWindowLevel = self->_defaultWindowLevel;
  if (-[NSMutableOrderedSet count](self->_windowLevelOverrideReasons, "count"))
  {
    windowLevelOverrideMap = self->_windowLevelOverrideMap;
    -[NSMutableOrderedSet firstObject](self->_windowLevelOverrideReasons, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](windowLevelOverrideMap, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "floatValue");
    defaultWindowLevel = v7;

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "statusBarManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "statusBarWindow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWindowLevel:", defaultWindowLevel);

}

- (void)_applyEdgeInsetsToStatusBar
{
  id WeakRetained;
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
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  NSObject *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  void *v31;
  unint64_t v32;
  const __CFString *v33;
  int v34;
  void *v35;
  __int16 v36;
  const __CFString *v37;
  uint64_t v38;
  CGRect v39;
  UIEdgeInsets v40;
  CGRect v41;

  v38 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "statusBarManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "statusBarWindow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "statusBarWindowFrame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[SBWindowSceneStatusBarLayoutManager statusBarEdgeInsets](self, "statusBarEdgeInsets");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  SBLogStatusBarish();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    v40.top = v15;
    v40.left = v17;
    v40.bottom = v19;
    v40.right = v21;
    NSStringFromUIEdgeInsets(v40);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[SBWindowSceneStatusBarLayoutManager topmostActiveLayoutLayer](self, "topmostActiveLayoutLayer");
    if (v32 > 2)
      v33 = CFSTR("invalid");
    else
      v33 = off_1E8EC1938[v32];
    v34 = 138412546;
    v35 = v31;
    v36 = 2112;
    v37 = v33;
    _os_log_debug_impl(&dword_1D0540000, v22, OS_LOG_TYPE_DEBUG, "Updating status bar insets to %@ for active layout layer %@", (uint8_t *)&v34, 0x16u);

  }
  v23 = v7 + v17;
  v24 = v9 + v15;
  v25 = v11 - (v17 + v21);
  v26 = v13 - (v15 + v19);
  objc_msgSend(v5, "frame");
  v41.origin.x = v27;
  v41.origin.y = v28;
  v41.size.width = v29;
  v41.size.height = v30;
  v39.origin.x = v23;
  v39.origin.y = v24;
  v39.size.width = v25;
  v39.size.height = v26;
  if (!CGRectEqualToRect(v39, v41))
    objc_msgSend(v5, "setFrame:", v23, v24, v25, v26);

}

- (void)_updateStatusBarOrientationForTopMostActiveLayer
{
  NSMutableDictionary *orientationWindowDictionary;
  void *v4;
  id WeakRetained;
  void *v6;
  id v7;

  orientationWindowDictionary = self->_orientationWindowDictionary;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SBWindowSceneStatusBarLayoutManager topmostActiveLayoutLayer](self, "topmostActiveLayoutLayer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](orientationWindowDictionary, "objectForKeyedSubscript:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    objc_msgSend(WeakRetained, "statusBarManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setStatusBarOrientation:", objc_msgSend(v7, "interfaceOrientation"));

  }
}

- (NSString)description
{
  return (NSString *)-[SBWindowSceneStatusBarLayoutManager descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBWindowSceneStatusBarLayoutManager succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  SBWindowSceneStatusBarLayoutManager *v10;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__SBWindowSceneStatusBarLayoutManager_succinctDescriptionBuilder__block_invoke;
  v8[3] = &unk_1E8E9E820;
  v4 = v3;
  v9 = v4;
  v10 = self;
  v5 = (id)objc_msgSend(v4, "modifyProem:", v8);
  v6 = v4;

  return v6;
}

id __65__SBWindowSceneStatusBarLayoutManager_succinctDescriptionBuilder__block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  const __CFString *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(*(id *)(a1 + 40), "topmostActiveLayoutLayer");
  if (v3 > 2)
    v4 = CFSTR("invalid");
  else
    v4 = off_1E8EC1938[v3];
  v5 = (id)objc_msgSend(v2, "appendObject:withName:", v4, CFSTR("topmostActiveLayoutLayer"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:", CFSTR("defaultWindowLevel"), *(double *)(*(_QWORD *)(a1 + 40) + 48));
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBWindowSceneStatusBarLayoutManager descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  SBWindowSceneStatusBarLayoutManager *v12;

  v4 = (void *)MEMORY[0x1E0D01748];
  v5 = a3;
  objc_msgSend(v4, "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77__SBWindowSceneStatusBarLayoutManager_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E8E9E820;
  v7 = v6;
  v11 = v7;
  v12 = self;
  objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, v5, v10);

  v8 = v7;
  return v8;
}

void __77__SBWindowSceneStatusBarLayoutManager_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  unint64_t v7;
  const __CFString *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;

  v2 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 56));
  objc_msgSend(WeakRetained, "_sceneIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v2, "appendObject:withName:", v4, CFSTR("windowScene identifier"));

  v6 = *(void **)(a1 + 32);
  v7 = objc_msgSend(*(id *)(a1 + 40), "topmostActiveLayoutLayer");
  if (v7 > 2)
    v8 = CFSTR("invalid");
  else
    v8 = off_1E8EC1938[v7];
  v9 = (id)objc_msgSend(v6, "appendObject:withName:", v8, CFSTR("topmostActiveLayoutLayer"));
  v10 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:", CFSTR("defaultWindowLevel"), *(double *)(*(_QWORD *)(a1 + 40) + 48));
  objc_msgSend(*(id *)(a1 + 32), "appendDictionarySection:withName:skipIfEmpty:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("window level overrides"), 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __77__SBWindowSceneStatusBarLayoutManager_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v20[3] = &unk_1E8EC18F0;
  v21 = v11;
  v17 = v11;
  objc_msgSend(v13, "bs_each:", v20);
  objc_msgSend(*(id *)(a1 + 32), "appendDictionarySection:withName:skipIfEmpty:", v17, CFSTR("edge insets (by layer)"), 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __77__SBWindowSceneStatusBarLayoutManager_descriptionBuilderWithMultilinePrefix___block_invoke_3;
  v18[3] = &unk_1E8EC1918;
  v19 = v14;
  v16 = v14;
  objc_msgSend(v15, "bs_each:", v18);
  objc_msgSend(*(id *)(a1 + 32), "appendDictionarySection:withName:skipIfEmpty:", v16, CFSTR("orientation windows (by layer)"), 1);

}

void __77__SBWindowSceneStatusBarLayoutManager_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  unint64_t v6;
  const __CFString *v7;
  id v8;
  UIEdgeInsets v9;

  v5 = a2;
  objc_msgSend(a3, "UIEdgeInsetsValue");
  NSStringFromUIEdgeInsets(v9);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  if (v6 > 2)
    v7 = CFSTR("invalid");
  else
    v7 = off_1E8EC1938[v6];
  objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", v8, v7);

}

void __77__SBWindowSceneStatusBarLayoutManager_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  const __CFString *v6;
  id v7;

  v7 = a3;
  v5 = objc_msgSend(a2, "unsignedIntegerValue");
  if (v5 > 2)
    v6 = CFSTR("invalid");
  else
    v6 = off_1E8EC1938[v5];
  objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", v7, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCaptureAssertion, 0);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_orientationWindowDictionary, 0);
  objc_storeStrong((id *)&self->_activeLayoutLayers, 0);
  objc_storeStrong((id *)&self->_edgeInsetsDictionary, 0);
  objc_storeStrong((id *)&self->_windowLevelOverrideMap, 0);
  objc_storeStrong((id *)&self->_windowLevelOverrideReasons, 0);
}

- (void)addActiveLayoutLayer:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, a2, a3, "Adding status bar active layout layer %@", a5, a6, a7, a8, 2u);
}

- (void)removeActiveLayoutLayer:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, a2, a3, "Removing status bar active layout layer %@", a5, a6, a7, a8, 2u);
}

@end
