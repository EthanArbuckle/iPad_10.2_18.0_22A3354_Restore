@implementation CRLPKDrawingProvider

- (CRLPKDrawingProvider)initWithICC:(id)a3
{
  id v4;
  CRLPKDrawingProvider *v5;
  CRLPKDrawingProvider *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *drawingParentIdsToShapeItemsBeingListenedTo;
  NSMutableSet *v9;
  NSMutableSet *uuidsForUnlockedDrawingItems;
  NSMutableDictionary *v11;
  NSMutableDictionary *shapeItemIdToParentItemId;
  NSMutableDictionary *v13;
  NSMutableDictionary *cachedPKStrokesForDrawingItems;
  NSMutableOrderedSet *v15;
  NSMutableOrderedSet *cachedPKStrokesForDrawingItemsOrderedKeys;
  NSMutableDictionary *v17;
  NSMutableDictionary *changedPKStrokesForDrawingItemIds;
  NSMutableSet *v19;
  NSMutableSet *drawingItemsNeedingUpdatedPKStrokes;
  NSMutableSet *v21;
  NSMutableSet *drawingItemsNeedingRemovedPKStrokes;
  NSMutableSet *v23;
  NSMutableSet *observers;
  NSMutableSet *v25;
  NSMutableSet *observersWantingConsolidatedPKDrawing;
  CRLBidirectionalMap *v27;
  CRLBidirectionalMap *cachedDrawingShapeItemUUIDToStrokeDataUUIDDict;
  CRLBidirectionalMap *v29;
  CRLBidirectionalMap *cachedDrawingShapeItemUUIDToStrokeUUIDDict;
  NSMutableDictionary *v31;
  NSMutableDictionary *updatedParentUUIDToDrawingShapeItemUUIDsDict;
  NSMutableDictionary *v33;
  NSMutableDictionary *strokeUUIDsToDrawingItems;
  NSMutableDictionary *v35;
  NSMutableDictionary *strokeUUIDsToDrawingShapeItems;
  NSMutableDictionary *v37;
  NSMutableDictionary *strokeUUIDsToStrokes;
  _TtC8Freeform25CRLLastSubmittedTaskQueue *v39;
  _TtC8Freeform25CRLLastSubmittedTaskQueue *taskQueue;
  objc_super v42;

  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)CRLPKDrawingProvider;
  v5 = -[CRLPKDrawingProvider init](&v42, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_icc, v4);
    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    drawingParentIdsToShapeItemsBeingListenedTo = v6->_drawingParentIdsToShapeItemsBeingListenedTo;
    v6->_drawingParentIdsToShapeItemsBeingListenedTo = v7;

    v9 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    uuidsForUnlockedDrawingItems = v6->_uuidsForUnlockedDrawingItems;
    v6->_uuidsForUnlockedDrawingItems = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    shapeItemIdToParentItemId = v6->_shapeItemIdToParentItemId;
    v6->_shapeItemIdToParentItemId = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    cachedPKStrokesForDrawingItems = v6->_cachedPKStrokesForDrawingItems;
    v6->_cachedPKStrokesForDrawingItems = v13;

    v15 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
    cachedPKStrokesForDrawingItemsOrderedKeys = v6->_cachedPKStrokesForDrawingItemsOrderedKeys;
    v6->_cachedPKStrokesForDrawingItemsOrderedKeys = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    changedPKStrokesForDrawingItemIds = v6->_changedPKStrokesForDrawingItemIds;
    v6->_changedPKStrokesForDrawingItemIds = v17;

    v19 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    drawingItemsNeedingUpdatedPKStrokes = v6->_drawingItemsNeedingUpdatedPKStrokes;
    v6->_drawingItemsNeedingUpdatedPKStrokes = v19;

    v21 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    drawingItemsNeedingRemovedPKStrokes = v6->_drawingItemsNeedingRemovedPKStrokes;
    v6->_drawingItemsNeedingRemovedPKStrokes = v21;

    v23 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    observers = v6->_observers;
    v6->_observers = v23;

    v25 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    observersWantingConsolidatedPKDrawing = v6->_observersWantingConsolidatedPKDrawing;
    v6->_observersWantingConsolidatedPKDrawing = v25;

    v27 = objc_alloc_init(CRLBidirectionalMap);
    cachedDrawingShapeItemUUIDToStrokeDataUUIDDict = v6->_cachedDrawingShapeItemUUIDToStrokeDataUUIDDict;
    v6->_cachedDrawingShapeItemUUIDToStrokeDataUUIDDict = v27;

    v29 = objc_alloc_init(CRLBidirectionalMap);
    cachedDrawingShapeItemUUIDToStrokeUUIDDict = v6->_cachedDrawingShapeItemUUIDToStrokeUUIDDict;
    v6->_cachedDrawingShapeItemUUIDToStrokeUUIDDict = v29;

    v31 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    updatedParentUUIDToDrawingShapeItemUUIDsDict = v6->_updatedParentUUIDToDrawingShapeItemUUIDsDict;
    v6->_updatedParentUUIDToDrawingShapeItemUUIDsDict = v31;

    v33 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    strokeUUIDsToDrawingItems = v6->_strokeUUIDsToDrawingItems;
    v6->_strokeUUIDsToDrawingItems = v33;

    v35 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    strokeUUIDsToDrawingShapeItems = v6->_strokeUUIDsToDrawingShapeItems;
    v6->_strokeUUIDsToDrawingShapeItems = v35;

    v37 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    strokeUUIDsToStrokes = v6->_strokeUUIDsToStrokes;
    v6->_strokeUUIDsToStrokes = v37;

    *(_WORD *)&v6->_shouldUpdateObservers = 1;
    v6->_updatePKStrokesLock._os_unfair_lock_opaque = 0;
    __dmb(0xBu);
    v39 = -[CRLLastSubmittedTaskQueue initWithLabel:]([_TtC8Freeform25CRLLastSubmittedTaskQueue alloc], "initWithLabel:", CFSTR("com.apple.freeform.pk-drawing-provider.task.queue"));
    taskQueue = v6->_taskQueue;
    v6->_taskQueue = v39;

    -[CRLPKDrawingProvider setup](v6, "setup");
  }

  return v6;
}

- (NSDictionary)strokeUUIDsToDrawingItems
{
  os_unfair_lock_s *p_updatePKStrokesLock;
  NSMutableDictionary *v4;

  p_updatePKStrokesLock = &self->_updatePKStrokesLock;
  os_unfair_lock_lock(&self->_updatePKStrokesLock);
  v4 = self->_strokeUUIDsToDrawingItems;
  os_unfair_lock_unlock(p_updatePKStrokesLock);
  return (NSDictionary *)v4;
}

- (NSDictionary)strokeUUIDsToDrawingShapeItems
{
  os_unfair_lock_s *p_updatePKStrokesLock;
  NSMutableDictionary *v4;

  p_updatePKStrokesLock = &self->_updatePKStrokesLock;
  os_unfair_lock_lock(&self->_updatePKStrokesLock);
  v4 = self->_strokeUUIDsToDrawingShapeItems;
  os_unfair_lock_unlock(p_updatePKStrokesLock);
  return (NSDictionary *)v4;
}

- (NSDictionary)strokeUUIDsToStrokes
{
  os_unfair_lock_s *p_updatePKStrokesLock;
  NSMutableDictionary *v4;

  p_updatePKStrokesLock = &self->_updatePKStrokesLock;
  os_unfair_lock_lock(&self->_updatePKStrokesLock);
  v4 = self->_strokeUUIDsToStrokes;
  os_unfair_lock_unlock(p_updatePKStrokesLock);
  return (NSDictionary *)v4;
}

- (CRLBidirectionalMap)drawingShapeItemUUIDToStrokeUUIDBidirectionalMap
{
  os_unfair_lock_s *p_updatePKStrokesLock;
  CRLBidirectionalMap *v4;

  p_updatePKStrokesLock = &self->_updatePKStrokesLock;
  os_unfair_lock_lock(&self->_updatePKStrokesLock);
  v4 = self->_cachedDrawingShapeItemUUIDToStrokeUUIDDict;
  os_unfair_lock_unlock(p_updatePKStrokesLock);
  return v4;
}

- (void)setup
{
  CRLInteractiveCanvasController **p_icc;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  double v17;
  uint64_t v18;

  p_icc = &self->_icc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "changeNotifier"));
  *(_QWORD *)&v7 = objc_opt_class(_TtC8Freeform12CRLGroupItem, v6).n128_u64[0];
  objc_msgSend(v5, "addObserver:forChangeSourceOfClass:", self, v8, v7);

  v9 = objc_loadWeakRetained((id *)p_icc);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "changeNotifier"));
  *(_QWORD *)&v12 = objc_opt_class(_TtC8Freeform22CRLFreehandDrawingItem, v11).n128_u64[0];
  objc_msgSend(v10, "addObserver:forChangeSourceOfClass:", self, v13, v12);

  v14 = objc_loadWeakRetained((id *)p_icc);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "changeNotifier"));
  *(_QWORD *)&v17 = objc_opt_class(_TtC8Freeform27CRLFreehandDrawingShapeItem, v16).n128_u64[0];
  objc_msgSend(v15, "addObserver:forChangeSourceOfClass:", self, v18, v17);

  -[CRLPKDrawingProvider p_addSubscriptionsForDrawingItemChanges](self, "p_addSubscriptionsForDrawingItemChanges");
  -[CRLPKDrawingProvider p_updateObserversWithUpdatedPKStrokesSynchronously:](self, "p_updateObserversWithUpdatedPKStrokesSynchronously:", 1);
}

- (void)addPKDrawingsObserver:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  if (a3)
  {
    -[NSMutableSet addObject:](self->_observers, "addObject:");
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101243AE8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0B494();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101243B08);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPKDrawingProvider addPKDrawingsObserver:]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLPKDrawingProvider.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 183, 0, "Trying to add a nil observer with addObserver:");

  }
}

- (void)removePKDrawingsObserver:(id)a3
{
  -[NSMutableSet removeObject:](self->_observers, "removeObject:", a3);
}

- (void)addConsolidatedPKDrawingObserver:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  if (a3)
  {
    -[NSMutableSet addObject:](self->_observersWantingConsolidatedPKDrawing, "addObject:");
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101243B28);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0B514();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101243B48);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPKDrawingProvider addConsolidatedPKDrawingObserver:]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLPKDrawingProvider.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 195, 0, "Trying to add a nil observer with addConsolidatedPKDrawingObserver:");

  }
}

- (void)removeConsolidatedPKDrawingObserver:(id)a3
{
  -[NSMutableSet removeObject:](self->_observersWantingConsolidatedPKDrawing, "removeObject:", a3);
}

- (void)activeDrawingDidBegin
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "freehandDrawingToolkit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentTool"));
  v6 = objc_msgSend(v5, "type");

  if (v6 != (id)9)
    self->_shouldUpdateObservers = 0;
}

- (void)activeDrawingWillEndAfterInsertingFinalizedDrawingItem
{
  self->_shouldUpdateObservers = 1;
}

+ (id)allDrawingItemsDescendedFromContainer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v22 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "childInfos"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        objc_opt_class(_TtC8Freeform22CRLFreehandDrawingItem, v8);
        v14 = sub_100221D0C(v13, v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        objc_opt_class(_TtC8Freeform12CRLGroupItem, v16);
        v18 = sub_100221D0C(v17, v12);
        v19 = objc_claimAutoreleasedReturnValue(v18);
        v20 = (void *)v19;
        if (v15)
        {
          objc_msgSend(v5, "addObject:", v15);
        }
        else if (v19)
        {
          objc_msgSend(a1, "p_recursivelyAddFreehandDrawingItemsFromGroup:drawingItems:", v19, v5);
        }

      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v9);
  }

  return v5;
}

+ (id)makePKDrawingFromDrawingItems:(id)a3
{
  id v3;
  void *v4;
  char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  char *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id obj;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  _BYTE v34[48];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v3;
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v30)
  {
    v29 = *(_QWORD *)v44;
    v5 = (char *)&unk_1013CB000;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v44 != v29)
          objc_enumerationMutation(obj);
        v31 = v6;
        v7 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v6);
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v33 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allNestedChildrenItemsExcludingGroups"));
        v8 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
        if (v8)
        {
          v10 = v8;
          v11 = *(_QWORD *)v40;
          v32 = *(_QWORD *)v40;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v40 != v11)
                objc_enumerationMutation(v33);
              v13 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)v12);
              objc_opt_class(v5 + 4056, v9);
              v15 = sub_100221D0C(v14, v13);
              v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
              v17 = v16;
              if (v16 && (objc_msgSend(v16, "isTreatedAsFillForFreehandDrawing") & 1) == 0)
              {
                v18 = v5;
                v37 = 0u;
                v38 = 0u;
                v35 = 0u;
                v36 = 0u;
                v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "pencilKitStrokes"));
                v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
                if (v20)
                {
                  v21 = v20;
                  v22 = *(_QWORD *)v36;
                  do
                  {
                    v23 = 0;
                    do
                    {
                      if (*(_QWORD *)v36 != v22)
                        objc_enumerationMutation(v19);
                      v24 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)v23);
                      objc_msgSend(v17, "transformInRoot");
                      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "crl_strokeByAppendingTransform:", v34));
                      objc_msgSend(v4, "addObject:", v25);

                      v23 = (char *)v23 + 1;
                    }
                    while (v21 != v23);
                    v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
                  }
                  while (v21);
                }

                v5 = v18;
                v11 = v32;
              }

              v12 = (char *)v12 + 1;
            }
            while (v12 != v10);
            v10 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
          }
          while (v10);
        }

        v6 = v31 + 1;
      }
      while ((id)(v31 + 1) != v30);
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    }
    while (v30);
  }

  v26 = objc_msgSend(objc_alloc((Class)PKDrawing), "initWithStrokes:", v4);
  return v26;
}

- (void)processChanges:(id)a3 forChangeSource:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  NSMutableDictionary *v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned __int8 v30;
  void *v31;
  NSMutableDictionary *drawingParentIdsToShapeItemsBeingListenedTo;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSMutableDictionary *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  uint64_t v42;
  void *i;
  void *v44;
  void *v45;
  NSMutableDictionary *shapeItemIdToParentItemId;
  void *v47;
  unsigned int v48;
  NSMutableSet *uuidsForUnlockedDrawingItems;
  void *v50;
  void *v51;
  uint64_t v52;
  double v53;
  id v54;
  NSMutableDictionary *v55;
  void *v56;
  uint64_t v57;
  NSMutableDictionary *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  CRLBidirectionalMap *cachedDrawingShapeItemUUIDToStrokeDataUUIDDict;
  void *v64;
  CRLBidirectionalMap *cachedDrawingShapeItemUUIDToStrokeUUIDDict;
  void *v66;
  void *v67;
  CRLBidirectionalMap *v68;
  void *v69;
  NSMutableSet *v70;
  id v71;
  id v72;
  uint64_t v73;
  void *k;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  id v79;
  uint64_t v80;
  void *j;
  NSMutableDictionary *v82;
  void *v83;
  NSMutableDictionary *v84;
  void *v85;
  NSMutableSet *v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  id v91;
  void *v92;
  void *v93;
  void *v94;
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
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];

  v5 = a4;
  objc_opt_class(_TtC8Freeform22CRLFreehandDrawingItem, v6);
  v8 = sub_100221D0C(v7, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_opt_class(_TtC8Freeform27CRLFreehandDrawingShapeItem, v10);
  v12 = sub_100221D0C(v11, v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  objc_opt_class(_TtC8Freeform12CRLGroupItem, v14);
  v16 = sub_100221D0C(v15, v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v16);
  if (v9 && (objc_msgSend(v9, "prohibitsClustering") & 1) == 0)
  {
    if (objc_msgSend(v9, "isInBoard"))
    {
      drawingParentIdsToShapeItemsBeingListenedTo = self->_drawingParentIdsToShapeItemsBeingListenedTo;
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "id"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](drawingParentIdsToShapeItemsBeingListenedTo, "objectForKeyedSubscript:", v33));

      if (!v34)
      {
        v90 = v5;
        v92 = v18;
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "childItems"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v35));
        v37 = self->_drawingParentIdsToShapeItemsBeingListenedTo;
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "id"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v37, "setObject:forKeyedSubscript:", v36, v38);

        v105 = 0u;
        v106 = 0u;
        v103 = 0u;
        v104 = 0u;
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "childItems"));
        v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v103, v109, 16);
        if (v40)
        {
          v41 = v40;
          v42 = *(_QWORD *)v104;
          do
          {
            for (i = 0; i != v41; i = (char *)i + 1)
            {
              if (*(_QWORD *)v104 != v42)
                objc_enumerationMutation(v39);
              v44 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * (_QWORD)i);
              v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "id"));
              shapeItemIdToParentItemId = self->_shapeItemIdToParentItemId;
              v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "id"));
              -[NSMutableDictionary setObject:forKeyedSubscript:](shapeItemIdToParentItemId, "setObject:forKeyedSubscript:", v45, v47);

            }
            v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v103, v109, 16);
          }
          while (v41);
        }

        v5 = v90;
        v18 = v92;
      }
      v48 = objc_msgSend(v9, "locked");
      uuidsForUnlockedDrawingItems = self->_uuidsForUnlockedDrawingItems;
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "id"));
      if (v48)
        -[NSMutableSet removeObject:](uuidsForUnlockedDrawingItems, "removeObject:", v50);
      else
        -[NSMutableSet addObject:](uuidsForUnlockedDrawingItems, "addObject:", v50);

      os_unfair_lock_lock(&self->_updatePKStrokesLock);
      -[NSMutableSet addObject:](self->_drawingItemsNeedingUpdatedPKStrokes, "addObject:", v9);
      os_unfair_lock_unlock(&self->_updatePKStrokesLock);
    }
    else
    {
      v94 = v18;
      v101 = 0u;
      v102 = 0u;
      v99 = 0u;
      v100 = 0u;
      v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "childItems"));
      v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v99, v108, 16);
      if (v78)
      {
        v79 = v78;
        v80 = *(_QWORD *)v100;
        do
        {
          for (j = 0; j != v79; j = (char *)j + 1)
          {
            if (*(_QWORD *)v100 != v80)
              objc_enumerationMutation(v77);
            v82 = self->_shapeItemIdToParentItemId;
            v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v99 + 1) + 8 * (_QWORD)j), "id"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v82, "setObject:forKeyedSubscript:", 0, v83);

          }
          v79 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v99, v108, 16);
        }
        while (v79);
      }

      v84 = self->_drawingParentIdsToShapeItemsBeingListenedTo;
      v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "id"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v84, "setObject:forKeyedSubscript:", 0, v85);

      v86 = self->_uuidsForUnlockedDrawingItems;
      v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "id"));
      -[NSMutableSet removeObject:](v86, "removeObject:", v87);

      -[NSMutableSet addObject:](self->_drawingItemsNeedingRemovedPKStrokes, "addObject:", v9);
      v18 = v94;
    }
  }
  else
  {
    if (v13)
    {
      *(_QWORD *)&v19 = objc_opt_class(_TtC8Freeform22CRLFreehandDrawingItem, v17).n128_u64[0];
      v21 = v20;
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "parentItem", v19));
      v23 = sub_100221D0C(v21, v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

      if (!v24)
        goto LABEL_27;
      if ((objc_msgSend(v24, "prohibitsClustering") & 1) != 0)
      {
LABEL_42:

        goto LABEL_53;
      }
      if (!objc_msgSend(v24, "isInBoard")
        || (objc_msgSend(v13, "isInBoard") & 1) == 0
        && !objc_msgSend(v13, "isTreatedAsFillForFreehandDrawing"))
      {
LABEL_27:
        v91 = v5;
        v93 = v18;
        v55 = self->_shapeItemIdToParentItemId;
        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "id"));
        v57 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v55, "objectForKeyedSubscript:", v56));

        v58 = self->_shapeItemIdToParentItemId;
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "id"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v58, "setObject:forKeyedSubscript:", 0, v59);

        if (v57)
        {
          v60 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_drawingParentIdsToShapeItemsBeingListenedTo, "objectForKeyedSubscript:", v57));
          objc_msgSend(v60, "removeObject:", v13);

          v61 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_drawingParentIdsToShapeItemsBeingListenedTo, "objectForKeyedSubscript:", v57));
          v62 = objc_msgSend(v61, "count");

          if (!v62)
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_drawingParentIdsToShapeItemsBeingListenedTo, "setObject:forKeyedSubscript:", 0, v57);
        }
        v88 = (void *)v57;
        v89 = v24;
        os_unfair_lock_lock(&self->_updatePKStrokesLock);
        cachedDrawingShapeItemUUIDToStrokeDataUUIDDict = self->_cachedDrawingShapeItemUUIDToStrokeDataUUIDDict;
        v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "id"));
        -[CRLBidirectionalMap setObject:forKeyedSubscript:](cachedDrawingShapeItemUUIDToStrokeDataUUIDDict, "setObject:forKeyedSubscript:", 0, v64);

        cachedDrawingShapeItemUUIDToStrokeUUIDDict = self->_cachedDrawingShapeItemUUIDToStrokeUUIDDict;
        v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "id"));
        v67 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBidirectionalMap objectForKeyedSubscript:](cachedDrawingShapeItemUUIDToStrokeUUIDDict, "objectForKeyedSubscript:", v66));

        if (v67)
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_strokeUUIDsToDrawingItems, "setObject:forKeyedSubscript:", 0, v67);
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_strokeUUIDsToDrawingShapeItems, "setObject:forKeyedSubscript:", 0, v67);
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_strokeUUIDsToStrokes, "setObject:forKeyedSubscript:", 0, v67);
          v68 = self->_cachedDrawingShapeItemUUIDToStrokeUUIDDict;
          v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "id"));
          -[CRLBidirectionalMap setObject:forKeyedSubscript:](v68, "setObject:forKeyedSubscript:", 0, v69);

        }
        os_unfair_lock_unlock(&self->_updatePKStrokesLock);
        v97 = 0u;
        v98 = 0u;
        v95 = 0u;
        v96 = 0u;
        v70 = self->_observers;
        v71 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v70, "countByEnumeratingWithState:objects:count:", &v95, v107, 16);
        if (v71)
        {
          v72 = v71;
          v73 = *(_QWORD *)v96;
          do
          {
            for (k = 0; k != v72; k = (char *)k + 1)
            {
              if (*(_QWORD *)v96 != v73)
                objc_enumerationMutation(v70);
              v75 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * (_QWORD)k);
              if ((objc_opt_respondsToSelector(v75, "removeDrawingShapeItemUUIDToStrokeDataUUIDPair:") & 1) != 0)
              {
                v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "id"));
                objc_msgSend(v75, "removeDrawingShapeItemUUIDToStrokeDataUUIDPair:", v76);

              }
            }
            v72 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v70, "countByEnumeratingWithState:objects:count:", &v95, v107, 16);
          }
          while (v72);
        }

        v5 = v91;
        v18 = v93;
        v24 = v89;
        goto LABEL_42;
      }
      if ((objc_msgSend(v13, "isTreatedAsFillForFreehandDrawing") & 1) != 0)
      {
LABEL_57:
        os_unfair_lock_lock(&self->_updatePKStrokesLock);
        -[NSMutableSet addObject:](self->_drawingItemsNeedingUpdatedPKStrokes, "addObject:", v24);
        os_unfair_lock_unlock(&self->_updatePKStrokesLock);
        goto LABEL_42;
      }
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "parentUUID"));
      v26 = self->_shapeItemIdToParentItemId;
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "id"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v26, "setObject:forKeyedSubscript:", v25, v27);

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_drawingParentIdsToShapeItemsBeingListenedTo, "objectForKeyedSubscript:", v25));
      if (v28)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_drawingParentIdsToShapeItemsBeingListenedTo, "objectForKeyedSubscript:", v25));
        v30 = objc_msgSend(v29, "containsObject:", v13);

        if ((v30 & 1) != 0)
        {
LABEL_56:

          goto LABEL_57;
        }
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_drawingParentIdsToShapeItemsBeingListenedTo, "objectForKeyedSubscript:", v25));
        objc_msgSend(v31, "addObject:", v13);
      }
      else
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](NSMutableSet, "setWithObject:", v13));
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_drawingParentIdsToShapeItemsBeingListenedTo, "setObject:forKeyedSubscript:", v31, v25);
      }

      goto LABEL_56;
    }
    if (v18)
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      *(_QWORD *)&v53 = objc_opt_class(self, v52).n128_u64[0];
      objc_msgSend(v54, "p_recursivelyAddFreehandDrawingItemsFromGroup:drawingItems:", v18, v51, v53);
      os_unfair_lock_lock(&self->_updatePKStrokesLock);
      -[NSMutableSet addObjectsFromArray:](self->_drawingItemsNeedingUpdatedPKStrokes, "addObjectsFromArray:", v51);
      os_unfair_lock_unlock(&self->_updatePKStrokesLock);

    }
  }
LABEL_53:

}

- (void)didProcessAllChanges
{
  -[CRLPKDrawingProvider p_updateObserversWithUpdatedPKStrokesSynchronously:](self, "p_updateObserversWithUpdatedPKStrokesSynchronously:", 0);
}

- (void)teardown
{
  void *v2;
  void *v3;
  void *v4;
  CRLInteractiveCanvasController **p_icc;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  double v20;
  uint64_t v21;

  if (self->_isTornDown)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101243B68);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0B594();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101243B88);
    v2 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPKDrawingProvider teardown]"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLPKDrawingProvider.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 371, 0, "attempting to call teardown on an instance of CRLPKDrawingProvider that has already been torn down");

  }
  else
  {
    self->_isTornDown = 1;
    p_icc = &self->_icc;
    WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "changeNotifier"));
    *(_QWORD *)&v10 = objc_opt_class(_TtC8Freeform12CRLGroupItem, v9).n128_u64[0];
    objc_msgSend(v8, "removeObserver:forChangeSourceOfClass:", self, v11, v10);

    v12 = objc_loadWeakRetained((id *)p_icc);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "changeNotifier"));
    *(_QWORD *)&v15 = objc_opt_class(_TtC8Freeform22CRLFreehandDrawingItem, v14).n128_u64[0];
    objc_msgSend(v13, "removeObserver:forChangeSourceOfClass:", self, v16, v15);

    v17 = objc_loadWeakRetained((id *)p_icc);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "changeNotifier"));
    *(_QWORD *)&v20 = objc_opt_class(_TtC8Freeform27CRLFreehandDrawingShapeItem, v19).n128_u64[0];
    objc_msgSend(v18, "removeObserver:forChangeSourceOfClass:", self, v21, v20);

    -[NSMutableSet removeAllObjects](self->_observers, "removeAllObjects");
    -[NSMutableSet removeAllObjects](self->_observersWantingConsolidatedPKDrawing, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](self->_drawingParentIdsToShapeItemsBeingListenedTo, "removeAllObjects");
    -[NSMutableSet removeAllObjects](self->_uuidsForUnlockedDrawingItems, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](self->_shapeItemIdToParentItemId, "removeAllObjects");
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
      dispatch_once(&qword_10147E370, &stru_101243BA8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0B614();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101243BC8);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPKDrawingProvider dealloc]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLPKDrawingProvider.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 376, 0, "teardown not called for CRLPKDrawingProvider");

  }
  v6.receiver = self;
  v6.super_class = (Class)CRLPKDrawingProvider;
  -[CRLPKDrawingProvider dealloc](&v6, "dealloc");
}

- (id)pkStrokesForFreehandDrawingItemID:(id)a3
{
  id v4;
  id v5;
  os_unfair_lock_s *p_updatePKStrokesLock;
  void *v7;
  id v8;

  v4 = a3;
  v5 = objc_alloc_init((Class)NSArray);
  p_updatePKStrokesLock = &self->_updatePKStrokesLock;
  os_unfair_lock_lock(&self->_updatePKStrokesLock);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedPKStrokesForDrawingItems, "objectForKeyedSubscript:", v4));

  if (v7)
  {
    v8 = v7;

    v5 = v8;
  }
  os_unfair_lock_unlock(p_updatePKStrokesLock);

  return v5;
}

- (id)pkStrokesContainingUnlockedDrawingsForEntireCanvas
{
  id v3;
  NSMutableOrderedSet *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  char *v17;
  os_unfair_lock_t lock;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  unsigned int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  const char *v33;
  _BYTE v34[128];

  v3 = objc_alloc_init((Class)NSMutableArray);
  lock = &self->_updatePKStrokesLock;
  os_unfair_lock_lock(&self->_updatePKStrokesLock);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = self->_cachedPKStrokesForDrawingItemsOrderedKeys;
  v5 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v34, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v8);
        if (-[NSMutableSet containsObject:](self->_uuidsForUnlockedDrawingItems, "containsObject:", v9))
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedPKStrokesForDrawingItems, "objectForKeyedSubscript:", v9));
          if (v10)
          {
            objc_msgSend(v3, "addObjectsFromArray:", v10);
          }
          else
          {
            v11 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_101243BE8);
            v12 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67110146;
              v25 = v11;
              v26 = 2082;
              v27 = "-[CRLPKDrawingProvider pkStrokesContainingUnlockedDrawingsForEntireCanvas]";
              v28 = 2082;
              v29 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLPKDrawingProvider.m";
              v30 = 1024;
              v31 = 398;
              v32 = 2082;
              v33 = "strokes";
              _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
            }
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_101243C08);
            v13 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              v16 = v13;
              v17 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
              *(_DWORD *)buf = 67109378;
              v25 = v11;
              v26 = 2114;
              v27 = v17;
              _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

            }
            v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPKDrawingProvider pkStrokesContainingUnlockedDrawingsForEntireCanvas]"));
            v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLPKDrawingProvider.m"));
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 398, 0, "invalid nil value for '%{public}s'", "strokes", lock);

          }
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v34, 16);
    }
    while (v6);
  }

  os_unfair_lock_unlock(lock);
  return v3;
}

- (id)strokeDataUUIDForDrawingShapeItemUUID:(id)a3
{
  os_unfair_lock_s *p_updatePKStrokesLock;
  id v5;
  void *v6;

  p_updatePKStrokesLock = &self->_updatePKStrokesLock;
  v5 = a3;
  os_unfair_lock_lock(p_updatePKStrokesLock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBidirectionalMap objectForKeyedSubscript:](self->_cachedDrawingShapeItemUUIDToStrokeDataUUIDDict, "objectForKeyedSubscript:", v5));

  os_unfair_lock_unlock(p_updatePKStrokesLock);
  return v6;
}

- (void)p_updateObserversWithUpdatedPKStrokesSynchronously:(BOOL)a3
{
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *j;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  CRLShapeItemNeedingPKStrokeUpdate *v16;
  void *v17;
  void *v18;
  CRLShapeItemNeedingPKStrokeUpdate *v19;
  void *v20;
  void *v21;
  void *v22;
  CRLDrawingItemNeedingPKStrokeUpdate *v23;
  void *v24;
  CRLDrawingItemNeedingPKStrokeUpdate *v25;
  _TtC8Freeform25CRLLastSubmittedTaskQueue *taskQueue;
  _BOOL4 v27;
  NSMutableSet *obj;
  uint64_t v29;
  void *v30;
  id v31;
  void *i;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v37[5];
  id v38;
  void *v39;
  id v40;
  id location;
  _QWORD v42[9];
  _BYTE v43[48];
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

  v27 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "board"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "id"));

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = self->_drawingItemsNeedingUpdatedPKStrokes;
  v31 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v31)
  {
    v29 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v31; i = (char *)i + 1)
      {
        if (*(_QWORD *)v49 != v29)
          objc_enumerationMutation(obj);
        v35 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i);
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "childItems"));
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
        if (v7)
        {
          v8 = *(_QWORD *)v45;
          do
          {
            for (j = 0; j != v7; j = (char *)j + 1)
            {
              if (*(_QWORD *)v45 != v8)
                objc_enumerationMutation(v5);
              v10 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)j);
              objc_opt_class(_TtC8Freeform27CRLFreehandDrawingShapeItem, v6);
              v12 = sub_100221D0C(v11, v10);
              v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
              v14 = v13;
              if (v13 && (objc_msgSend(v13, "isTreatedAsFillForFreehandDrawing") & 1) == 0)
              {
                v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPKDrawingProvider p_createUUIDFromHashingStrokeTransformForShapeItem:](self, "p_createUUIDFromHashingStrokeTransformForShapeItem:", v14));
                v16 = [CRLShapeItemNeedingPKStrokeUpdate alloc];
                v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "id"));
                objc_msgSend(v14, "transformInRoot");
                v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pencilKitStrokes"));
                v19 = -[CRLShapeItemNeedingPKStrokeUpdate initWith:strokeTransformInfoUUID:transformInRoot:pkStrokes:](v16, "initWith:strokeTransformInfoUUID:transformInRoot:pkStrokes:", v17, v15, v43, v18);

                objc_msgSend(v34, "addObject:", v19);
                v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "id"));
                v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "combineUUIDWithUUID:", v15));
                v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pencilKitStrokes"));
                v42[0] = _NSConcreteStackBlock;
                v42[1] = 3221225472;
                v42[2] = sub_1001ECED8;
                v42[3] = &unk_101243C30;
                v42[4] = v21;
                v42[5] = v33;
                v42[6] = self;
                v42[7] = v14;
                v42[8] = v35;
                objc_msgSend(v22, "enumerateObjectsUsingBlock:", v42);

              }
            }
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
          }
          while (v7);
        }

        v23 = [CRLDrawingItemNeedingPKStrokeUpdate alloc];
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "id"));
        v25 = -[CRLDrawingItemNeedingPKStrokeUpdate initWith:shapeItems:](v23, "initWith:shapeItems:", v24, v34);
        objc_msgSend(v30, "addObject:", v25);

      }
      v31 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v31);
  }

  if (v27)
  {
    -[CRLPKDrawingProvider p_updatePKStrokesForShapeItemsIfNeeded:boardIdentifier:](self, "p_updatePKStrokesForShapeItemsIfNeeded:boardIdentifier:", v30, v33);
    -[CRLPKDrawingProvider p_updateObservers](self, "p_updateObservers");
  }
  else
  {
    objc_initWeak(&location, self);
    taskQueue = self->_taskQueue;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_1001ECFEC;
    v37[3] = &unk_101243C58;
    objc_copyWeak(&v40, &location);
    v37[4] = self;
    v38 = v30;
    v39 = v33;
    -[CRLLastSubmittedTaskQueue performAsync:](taskQueue, "performAsync:", v37);

    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);
  }

}

- (void)p_updateObservers
{
  if (self->_shouldUpdateObservers)
  {
    -[CRLPKDrawingProvider p_updateObserversWithNewPKStrokesIfNeeded](self, "p_updateObserversWithNewPKStrokesIfNeeded");
    -[CRLPKDrawingProvider p_updateConsolidatedObserversIfNeeded](self, "p_updateConsolidatedObserversIfNeeded");
  }
}

- (void)p_updateConsolidatedObserversIfNeeded
{
  void *v3;
  NSMutableSet *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  if (-[NSMutableSet count](self->_observersWantingConsolidatedPKDrawing, "count"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPKDrawingProvider pkStrokesContainingUnlockedDrawingsForEntireCanvas](self, "pkStrokesContainingUnlockedDrawingsForEntireCanvas"));
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = self->_observersWantingConsolidatedPKDrawing;
    v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "pkStrokesContainingUnlockedDrawingsForEntireCanvasDidChange:", v3, (_QWORD)v9);
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (id)p_strokeDataUUIDForDrawingShapeItemUUIDUNSAFE:(id)a3
{
  return -[CRLBidirectionalMap objectForKeyedSubscript:](self->_cachedDrawingShapeItemUUIDToStrokeDataUUIDDict, "objectForKeyedSubscript:", a3);
}

- (void)p_updateObserversWithNewPKStrokesIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  __int128 v9;
  id v10;
  os_unfair_lock_s *p_updatePKStrokesLock;
  void **p_cache;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  uint64_t v23;
  void *v24;
  CRLBidirectionalMap *v25;
  id v26;
  void *j;
  uint64_t v28;
  void *v29;
  os_unfair_lock_s *v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  void *k;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  unsigned int v40;
  NSObject *v41;
  void *v42;
  NSObject *v43;
  char *v44;
  __int128 v45;
  void *v46;
  id v47;
  id obj;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  id v53;
  uint64_t v54;
  id v55;
  __int128 v56;
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
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t buf[4];
  unsigned int v73;
  __int16 v74;
  const char *v75;
  __int16 v76;
  const char *v77;
  __int16 v78;
  int v79;
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPKDrawingProvider p_observersWithChangedDrawings](self, "p_observersWithChangedDrawings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "keyEnumerator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v6 = v5;
  v7 = v3;
  obj = v6;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v68, v83, 16);
  if (v8)
  {
    v10 = v8;
    p_updatePKStrokesLock = &self->_updatePKStrokesLock;
    p_cache = &OBJC_METACLASS___CRLFreehandDrawingRepTrifurcationContainer.cache;
    v50 = *(_QWORD *)v69;
    *(_QWORD *)&v9 = 67109378;
    v45 = v9;
    v46 = v3;
    do
    {
      v13 = 0;
      v47 = v10;
      do
      {
        if (*(_QWORD *)v69 != v50)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v14, v45));
        v52 = v15;
        if (v15 && (v16 = v15, objc_msgSend(v15, "count")))
        {
          v51 = v14;
          v49 = v13;
          v17 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v16, "count"));
          v64 = 0u;
          v65 = 0u;
          v66 = 0u;
          v67 = 0u;
          v18 = v16;
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v64, v82, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v65;
            do
            {
              for (i = 0; i != v20; i = (char *)i + 1)
              {
                if (*(_QWORD *)v65 != v21)
                  objc_enumerationMutation(v18);
                v23 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)i);
                v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPKDrawingProvider pkStrokesForFreehandDrawingItemID:](self, "pkStrokesForFreehandDrawingItemID:", v23));
                if (v24)
                  objc_msgSend(v17, "setObject:forKeyedSubscript:", v24, v23);

              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v64, v82, 16);
            }
            while (v20);
          }

          objc_msgSend(v51, "pkStrokesForFreehandItemsDidChange:", v17);
          v25 = objc_alloc_init(CRLBidirectionalMap);
          v60 = 0u;
          v61 = 0u;
          v62 = 0u;
          v63 = 0u;
          v26 = v17;
          v53 = v26;
          v55 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v60, v81, 16);
          if (v55)
          {
            v54 = *(_QWORD *)v61;
            do
            {
              for (j = 0; j != v55; j = (char *)j + 1)
              {
                if (*(_QWORD *)v61 != v54)
                  objc_enumerationMutation(v53);
                v28 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)j);
                os_unfair_lock_lock(p_updatePKStrokesLock);
                v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_updatedParentUUIDToDrawingShapeItemUUIDsDict, "objectForKeyedSubscript:", v28));

                if (v29)
                {
                  v30 = p_updatePKStrokesLock;
                  v58 = 0u;
                  v59 = 0u;
                  v56 = 0u;
                  v57 = 0u;
                  v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_updatedParentUUIDToDrawingShapeItemUUIDsDict, "objectForKeyedSubscript:", v28));
                  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v56, v80, 16);
                  if (v32)
                  {
                    v33 = v32;
                    v34 = *(_QWORD *)v57;
                    do
                    {
                      for (k = 0; k != v33; k = (char *)k + 1)
                      {
                        if (*(_QWORD *)v57 != v34)
                          objc_enumerationMutation(v31);
                        v36 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)k);
                        v37 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPKDrawingProvider p_strokeDataUUIDForDrawingShapeItemUUIDUNSAFE:](self, "p_strokeDataUUIDForDrawingShapeItemUUIDUNSAFE:", v36));
                        -[CRLBidirectionalMap setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v37, v36);

                      }
                      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v56, v80, 16);
                    }
                    while (v33);
                  }

                  p_updatePKStrokesLock = v30;
                }
                os_unfair_lock_unlock(p_updatePKStrokesLock);
              }
              v26 = v53;
              v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v60, v81, 16);
            }
            while (v55);
          }

          p_cache = (void **)(&OBJC_METACLASS___CRLFreehandDrawingRepTrifurcationContainer + 16);
          if ((objc_opt_respondsToSelector(v51, "updateDrawingShapeItemUUIDToStrokeDataUUIDDict:") & 1) != 0)
            objc_msgSend(v51, "updateDrawingShapeItemUUIDToStrokeDataUUIDDict:", v25);
          v7 = v46;
          v10 = v47;
          v13 = v49;
          v38 = v53;
        }
        else
        {
          v39 = v7;
          v40 = objc_msgSend(p_cache + 373, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101243C78);
          v41 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109890;
            v73 = v40;
            v74 = 2082;
            v75 = "-[CRLPKDrawingProvider p_updateObserversWithNewPKStrokesIfNeeded]";
            v76 = 2082;
            v77 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLPKDrawingProvider.m";
            v78 = 1024;
            v79 = 530;
            _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d CRLPKDrawingProvider - p_updateObservers failed to retrieve changedIds for observer", buf, 0x22u);
          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101243C98);
          v42 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            v43 = v42;
            v44 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            *(_DWORD *)buf = v45;
            v73 = v40;
            v74 = 2114;
            v75 = v44;
            _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

            p_cache = (void **)(&OBJC_METACLASS___CRLFreehandDrawingRepTrifurcationContainer + 16);
          }
          v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPKDrawingProvider p_updateObserversWithNewPKStrokesIfNeeded]"));
          v25 = (CRLBidirectionalMap *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLPKDrawingProvider.m"));
          objc_msgSend(p_cache + 373, "handleFailureInFunction:file:lineNumber:isFatal:description:", v38, v25, 530, 0, "CRLPKDrawingProvider - p_updateObservers failed to retrieve changedIds for observer");
          v7 = v39;
        }

        v13 = (char *)v13 + 1;
      }
      while (v13 != v10);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v83, 16);
    }
    while (v10);
  }

  -[CRLPKDrawingProvider p_cleanPKStrokeCachesIfNecessary](self, "p_cleanPKStrokeCachesIfNecessary");
}

- (void)p_cleanPKStrokeCachesIfNecessary
{
  NSMutableSet *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSMutableDictionary *cachedPKStrokesForDrawingItems;
  void *v10;
  NSMutableOrderedSet *cachedPKStrokesForDrawingItemsOrderedKeys;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = self->_drawingItemsNeedingRemovedPKStrokes;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v7);
        os_unfair_lock_lock(&self->_updatePKStrokesLock);
        cachedPKStrokesForDrawingItems = self->_cachedPKStrokesForDrawingItems;
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "id", (_QWORD)v13));
        -[NSMutableDictionary removeObjectForKey:](cachedPKStrokesForDrawingItems, "removeObjectForKey:", v10);

        cachedPKStrokesForDrawingItemsOrderedKeys = self->_cachedPKStrokesForDrawingItemsOrderedKeys;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "id"));
        -[NSMutableOrderedSet removeObject:](cachedPKStrokesForDrawingItemsOrderedKeys, "removeObject:", v12);

        os_unfair_lock_unlock(&self->_updatePKStrokesLock);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  os_unfair_lock_lock(&self->_updatePKStrokesLock);
  -[NSMutableSet removeAllObjects](self->_drawingItemsNeedingUpdatedPKStrokes, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_drawingItemsNeedingRemovedPKStrokes, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_changedPKStrokesForDrawingItemIds, "removeAllObjects");
  os_unfair_lock_unlock(&self->_updatePKStrokesLock);
}

- (id)p_observersWithChangedDrawings
{
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  NSMutableDictionary *changedPKStrokesForDrawingItemIds;
  id v10;
  void *v11;
  id v13;
  NSMutableSet *obj;
  _QWORD v15[4];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v13 = objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 0, 0, -[NSMutableSet count](self->_observers, "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = self->_observers;
  v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subscribedFreehandDrawingIDs"));
        os_unfair_lock_lock(&self->_updatePKStrokesLock);
        changedPKStrokesForDrawingItemIds = self->_changedPKStrokesForDrawingItemIds;
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_1001EDBC4;
        v15[3] = &unk_101243CC0;
        v10 = v8;
        v16 = v10;
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary keysOfEntriesPassingTest:](changedPKStrokesForDrawingItemIds, "keysOfEntriesPassingTest:", v15));
        os_unfair_lock_unlock(&self->_updatePKStrokesLock);
        if (v11 && objc_msgSend(v11, "count"))
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, v7);

      }
      v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }

  return v13;
}

- (void)p_updatePKStrokesForShapeItemsIfNeeded:(id)a3 boardIdentifier:(id)a4
{
  id v6;
  os_unfair_lock_s *p_updatePKStrokesLock;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *i;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  CRLBidirectionalMap *cachedDrawingShapeItemUUIDToStrokeDataUUIDDict;
  void *v28;
  CRLPKDrawingProvider *v29;
  NSMutableDictionary *updatedParentUUIDToDrawingShapeItemUUIDsDict;
  void *v31;
  void *v32;
  NSMutableDictionary *v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  NSMutableDictionary *v38;
  NSMutableDictionary *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  CRLBidirectionalMap *cachedDrawingShapeItemUUIDToStrokeUUIDDict;
  void *v47;
  NSMutableDictionary *changedPKStrokesForDrawingItemIds;
  void *v49;
  NSMutableDictionary *cachedPKStrokesForDrawingItems;
  void *v51;
  NSMutableOrderedSet *cachedPKStrokesForDrawingItemsOrderedKeys;
  void *v53;
  NSMutableOrderedSet *v54;
  void *v55;
  os_unfair_lock_s *v56;
  NSMutableSet *v57;
  id v58;
  id v59;
  uint64_t v60;
  void *j;
  NSMutableDictionary *v62;
  void *v63;
  id obj;
  uint64_t v65;
  id v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  id v70;
  uint64_t v71;
  id v72;
  os_unfair_lock_t lock;
  id v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  id v79;
  uint64_t v80;
  void *v81;
  CRLPKDrawingProvider *v82;
  id v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _OWORD v88[3];
  _OWORD v89[3];
  _OWORD v90[3];
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
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE v106[128];

  v6 = a3;
  v74 = a4;
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  obj = v6;
  v82 = self;
  v66 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v99, v106, 16);
  if (v66)
  {
    v65 = *(_QWORD *)v100;
    p_updatePKStrokesLock = &self->_updatePKStrokesLock;
    lock = &self->_updatePKStrokesLock;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v100 != v65)
          objc_enumerationMutation(obj);
        v67 = v8;
        v9 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * v8);
        v10 = objc_alloc_init((Class)NSMutableArray);
        v95 = 0u;
        v96 = 0u;
        v97 = 0u;
        v98 = 0u;
        v76 = v9;
        v68 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "shapeItems"));
        v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v95, v105, 16);
        if (v70)
        {
          v69 = *(_QWORD *)v96;
          v75 = v10;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v96 != v69)
                objc_enumerationMutation(v68);
              v71 = v11;
              v12 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * v11);
              v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "id"));
              v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "strokeTransformInfoUUID"));
              v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "combineUUIDWithUUID:", v14));

              v93 = 0u;
              v94 = 0u;
              v91 = 0u;
              v92 = 0u;
              v72 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pkStrokes"));
              v79 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v91, v104, 16);
              if (v79)
              {
                v80 = 0;
                v77 = *(_QWORD *)v92;
                do
                {
                  for (i = 0; i != v79; i = (char *)i + 1)
                  {
                    if (*(_QWORD *)v92 != v77)
                      objc_enumerationMutation(v72);
                    v16 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * (_QWORD)i);
                    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "combineUUIDWithUUID:mixValue:", v74, (char *)i + v80));
                    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "combineUUIDWithUUID:mixValue:", v74, (v80 + (_DWORD)i + 500)));
                    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "path"));
                    v83 = objc_msgSend(v19, "copyWithStrokeDataUUID:", v17);

                    v20 = objc_alloc((Class)PKStroke);
                    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "ink"));
                    if (v16)
                      objc_msgSend(v16, "transform");
                    else
                      memset(v90, 0, sizeof(v90));
                    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "mask"));
                    v23 = objc_msgSend(v20, "initWithInk:strokePath:transform:mask:randomSeed:", v21, v83, v90, v22, objc_msgSend(v16, "randomSeed"));

                    v81 = (void *)v17;
                    if (v12)
                      objc_msgSend(v12, "transformInRoot");
                    else
                      memset(v89, 0, sizeof(v89));
                    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "crl_strokeByAppendingTransform:", v89));
                    objc_msgSend(v24, "renderBounds");
                    os_unfair_lock_lock(p_updatePKStrokesLock);
                    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "path"));
                    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "_strokeDataUUID"));
                    cachedDrawingShapeItemUUIDToStrokeDataUUIDDict = v82->_cachedDrawingShapeItemUUIDToStrokeDataUUIDDict;
                    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "id"));
                    -[CRLBidirectionalMap setObject:forKeyedSubscript:](cachedDrawingShapeItemUUIDToStrokeDataUUIDDict, "setObject:forKeyedSubscript:", v26, v28);

                    v29 = v82;
                    updatedParentUUIDToDrawingShapeItemUUIDsDict = v82->_updatedParentUUIDToDrawingShapeItemUUIDsDict;
                    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "id"));
                    v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](updatedParentUUIDToDrawingShapeItemUUIDsDict, "objectForKeyedSubscript:", v31));

                    if (v32)
                    {
                      v33 = v82->_updatedParentUUIDToDrawingShapeItemUUIDsDict;
                      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "id"));
                      v35 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v33, "objectForKeyedSubscript:", v34));
                      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "id"));
                      objc_msgSend(v35, "addObject:", v36);
                    }
                    else
                    {
                      v37 = objc_alloc((Class)NSMutableSet);
                      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "id"));
                      v35 = objc_msgSend(v37, "initWithObjects:", v34, 0);
                      v38 = v82->_updatedParentUUIDToDrawingShapeItemUUIDsDict;
                      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "id"));
                      v39 = v38;
                      v29 = v82;
                      -[NSMutableDictionary setObject:forKeyedSubscript:](v39, "setObject:forKeyedSubscript:", v35, v36);
                    }

                    v40 = objc_alloc((Class)PKStroke);
                    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "path"));
                    v42 = objc_msgSend(v16, "_flags");
                    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "ink"));
                    if (v24)
                      objc_msgSend(v24, "transform");
                    else
                      memset(v88, 0, sizeof(v88));
                    v44 = objc_msgSend(v40, "initWithData:id:flags:ink:transform:substrokes:", v41, v18, v42, v43, v88, &__NSArray0__struct);

                    objc_msgSend(v44, "renderBounds");
                    -[NSMutableDictionary setObject:forKeyedSubscript:](v29->_strokeUUIDsToStrokes, "setObject:forKeyedSubscript:", v44, v18);
                    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "_strokeUUID"));
                    cachedDrawingShapeItemUUIDToStrokeUUIDDict = v29->_cachedDrawingShapeItemUUIDToStrokeUUIDDict;
                    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "id"));
                    -[CRLBidirectionalMap setObject:forKeyedSubscript:](cachedDrawingShapeItemUUIDToStrokeUUIDDict, "setObject:forKeyedSubscript:", v45, v47);

                    p_updatePKStrokesLock = lock;
                    os_unfair_lock_unlock(lock);
                    v10 = v75;
                    objc_msgSend(v75, "addObject:", v44);

                  }
                  v79 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v91, v104, 16);
                  v80 = (v80 + (_DWORD)i);
                }
                while (v79);
              }

              v11 = v71 + 1;
            }
            while ((id)(v71 + 1) != v70);
            v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v95, v105, 16);
          }
          while (v70);
        }

        self = v82;
        if (objc_msgSend(v10, "count"))
        {
          os_unfair_lock_lock(p_updatePKStrokesLock);
          changedPKStrokesForDrawingItemIds = v82->_changedPKStrokesForDrawingItemIds;
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "id"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](changedPKStrokesForDrawingItemIds, "setObject:forKeyedSubscript:", v10, v49);

          cachedPKStrokesForDrawingItems = v82->_cachedPKStrokesForDrawingItems;
          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "id"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](cachedPKStrokesForDrawingItems, "setObject:forKeyedSubscript:", v10, v51);

          cachedPKStrokesForDrawingItemsOrderedKeys = v82->_cachedPKStrokesForDrawingItemsOrderedKeys;
          v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "id"));
          LOBYTE(cachedPKStrokesForDrawingItemsOrderedKeys) = -[NSMutableOrderedSet containsObject:](cachedPKStrokesForDrawingItemsOrderedKeys, "containsObject:", v53);

          if ((cachedPKStrokesForDrawingItemsOrderedKeys & 1) == 0)
          {
            v54 = v82->_cachedPKStrokesForDrawingItemsOrderedKeys;
            v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "id"));
            -[NSMutableOrderedSet addObject:](v54, "addObject:", v55);

          }
          os_unfair_lock_unlock(p_updatePKStrokesLock);
        }

        v8 = v67 + 1;
      }
      while ((id)(v67 + 1) != v66);
      v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v106, 16);
    }
    while (v66);
  }
  v56 = &self->_updatePKStrokesLock;
  os_unfair_lock_lock(&self->_updatePKStrokesLock);
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v57 = self->_drawingItemsNeedingRemovedPKStrokes;
  v58 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v84, v103, 16);
  if (v58)
  {
    v59 = v58;
    v60 = *(_QWORD *)v85;
    do
    {
      for (j = 0; j != v59; j = (char *)j + 1)
      {
        if (*(_QWORD *)v85 != v60)
          objc_enumerationMutation(v57);
        v62 = self->_changedPKStrokesForDrawingItemIds;
        v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v84 + 1) + 8 * (_QWORD)j), "id"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v62, "setObject:forKeyedSubscript:", &__NSArray0__struct, v63);

        self = v82;
      }
      v59 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v84, v103, 16);
    }
    while (v59);
  }

  os_unfair_lock_unlock(v56);
}

- (id)p_fetchAllShapeItemsFromDrawingItem:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = a3;
  v4 = objc_alloc((Class)NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "childInfos"));
  v6 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "childInfos", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v12);
        objc_opt_class(_TtC8Freeform27CRLFreehandDrawingShapeItem, v9);
        v15 = sub_100221D0C(v14, v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        if (v16)
          objc_msgSend(v6, "addObject:", v16);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  return v6;
}

- (id)p_fetchAllDrawingItemsFromCanvas
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "board"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rootContainer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CRLPKDrawingProvider allDrawingItemsDescendedFromContainer:](CRLPKDrawingProvider, "allDrawingItemsDescendedFromContainer:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v5));

  return v6;
}

+ (void)p_recursivelyAddFreehandDrawingItemsFromGroup:(id)a3 drawingItems:(id)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v6 = a4;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "childItems", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        objc_opt_class(_TtC8Freeform22CRLFreehandDrawingItem, v9);
        v15 = sub_100221D0C(v14, v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        objc_opt_class(_TtC8Freeform12CRLGroupItem, v17);
        v19 = sub_100221D0C(v18, v13);
        v20 = objc_claimAutoreleasedReturnValue(v19);
        v21 = (void *)v20;
        if (v16)
        {
          objc_msgSend(v6, "addObject:", v16);
        }
        else if (v20)
        {
          objc_msgSend(a1, "p_recursivelyAddFreehandDrawingItemsFromGroup:drawingItems:", v20, v6);
        }

      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }

}

- (void)p_addSubscriptionsForDrawingItemChanges
{
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *drawingParentIdsToShapeItemsBeingListenedTo;
  void *v11;
  NSMutableSet *uuidsForUnlockedDrawingItems;
  void *v13;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[CRLPKDrawingProvider p_fetchAllDrawingItemsFromCanvas](self, "p_fetchAllDrawingItemsFromCanvas"));
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "childItems"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v8));
        drawingParentIdsToShapeItemsBeingListenedTo = self->_drawingParentIdsToShapeItemsBeingListenedTo;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "id"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](drawingParentIdsToShapeItemsBeingListenedTo, "setObject:forKeyedSubscript:", v9, v11);

        LODWORD(drawingParentIdsToShapeItemsBeingListenedTo) = objc_msgSend(v7, "locked");
        uuidsForUnlockedDrawingItems = self->_uuidsForUnlockedDrawingItems;
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "id"));
        if ((_DWORD)drawingParentIdsToShapeItemsBeingListenedTo)
          -[NSMutableSet removeObject:](uuidsForUnlockedDrawingItems, "removeObject:", v13);
        else
          -[NSMutableSet addObject:](uuidsForUnlockedDrawingItems, "addObject:", v13);

        os_unfair_lock_lock(&self->_updatePKStrokesLock);
        -[NSMutableSet addObject:](self->_drawingItemsNeedingUpdatedPKStrokes, "addObject:", v7);
        os_unfair_lock_unlock(&self->_updatePKStrokesLock);
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }

}

- (id)p_createUUIDFromHashingStrokeTransformForShapeItem:(id)a3
{
  id v3;
  id v4;
  id v5;
  double v7;
  double data;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  CC_SHA256_CTX c;
  unsigned __int8 md[16];
  __int128 v14;
  __int128 v15;

  v3 = a3;
  memset(&c, 0, sizeof(c));
  CC_SHA256_Init(&c);
  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  if (v3)
    objc_msgSend(v3, "transformInRoot");
  *(_OWORD *)md = v9;
  v14 = v10;
  v15 = v11;
  data = sub_10007922C((double *)md);
  *(_OWORD *)md = v9;
  v14 = v10;
  v15 = v11;
  v7 = sub_1000791EC((double *)md);
  CC_SHA256_Update(&c, &v11, 8u);
  CC_SHA256_Update(&c, (char *)&v11 + 8, 8u);
  CC_SHA256_Update(&c, &data, 8u);
  CC_SHA256_Update(&c, &v7, 8u);
  CC_SHA256_Final(md, &c);
  md[6] = md[6] & 0xF | 0x50;
  md[8] = md[8] & 0x3F | 0x80;
  v4 = objc_alloc((Class)NSUUID);
  v5 = objc_msgSend(v4, "initWithUUIDBytes:", md, *(_QWORD *)&v7, *(_QWORD *)&data);

  return v5;
}

- (BOOL)isTornDown
{
  return self->_isTornDown;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskQueue, 0);
  objc_storeStrong((id *)&self->_strokeUUIDsToStrokes, 0);
  objc_storeStrong((id *)&self->_strokeUUIDsToDrawingShapeItems, 0);
  objc_storeStrong((id *)&self->_strokeUUIDsToDrawingItems, 0);
  objc_storeStrong((id *)&self->_updatedParentUUIDToDrawingShapeItemUUIDsDict, 0);
  objc_storeStrong((id *)&self->_cachedDrawingShapeItemUUIDToStrokeUUIDDict, 0);
  objc_storeStrong((id *)&self->_cachedDrawingShapeItemUUIDToStrokeDataUUIDDict, 0);
  objc_storeStrong((id *)&self->_observersWantingConsolidatedPKDrawing, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_drawingItemsNeedingRemovedPKStrokes, 0);
  objc_storeStrong((id *)&self->_drawingItemsNeedingUpdatedPKStrokes, 0);
  objc_storeStrong((id *)&self->_changedPKStrokesForDrawingItemIds, 0);
  objc_storeStrong((id *)&self->_cachedPKStrokesForDrawingItemsOrderedKeys, 0);
  objc_storeStrong((id *)&self->_cachedPKStrokesForDrawingItems, 0);
  objc_storeStrong((id *)&self->_shapeItemIdToParentItemId, 0);
  objc_storeStrong((id *)&self->_uuidsForUnlockedDrawingItems, 0);
  objc_storeStrong((id *)&self->_drawingParentIdsToShapeItemsBeingListenedTo, 0);
  objc_destroyWeak((id *)&self->_icc);
}

@end
