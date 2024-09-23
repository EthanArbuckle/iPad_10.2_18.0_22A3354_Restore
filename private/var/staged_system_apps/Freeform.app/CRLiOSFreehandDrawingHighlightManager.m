@implementation CRLiOSFreehandDrawingHighlightManager

- (CRLiOSFreehandDrawingHighlightManager)initWithInteractiveCanvasController:(id)a3
{
  id v4;
  CRLiOSFreehandDrawingHighlightManager *v5;
  CRLiOSFreehandDrawingHighlightManager *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLiOSFreehandDrawingHighlightManager;
  v5 = -[CRLiOSFreehandDrawingHighlightManager init](&v8, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_interactiveCanvasController, v4);
    objc_msgSend(v4, "addDecorator:", v6);
  }

  return v6;
}

- (void)teardown
{
  void *v2;
  void *v3;
  void *v4;
  NSArray *searchReferencesToHighlight;
  CRLSearchReference *primaryFindResultSearchReference;
  CRLWPHighlightArrayController *pulseArrayController;
  CRLWPHighlightArrayController *highlightArrayController;

  if (self->_isTornDown)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101239A68);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DFC930();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101239A88);
    v2 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSFreehandDrawingHighlightManager teardown]"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLiOSFreehandDrawingHighlightManager.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 55, 0, "attempting to call teardown on an instance of CRLiOSFreehandDrawingHighlightManager that has already been torn down.");

  }
  else
  {
    self->_isTornDown = 1;
    searchReferencesToHighlight = self->_searchReferencesToHighlight;
    self->_searchReferencesToHighlight = 0;

    primaryFindResultSearchReference = self->_primaryFindResultSearchReference;
    self->_primaryFindResultSearchReference = 0;

    pulseArrayController = self->_pulseArrayController;
    self->_pulseArrayController = 0;

    highlightArrayController = self->_highlightArrayController;
    self->_highlightArrayController = 0;

  }
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  if (!self->_isTornDown)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101239AA8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DFC9B4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101239AC8);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSFreehandDrawingHighlightManager dealloc]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLiOSFreehandDrawingHighlightManager.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 60, 0, "teardown not called for CRLiOSFreehandDrawingHighlightManager.");

  }
  v6.receiver = self;
  v6.super_class = (Class)CRLiOSFreehandDrawingHighlightManager;
  -[CRLiOSFreehandDrawingHighlightManager dealloc](&v6, "dealloc");
}

- (void)setPrimaryFindResultSearchReference:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char isKindOfClass;
  CRLSearchReference *primaryFindResultSearchReference;
  id WeakRetained;
  id v16;

  v16 = a3;
  v6 = objc_opt_class(CRLCanvasSearchReference, v5);
  v7 = sub_100221D0C(v6, v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v8
    && (v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "model")),
        v12 = objc_opt_class(_TtC8Freeform22CRLFreehandDrawingItem, v11),
        isKindOfClass = objc_opt_isKindOfClass(v10, v12),
        v10,
        (isKindOfClass & 1) != 0))
  {
    objc_storeStrong((id *)&self->_primaryFindResultSearchReference, a3);
    -[CRLiOSFreehandDrawingHighlightManager p_setPrimaryFindResultSearchReference:](self, "p_setPrimaryFindResultSearchReference:", v16);
  }
  else if (self->_primaryFindResultSearchReference)
  {
    -[CRLWPHighlightArrayController stop](self->_pulseArrayController, "stop");
    -[CRLiOSFreehandDrawingHighlightManager p_setPulseControllerActive:autohide:](self, "p_setPulseControllerActive:autohide:", 0, 0);
    primaryFindResultSearchReference = self->_primaryFindResultSearchReference;
    self->_primaryFindResultSearchReference = 0;

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  objc_msgSend(WeakRetained, "invalidateLayersForDecorator:", self);

}

- (void)p_setPrimaryFindResultSearchReference:(id)a3
{
  id v4;
  CRLiOSFreehandDrawingHighlightManager *v5;
  uint64_t v6;
  id WeakRetained;
  id v8;

  v8 = a3;
  -[CRLWPHighlightArrayController stop](self->_pulseArrayController, "stop");
  if (v8)
  {
    v4 = objc_msgSend(v8, "autohideHighlight");
    v5 = self;
    v6 = 1;
  }
  else
  {
    v5 = self;
    v6 = 0;
    v4 = 0;
  }
  -[CRLiOSFreehandDrawingHighlightManager p_setPulseControllerActive:autohide:](v5, "p_setPulseControllerActive:autohide:", v6, v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  objc_msgSend(WeakRetained, "invalidateLayersForDecorator:", self);

  -[CRLiOSFreehandDrawingHighlightManager p_updateAnimationWithAnimatingPulse:](self, "p_updateAnimationWithAnimatingPulse:", -[CRLWPHighlightArrayController shouldPulsate](self->_pulseArrayController, "shouldPulsate"));
}

- (void)setSearchReferencesToHighlight:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  NSArray *v18;
  id *p_isa;
  NSArray *searchReferencesToHighlight;
  id WeakRetained;
  CRLiOSFreehandDrawingHighlightManager *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];

  v22 = self;
  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v23 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "keyEnumerator"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v29;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v10);
        v12 = objc_opt_class(_TtC8Freeform22CRLFreehandDrawingItem, v7);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
        {
          v26 = 0u;
          v27 = 0u;
          v24 = 0u;
          v25 = 0u;
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKey:", v11));
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v25;
            do
            {
              v17 = 0;
              do
              {
                if (*(_QWORD *)v25 != v16)
                  objc_enumerationMutation(v13);
                objc_msgSend(v4, "addObject:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v17), v22);
                v17 = (char *)v17 + 1;
              }
              while (v15 != v17);
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            }
            while (v15);
          }

        }
        v10 = (char *)v10 + 1;
      }
      while (v10 != v8);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v4, "count"))
  {
    v18 = (NSArray *)objc_msgSend(v4, "copy");
    p_isa = (id *)&v22->super.isa;
    searchReferencesToHighlight = v22->_searchReferencesToHighlight;
    v22->_searchReferencesToHighlight = v18;
  }
  else
  {
    p_isa = (id *)&v22->super.isa;
    searchReferencesToHighlight = v22->_searchReferencesToHighlight;
    v22->_searchReferencesToHighlight = 0;
  }

  WeakRetained = objc_loadWeakRetained(p_isa + 1);
  objc_msgSend(WeakRetained, "invalidateLayersForDecorator:", p_isa);

  objc_msgSend(p_isa, "p_updateHighlights");
}

- (void)p_updateAnimationWithAnimatingPulse:(BOOL)a3
{
  _BOOL4 v3;
  id WeakRetained;
  void *v6;
  CGColor *v7;
  CRLWPHighlightArrayController *pulseArrayController;
  void *v9;
  void *v10;
  id v11;
  CRLSearchReference *primaryFindResultSearchReference;

  v3 = a3;
  if (!-[CRLWPHighlightArrayController pulsating](self->_pulseArrayController, "pulsating")
    && self->_primaryFindResultSearchReference
    && !self->_updatingHighlights)
  {
    self->_updatingHighlights = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "canvas"));
    objc_msgSend(v6, "viewScale");
    -[CRLWPHighlightArrayController setViewScale:](self->_pulseArrayController, "setViewScale:");

    -[CRLWPHighlightArrayController reset](self->_pulseArrayController, "reset");
    v7 = sub_1001B4168();
    pulseArrayController = self->_pulseArrayController;
    primaryFindResultSearchReference = self->_primaryFindResultSearchReference;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &primaryFindResultSearchReference, 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "canvas"));
    objc_msgSend(v10, "contentsScale");
    v11 = -[CRLWPHighlightArrayController buildHighlightsForSearchReferences:contentsScaleForLayers:shouldCreateBackground:backgroundColor:](pulseArrayController, "buildHighlightsForSearchReferences:contentsScaleForLayers:shouldCreateBackground:backgroundColor:", v9, 1, v7);

    CGColorRelease(v7);
    if (v3)
      -[CRLWPHighlightArrayController startAnimating](self->_pulseArrayController, "startAnimating");
    self->_updatingHighlights = 0;

  }
}

- (void)p_updateHighlights
{
  NSUInteger v3;
  CRLWPHighlightArrayController *highlightArrayController;
  CRLWPHighlightArrayController *v5;
  CRLWPHighlightArrayController *v6;
  id WeakRetained;
  CRLWPHighlightArrayController *v8;
  __int128 v9;
  void *v10;
  CGColor *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  CRLWPHighlightArrayController *v17;
  void *v18;
  void *v19;
  void *v20;
  NSArray *obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _OWORD v26[3];
  void *v27;
  _BYTE v28[128];

  v3 = -[NSArray count](self->_searchReferencesToHighlight, "count");
  highlightArrayController = self->_highlightArrayController;
  if (v3)
  {
    if (!highlightArrayController)
    {
      v5 = -[CRLWPHighlightArrayController initWithZOrder:delegate:]([CRLWPHighlightArrayController alloc], "initWithZOrder:delegate:", self, 0.0);
      v6 = self->_highlightArrayController;
      self->_highlightArrayController = v5;

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
    v8 = self->_highlightArrayController;
    v9 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v26[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v26[1] = v9;
    v26[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    -[CRLWPHighlightArrayController setTransform:](v8, "setTransform:", v26);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "canvas"));
    objc_msgSend(v10, "viewScale");
    -[CRLWPHighlightArrayController setViewScale:](self->_highlightArrayController, "setViewScale:");

    -[CRLWPHighlightArrayController reset](self->_highlightArrayController, "reset");
    v11 = sub_1001B4188();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    obj = self->_searchReferencesToHighlight;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v23;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(obj);
          v17 = self->_highlightArrayController;
          v27 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v15);
          v16 = v27;
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "canvas"));
          objc_msgSend(v19, "contentsScale");
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPHighlightArrayController buildHighlightsForSearchReferences:contentsScaleForLayers:shouldCreateBackground:backgroundColor:](v17, "buildHighlightsForSearchReferences:contentsScaleForLayers:shouldCreateBackground:backgroundColor:", v18, 1, v11));

          objc_msgSend(v16, "setFindHighlights:", v20);
          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      }
      while (v13);
    }

    CGColorRelease(v11);
  }
  else if (highlightArrayController)
  {
    self->_highlightArrayController = 0;

  }
}

- (void)p_setPulseControllerActive:(BOOL)a3 autohide:(BOOL)a4
{
  CRLWPHighlightArrayController *pulseArrayController;
  _BOOL8 v6;
  CRLWPHighlightArrayController *v7;
  CRLWPHighlightArrayController *v8;
  CRLWPHighlightArrayController *v9;
  __int128 v10;
  id WeakRetained;
  _OWORD v12[3];

  pulseArrayController = self->_pulseArrayController;
  if (a3)
  {
    v6 = a4;
    if (!pulseArrayController)
    {
      v7 = -[CRLWPHighlightArrayController initWithZOrder:delegate:]([CRLWPHighlightArrayController alloc], "initWithZOrder:delegate:", self, 0.0);
      v8 = self->_pulseArrayController;
      self->_pulseArrayController = v7;

      pulseArrayController = self->_pulseArrayController;
    }
    -[CRLWPHighlightArrayController setShouldPulsate:](pulseArrayController, "setShouldPulsate:", 1);
    -[CRLWPHighlightArrayController setAutohide:](self->_pulseArrayController, "setAutohide:", v6);
    v9 = self->_pulseArrayController;
    v10 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v12[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v12[1] = v10;
    v12[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    -[CRLWPHighlightArrayController setTransform:](v9, "setTransform:", v12);
    WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
    objc_msgSend(WeakRetained, "viewScale");
    -[CRLWPHighlightArrayController setViewScale:](self->_pulseArrayController, "setViewScale:");

  }
  else if (pulseArrayController)
  {
    self->_pulseArrayController = 0;

  }
}

- (id)p_makeOverlayHighlight
{
  void *v3;
  CRLWPHighlightArrayController *highlightArrayController;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  CRLWPHighlightArrayController *pulseArrayController;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  highlightArrayController = self->_highlightArrayController;
  if (highlightArrayController)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPHighlightArrayController layers](highlightArrayController, "layers"));
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPHighlightArrayController layers](self->_highlightArrayController, "layers"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRenderable renderablesFromLayers:](CRLCanvasRenderable, "renderablesFromLayers:", v7));
      objc_msgSend(v3, "addObjectsFromArray:", v8);

    }
  }
  pulseArrayController = self->_pulseArrayController;
  if (pulseArrayController)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPHighlightArrayController layers](pulseArrayController, "layers"));
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPHighlightArrayController layers](self->_pulseArrayController, "layers"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRenderable renderablesFromLayers:](CRLCanvasRenderable, "renderablesFromLayers:", v12));
      objc_msgSend(v3, "addObjectsFromArray:", v13);

    }
  }
  return v3;
}

- (id)p_boardItemsForSearchReference:(id)a3
{
  CRLInteractiveCanvasController **p_interactiveCanvasController;
  id v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  p_interactiveCanvasController = &self->_interactiveCanvasController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_interactiveCanvasController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "selectionModelTranslator"));

  v8 = (objc_class *)objc_opt_class(CRLCanvasSearchReference, v7);
  v9 = sub_1002223BC(v8, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "selectionPath"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "boardItemsForSelectionPath:", v11));

  return v12;
}

- (NSArray)decoratorOverlayRenderables
{
  void *v2;

  if (self->_searchReferencesToHighlight)
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSFreehandDrawingHighlightManager p_makeOverlayHighlight](self, "p_makeOverlayHighlight"));
  else
    v2 = &__NSArray0__struct;
  return (NSArray *)v2;
}

- (void)didEndZoomingOperation
{
  id WeakRetained;
  CRLWPHighlightArrayController *pulseArrayController;

  WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  objc_msgSend(WeakRetained, "invalidateLayersForDecorator:", self);

  pulseArrayController = self->_pulseArrayController;
  if (pulseArrayController)
    -[CRLiOSFreehandDrawingHighlightManager p_updateAnimationWithAnimatingPulse:](self, "p_updateAnimationWithAnimatingPulse:", -[CRLWPHighlightArrayController shouldPulsate](pulseArrayController, "shouldPulsate"));
  if (self->_highlightArrayController)
    -[CRLiOSFreehandDrawingHighlightManager p_updateHighlights](self, "p_updateHighlights");
}

- (CGPath)newPathForSearchReference:(id)a3
{
  void *v4;
  double y;
  double x;
  double height;
  double width;
  id v9;
  id v10;
  uint64_t v11;
  CRLInteractiveCanvasController **p_interactiveCanvasController;
  void *i;
  uint64_t v14;
  id WeakRetained;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  void *v25;
  void *v26;
  void *v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  void *v32;
  void *v33;
  CGPath *v34;
  CGAffineTransform v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSFreehandDrawingHighlightManager p_boardItemsForSearchReference:](self, "p_boardItemsForSearchReference:", a3));
  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v9 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v38;
    p_interactiveCanvasController = &self->_interactiveCanvasController;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v38 != v11)
          objc_enumerationMutation(v4);
        v14 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
        WeakRetained = objc_loadWeakRetained((id *)p_interactiveCanvasController);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "layoutForInfo:", v14));

        if (v16)
        {
          objc_msgSend(v16, "frameForCulling");
          v18 = v17;
          v20 = v19;
          v22 = v21;
          v24 = v23;
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "parent"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "geometryInRoot"));
          v27 = v26;
          if (v26)
            objc_msgSend(v26, "transform");
          else
            memset(&v36, 0, sizeof(v36));
          v42.origin.x = v18;
          v42.origin.y = v20;
          v42.size.width = v22;
          v42.size.height = v24;
          v43 = CGRectApplyAffineTransform(v42, &v36);
          v28 = v43.origin.x;
          v29 = v43.origin.y;
          v30 = v43.size.width;
          v31 = v43.size.height;

          v44.origin.x = x;
          v44.origin.y = y;
          v44.size.width = width;
          v44.size.height = height;
          v46.origin.x = v28;
          v46.origin.y = v29;
          v46.size.width = v30;
          v46.size.height = v31;
          v45 = CGRectUnion(v44, v46);
          x = v45.origin.x;
          y = v45.origin.y;
          width = v45.size.width;
          height = v45.size.height;
        }

      }
      v10 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v10);
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:", x, y, width, height, *(_OWORD *)&v36.a, *(_OWORD *)&v36.c, *(_OWORD *)&v36.tx));
  v33 = v32;
  if (v32)
    v34 = CGPathRetain((CGPathRef)objc_msgSend(objc_retainAutorelease(v32), "CGPath"));
  else
    v34 = 0;

  return v34;
}

- (id)imageForSearchReference:(id)a3 forPath:(CGPath *)a4 shouldPulsate:(BOOL)a5
{
  void *v5;
  void *v6;
  void *i;
  void *v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  void *j;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *k;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  double v33;
  double v34;
  id v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double x;
  double y;
  double v42;
  double v43;
  CGContext *v44;
  id v45;
  CGImage *Image;
  void *v47;
  id obj;
  uint64_t v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  uint64_t v57;
  char v58[48];
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
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  CGRect PathBoundingBox;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSFreehandDrawingHighlightManager p_boardItemsForSearchReference:](self, "p_boardItemsForSearchReference:", a3, a4, a5));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  obj = v5;
  v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
  if (v53)
  {
    v52 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v53; i = (char *)i + 1)
      {
        if (*(_QWORD *)v68 != v52)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * (_QWORD)i);
        WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "layoutForInfo:", v8));

        if (v10)
        {
          v55 = i;
          v12 = (objc_class *)objc_opt_class(_TtC8Freeform22CRLFreehandDrawingItem, v11);
          v13 = sub_1002223BC(v12, v8);
          v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
          v63 = 0u;
          v64 = 0u;
          v65 = 0u;
          v66 = 0u;
          v54 = v14;
          v56 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "allNestedChildrenItemsExcludingGroups"));
          v15 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
          if (v15)
          {
            v17 = v15;
            v57 = *(_QWORD *)v64;
            do
            {
              for (j = 0; j != v17; j = (char *)j + 1)
              {
                if (*(_QWORD *)v64 != v57)
                  objc_enumerationMutation(v56);
                v19 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)j);
                v20 = objc_opt_class(_TtC8Freeform27CRLFreehandDrawingShapeItem, v16);
                v21 = sub_100221D0C(v20, v19);
                v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
                v23 = v22;
                if (v22)
                {
                  v61 = 0u;
                  v62 = 0u;
                  v59 = 0u;
                  v60 = 0u;
                  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "pencilKitStrokesInParentSpace"));
                  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
                  if (v25)
                  {
                    v26 = v25;
                    v27 = *(_QWORD *)v60;
                    do
                    {
                      for (k = 0; k != v26; k = (char *)k + 1)
                      {
                        if (*(_QWORD *)v60 != v27)
                          objc_enumerationMutation(v24);
                        v29 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)k);
                        objc_msgSend(v10, "transformInRoot");
                        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "crl_strokeByAppendingTransform:", v58));
                        objc_msgSend(v6, "addObject:", v30);

                      }
                      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
                    }
                    while (v26);
                  }

                }
              }
              v17 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
            }
            while (v17);
          }

          i = v55;
        }

      }
      v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
    }
    while (v53);
  }

  v31 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "canvas"));
  objc_msgSend(v32, "contentsScale");
  v34 = v33;

  v35 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "canvas"));
  objc_msgSend(v36, "viewScale");
  v38 = v37;

  v39 = v34 * v38;
  PathBoundingBox = CGPathGetPathBoundingBox(a4);
  x = PathBoundingBox.origin.x;
  y = PathBoundingBox.origin.y;
  v42 = sub_1000603DC(PathBoundingBox.size.width, PathBoundingBox.size.height, v39);
  v44 = sub_10040FA64(11, v42, v43);
  CGContextSaveGState(v44);
  CGContextScaleCTM(v44, v39, v39);
  CGContextTranslateCTM(v44, -x, -y);
  v45 = objc_msgSend(v6, "copy");
  +[CRLPencilKitRenderer drawStrokes:inContext:overTransparentCanvas:](CRLPencilKitRenderer, "drawStrokes:inContext:overTransparentCanvas:", v45, v44, 1);

  CGContextRestoreGState(v44);
  Image = CGBitmapContextCreateImage(v44);
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage imageWithCGImage:](CRLImage, "imageWithCGImage:", Image));
  CGImageRelease(Image);
  CGContextRelease(v44);

  return v47;
}

- (void)pulseAnimationDidStop:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;

  if (self->_pulseArrayController == a3)
  {
    if (objc_msgSend(a3, "autohide"))
    {
      -[CRLiOSFreehandDrawingHighlightManager p_setPulseControllerActive:autohide:](self, "p_setPulseControllerActive:autohide:", 0, 0);
      if (self->_pulseArrayController)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101239AE8);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DFCA38();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101239B08);
        v4 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE87A4(v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSFreehandDrawingHighlightManager pulseAnimationDidStop:]"));
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLiOSFreehandDrawingHighlightManager.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 283, 0, "expected nil value for '%{public}s'", "_pulseArrayController");

      }
      -[CRLiOSFreehandDrawingHighlightManager p_setPrimaryFindResultSearchReference:](self, "p_setPrimaryFindResultSearchReference:", 0);
      WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
      objc_msgSend(WeakRetained, "invalidateLayersForDecorator:", self);

    }
    -[CRLSearchReference setPulseHighlight:](self->_primaryFindResultSearchReference, "setPulseHighlight:", 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightArrayController, 0);
  objc_storeStrong((id *)&self->_pulseArrayController, 0);
  objc_storeStrong((id *)&self->_searchReferencesToHighlight, 0);
  objc_storeStrong((id *)&self->_primaryFindResultSearchReference, 0);
  objc_destroyWeak((id *)&self->_interactiveCanvasController);
}

@end
