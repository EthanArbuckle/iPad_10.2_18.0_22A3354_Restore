@implementation _UISceneLayerHostContainerView

- (void)_updateRenderingModeForLayersInNormalPresentation
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSMutableOrderedSet *obj;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (-[UIScenePresentationContext renderingMode](self->_presentationContext, "renderingMode"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISceneLayerHostContainerView.m"), 833, CFSTR("Rendering mode must be normal"));

  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = self->_hostViews;
  v4 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v4)
  {
    v5 = v4;
    v23 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v25 != v23)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v7, "sceneLayer");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UISceneLayerHostContainerView _presentationContextForLayer:](self, "_presentationContextForLayer:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = objc_msgSend(v9, "renderingMode");
        objc_msgSend(v9, "_minificationFilterName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          v10 = -[UIScenePresentationContext renderingMode](self->_presentationContext, "renderingMode");
          -[UIScenePresentationContext _minificationFilterName](self->_presentationContext, "_minificationFilterName");
          v12 = objc_claimAutoreleasedReturnValue();

          v11 = (void *)v12;
        }
        v13 = objc_opt_class();
        v14 = v7;
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

        objc_msgSend(v16, "setRenderingMode:", v10);
        -[UIScenePresentationContext asynchronousRenderingOptions](self->_presentationContext, "asynchronousRenderingOptions");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setAsynchronousRenderingOptions:", v17);

        objc_msgSend(v16, "layer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[FBSSceneSettings displayConfiguration](self->_effectiveSceneSettings, "displayConfiguration");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "scale");
        objc_msgSend(v18, "setRasterizationScale:");

        objc_msgSend(v16, "layer");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v20, "setMinificationFilter:", v11);
      }
      v5 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v5);
  }

}

- (id)_presentationContextForLayer:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  UISceneLayerPresentationContext *v8;
  UISceneLayerPresentationContext *v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__95;
  v18 = __Block_byref_object_dispose__95;
  v19 = 0;
  -[UIScenePresentationContext layerPresentationOverrides](self->_presentationContext, "layerPresentationOverrides");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63___UISceneLayerHostContainerView__presentationContextForLayer___block_invoke;
  v11[3] = &unk_1E16C7BF0;
  v6 = v4;
  v12 = v6;
  v13 = &v14;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v11);

  v7 = (void *)v15[5];
  if (v7)
    v8 = v7;
  else
    v8 = objc_alloc_init(UISceneLayerPresentationContext);
  v9 = v8;

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (void)_adjustHostViewFrameAlignment:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  CGAffineTransform v38;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v41;
  CGAffineTransform v42;
  CGAffineTransform v43;

  v4 = a3;
  v36 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v37 = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v43.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v43.c = v36;
  v35 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  *(_OWORD *)&v43.tx = v35;
  -[UIView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "sceneLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "alignment");

  if (v14 == 1)
  {
    v15 = -[FBSSceneSettings interfaceOrientation](self->_effectiveSceneSettings, "interfaceOrientation");
    -[FBSSceneSettings frame](self->_effectiveSceneSettings, "frame");
    v17 = v16;
    v19 = v18;
    v21 = -v20;
    v23 = -v22;
    -[FBSSceneSettings displayConfiguration](self->_effectiveSceneSettings, "displayConfiguration");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bounds");
    v26 = v25;
    v28 = v27;

    v6 = _UIWindowConvertRectFromOrientationToOrientation(1, v15, v21, v23, v26, v28, v17, v19);
    v8 = v29;
    v10 = v30;
    v12 = v31;
    switch(v15)
    {
      case 1:
        v32 = 0.0;
        break;
      case 3:
        v32 = 1.57079633;
        break;
      case 4:
        v32 = -1.57079633;
        break;
      default:
        v32 = 3.14159265;
        if (v15 != 2)
          v32 = 0.0;
        break;
    }
    CGAffineTransformMakeRotation(&v41, -v32);
    *(float64x2_t *)&v41.a = vrndaq_f64(*(float64x2_t *)&v41.a);
    *(float64x2_t *)&v41.c = vrndaq_f64(*(float64x2_t *)&v41.c);
    *(float64x2_t *)&v41.tx = vrndaq_f64(*(float64x2_t *)&v41.tx);
    v42 = v41;
    objc_msgSend(v4, "setCounterTransformView:", 1);
    v43 = v42;
  }
  v42 = v43;
  objc_msgSend(v4, "setTransform:", &v42);
  objc_msgSend(v4, "setFrame:", v6, v8, v10, v12);
  v42 = v43;
  objc_msgSend(v4, "transformer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v33)
  {
    objc_msgSend(v33, "transform");
    *(_OWORD *)&t1.a = v37;
    *(_OWORD *)&t1.c = v36;
    *(_OWORD *)&t1.tx = v35;
    if (!CGAffineTransformEqualToTransform(&t1, &t2))
    {
      objc_msgSend(v34, "transform");
      t1 = v43;
      CGAffineTransformConcat(&v42, &t1, &v38);
      t1 = v42;
      objc_msgSend(v4, "setTransform:", &t1);
    }
  }

}

- (id)window
{
  void *v3;
  uint64_t v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UISceneLayerHostContainerView;
  -[UIView window](&v10, sel_window);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    return v3;
  -[UIView layer](self, "layer");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    return 0;
  v6 = (void *)v5;
  while (1)
  {
    objc_msgSend(v6, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      break;
    objc_msgSend(v6, "superlayer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v3;
    if (!v3)
      return v3;
  }
  objc_msgSend(v6, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)sceneLayerManagerDidUpdateLayers:(id)a3
{
  -[_UISceneLayerHostContainerView _rebuildLayersForReason:withFence:](self, "_rebuildLayersForReason:withFence:", CFSTR("layers updated"), 0);
}

- (void)updateForGeometrySettingsChanges:(id)a3
{
  id v6;
  UIView *innerLayerContainer;
  NSMutableOrderedSet *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISceneLayerHostContainerView.m"), 183, CFSTR("Unable to refresh a data source on an invalidated host container"));

  }
  objc_storeStrong((id *)&self->_effectiveSceneSettings, a3);
  -[FBSSceneSettings bounds](self->_effectiveSceneSettings, "bounds");
  -[UIView setFrame:](self, "setFrame:");
  innerLayerContainer = self->_innerLayerContainer;
  -[FBSSceneSettings bounds](self->_effectiveSceneSettings, "bounds");
  -[UIView setFrame:](innerLayerContainer, "setFrame:");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = self->_hostViews;
  v9 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        -[_UISceneLayerHostContainerView _adjustHostViewFrameAlignment:](self, "_adjustHostViewFrameAlignment:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12++), (_QWORD)v14);
      }
      while (v10 != v12);
      v10 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  if (!self->_asyncRenderGroupingContext)
    -[_UISceneLayerHostContainerView _updateRenderingModeForLayersInNormalPresentation](self, "_updateRenderingModeForLayersInNormalPresentation");
  -[_UISceneLayerHostContainerView updateForGeometrySettingsChanges:](self->_asyncRenderGroupingContainerView, "updateForGeometrySettingsChanges:", v6, (_QWORD)v14);

}

- (void)_rebuildLayersForAsyncPresentationWithReason:(id)a3 withFence:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  CAContext *v17;
  CAContext *asyncRenderGroupingContext;
  _UISceneLayerHostContainerView *v19;
  id v20;
  void *v21;
  _UISceneLayerHostContainerView *v22;
  _UISceneLayerHostContainerView *asyncRenderGroupingContainerView;
  CAContext *v24;
  void *v25;
  void *v26;
  _UIContextLayerHostView *v27;
  void *v28;
  _UIContextLayerHostView *v29;
  _UIContextLayerHostView *asyncRenderGroupingHostView;
  _UIContextLayerHostView *v31;
  void *v32;
  NSMutableOrderedSet *hostedLayers;
  void *v34;
  objc_class *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id WeakRetained;
  void *v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  uint64_t v48;
  uint8_t v49[128];
  uint8_t buf[4];
  _UISceneLayerHostContainerView *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  UIScenePresentationLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v35 = (objc_class *)objc_opt_class();
    NSStringFromClass(v35);
    v36 = v6;
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UISceneLayerHostContainerView scene](self, "scene");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "identifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "identifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v51 = self;
    v52 = 2114;
    v53 = v37;
    v54 = 2114;
    v55 = v39;
    v56 = 2114;
    v57 = v41;
    v58 = 2114;
    v59 = v36;
    _os_log_debug_impl(&dword_185066000, v8, OS_LOG_TYPE_DEBUG, "%p-%{public}@-%{public}@:%{public}@ - async rendering scene for reason: %{public}@", buf, 0x34u);

    v6 = v36;
  }

  if (!self->_asyncRenderGroupingContext)
  {
    v42 = v6;
    v9 = (void *)-[NSMutableOrderedSet mutableCopy](self->_hostViews, "mutableCopy");
    -[NSMutableOrderedSet removeAllObjects](self->_hostedLayers, "removeAllObjects");
    -[NSMutableOrderedSet removeAllObjects](self->_hostViews, "removeAllObjects");
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v44 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "removeFromSuperview");
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      }
      while (v12);
    }

    v15 = (void *)MEMORY[0x1E0CD2720];
    v47 = *MEMORY[0x1E0CD2A50];
    v48 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "remoteContextWithOptions:", v16);
    v17 = (CAContext *)objc_claimAutoreleasedReturnValue();
    asyncRenderGroupingContext = self->_asyncRenderGroupingContext;
    self->_asyncRenderGroupingContext = v17;

    if (v7)
      -[CAContext addFence:](self->_asyncRenderGroupingContext, "addFence:", v7);
    v19 = [_UISceneLayerHostContainerView alloc];
    v20 = objc_loadWeakRetained((id *)&self->_scene);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<AsyncContainerForParentContainer-%p>"), self);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[_UISceneLayerHostContainerView initWithScene:debugDescription:](v19, "initWithScene:debugDescription:", v20, v21);
    asyncRenderGroupingContainerView = self->_asyncRenderGroupingContainerView;
    self->_asyncRenderGroupingContainerView = v22;

    -[_UISceneLayerHostContainerView _setBackgroundView:](self->_asyncRenderGroupingContainerView, "_setBackgroundView:", self->_backgroundView);
    v24 = self->_asyncRenderGroupingContext;
    -[UIView layer](self->_asyncRenderGroupingContainerView, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAContext setLayer:](v24, "setLayer:", v25);

    objc_msgSend(MEMORY[0x1E0D23098], "layerWithCAContext:", self->_asyncRenderGroupingContext);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = [_UIContextLayerHostView alloc];
    -[objc_class layerWithFBSSceneLayer:](NSClassFromString(CFSTR("FBSceneLayer")), "layerWithFBSSceneLayer:", v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[_UIContextLayerHostView initWithSceneLayer:](v27, "initWithSceneLayer:", v28);
    asyncRenderGroupingHostView = self->_asyncRenderGroupingHostView;
    self->_asyncRenderGroupingHostView = v29;

    -[_UIContextLayerHostView setRenderingMode:](self->_asyncRenderGroupingHostView, "setRenderingMode:", 1);
    v31 = self->_asyncRenderGroupingHostView;
    -[UIScenePresentationContext asynchronousRenderingOptions](self->_presentationContext, "asynchronousRenderingOptions");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextLayerHostView setAsynchronousRenderingOptions:](v31, "setAsynchronousRenderingOptions:", v32);

    hostedLayers = self->_hostedLayers;
    -[_UISceneLayerHostView sceneLayer](self->_asyncRenderGroupingHostView, "sceneLayer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableOrderedSet addObject:](hostedLayers, "addObject:", v34);

    -[NSMutableOrderedSet addObject:](self->_hostViews, "addObject:", self->_asyncRenderGroupingHostView);
    -[UIView insertSubview:atIndex:](self->_innerLayerContainer, "insertSubview:atIndex:", self->_asyncRenderGroupingHostView, 0);

    v6 = v42;
  }
  -[_UISceneLayerHostContainerView _rebuildLayersForReason:withFence:](self->_asyncRenderGroupingContainerView, "_rebuildLayersForReason:withFence:", CFSTR("parent async layer rebuild required"), 0);
  -[_UISceneLayerHostContainerView _updateAsyncDrawingOptionsInAsyncPresentation](self, "_updateAsyncDrawingOptionsInAsyncPresentation");
  -[_UISceneLayerHostContainerView _adjustHostViewFrameAlignment:](self, "_adjustHostViewFrameAlignment:", self->_asyncRenderGroupingHostView);

}

- (_UISceneLayerHostContainerView)initWithScene:(id)a3 debugDescription:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _UISceneLayerHostContainerView *v10;
  id v11;
  void *v12;
  uint64_t v13;
  FBSSceneSettings *effectiveSceneSettings;
  uint64_t v15;
  NSString *debugDescription;
  _UITouchPassthroughView *v17;
  UIView *innerLayerContainer;
  UIView *v19;
  void *v20;
  NSMutableOrderedSet *v21;
  NSMutableOrderedSet *hostedLayers;
  NSMutableOrderedSet *v23;
  NSMutableOrderedSet *hostViews;
  void *v26;
  objc_super v27;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISceneLayerHostContainerView.m"), 89, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scene"));

  }
  objc_msgSend(v7, "settings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v27.receiver = self;
  v27.super_class = (Class)_UISceneLayerHostContainerView;
  v10 = -[UIView initWithFrame:](&v27, sel_initWithFrame_);

  if (v10)
  {
    v11 = objc_storeWeak((id *)&v10->_scene, v7);
    objc_msgSend(v7, "layerManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:", v10);

    objc_msgSend(v7, "settings");
    v13 = objc_claimAutoreleasedReturnValue();
    effectiveSceneSettings = v10->_effectiveSceneSettings;
    v10->_effectiveSceneSettings = (FBSSceneSettings *)v13;

    v15 = objc_msgSend(v8, "copy");
    debugDescription = v10->_debugDescription;
    v10->_debugDescription = (NSString *)v15;

    v17 = objc_alloc_init(_UITouchPassthroughView);
    innerLayerContainer = v10->_innerLayerContainer;
    v10->_innerLayerContainer = &v17->super;

    v19 = v10->_innerLayerContainer;
    objc_msgSend(v7, "settings");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bounds");
    -[UIView setFrame:](v19, "setFrame:");

    -[UIView addSubview:](v10, "addSubview:", v10->_innerLayerContainer);
    v21 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    hostedLayers = v10->_hostedLayers;
    v10->_hostedLayers = v21;

    v23 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    hostViews = v10->_hostViews;
    v10->_hostViews = v23;

    -[_UISceneLayerHostContainerView _rebuildLayersForReason:withFence:](v10, "_rebuildLayersForReason:withFence:", CFSTR("init"), 0);
  }

  return v10;
}

- (void)refreshDataSource:(id)a3
{
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISceneLayerHostContainerView.m"), 175, CFSTR("Unable to refresh a data source on an invalidated host container"));

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  v6 = v8;
  if (WeakRetained == v8)
  {
    -[_UISceneLayerHostContainerView _refreshDataSource](self, "_refreshDataSource");
    v6 = v8;
  }

}

- (void)_refreshDataSource
{
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "presentationContextForSceneLayerHostContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UISceneLayerHostContainerView _setPresentationContext:](self, "_setPresentationContext:", v3);

  objc_msgSend(WeakRetained, "backgroundView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UISceneLayerHostContainerView _setBackgroundView:](self, "_setBackgroundView:", v4);

}

- (void)_setBackgroundView:(id)a3
{
  UIView *v5;
  UIView *backgroundView;
  UIView *v7;
  UIView *v8;

  v5 = (UIView *)a3;
  backgroundView = self->_backgroundView;
  if (backgroundView != v5)
  {
    v8 = v5;
    v7 = backgroundView;
    objc_storeStrong((id *)&self->_backgroundView, a3);
    -[_UISceneLayerHostContainerView _applyBackgroundViewToHierarchy](self, "_applyBackgroundViewToHierarchy");
    if (v7)
      -[UIView removeFromSuperview](v7, "removeFromSuperview");

    v5 = v8;
  }

}

- (void)_setPresentationContext:(id)a3
{
  UIScenePresentationContext *v5;
  UIScenePresentationContext **p_presentationContext;
  UIScenePresentationContext *presentationContext;
  UIScenePresentationContext *v8;
  NSMutableOrderedSet *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = (UIScenePresentationContext *)a3;
  p_presentationContext = &self->_presentationContext;
  presentationContext = self->_presentationContext;
  if (presentationContext != v5)
  {
    v8 = presentationContext;
    objc_storeStrong((id *)&self->_presentationContext, a3);
    -[_UISceneLayerHostContainerView _presentationContextChangedFrom:toContext:force:](self, "_presentationContextChangedFrom:toContext:force:", v8, *p_presentationContext, 0);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = self->_hostViews;
    v10 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v13++), "setCurrentPresentationContext:", v5, (_QWORD)v15);
        }
        while (v11 != v13);
        v11 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

    if (self->_asyncRenderGroupingContainerView)
    {
      v14 = (void *)-[UIScenePresentationContext mutableCopy](*p_presentationContext, "mutableCopy");
      objc_msgSend(v14, "setRenderingMode:", 0);
      -[_UISceneLayerHostContainerView _setPresentationContext:](self->_asyncRenderGroupingContainerView, "_setPresentationContext:", v14);

    }
  }

}

- (id)_createHostViewForLayer:(id)a3
{
  id v4;
  id WeakRetained;
  int v6;
  _UIContextLayerHostView *v7;
  _UIKeyboardLayerHostView *v8;
  id v9;
  uint64_t v10;
  _UIKeyboardLayerHostView *v11;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  v6 = objc_msgSend(WeakRetained, "isValid");

  if (v6)
  {
    if (objc_msgSend(v4, "contextID"))
    {
      v7 = -[_UIContextLayerHostView initWithSceneLayer:]([_UIContextLayerHostView alloc], "initWithSceneLayer:", v4);
    }
    else
    {
      if (objc_msgSend(v4, "type") == 3
        && -[_UISceneLayerHostContainerView _canShowKeyboardLayer](self, "_canShowKeyboardLayer"))
      {
        v8 = [_UIKeyboardLayerHostView alloc];
        v9 = objc_loadWeakRetained((id *)&self->_scene);
        v10 = -[_UIKeyboardLayerHostView initWithKeyboardLayer:owningScene:](v8, "initWithKeyboardLayer:owningScene:", v4, v9);
      }
      else
      {
        if (objc_msgSend(v4, "type") != 4
          || !-[_UISceneLayerHostContainerView _canShowKeyboardLayer](self, "_canShowKeyboardLayer"))
        {
          v7 = 0;
          goto LABEL_13;
        }
        v11 = [_UIKeyboardLayerHostView alloc];
        v9 = objc_loadWeakRetained((id *)&self->_scene);
        v10 = -[_UIKeyboardLayerHostView initWithKeyboardProxyLayer:owningScene:](v11, "initWithKeyboardProxyLayer:owningScene:", v4, v9);
      }
      v7 = (_UIContextLayerHostView *)v10;

    }
LABEL_13:
    -[_UISceneLayerHostView setCurrentPresentationContext:](v7, "setCurrentPresentationContext:", self->_presentationContext);
    goto LABEL_14;
  }
  v7 = 0;
LABEL_14:

  return v7;
}

- (void)_presentationContextChangedFrom:(id)a3 toContext:(id)a4 force:(BOOL)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  int v19;
  unsigned __int8 v20;
  void *v21;
  void *v22;
  int v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  id v30;

  v30 = a3;
  v8 = a4;
  v9 = objc_msgSend(v30, "presentedLayerTypes");
  v10 = objc_msgSend(v8, "presentedLayerTypes");
  objc_msgSend(v30, "_exclusiveLayerTargetsToInclude");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_exclusiveLayerTargetsToInclude");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = BSEqualSets();

  objc_msgSend(v30, "_layerTargetsToExclude");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_layerTargetsToExclude");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = BSEqualSets();

  objc_msgSend(v30, "layerPresentationOverrides");
  v17 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layerPresentationOverrides");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = BSEqualDictionaries();

  LOBYTE(v17) = objc_msgSend(v30, "renderingMode") != 1;
  v20 = v17 ^ (objc_msgSend(v8, "renderingMode") == 1);
  if ((v20 & 1) != 0)
  {
    v21 = 0;
  }
  else
  {
    +[UIScene _synchronizeDrawingAndReturnFence](UIWindowScene, "_synchronizeDrawingAndReturnFence");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22 = v30;
  if (a5)
  {
    -[_UISceneLayerHostContainerView _rebuildLayersForReason:withFence:](self, "_rebuildLayersForReason:withFence:", CFSTR("forced"), v21);
    -[_UISceneLayerHostContainerView _toggleClippingDisabledWithNewContext:](self, "_toggleClippingDisabledWithNewContext:", v8);
    -[_UISceneLayerHostContainerView _toggleInheritsSecurityWithNewContext:](self, "_toggleInheritsSecurityWithNewContext:", v8);
    -[_UISceneLayerHostContainerView _toggleResizesHostedContextWithNewContext:](self, "_toggleResizesHostedContextWithNewContext:", v8);
    -[_UISceneLayerHostContainerView _toggleStopsHitTestTransformAccumulationWithNewContext:](self, "_toggleStopsHitTestTransformAccumulationWithNewContext:", v8);
    -[_UISceneLayerHostContainerView _toggleStopsHitTestTransformAccumulationWithNewContext:](self, "_toggleStopsHitTestTransformAccumulationWithNewContext:", v8);
  }
  else
  {
    if (v9 == v10)
      v23 = v19;
    else
      v23 = 0;
    if (v9 == v10)
      v24 = CFSTR("layer presentation overrides changed");
    else
      v24 = CFSTR("presented layer types changed");
    if (v23 != 1
      || ((v13 & v16) == 0
        ? (v24 = CFSTR("included or excluded windows changed"))
        : (v24 = CFSTR("async render grouping changed")),
          ((v13 & v16) & v20 & 1) == 0))
    {
      -[_UISceneLayerHostContainerView _rebuildLayersForReason:withFence:](self, "_rebuildLayersForReason:withFence:", v24, v21);
      v22 = v30;
    }
    objc_msgSend(v22, "isClippingDisabled", v24);
    objc_msgSend(v8, "isClippingDisabled");
    if ((BSEqualBools() & 1) == 0)
      -[_UISceneLayerHostContainerView _toggleClippingDisabledWithNewContext:](self, "_toggleClippingDisabledWithNewContext:", v8);
    objc_msgSend(v30, "inheritsSecurity");
    objc_msgSend(v8, "inheritsSecurity");
    if ((BSEqualBools() & 1) == 0)
      -[_UISceneLayerHostContainerView _toggleInheritsSecurityWithNewContext:](self, "_toggleInheritsSecurityWithNewContext:", v8);
    objc_msgSend(v30, "resizesHostedContext");
    objc_msgSend(v8, "resizesHostedContext");
    if ((BSEqualBools() & 1) == 0)
      -[_UISceneLayerHostContainerView _toggleResizesHostedContextWithNewContext:](self, "_toggleResizesHostedContextWithNewContext:", v8);
    objc_msgSend(v30, "stopsHitTestTransformAccumulation");
    objc_msgSend(v8, "stopsHitTestTransformAccumulation");
    if ((BSEqualBools() & 1) == 0)
      -[_UISceneLayerHostContainerView _toggleStopsHitTestTransformAccumulationWithNewContext:](self, "_toggleStopsHitTestTransformAccumulationWithNewContext:", v8);
    objc_msgSend(v30, "stopsSecureSuperlayersValidation");
    objc_msgSend(v8, "stopsSecureSuperlayersValidation");
    if ((BSEqualBools() & 1) == 0)
      -[_UISceneLayerHostContainerView _toggleStopsHitTestTransformAccumulationWithNewContext:](self, "_toggleStopsHitTestTransformAccumulationWithNewContext:", v8);
    objc_msgSend(v30, "_minificationFilterName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_minificationFilterName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25 == v26)
    {
      objc_msgSend(v30, "asynchronousRenderingOptions");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "asynchronousRenderingOptions");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = BSEqualObjects();

      if ((v29 & 1) != 0)
        goto LABEL_33;
    }
    else
    {

    }
  }
  if (!self->_asyncRenderGroupingContext)
  {
    -[_UISceneLayerHostContainerView _updateRenderingModeForLayersInNormalPresentation](self, "_updateRenderingModeForLayersInNormalPresentation");
    if (!v21)
      goto LABEL_35;
    goto LABEL_34;
  }
  -[_UISceneLayerHostContainerView _updateAsyncDrawingOptionsInAsyncPresentation](self, "_updateAsyncDrawingOptionsInAsyncPresentation");
LABEL_33:
  if (v21)
LABEL_34:
    objc_msgSend(v21, "invalidate");
LABEL_35:

}

- (void)_rebuildLayersForReason:(id)a3 withFence:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  void *v14;
  int v15;
  _UISceneLayerHostContainerView *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  UIScenePresentationLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UISceneLayerHostContainerView scene](self, "scene");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 134219010;
    v16 = self;
    v17 = 2114;
    v18 = v10;
    v19 = 2114;
    v20 = v12;
    v21 = 2114;
    v22 = v14;
    v23 = 2114;
    v24 = v6;
    _os_log_debug_impl(&dword_185066000, v8, OS_LOG_TYPE_DEBUG, "%p-%{public}@-%{public}@:%{public}@ - rebuilding layers for reason: %{public}@", (uint8_t *)&v15, 0x34u);

  }
  if (-[UIScenePresentationContext renderingMode](self->_presentationContext, "renderingMode") == 1)
    -[_UISceneLayerHostContainerView _rebuildLayersForAsyncPresentationWithReason:withFence:](self, "_rebuildLayersForAsyncPresentationWithReason:withFence:", v6, v7);
  else
    -[_UISceneLayerHostContainerView _rebuildLayersForNormalPresentationWithReason:withFence:](self, "_rebuildLayersForNormalPresentationWithReason:withFence:", v6, v7);

}

- (void)_rebuildLayersForNormalPresentationWithReason:(id)a3 withFence:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  CAContext *asyncRenderGroupingContext;
  void *v12;
  NSObject *v13;
  BOOL v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  _UISceneLayerHostContainerView *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  void *v26;
  id WeakRetained;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _UISceneLayerHostContainerView *v37;
  SEL v38;
  BOOL v39;
  uint8_t v40[128];
  uint8_t buf[4];
  _UISceneLayerHostContainerView *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  id v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (-[UIScenePresentationContext renderingMode](self->_presentationContext, "renderingMode"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISceneLayerHostContainerView.m"), 732, CFSTR("Rendering mode must be normal here"));

  }
  v9 = (void *)-[NSMutableOrderedSet mutableCopy](self->_hostedLayers, "mutableCopy");
  v10 = (void *)-[NSMutableOrderedSet mutableCopy](self->_hostViews, "mutableCopy");
  -[NSMutableOrderedSet removeAllObjects](self->_hostedLayers, "removeAllObjects");
  -[NSMutableOrderedSet removeAllObjects](self->_hostViews, "removeAllObjects");
  if (v8)
  {
    asyncRenderGroupingContext = self->_asyncRenderGroupingContext;
    if (asyncRenderGroupingContext)
      -[CAContext addFence:](asyncRenderGroupingContext, "addFence:", v8);
  }
  -[_UISceneLayerHostContainerView _invalidateAndRemoveAsyncViewsFromHierarchy](self, "_invalidateAndRemoveAsyncViewsFromHierarchy");
  -[_UISceneLayerHostContainerView _filteredLayersToPresent](self, "_filteredLayersToPresent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  UIScenePresentationLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UISceneLayerHostContainerView scene](self, "scene");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "identifier");
    *(_DWORD *)buf = 134219266;
    v42 = self;
    v43 = 2114;
    v44 = v29;
    v45 = 2114;
    v46 = v26;
    v47 = 2114;
    v48 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v48;
    v49 = 2114;
    v50 = v7;
    v51 = 2114;
    v52 = v12;
    _os_log_debug_impl(&dword_185066000, v13, OS_LOG_TYPE_DEBUG, "%p-%{public}@-%{public}@:%{public}@ - reason: %{public}@, new layers: %{public}@", buf, 0x3Eu);

  }
  v14 = -[UIScenePresentationContext isClippingDisabled](self->_presentationContext, "isClippingDisabled");
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __90___UISceneLayerHostContainerView__rebuildLayersForNormalPresentationWithReason_withFence___block_invoke;
  v34[3] = &unk_1E16C7BC8;
  v15 = v9;
  v35 = v15;
  v16 = v10;
  v37 = self;
  v38 = a2;
  v36 = v16;
  v39 = v14;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v34);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v17 = v16;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v31 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "removeFromSuperview", v26);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    }
    while (v19);
  }

  -[UIView superview](self->_backgroundView, "superview");
  v22 = (_UISceneLayerHostContainerView *)objc_claimAutoreleasedReturnValue();

  if (v22 != self)
    -[_UISceneLayerHostContainerView _applyBackgroundViewToHierarchy](self, "_applyBackgroundViewToHierarchy");
  -[_UISceneLayerHostContainerView _updateRenderingModeForLayersInNormalPresentation](self, "_updateRenderingModeForLayersInNormalPresentation", v26);

}

- (void)_applyBackgroundViewToHierarchy
{
  _UISceneLayerHostContainerView *v3;

  if (self->_asyncRenderGroupingContainerView)
  {
    -[UIView superview](self->_backgroundView, "superview");
    v3 = (_UISceneLayerHostContainerView *)objc_claimAutoreleasedReturnValue();

    if (v3 == self)
      -[UIView removeFromSuperview](self->_backgroundView, "removeFromSuperview");
    -[_UISceneLayerHostContainerView _setBackgroundView:](self->_asyncRenderGroupingContainerView, "_setBackgroundView:", self->_backgroundView);
  }
  else
  {
    objc_msgSend(0, "_setBackgroundView:", 0);
    -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_backgroundView, 0);
  }
}

- (void)_invalidateAndRemoveAsyncViewsFromHierarchy
{
  CAContext *asyncRenderGroupingContext;
  CAContext *v5;
  _UIContextLayerHostView *asyncRenderGroupingHostView;
  _UISceneLayerHostContainerView *asyncRenderGroupingContainerView;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];
  CAContext *v11;

  asyncRenderGroupingContext = self->_asyncRenderGroupingContext;
  if (asyncRenderGroupingContext)
  {
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x3032000000;
    v10[3] = __Block_byref_object_copy__95;
    v10[4] = __Block_byref_object_dispose__95;
    v11 = asyncRenderGroupingContext;
    objc_msgSend(MEMORY[0x1E0CD28B0], "activate");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __77___UISceneLayerHostContainerView__invalidateAndRemoveAsyncViewsFromHierarchy__block_invoke;
    v9[3] = &unk_1E16B14C0;
    v9[4] = v10;
    if ((objc_msgSend(MEMORY[0x1E0CD28B0], "addCommitHandler:forPhase:", v9, 5) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISceneLayerHostContainerView.m"), 812, CFSTR("failed to register commit handler for phase = kCATransactionPhasePostSynchronize (current is %i)"), objc_msgSend(MEMORY[0x1E0CD28B0], "currentPhase"));

    }
    -[CAContext setLayer:](self->_asyncRenderGroupingContext, "setLayer:", 0);
    v5 = self->_asyncRenderGroupingContext;
    self->_asyncRenderGroupingContext = 0;

    -[UIView removeFromSuperview](self->_asyncRenderGroupingHostView, "removeFromSuperview");
    asyncRenderGroupingHostView = self->_asyncRenderGroupingHostView;
    self->_asyncRenderGroupingHostView = 0;

    -[UIView removeFromSuperview](self->_asyncRenderGroupingContainerView, "removeFromSuperview");
    -[_UISceneLayerHostContainerView invalidate](self->_asyncRenderGroupingContainerView, "invalidate");
    asyncRenderGroupingContainerView = self->_asyncRenderGroupingContainerView;
    self->_asyncRenderGroupingContainerView = 0;

    _Block_object_dispose(v10, 8);
  }
}

- (id)_filteredLayersToPresent
{
  FBScene **p_scene;
  id WeakRetained;
  int v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t m;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  char *v44;
  id v45;
  id obj;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[4];
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  p_scene = &self->_scene;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  v6 = objc_msgSend(WeakRetained, "isValid");

  if (!v6)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_loadWeakRetained((id *)p_scene);
  objc_msgSend(v8, "layerManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIScenePresentationContext _exclusiveLayerTargetsToInclude](self->_presentationContext, "_exclusiveLayerTargetsToInclude");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v10;
  obj = v11;
  if (v11)
  {
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v43 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
    if (v43)
    {
      v41 = *(_QWORD *)v66;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v66 != v41)
            objc_enumerationMutation(obj);
          v44 = v12;
          v13 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)v12);
          v61 = 0u;
          v62 = 0u;
          v63 = 0u;
          v64 = 0u;
          v14 = v10;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v62;
            do
            {
              for (i = 0; i != v16; ++i)
              {
                if (*(_QWORD *)v62 != v17)
                  objc_enumerationMutation(v14);
                v19 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i);
                if (objc_msgSend(v13, "matchesLayer:", v19))
                {
                  if (objc_msgSend(v7, "containsObject:", v19))
                  {
                    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISceneLayerHostContainerView.m"), 627, CFSTR("Cannot have multiple targets matching the same layer: %@: targets=%@"), v19, obj);

                  }
                  else
                  {
                    objc_msgSend(v7, "addObject:", v19);
                  }
                }
              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
            }
            while (v16);
          }

          v12 = v44 + 1;
          v10 = v42;
        }
        while (v44 + 1 != (char *)v43);
        v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
      }
      while (v43);
    }
    objc_msgSend(v7, "sortUsingComparator:", &__block_literal_global_233);
  }
  else
  {
    objc_msgSend(v7, "unionOrderedSet:", v10);
  }
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v22 = (void *)objc_msgSend(v7, "copy");
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v57, v71, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v58;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v58 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * j);
        -[UIScenePresentationContext presentedLayerTypes](self->_presentationContext, "presentedLayerTypes");
        objc_msgSend(v27, "type");
        if ((FBSceneLayerTypeMaskContainsType() & 1) == 0)
          objc_msgSend(v7, "removeObject:", v27);
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v57, v71, 16);
    }
    while (v24);
  }

  -[UIScenePresentationContext layerPresentationOverrides](self->_presentationContext, "layerPresentationOverrides");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __58___UISceneLayerHostContainerView__filteredLayersToPresent__block_invoke_2;
  v55[3] = &unk_1E16C7BA0;
  v29 = v7;
  v56 = v29;
  objc_msgSend(v28, "enumerateKeysAndObjectsUsingBlock:", v55);

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  -[UIScenePresentationContext _layerTargetsToExclude](self->_presentationContext, "_layerTargetsToExclude");
  v45 = (id)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v51, v70, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v52;
    do
    {
      for (k = 0; k != v31; ++k)
      {
        if (*(_QWORD *)v52 != v32)
          objc_enumerationMutation(v45);
        v34 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * k);
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v35 = (void *)objc_msgSend(v29, "copy");
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v47, v69, 16);
        if (v36)
        {
          v37 = v36;
          v38 = *(_QWORD *)v48;
          while (2)
          {
            for (m = 0; m != v37; ++m)
            {
              if (*(_QWORD *)v48 != v38)
                objc_enumerationMutation(v35);
              v40 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * m);
              if (objc_msgSend(v34, "matchesLayer:", v40))
              {
                objc_msgSend(v29, "removeObject:", v40);
                goto LABEL_48;
              }
            }
            v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v47, v69, 16);
            if (v37)
              continue;
            break;
          }
        }
LABEL_48:

      }
      v31 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v51, v70, 16);
    }
    while (v31);
  }

  return v29;
}

- (void)_toggleStopsHitTestTransformAccumulationWithNewContext:(id)a3
{
  id v4;
  NSMutableOrderedSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_hostViews;
  v6 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setStopsHitTestTransformAccumulation:", objc_msgSend(v4, "stopsHitTestTransformAccumulation", (_QWORD)v10));
      }
      while (v7 != v9);
      v7 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_updateAsyncDrawingOptionsInAsyncPresentation
{
  _UIContextLayerHostView *asyncRenderGroupingHostView;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (-[UIScenePresentationContext renderingMode](self->_presentationContext, "renderingMode") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISceneLayerHostContainerView.m"), 825, CFSTR("Rendering mode must be async"));

  }
  -[_UIContextLayerHostView setRenderingMode:](self->_asyncRenderGroupingHostView, "setRenderingMode:", 1);
  asyncRenderGroupingHostView = self->_asyncRenderGroupingHostView;
  -[UIScenePresentationContext asynchronousRenderingOptions](self->_presentationContext, "asynchronousRenderingOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextLayerHostView setAsynchronousRenderingOptions:](asyncRenderGroupingHostView, "setAsynchronousRenderingOptions:", v5);

  -[_UIContextLayerHostView layer](self->_asyncRenderGroupingHostView, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSSceneSettings displayConfiguration](self->_effectiveSceneSettings, "displayConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  objc_msgSend(v6, "setRasterizationScale:");

  -[_UIContextLayerHostView layer](self->_asyncRenderGroupingHostView, "layer");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[UIScenePresentationContext _minificationFilterName](self->_presentationContext, "_minificationFilterName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMinificationFilter:", v8);

}

- (void)pushDataSource:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISceneLayerHostContainerView.m"), 161, CFSTR("Unable to push a data source on an invalidated host container"));

    v5 = v7;
  }
  -[_UISceneLayerHostContainerView _setDataSource:](self, "_setDataSource:", v5);

}

- (void)_setDataSource:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    -[_UISceneLayerHostContainerView _refreshDataSource](self, "_refreshDataSource");
    v5 = obj;
  }

}

- (void)invalidate
{
  NSObject *v3;
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  NSString *debugDescription;
  int v11;
  _UISceneLayerHostContainerView *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  NSString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!self->_invalidated)
  {
    UIScenePresentationLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
      objc_msgSend(WeakRetained, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      debugDescription = self->_debugDescription;
      v11 = 134218754;
      v12 = self;
      v13 = 2114;
      v14 = v7;
      v15 = 2114;
      v16 = v9;
      v17 = 2114;
      v18 = debugDescription;
      _os_log_debug_impl(&dword_185066000, v3, OS_LOG_TYPE_DEBUG, "%p-%{public}@-%{public}@:%{public}@ - invalidate", (uint8_t *)&v11, 0x2Au);

    }
    self->_invalidated = 1;
    -[UIView removeFromSuperview](self, "removeFromSuperview");
    v4 = objc_loadWeakRetained((id *)&self->_scene);
    objc_msgSend(v4, "layerManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:", self);

    objc_storeWeak((id *)&self->_dataSource, 0);
    -[NSMutableSet removeAllObjects](self->_hiddenLayers, "removeAllObjects");
    -[NSMutableOrderedSet removeAllObjects](self->_hostedLayers, "removeAllObjects");
    -[NSMutableOrderedSet removeAllObjects](self->_hostViews, "removeAllObjects");
    -[_UISceneLayerHostContainerView _invalidateAndRemoveAsyncViewsFromHierarchy](self, "_invalidateAndRemoveAsyncViewsFromHierarchy");
  }
}

- (BOOL)_canShowKeyboardLayer
{
  return +[_UISceneKeyboardProxyLayerForwardingManager isRootSystemShellProcess](_UISceneKeyboardProxyLayerForwardingManager, "isRootSystemShellProcess");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugDescription, 0);
  objc_storeStrong((id *)&self->_asyncRenderGroupingHostView, 0);
  objc_storeStrong((id *)&self->_asyncRenderGroupingContainerView, 0);
  objc_storeStrong((id *)&self->_asyncRenderGroupingContext, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_innerLayerContainer, 0);
  objc_storeStrong((id *)&self->_presentationContext, 0);
  objc_storeStrong((id *)&self->_effectiveSceneSettings, 0);
  objc_storeStrong((id *)&self->_hiddenLayers, 0);
  objc_storeStrong((id *)&self->_hostedLayers, 0);
  objc_storeStrong((id *)&self->_hostViews, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_scene);
}

- (void)popDataSource:(id)a3
{
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISceneLayerHostContainerView.m"), 167, CFSTR("Unable to pop a data source on an invalidated host container"));

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  v6 = v8;
  if (WeakRetained == v8)
  {
    -[_UISceneLayerHostContainerView _setDataSource:](self, "_setDataSource:", 0);
    v6 = v8;
  }

}

- (void)dealloc
{
  NSObject *v3;
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  NSString *debugDescription;
  void *v12;
  objc_super v13;
  uint8_t buf[4];
  _UISceneLayerHostContainerView *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  NSString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISceneLayerHostContainerView.m"), 110, CFSTR("Must be invalidated before deallocating"));

  }
  UIScenePresentationLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
    objc_msgSend(WeakRetained, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    debugDescription = self->_debugDescription;
    *(_DWORD *)buf = 134218754;
    v15 = self;
    v16 = 2114;
    v17 = v7;
    v18 = 2114;
    v19 = v9;
    v20 = 2114;
    v21 = debugDescription;
    _os_log_debug_impl(&dword_185066000, v3, OS_LOG_TYPE_DEBUG, "%p-%{public}@-%{public}@:%{public}@ - dealloc", buf, 0x2Au);

  }
  v4 = objc_loadWeakRetained((id *)&self->_scene);
  objc_msgSend(v4, "layerManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  v13.receiver = self;
  v13.super_class = (Class)_UISceneLayerHostContainerView;
  -[UIView dealloc](&v13, sel_dealloc);
}

- (_UISceneLayerHostContainerView)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISceneLayerHostContainerView.m"), 74, CFSTR("-[init] is unavailable for this object."));

  return 0;
}

- (_UISceneLayerHostContainerView)initWithFrame:(CGRect)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISceneLayerHostContainerView.m"), 79, CFSTR("-[init] is unavailable for this object."));

  return -[_UISceneLayerHostContainerView initWithScene:debugDescription:](self, "initWithScene:debugDescription:", &stru_1E16EDF20, CFSTR("invalid"));
}

- (_UISceneLayerHostContainerView)initWithCoder:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISceneLayerHostContainerView.m"), 84, CFSTR("-[init] is unavailable for this object."));

  return -[_UISceneLayerHostContainerView initWithScene:debugDescription:](self, "initWithScene:debugDescription:", &stru_1E16EDF20, CFSTR("invalid"));
}

- (NSSet)hostedLayers
{
  if (self->_asyncRenderGroupingContainerView)
    -[_UISceneLayerHostContainerView hostedLayers](self->_asyncRenderGroupingContainerView, "hostedLayers");
  else
    -[NSMutableOrderedSet set](self->_hostedLayers, "set");
  return (NSSet *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSSet)nonHostedLayers
{
  _UISceneLayerHostContainerView *asyncRenderGroupingContainerView;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  asyncRenderGroupingContainerView = self->_asyncRenderGroupingContainerView;
  if (asyncRenderGroupingContainerView)
  {
    -[_UISceneLayerHostContainerView nonHostedLayers](asyncRenderGroupingContainerView, "nonHostedLayers");
    return (NSSet *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
    objc_msgSend(WeakRetained, "layerManager", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          if ((-[NSMutableOrderedSet containsObject:](self->_hostedLayers, "containsObject:", v13) & 1) == 0)
            objc_msgSend(v5, "addObject:", v13);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

    return (NSSet *)v5;
  }
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  return 0;
}

- (id)_hitTest:(CGPoint)a3 withEvent:(id)a4 windowServerHitTestWindow:(id)a5
{
  double y;
  double x;
  id v9;
  id v10;
  id v11;
  _UISceneLayerHostContainerView *v12;
  _UISceneLayerHostContainerView *v13;
  BOOL v14;
  objc_super v16;

  y = a3.y;
  x = a3.x;
  v9 = a4;
  v10 = a5;
  -[_UISceneLayerHostContainerView window](self, "window");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v10)
  {
    v16.receiver = self;
    v16.super_class = (Class)_UISceneLayerHostContainerView;
    -[UIView _hitTest:withEvent:windowServerHitTestWindow:](&v16, sel__hitTest_withEvent_windowServerHitTestWindow_, v9, v10, x, y);
    v13 = (_UISceneLayerHostContainerView *)objc_claimAutoreleasedReturnValue();
    if (-[UIScenePresentationContext shouldPassthroughHitTestEventsIfTransparent](self->_presentationContext, "shouldPassthroughHitTestEventsIfTransparent"))
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

- (int64_t)_focusedSound
{
  return 0;
}

- (NSString)debugDescription
{
  return (NSString *)-[_UISceneLayerHostContainerView descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_UISceneLayerHostContainerView succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id WeakRetained;
  void *v5;
  id v6;
  id v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  objc_msgSend(WeakRetained, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v5, CFSTR("sceneID"), 1);

  v7 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_debugDescription, CFSTR("debugDescription"), 1);
  -[UIView frame](self, "frame");
  v8 = (id)objc_msgSend(v3, "appendRect:withName:", CFSTR("frame"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UISceneLayerHostContainerView descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  id v7;
  _QWORD v9[4];
  id v10;
  _UISceneLayerHostContainerView *v11;

  v4 = a3;
  -[_UISceneLayerHostContainerView succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72___UISceneLayerHostContainerView_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E16B1B50;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

- (id)_realHostedLayers
{
  return (id)-[NSMutableOrderedSet set](self->_hostedLayers, "set");
}

- (id)_hostViews
{
  return (id)-[NSMutableOrderedSet set](self->_hostViews, "set");
}

- (id)_backgroundView
{
  return self->_backgroundView;
}

- (id)_presentationContext
{
  return self->_presentationContext;
}

- (id)_asyncContext
{
  return self->_asyncRenderGroupingContext;
}

- (id)_asyncRenderingContainerView
{
  return self->_asyncRenderGroupingContainerView;
}

- (id)_asyncRenderingHostView
{
  return self->_asyncRenderGroupingHostView;
}

- (void)_toggleClippingDisabledWithNewContext:(id)a3
{
  id v4;
  NSMutableOrderedSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_hostViews;
  v6 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "sceneLayer", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UISceneLayerHostContainerView _presentationContextForLayer:](self, "_presentationContextForLayer:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v12, "isClippingDisabled") & 1) != 0)
          v13 = 1;
        else
          v13 = objc_msgSend(v4, "isClippingDisabled");
        objc_msgSend(v10, "setClipsToBounds:", v13 ^ 1u);

      }
      v7 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (void)_toggleInheritsSecurityWithNewContext:(id)a3
{
  id v4;
  NSMutableOrderedSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_hostViews;
  v6 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setInheritsSecurity:", objc_msgSend(v4, "inheritsSecurity", (_QWORD)v10));
      }
      while (v7 != v9);
      v7 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_toggleResizesHostedContextWithNewContext:(id)a3
{
  id v4;
  NSMutableOrderedSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_hostViews;
  v6 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setResizesHostedContext:", objc_msgSend(v4, "resizesHostedContext", (_QWORD)v10));
      }
      while (v7 != v9);
      v7 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_toggleStopsSecureSuperlayersValidationWithNewContext:(id)a3
{
  id v4;
  NSMutableOrderedSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_hostViews;
  v6 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setStopsSecureSuperlayersValidation:", objc_msgSend(v4, "stopsSecureSuperlayersValidation", (_QWORD)v10));
      }
      while (v7 != v9);
      v7 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (_UISceneLayerHostContainerViewDataSource)dataSource
{
  return (_UISceneLayerHostContainerViewDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (FBScene)scene
{
  return (FBScene *)objc_loadWeakRetained((id *)&self->_scene);
}

@end
