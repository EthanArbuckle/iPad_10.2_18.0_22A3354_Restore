@implementation CRLCanvas

- (CRLCanvas)init
{
  double v3;
  uint64_t v4;

  *(_QWORD *)&v3 = objc_opt_class(CRLCanvasLayoutController, a2).n128_u64[0];
  return -[CRLCanvas initWithLayoutControllerClass:delegate:](self, "initWithLayoutControllerClass:delegate:", v4, 0, v3);
}

- (CRLCanvas)initWithLayoutControllerClass:(Class)a3 delegate:(id)a4
{
  id v6;
  char *v7;
  CRLCanvas *v8;
  __int128 v9;
  NSArray *v10;
  NSArray *mInfos;
  NSArray *v12;
  NSArray *mTopLevelReps;
  NSSet *v14;
  NSSet *mAllReps;
  NSMapTable *v16;
  NSMapTable *mRepsByLayout;
  CRLCanvasLayoutController *v18;
  CRLCanvasLayoutController *mLayoutController;
  uint64_t v20;
  NSHashTable *mCanvasLayoutObservers;
  uint64_t v22;
  NSMutableSet *mRepsWithInvalidContentLayers;
  uint64_t v24;
  NSMutableSet *mRepsWithInvalidOverlayLayers;
  objc_super v27;

  v6 = a4;
  v27.receiver = self;
  v27.super_class = (Class)CRLCanvas;
  v7 = -[CRLCanvas init](&v27, "init");
  v8 = (CRLCanvas *)v7;
  if (v7)
  {
    *((_QWORD *)v7 + 12) = 0x3FF0000000000000;
    *((int64x2_t *)v7 + 5) = vdupq_n_s64(0x4059000000000000uLL);
    v9 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
    *(_OWORD *)(v7 + 200) = *(_OWORD *)&UIEdgeInsetsZero.top;
    *(_OWORD *)(v7 + 216) = v9;
    v10 = (NSArray *)objc_alloc_init((Class)NSArray);
    mInfos = v8->mInfos;
    v8->mInfos = v10;

    v12 = (NSArray *)objc_alloc_init((Class)NSArray);
    mTopLevelReps = v8->mTopLevelReps;
    v8->mTopLevelReps = v12;

    v14 = (NSSet *)objc_alloc_init((Class)NSSet);
    mAllReps = v8->mAllReps;
    v8->mAllReps = v14;

    v16 = (NSMapTable *)objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 517, 517, 0);
    mRepsByLayout = v8->mRepsByLayout;
    v8->mRepsByLayout = v16;

    objc_storeWeak((id *)&v8->mDelegate, v6);
    v18 = (CRLCanvasLayoutController *)objc_msgSend([a3 alloc], "initWithCanvas:", v8);
    mLayoutController = v8->mLayoutController;
    v8->mLayoutController = v18;

    v8->mContentsScale = 1.0;
    v8->mWideGamut = 1;
    v8->mAllowsFontSubpixelQuantization = 1;
    v8->mBlocksToPerformLock._os_unfair_lock_opaque = 0;
    __dmb(0xBu);
    v20 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    mCanvasLayoutObservers = v8->mCanvasLayoutObservers;
    v8->mCanvasLayoutObservers = (NSHashTable *)v20;

    -[CRLCanvas setI_viewScaleForAudioObjectsInNonInteractiveCanvas:](v8, "setI_viewScaleForAudioObjectsInNonInteractiveCanvas:", 1.0);
    v22 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    mRepsWithInvalidContentLayers = v8->mRepsWithInvalidContentLayers;
    v8->mRepsWithInvalidContentLayers = (NSMutableSet *)v22;

    v24 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    mRepsWithInvalidOverlayLayers = v8->mRepsWithInvalidOverlayLayers;
    v8->mRepsWithInvalidOverlayLayers = (NSMutableSet *)v24;

  }
  return v8;
}

- (id)initForTemporaryLayout
{
  id result;

  result = -[CRLCanvas init](self, "init");
  if (result)
    *((_BYTE *)result + 72) = 1;
  return result;
}

- (void)teardown
{
  NSArray *mInfos;
  void *v4;
  id WeakRetained;
  char v6;
  id v7;
  NSMutableArray *mBlocksToPerformAfterLayout;
  NSMutableArray *mBlocksToPerformAfterLayoutAndLayerUpdating;

  mInfos = self->mInfos;
  self->mInfos = 0;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvas layoutController](self, "layoutController"));
  objc_msgSend(v4, "i_removeAllLayouts");

  -[CRLCanvas p_removeAllReps](self, "p_removeAllReps");
  if (-[CRLCanvas isCanvasInteractive](self, "isCanvasInteractive"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
    v6 = objc_opt_respondsToSelector(WeakRetained, "updateLayerTreeForInteractiveCanvas:");

    if ((v6 & 1) != 0)
    {
      v7 = objc_loadWeakRetained((id *)&self->mDelegate);
      objc_msgSend(v7, "updateLayerTreeForInteractiveCanvas:", self);

    }
  }
  os_unfair_lock_lock(&self->mBlocksToPerformLock);
  mBlocksToPerformAfterLayout = self->mBlocksToPerformAfterLayout;
  self->mBlocksToPerformAfterLayout = 0;

  mBlocksToPerformAfterLayoutAndLayerUpdating = self->mBlocksToPerformAfterLayoutAndLayerUpdating;
  self->mBlocksToPerformAfterLayoutAndLayerUpdating = 0;

  os_unfair_lock_unlock(&self->mBlocksToPerformLock);
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
  void *v10;
  void *v11;
  objc_super v12;

  if (self->mInfos)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101261018);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E39060();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101261038);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvas dealloc]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvas.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 184, 0, "Canvas must be torn down before being deallocated");

  }
  if (self->mBlocksToPerformAfterLayout)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101261058);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E38FD4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101261078);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvas dealloc]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvas.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 188, 0, "expected nil value for '%{public}s'", "mBlocksToPerformAfterLayout");

  }
  if (self->mBlocksToPerformAfterLayoutAndLayerUpdating)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101261098);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E38F48();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012610B8);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvas dealloc]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvas.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 189, 0, "expected nil value for '%{public}s'", "mBlocksToPerformAfterLayoutAndLayerUpdating");

  }
  -[CRLCanvasLayoutController setInfos:](self->mLayoutController, "setInfos:", &__NSArray0__struct);
  v12.receiver = self;
  v12.super_class = (Class)CRLCanvas;
  -[CRLCanvas dealloc](&v12, "dealloc");
}

- (Class)rootLayoutClass
{
  void *v3;
  id v4;
  CRLCanvasDelegate **p_mDelegate;
  id WeakRetained;
  char v7;
  id v8;

  objc_opt_class(CRLCanvasRootLayout, a2);
  v4 = v3;
  p_mDelegate = &self->mDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_mDelegate);
  v7 = objc_opt_respondsToSelector(WeakRetained, "canvasRootLayoutClass");

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_mDelegate);
    v4 = objc_msgSend(v8, "canvasRootLayoutClass");

  }
  return (Class)v4;
}

- (BOOL)isLayoutComplete
{
  return -[CRLCanvas p_isLayoutCompleteIncludingLayers:](self, "p_isLayoutCompleteIncludingLayers:", 1);
}

- (BOOL)p_isLayoutCompleteIncludingLayers:(BOOL)a3
{
  unsigned __int8 v4;

  if (self->mInLayout)
    return 0;
  if (a3)
    v4 = -[CRLCanvas i_needsLayout](self, "i_needsLayout");
  else
    v4 = -[CRLCanvas p_needsLayoutNotIncludingLayers](self, "p_needsLayoutNotIncludingLayers");
  return v4 ^ 1;
}

- (void)performBlockAfterLayoutIfNecessary:(id)a3
{
  -[CRLCanvas afterLayoutIncludingLayers:performBlock:](self, "afterLayoutIncludingLayers:performBlock:", 0, a3);
}

- (void)afterLayoutIncludingLayers:(BOOL)a3 performBlock:(id)a4
{
  _BOOL8 v4;
  void (**v6)(void);
  os_unfair_lock_s *p_mBlocksToPerformLock;
  NSMutableArray *mBlocksToPerformAfterLayoutAndLayerUpdating;
  NSMutableArray *v9;
  NSMutableArray *mBlocksToPerformAfterLayout;
  NSMutableArray *v11;
  NSMutableArray *v12;
  NSMutableArray *v13;
  NSMutableArray *v14;
  id v15;
  id v16;
  void (**v17)(void);

  v4 = a3;
  v6 = (void (**)(void))a4;
  if (v6)
  {
    v17 = v6;
    if (-[CRLCanvas p_isLayoutCompleteIncludingLayers:](self, "p_isLayoutCompleteIncludingLayers:", v4))
    {
      v17[2]();
    }
    else
    {
      p_mBlocksToPerformLock = &self->mBlocksToPerformLock;
      os_unfair_lock_lock(&self->mBlocksToPerformLock);
      if (v4)
      {
        mBlocksToPerformAfterLayoutAndLayerUpdating = self->mBlocksToPerformAfterLayoutAndLayerUpdating;
        if (mBlocksToPerformAfterLayoutAndLayerUpdating)
          v9 = mBlocksToPerformAfterLayoutAndLayerUpdating;
        else
          v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
        v12 = self->mBlocksToPerformAfterLayoutAndLayerUpdating;
        self->mBlocksToPerformAfterLayoutAndLayerUpdating = v9;

        v13 = self->mBlocksToPerformAfterLayoutAndLayerUpdating;
      }
      else
      {
        mBlocksToPerformAfterLayout = self->mBlocksToPerformAfterLayout;
        if (mBlocksToPerformAfterLayout)
          v11 = mBlocksToPerformAfterLayout;
        else
          v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
        v14 = self->mBlocksToPerformAfterLayout;
        self->mBlocksToPerformAfterLayout = v11;

        v13 = self->mBlocksToPerformAfterLayout;
      }
      v15 = objc_msgSend(v17, "copy");
      v16 = objc_retainBlock(v15);
      -[NSMutableArray addObject:](v13, "addObject:", v16);

      os_unfair_lock_unlock(p_mBlocksToPerformLock);
    }
    v6 = v17;
  }

}

- (CRLBoardItemOwning)boardItemOwner
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "boardItemOwnerForCanvas:", self));

  return (CRLBoardItemOwning *)v4;
}

- (CRLChangeNotifier)changeNotifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvas canvasController](self, "canvasController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "editingCoordinator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "changeNotifier"));

  return (CRLChangeNotifier *)v4;
}

- (void)i_setCanvasController:(id)a3
{
  id v4;
  CRLInteractiveCanvasController **p_mCanvasController;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  p_mCanvasController = &self->mCanvasController;
  WeakRetained = objc_loadWeakRetained((id *)p_mCanvasController);

  if (WeakRetained)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012610D8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E3916C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012610F8);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvas i_setCanvasController:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvas.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 260, 0, "expected nil value for '%{public}s'", "mCanvasController");

  }
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101261118);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E390E0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101261138);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvas i_setCanvasController:]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvas.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 261, 0, "invalid nil value for '%{public}s'", "icc");

  }
  v13 = objc_loadWeakRetained((id *)p_mCanvasController);

  if (!v13)
    objc_storeWeak((id *)p_mCanvasController, v4);

}

- (CRLInteractiveCanvasController)canvasController
{
  return (CRLInteractiveCanvasController *)objc_loadWeakRetained((id *)&self->mCanvasController);
}

- (void)setInfosToDisplay:(id)a3
{
  -[CRLCanvas i_setInfosToDisplay:updatingLayoutController:](self, "i_setInfosToDisplay:updatingLayoutController:", a3, 1);
}

- (void)i_setInfosToDisplay:(id)a3 updatingLayoutController:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSArray *v7;
  NSArray *mInfos;
  id v9;

  v4 = a4;
  v6 = a3;
  v9 = v6;
  if (v6)
    v7 = (NSArray *)objc_msgSend(v6, "copy");
  else
    v7 = (NSArray *)objc_alloc_init((Class)NSArray);
  mInfos = self->mInfos;
  self->mInfos = v7;

  if (v4)
    -[CRLCanvas i_updateInfosInLayoutController](self, "i_updateInfosInLayoutController");

}

- (void)i_updateInfosInLayoutController
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvas layoutController](self, "layoutController"));
  objc_msgSend(v3, "setInfos:", self->mInfos);

}

- (id)repForLayout:(id)a3
{
  if (a3)
    return (id)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->mRepsByLayout, "objectForKey:"));
  else
    return 0;
}

- (void)recreateAllLayoutsAndReps
{
  void *v3;
  id WeakRetained;
  char v5;
  id v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvas layoutController](self, "layoutController"));
  objc_msgSend(v3, "i_removeAllLayouts");

  -[CRLCanvas p_updateRepsFromLayouts](self, "p_updateRepsFromLayouts");
  if (-[CRLCanvas isCanvasInteractive](self, "isCanvasInteractive"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
    v5 = objc_opt_respondsToSelector(WeakRetained, "updateLayerTreeForInteractiveCanvas:");

    if ((v5 & 1) != 0)
    {
      v6 = objc_loadWeakRetained((id *)&self->mDelegate);
      objc_msgSend(v6, "updateLayerTreeForInteractiveCanvas:", self);

    }
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvas layoutController](self, "layoutController"));
  objc_msgSend(v7, "setInfos:", self->mInfos);

  -[CRLCanvas layoutInvalidated](self, "layoutInvalidated");
}

- (void)canvasInvalidatedForRep:(id)a3
{
  id v4;

  v4 = a3;
  -[CRLCanvas p_setInvalidLayoutFlagAndCallDelegate](self, "p_setInvalidLayoutFlagAndCallDelegate");
  -[CRLCanvas invalidateContentLayersForRep:](self, "invalidateContentLayersForRep:", v4);
  -[CRLCanvas invalidateOverlayLayersForRep:](self, "invalidateOverlayLayersForRep:", v4);

}

- (void)canvasInvalidatedForLayout:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = objc_claimAutoreleasedReturnValue(-[CRLCanvas repForLayout:](self, "repForLayout:", a3));
  v5 = (id)v4;
  if (v4)
    -[CRLCanvas canvasInvalidatedForRep:](self, "canvasInvalidatedForRep:", v4);
  else
    -[CRLCanvas p_setInvalidLayoutFlagAndCallDelegate](self, "p_setInvalidLayoutFlagAndCallDelegate");

}

- (void)p_setInvalidLayoutFlagAndCallDelegate
{
  CRLCanvasDelegate **p_mDelegate;
  id WeakRetained;
  char v5;
  id v6;

  self->mInvalidFlags.layout = 1;
  p_mDelegate = &self->mDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  v5 = objc_opt_respondsToSelector(WeakRetained, "canvasLayoutInvalidated:");

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_mDelegate);
    objc_msgSend(v6, "canvasLayoutInvalidated:", self);

  }
}

- (void)invalidateReps
{
  CRLCanvasDelegate **p_mDelegate;
  id WeakRetained;
  char v5;
  id v6;

  self->mInvalidFlags.reps = 1;
  p_mDelegate = &self->mDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  v5 = objc_opt_respondsToSelector(WeakRetained, "canvasLayoutInvalidated:");

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_mDelegate);
    objc_msgSend(v6, "canvasLayoutInvalidated:", self);

  }
}

- (void)invalidateVisibleBounds
{
  CRLCanvasDelegate **p_mDelegate;
  id WeakRetained;
  char v5;
  id v6;

  self->mInvalidFlags.visibleBounds = 1;
  p_mDelegate = &self->mDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  v5 = objc_opt_respondsToSelector(WeakRetained, "canvasLayoutInvalidated:");

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_mDelegate);
    objc_msgSend(v6, "canvasLayoutInvalidated:", self);

  }
}

- (void)invalidateAllLayers
{
  CRLCanvasDelegate **p_mDelegate;
  id WeakRetained;
  char v5;
  id v6;

  self->mInvalidFlags.allContentAndOverlayLayers = 1;
  p_mDelegate = &self->mDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  v5 = objc_opt_respondsToSelector(WeakRetained, "canvasDidInvalidateAllLayers:");

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_mDelegate);
    objc_msgSend(v6, "canvasDidInvalidateAllLayers:", self);

  }
  -[CRLCanvas i_setLayersInvalidWithoutInvalidatingAnySpecificLayers](self, "i_setLayersInvalidWithoutInvalidatingAnySpecificLayers");
}

- (void)invalidateContentLayersForRep:(id)a3
{
  -[NSMutableSet addObject:](self->mRepsWithInvalidContentLayers, "addObject:", a3);
  -[CRLCanvas i_setLayersInvalidWithoutInvalidatingAnySpecificLayers](self, "i_setLayersInvalidWithoutInvalidatingAnySpecificLayers");
}

- (void)invalidateOverlayLayersForRep:(id)a3
{
  -[NSMutableSet addObject:](self->mRepsWithInvalidOverlayLayers, "addObject:", a3);
  -[CRLCanvas i_setLayersInvalidWithoutInvalidatingAnySpecificLayers](self, "i_setLayersInvalidWithoutInvalidatingAnySpecificLayers");
}

- (void)i_setLayersInvalidWithoutInvalidatingAnySpecificLayers
{
  CRLCanvasDelegate **p_mDelegate;
  id WeakRetained;
  char v5;
  id v6;

  self->mInvalidFlags.layers = 1;
  p_mDelegate = &self->mDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  v5 = objc_opt_respondsToSelector(WeakRetained, "canvasLayoutInvalidated:");

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_mDelegate);
    objc_msgSend(v6, "canvasLayoutInvalidated:", self);

  }
}

- (BOOL)crlaxIsPreventingReloadingChildren
{
  return 0;
}

- (void)nonInteractiveLayoutIfNeeded
{
  void *v3;
  void *v4;
  void *v5;

  if (-[CRLCanvas isCanvasInteractive](self, "isCanvasInteractive"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101261158);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E391F8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101261178);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvas nonInteractiveLayoutIfNeeded]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvas.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 476, 0, "Interactive canvases should not be laid out directly!");

  }
  -[CRLCanvas i_layoutIfNeeded](self, "i_layoutIfNeeded");
}

- (void)i_layoutIfNeededUpdatingLayerTree
{
  _QWORD v3[5];

  if (self->mInLayout)
  {
    if (-[CRLCanvas i_needsLayout](self, "i_needsLayout")
      && !self->mShouldUpdateLayersDuringLayout
      && !-[CRLCanvas p_canvasShouldAlwaysUpdateLayers](self, "p_canvasShouldAlwaysUpdateLayers"))
    {
      v3[0] = _NSConcreteStackBlock;
      v3[1] = 3221225472;
      v3[2] = sub_1004850D4;
      v3[3] = &unk_10122D110;
      v3[4] = self;
      -[CRLCanvas performBlockAfterLayoutIfNecessary:](self, "performBlockAfterLayoutIfNecessary:", v3);
    }
  }
  else
  {
    self->mShouldUpdateLayersDuringLayout = 1;
    -[CRLCanvas p_layoutWithReadLock](self, "p_layoutWithReadLock");
    self->mShouldUpdateLayersDuringLayout = 0;
  }
}

- (BOOL)p_canvasShouldAlwaysUpdateLayers
{
  if (-[CRLCanvas isCanvasInteractive](self, "isCanvasInteractive"))
    return !+[NSThread isMainThread](NSThread, "isMainThread");
  else
    return 1;
}

- (BOOL)i_needsLayout
{
  if (self->mInvalidFlags.layers)
    return 1;
  else
    return -[CRLCanvas p_needsLayoutNotIncludingLayers](self, "p_needsLayoutNotIncludingLayers");
}

- (BOOL)p_needsLayoutNotIncludingLayers
{
  return self->mInvalidFlags.layout || self->mInvalidFlags.reps || self->mInvalidFlags.visibleBounds;
}

- (void)i_registerCanvasLayoutObserver:(id)a3
{
  -[NSHashTable addObject:](self->mCanvasLayoutObservers, "addObject:", a3);
}

- (void)i_unregisterCanvasLayoutObserver:(id)a3
{
  -[NSHashTable removeObject:](self->mCanvasLayoutObservers, "removeObject:", a3);
}

- (BOOL)spellCheckingSupported
{
  CRLCanvasDelegate **p_mDelegate;
  id WeakRetained;
  id v5;
  unsigned __int8 v6;

  if (!-[CRLCanvas isCanvasInteractive](self, "isCanvasInteractive"))
    return 0;
  p_mDelegate = &self->mDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  if ((objc_opt_respondsToSelector(WeakRetained, "spellCheckingSupported") & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)p_mDelegate);
    v6 = objc_msgSend(v5, "spellCheckingSupported");

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)spellCheckingSuppressed
{
  unsigned int v3;
  CRLCanvasDelegate **p_mDelegate;
  id WeakRetained;
  id v6;
  unsigned __int8 v7;

  v3 = -[CRLCanvas spellCheckingSupported](self, "spellCheckingSupported");
  if (v3)
  {
    p_mDelegate = &self->mDelegate;
    WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
    if ((objc_opt_respondsToSelector(WeakRetained, "spellCheckingSuppressed") & 1) != 0)
    {
      v6 = objc_loadWeakRetained((id *)p_mDelegate);
      v7 = objc_msgSend(v6, "spellCheckingSuppressed");

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  return v7 | v3 ^ 1;
}

- (BOOL)isCanvasInteractive
{
  CRLCanvasDelegate **p_mDelegate;
  id WeakRetained;
  id v4;
  id v5;
  unsigned __int8 v6;

  p_mDelegate = &self->mDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained((id *)p_mDelegate);
    if ((objc_opt_respondsToSelector(v4, "isCanvasInteractive") & 1) != 0)
    {
      v5 = objc_loadWeakRetained((id *)p_mDelegate);
      v6 = objc_msgSend(v5, "isCanvasInteractive");

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isPrinting
{
  CRLCanvasDelegate **p_mDelegate;
  id WeakRetained;
  id v4;
  id v5;
  unsigned __int8 v6;

  p_mDelegate = &self->mDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained((id *)p_mDelegate);
    if ((objc_opt_respondsToSelector(v4, "isPrintingCanvas") & 1) != 0)
    {
      v5 = objc_loadWeakRetained((id *)p_mDelegate);
      v6 = objc_msgSend(v5, "isPrintingCanvas");

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)shouldShowTextOverflowGlyphs
{
  CRLCanvasDelegate **p_mDelegate;
  id WeakRetained;
  void *v4;
  id v5;
  char v6;
  id v7;
  unsigned __int8 v8;

  p_mDelegate = &self->mDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  if (!WeakRetained)
    return 1;
  v4 = WeakRetained;
  v5 = objc_loadWeakRetained((id *)p_mDelegate);
  v6 = objc_opt_respondsToSelector(v5, "shouldShowTextOverflowGlyphs");

  if ((v6 & 1) == 0)
    return 1;
  v7 = objc_loadWeakRetained((id *)p_mDelegate);
  v8 = objc_msgSend(v7, "shouldShowTextOverflowGlyphs");

  return v8;
}

- (void)setEnableInstructionalText:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;

  if (-[CRLCanvas isCanvasInteractive](self, "isCanvasInteractive"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101261198);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E39278();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012611B8);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvas setEnableInstructionalText:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvas.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 572, 0, "Setting enableInstructionalText on an interactive canvas is not allowed.");

  }
  self->mEnableInstructionalText = a3;
}

- (BOOL)shouldShowInstructionalTextForLayout:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  id v9;
  unsigned __int8 v10;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  if (WeakRetained
    && (v6 = WeakRetained,
        v7 = objc_loadWeakRetained((id *)&self->mDelegate),
        v8 = objc_opt_respondsToSelector(v7, "shouldShowInstructionalTextForLayout:"),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    v9 = objc_loadWeakRetained((id *)&self->mDelegate);
    v10 = objc_msgSend(v9, "shouldShowInstructionalTextForLayout:", v4);

  }
  else if (-[CRLCanvas isCanvasInteractive](self, "isCanvasInteractive")
         || -[CRLCanvas isTemporaryForLayout](self, "isTemporaryForLayout"))
  {
    v10 = 1;
  }
  else
  {
    v10 = -[CRLCanvas enableInstructionalText](self, "enableInstructionalText");
  }

  return v10;
}

- (BOOL)shouldSuppressBackgrounds
{
  CRLCanvasDelegate **p_mDelegate;
  id WeakRetained;
  id v4;
  id v5;
  unsigned __int8 v6;

  p_mDelegate = &self->mDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained((id *)p_mDelegate);
    if ((objc_opt_respondsToSelector(v4, "shouldSuppressBackgrounds") & 1) != 0)
    {
      v5 = objc_loadWeakRetained((id *)p_mDelegate);
      v6 = objc_msgSend(v5, "shouldSuppressBackgrounds");

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isDrawingIntoPDF
{
  CRLCanvasDelegate **p_mDelegate;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;
  unsigned __int8 v9;

  p_mDelegate = &self->mDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  if (!WeakRetained)
    return 0;
  v5 = WeakRetained;
  v6 = objc_loadWeakRetained((id *)p_mDelegate);
  v7 = objc_opt_respondsToSelector(v6, "isCanvasDrawingIntoPDF:");

  if ((v7 & 1) == 0)
    return 0;
  v8 = objc_loadWeakRetained((id *)p_mDelegate);
  v9 = objc_msgSend(v8, "isCanvasDrawingIntoPDF:", self);

  return v9;
}

- (BOOL)textLayoutMustIncludeAdornments
{
  CRLCanvasDelegate **p_mDelegate;
  id WeakRetained;
  void *v4;
  id v5;
  char v6;
  id v7;
  unsigned __int8 v8;

  p_mDelegate = &self->mDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  if (!WeakRetained)
    return 0;
  v4 = WeakRetained;
  v5 = objc_loadWeakRetained((id *)p_mDelegate);
  v6 = objc_opt_respondsToSelector(v5, "textLayoutMustIncludeAdornments");

  if ((v6 & 1) == 0)
    return 0;
  v7 = objc_loadWeakRetained((id *)p_mDelegate);
  v8 = objc_msgSend(v7, "textLayoutMustIncludeAdornments");

  return v8;
}

- (void)i_setContentsScale:(double)a3
{
  self->mContentsScale = a3;
}

- (double)contentsScale
{
  return self->mContentsScale;
}

- (void)i_setCanvasIsWideGamut:(BOOL)a3
{
  self->mWideGamut = a3;
}

- (BOOL)canvasIsWideGamut
{
  return self->mWideGamut;
}

- (void)setSuppressesShadowsAndReflections:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;

  if (-[CRLCanvas isCanvasInteractive](self, "isCanvasInteractive"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012611D8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E392F8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012611F8);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvas setSuppressesShadowsAndReflections:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvas.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 638, 0, "Caller is trying to suppress shadows and reflections on an interactive canvas; this is not supported");

  }
  self->mSuppressesShadowsAndReflections = a3;
}

- (void)setViewScale:(double)a3
{
  unsigned int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  double mViewScale;
  uint8_t buf[4];
  unsigned int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  double v20;
  __int16 v21;
  double v22;

  if (a3 <= 0.0)
  {
    v5 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101261218);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    {
      mViewScale = self->mViewScale;
      *(_DWORD *)buf = 67110402;
      v12 = v5;
      v13 = 2082;
      v14 = "-[CRLCanvas setViewScale:]";
      v15 = 2082;
      v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvas.m";
      v17 = 1024;
      v18 = 651;
      v19 = 2048;
      v20 = a3;
      v21 = 2048;
      v22 = mViewScale;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Caller is trying to set the canvas view scale to invalid value: %f (Falling back to current value: %f)", buf, 0x36u);
    }
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101261238);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvas setViewScale:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvas.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 651, 0, "Caller is trying to set the canvas view scale to invalid value: %f (Falling back to current value: %f)", *(_QWORD *)&a3, *(_QWORD *)&self->mViewScale);

  }
  else
  {
    self->mViewScale = a3;
  }
}

- (CGRect)convertUnscaledToBoundsRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  double x;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CRLCanvas viewScale](self, "viewScale");
  v8 = sub_100060FD8(x, y, width, height, v7);
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (CGRect)convertBoundsToUnscaledRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  double x;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CRLCanvas viewScale](self, "viewScale");
  v8 = sub_100060FD8(x, y, width, height, 1.0 / v7);
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (CGPoint)convertUnscaledToBoundsPoint:(CGPoint)a3
{
  double y;
  double x;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[CRLCanvas viewScale](self, "viewScale");
  v6 = sub_1000603DC(x, y, v5);
  result.y = v7;
  result.x = v6;
  return result;
}

- (CGPoint)convertBoundsToUnscaledPoint:(CGPoint)a3
{
  double y;
  double x;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[CRLCanvas viewScale](self, "viewScale");
  v6 = sub_1000603DC(x, y, 1.0 / v5);
  result.y = v7;
  result.x = v6;
  return result;
}

- (CGSize)convertUnscaledToBoundsSize:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;
  double v7;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[CRLCanvas viewScale](self, "viewScale");
  v6 = sub_1000603DC(width, height, v5);
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)convertBoundsToUnscaledSize:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;
  double v7;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[CRLCanvas viewScale](self, "viewScale");
  v6 = sub_1000603DC(width, height, 1.0 / v5);
  result.height = v7;
  result.width = v6;
  return result;
}

- (double)convertUnscaledToBoundsLength:(double)a3
{
  double v4;

  -[CRLCanvas viewScale](self, "viewScale");
  return v4 * a3;
}

- (double)convertBoundsToUnscaledLength:(double)a3
{
  double v4;

  -[CRLCanvas viewScale](self, "viewScale");
  return 1.0 / v4 * a3;
}

- (CGRect)visibleUnscaledRectForClippingReps
{
  CRLCanvasDelegate **p_mDelegate;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;
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
  CGRect result;

  p_mDelegate = &self->mDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  if (WeakRetained
    && (v5 = WeakRetained,
        v6 = objc_loadWeakRetained((id *)p_mDelegate),
        v7 = objc_opt_respondsToSelector(v6, "visibleScaledBoundsForClippingRepsOnCanvas:"),
        v6,
        v5,
        (v7 & 1) != 0))
  {
    v8 = objc_loadWeakRetained((id *)p_mDelegate);
    objc_msgSend(v8, "visibleScaledBoundsForClippingRepsOnCanvas:", self);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    -[CRLCanvas convertBoundsToUnscaledRect:](self, "convertBoundsToUnscaledRect:", v10, v12, v14, v16);
  }
  else
  {
    -[CRLCanvas p_bounds](self, "p_bounds");
  }
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (id)hitRep:(CGPoint)a3 withPrecision:(BOOL)a4 inTopLevelReps:(id)a5 smallRepOutset:(double)a6 unscaledPointTransformForRep:(id)a7 passingTest:(id)a8
{
  return +[CRLCanvas p_hitRep:withPrecision:inTopLevelReps:smallRepOutset:unscaledPointTransformForRep:passingTest:](CRLCanvas, "p_hitRep:withPrecision:inTopLevelReps:smallRepOutset:unscaledPointTransformForRep:passingTest:", a4, a5, a7, a8, a3.x, a3.y, a6);
}

+ (id)p_hitRep:(CGPoint)a3 withPrecision:(BOOL)a4 inTopLevelReps:(id)a5 smallRepOutset:(double)a6 unscaledPointTransformForRep:(id)a7 passingTest:(id)a8
{
  double y;
  double x;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  double v28;
  _BOOL8 v29;
  void *j;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  BOOL v35;
  id v36;
  void *v37;
  id v38;
  id v40;
  _BOOL4 v41;
  id obj;
  double v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];

  v41 = a4;
  y = a3.y;
  x = a3.x;
  v14 = a5;
  v15 = a7;
  v16 = a8;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "reverseObjectEnumerator"));
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v49;
    while (2)
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(_QWORD *)v49 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i);
        objc_msgSend(a1, "p_transformedUnscaledPoint:forTestingHitRep:withTransformFromBlock:", v22, v15, x, y);
        objc_msgSend(v22, "convertNaturalPointFromUnscaledCanvas:");
        v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "hitRepChrome:passingTest:", v16));
        if (v23)
        {
          v32 = (void *)v23;
          goto LABEL_34;
        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
      if (v19)
        continue;
      break;
    }
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v40 = v14;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "reverseObjectEnumerator"));
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
  if (!v25)
  {

    v17 = 0;
    v32 = 0;
LABEL_33:
    v14 = v40;
    goto LABEL_34;
  }
  v26 = v25;
  v17 = 0;
  v27 = *(_QWORD *)v45;
  v28 = INFINITY;
  v29 = v41;
  obj = v24;
  while (2)
  {
    for (j = 0; j != v26; j = (char *)j + 1)
    {
      if (*(_QWORD *)v45 != v27)
        objc_enumerationMutation(obj);
      v31 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)j);
      objc_msgSend(a1, "p_transformedUnscaledPoint:forTestingHitRep:withTransformFromBlock:", v31, v15, x, y);
      objc_msgSend(v31, "convertNaturalPointFromUnscaledCanvas:");
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "hitRep:withPrecision:passingTest:", v29, v16));
      if (v32)
      {
        v37 = obj;
        goto LABEL_28;
      }
      if ((objc_msgSend(v31, "shouldHitTestChildrenLikeTopLevelReps") & 1) == 0)
      {
        objc_msgSend(v31, "convertNaturalPointFromUnscaledCanvas:", x, y);
        v43 = v28;
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "i_smallHitRepNearPoint:smallRepOutset:forShortestDistance:unscaledPointTransformForRep:passingTest:", &v43, v15, v16));
        v34 = v33;
        if (v33)
          v35 = v43 < v28;
        else
          v35 = 0;
        if (v35)
        {
          v36 = v33;

          v28 = v43;
          v17 = v36;
          v29 = v41;
        }

      }
    }
    v37 = obj;
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    if (v26)
      continue;
    break;
  }
LABEL_28:

  if (!v17)
    goto LABEL_33;
  v14 = v40;
  if ((objc_msgSend(v32, "i_shouldCountAsClosestSmallRepForSizeLimit:", a6) & 1) == 0)
  {
    objc_msgSend(a1, "p_transformedUnscaledPoint:forTestingHitRep:withTransformFromBlock:", v32, v15, x, y);
    LOBYTE(v43) = 0;
    objc_msgSend(v32, "convertNaturalPointFromUnscaledCanvas:");
    objc_msgSend(v32, "shortestDistanceToPoint:countAsHit:", &v43);
    if (!LOBYTE(v43))
    {
      v38 = v17;

      v32 = v38;
    }
  }
LABEL_34:

  return v32;
}

+ (CGPoint)p_transformedUnscaledPoint:(CGPoint)a3 forTestingHitRep:(id)a4 withTransformFromBlock:(id)a5
{
  double y;
  double x;
  double v7;
  double v8;
  double v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  if (a4 && a5)
  {
    v11 = 0u;
    v12 = 0u;
    v10 = 0u;
    (*((void (**)(__int128 *__return_ptr, id, id))a5 + 2))(&v10, a5, a4);
    v7 = y * *((double *)&v11 + 1) + *((double *)&v10 + 1) * x;
    x = *(double *)&v12 + y * *(double *)&v11 + *(double *)&v10 * x;
    y = *((double *)&v12 + 1) + v7;
  }
  v8 = x;
  v9 = y;
  result.y = v9;
  result.x = v8;
  return result;
}

- (void)i_performBlockWhileIgnoringClickThrough:(id)a3
{
  BOOL mIgnoringClickThrough;

  mIgnoringClickThrough = self->mIgnoringClickThrough;
  self->mIgnoringClickThrough = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->mIgnoringClickThrough = mIgnoringClickThrough;
}

- (BOOL)i_shouldIgnoreClickThrough
{
  return self->mIgnoringClickThrough;
}

- (void)i_registerRep:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (v4 && self->mRepsByLayout)
  {
    v6 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layout"));
    if (v5)
      -[NSMapTable setObject:forKey:](self->mRepsByLayout, "setObject:forKey:", v6, v5);

    v4 = v6;
  }

}

- (void)i_unregisterRep:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  if (v4 && self->mRepsByLayout)
  {
    v7 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layout"));
    if (v5)
    {
      v6 = (id)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->mRepsByLayout, "objectForKey:", v5));

      if (v6 == v7)
        -[NSMapTable removeObjectForKey:](self->mRepsByLayout, "removeObjectForKey:", v5);
    }

    v4 = v7;
  }

}

- (BOOL)i_areContentLayersInvalidForRep:(id)a3
{
  if (self->mInvalidFlags.allContentAndOverlayLayers)
    return 1;
  else
    return -[NSMutableSet containsObject:](self->mRepsWithInvalidContentLayers, "containsObject:", a3);
}

- (BOOL)i_areOverlayLayersInvalidForRep:(id)a3
{
  if (self->mInvalidFlags.allContentAndOverlayLayers)
    return 1;
  else
    return -[NSMutableSet containsObject:](self->mRepsWithInvalidOverlayLayers, "containsObject:", a3);
}

- (CGRect)i_approximateScaledFrameOfEditingMenuAtPoint:(CGPoint)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = sub_10005FD98(a3.x, a3.y + -30.0, 200.0);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)i_clipRectForCreatingRepsFromLayouts
{
  CRLCanvasDelegate **p_mDelegate;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;
  double v9;
  double x;
  double v11;
  double y;
  double v13;
  double width;
  double v15;
  double height;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  p_mDelegate = &self->mDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  if (WeakRetained
    && (v5 = WeakRetained,
        v6 = objc_loadWeakRetained((id *)p_mDelegate),
        v7 = objc_opt_respondsToSelector(v6, "visibleScaledBoundsForClippingRepsOnCanvas:"),
        v6,
        v5,
        (v7 & 1) != 0))
  {
    v8 = objc_loadWeakRetained((id *)p_mDelegate);
    objc_msgSend(v8, "visibleScaledBoundsForClippingRepsOnCanvas:", self);
    x = v9;
    y = v11;
    width = v13;
    height = v15;

  }
  else
  {
    x = CGRectInfinite.origin.x;
    y = CGRectInfinite.origin.y;
    width = CGRectInfinite.size.width;
    height = CGRectInfinite.size.height;
  }
  -[CRLCanvas convertBoundsToUnscaledRect:](self, "convertBoundsToUnscaledRect:", x, y, width, height);
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)i_drawBackgroundInContext:(CGContext *)a3
{
  CGRect ClipBoundingBox;
  CGRect v6;

  ClipBoundingBox = CGContextGetClipBoundingBox(a3);
  v6 = CGRectIntegral(ClipBoundingBox);
  -[CRLCanvas i_drawBackgroundInContext:bounds:](self, "i_drawBackgroundInContext:bounds:", a3, v6.origin.x, v6.origin.y, v6.size.width, v6.size.height);
}

- (void)i_drawBackgroundInContext:(CGContext *)a3 bounds:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect v10;

  if (self->mBackgroundColor)
  {
    height = a4.size.height;
    width = a4.size.width;
    y = a4.origin.y;
    x = a4.origin.x;
    CGContextSaveGState(a3);
    CGContextSetFillColorWithColor(a3, -[CRLColor CGColor](self->mBackgroundColor, "CGColor"));
    v10.origin.x = x;
    v10.origin.y = y;
    v10.size.width = width;
    v10.size.height = height;
    CGContextFillRect(a3, v10);
    CGContextRestoreGState(a3);
  }
}

- (void)addBitmapsToRenderingQualityInfo:(id)a3 inContext:(CGContext *)a4
{
  id v6;
  NSArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v6 = a3;
  if (v6)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->mTopLevelReps;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "recursivelyPerformSelector:withObject:withObject:", "addBitmapsToRenderingQualityInfo:inContext:", v6, a4, (_QWORD)v12);
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

- (void)i_drawRepsInContext:(CGContext *)a3 passingTest:(id)a4 distort:(CGAffineTransform *)a5
{
  unsigned int (**v8)(id, _QWORD);
  _BOOL4 v9;
  NSArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  id v17;
  void *v18;
  NSSet *v19;
  NSSet *mPreviousRenderDatasNeedingDownload;
  CGAffineTransform v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v8 = (unsigned int (**)(id, _QWORD))a4;
  if (a3)
  {
    CGContextSaveGState(a3);
    CGContextScaleCTM(a3, self->mViewScale, self->mViewScale);
    v9 = a5->b == 0.0
      && a5->c == 0.0
      && a5->tx == 0.0
      && a5->ty == 0.0
      && fabs(a5->a + -1.0) < 0.001
      && fabs(a5->d + -1.0) < 0.001;
    sub_100412470(a3);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v10 = self->mTopLevelReps;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v23;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v14);
          if (!v8 || v8[2](v8, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v14)))
          {
            CGContextSaveGState(a3);
            if (!v9 || objc_msgSend(v15, "wantsToDistortWithImagerContext"))
            {
              v16 = *(_OWORD *)&a5->c;
              *(_OWORD *)&v21.a = *(_OWORD *)&a5->a;
              *(_OWORD *)&v21.c = v16;
              *(_OWORD *)&v21.tx = *(_OWORD *)&a5->tx;
              CGContextConcatCTM(a3, &v21);
            }
            objc_msgSend(v15, "recursivelyDrawInContext:keepingChildrenPassingTest:", a3, v8);
            CGContextRestoreGState(a3);
          }
          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v12);
    }

    v17 = sub_100412A38(a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = (NSSet *)objc_msgSend(v18, "copy");
    mPreviousRenderDatasNeedingDownload = self->mPreviousRenderDatasNeedingDownload;
    self->mPreviousRenderDatasNeedingDownload = v19;

    CGContextRestoreGState(a3);
  }

}

- (void)i_drawRepsInContext:(CGContext *)a3 passingTest:(id)a4
{
  __int128 v4;
  _OWORD v5[3];

  v4 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v5[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v5[1] = v4;
  v5[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  -[CRLCanvas i_drawRepsInContext:passingTest:distort:](self, "i_drawRepsInContext:passingTest:distort:", a3, a4, v5);
}

- (CGImage)i_image
{
  return -[CRLCanvas i_imageInScaledRect:keepingChildrenPassingTest:](self, "i_imageInScaledRect:keepingChildrenPassingTest:", 0, CGRectInfinite.origin.x, CGRectInfinite.origin.y, CGRectInfinite.size.width, CGRectInfinite.size.height);
}

- (CGImage)i_imageInScaledRect:(CGRect)a3 keepingChildrenPassingTest:(id)a4
{
  return -[CRLCanvas i_imageInScaledRect:withTargetIntegralSize:distortedToMatch:keepingChildrenPassingTest:](self, "i_imageInScaledRect:withTargetIntegralSize:distortedToMatch:keepingChildrenPassingTest:", 0, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, CGSizeZero.width, CGSizeZero.height);
}

- (CGImage)i_imageInScaledRect:(CGRect)a3 withTargetIntegralSize:(CGSize)a4 distortedToMatch:(BOOL)a5 keepingChildrenPassingTest:(id)a6
{
  _BOOL8 v6;
  double height;
  double width;
  double v9;
  double v10;
  double y;
  double x;
  id v14;
  CGContext *v15;
  CGContext *v16;
  CGImage *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;

  v6 = a5;
  height = a4.height;
  width = a4.width;
  v9 = a3.size.height;
  v10 = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14 = a6;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v15 = -[CRLCanvas i_createContextToDrawImageInScaledRect:withTargetIntegralSize:distortedToMatch:returningBounds:integralBounds:](self, "i_createContextToDrawImageInScaledRect:withTargetIntegralSize:distortedToMatch:returningBounds:integralBounds:", v6, &v21, &v19, x, y, v10, v9, width, height);
  if (v15)
  {
    v16 = v15;
    v17 = -[CRLCanvas i_newImageInContext:bounds:integralBounds:distortedToMatch:keepingChildrenPassingTest:](self, "i_newImageInContext:bounds:integralBounds:distortedToMatch:keepingChildrenPassingTest:", v15, v6, v14, v21, v22, v19, v20);
    CGContextRelease(v16);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (CGContext)i_createContextToDrawImageInScaledRect:(CGRect)a3 withTargetIntegralSize:(CGSize)a4 distortedToMatch:(BOOL)a5 returningBounds:(CGRect *)a6 integralBounds:(CGRect *)a7
{
  double height;
  double width;
  double v12;
  double v13;
  double y;
  double x;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  _BOOL4 v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CRLColor *mBackgroundColor;
  double v33;
  char v34;
  double v35;
  double v36;
  double v37;
  CGContext *v38;
  double v39;
  CGFloat v40;
  CGFloat v41;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  CGRect v47;

  height = a4.height;
  width = a4.width;
  v12 = a3.size.height;
  v13 = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17 = sub_100063148(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v43 = v18;
  v45 = v17;
  v20 = v19;
  v22 = v21;
  if (width <= 0.0 || height <= 0.0)
    goto LABEL_16;
  v23 = sub_100063090(width);
  if (a5)
  {
    v20 = v23;
LABEL_15:
    v22 = v24;
    goto LABEL_16;
  }
  v25 = v20 - v23;
  v26 = v22 - v24;
  if (v20 - v23 > 0.0 || v26 > 0.0)
  {
    if (v25 > 0.0)
      v20 = v23;
    if (v26 > 0.0)
      goto LABEL_15;
  }
  else if (v25 < 0.0 && v26 < 0.0)
  {
    if (v25 <= v26)
      v22 = v24;
    else
      v20 = v23;
  }
LABEL_16:
  v27 = sub_10005FF70(x, y, v13, v12, v45, v43, v20, v22);
  if (v27)
    v28 = v45;
  else
    v28 = x;
  if (v27)
    v29 = v43;
  else
    v29 = y;
  if (v27)
    v30 = v20;
  else
    v30 = v13;
  if (v27)
    v31 = v22;
  else
    v31 = v12;
  if (v27)
  {
    x = v45;
    y = v43;
    v13 = v20;
    v12 = v22;
  }
  v47.origin.x = v45;
  v47.origin.y = v43;
  v47.size.width = v20;
  v47.size.height = v22;
  if (CGRectEqualToRect(*(CGRect *)&v28, v47)
    && (mBackgroundColor = self->mBackgroundColor) != 0
    && (-[CRLColor alphaComponent](mBackgroundColor, "alphaComponent"), v33 == 1.0))
  {
    v34 = 1;
  }
  else
  {
    v34 = 3;
  }
  if (-[CRLCanvas canvasIsWideGamut](self, "canvasIsWideGamut", *(_QWORD *)&v43, *(_QWORD *)&v45))
    v34 |= 0x20u;
  -[CRLCanvas contentsScale](self, "contentsScale");
  v36 = sub_1000603DC(v20, v22, v35);
  v38 = sub_10040FA64(v34, v36, v37);
  -[CRLCanvas contentsScale](self, "contentsScale");
  v40 = v39;
  -[CRLCanvas contentsScale](self, "contentsScale");
  CGContextScaleCTM(v38, v40, v41);
  if (a6)
  {
    a6->origin.x = x;
    a6->origin.y = y;
    a6->size.width = v13;
    a6->size.height = v12;
  }
  if (a7)
  {
    a7->origin.x = v46;
    a7->origin.y = v44;
    a7->size.width = v20;
    a7->size.height = v22;
  }
  return v38;
}

- (CGImage)i_newImageInContext:(CGContext *)a3 bounds:(CGRect)a4 integralBounds:(CGRect)a5 distortedToMatch:(BOOL)a6 keepingChildrenPassingTest:(id)a7
{
  _BOOL4 v7;
  double height;
  double width;
  double y;
  double x;
  double v12;
  double v13;
  id v16;
  __int128 v17;
  CGAffineTransform v19;
  CGAffineTransform v20;
  CGRect v21;

  if (!a3)
    return 0;
  v7 = a6;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v12 = a4.size.height;
  v13 = a4.size.width;
  v16 = a7;
  CGContextSaveGState(a3);
  CGContextTranslateCTM(a3, 0.0, height);
  CGContextScaleCTM(a3, 1.0, -1.0);
  CGContextTranslateCTM(a3, -x, -y);
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  CGContextClipToRect(a3, v21);
  v17 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v20.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v20.c = v17;
  *(_OWORD *)&v20.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  if (v7)
    CGAffineTransformMakeScale(&v20, width / v13, height / v12);
  -[CRLCanvas i_drawBackgroundInContext:](self, "i_drawBackgroundInContext:", a3);
  v19 = v20;
  -[CRLCanvas i_drawRepsInContext:passingTest:distort:](self, "i_drawRepsInContext:passingTest:distort:", a3, v16, &v19);

  CGContextRestoreGState(a3);
  return CGBitmapContextCreateImage(a3);
}

- (CGRect)p_bounds
{
  double v3;
  double top;
  double left;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  v3 = sub_10005FDDC();
  top = self->mContentInset.top;
  left = self->mContentInset.left;
  v6 = v3 + left;
  v8 = top + v7;
  v10 = v9 - (left + self->mContentInset.right);
  v12 = v11 - (top + self->mContentInset.bottom);
  result.size.height = v12;
  result.size.width = v10;
  result.origin.y = v8;
  result.origin.x = v6;
  return result;
}

- (void)p_layoutWithReadLock
{
  _BOOL8 v3;
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  _BOOL4 layout;
  id v14;
  char v15;
  id v16;
  void *v17;
  id v18;
  char v19;
  id v20;
  id v21;
  char v22;
  id v23;
  unsigned __int8 v24;
  id v25;
  char v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  void *i;
  unsigned int v32;
  int v33;
  id v34;
  char v35;
  id v36;
  id v37;
  char v38;
  id v39;
  uint64_t v40;
  void *v41;
  NSMutableArray *mBlocksToPerformAfterLayout;
  NSMutableArray *mBlocksToPerformAfterLayoutAndLayerUpdating;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];

  if (self->mInLayout)
    return;
  self->mInLayout = 1;
  v3 = -[CRLCanvas crlaxIsPreventingReloadingChildren](self, "crlaxIsPreventingReloadingChildren");
  -[CRLCanvas crlaxPreventReloadingChildren](self, "crlaxPreventReloadingChildren");
  WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  v11 = sub_100221DDC(WeakRetained, 1, v5, v6, v7, v8, v9, v10, (uint64_t)&OBJC_PROTOCOL___CRLDynamicCanvasDelegate);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  if ((objc_opt_respondsToSelector(v12, "i_canvasWillLayout:") & 1) != 0)
    objc_msgSend(v12, "i_canvasWillLayout:", self);
  layout = self->mInvalidFlags.layout;
  if (self->mInvalidFlags.layout)
  {
    v14 = objc_loadWeakRetained((id *)&self->mDelegate);
    v15 = objc_opt_respondsToSelector(v14, "canvasWillValidateLayouts:");

    if ((v15 & 1) != 0)
    {
      v16 = objc_loadWeakRetained((id *)&self->mDelegate);
      objc_msgSend(v16, "canvasWillValidateLayouts:", self);

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvas layoutController](self, "layoutController"));
    objc_msgSend(v17, "validateLayouts");

    v18 = objc_loadWeakRetained((id *)&self->mDelegate);
    v19 = objc_opt_respondsToSelector(v18, "canvasDidValidateLayouts:");

    if ((v19 & 1) != 0)
    {
      v20 = objc_loadWeakRetained((id *)&self->mDelegate);
      objc_msgSend(v20, "canvasDidValidateLayouts:", self);

    }
LABEL_11:
    v21 = objc_loadWeakRetained((id *)&self->mDelegate);
    v22 = objc_opt_respondsToSelector(v21, "canvasWillUpdateRepsFromLayouts:");

    if ((v22 & 1) != 0)
    {
      v23 = objc_loadWeakRetained((id *)&self->mDelegate);
      objc_msgSend(v23, "canvasWillUpdateRepsFromLayouts:", self);

    }
    v24 = -[CRLCanvas p_updateRepsFromLayouts](self, "p_updateRepsFromLayouts");
    *(_WORD *)&self->mInvalidFlags.reps = 0;
    v25 = objc_loadWeakRetained((id *)&self->mDelegate);
    v26 = objc_opt_respondsToSelector(v25, "canvasDidUpdateRepsFromLayouts:");

    if ((v26 & 1) != 0)
    {
      v27 = objc_loadWeakRetained((id *)&self->mDelegate);
      objc_msgSend(v27, "canvasDidUpdateRepsFromLayouts:", self);

    }
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v28 = -[NSHashTable copy](self->mCanvasLayoutObservers, "copy");
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    if (v29)
    {
      v30 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v29; i = (char *)i + 1)
        {
          if (*(_QWORD *)v45 != v30)
            objc_enumerationMutation(v28);
          objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i), "canvasDidUpdateReps:", self);
        }
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      }
      while (v29);
    }

    if (layout)
      goto LABEL_25;
    goto LABEL_23;
  }
  if (self->mInvalidFlags.reps || self->mInvalidFlags.visibleBounds)
    goto LABEL_11;
  v24 = 0;
  if (self->mInvalidFlags.layout)
    goto LABEL_25;
LABEL_23:
  if ((v24 & 1) == 0 && !self->mInvalidFlags.layers)
  {
    v40 = 0;
    goto LABEL_38;
  }
LABEL_25:
  v32 = -[CRLCanvas p_canvasShouldAlwaysUpdateLayers](self, "p_canvasShouldAlwaysUpdateLayers");
  if (self->mShouldUpdateLayersDuringLayout)
    v33 = 1;
  else
    v33 = v32;
  if (v33 == 1)
  {
    if (-[CRLCanvas isCanvasInteractive](self, "isCanvasInteractive"))
    {
      v34 = objc_loadWeakRetained((id *)&self->mDelegate);
      v35 = objc_opt_respondsToSelector(v34, "updateLayerTreeForInteractiveCanvas:");

      if ((v35 & 1) != 0)
      {
        v36 = objc_loadWeakRetained((id *)&self->mDelegate);
        objc_msgSend(v36, "updateLayerTreeForInteractiveCanvas:", self);

      }
    }
    *(_WORD *)&self->mInvalidFlags.layers = 0;
    -[NSMutableSet removeAllObjects](self->mRepsWithInvalidContentLayers, "removeAllObjects");
    -[NSMutableSet removeAllObjects](self->mRepsWithInvalidOverlayLayers, "removeAllObjects");
    if (!layout)
      goto LABEL_37;
    goto LABEL_35;
  }
  self->mInvalidFlags.layers = 1;
  if (layout)
  {
LABEL_35:
    v37 = objc_loadWeakRetained((id *)&self->mDelegate);
    v38 = objc_opt_respondsToSelector(v37, "canvasDidLayout:");

    if ((v38 & 1) != 0)
    {
      v39 = objc_loadWeakRetained((id *)&self->mDelegate);
      objc_msgSend(v39, "canvasDidLayout:", self);

    }
  }
LABEL_37:
  v40 = 1;
LABEL_38:
  self->mInvalidFlags.layout = 0;

  self->mInLayout = 0;
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  os_unfair_lock_lock(&self->mBlocksToPerformLock);
  if (self->mBlocksToPerformAfterLayout)
  {
    objc_msgSend(v41, "addObjectsFromArray:");
    mBlocksToPerformAfterLayout = self->mBlocksToPerformAfterLayout;
    self->mBlocksToPerformAfterLayout = 0;

  }
  if (self->mBlocksToPerformAfterLayoutAndLayerUpdating)
  {
    if (!self->mInvalidFlags.layers)
    {
      objc_msgSend(v41, "addObjectsFromArray:");
      mBlocksToPerformAfterLayoutAndLayerUpdating = self->mBlocksToPerformAfterLayoutAndLayerUpdating;
      self->mBlocksToPerformAfterLayoutAndLayerUpdating = 0;

    }
  }
  os_unfair_lock_unlock(&self->mBlocksToPerformLock);
  objc_msgSend(v41, "makeObjectsPerformSelector:", "invoke");

  -[CRLCanvas crlaxRevertReloadingChildrenTo:andReloadForChanges:](self, "crlaxRevertReloadingChildrenTo:andReloadForChanges:", v3, v40);
}

- (BOOL)p_updateRepsFromLayouts
{
  CRLInteractiveCanvasController **p_mCanvasController;
  id WeakRetained;
  CFArrayRef (__cdecl **v5)(CTFontDescriptorRef, CFSetRef);
  void *v6;
  id v7;
  unsigned int v8;
  NSArray *v9;
  BOOL v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  id v21;
  char v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *i;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  char v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  void *j;
  void *v44;
  void *v45;
  unsigned int v46;
  id v47;
  id v48;
  id v49;
  uint64_t v50;
  void *k;
  void *v52;
  id v53;
  id v54;
  id v55;
  uint64_t v56;
  void *m;
  uint64_t v58;
  uint64_t v59;
  NSSet *v60;
  id v61;
  id v62;
  uint64_t v63;
  void *n;
  void *v65;
  id v66;
  NSSet *v67;
  id v68;
  id v69;
  uint64_t v70;
  void *ii;
  void *v72;
  id v73;
  char v74;
  NSSet *v75;
  id v76;
  id v77;
  uint64_t v78;
  void *jj;
  uint64_t v80;
  id v81;
  NSSet *mAllReps;
  NSSet *v83;
  NSArray *mTopLevelReps;
  NSArray *v85;
  NSArray *mAllRepsOrdered;
  NSArray *v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  _BYTE v117[128];
  _BYTE v118[128];
  _BYTE v119[128];
  _BYTE v120[128];
  _BYTE v121[128];
  _BYTE v122[128];
  _BYTE v123[128];

  p_mCanvasController = &self->mCanvasController;
  WeakRetained = objc_loadWeakRetained((id *)&self->mCanvasController);
  v5 = &CTFontDescriptorCreateMatchingFontDescriptors_ptr;
  if (!WeakRetained
    || (v6 = WeakRetained,
        v7 = objc_loadWeakRetained((id *)p_mCanvasController),
        v8 = objc_msgSend(v7, "i_currentlySuppressingLayerUpdates"),
        v7,
        v6,
        !v8))
  {
    -[CRLCanvas i_clipRectForCreatingRepsFromLayouts](self, "i_clipRectForCreatingRepsFromLayouts");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvas layoutController](self, "layoutController"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "layoutsInRect:", v12, v14, v16, v18));

    v21 = objc_loadWeakRetained((id *)&self->mDelegate);
    v22 = objc_opt_respondsToSelector(v21, "additionalVisibleInfosForCanvas:");

    if ((v22 & 1) != 0)
    {
      v23 = objc_loadWeakRetained((id *)&self->mDelegate);
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "additionalVisibleInfosForCanvas:", self));

      v115 = 0u;
      v116 = 0u;
      v113 = 0u;
      v114 = 0u;
      v25 = v24;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v113, v123, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v114;
        do
        {
          for (i = 0; i != v27; i = (char *)i + 1)
          {
            if (*(_QWORD *)v114 != v28)
              objc_enumerationMutation(v25);
            v30 = sub_1000664C4(*(void **)(*((_QWORD *)&v113 + 1) + 8 * (_QWORD)i));
            v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
            v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayoutController layoutForInfo:](self->mLayoutController, "layoutForInfo:", v31));
            if (v32 && (objc_msgSend(v20, "containsObject:", v32) & 1) == 0)
            {
              v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "arrayByAddingObject:", v32));

              v20 = (void *)v33;
            }

          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v113, v123, 16);
        }
        while (v27);
      }

      v5 = &CTFontDescriptorCreateMatchingFontDescriptors_ptr;
    }
    v34 = objc_loadWeakRetained((id *)&self->mDelegate);
    v35 = objc_opt_respondsToSelector(v34, "infosToHideForCanvas:");

    if ((v35 & 1) != 0)
    {
      v36 = objc_loadWeakRetained((id *)&self->mDelegate);
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "infosToHideForCanvas:", self));

      if (objc_msgSend(v37, "count"))
      {
        v38 = objc_msgSend(v20, "mutableCopy");
        v109 = 0u;
        v110 = 0u;
        v111 = 0u;
        v112 = 0u;
        v39 = v20;
        v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v109, v122, 16);
        if (v40)
        {
          v41 = v40;
          v42 = *(_QWORD *)v110;
          do
          {
            for (j = 0; j != v41; j = (char *)j + 1)
            {
              if (*(_QWORD *)v110 != v42)
                objc_enumerationMutation(v39);
              v44 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * (_QWORD)j);
              v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "info"));
              v46 = objc_msgSend(v37, "containsObject:", v45);

              if (v46)
                objc_msgSend(v38, "removeObject:", v44);
            }
            v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v109, v122, 16);
          }
          while (v41);
        }

        v20 = v38;
        v5 = &CTFontDescriptorCreateMatchingFontDescriptors_ptr;
      }

    }
    v47 = objc_alloc_init((Class)v5[413]);
    v105 = 0u;
    v106 = 0u;
    v107 = 0u;
    v108 = 0u;
    v9 = v20;
    v48 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v105, v121, 16);
    if (v48)
    {
      v49 = v48;
      v50 = *(_QWORD *)v106;
      do
      {
        for (k = 0; k != v49; k = (char *)k + 1)
        {
          if (*(_QWORD *)v106 != v50)
            objc_enumerationMutation(v9);
          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v105 + 1) + 8 * (_QWORD)k), "additionalLayoutsForRepCreation"));
          objc_msgSend(v47, "addObjectsFromArray:", v52);

        }
        v49 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v105, v121, 16);
      }
      while (v49);
    }

    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
    v53 = v47;
    v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v101, v120, 16);
    if (v54)
    {
      v55 = v54;
      v56 = *(_QWORD *)v102;
      do
      {
        for (m = 0; m != v55; m = (char *)m + 1)
        {
          if (*(_QWORD *)v102 != v56)
            objc_enumerationMutation(v53);
          v58 = *(_QWORD *)(*((_QWORD *)&v101 + 1) + 8 * (_QWORD)m);
          if (!-[NSArray containsObject:](v9, "containsObject:", v58))
          {
            v59 = objc_claimAutoreleasedReturnValue(-[NSArray arrayByAddingObject:](v9, "arrayByAddingObject:", v58));

            v9 = (NSArray *)v59;
          }
        }
        v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v101, v120, 16);
      }
      while (v55);
    }

    if (!self->mInvalidFlags.layout
      && !self->mInvalidFlags.reps
      && -[NSArray isEqualToArray:](v9, "isEqualToArray:", self->mPreviouslyVisibleLayouts))
    {
      v10 = 0;
LABEL_84:

      return v10;
    }
    objc_storeStrong((id *)&self->mPreviouslyVisibleLayouts, v9);

LABEL_51:
    v88 = (NSArray *)objc_alloc_init((Class)v5[413]);
    v60 = (NSSet *)objc_alloc_init((Class)NSMutableSet);
    v97 = 0u;
    v98 = 0u;
    v99 = 0u;
    v100 = 0u;
    v9 = v9;
    v61 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v97, v119, 16);
    if (v61)
    {
      v62 = v61;
      v63 = *(_QWORD *)v98;
      do
      {
        for (n = 0; n != v62; n = (char *)n + 1)
        {
          if (*(_QWORD *)v98 != v63)
            objc_enumerationMutation(v9);
          v65 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * (_QWORD)n);
          v66 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvas repForLayout:](self, "repForLayout:", v65));
          if (!v66)
          {
            v66 = objc_msgSend(objc_alloc((Class)objc_msgSend(v65, "repClassOverride")), "initWithLayout:canvas:", v65, self);
            if (!v66)
              continue;
          }
          objc_msgSend(v66, "setParentRep:", 0);
          -[NSArray addObject:](v88, "addObject:", v66);
          objc_msgSend(v66, "updateChildrenFromLayout");
          objc_msgSend(v66, "recursivelyPerformSelector:", "updateFromLayout");
          objc_msgSend(v66, "recursivelyPerformSelector:withObject:", "addToSet:", v60);

        }
        v62 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v97, v119, 16);
      }
      while (v62);
    }

    v95 = 0u;
    v96 = 0u;
    v93 = 0u;
    v94 = 0u;
    v67 = self->mAllReps;
    v68 = -[NSSet countByEnumeratingWithState:objects:count:](v67, "countByEnumeratingWithState:objects:count:", &v93, v118, 16);
    if (v68)
    {
      v69 = v68;
      v70 = *(_QWORD *)v94;
      do
      {
        for (ii = 0; ii != v69; ii = (char *)ii + 1)
        {
          if (*(_QWORD *)v94 != v70)
            objc_enumerationMutation(v67);
          v72 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * (_QWORD)ii);
          if (!-[NSSet containsObject:](v60, "containsObject:", v72))
            objc_msgSend(v72, "i_willBeRemoved");
        }
        v69 = -[NSSet countByEnumeratingWithState:objects:count:](v67, "countByEnumeratingWithState:objects:count:", &v93, v118, 16);
      }
      while (v69);
    }

    v73 = objc_loadWeakRetained((id *)&self->mDelegate);
    v74 = objc_opt_respondsToSelector(v73, "canvas:createdRep:");

    if ((v74 & 1) != 0)
    {
      v91 = 0u;
      v92 = 0u;
      v89 = 0u;
      v90 = 0u;
      v75 = v60;
      v76 = -[NSSet countByEnumeratingWithState:objects:count:](v75, "countByEnumeratingWithState:objects:count:", &v89, v117, 16);
      if (v76)
      {
        v77 = v76;
        v78 = *(_QWORD *)v90;
        do
        {
          for (jj = 0; jj != v77; jj = (char *)jj + 1)
          {
            if (*(_QWORD *)v90 != v78)
              objc_enumerationMutation(v75);
            v80 = *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * (_QWORD)jj);
            if (!-[NSSet containsObject:](self->mAllReps, "containsObject:", v80))
            {
              v81 = objc_loadWeakRetained((id *)&self->mDelegate);
              objc_msgSend(v81, "canvas:createdRep:", self, v80);

            }
          }
          v77 = -[NSSet countByEnumeratingWithState:objects:count:](v75, "countByEnumeratingWithState:objects:count:", &v89, v117, 16);
        }
        while (v77);
      }

    }
    -[CRLCanvas orderRepsForLayout:](self, "orderRepsForLayout:", v88);
    v53 = (id)objc_claimAutoreleasedReturnValue(-[NSSet crl_setBySubtractingSet:](v60, "crl_setBySubtractingSet:", self->mAllReps));
    if (objc_msgSend(v53, "count"))
    {
      -[NSMutableSet unionSet:](self->mRepsWithInvalidContentLayers, "unionSet:", v53);
      -[NSMutableSet unionSet:](self->mRepsWithInvalidOverlayLayers, "unionSet:", v53);
    }
    mAllReps = self->mAllReps;
    self->mAllReps = v60;
    v83 = v60;

    mTopLevelReps = self->mTopLevelReps;
    self->mTopLevelReps = v88;
    v85 = v88;

    mAllRepsOrdered = self->mAllRepsOrdered;
    self->mAllRepsOrdered = 0;

    v10 = 1;
    goto LABEL_84;
  }
  v9 = self->mPreviouslyVisibleLayouts;
  if (v9)
    goto LABEL_51;
  return 0;
}

- (void)orderRepsForLayout:(id)a3
{
  Block_layout *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  id v8;

  v8 = a3;
  if (+[CRLFeatureFlagGroup isThreeDimensionalObjectsEnabled](_TtC8Freeform19CRLFeatureFlagGroup, "isThreeDimensionalObjectsEnabled"))
  {
    v4 = &stru_101261258;
    v5 = v8;
LABEL_5:
    objc_msgSend(v5, "sortUsingComparator:", v4);
    v7 = v8;
    goto LABEL_6;
  }
  v6 = -[CRLCanvas isCanvasInteractive](self, "isCanvasInteractive");
  v7 = v8;
  if (v6)
  {
    v4 = &stru_101261278;
    v5 = v8;
    goto LABEL_5;
  }
LABEL_6:

}

- (void)p_removeAllReps
{
  NSSet *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSSet *v8;
  NSSet *mAllReps;
  NSArray *v10;
  NSArray *mTopLevelReps;
  NSArray *mAllRepsOrdered;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = self->mAllReps;
  v4 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v7), "i_willBeRemoved", (_QWORD)v13);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  v8 = (NSSet *)objc_alloc_init((Class)NSSet);
  mAllReps = self->mAllReps;
  self->mAllReps = v8;

  v10 = (NSArray *)objc_alloc_init((Class)NSArray);
  mTopLevelReps = self->mTopLevelReps;
  self->mTopLevelReps = v10;

  mAllRepsOrdered = self->mAllRepsOrdered;
  self->mAllRepsOrdered = 0;

  -[NSMutableSet removeAllObjects](self->mRepsWithInvalidContentLayers, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->mRepsWithInvalidOverlayLayers, "removeAllObjects");
}

- (NSArray)allRepsOrdered
{
  NSArray *mAllRepsOrdered;
  void *v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  double v12;
  id v13;
  NSArray *v14;
  NSArray *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  mAllRepsOrdered = self->mAllRepsOrdered;
  if (!mAllRepsOrdered)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v5 = self->mTopLevelReps;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v8 = v6;
      v9 = *(_QWORD *)v18;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v5);
          v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v10);
          *(_QWORD *)&v12 = objc_opt_class(self, v7).n128_u64[0];
          objc_msgSend(v13, "p_recursivelyAddOrderedChildrenOfRep:toArray:", v11, v4, v12, (_QWORD)v17);
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);
    }

    v14 = (NSArray *)objc_msgSend(v4, "copy");
    v15 = self->mAllRepsOrdered;
    self->mAllRepsOrdered = v14;

    mAllRepsOrdered = self->mAllRepsOrdered;
  }
  return mAllRepsOrdered;
}

- (CGRect)unscaledRectOfLayouts
{
  void *v2;
  double v3;
  double v4;
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
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvas layoutController](self, "layoutController"));
  objc_msgSend(v2, "rectOfTopLevelLayouts");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

+ (void)p_recursivelyAddOrderedChildrenOfRep:(id)a3 toArray:(id)a4
{
  id v6;
  id v7;
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

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "addObject:", v6);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "childReps", 0));
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
        objc_msgSend(a1, "p_recursivelyAddOrderedChildrenOfRep:toArray:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v12), v7);
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (BOOL)i_InLayout
{
  return self->mInLayout;
}

- (NSSet)i_previousRenderDatasNeedingDownload
{
  return self->mPreviousRenderDatasNeedingDownload;
}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->mContentInset.top;
  left = self->mContentInset.left;
  bottom = self->mContentInset.bottom;
  right = self->mContentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->mContentInset = a3;
}

- (CRLCanvasDelegate)delegate
{
  return (CRLCanvasDelegate *)objc_loadWeakRetained((id *)&self->mDelegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->mDelegate, a3);
}

- (NSArray)infosToDisplay
{
  return self->mInfos;
}

- (NSArray)topLevelReps
{
  return self->mTopLevelReps;
}

- (NSSet)allReps
{
  return self->mAllReps;
}

- (CRLCanvasLayoutController)layoutController
{
  return self->mLayoutController;
}

- (BOOL)enableInstructionalText
{
  return self->mEnableInstructionalText;
}

- (BOOL)isAnchoredAtRight
{
  return self->mIsAnchoredAtRight;
}

- (void)setIsAnchoredAtRight:(BOOL)a3
{
  self->mIsAnchoredAtRight = a3;
}

- (CRLColor)backgroundColor
{
  return self->mBackgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (BOOL)allowsFontSubpixelQuantization
{
  return self->mAllowsFontSubpixelQuantization;
}

- (void)setAllowsFontSubpixelQuantization:(BOOL)a3
{
  self->mAllowsFontSubpixelQuantization = a3;
}

- (BOOL)suppressesShadowsAndReflections
{
  return self->mSuppressesShadowsAndReflections;
}

- (BOOL)suppressesShapeText
{
  return self->mSuppressesShapeText;
}

- (void)setSuppressesShapeText:(BOOL)a3
{
  self->mSuppressesShapeText = a3;
}

- (BOOL)shouldRenderInvisibleContentForNonInteractiveCanvas
{
  return self->mShouldRenderInvisibleContentForNonInteractiveCanvas;
}

- (void)setShouldRenderInvisibleContentForNonInteractiveCanvas:(BOOL)a3
{
  self->mShouldRenderInvisibleContentForNonInteractiveCanvas = a3;
}

- (double)i_viewScaleForAudioObjectsInNonInteractiveCanvas
{
  return self->i_viewScaleForAudioObjectsInNonInteractiveCanvas;
}

- (void)setI_viewScaleForAudioObjectsInNonInteractiveCanvas:(double)a3
{
  self->i_viewScaleForAudioObjectsInNonInteractiveCanvas = a3;
}

- (CGSize)unscaledSize
{
  double width;
  double height;
  CGSize result;

  width = self->mUnscaledSize.width;
  height = self->mUnscaledSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setUnscaledSize:(CGSize)a3
{
  self->mUnscaledSize = a3;
}

- (double)viewScale
{
  return self->mViewScale;
}

- (BOOL)isTemporaryForLayout
{
  return self->mIsTemporaryForLayout;
}

- (BOOL)i_inLayout
{
  return self->_i_inLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mPreviousRenderDatasNeedingDownload, 0);
  objc_storeStrong((id *)&self->mBackgroundColor, 0);
  objc_storeStrong((id *)&self->mCanvasLayoutObservers, 0);
  objc_storeStrong((id *)&self->mBlocksToPerformAfterLayoutAndLayerUpdating, 0);
  objc_storeStrong((id *)&self->mBlocksToPerformAfterLayout, 0);
  objc_storeStrong((id *)&self->mPreviouslyVisibleLayouts, 0);
  objc_storeStrong((id *)&self->mRepsWithInvalidOverlayLayers, 0);
  objc_storeStrong((id *)&self->mRepsWithInvalidContentLayers, 0);
  objc_storeStrong((id *)&self->mLayoutController, 0);
  objc_storeStrong((id *)&self->mRepsByLayout, 0);
  objc_storeStrong((id *)&self->mAllRepsOrdered, 0);
  objc_storeStrong((id *)&self->mAllReps, 0);
  objc_storeStrong((id *)&self->mTopLevelReps, 0);
  objc_storeStrong((id *)&self->mInfos, 0);
  objc_destroyWeak((id *)&self->mCanvasController);
  objc_destroyWeak((id *)&self->mDelegate);
}

- (id)textRendererForLayer:(id)a3 context:(CGContext *)a4
{
  id v7;
  CGContext *v8;
  CRLCanvas *v9;
  id v10;
  id result;
  id v12;

  v7 = objc_allocWithZone((Class)CRLWPRenderer);
  v8 = a4;
  v9 = self;
  v10 = a3;
  result = objc_msgSend(v7, "initWithContext:", v8);
  if (result)
  {
    v12 = result;

    return v12;
  }
  else
  {
    __break(1u);
  }
  return result;
}

@end
