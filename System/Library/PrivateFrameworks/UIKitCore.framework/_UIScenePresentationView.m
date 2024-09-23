@implementation _UIScenePresentationView

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)_UIScenePresentationView;
  -[UIView didMoveToWindow](&v14, sel_didMoveToWindow);
  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "presentationView:didMoveToWindow:", self, v3);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v6);
  }

}

- (void)setHostContainerView:(id)a3
{
  _UISceneLayerHostContainerView *v5;
  id *p_hostContainerView;
  _UISceneLayerHostContainerView *hostContainerView;
  id v8;
  _UISceneLayerHostContainerView *v9;

  v5 = (_UISceneLayerHostContainerView *)a3;
  p_hostContainerView = (id *)&self->_hostContainerView;
  hostContainerView = self->_hostContainerView;
  if (hostContainerView != v5)
  {
    v9 = v5;
    -[_UISceneLayerHostContainerView popDataSource:](hostContainerView, "popDataSource:", self);
    v8 = *p_hostContainerView;
    *p_hostContainerView = 0;

    if (v9)
    {
      objc_storeStrong((id *)&self->_hostContainerView, a3);
      objc_msgSend(*p_hostContainerView, "pushDataSource:", self);
      objc_msgSend(*p_hostContainerView, "updateForGeometrySettingsChanges:", self->_effectiveSettings);
    }
    -[UIView addSubview:](self, "addSubview:", v9);
    -[_UIScenePresentationView _updateBackgroundColor](self, "_updateBackgroundColor");
    v5 = v9;
  }

}

- (UIView)backgroundView
{
  BSDispatchQueueAssertMain();
  return self->_backgroundView;
}

- (id)presentationContextForSceneLayerHostContainerView
{
  return self->_currentPresentationContext;
}

- (void)_updateBackgroundColor
{
  id WeakRetained;
  int v4;
  UIScenePresentationContext *currentPresentationContext;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  v4 = objc_msgSend(WeakRetained, "isHosting");

  currentPresentationContext = self->_currentPresentationContext;
  if (v4)
    -[UIScenePresentationContext backgroundColorWhileHosting](currentPresentationContext, "backgroundColorWhileHosting");
  else
    -[UIScenePresentationContext backgroundColorWhileNotHosting](currentPresentationContext, "backgroundColorWhileNotHosting");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self, "setBackgroundColor:", v6);

}

- (void)addObserver:(id)a3
{
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIScenePresentationView.m"), 135, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer"));

  }
  BSDispatchQueueAssertMain();
  observers = self->_observers;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_observers;
    self->_observers = v6;

    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v9);

}

- (void)removeObserver:(id)a3
{
  void *v4;
  NSUInteger v5;
  NSHashTable *observers;
  id v7;

  v7 = a3;
  BSDispatchQueueAssertMain();
  v4 = v7;
  if (v7)
  {
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v7);
    v5 = -[NSHashTable count](self->_observers, "count");
    v4 = v7;
    if (!v5)
    {
      observers = self->_observers;
      self->_observers = 0;

      v4 = v7;
    }
  }

}

- (void)scene:(id)a3 didPrepareUpdateWithContext:(id)a4
{
  id v5;
  unint64_t v6;
  FBSSceneSettings *v7;
  FBSSceneSettings *effectiveSettings;
  FBSSceneSettingsDiffInspector *v9;
  FBSSceneSettingsDiffInspector *geometrySettingsDiffInspector;
  FBSSceneSettingsDiffInspector *v11;
  void *v12;
  void *v13;
  char v14;

  v5 = a4;
  v6 = objc_msgSend(v5, "transactionID");
  objc_msgSend(v5, "settings");
  v7 = (FBSSceneSettings *)objc_claimAutoreleasedReturnValue();
  effectiveSettings = self->_effectiveSettings;
  self->_effectiveSettings = v7;

  if (!self->_geometrySettingsDiffInspector)
  {
    v9 = (FBSSceneSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E0D23218]);
    geometrySettingsDiffInspector = self->_geometrySettingsDiffInspector;
    self->_geometrySettingsDiffInspector = v9;

    -[FBSSceneSettingsDiffInspector observeFrameWithBlock:](self->_geometrySettingsDiffInspector, "observeFrameWithBlock:", &__block_literal_global_235);
    -[FBSSceneSettingsDiffInspector observeInterfaceOrientationWithBlock:](self->_geometrySettingsDiffInspector, "observeInterfaceOrientationWithBlock:", &__block_literal_global_22_3);
    -[FBSSceneSettingsDiffInspector observeDisplayConfigurationWithBlock:](self->_geometrySettingsDiffInspector, "observeDisplayConfigurationWithBlock:", &__block_literal_global_23_3);
  }
  if (v6 <= 1
    || (v14 = 0,
        v11 = self->_geometrySettingsDiffInspector,
        objc_msgSend(v5, "settingsDiff"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        -[FBSSceneSettingsDiffInspector inspectDiff:withContext:](v11, "inspectDiff:withContext:", v12, &v14),
        v12,
        v14))
  {
    objc_msgSend(v5, "transitionContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIScenePresentationView _geometryDidUpdateWithTransitionContext:](self, "_geometryDidUpdateWithTransitionContext:", v13);

  }
}

- (void)setCurrentPresentationContext:(id)a3
{
  UIScenePresentationContext *v4;
  UIScenePresentationContext *currentPresentationContext;
  UIScenePresentationContext *v6;
  UIScenePresentationContext *v7;
  UIScenePresentationContext *v8;
  UIScenePresentationContext *v9;

  v4 = (UIScenePresentationContext *)a3;
  currentPresentationContext = self->_currentPresentationContext;
  if (currentPresentationContext != v4)
  {
    v9 = v4;
    v6 = v4;
    v7 = self->_currentPresentationContext;
    self->_currentPresentationContext = v6;
    v8 = currentPresentationContext;

    -[_UIScenePresentationView _updatePresentationContextFrom:toContext:](self, "_updatePresentationContextFrom:toContext:", v8, self->_currentPresentationContext);
    v4 = v9;
  }

}

- (void)_updatePresentationContextFrom:(id)a3 toContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  id v16;

  v16 = a3;
  v6 = a4;
  -[_UISceneLayerHostContainerView refreshDataSource:](self->_hostContainerView, "refreshDataSource:", self);
  objc_msgSend(v16, "backgroundColorWhileHosting");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "backgroundColorWhileHosting");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((BSEqualObjects() & 1) != 0)
  {
    objc_msgSend(v16, "backgroundColorWhileNotHosting");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "backgroundColorWhileNotHosting");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = BSEqualObjects();

    if ((v11 & 1) != 0)
      goto LABEL_6;
  }
  else
  {

  }
  -[_UIScenePresentationView _updateBackgroundColor](self, "_updateBackgroundColor");
LABEL_6:
  v12 = objc_msgSend(v16, "appearanceStyle");
  if (v12 != objc_msgSend(v6, "appearanceStyle")
    || (objc_msgSend(v16, "hostTransformer"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "hostTransformer"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = BSEqualObjects(),
        v14,
        v13,
        (v15 & 1) == 0))
  {
    -[_UIScenePresentationView _updateFrameAndTransform](self, "_updateFrameAndTransform");
  }
  objc_msgSend(v16, "_isVisibilityPropagationEnabled");
  objc_msgSend(v6, "_isVisibilityPropagationEnabled");
  if ((BSEqualBools() & 1) == 0)
    -[_UIVisibilityPropagationInteraction _setVisibilityPropagationEnabled:]((uint64_t)self->super._interaction, objc_msgSend(v6, "_isVisibilityPropagationEnabled"));

}

- (void)setBackgroundView:(id)a3
{
  UIView *v5;

  v5 = (UIView *)a3;
  BSDispatchQueueAssertMain();
  if (self->_backgroundView != v5)
  {
    objc_storeStrong((id *)&self->_backgroundView, a3);
    -[_UISceneLayerHostContainerView refreshDataSource:](self->_hostContainerView, "refreshDataSource:", self);
  }

}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (!self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIScenePresentationView.m"), 85, CFSTR("Cannot dealloc a _UIScenePresentation view if it hasn't been invalidated first."));

  }
  v5.receiver = self;
  v5.super_class = (Class)_UIScenePresentationView;
  -[_UIVisibilityPropagationView dealloc](&v5, sel_dealloc);
}

- (void)invalidate
{
  _UISceneLayerHostContainerView *hostContainerView;

  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    -[FBSSceneSettingsDiffInspector removeAllObservers](self->_geometrySettingsDiffInspector, "removeAllObservers");
    -[FBScene removeObserver:](self->_scene, "removeObserver:", self);
    -[_UISceneLayerHostContainerView popDataSource:](self->_hostContainerView, "popDataSource:", self);
    hostContainerView = self->_hostContainerView;
    self->_hostContainerView = 0;

    -[_UIVisibilityPropagationInteraction _setVisibilityTarget:]((uint64_t)self->super._interaction, 0);
  }
}

- (_UIScenePresentationView)initWithPresenter:(id)a3
{
  id v4;
  _UIScenePresentationView *v5;
  _UIScenePresentationView *v6;
  uint64_t v7;
  UIScenePresentationContext *currentPresentationContext;
  uint64_t v9;
  FBScene *scene;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  FBSSceneSettings *effectiveSettings;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_UIScenePresentationView;
  v5 = -[_UIVisibilityPropagationView initWithFrame:](&v22, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_presenter, v4);
    objc_msgSend(v4, "presentationContext");
    v7 = objc_claimAutoreleasedReturnValue();
    currentPresentationContext = v6->_currentPresentationContext;
    v6->_currentPresentationContext = (UIScenePresentationContext *)v7;

    objc_msgSend(v4, "scene");
    v9 = objc_claimAutoreleasedReturnValue();
    scene = v6->_scene;
    v6->_scene = (FBScene *)v9;

    -[FBScene clientHandle](v6->_scene, "clientHandle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "processHandle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "pid");

    if ((int)v13 >= 1)
    {
      v14 = (void *)MEMORY[0x1E0D87DF8];
      -[FBScene identityToken](v6->_scene, "identityToken");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      _UISVisibilityEnvironmentForSceneIdentityTokenString();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "targetWithPid:environmentIdentifier:", v13, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIVisibilityPropagationInteraction _setVisibilityTarget:]((uint64_t)v6->super._interaction, v18);

    }
    -[_UIVisibilityPropagationInteraction _setVisibilityPropagationEnabled:]((uint64_t)v6->super._interaction, -[UIScenePresentationContext _isVisibilityPropagationEnabled](v6->_currentPresentationContext, "_isVisibilityPropagationEnabled"));
    -[FBScene addObserver:](v6->_scene, "addObserver:", v6);
    -[FBScene settings](v6->_scene, "settings");
    v19 = objc_claimAutoreleasedReturnValue();
    effectiveSettings = v6->_effectiveSettings;
    v6->_effectiveSettings = (FBSSceneSettings *)v19;

    -[_UIScenePresentationView _updateFrameAndTransform](v6, "_updateFrameAndTransform");
  }

  return v6;
}

- (void)_updateFrameAndTransform
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v27;
  CGAffineTransform v28;
  CGAffineTransform v29;
  CGAffineTransform v30;

  -[_UISceneLayerHostContainerView updateForGeometrySettingsChanges:](self->_hostContainerView, "updateForGeometrySettingsChanges:", self->_effectiveSettings);
  -[FBSSceneSettings frame](self->_effectiveSettings, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = -[FBSSceneSettings interfaceOrientation](self->_effectiveSettings, "interfaceOrientation");
  if ((unint64_t)(v12 - 1) >= 4)
    v13 = 1;
  else
    v13 = v12;
  v23 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v24 = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v30.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v30.c = v23;
  v22 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  *(_OWORD *)&v30.tx = v22;
  v14 = -[UIScenePresentationContext appearanceStyle](self->_currentPresentationContext, "appearanceStyle");
  if (v14)
  {
    if (v14 == 2)
    {
      v5 = _UIWindowConvertRectFromOrientationToOrientation(1, v13, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v9, v11, v9, v11);
      v7 = v16;
      v9 = v17;
      v11 = v18;
      goto LABEL_19;
    }
    if (v14 != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIScenePresentationView.m"), 412, CFSTR("the appearance style is invalid (%li)"), -[UIScenePresentationContext appearanceStyle](self->_currentPresentationContext, "appearanceStyle"));

      goto LABEL_19;
    }
    v5 = *MEMORY[0x1E0C9D538];
    v7 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  switch(v13)
  {
    case 1:
      v15 = 0.0;
      break;
    case 3:
      v15 = 1.57079633;
      break;
    case 4:
      v15 = -1.57079633;
      break;
    default:
      v15 = 3.14159265;
      if (v13 != 2)
        v15 = 0.0;
      break;
  }
  CGAffineTransformMakeRotation(&v29, v15);
  *(float64x2_t *)&v29.a = vrndaq_f64(*(float64x2_t *)&v29.a);
  *(float64x2_t *)&v29.c = vrndaq_f64(*(float64x2_t *)&v29.c);
  *(float64x2_t *)&v29.tx = vrndaq_f64(*(float64x2_t *)&v29.tx);
  v30 = v29;
LABEL_19:
  v28 = v30;
  -[UIView setTransform:](self, "setTransform:", &v28);
  -[UIView setFrame:](self, "setFrame:", v5, v7, v9, v11);
  -[UIScenePresentationContext hostTransformer](self->_currentPresentationContext, "hostTransformer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  memset(&v28, 0, sizeof(v28));
  if (v20)
  {
    objc_msgSend(v20, "transform");
  }
  else
  {
    *(_OWORD *)&v28.a = v24;
    *(_OWORD *)&v28.c = v23;
    *(_OWORD *)&v28.tx = v22;
  }
  t1 = v30;
  memset(&v27, 0, sizeof(v27));
  t2 = v28;
  CGAffineTransformConcat(&v27, &t1, &t2);
  t1 = v27;
  -[UIView setTransform:](self, "setTransform:", &t1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geometryDriverStorage, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_geometrySettingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_hostContainerView, 0);
  objc_storeStrong((id *)&self->_currentPresentationContext, 0);
  objc_storeStrong((id *)&self->_effectiveSettings, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_destroyWeak((id *)&self->_presenter);
}

- (_UIScenePresenterGeometryDriverStorage)_geometryDriverStorage
{
  _UIScenePresenterGeometryDriverStorage *geometryDriverStorage;
  _UIScenePresenterGeometryDriverStorage *v4;
  _UIScenePresenterGeometryDriverStorage *v5;

  geometryDriverStorage = self->_geometryDriverStorage;
  if (!geometryDriverStorage)
  {
    v4 = -[_UIScenePresenterGeometryDriverStorage initWithScenePresentationView:]([_UIScenePresenterGeometryDriverStorage alloc], "initWithScenePresentationView:", self);
    v5 = self->_geometryDriverStorage;
    self->_geometryDriverStorage = v4;

    geometryDriverStorage = self->_geometryDriverStorage;
  }
  return geometryDriverStorage;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIScenePresentationView;
  -[UIView layoutSubviews](&v3, sel_layoutSubviews);
  -[_UIScenePresenterGeometryDriverStorage scenePresentationViewIsLayingOutSubviews](self->_geometryDriverStorage, "scenePresentationViewIsLayingOutSubviews");
}

- (id)_hitTest:(CGPoint)a3 withEvent:(id)a4 windowServerHitTestWindow:(id)a5
{
  double y;
  double x;
  id v9;
  id v10;
  id v11;
  _UIScenePresentationView *v12;
  _UIScenePresentationView *v13;
  BOOL v14;
  objc_super v16;

  y = a3.y;
  x = a3.x;
  v9 = a4;
  v10 = a5;
  -[UIView window](self, "window");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v10)
  {
    v16.receiver = self;
    v16.super_class = (Class)_UIScenePresentationView;
    -[UIView _hitTest:withEvent:windowServerHitTestWindow:](&v16, sel__hitTest_withEvent_windowServerHitTestWindow_, v9, v10, x, y);
    v13 = (_UIScenePresentationView *)objc_claimAutoreleasedReturnValue();
    if (-[UIScenePresentationContext shouldPassthroughHitTestEventsIfTransparent](self->_currentPresentationContext, "shouldPassthroughHitTestEventsIfTransparent"))
    {
      v14 = v13 == self;
    }
    else
    {
      v14 = 0;
    }
    if (v14)
      v12 = 0;
    else
      v12 = v13;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (UIScenePresenter)presenter
{
  return (UIScenePresenter *)objc_loadWeakRetained((id *)&self->_presenter);
}

- (id)identifier
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  objc_msgSend(WeakRetained, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)scene:(id)a3 clientDidConnect:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(a4, "processHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "pid");

  v8 = v14;
  if ((int)v7 >= 1)
  {
    v9 = (void *)MEMORY[0x1E0D87DF8];
    objc_msgSend(v14, "identityToken");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _UISVisibilityEnvironmentForSceneIdentityTokenString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "targetWithPid:environmentIdentifier:", v7, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      -[_UIVisibilityPropagationInteraction _setVisibilityTarget:]((uint64_t)self->super._interaction, v13);

    v8 = v14;
  }

}

- (void)sceneDidActivate:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "clientHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "processHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "pid");

  v7 = v13;
  if ((int)v6 >= 1)
  {
    v8 = (void *)MEMORY[0x1E0D87DF8];
    objc_msgSend(v13, "identityToken");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _UISVisibilityEnvironmentForSceneIdentityTokenString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "targetWithPid:environmentIdentifier:", v6, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      -[_UIVisibilityPropagationInteraction _setVisibilityTarget:]((uint64_t)self->super._interaction, v12);

    v7 = v13;
  }

}

- (void)sceneWillDeactivate:(id)a3 withError:(id)a4
{
  if (self)
    -[_UIVisibilityPropagationInteraction _setVisibilityTarget:]((uint64_t)self->super._interaction, 0);
}

- (NSString)debugDescription
{
  return (NSString *)-[_UIScenePresentationView descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_UIScenePresentationView succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  CGAffineTransform v17;
  CGAffineTransform v18;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  v5 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", WeakRetained, CFSTR("presenter"), 1);

  -[UIScenePresentationContext _exclusiveLayerTargetsToInclude](self->_currentPresentationContext, "_exclusiveLayerTargetsToInclude");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") == 1)
  {
    objc_msgSend(v6, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v3, "appendObject:withName:", v7, CFSTR("exclusiveHostLayerTarget"));

  }
  else if (objc_msgSend(v6, "count"))
  {
    v9 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("exclusiveHostLayerTargets"));
  }
  -[FBScene identifier](self->_scene, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v10, CFSTR("sceneID"), 1);

  -[UIView frame](self, "frame");
  v12 = (id)objc_msgSend(v3, "appendRect:withName:", CFSTR("frame"));
  -[UIView transform](self, "transform");
  if (!CGAffineTransformIsIdentity(&v18))
  {
    -[UIView transform](self, "transform");
    NSStringFromCGAffineTransform(&v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v3, "appendObject:withName:", v13, CFSTR("transform"));

  }
  v15 = (id)objc_msgSend(v3, "appendBool:withName:", -[UIView isHidden](self, "isHidden"), CFSTR("hidden"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIScenePresentationView descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[_UIScenePresentationView succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66___UIScenePresentationView_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E16B1B50;
  v10[4] = self;
  v6 = v5;
  v11 = v6;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v10);

  v7 = v11;
  v8 = v6;

  return v8;
}

- (void)_geometryDidUpdateWithTransitionContext:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v6[5];

  v4 = (void *)MEMORY[0x1E0D016B0];
  objc_msgSend(a3, "animationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68___UIScenePresentationView__geometryDidUpdateWithTransitionContext___block_invoke;
  v6[3] = &unk_1E16B3FD8;
  v6[4] = self;
  objc_msgSend(v4, "tryAnimatingWithSettings:actions:completion:", v5, v6, 0);

}

- (UIScenePresentationContext)currentPresentationContext
{
  return self->_currentPresentationContext;
}

- (_UISceneLayerHostContainerView)hostContainerView
{
  return self->_hostContainerView;
}

- (void)_setGeometryDriverStorage:(id)a3
{
  objc_storeStrong((id *)&self->_geometryDriverStorage, a3);
}

@end
