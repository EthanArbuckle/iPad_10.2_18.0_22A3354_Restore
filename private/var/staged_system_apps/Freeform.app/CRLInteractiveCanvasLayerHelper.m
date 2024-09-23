@implementation CRLInteractiveCanvasLayerHelper

- (CRLInteractiveCanvasLayerHelper)initWithInteractiveCanvasController:(id)a3
{
  id v4;
  CRLInteractiveCanvasLayerHelper *v5;
  CRLInteractiveCanvasLayerHelper *v6;
  CRLCanvasSubview *v7;
  CRLCanvasSubview *repContainerView;
  id WeakRetained;
  uint64_t v10;
  CALayer *repContainerLayer;
  CRLInteractiveCanvasRepContentUpdater *v12;
  id v13;
  void *v14;
  id v15;
  CRLInteractiveCanvasRepContentUpdater *v16;
  CRLInteractiveCanvasRepContentUpdater *repContentUpdater;
  CRLInteractiveCanvasRepContentSubviewUpdater *v18;
  CRLInteractiveCanvasRepContentSubviewUpdater *repContentSubviewUpdater;
  NSMapTable *v20;
  NSMapTable *repOverlayRenderablesByRep;
  NSMapTable *v22;
  NSMapTable *decoratorOverlayRenderablesByDecorator;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CRLInteractiveCanvasLayerHelper;
  v5 = -[CRLInteractiveCanvasLayerHelper init](&v25, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_interactiveCanvasController, v4);
    v7 = objc_alloc_init(CRLCanvasSubview);
    repContainerView = v6->_repContainerView;
    v6->_repContainerView = v7;

    WeakRetained = objc_loadWeakRetained((id *)&v6->_interactiveCanvasController);
    -[CRLCanvasSubview setLayerDelegate:](v6->_repContainerView, "setLayerDelegate:", WeakRetained);

    v10 = objc_claimAutoreleasedReturnValue(-[CRLCanvasSubview layer](v6->_repContainerView, "layer"));
    repContainerLayer = v6->_repContainerLayer;
    v6->_repContainerLayer = (CALayer *)v10;

    v12 = [CRLInteractiveCanvasRepContentUpdater alloc];
    v13 = objc_loadWeakRetained((id *)&v6->_interactiveCanvasController);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "canvas"));
    v15 = objc_loadWeakRetained((id *)&v6->_interactiveCanvasController);
    v16 = -[CRLInteractiveCanvasRepContentUpdater initWithCanvas:layerDelegate:](v12, "initWithCanvas:layerDelegate:", v14, v15);
    repContentUpdater = v6->_repContentUpdater;
    v6->_repContentUpdater = v16;

    v18 = -[CRLInteractiveCanvasRepContentSubviewUpdater initWithRepContainerView:]([CRLInteractiveCanvasRepContentSubviewUpdater alloc], "initWithRepContainerView:", v6->_repContainerView);
    repContentSubviewUpdater = v6->_repContentSubviewUpdater;
    v6->_repContentSubviewUpdater = v18;

    v20 = (NSMapTable *)objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 0);
    repOverlayRenderablesByRep = v6->_repOverlayRenderablesByRep;
    v6->_repOverlayRenderablesByRep = v20;

    v22 = (NSMapTable *)objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 0);
    decoratorOverlayRenderablesByDecorator = v6->_decoratorOverlayRenderablesByDecorator;
    v6->_decoratorOverlayRenderablesByDecorator = v22;

  }
  return v6;
}

- (void)teardown
{
  NSMapTable *repOverlayRenderablesByRep;
  NSMapTable *decoratorOverlayRenderablesByDecorator;
  void *v5;
  void *v6;
  void *v7;

  repOverlayRenderablesByRep = self->_repOverlayRenderablesByRep;
  self->_repOverlayRenderablesByRep = 0;

  decoratorOverlayRenderablesByDecorator = self->_decoratorOverlayRenderablesByDecorator;
  self->_decoratorOverlayRenderablesByDecorator = 0;

  -[CRLInteractiveCanvasRepContentUpdater teardown](self->_repContentUpdater, "teardown");
  if (self->_wasTornDown)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125A4F8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2EC14();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125A518);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasLayerHelper teardown]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasLayerHelper.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 97, 0, "Shouldn't be torn down twice!");

  }
  self->_wasTornDown = 1;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  if (!self->_wasTornDown)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125A538);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2EC94();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125A558);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasLayerHelper dealloc]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasLayerHelper.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 102, 0, "Must be torn down!");

  }
  v6.receiver = self;
  v6.super_class = (Class)CRLInteractiveCanvasLayerHelper;
  -[CRLInteractiveCanvasLayerHelper dealloc](&v6, "dealloc");
}

- (BOOL)p_shouldPerformLayerTreeComparison
{
  return 0;
}

- (void)updateLayers
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;

  -[CRLInteractiveCanvasLayerHelper p_updateLayersForcingUpdateOfValidLayers:](self, "p_updateLayersForcingUpdateOfValidLayers:", 0);
  if (-[CRLInteractiveCanvasLayerHelper p_shouldPerformLayerTreeComparison](self, "p_shouldPerformLayerTreeComparison"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "canvasView"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "canvasLayer"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasRepContentUpdater i_descriptionOfLayerTreeRootedAt:](self->_repContentUpdater, "i_descriptionOfLayerTreeRootedAt:", v5));
    -[CRLInteractiveCanvasLayerHelper p_updateLayersForcingUpdateOfValidLayers:](self, "p_updateLayersForcingUpdateOfValidLayers:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasRepContentUpdater i_descriptionOfLayerTreeRootedAt:](self->_repContentUpdater, "i_descriptionOfLayerTreeRootedAt:", v5));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasRepContentUpdater i_firstDifferenceBetweenLayerTreeDescription:andDescription:](self->_repContentUpdater, "i_firstDifferenceBetweenLayerTreeDescription:andDescription:", v6, v7));
    if (objc_msgSend(v8, "count"))
    {
      v9 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125A578);
      v10 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E2ED14((uint64_t)v8, v9, v10);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125A598);
      v11 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasLayerHelper updateLayers]"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasLayerHelper.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 146, 0, "Canvas layer tree mismatch detected! The fully and incrementally updated layer trees do not match.\n%@", v8);

    }
  }
}

- (void)p_updateLayersForcingUpdateOfValidLayers:(BOOL)a3
{
  _BOOL8 v3;
  unsigned int v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  unsigned int v20;
  CRLCanvasSubview *v21;
  CRLCanvasSubview *bottommostLayersContainerView;
  id v23;
  CALayer *v24;
  CALayer *bottommostLayersContainerLayer;
  _BOOL8 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unsigned __int8 v31;
  unsigned int v32;
  CRLInteractiveCanvasRepContentUpdater *repContentUpdater;
  uint64_t v34;
  void *v35;
  id v36;
  unsigned __int8 v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  void *i;
  CRLCanvasSubview *v43;
  void *v44;
  void *v45;
  unsigned __int8 v46;
  id v47;
  void *v48;
  unsigned int v49;
  id *v50;
  id v51;
  id v52;
  id v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  void *j;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];

  v3 = a3;
  v5 = +[NSThread isMainThread](NSThread, "isMainThread");
  WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "canvasView"));

  v64 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "canvasLayer"));
  v9 = objc_alloc_init((Class)NSMutableOrderedSet);
  v63 = v8;
  objc_msgSend(v8, "bounds");
  v14 = v10;
  v15 = v11;
  v16 = v12;
  v17 = v13;
  if (v5)
  {
    -[CRLCanvasSubview setFrame:](self->_repContainerView, "setFrame:", v10, v11, v12, v13);
    -[CRLCanvasSubview setBounds:](self->_repContainerView, "setBounds:", v14, v15, v16, v17);
  }
  v18 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "additionalLayersUnderRepLayers"));

  if (objc_msgSend(v19, "count"))
  {
    if (self->_bottommostLayersContainerView)
      v20 = 0;
    else
      v20 = v5;
    if (v20 == 1)
    {
      v21 = objc_alloc_init(CRLCanvasSubview);
      bottommostLayersContainerView = self->_bottommostLayersContainerView;
      self->_bottommostLayersContainerView = v21;

      v23 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
      -[CRLCanvasSubview setLayerDelegate:](self->_bottommostLayersContainerView, "setLayerDelegate:", v23);

      v24 = (CALayer *)objc_claimAutoreleasedReturnValue(-[CRLCanvasSubview layer](self->_bottommostLayersContainerView, "layer"));
      bottommostLayersContainerLayer = self->_bottommostLayersContainerLayer;
      self->_bottommostLayersContainerLayer = v24;

    }
    if (!self->_bottommostLayersContainerLayer)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      v26 = v3;
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125A5B8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E2EDC4();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125A5D8);
      v27 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasLayerHelper p_updateLayersForcingUpdateOfValidLayers:]"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasLayerHelper.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v28, v29, 185, 0, "Layout with bottommost layers should have run at least once on the main thread.");

      v3 = v26;
    }
  }
  if (self->_bottommostLayersContainerLayer)
  {
    if (v5)
    {
      -[CRLCanvasSubview setFrame:](self->_bottommostLayersContainerView, "setFrame:", v14, v15, v16, v17);
      -[CRLCanvasSubview setBounds:](self->_bottommostLayersContainerView, "setBounds:", v14, v15, v16, v17);
    }
    if (!v19)
      v19 = &__NSArray0__struct;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer sublayers](self->_bottommostLayersContainerLayer, "sublayers"));
    v31 = objc_msgSend(v19, "isEqualToArray:", v30);

    if ((v31 & 1) == 0)
      -[CALayer setSublayers:](self->_bottommostLayersContainerLayer, "setSublayers:", v19);
    if (self->_bottommostLayersContainerView)
      objc_msgSend(v9, "addObject:");
  }
  v32 = -[CRLInteractiveCanvasLayerHelper currentlySuppressingLayerUpdates](self, "currentlySuppressingLayerUpdates");
  repContentUpdater = self->_repContentUpdater;
  if (v32)
  {
    -[CRLInteractiveCanvasRepContentUpdater updateLayerFramesOnlyForReps:](repContentUpdater, "updateLayerFramesOnlyForReps:", self->_repsWhoseLayersAreAllowedToUpdate);
  }
  else
  {
    -[CRLInteractiveCanvasRepContentUpdater updateRepContentForcingUpdateOfValidLayers:](repContentUpdater, "updateRepContentForcingUpdateOfValidLayers:", v3);
    v34 = objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasRepContentUpdater repContentPiles](self->_repContentUpdater, "repContentPiles"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasRepContentUpdater allReps](self->_repContentUpdater, "allReps"));
    v62 = (void *)v34;
    -[CRLInteractiveCanvasRepContentSubviewUpdater updateSubviewsFromRepContentPiles:](self->_repContentSubviewUpdater, "updateSubviewsFromRepContentPiles:", v34);
    objc_msgSend(v9, "addObject:", self->_repContainerView);
    v36 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
    v37 = objc_msgSend(v36, "overlayLayerSuppressed");

    if ((v37 & 1) == 0)
    {
      -[CRLInteractiveCanvasLayerHelper p_updateOverlayViewForReps:forcingUpdateOfValidLayers:](self, "p_updateOverlayViewForReps:forcingUpdateOfValidLayers:", v35, v3);
      if (self->_overlayView)
        objc_msgSend(v9, "addObject:");
    }
    -[CRLInteractiveCanvasLayerHelper p_updateDecoratorOverlayContainer](self, "p_updateDecoratorOverlayContainer");
    if (self->_decoratorOverlayContainerView)
      objc_msgSend(v9, "addObject:");
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "subviews"));
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v70;
      do
      {
        for (i = 0; i != v40; i = (char *)i + 1)
        {
          if (*(_QWORD *)v70 != v41)
            objc_enumerationMutation(v38);
          v43 = *(CRLCanvasSubview **)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)i);
          if (v43 != self->_bottommostLayersContainerView
            && v43 != self->_repContainerView
            && v43 != self->_overlayView
            && v43 != self->_decoratorOverlayContainerView)
          {
            objc_msgSend(v9, "addObject:");
          }
        }
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
      }
      while (v40);
    }

    if (v5)
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "array"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "canvasSubviews"));
      v46 = objc_msgSend(v44, "isEqualToArray:", v45);

      if ((v46 & 1) == 0)
        objc_msgSend(v64, "setCanvasSubviews:", v44);

    }
  }
  v47 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "canvas"));
  v49 = objc_msgSend(v48, "canvasIsWideGamut");
  v50 = (id *)&kCAContentsFormatRGBA16Float;
  if (!v49)
    v50 = (id *)&kCAContentsFormatRGBA8Uint;
  v51 = *v50;

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v52 = v9;
  v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
  if (v53)
  {
    v55 = v53;
    v56 = *(_QWORD *)v66;
    do
    {
      for (j = 0; j != v55; j = (char *)j + 1)
      {
        if (*(_QWORD *)v66 != v56)
          objc_enumerationMutation(v52);
        v58 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)j);
        objc_opt_class(CRLCanvasSubview, v54);
        if ((objc_opt_isKindOfClass(v58, v59) & 1) != 0)
        {
          v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "layer"));
          -[CRLInteractiveCanvasLayerHelper p_recursivelyUpdateLayerEdgeAntialiasingForLayer:](self, "p_recursivelyUpdateLayerEdgeAntialiasingForLayer:", v60);

          v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "layer"));
          -[CRLInteractiveCanvasLayerHelper p_recursivelySetContentsFormatForLayer:toContentsFormat:](self, "p_recursivelySetContentsFormatForLayer:toContentsFormat:", v61, v51);

        }
      }
      v55 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
    }
    while (v55);
  }

}

- (void)p_updateDecoratorOverlayContainer
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  id v16;
  CRLCanvasSubview *decoratorOverlayContainerView;
  id *v18;
  CRLCanvasSubview *v19;
  CRLCanvasSubview *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CRLInteractiveCanvasController **p_interactiveCanvasController;
  CRLInteractiveCanvasLayerHelper *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v3 = objc_alloc_init((Class)NSMutableOrderedSet);
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    p_interactiveCanvasController = &self->_interactiveCanvasController;
    v35 = self;
    WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "i_decorators"));

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v41 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
          if ((objc_opt_respondsToSelector(v10, "decoratorOverlayViews") & 1) != 0)
          {
            v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "decoratorOverlayViews"));
            v36 = 0u;
            v37 = 0u;
            v38 = 0u;
            v39 = 0u;
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
            if (v12)
            {
              v13 = v12;
              v14 = *(_QWORD *)v37;
              do
              {
                for (j = 0; j != v13; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v37 != v14)
                    objc_enumerationMutation(v11);
                  objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)j), p_interactiveCanvasController);
                }
                v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
              }
              while (v13);
            }

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      }
      while (v7);
    }

    v16 = objc_msgSend(v3, "count");
    decoratorOverlayContainerView = v35->_decoratorOverlayContainerView;
    if (v16)
    {
      v18 = (id *)p_interactiveCanvasController;
      if (!decoratorOverlayContainerView)
      {
        v19 = objc_alloc_init(CRLCanvasSubview);
        v20 = v35->_decoratorOverlayContainerView;
        v35->_decoratorOverlayContainerView = v19;

        v21 = objc_loadWeakRetained((id *)p_interactiveCanvasController);
        -[CRLCanvasSubview setLayerDelegate:](v35->_decoratorOverlayContainerView, "setLayerDelegate:", v21);

      }
    }
    else
    {
      v18 = (id *)p_interactiveCanvasController;
      if (!decoratorOverlayContainerView)
      {
LABEL_26:

        return;
      }
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "array", p_interactiveCanvasController));
    -[CRLCanvasSubview setSubviews:](v35->_decoratorOverlayContainerView, "setSubviews:", v22);

    v23 = objc_loadWeakRetained(v18);
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "layerHost"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "canvasLayer"));
    objc_msgSend(v25, "bounds");
    v27 = v26;
    v29 = v28;
    v31 = v30;
    v33 = v32;

    -[CRLCanvasSubview frame](v35->_decoratorOverlayContainerView, "frame");
    v48.origin.x = v27;
    v48.origin.y = v29;
    v48.size.width = v31;
    v48.size.height = v33;
    if (!CGRectEqualToRect(v46, v48))
      -[CRLCanvasSubview setFrame:](v35->_decoratorOverlayContainerView, "setFrame:", v27, v29, v31, v33);
    -[CRLCanvasSubview bounds](v35->_decoratorOverlayContainerView, "bounds");
    v49.origin.x = v27;
    v49.origin.y = v29;
    v49.size.width = v31;
    v49.size.height = v33;
    if (!CGRectEqualToRect(v47, v49))
      -[CRLCanvasSubview setBounds:](v35->_decoratorOverlayContainerView, "setBounds:", v27, v29, v31, v33);
    goto LABEL_26;
  }
}

- (void)p_recursivelyUpdateLayerEdgeAntialiasingForLayer:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  objc_opt_class(CATransformLayer, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) == 0)
    objc_msgSend(v4, "setAllowsEdgeAntialiasing:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mask"));
  if (v7)
    -[CRLInteractiveCanvasLayerHelper p_recursivelyUpdateLayerEdgeAntialiasingForLayer:](self, "p_recursivelyUpdateLayerEdgeAntialiasingForLayer:", v7);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sublayers", 0));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[CRLInteractiveCanvasLayerHelper p_recursivelyUpdateLayerEdgeAntialiasingForLayer:](self, "p_recursivelyUpdateLayerEdgeAntialiasingForLayer:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v12));
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)p_recursivelySetContentsFormatForLayer:(id)a3 toContentsFormat:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v6 = a3;
  v7 = a4;
  objc_opt_class(CATransformLayer, v8);
  if ((objc_opt_isKindOfClass(v6, v9) & 1) == 0)
    objc_msgSend(v6, "setContentsFormat:", v7);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sublayers", 0));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        -[CRLInteractiveCanvasLayerHelper p_recursivelySetContentsFormatForLayer:toContentsFormat:](self, "p_recursivelySetContentsFormatForLayer:toContentsFormat:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v14), v7);
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

- (void)p_updateOverlayViewForReps:(id)a3 forcingUpdateOfValidLayers:(BOOL)a4
{
  id v5;
  id WeakRetained;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *k;
  void *v26;
  id v27;
  unsigned int v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  void *m;
  void *v35;
  unsigned int v36;
  CRLCanvasSubview *v37;
  CRLCanvasSubview *overlayView;
  id v39;
  CALayer *v40;
  CALayer *overlayLayer;
  CALayer *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  unsigned __int8 v47;
  id v48;
  unsigned int v49;
  CGColor *v50;
  id v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  unsigned int v62;
  void *v63;
  id *location;
  id v65;
  id obj;
  CRLInteractiveCanvasLayerHelper *v67;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;

  v5 = a3;
  v62 = +[NSThread isMainThread](NSThread, "isMainThread");
  location = (id *)&self->_interactiveCanvasController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "canvas"));

  v7 = objc_alloc_init((Class)NSMutableArray);
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v88, 16);
  v67 = self;
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v82;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v82 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * (_QWORD)i);
        if (a4
          || objc_msgSend(v63, "i_areOverlayLayersInvalidForRep:", *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * (_QWORD)i)))
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "overlayRenderables"));
          -[NSMapTable setObject:forKeyedSubscript:](self->_repOverlayRenderablesByRep, "setObject:forKeyedSubscript:", v13, v12);
          if (!v13)
            goto LABEL_19;
        }
        else
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKeyedSubscript:](self->_repOverlayRenderablesByRep, "objectForKeyedSubscript:", v12));
          if (!v13)
            goto LABEL_19;
        }
        v79 = 0u;
        v80 = 0u;
        v77 = 0u;
        v78 = 0u;
        v14 = v13;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v77, v87, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v78;
          do
          {
            for (j = 0; j != v16; j = (char *)j + 1)
            {
              if (*(_QWORD *)v78 != v17)
                objc_enumerationMutation(v14);
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1)
                                                                                 + 8 * (_QWORD)j), "layer"));
              objc_msgSend(v7, "addObject:", v19);

            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v77, v87, 16);
          }
          while (v16);
        }

        self = v67;
LABEL_19:

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v88, 16);
    }
    while (v9);
  }

  v20 = objc_loadWeakRetained(location);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "i_decorators"));

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v65 = v21;
  v22 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v73, v86, 16);
  if (!v22)
    goto LABEL_41;
  v23 = v22;
  v24 = *(_QWORD *)v74;
  do
  {
    for (k = 0; k != v23; k = (char *)k + 1)
    {
      if (*(_QWORD *)v74 != v24)
        objc_enumerationMutation(v65);
      v26 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)k);
      if (a4
        || (v27 = objc_loadWeakRetained(location),
            v28 = objc_msgSend(v27, "i_areLayersInvalidForDecorator:", v26),
            v27,
            v28))
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "decoratorOverlayRenderables"));
        -[NSMapTable setObject:forKeyedSubscript:](self->_decoratorOverlayRenderablesByDecorator, "setObject:forKeyedSubscript:", v29, v26);
        if (!v29)
          goto LABEL_39;
      }
      else
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKeyedSubscript:](self->_decoratorOverlayRenderablesByDecorator, "objectForKeyedSubscript:", v26));
        if (!v29)
          goto LABEL_39;
      }
      v71 = 0u;
      v72 = 0u;
      v69 = 0u;
      v70 = 0u;
      v30 = v29;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v69, v85, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v70;
        do
        {
          for (m = 0; m != v32; m = (char *)m + 1)
          {
            if (*(_QWORD *)v70 != v33)
              objc_enumerationMutation(v30);
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)m), "layer"));
            objc_msgSend(v7, "addObject:", v35);

          }
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v69, v85, 16);
        }
        while (v32);
      }

      self = v67;
LABEL_39:

    }
    v23 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v73, v86, 16);
  }
  while (v23);
LABEL_41:

  if (self->_overlayView)
    v36 = 0;
  else
    v36 = v62;
  if (v36 == 1)
  {
    v37 = objc_alloc_init(CRLCanvasSubview);
    overlayView = self->_overlayView;
    self->_overlayView = v37;

    v39 = objc_loadWeakRetained(location);
    -[CRLCanvasSubview setLayerDelegate:](self->_overlayView, "setLayerDelegate:", v39);

    v40 = (CALayer *)objc_claimAutoreleasedReturnValue(-[CRLCanvasSubview layer](self->_overlayView, "layer"));
    overlayLayer = self->_overlayLayer;
    self->_overlayLayer = v40;

  }
  v42 = self->_overlayLayer;
  if (!v42)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125A5F8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2EE44();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125A618);
    v43 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasLayerHelper p_updateOverlayViewForReps:forcingUpdateOfValidLayers:]"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasLayerHelper.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v44, v45, 419, 0, "Layout with overlay layers should have run at least once on the main thread.");

    v42 = self->_overlayLayer;
  }
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer sublayers](v42, "sublayers"));
  v47 = objc_msgSend(v46, "isEqualToArray:", v7);

  if ((v47 & 1) == 0)
    -[CALayer setSublayers:](self->_overlayLayer, "setSublayers:", v7);
  v48 = objc_loadWeakRetained(location);
  v49 = objc_msgSend(v48, "showGrayOverlay");

  if (v49)
  {
    v50 = sub_100011C1C(0.0, 0.0, 0.0, 0.219600007);
    -[CALayer setBackgroundColor:](self->_overlayLayer, "setBackgroundColor:", v50);
    CGColorRelease(v50);
    if (!v62)
      goto LABEL_66;
LABEL_62:
    v51 = objc_loadWeakRetained(location);
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "layerHost"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "canvasLayer"));
    objc_msgSend(v53, "bounds");
    v55 = v54;
    v57 = v56;
    v59 = v58;
    v61 = v60;

    -[CRLCanvasSubview frame](self->_overlayView, "frame");
    v91.origin.x = v55;
    v91.origin.y = v57;
    v91.size.width = v59;
    v91.size.height = v61;
    if (!CGRectEqualToRect(v89, v91))
      -[CRLCanvasSubview setFrame:](self->_overlayView, "setFrame:", v55, v57, v59, v61);
    -[CRLCanvasSubview bounds](self->_overlayView, "bounds");
    v92.origin.x = v55;
    v92.origin.y = v57;
    v92.size.width = v59;
    v92.size.height = v61;
    if (!CGRectEqualToRect(v90, v92))
      -[CRLCanvasSubview setBounds:](self->_overlayView, "setBounds:", v55, v57, v59, v61);
  }
  else
  {
    -[CALayer setBackgroundColor:](self->_overlayLayer, "setBackgroundColor:", 0);
    if (v62)
      goto LABEL_62;
  }
LABEL_66:

}

- (id)renderableForRep:(id)a3
{
  return -[CRLInteractiveCanvasRepContentUpdater renderableForRep:](self->_repContentUpdater, "renderableForRep:", a3);
}

- (id)repForLayer:(id)a3
{
  return -[CRLInteractiveCanvasRepContentUpdater repForLayer:](self->_repContentUpdater, "repForLayer:", a3);
}

- (id)containerRenderablesForRep:(id)a3
{
  return -[CRLInteractiveCanvasRepContentUpdater containerRenderablesForRep:](self->_repContentUpdater, "containerRenderablesForRep:", a3);
}

- (id)viewWithTransferredLayers
{
  id WeakRetained;
  void *v4;
  CRLCanvasSubview *v5;
  CRLCanvasSubview *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  id v16;
  CRLCanvasSubview *v17;
  CRLCanvasSubview *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  CRLCanvasSubview *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "canvasView"));

  v5 = [CRLCanvasSubview alloc];
  objc_msgSend(v4, "frame");
  v6 = -[CRLCanvasSubview initWithFrame:](v5, "initWithFrame:");
  v25 = v4;
  objc_msgSend(v4, "bounds");
  v24 = v6;
  -[CRLCanvasSubview setBounds:](v6, "setBounds:");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasSubview subviews](self->_repContainerView, "subviews"));
  v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v7, "count"));
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "subviews"));
        v16 = objc_msgSend(v15, "count");

        if (!v16)
        {
          v17 = [CRLCanvasSubview alloc];
          objc_msgSend(v14, "frame");
          v18 = -[CRLCanvasSubview initWithFrame:](v17, "initWithFrame:");
          objc_msgSend(v14, "bounds");
          -[CRLCanvasSubview setBounds:](v18, "setBounds:");
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "layer"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "sublayers"));
          v21 = objc_msgSend(v20, "copy");

          v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasSubview layer](v18, "layer"));
          objc_msgSend(v22, "setSublayers:", v21);

          objc_msgSend(v8, "addObject:", v18);
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v11);
  }

  -[CRLCanvasSubview setSubviews:](v24, "setSubviews:", v8);
  return v24;
}

- (BOOL)isCanvasContentLayer:(id)a3
{
  CALayer *v4;
  CALayer *v5;
  CALayer *v6;
  void *v7;
  BOOL v8;

  v4 = (CALayer *)a3;
  if (-[CRLInteractiveCanvasRepContentUpdater isRepContentLayer:](self->_repContentUpdater, "isRepContentLayer:", v4)
    || -[CRLInteractiveCanvasRepContentUpdater isRepContainerLayer:](self->_repContentUpdater, "isRepContainerLayer:", v4)|| -[CRLInteractiveCanvasRepContentUpdater isChildWrapperLayer:](self->_repContentUpdater, "isChildWrapperLayer:", v4)|| -[CRLInteractiveCanvasRepContentUpdater isClonedParentRepLayer:](self->_repContentUpdater, "isClonedParentRepLayer:", v4)|| self->_repContainerLayer == v4)
  {
    v8 = 1;
  }
  else
  {
    v5 = (CALayer *)objc_claimAutoreleasedReturnValue(-[CALayer superlayer](v4, "superlayer"));
    if (v5 == self->_repContainerLayer || self->_overlayLayer == v4)
    {
      v8 = 1;
    }
    else
    {
      v6 = (CALayer *)objc_claimAutoreleasedReturnValue(-[CALayer superlayer](v4, "superlayer"));
      if (v6 == self->_overlayLayer || self->_bottommostLayersContainerLayer == v4)
      {
        v8 = 1;
      }
      else
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer superlayer](v4, "superlayer"));
        v8 = v7 == 0;

      }
    }

  }
  return v8;
}

- (BOOL)isRepContentPlatformView:(id)a3
{
  return -[CRLCanvasSubview containsView:](self->_repContainerView, "containsView:", a3);
}

- (void)repWasRemoved:(id)a3
{
  -[NSMapTable removeObjectForKey:](self->_repOverlayRenderablesByRep, "removeObjectForKey:", a3);
}

- (void)decoratorWasRemoved:(id)a3
{
  -[NSMapTable removeObjectForKey:](self->_decoratorOverlayRenderablesByDecorator, "removeObjectForKey:", a3);
}

- (void)beginSuppressingLayerUpdatesExceptForReps:(id)a3
{
  NSSet *v4;
  NSSet *repsWhoseLayersAreAllowedToUpdate;

  v4 = (NSSet *)objc_msgSend(a3, "copy");
  repsWhoseLayersAreAllowedToUpdate = self->_repsWhoseLayersAreAllowedToUpdate;
  self->_repsWhoseLayersAreAllowedToUpdate = v4;

}

- (void)endSuppressingLayerUpdates
{
  NSSet *repsWhoseLayersAreAllowedToUpdate;
  void *v4;
  void *v5;
  void *v6;

  repsWhoseLayersAreAllowedToUpdate = self->_repsWhoseLayersAreAllowedToUpdate;
  if (!repsWhoseLayersAreAllowedToUpdate)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125A638);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2EEC4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125A658);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasLayerHelper endSuppressingLayerUpdates]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasLayerHelper.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 529, 0, "invalid nil value for '%{public}s'", "_repsWhoseLayersAreAllowedToUpdate");

    repsWhoseLayersAreAllowedToUpdate = self->_repsWhoseLayersAreAllowedToUpdate;
  }
  self->_repsWhoseLayersAreAllowedToUpdate = 0;

}

- (BOOL)currentlySuppressingLayerUpdates
{
  return self->_repsWhoseLayersAreAllowedToUpdate != 0;
}

- (void)updateLayerContainerFrames
{
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125A678);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2EF68();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125A698);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasLayerHelper updateLayerContainerFrames]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasLayerHelper.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 540, 0, "This operation must only be performed on the main thread.");

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "canvasView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "canvasLayer"));
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  -[CRLCanvasSubview setFrame:](self->_repContainerView, "setFrame:", v10, v12, v14, v16);
  -[CRLCanvasSubview setBounds:](self->_repContainerView, "setBounds:", v10, v12, v14, v16);
  -[CRLInteractiveCanvasRepContentSubviewUpdater updateSubviewFrames](self->_repContentSubviewUpdater, "updateSubviewFrames");
  -[CRLCanvasSubview setFrame:](self->_bottommostLayersContainerView, "setFrame:", v10, v12, v14, v16);
  -[CRLCanvasSubview setBounds:](self->_bottommostLayersContainerView, "setBounds:", v10, v12, v14, v16);
  -[CRLCanvasSubview setFrame:](self->_overlayView, "setFrame:", v10, v12, v14, v16);
  -[CRLCanvasSubview setBounds:](self->_overlayView, "setBounds:", v10, v12, v14, v16);
  -[CRLCanvasSubview setFrame:](self->_decoratorOverlayContainerView, "setFrame:", v10, v12, v14, v16);
  -[CRLCanvasSubview setBounds:](self->_decoratorOverlayContainerView, "setBounds:", v10, v12, v14, v16);
}

- (CALayer)repContainerLayer
{
  return self->_repContainerLayer;
}

- (CALayer)overlayLayer
{
  return self->_overlayLayer;
}

- (CALayer)popoutLayer
{
  return self->_popoutLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_popoutLayer, 0);
  objc_storeStrong((id *)&self->_overlayLayer, 0);
  objc_storeStrong((id *)&self->_repContainerLayer, 0);
  objc_storeStrong((id *)&self->_repsWhoseLayersAreAllowedToUpdate, 0);
  objc_storeStrong((id *)&self->_decoratorOverlayRenderablesByDecorator, 0);
  objc_storeStrong((id *)&self->_repOverlayRenderablesByRep, 0);
  objc_storeStrong((id *)&self->_repContentSubviewUpdater, 0);
  objc_storeStrong((id *)&self->_repContentUpdater, 0);
  objc_storeStrong((id *)&self->_bottommostLayersContainerLayer, 0);
  objc_storeStrong((id *)&self->_decoratorOverlayContainerView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_repContainerView, 0);
  objc_storeStrong((id *)&self->_bottommostLayersContainerView, 0);
  objc_destroyWeak((id *)&self->_interactiveCanvasController);
}

@end
