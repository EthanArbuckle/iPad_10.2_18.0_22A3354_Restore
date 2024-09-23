@implementation CRLDynamicOperationController

- (CRLDynamicOperationController)initWithInteractiveCanvasController:(id)a3
{
  id v4;
  CRLDynamicOperationController *v5;
  CRLDynamicOperationController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLDynamicOperationController;
  v5 = -[CRLDynamicOperationController init](&v8, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_icc, v4);
    v6->_resetGuides = 1;
  }

  return v6;
}

- (void)beginPossibleDynamicOperation
{
  id WeakRetained;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableSet *v11;
  NSMutableSet *reps;

  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v4 = objc_msgSend(WeakRetained, "isInDynamicOperation");

  if (v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101256950);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E28F54();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101256970);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDynamicOperationController beginPossibleDynamicOperation]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDynamicOperationController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 74, 0, "begin possible op with ICC in dynamic operation");

  }
  if (self->_possibleDynamicOperation || self->_reps || self->_allTransformedReps)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101256990);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E28ED4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012569B0);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDynamicOperationController beginPossibleDynamicOperation]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDynamicOperationController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 75, 0, "beginning possible operation without ending previous operation");

  }
  v11 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  reps = self->_reps;
  self->_reps = v11;

  self->_possibleDynamicOperation = 1;
  *(_WORD *)&self->_resetGuides = 257;
}

- (void)beginOperation
{
  CRLInteractiveCanvasController **p_icc;
  id WeakRetained;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  NSMutableSet *v22;
  NSMutableSet *allTransformedReps;
  void *v24;
  NSMutableSet *v25;
  NSMutableSet *reps;
  NSMutableSet *v27;
  NSMutableSet *v28;
  id v29;
  void *v30;

  p_icc = &self->_icc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v5 = objc_msgSend(WeakRetained, "isInDynamicOperation");

  if (v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012569D0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E290D4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012569F0);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDynamicOperationController beginOperation]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDynamicOperationController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 90, 0, "begin op with ICC in dynamic operation");

  }
  if (!self->_possibleDynamicOperation && (self->_reps || self->_allTransformedReps))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101256A10);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E29054();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101256A30);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDynamicOperationController beginOperation]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDynamicOperationController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 91, 0, "beginning operation without ending previous operation");

  }
  v12 = objc_loadWeakRetained((id *)p_icc);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tmCoordinator"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "controllingTM"));

  if (!v14)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101256A50);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E28FD4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101256A70);
    v15 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDynamicOperationController beginOperation]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDynamicOperationController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 92, 0, "No controlling TM when beginning operation");

  }
  v18 = objc_loadWeakRetained((id *)p_icc);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "tmCoordinator"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "controllingTM"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "tracker"));

  if ((objc_opt_respondsToSelector(v21, "traceIfDesiredForBeginOperation") & 1) != 0)
    objc_msgSend(v21, "traceIfDesiredForBeginOperation");
  self->_supportsAlignmentGuides = objc_msgSend(v21, "supportsAlignmentGuides");
  self->_operationIsDynamic = objc_msgSend(v21, "operationShouldBeDynamic");
  if (self->_possibleDynamicOperation)
  {
    self->_possibleDynamicOperation = 0;
    v22 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", self->_reps));
    allTransformedReps = self->_allTransformedReps;
    self->_allTransformedReps = v22;

    if (!self->_operationIsDynamic)
      goto LABEL_41;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](NSSet, "setWithSet:", self->_reps));
    -[CRLDynamicOperationController p_beginDynamicOperationForReps:](self, "p_beginDynamicOperationForReps:", v24);

  }
  else
  {
    v25 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    reps = self->_reps;
    self->_reps = v25;

    v27 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v28 = self->_allTransformedReps;
    self->_allTransformedReps = v27;

    self->_resetGuides = 1;
  }
  if (self->_operationIsDynamic)
  {
    v29 = objc_loadWeakRetained((id *)p_icc);
    objc_msgSend(v29, "beginDynamicOperation");

  }
LABEL_41:
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v30, "addObserver:selector:name:object:", self, "p_controllingTMDidResetInOperation:", CFSTR("CRLCanvasControllingGRDidResetNotification"), 0);

}

- (void)p_beginDynamicOperationForReps:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _QWORD v22[2];
  _QWORD v23[2];

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "tmCoordinator"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "controllingTM"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tracker"));

  v22[0] = CFSTR("CRLDynamicOperationControllerDynamicOperationTrackerKey");
  v22[1] = CFSTR("CRLDynamicOperationControllerDynamicOperationRepsKey");
  v23[0] = v8;
  v23[1] = v4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 2));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("CRLDynamicOperationControllerWillStartDynamicOperationNotification"), self, v9);

  if ((objc_opt_respondsToSelector(v8, "willBeginDynamicOperationForReps:") & 1) != 0)
    objc_msgSend(v8, "willBeginDynamicOperationForReps:", v4);
  if ((objc_opt_respondsToSelector(v8, "isEnqueueingCommandsInRealTime") & 1) != 0)
    v11 = objc_msgSend(v8, "isEnqueueingCommandsInRealTime");
  else
    v11 = 0;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = v4;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v16), "dynamicOperationDidBeginWithRealTimeCommands:", v11, (_QWORD)v17);
        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v14);
  }

}

- (void)endOperation
{
  CRLDynamicOperationController *v2;
  CRLInteractiveCanvasController **p_icc;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  unsigned int v14;
  id v15;
  CRLCanvasCommandSelectionBehavior *v16;
  CRLCanvasCommandSelectionBehavior *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  unsigned int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  void *v46;
  _TtC8Freeform25CRLCommandSetInfoGeometry *v47;
  unsigned int v48;
  NSObject *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  char *v53;
  unsigned int v54;
  CRLDynamicOperationController *v55;
  CRLInteractiveCanvasController **v56;
  NSMutableSet *obj;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t buf[4];
  unsigned int v64;
  __int16 v65;
  const char *v66;
  __int16 v67;
  const char *v68;
  __int16 v69;
  int v70;
  _BYTE v71[128];
  const __CFString *v72;
  void *v73;

  v2 = self;
  p_icc = &self->_icc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "tmCoordinator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "controllingTM"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tracker"));

  if (v2->_operationIsDynamic)
  {
    v8 = objc_loadWeakRetained((id *)p_icc);
    objc_msgSend(v8, "willEndDynamicOperation");

    v72 = CFSTR("CRLDynamicOperationControllerDynamicOperationTrackerKey");
    v73 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("CRLDynamicOperationControllerDidEndDynamicOperationNotification"), v2, v9);

  }
  v11 = objc_loadWeakRetained((id *)p_icc);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "tmCoordinator"));
  objc_msgSend(v12, "operationWillEnd");

  if (-[CRLDynamicOperationController isInOperation](v2, "isInOperation"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v13, "removeObserver:name:object:", v2, CFSTR("CRLCanvasControllingGRDidResetNotification"), 0);

    if ((objc_opt_respondsToSelector(v7, "traceIfDesiredForEndOperation") & 1) != 0)
      objc_msgSend(v7, "traceIfDesiredForEndOperation");
    if (-[CRLDynamicOperationController isOperationDynamic](v2, "isOperationDynamic"))
      v14 = objc_msgSend(v7, "shouldOpenCommandGroupToCommitChangesForReps:", v2->_allTransformedReps);
    else
      v14 = 0;
    v15 = objc_loadWeakRetained((id *)p_icc);
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "commandController"));

    if (v14)
    {
      if ((objc_opt_respondsToSelector(v7, "selectionBehaviorForReps:") & 1) == 0
        || (v16 = (CRLCanvasCommandSelectionBehavior *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectionBehaviorForReps:", v2->_allTransformedReps))) == 0)
      {
        v17 = [CRLCanvasCommandSelectionBehavior alloc];
        v18 = objc_loadWeakRetained((id *)p_icc);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "canvasEditor"));
        v20 = objc_loadWeakRetained((id *)p_icc);
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "editorController"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "selectionPath"));
        v16 = -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:type:selectionPath:selectionFlags:commitSelectionFlags:forwardSelectionFlags:reverseSelectionFlags:](v17, "initWithCanvasEditor:type:selectionPath:selectionFlags:commitSelectionFlags:forwardSelectionFlags:reverseSelectionFlags:", v19, 2, v22, 0, 0, 4, 4);

      }
      objc_msgSend(v58, "openGroupWithSelectionBehavior:", v16);

    }
    if (v7)
    {
      objc_msgSend(v7, "commitChangesForReps:", v2->_allTransformedReps);
      if (!v14)
      {
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101256A90);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E291D4();
      v56 = p_icc;
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101256AB0);
      v54 = v14;
      v30 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDynamicOperationController endOperation]"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDynamicOperationController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v31, v32, 205, 0, "tracker controller should not commit dynamic changes");

      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      v55 = v2;
      obj = v2->_allTransformedReps;
      v33 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
      if (v33)
      {
        v34 = v33;
        v35 = *(_QWORD *)v60;
        do
        {
          v36 = 0;
          do
          {
            if (*(_QWORD *)v60 != v35)
              objc_enumerationMutation(obj);
            v37 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)v36);
            v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "layout"));
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "pureGeometry"));

            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "layout"));
            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "computeInfoGeometryFromPureLayoutGeometry:", v39));

            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "infoForTransforming"));
            objc_opt_class(_TtC8Freeform12CRLBoardItem, v43);
            v45 = sub_100221D0C(v44, v42);
            v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
            if (v46)
            {
              v47 = -[CRLCommandSetInfoGeometry initWithBoardItem:geometry:]([_TtC8Freeform25CRLCommandSetInfoGeometry alloc], "initWithBoardItem:geometry:", v46, v41);
              objc_msgSend(v58, "enqueueCommand:", v47);
            }
            else
            {
              v48 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_101256AD0);
              v49 = off_1013D9070;
              if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109890;
                v64 = v48;
                v65 = 2082;
                v66 = "-[CRLDynamicOperationController endOperation]";
                v67 = 2082;
                v68 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDynamicOperationController.m";
                v69 = 1024;
                v70 = 213;
                _os_log_error_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d to run a command to resize an info, the info must be a board item", buf, 0x22u);
              }
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_101256AF0);
              v50 = off_1013D9070;
              if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
              {
                v52 = v50;
                v53 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
                *(_DWORD *)buf = 67109378;
                v64 = v48;
                v65 = 2114;
                v66 = v53;
                _os_log_error_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

              }
              v47 = (_TtC8Freeform25CRLCommandSetInfoGeometry *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDynamicOperationController endOperation]"));
              v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDynamicOperationController.m"));
              +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v47, v51, 213, 0, "to run a command to resize an info, the info must be a board item");

            }
            v36 = (char *)v36 + 1;
          }
          while (v34 != v36);
          v34 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
        }
        while (v34);
      }

      p_icc = v56;
      v7 = 0;
      v2 = v55;
      if (!v54)
        goto LABEL_17;
    }
    v23 = objc_loadWeakRetained((id *)p_icc);
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "commandController"));
    objc_msgSend(v24, "closeGroup");

    goto LABEL_17;
  }
LABEL_18:
  -[CRLDynamicOperationController p_cleanupOperation](v2, "p_cleanupOperation");
  v25 = objc_loadWeakRetained((id *)p_icc);
  v26 = objc_msgSend(v25, "isInDynamicOperation");

  if (v26)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101256B10);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E29154();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101256B30);
    v27 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDynamicOperationController endOperation]"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDynamicOperationController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v28, v29, 229, 0, "ending op with ICC still in dynamic operation");

  }
}

- (BOOL)isInOperation
{
  return self->_reps && self->_allTransformedReps && !self->_possibleDynamicOperation;
}

- (BOOL)isInPossibleDynamicOperation
{
  return self->_possibleDynamicOperation;
}

- (BOOL)isOperationDynamic
{
  return self->_operationIsDynamic;
}

- (void)cancelOperation
{
  void *v3;
  void *v4;
  void *v5;

  if (!-[CRLDynamicOperationController isInOperation](self, "isInOperation"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101256B50);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E29254();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101256B70);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDynamicOperationController cancelOperation]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDynamicOperationController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 250, 0, "cancelling when not in operation");

  }
  -[CRLDynamicOperationController p_cleanupOperation](self, "p_cleanupOperation");
}

- (void)p_cleanupOperation
{
  NSMutableSet *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  id WeakRetained;
  id v9;
  void *v10;
  NSMutableSet *reps;
  NSMutableSet *allTransformedReps;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  if (self->_operationIsDynamic)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v3 = self->_allTransformedReps;
    v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "dynamicOperationDidEnd", (_QWORD)v13);
        }
        v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v5);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
    objc_msgSend(WeakRetained, "endDynamicOperation");

  }
  -[CRLDynamicOperationController p_resetGuidesForCleanup:](self, "p_resetGuidesForCleanup:", 1, (_QWORD)v13);
  v9 = objc_loadWeakRetained((id *)&self->_icc);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tmCoordinator"));
  objc_msgSend(v10, "operationDidEnd");

  self->_possibleDynamicOperation = 0;
  reps = self->_reps;
  self->_reps = 0;

  allTransformedReps = self->_allTransformedReps;
  self->_allTransformedReps = 0;

  self->_operationIsDynamic = 0;
}

- (void)startTransformingReps:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  id WeakRetained;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v4 = a3;
  if (!-[CRLDynamicOperationController isInOperation](self, "isInOperation") && !self->_possibleDynamicOperation)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101256B90);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E292D4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101256BB0);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDynamicOperationController startTransformingReps:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDynamicOperationController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 280, 0, "cannot begin transforming reps until we are in a transform");

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        if ((-[NSMutableSet containsObject:](self->_reps, "containsObject:", v14, (_QWORD)v19) & 1) == 0)
          -[NSMutableSet addObject:](self->_reps, "addObject:", v14);
        if (!self->_possibleDynamicOperation
          && (-[NSMutableSet containsObject:](self->_allTransformedReps, "containsObject:", v14) & 1) == 0)
        {
          if (self->_operationIsDynamic)
            objc_msgSend(v8, "addObject:", v14);
          -[NSMutableSet addObject:](self->_allTransformedReps, "addObject:", v14);
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  if (objc_msgSend(v8, "count"))
    -[CRLDynamicOperationController p_beginDynamicOperationForReps:](self, "p_beginDynamicOperationForReps:", v8);
  -[CRLDynamicOperationController p_resetGuidesForCleanup:](self, "p_resetGuidesForCleanup:", 0, (_QWORD)v19);
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "tmCoordinator"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "controllingTM"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "tracker"));

  if ((objc_opt_respondsToSelector(v18, "didChangeCurrentlyTransformingReps") & 1) != 0)
    objc_msgSend(v18, "didChangeCurrentlyTransformingReps");

}

- (void)stopTransformingReps:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[NSMutableSet minusSet:](self->_reps, "minusSet:", v4);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v9), "layout", (_QWORD)v15));
          objc_msgSend(v10, "pauseDynamicTransformation");

          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
    }

    -[CRLDynamicOperationController p_resetGuidesForCleanup:](self, "p_resetGuidesForCleanup:", 0);
    WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "tmCoordinator"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "controllingTM"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "tracker"));

    if ((objc_opt_respondsToSelector(v14, "didChangeCurrentlyTransformingReps") & 1) != 0)
      objc_msgSend(v14, "didChangeCurrentlyTransformingReps");

  }
}

- (void)handleGestureRecognizer:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  Class v12;
  NSString *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  int operationIsDynamic;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char *v22;
  void *v23;
  void *v24;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "tmCoordinator"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "controllingTM"));

  if (v7 == v4)
  {
    if (!-[CRLDynamicOperationController isInOperation](self, "isInOperation"))
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101256BD0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E29404();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101256BF0);
      v8 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDynamicOperationController handleGestureRecognizer:]"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDynamicOperationController.m"));
      objc_opt_class(v4, v11);
      v13 = NSStringFromClass(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 340, 0, "tracker is handling GR %@ when not in a transform", v14);

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tracker"));
    v16 = objc_msgSend(v15, "operationShouldBeDynamic");
    operationIsDynamic = self->_operationIsDynamic;

    if (operationIsDynamic != v16)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101256C10);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E29354();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101256C30);
      v18 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDynamicOperationController handleGestureRecognizer:]"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDynamicOperationController.m"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tracker"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 346, 0, "Controlling TM has different dynamic operation expectations than current operation (%@)", v21);

    }
    if (self->_resetGuides)
      -[CRLDynamicOperationController p_resetGuidesForCleanup:](self, "p_resetGuidesForCleanup:", 0);
    v22 = (char *)objc_msgSend(v4, "state");
    if ((unint64_t)(v22 - 1) >= 2)
    {
      if (v22 == (char *)3)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tracker"));
        objc_msgSend(v24, "changeDynamicLayoutsForReps:", self->_reps);

        -[CRLDynamicOperationController endOperation](self, "endOperation");
      }
    }
    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tracker"));
      objc_msgSend(v23, "changeDynamicLayoutsForReps:", self->_reps);

    }
  }

}

- (void)p_controllingTMDidResetInOperation:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  if (!-[CRLDynamicOperationController isInOperation](self, "isInOperation"))
  {
    v5 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101256C50);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E294B4((uint64_t)v4, v5);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101256C70);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDynamicOperationController p_controllingTMDidResetInOperation:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDynamicOperationController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 377, 0, "controlling GR reset in an operation, but we aren't in an operation! %@", v4);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "tmCoordinator"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "controllingTM"));

  if (v4 == v11)
    -[CRLDynamicOperationController endOperation](self, "endOperation");

}

- (void)handleTrackerManipulator:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  Class v12;
  NSString *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  int operationIsDynamic;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  Class v22;
  NSString *v23;
  void *v24;
  void *v25;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "tmCoordinator"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "controllingTM"));

  if (v7 == v4)
  {
    if (!-[CRLDynamicOperationController isInOperation](self, "isInOperation"))
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101256C90);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E29604();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101256CB0);
      v8 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDynamicOperationController handleTrackerManipulator:]"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDynamicOperationController.m"));
      objc_opt_class(v4, v11);
      v13 = NSStringFromClass(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 393, 0, "tracker is handling TM %@ when not in a transform", v14);

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tracker"));
    v16 = objc_msgSend(v15, "operationShouldBeDynamic");
    operationIsDynamic = self->_operationIsDynamic;

    if (operationIsDynamic != v16)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101256CD0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E29554();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101256CF0);
      v18 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDynamicOperationController handleTrackerManipulator:]"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDynamicOperationController.m"));
      objc_opt_class(v4, v21);
      v23 = NSStringFromClass(v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 399, 0, "Controlling TM %@ has different dynamic operation expectations than current operation", v24);

    }
    if (self->_resetGuides)
      -[CRLDynamicOperationController p_resetGuidesForCleanup:](self, "p_resetGuidesForCleanup:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tracker"));
    objc_msgSend(v25, "changeDynamicLayoutsForReps:", self->_reps);

    if (objc_msgSend(v4, "readyToEndOperation"))
      -[CRLDynamicOperationController endOperation](self, "endOperation");
  }

}

- (void)invalidateGuides
{
  self->_resetGuides = 1;
}

- (void)p_resetGuidesForCleanup:(BOOL)a3
{
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSMutableSet *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  id v39;

  if (self->_supportsAlignmentGuides)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "guideController"));
    objc_msgSend(v6, "endAlignmentOperation");

  }
  v7 = objc_loadWeakRetained((id *)&self->_icc);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tmCoordinator"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "controllingTM"));
  v39 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tracker"));

  if (objc_msgSend(v39, "supportsAlignmentGuides"))
  {
    v10 = -[NSMutableSet count](self->_reps, "count");
    self->_supportsAlignmentGuides = v10 != 0;
    if (v10 && !a3)
    {
      v11 = self->_reps;
      v12 = objc_loadWeakRetained((id *)&self->_icc);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tmCoordinator"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "controllingTM"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "tracker"));
      v16 = objc_opt_respondsToSelector(v15, "repsForGuidesWhenManipulatingReps:");

      if ((v16 & 1) != 0)
      {
        v17 = objc_loadWeakRetained((id *)&self->_icc);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "tmCoordinator"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "controllingTM"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "tracker"));
        v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "repsForGuidesWhenManipulatingReps:", self->_reps));

        v11 = (NSMutableSet *)v21;
      }
      if ((objc_opt_respondsToSelector(v39, "suppressesCenterGuides") & 1) != 0)
      {
        v22 = objc_loadWeakRetained((id *)&self->_icc);
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "tmCoordinator"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "controllingTM"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "tracker"));
        v26 = objc_msgSend(v25, "suppressesCenterGuides");

      }
      else
      {
        v26 = 0;
      }
      if ((objc_opt_respondsToSelector(v39, "suppressesSpacingGuides") & 1) != 0)
      {
        v27 = objc_loadWeakRetained((id *)&self->_icc);
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "tmCoordinator"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "controllingTM"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "tracker"));
        v31 = objc_msgSend(v30, "suppressesSpacingGuides");

      }
      else
      {
        v31 = 0;
      }
      if ((objc_opt_respondsToSelector(v39, "suppressesSizingGuides") & 1) != 0)
      {
        v32 = objc_loadWeakRetained((id *)&self->_icc);
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "tmCoordinator"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "controllingTM"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "tracker"));
        v36 = objc_msgSend(v35, "suppressesSizingGuides");

      }
      else
      {
        v36 = 0;
      }
      v37 = objc_loadWeakRetained((id *)&self->_icc);
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "guideController"));
      objc_msgSend(v38, "beginAlignmentOperationForReps:preventCenterGuides:preventSpacingGuides:preventSizingGuides:", v11, v26, v31, v36);

    }
  }
  else
  {
    self->_supportsAlignmentGuides = 0;
  }
  self->_resetGuides = 0;

}

- (NSSet)currentlyTransformingReps
{
  return &self->_reps->super;
}

- (NSSet)allTransformedReps
{
  return &self->_allTransformedReps->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allTransformedReps, 0);
  objc_storeStrong((id *)&self->_reps, 0);
  objc_destroyWeak((id *)&self->_icc);
}

@end
