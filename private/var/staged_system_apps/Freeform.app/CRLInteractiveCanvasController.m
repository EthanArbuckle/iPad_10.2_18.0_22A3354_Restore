@implementation CRLInteractiveCanvasController

- (void)withLayoutNearestPoint:(CGPoint)a3 forStorage:(id)a4 performBlock:(id)a5
{
  double y;
  double x;
  void (**v9)(id, void *);
  id v10;
  void *v11;
  id v12;

  y = a3.y;
  x = a3.x;
  v9 = (void (**)(id, void *))a5;
  v10 = a4;
  -[CRLInteractiveCanvasController layoutIfNeeded](self, "layoutIfNeeded");
  v12 = (id)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController closestRepToPoint:forStorage:](self, "closestRepToPoint:forStorage:", v10, x, y));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layout"));
  v9[2](v9, v11);

}

- (id)closestRepToPoint:(CGPoint)a3 forStorage:(id)a4
{
  double y;
  double x;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  double v13;
  void *i;
  void *v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MidY;
  double v22;
  double v23;
  id v24;
  id v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  CGPoint v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController p_repsForStorage:](self, "p_repsForStorage:", v7));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v28;
    v13 = INFINITY;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v15, "frameInUnscaledCanvas", (_QWORD)v27);
        v16 = v33.origin.x;
        v17 = v33.origin.y;
        width = v33.size.width;
        height = v33.size.height;
        v32.x = x;
        v32.y = y;
        if (CGRectContainsPoint(v33, v32))
        {
          v25 = v15;

          v11 = v25;
          goto LABEL_14;
        }
        v34.origin.x = v16;
        v34.origin.y = v17;
        v34.size.width = width;
        v34.size.height = height;
        MidX = CGRectGetMidX(v34);
        v35.origin.x = v16;
        v35.origin.y = v17;
        v35.size.width = width;
        v35.size.height = height;
        MidY = CGRectGetMidY(v35);
        v22 = sub_10006108C(x, y, MidX, MidY);
        if (v22 < v13)
        {
          v23 = v22;
          v24 = v15;

          v13 = v23;
          v11 = v24;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v10)
        continue;
      break;
    }
  }
  else
  {
    v11 = 0;
  }
LABEL_14:

  return v11;
}

- (id)p_repsForStorage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvas](self, "canvas", 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topLevelReps"));

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        -[CRLInteractiveCanvasController p_recursivelyAddRep:forStorage:toSet:](self, "p_recursivelyAddRep:forStorage:toSet:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v11), v4, v5);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  return v5;
}

- (void)p_recursivelyAddRep:(id)a3 forStorage:(id)a4 toSet:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v12 = objc_opt_class(CRLWPRep, v11);
  v13 = sub_100221D0C(v12, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = v14;
  if (v14 && (v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "storage")), v16, v16 == v9))
  {
    objc_msgSend(v10, "addObject:", v15);
  }
  else
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "childReps", 0));
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v23;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v23 != v20)
            objc_enumerationMutation(v17);
          -[CRLInteractiveCanvasController p_recursivelyAddRep:forStorage:toSet:](self, "p_recursivelyAddRep:forStorage:toSet:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v21), v9, v10);
          v21 = (char *)v21 + 1;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v19);
    }

  }
}

- (CRLInteractiveCanvasController)init
{
  CRLInteractiveCanvasController *v2;
  CRLInteractiveCanvasController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLInteractiveCanvasController;
  v2 = -[CRLInteractiveCanvasController init](&v5, "init");
  v3 = v2;
  if (v2)
    -[CRLInteractiveCanvasController p_commonInit](v2, "p_commonInit");
  __dmb(0xBu);
  return v3;
}

- (void)addCommonObservers
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "p_textGesturesWillBeginNotification:", CFSTR("CRLTextGesturesWillBeginNotification"), 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "p_textGesturesDidEndNotification:", CFSTR("CRLTextGesturesDidEndNotification"), 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "p_spellCheckingStateChangedNotification:", CFSTR("CRLWPSpellCheckingStateChangedNotification"), 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "p_spellCheckerWordsDidChangeNotification:", CFSTR("CRLWPSpellCheckingIgnoranceChangedNotification"), 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "p_spellCheckerWordsDidChangeNotification:", CFSTR("CRLWPSpellCheckingLearnedWordsChangedNotification"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
  objc_msgSend(v3, "addCommonObservers");

}

- (void)removeCommonObservers
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("CRLTextGesturesWillBeginNotification"), 0);
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("CRLTextGesturesDidEndNotification"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
  objc_msgSend(v3, "removeCommonObservers");

}

- (void)p_commonInit
{
  CRLCanvas *v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  CRLCanvas *v7;
  CRLCanvas *mCanvas;
  CRLInteractiveCanvasLayerHelper *v9;
  CRLInteractiveCanvasLayerUpdater *mLayerUpdater;
  double y;
  double width;
  double height;
  NSMutableSet *v14;
  NSMutableSet *mNotificationsToPostWithValidLayouts;
  NSMutableArray *v16;
  NSMutableArray *mBlocksToPerformOnMainThreadWithValidLayouts;
  NSMutableSet *v18;
  NSMutableSet *mRepsToSetNeedsDisplay;
  NSMapTable *v20;
  NSMapTable *mRepsToRectsToInvalidate;
  NSMutableSet *v22;
  NSMutableSet *mRepsDrawnIntoAncestorToSetNeedsDisplayOnUpdatedGeometry;
  NSMutableArray *v24;
  NSMutableArray *mDecorators;
  NSMutableSet *v26;
  NSMutableSet *mDecoratorsWithInvalidLayers;
  void *v28;
  void *v29;
  _TtC8Freeform26CRLCanvasDotGridBackground *v30;
  _TtC8Freeform19CRLCanvasBackground *mCanvasBackground;

  v3 = [CRLCanvas alloc];
  *(_QWORD *)&v5 = objc_opt_class(CRLCanvasLayoutController, v4).n128_u64[0];
  v7 = -[CRLCanvas initWithLayoutControllerClass:delegate:](v3, "initWithLayoutControllerClass:delegate:", v6, self, v5);
  mCanvas = self->mCanvas;
  self->mCanvas = v7;

  -[CRLCanvas i_setCanvasController:](self->mCanvas, "i_setCanvasController:", self);
  v9 = -[CRLInteractiveCanvasLayerHelper initWithInteractiveCanvasController:]([CRLInteractiveCanvasLayerHelper alloc], "initWithInteractiveCanvasController:", self);
  mLayerUpdater = self->mLayerUpdater;
  self->mLayerUpdater = (CRLInteractiveCanvasLayerUpdater *)v9;

  self->mResizeCanvasOnLayout = 0;
  -[CRLInteractiveCanvasController addCommonObservers](self, "addCommonObservers");
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  -[CRLInteractiveCanvasController setP_visibleBoundsRectForTiling:](self, "setP_visibleBoundsRectForTiling:", CGRectNull.origin.x, y, width, height);
  -[CRLInteractiveCanvasController setP_visibleUnscaledRect:](self, "setP_visibleUnscaledRect:", CGRectNull.origin.x, y, width, height);
  v14 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  mNotificationsToPostWithValidLayouts = self->mNotificationsToPostWithValidLayouts;
  self->mNotificationsToPostWithValidLayouts = v14;

  v16 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  mBlocksToPerformOnMainThreadWithValidLayouts = self->mBlocksToPerformOnMainThreadWithValidLayouts;
  self->mBlocksToPerformOnMainThreadWithValidLayouts = v16;

  v18 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  mRepsToSetNeedsDisplay = self->mRepsToSetNeedsDisplay;
  self->mRepsToSetNeedsDisplay = v18;

  v20 = (NSMapTable *)objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 0);
  mRepsToRectsToInvalidate = self->mRepsToRectsToInvalidate;
  self->mRepsToRectsToInvalidate = v20;

  v22 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  mRepsDrawnIntoAncestorToSetNeedsDisplayOnUpdatedGeometry = self->mRepsDrawnIntoAncestorToSetNeedsDisplayOnUpdatedGeometry;
  self->mRepsDrawnIntoAncestorToSetNeedsDisplayOnUpdatedGeometry = v22;

  v24 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  mDecorators = self->mDecorators;
  self->mDecorators = v24;

  v26 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  mDecoratorsWithInvalidLayers = self->mDecoratorsWithInvalidLayers;
  self->mDecoratorsWithInvalidLayers = v26;

  *(_WORD *)&self->mAllowsSelectionKnobs = 257;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  -[CRLInteractiveCanvasController setDisplaysMultiselectionWithSingleBounds:](self, "setDisplaysMultiselectionWithSingleBounds:", objc_msgSend(v28, "BOOLForKey:", CFSTR("CRLMultiSelectionShouldDisplaySingleBoundsUserDefault")));

  self->mVersionFidelityAlertWasShownIsValid = 0;
  self->mVersionFidelityAlertWasShown = 0;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v29, "addObserver:forKeyPath:options:context:", self, CFSTR("CRLScenesDebugView"), 0, CFSTR("CRLScenesDebugView"));

  v30 = -[CRLCanvasDotGridBackground initWithICC:]([_TtC8Freeform26CRLCanvasDotGridBackground alloc], "initWithICC:", self);
  mCanvasBackground = self->mCanvasBackground;
  self->mCanvasBackground = &v30->super;

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CRLInteractiveCanvasController *mTextInputResponderSource;
  objc_super v15;

  if (!self->mHasBeenTornDown)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254110);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E248F4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254130);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController dealloc]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 548, 0, "Must call -teardown on ICC before it is deallocated");

  }
  if (self->mHadLayerHost && !self->mLayerHostHasBeenTornDown)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254150);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E24874();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254170);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController dealloc]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 549, 0, "Must call -teardown on CVC before ICC is deallocated");

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->mLayerHost);

  if (WeakRetained)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254190);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E247F4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012541B0);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController dealloc]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 550, 0, "Layer host must be cleared out of ICC before it is deallocated, to avoid a zombie crash.");

  }
  objc_storeWeak((id *)&self->mLayerHost, 0);
  -[CRLInteractiveCanvasController removeCommonObservers](self, "removeCommonObservers");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v13, "removeObserver:", self);

  mTextInputResponderSource = self->mTextInputResponderSource;
  if (mTextInputResponderSource)
    --mTextInputResponderSource->mTextInputResponderShareCount;
  v15.receiver = self;
  v15.super_class = (Class)CRLInteractiveCanvasController;
  -[CRLInteractiveCanvasController dealloc](&v15, "dealloc");
}

- (BOOL)isCanvasBackgroundAlignmentSnappingEnabled
{
  CRLInteractiveCanvasControllerDelegate **p_mDelegate;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;
  unsigned __int8 v9;

  p_mDelegate = &self->mDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  if (WeakRetained
    && (v5 = WeakRetained,
        v6 = objc_loadWeakRetained((id *)p_mDelegate),
        v7 = objc_opt_respondsToSelector(v6, "wantsToShowCanvasDotGridOnInteractiveCanvasController:"),
        v6,
        v5,
        (v7 & 1) != 0))
  {
    v8 = objc_loadWeakRetained((id *)p_mDelegate);
    v9 = objc_msgSend(v8, "wantsToShowCanvasDotGridOnInteractiveCanvasController:", self);

  }
  else
  {
    v9 = 0;
  }
  return +[CRLCanvasGuideController shouldSnapToGrid](CRLCanvasGuideController, "shouldSnapToGrid") & v9;
}

- (int64_t)mathHintsMode
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController mathCalculationController](self, "mathCalculationController"));
  v3 = objc_msgSend(v2, "mathHintsMode");

  return (int64_t)v3;
}

- (void)setMathHintsMode:(int64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController mathCalculationController](self, "mathCalculationController"));
  objc_msgSend(v4, "setMathHintsMode:", a3);

}

- (id)methodSignatureForSelector:(SEL)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v14;
  objc_super v15;
  char __str[32];

  v15.receiver = self;
  v15.super_class = (Class)CRLInteractiveCanvasController;
  if (-[CRLInteractiveCanvasController respondsToSelector:](&v15, "respondsToSelector:"))
  {
    v14.receiver = self;
    v14.super_class = (Class)CRLInteractiveCanvasController;
    v5 = -[CRLInteractiveCanvasController methodSignatureForSelector:](&v14, "methodSignatureForSelector:", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue(v5);
  }
  else
  {
    v7 = (void *)qword_101415588;
    if (!qword_101415588)
    {
      if (snprintf(__str, 0x20uLL, "%s%s%s%s", "v", "@", ":", "@") >= 0x20)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_1012541D0);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E24974();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_1012541F0);
        v8 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController methodSignatureForSelector:]"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 599, 0, "ObjCTypes string overflowed");

      }
      v11 = objc_claimAutoreleasedReturnValue(+[NSMethodSignature signatureWithObjCTypes:](NSMethodSignature, "signatureWithObjCTypes:", __str));
      v12 = (void *)qword_101415588;
      qword_101415588 = v11;

      v7 = (void *)qword_101415588;
    }
    v6 = v7;
  }
  return v6;
}

+ (BOOL)selectorIsActionMethod:(SEL)a3
{
  char *Name;
  char *v4;

  Name = (char *)sel_getName(a3);
  v4 = &Name[strlen(Name) - 1];
  return *v4 == 58 && strchr(Name, 58) == v4;
}

- (BOOL)respondsToSelector:(SEL)a3 withSender:(id)a4
{
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CRLInteractiveCanvasController;
  if (-[CRLInteractiveCanvasController respondsToSelector:](&v11, "respondsToSelector:", a3))
  {
    v7 = 1;
  }
  else if (+[CRLInteractiveCanvasController selectorIsActionMethod:](CRLInteractiveCanvasController, "selectorIsActionMethod:", a3))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editorController](self, "editorController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "editorForEditAction:withSender:", a3, v6));
    v7 = v9 != 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  return -[CRLInteractiveCanvasController respondsToSelector:withSender:](self, "respondsToSelector:withSender:", a3, 0);
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  objc_super v16;
  void *v17;

  v4 = a3;
  v5 = (char *)objc_msgSend(v4, "selector");
  v17 = 0;
  objc_msgSend(v4, "getArgument:atIndex:", &v17, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editorController](self, "editorController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "editorForEditAction:withSender:", v5, v17));

  if ((objc_opt_respondsToSelector(v7, v5) & 1) != 0)
  {
    objc_msgSend(v4, "invokeWithTarget:", v7);
    goto LABEL_22;
  }
  v8 = v17;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
  if (v8 == v9 || objc_msgSend(CFSTR("UIEditingInteraction"), "isEqual:", v17))
  {
    if (v5 == "cut:" || v5 == "copy:")
    {

LABEL_10:
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101254210);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E249F4();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101254230);
      v11 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController forwardInvocation:]"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 659, 0, "The OS undo gestures should not be sending us selectors we can't respond to!");

      goto LABEL_22;
    }

    if (v5 == "paste:")
      goto LABEL_10;
  }
  else
  {

  }
  v14 = v17;
  objc_opt_class(UIKeyCommand, v10);
  if ((objc_opt_isKindOfClass(v14, v15) & 1) == 0)
  {
    v16.receiver = self;
    v16.super_class = (Class)CRLInteractiveCanvasController;
    -[CRLInteractiveCanvasController doesNotRecognizeSelector:](&v16, "doesNotRecognizeSelector:", v5);
  }
LABEL_22:

}

- (void)p_teardownCanvasEditor
{
  void *v3;
  id v4;
  CRLEditorController *mEditorController;
  CRLCanvasSelection *v6;
  CRLCanvasEditor *mCanvasEditor;
  CRLEditorController *v8;

  if (self->mCanvasEditor)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditorController currentEditors](self->mEditorController, "currentEditors"));
    v4 = objc_msgSend(v3, "indexOfObjectIdenticalTo:", self->mCanvasEditor);

    if (v4 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      mEditorController = self->mEditorController;
      v6 = objc_alloc_init(CRLCanvasSelection);
      -[CRLEditorController setSelection:forEditor:](mEditorController, "setSelection:forEditor:", v6, self->mCanvasEditor);

      -[CRLEditorController setSelectionPathToPopEditor:](self->mEditorController, "setSelectionPathToPopEditor:", self->mCanvasEditor);
    }
    -[CRLCanvasEditor teardown](self->mCanvasEditor, "teardown");
    mCanvasEditor = self->mCanvasEditor;
    self->mCanvasEditor = 0;

  }
  v8 = self->mEditorController;
  self->mEditorController = 0;

}

- (void)teardownCollaboratorCursorInfrastructureInvalidatingLayers:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = a3;
  self->mCollaboratorCursorsInvalidated = 1;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable crl_allObjects](self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary, "crl_allObjects", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "teardown");
        if (v3)
          -[CRLInteractiveCanvasController invalidateLayersForDecorator:](self, "invalidateLayersForDecorator:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  -[NSMutableSet removeAllObjects](self->mCurrentCollaboratorPresences, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->mCollaboratorPresenceToCollaboratorHUDControllerDictionaryForFastSizing, "removeAllObjects");
}

- (void)teardown
{
  _TtC8Freeform24CRLMultiselectResizeInfo *mMultiselectResizeInfo;
  void *v4;
  void *v5;
  NSSet *mInfosPreviouslyShowingCollabCursors;
  void *v7;
  void *v8;
  void *v9;

  self->mIsTearingDown = 1;
  +[NSObject cancelPreviousPerformRequestsWithTarget:](NSObject, "cancelPreviousPerformRequestsWithTarget:", self);
  -[CRLInteractiveCanvasController p_setCurrentlyScrolling:](self, "p_setCurrentlyScrolling:", 0);
  -[CRLInteractiveCanvasController cancelScrollToCurrentSelectionPathAfterLayout](self, "cancelScrollToCurrentSelectionPathAfterLayout");
  -[CRLInteractiveCanvasController teardownCollaboratorCursorInfrastructureInvalidatingLayers:](self, "teardownCollaboratorCursorInfrastructureInvalidatingLayers:", 0);
  -[CRLInteractiveCanvasController teardownBackgroundRendering](self, "teardownBackgroundRendering");
  if (self->mEditorController)
    -[CRLInteractiveCanvasController endEditing](self, "endEditing");
  mMultiselectResizeInfo = self->mMultiselectResizeInfo;
  self->mMultiselectResizeInfo = 0;

  -[CRLInteractiveCanvasController teardownTextInputResponder](self, "teardownTextInputResponder");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController gestureDispatcher](self, "gestureDispatcher"));
  objc_msgSend(v4, "teardown");

  -[CRLCanvas teardown](self->mCanvas, "teardown");
  if (self->mCanvasEditor)
    -[CRLInteractiveCanvasController p_teardownCanvasEditor](self, "p_teardownCanvasEditor");
  -[CRLInteractiveCanvasLayerUpdater teardown](self->mLayerUpdater, "teardown");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController collaboratorCursorDelegate](self, "collaboratorCursorDelegate"));
  objc_msgSend(v5, "willTeardownRenderer:", self);

  -[CRLInteractiveCanvasController setCollaboratorCursorDelegate:](self, "setCollaboratorCursorDelegate:", 0);
  mInfosPreviouslyShowingCollabCursors = self->mInfosPreviouslyShowingCollabCursors;
  self->mInfosPreviouslyShowingCollabCursors = 0;

  -[CRLInteractiveCanvasController setFreehandDrawingToolkit:](self, "setFreehandDrawingToolkit:", 0);
  -[CRLInteractiveCanvasController setDelegate:](self, "setDelegate:", 0);
  -[CRLInteractiveCanvasController p_endObservingDocumentRootIfNeeded](self, "p_endObservingDocumentRootIfNeeded");
  -[NSMutableSet removeAllObjects](self->mNotificationsToPostWithValidLayouts, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->mBlocksToPerformOnMainThreadWithValidLayouts, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->mRepsToSetNeedsDisplay, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->mRepsToRectsToInvalidate, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->mRepsDrawnIntoAncestorToSetNeedsDisplayOnUpdatedGeometry, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->mDecorators, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->mDecoratorsWithInvalidLayers, "removeAllObjects");
  *(_WORD *)&self->mIsTearingDown = 256;
  if (self->mEditorController)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254250);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E24A74();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254270);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController teardown]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 777, 0, "expected nil value for '%{public}s'", "mEditorController");

  }
}

- (void)layerHostHasBeenTornDown
{
  self->mLayerHostHasBeenTornDown = 1;
}

- (void)setShowGrayOverlay:(BOOL)a3
{
  id v3;

  self->mShowGrayOverlay = a3;
  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvas](self, "canvas"));
  objc_msgSend(v3, "i_setLayersInvalidWithoutInvalidatingAnySpecificLayers");

}

- (void)setLayerHost:(id)a3
{
  id WeakRetained;
  id v5;
  id obj;

  if (a3)
    self->mHadLayerHost = 1;
  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->mLayerHost);
  objc_msgSend(WeakRetained, "removeCommonObservers");

  v5 = objc_storeWeak((id *)&self->mLayerHost, obj);
  objc_msgSend(obj, "addCommonObservers");

  -[CRLInteractiveCanvasController updateCanvasDotGridVisibilityIfNeeded](self, "updateCanvasDotGridVisibilityIfNeeded");
}

- (BOOL)p_shouldTimeoutCollabCursor
{
  return 1;
}

- (id)p_sourceInteractionSourceForNotficiationUserInfo
{
  if (self->mCurrentInteractionSource)
    return self->mCurrentInteractionSource;
  else
    return &stru_1012A72B0;
}

- (CRLInteractiveCanvasLayerHelper)i_interactiveCanvasLayerHelper
{
  uint64_t v3;

  objc_opt_class(CRLInteractiveCanvasLayerHelper, a2);
  return (CRLInteractiveCanvasLayerHelper *)sub_100221D0C(v3, self->mLayerUpdater);
}

- (void)teardownBackgroundRendering
{
  NSMutableArray *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v3 = self->mBackgroundRenderingObjects;
  objc_sync_enter(v3);
  v4 = -[NSMutableArray copy](self->mBackgroundRenderingObjects, "copy");
  objc_sync_exit(v3);

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "teardownBackgroundRendering", (_QWORD)v9);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)addBackgroundRenderingObject:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *mBackgroundRenderingObjects;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v8 = a3;
  v4 = self->mBackgroundRenderingObjects;
  objc_sync_enter(v4);
  mBackgroundRenderingObjects = self->mBackgroundRenderingObjects;
  if (!mBackgroundRenderingObjects)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->mBackgroundRenderingObjects;
    self->mBackgroundRenderingObjects = v6;

    mBackgroundRenderingObjects = self->mBackgroundRenderingObjects;
  }
  -[NSMutableArray addObject:](mBackgroundRenderingObjects, "addObject:", v8);
  objc_sync_exit(v4);

}

- (void)removeBackgroundRenderingObject:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v4 = a3;
  v5 = self->mBackgroundRenderingObjects;
  objc_sync_enter(v5);
  v6 = -[NSMutableArray indexOfObject:](self->mBackgroundRenderingObjects, "indexOfObject:", v4);
  if (v6 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254290);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E24B4C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012542B0);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100E24B00(v9, (uint64_t)&v12, v7);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController removeBackgroundRenderingObject:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 848, 0, "removeBackgroundRenderingObject called on an object that is not in the array");

  }
  -[NSMutableArray removeObjectAtIndex:](self->mBackgroundRenderingObjects, "removeObjectAtIndex:", v6);
  objc_sync_exit(v5);

}

- (BOOL)textMagnifierIsUp
{
  return 0;
}

- (void)setDelegate:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  CRLPKDrawingProvider *v11;
  CRLPKDrawingProvider *mPKDrawingProvider;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);

  if (WeakRetained != v4)
  {
    v6 = objc_loadWeakRetained((id *)&self->mDelegate);

    if (v6)
    {
      -[CRLInteractiveCanvasController p_endObservingDocumentRootIfNeeded](self, "p_endObservingDocumentRootIfNeeded");
      if (v4)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_1012542D0);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E24BCC();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_1012542F0);
        v7 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController setDelegate:]"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 880, 0, "Unexpected re-use of ICC with a different delegate");

      }
    }
    objc_storeWeak((id *)&self->mDelegate, v4);
    if (!-[CRLPKDrawingProvider isTornDown](self->mPKDrawingProvider, "isTornDown"))
      -[CRLPKDrawingProvider teardown](self->mPKDrawingProvider, "teardown");
    v10 = objc_loadWeakRetained((id *)&self->mDelegate);

    if (v10)
    {
      -[CRLInteractiveCanvasController p_beginObservingDocumentRoot](self, "p_beginObservingDocumentRoot");
      -[CRLInteractiveCanvasController updateCanvasDotGridVisibilityIfNeeded](self, "updateCanvasDotGridVisibilityIfNeeded");
      if (+[CRLFeatureFlagGroup isEasierConnectionLinesEnabled](_TtC8Freeform19CRLFeatureFlagGroup, "isEasierConnectionLinesEnabled"))
      {
        -[CRLInteractiveCanvasController updateConnectorKnobVisibilityIfNeeded](self, "updateConnectorKnobVisibilityIfNeeded");
      }
      v11 = -[CRLPKDrawingProvider initWithICC:]([CRLPKDrawingProvider alloc], "initWithICC:", self);
      mPKDrawingProvider = self->mPKDrawingProvider;
      self->mPKDrawingProvider = v11;

    }
  }

}

- (void)p_beginObservingDocumentRoot
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CRLCanvasLayoutChangeObserver *v8;
  void *v9;
  void *v10;
  void *v11;
  CRLCanvasLayoutChangeObserver *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editingCoordinator](self, "editingCoordinator"));

  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254310);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E24C4C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254330);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController p_beginObservingDocumentRoot]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 907, 0, "invalid nil value for '%{public}s'", "self.editingCoordinator");

  }
  v8 = [CRLCanvasLayoutChangeObserver alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editingCoordinator](self, "editingCoordinator"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "changeNotifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvas layoutController](self->mCanvas, "layoutController"));
  v12 = -[CRLCanvasLayoutChangeObserver initWithChangeNotifier:layoutController:](v8, "initWithChangeNotifier:layoutController:", v10, v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvas layoutController](self->mCanvas, "layoutController"));
  objc_msgSend(v13, "setI_layoutRegistrationObserver:", v12);

  -[CRLCanvasLayoutChangeObserver setInteractiveCanvasController:](v12, "setInteractiveCanvasController:", self);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editingCoordinator](self, "editingCoordinator"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "changeNotifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController board](self, "board"));
  objc_msgSend(v15, "addObserver:forChangeSource:", self, v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editingCoordinator](self, "editingCoordinator"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "changeNotifier"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController board](self, "board"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "rootContainer"));
  objc_msgSend(v18, "addObserver:forChangeSource:", self, v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editingCoordinator](self, "editingCoordinator"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "collaboratorCursorCoordinator"));
  objc_msgSend(v22, "registerCursorRenderer:", self);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editingCoordinator](self, "editingCoordinator"));
  -[CRLInteractiveCanvasController setDocumentIsSharedReadOnly:](self, "setDocumentIsSharedReadOnly:", objc_msgSend(v23, "canPerformUserAction") ^ 1);

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotification CRLBoardRealTimeStateDidChange](NSNotification, "CRLBoardRealTimeStateDidChange"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editingCoordinator](self, "editingCoordinator"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "mainBoard"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "p_realTimeStateDidChange:", v24, v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotification CRLBoardRealTimeNewParticipantDidJoinSession](NSNotification, "CRLBoardRealTimeNewParticipantDidJoinSession"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "p_realTimeSessionNewParticipantDidJoin:", v27, 0);

}

- (void)p_realTimeSessionNewParticipantDidJoin:(id)a3
{
  -[CRLInteractiveCanvasController sendRealTimeEnterToPeersIfNecessary](self, "sendRealTimeEnterToPeersIfNecessary", a3);
  -[CRLInteractiveCanvasController sendSelectionPathToPeersIfNecessary](self, "sendSelectionPathToPeersIfNecessary");
}

- (void)p_realTimeStateDidChange:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editingCoordinator](self, "editingCoordinator", a3));
  v5 = objc_msgSend(v4, "isInRealTimeSyncSession");

  if ((v5 & 1) != 0)
  {
    if (-[NSMapTable count](self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary, "count"))
    {
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable crl_allObjects](self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary, "crl_allObjects", 0));
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v12;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v12 != v9)
              objc_enumerationMutation(v6);
            -[CRLInteractiveCanvasController invalidateLayersForDecorator:](self, "invalidateLayersForDecorator:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10));
            v10 = (char *)v10 + 1;
          }
          while (v8 != v10);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        }
        while (v8);
      }

    }
    else
    {
      -[CRLCanvas i_setLayersInvalidWithoutInvalidatingAnySpecificLayers](self->mCanvas, "i_setLayersInvalidWithoutInvalidatingAnySpecificLayers");
    }
    -[CRLInteractiveCanvasController sendSelectionPathToPeersIfNecessary](self, "sendSelectionPathToPeersIfNecessary");
  }
  else
  {
    -[CRLInteractiveCanvasController teardownCollaboratorCursorInfrastructureInvalidatingLayers:](self, "teardownCollaboratorCursorInfrastructureInvalidatingLayers:", 1);
  }
}

- (void)p_endObservingDocumentRootIfNeeded
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController delegate](self, "delegate"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvas layoutController](self->mCanvas, "layoutController"));
    objc_msgSend(v5, "setI_layoutRegistrationObserver:", 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editingCoordinator](self, "editingCoordinator"));
    if (!v6)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101254350);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E24CD8();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101254370);
      v7 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController p_endObservingDocumentRootIfNeeded]"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 948, 0, "invalid nil value for '%{public}s'", "self.editingCoordinator");

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editingCoordinator](self, "editingCoordinator"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "changeNotifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController board](self, "board"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "rootContainer"));
    objc_msgSend(v11, "removeObserver:forChangeSource:", self, v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotification CRLBoardRealTimeStateDidChange](NSNotification, "CRLBoardRealTimeStateDidChange"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editingCoordinator](self, "editingCoordinator"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mainBoard"));
    objc_msgSend(v4, "removeObserver:name:object:", self, v14, v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotification CRLBoardRealTimeNewParticipantDidJoinSession](NSNotification, "CRLBoardRealTimeNewParticipantDidJoinSession"));
    objc_msgSend(v4, "removeObserver:name:object:", self, v17, 0);

  }
}

- (_TtC8Freeform8CRLBoard)board
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254390);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E24D64();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012543B0);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController board]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 956, 0, "This operation must only be performed on the main thread.");

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editingCoordinator](self, "editingCoordinator"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mainBoard"));

  return (_TtC8Freeform8CRLBoard *)v7;
}

- (_TtC8Freeform21CRLEditingCoordinator)editingCoordinator
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController delegate](self, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "editingCoordinatorForInteractiveCanvasController:", self));

  return (_TtC8Freeform21CRLEditingCoordinator *)v4;
}

- (_TtC8Freeform20CRLCommandController)commandController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editingCoordinator](self, "editingCoordinator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "commandController"));

  return (_TtC8Freeform20CRLCommandController *)v3;
}

- (CRLChangeNotifier)changeNotifier
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editingCoordinator](self, "editingCoordinator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "changeNotifier"));

  return (CRLChangeNotifier *)v3;
}

- (BOOL)shouldSuppressFontSmoothing
{
  return 1;
}

- (id)backgroundColorAtUnscaledCanvasPoint:(CGPoint)a3
{
  return +[CRLColor whiteColor](CRLColor, "whiteColor", a3.x, a3.y);
}

- (CGSize)defaultMinimumUnscaledCanvasSize
{
  double width;
  double height;
  CGSize result;

  width = CGSizeZero.width;
  height = CGSizeZero.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)canvasLayoutInvalidated:(id)a3
{
  void *v4;
  id v5;

  if (+[NSThread isMainThread](NSThread, "isMainThread", a3))
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "canvasLayer"));
    objc_msgSend(v4, "setNeedsLayout");

  }
}

- (void)canvasDidInvalidateAllLayers:(id)a3
{
  self->mAllDecoratorLayersAreInvalid = 1;
}

- (void)i_canvasDidUpdateVisibleBounds
{
  double y;
  double width;
  double height;

  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  if (!self->mDynamicallyZooming)
    -[CRLInteractiveCanvasController setP_visibleBoundsRectForTiling:](self, "setP_visibleBoundsRectForTiling:", CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
  -[CRLInteractiveCanvasController setP_visibleUnscaledRect:](self, "setP_visibleUnscaledRect:", CGRectNull.origin.x, y, width, height);
}

- (void)canvasWillValidateLayouts:(id)a3
{
  CRLInteractiveCanvasControllerDelegate **p_mDelegate;
  id WeakRetained;
  char v6;
  id v7;

  p_mDelegate = &self->mDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  v6 = objc_opt_respondsToSelector(WeakRetained, "interactiveCanvasControllerWillValidateLayouts:");

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_mDelegate);
    objc_msgSend(v7, "interactiveCanvasControllerWillValidateLayouts:", self);

  }
}

- (void)canvasDidValidateLayouts:(id)a3
{
  CRLInteractiveCanvasControllerDelegate **p_mDelegate;
  id WeakRetained;
  char v6;
  id v7;

  p_mDelegate = &self->mDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  v6 = objc_opt_respondsToSelector(WeakRetained, "interactiveCanvasControllerDidValidateLayouts:");

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_mDelegate);
    objc_msgSend(v7, "interactiveCanvasControllerDidValidateLayouts:", self);

  }
}

- (void)canvasDidLayout:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  char v7;
  id v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  unsigned __int8 v13;
  BOOL v14;
  _QWORD v15[5];

  v4 = a3;
  if (!self->mHasCanvasEverLaidOut)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController infosToDisplay](self, "infosToDisplay"));
    self->mHasCanvasEverLaidOut = objc_msgSend(v5, "count") != 0;

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  v7 = objc_opt_respondsToSelector(WeakRetained, "interactiveCanvasControllerDidLayout:");

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->mDelegate);
    objc_msgSend(v8, "interactiveCanvasControllerDidLayout:", self);

  }
  -[CRLInteractiveCanvasController p_consumeRepsDrawnIntoAncestorToSetNeedsDisplayOnUpdatedGeometry](self, "p_consumeRepsDrawnIntoAncestorToSetNeedsDisplayOnUpdatedGeometry");
  if (+[NSThread isMainThread](NSThread, "isMainThread")
    && !-[CRLInteractiveCanvasController textMagnifierIsUp](self, "textMagnifierIsUp"))
  {
    if (self->mNotifyTIRTextChangedAfterLayout)
      self->mNotifyTIRTextChangedAfterLayout = 0;
    if (self->mNotifyTIRSelectionChangedAfterLayout >= 1)
      self->mNotifyTIRSelectionChangedAfterLayout = 0;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v9, "postNotificationName:object:", CFSTR("CRLInteractiveCanvasControllerDidLayoutNotification"), self);

  if (-[CRLInteractiveCanvasController p_areAnyCollaboratorsPresent](self, "p_areAnyCollaboratorsPresent"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editorController](self, "editorController"));
    v11 = objc_msgSend(v10, "isChangingSelection");

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvas](self, "canvas"));
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10034F214;
      v15[3] = &unk_10122D110;
      v15[4] = self;
      objc_msgSend(v12, "performBlockAfterLayoutIfNecessary:", v15);

    }
    else
    {
      v13 = -[CRLInteractiveCanvasController p_currentSelectionIsOnscreen](self, "p_currentSelectionIsOnscreen");
      v14 = v13;
      if (self->mSelectionIsCurrentlyOnscreen && self->mDidTransform && !self->mCurrentlyScrolling && (v13 & 1) == 0)
        -[CRLInteractiveCanvasController scrollCurrentSelectionToVisibleWithOptions:](self, "scrollCurrentSelectionToVisibleWithOptions:", 0);
      self->mDidTransform = 0;
      self->mSelectionIsCurrentlyOnscreen = v14;
    }
  }

}

- (void)p_collabParticipantsDidChange:(id)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvas topLevelReps](self->mCanvas, "topLevelReps", a3, 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i), "recursivelyPerformSelector:", "collaborationParticipantsDidChange");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (BOOL)p_currentSelectionIsOnscreen
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  BOOL v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  uint64_t v18;
  char v19;
  void *v20;
  BOOL v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  v3 = objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController delegate](self, "delegate"));
  if (!v3)
    return 0;
  v4 = (void *)v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editorController](self, "editorController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectionPath"));

  if (!v6)
    return 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editorController](self, "editorController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectionPath"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layoutsForSelectionPath:](self, "layoutsForSelectionPath:", v8));
  -[CRLInteractiveCanvasController visibleUnscaledRect](self, "visibleUnscaledRect");
  v42 = CGRectInset(v41, 4.0, 4.0);
  y = v42.origin.y;
  x = v42.origin.x;
  height = v42.size.height;
  width = v42.size.width;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (!v11)
  {
    v21 = 0;
    goto LABEL_23;
  }
  v12 = v11;
  v13 = 0;
  v14 = CGRectNull.origin.x;
  v15 = CGRectNull.origin.y;
  v16 = CGRectNull.size.width;
  v17 = CGRectNull.size.height;
  v18 = *(_QWORD *)v37;
  v19 = 1;
  while (2)
  {
    v20 = 0;
    v21 = v13;
    do
    {
      if (*(_QWORD *)v37 != v18)
        objc_enumerationMutation(v10);
      v22 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)v20);
      -[CRLInteractiveCanvasController rectInRootForScrollingToSelectionPath:onLayout:allowingZooming:](self, "rectInRootForScrollingToSelectionPath:onLayout:allowingZooming:", v8, v22, 0, *(_QWORD *)&height, *(_QWORD *)&width, *(_QWORD *)&y, *(_QWORD *)&x, (_QWORD)v36);
      v27 = v23;
      v28 = v24;
      v29 = v25;
      v30 = v26;
      if ((v19 & 1) != 0)
      {
        v17 = v26;
        v16 = v25;
        v15 = v24;
        v14 = v23;
        if ((objc_msgSend(v22, "selectionMustBeEntirelyOnscreenToCountAsVisibleInSelectionPath:", v8) & 1) != 0)
          goto LABEL_13;
      }
      else
      {
        v43.origin.x = v14;
        v43.origin.y = v15;
        v43.size.width = v16;
        v43.size.height = v17;
        v47.origin.x = v27;
        v47.origin.y = v28;
        v47.size.width = v29;
        v47.size.height = v30;
        v44 = CGRectUnion(v43, v47);
        v14 = v44.origin.x;
        v15 = v44.origin.y;
        v16 = v44.size.width;
        v17 = v44.size.height;
        if (v21
          || objc_msgSend(v22, "selectionMustBeEntirelyOnscreenToCountAsVisibleInSelectionPath:", v8))
        {
LABEL_13:
          -[CRLInteractiveCanvasController visibleUnscaledRect](self, "visibleUnscaledRect");
          v48.origin.x = v14;
          v48.origin.y = v15;
          v48.size.width = v16;
          v48.size.height = v17;
          v21 = 1;
          if (CGRectContainsRect(v45, v48))
            goto LABEL_23;
          goto LABEL_17;
        }
      }
      v46.origin.x = v14;
      v46.origin.y = v15;
      v46.size.width = v16;
      v46.size.height = v17;
      v49.origin.y = y;
      v49.origin.x = x;
      v49.size.height = height;
      v49.size.width = width;
      if (CGRectIntersectsRect(v46, v49))
      {
        v21 = 1;
        goto LABEL_23;
      }
      v21 = 0;
LABEL_17:
      v19 = 0;
      v20 = (char *)v20 + 1;
    }
    while (v12 != v20);
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    v19 = 0;
    v13 = v21;
    v21 = 0;
    if (v12)
      continue;
    break;
  }
LABEL_23:

  return v21;
}

- (void)canvasWillUpdateRepsFromLayouts:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSSet *v8;
  NSSet *mRepsToHideForCurrentTracker;
  id v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController tmCoordinator](self, "tmCoordinator", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "controllingTM"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tracker"));

  if (!v10
    || (objc_opt_respondsToSelector(v10, "disallowCanvasGrowingWhileTracking") & 1) == 0
    || (objc_msgSend(v10, "disallowCanvasGrowingWhileTracking") & 1) == 0)
  {
    if (-[CRLInteractiveCanvasController resizeCanvasOnLayout](self, "resizeCanvasOnLayout"))
    {
      -[CRLInteractiveCanvasController p_updateCanvasSizeFromLayouts](self, "p_updateCanvasSizeFromLayouts");
    }
    else if (-[CRLInteractiveCanvasController shouldCanvasScrollingSizeGrowToFitBoardContent](self, "shouldCanvasScrollingSizeGrowToFitBoardContent"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "canvasLayer"));

      objc_msgSend(v7, "fixFrameAndScrollView");
    }
  }
  if ((objc_opt_respondsToSelector(v10, "repsToHide") & 1) != 0)
  {
    v8 = (NSSet *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "repsToHide"));
    mRepsToHideForCurrentTracker = self->mRepsToHideForCurrentTracker;
    self->mRepsToHideForCurrentTracker = v8;
  }
  else
  {
    mRepsToHideForCurrentTracker = self->mRepsToHideForCurrentTracker;
    self->mRepsToHideForCurrentTracker = 0;
  }

  -[CRLInteractiveCanvasController i_canvasDidUpdateVisibleBounds](self, "i_canvasDidUpdateVisibleBounds");
}

- (BOOL)i_currentlySuppressingLayerUpdates
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController i_interactiveCanvasLayerHelper](self, "i_interactiveCanvasLayerHelper"));
  v3 = objc_msgSend(v2, "currentlySuppressingLayerUpdates");

  return v3;
}

- (void)i_beginSuppressingLayerUpdatesExceptForReps:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[CRLInteractiveCanvasController p_validateLayerSuppressionAPIAccess](self, "p_validateLayerSuppressionAPIAccess");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController i_interactiveCanvasLayerHelper](self, "i_interactiveCanvasLayerHelper"));

  if (!v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012543D0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E24DE4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012543F0);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController i_beginSuppressingLayerUpdatesExceptForReps:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 1196, 0, "invalid nil value for '%{public}s'", "self.i_interactiveCanvasLayerHelper");

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController i_interactiveCanvasLayerHelper](self, "i_interactiveCanvasLayerHelper"));
  objc_msgSend(v9, "beginSuppressingLayerUpdatesExceptForReps:", v4);

}

- (void)i_endSuppressingLayerUpdates
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[CRLInteractiveCanvasController p_validateLayerSuppressionAPIAccess](self, "p_validateLayerSuppressionAPIAccess");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController i_interactiveCanvasLayerHelper](self, "i_interactiveCanvasLayerHelper"));

  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254410);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E24E70();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254430);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController i_endSuppressingLayerUpdates]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 1202, 0, "invalid nil value for '%{public}s'", "self.i_interactiveCanvasLayerHelper");

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController i_interactiveCanvasLayerHelper](self, "i_interactiveCanvasLayerHelper"));
  objc_msgSend(v7, "endSuppressingLayerUpdates");

}

- (void)p_validateLayerSuppressionAPIAccess
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254450);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E24F7C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254470);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController p_validateLayerSuppressionAPIAccess]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 1207, 0, "This operation must only be performed on the main thread.");

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editingCoordinator](self, "editingCoordinator"));
  if ((objc_msgSend(v6, "areIncomingCollaborativeChangesSuspended") & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254490);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E24EFC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012544B0);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController p_validateLayerSuppressionAPIAccess]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 1214, 0, "Should not suppress layer updates unless collab is suspended!");

  }
}

- (void)updateLayerTreeForInteractiveCanvas:(id)a3
{
  CRLInteractiveCanvasController *v3;
  void *v4;
  unsigned int v5;
  CRLRealTimeSyncDecorator *mLiveSyncDecorator;
  CRLRealTimeSyncDecorator *v7;
  CRLRealTimeSyncDecorator *v8;
  CRLRealTimeSyncDecorator *v9;
  void *v10;
  NSMutableSet *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  CRLInteractiveCanvasController *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *i;
  id v27;
  NSSet *v28;
  id v29;
  id v30;
  uint64_t v31;
  void *j;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  void *k;
  void *v40;
  NSSet *v41;
  NSSet *mInfosPreviouslyShowingCollabCursors;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  void *m;
  NSMutableSet *v48;
  id v49;
  id v50;
  uint64_t v51;
  void *n;
  uint64_t v53;
  void *v54;
  void *v55;
  void *ii;
  void *v57;
  id v58;
  id v59;
  id v60;
  uint64_t v61;
  void *jj;
  void *v63;
  void *v64;
  void *v65;
  unsigned int v66;
  id v67;
  NSMutableSet *v68;
  id v69;
  id v70;
  NSMutableSet *mVisibleCollaboratorPresences;
  NSMutableSet *v72;
  id v73;
  NSMutableSet *obj;
  CRLInteractiveCanvasController *v75;
  uint64_t v76;
  id v77;
  id v78;
  _QWORD v79[5];
  _QWORD block[2];
  void (*v81)(id *);
  void *v82;
  id v83;
  CRLInteractiveCanvasController *v84;
  id v85;
  NSMutableSet *v86;
  __int128 v87;
  __int128 v88;
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
  __int128 v117;
  __int128 v118;
  _BYTE v119[128];
  _BYTE v120[128];
  __int128 buf;
  __int128 v122;
  _BYTE v123[128];
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];
  _BYTE v128[128];

  v3 = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost", a3));
  objc_msgSend(v4, "willUpdateLayerTree");

  v5 = +[CRLRealTimeSyncDecorator shouldShowForICC:](CRLRealTimeSyncDecorator, "shouldShowForICC:", v3);
  mLiveSyncDecorator = v3->mLiveSyncDecorator;
  if (v5)
  {
    if (!mLiveSyncDecorator)
    {
      v7 = -[CRLRealTimeSyncDecorator initWithInteractiveCanvasController:]([CRLRealTimeSyncDecorator alloc], "initWithInteractiveCanvasController:", v3);
      v8 = v3->mLiveSyncDecorator;
      v3->mLiveSyncDecorator = v7;

      -[CRLInteractiveCanvasController addDecorator:](v3, "addDecorator:", v3->mLiveSyncDecorator);
    }
  }
  else if (mLiveSyncDecorator)
  {
    -[CRLInteractiveCanvasController removeDecorator:](v3, "removeDecorator:");
    v9 = v3->mLiveSyncDecorator;
    v3->mLiveSyncDecorator = 0;

  }
  v75 = v3;
  if (v3->mCollaboratorCursorsInvalidated)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v115 = 0u;
    v116 = 0u;
    v117 = 0u;
    v118 = 0u;
    v11 = v3->mCurrentCollaboratorPresences;
    v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v115, v128, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v116;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v116 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v115 + 1) + 8 * (_QWORD)v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController collaboratorCursorDelegate](v3, "collaboratorCursorDelegate"));
          v18 = v3;
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "collaboratorCursorSelectionPathForRenderer:collaboratorPresence:", v3, v16));

          v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController p_repsForCollaboratorCursorSelectionPath:](v18, "p_repsForCollaboratorCursorSelectionPath:", v19));
          if (qword_10147E4E0 != -1)
            dispatch_once(&qword_10147E4E0, &stru_1012544D0);
          v21 = off_1013D91E0;
          if (os_log_type_enabled((os_log_t)off_1013D91E0, OS_LOG_TYPE_INFO))
          {
            LODWORD(buf) = 138543362;
            *(_QWORD *)((char *)&buf + 4) = v20;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Collaborator Cursors: Calling the following reps to invalidate: %{public}@", (uint8_t *)&buf, 0xCu);
          }
          v113 = 0u;
          v114 = 0u;
          v111 = 0u;
          v112 = 0u;
          v22 = v20;
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v111, v127, 16);
          if (v23)
          {
            v24 = v23;
            v25 = *(_QWORD *)v112;
            do
            {
              for (i = 0; i != v24; i = (char *)i + 1)
              {
                if (*(_QWORD *)v112 != v25)
                  objc_enumerationMutation(v22);
                objc_msgSend(*(id *)(*((_QWORD *)&v111 + 1) + 8 * (_QWORD)i), "collaboratorCursorChangedToSelectionPath:", v19);
              }
              v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v111, v127, 16);
            }
            while (v24);
          }

          objc_msgSend(v10, "unionSet:", v22);
          v15 = (char *)v15 + 1;
          v3 = v75;
        }
        while (v15 != v13);
        v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v115, v128, 16);
      }
      while (v13);
    }

    v27 = objc_alloc_init((Class)NSMutableSet);
    v107 = 0u;
    v108 = 0u;
    v109 = 0u;
    v110 = 0u;
    v28 = v3->mInfosPreviouslyShowingCollabCursors;
    v29 = -[NSSet countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v107, v126, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v108;
      do
      {
        for (j = 0; j != v30; j = (char *)j + 1)
        {
          if (*(_QWORD *)v108 != v31)
            objc_enumerationMutation(v28);
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController repForInfo:](v3, "repForInfo:", *(_QWORD *)(*((_QWORD *)&v107 + 1) + 8 * (_QWORD)j)));
          if (v33)
            objc_msgSend(v27, "addObject:", v33);

        }
        v30 = -[NSSet countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v107, v126, 16);
      }
      while (v30);
    }

    v34 = objc_alloc_init((Class)NSMutableSet);
    v103 = 0u;
    v104 = 0u;
    v105 = 0u;
    v106 = 0u;
    v35 = v10;
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v103, v125, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v104;
      do
      {
        for (k = 0; k != v37; k = (char *)k + 1)
        {
          if (*(_QWORD *)v104 != v38)
            objc_enumerationMutation(v35);
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v103 + 1) + 8 * (_QWORD)k), "info"));
          if (v40)
            objc_msgSend(v34, "addObject:", v40);

        }
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v103, v125, 16);
      }
      while (v37);
    }

    v41 = (NSSet *)objc_msgSend(v34, "copy");
    mInfosPreviouslyShowingCollabCursors = v3->mInfosPreviouslyShowingCollabCursors;
    v3->mInfosPreviouslyShowingCollabCursors = v41;

    objc_msgSend(v27, "minusSet:", v35);
    v101 = 0u;
    v102 = 0u;
    v99 = 0u;
    v100 = 0u;
    v43 = v27;
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v99, v124, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v100;
      do
      {
        for (m = 0; m != v45; m = (char *)m + 1)
        {
          if (*(_QWORD *)v100 != v46)
            objc_enumerationMutation(v43);
          objc_msgSend(*(id *)(*((_QWORD *)&v99 + 1) + 8 * (_QWORD)m), "hideCollaboratorCursors");
        }
        v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v99, v124, 16);
      }
      while (v45);
    }

    v3->mCollaboratorCursorsInvalidated = 0;
  }
  v73 = objc_alloc_init((Class)NSMutableSet);
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  v48 = v3->mCurrentCollaboratorPresences;
  v49 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v95, v123, 16);
  if (v49)
  {
    v50 = v49;
    v51 = *(_QWORD *)v96;
    do
    {
      for (n = 0; n != v50; n = (char *)n + 1)
      {
        if (*(_QWORD *)v96 != v51)
          objc_enumerationMutation(v48);
        v53 = *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * (_QWORD)n);
        v54 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController collaboratorCursorDelegate](v3, "collaboratorCursorDelegate"));
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "collaboratorCursorSelectionPathForRenderer:collaboratorPresence:", v3, v53));

        buf = 0u;
        v122 = 0u;
        -[CRLInteractiveCanvasController p_collaboratorHUDPositionForSelectionPath:collaboratorPresence:allowScroll:hudSize:](v3, "p_collaboratorHUDPositionForSelectionPath:collaboratorPresence:allowScroll:hudSize:", v55, v53, 0, 1);
        if (BYTE8(v122) && (_QWORD)v122)
          objc_msgSend(v73, "addObject:", v53);

      }
      v50 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v95, v123, 16);
    }
    while (v50);
  }

  v77 = objc_msgSend(v73, "mutableCopy");
  objc_msgSend(v77, "minusSet:", v3->mVisibleCollaboratorPresences);
  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  obj = v3->mVisibleCollaboratorPresences;
  v78 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v91, v120, 16);
  if (v78)
  {
    v76 = *(_QWORD *)v92;
    do
    {
      for (ii = 0; ii != v78; ii = (char *)ii + 1)
      {
        if (*(_QWORD *)v92 != v76)
          objc_enumerationMutation(obj);
        v57 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * (_QWORD)ii);
        v87 = 0u;
        v88 = 0u;
        v89 = 0u;
        v90 = 0u;
        v58 = v77;
        v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v87, v119, 16);
        if (v59)
        {
          v60 = v59;
          v61 = *(_QWORD *)v88;
          while (2)
          {
            for (jj = 0; jj != v60; jj = (char *)jj + 1)
            {
              if (*(_QWORD *)v88 != v61)
                objc_enumerationMutation(v58);
              v63 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * (_QWORD)jj);
              v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "presenceUUID"));
              v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "presenceUUID"));
              v66 = objc_msgSend(v64, "isEqual:", v65);

              if (v66)
              {
                objc_msgSend(v58, "removeObject:", v63);
                goto LABEL_76;
              }
            }
            v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v87, v119, 16);
            if (v60)
              continue;
            break;
          }
        }
LABEL_76:

      }
      v78 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v91, v120, 16);
    }
    while (v78);
  }

  v67 = -[NSMutableSet copy](v75->mVisibleCollaboratorPresences, "copy");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  v81 = sub_100350770;
  v82 = &unk_10124CAD8;
  v83 = v77;
  v84 = v75;
  v85 = v67;
  v68 = (NSMutableSet *)v73;
  v86 = v68;
  v69 = v67;
  v70 = v77;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
    v81((id *)block);
  else
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  mVisibleCollaboratorPresences = v75->mVisibleCollaboratorPresences;
  v75->mVisibleCollaboratorPresences = v68;
  v72 = v68;

  v79[0] = _NSConcreteStackBlock;
  v79[1] = 3221225472;
  v79[2] = sub_100350968;
  v79[3] = &unk_10122D110;
  v79[4] = v75;
  -[CRLInteractiveCanvasController p_performBlockWithCachedLayoutsForCollaboratorCursors:](v75, "p_performBlockWithCachedLayoutsForCollaboratorCursors:", v79);
  v75->mAllDecoratorLayersAreInvalid = 0;
  -[NSMutableSet removeAllObjects](v75->mDecoratorsWithInvalidLayers, "removeAllObjects");

}

- (void)canvasDidValidateLayoutsWithDependencies:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3));
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("CRLInteractiveCanvasControllerDidValidateLayoutsWithDependenciesNotification"), self);

}

- (CGRect)visibleScaledBoundsForClippingRepsOnCanvas:(id)a3
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  if (self->mCreateRepsForOffscreenLayouts)
  {
    x = CGRectInfinite.origin.x;
    y = CGRectInfinite.origin.y;
    width = CGRectInfinite.size.width;
    height = CGRectInfinite.size.height;
  }
  else
  {
    -[CRLInteractiveCanvasController visibleBoundsRectForTiling](self, "visibleBoundsRectForTiling", a3);
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)additionalVisibleInfosForCanvas:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  if (self->mCreateRepsForOffscreenLayouts)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController selectionModelTranslator](self, "selectionModelTranslator", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editorController](self, "editorController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectionPath"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "boardItemsForSelectionPath:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController dynamicOperationController](self, "dynamicOperationController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allTransformedReps"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", v8));

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v12);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i), "info", (_QWORD)v18));
          objc_msgSend(v11, "addObject:", v17);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v14);
    }

  }
  else
  {
    v11 = v8;
  }

  return v11;
}

- (void)canvas:(id)a3 createdRep:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvasEditor](self, "canvasEditor"));
  objc_msgSend(v6, "repWasCreated:", v5);

}

- (void)presentError:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
  objc_msgSend(v8, "presentError:completionHandler:", v7, v6);

}

- (void)presentErrors:(id)a3 withLocalizedDescription:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
  objc_msgSend(v11, "presentErrors:withLocalizedDescription:completionHandler:", v10, v9, v8);

}

+ (id)keyPathsForValuesAffectingEditorController
{
  return +[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("documentRoot"));
}

- (CRLEditorController)editorController
{
  CRLEditorController *mEditorController;
  CRLEditorController **p_mEditorController;
  uint64_t v5;
  void *v6;
  int64_t mIsFetchingEditorController;
  CRLEditorController *v8;
  CRLEditorController *v9;
  CRLEditorController *v10;
  CRLEditorController *v11;
  CRLEditorController *v12;
  void *v13;
  void *v14;
  void *v15;
  CRLEditorController *v16;
  int64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  p_mEditorController = &self->mEditorController;
  mEditorController = self->mEditorController;
  if (!mEditorController)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController delegate](self, "delegate"));
    v6 = (void *)v5;
    if (v5 && (objc_opt_respondsToSelector(v5, "editorControllerForInteractiveCanvasController:") & 1) != 0)
    {
      mIsFetchingEditorController = self->mIsFetchingEditorController;
      if (mIsFetchingEditorController < 1)
      {
        self->mIsFetchingEditorController = mIsFetchingEditorController + 1;
        v10 = (CRLEditorController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "editorControllerForInteractiveCanvasController:", self));
        v11 = v10;
        v12 = self->mEditorController;
        if (!v12 || v10 == v12)
        {
          objc_storeStrong((id *)p_mEditorController, v10);
        }
        else
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_1012544F0);
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100E250FC();
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101254510);
          v13 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100DE7468(v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController editorController]"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 1401, 0, "editor controller mismatch");

          v16 = *p_mEditorController;
          *p_mEditorController = 0;

        }
        v17 = self->mIsFetchingEditorController;
        if (v17 <= 0)
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101254530);
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100E2507C();
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101254550);
          v18 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100DE7468(v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController editorController]"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 1404, 0, "Negative reentrancy counter");

          v17 = self->mIsFetchingEditorController;
        }
        self->mIsFetchingEditorController = v17 - 1;

      }
      else
      {
        v8 = (CRLEditorController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "editorControllerForInteractiveCanvasController:", self));
        v9 = self->mEditorController;
        self->mEditorController = v8;

      }
    }
    if (*p_mEditorController)
      goto LABEL_39;
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254570);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E24FFC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254590);
    v21 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController editorController]"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v22, v23, 1408, 0, "ICC delegate must provide the editor controller! (You probably need to give it a document selection through canvas selection, too.)");

    if (*p_mEditorController)
    {
LABEL_39:
      -[CRLEditorController setEditingDisabledReasons:](self->mEditorController, "setEditingDisabledReasons:", -[CRLInteractiveCanvasController p_editingDisabledReasons](self, "p_editingDisabledReasons"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v24, "addObserver:selector:name:object:", self, "p_editorControllerDidChangeTextInputEditor:", CFSTR("CRLEditorControllerDidChangeTextInputEditor"), self->mEditorController);
      objc_msgSend(v24, "addObserver:selector:name:object:", self, "p_editorControllerSelectionPathDidChange:", CFSTR("CRLEditorControllerSelectionPathDidChangeNotification"), self->mEditorController);
      objc_msgSend(v24, "addObserver:selector:name:object:", self, "p_editorControllerSelectionDidChangeAndWantsKeyboard:", CFSTR("CRLEditorControllerSelectionDidChangeAndWantsKeyboard"), self->mEditorController);

    }
    mEditorController = *p_mEditorController;
  }
  return mEditorController;
}

- (void)setTextInputResponder:(id)a3
{
  _TtC8Freeform21CRLTextInputResponder *v5;
  void *v6;
  void *v7;
  _TtC8Freeform21CRLTextInputResponder *v8;

  v5 = (_TtC8Freeform21CRLTextInputResponder *)a3;
  if (self->mTextInputResponder != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->mTextInputResponder, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "asiOSCVC"));

    objc_msgSend(v7, "textInputResponderDidChange");
    v5 = v8;
  }

}

- (id)newCanvasEditor
{
  return -[CRLCanvasEditor initWithInteractiveCanvasController:]([CRLCanvasEditor alloc], "initWithInteractiveCanvasController:", self);
}

- (CRLCanvasEditor)canvasEditor
{
  CRLCanvasEditor *mCanvasEditor;
  CRLCanvasEditor *v4;
  CRLCanvasEditor *v5;

  mCanvasEditor = self->mCanvasEditor;
  if (!mCanvasEditor)
  {
    v4 = -[CRLInteractiveCanvasController newCanvasEditor](self, "newCanvasEditor");
    v5 = self->mCanvasEditor;
    self->mCanvasEditor = v4;

    mCanvasEditor = self->mCanvasEditor;
  }
  return mCanvasEditor;
}

- (void)endEditing
{
  -[CRLInteractiveCanvasController endEditingWithFlags:](self, "endEditingWithFlags:", 0);
}

- (void)endEditingWithFlags:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = (id)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editorController](self, "editorController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController selectionModelTranslator](self, "selectionModelTranslator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "selectionPath"));
  *(_QWORD *)&v8 = objc_opt_class(_TtC8Freeform21CRLBoardItemSelection, v7).n128_u64[0];
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mostSpecificSelectionOfClass:", v9, v8));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "selectionPath"));
    v12 = (char *)objc_msgSend(v11, "indexForSelection:", v10);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "selectionPath"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "orderedSelections"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "subarrayWithRange:", 0, v12 + 1));

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[CRLSelectionPath selectionPathWithSelectionArray:](CRLSelectionPath, "selectionPathWithSelectionArray:", v15));
    objc_msgSend(v17, "setSelectionPath:withFlags:", v16, a3);

  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectionPathForInfos:", 0));
    objc_msgSend(v17, "setSelectionPath:withFlags:", v15, a3);
  }

}

- (void)endEditingDiscardingEdits
{
  self->mDiscardingEdits = 1;
  -[CRLInteractiveCanvasController endEditing](self, "endEditing");
  self->mDiscardingEdits = 0;
}

- (BOOL)canZoomToCurrentSelection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController selectionModelTranslator](self, "selectionModelTranslator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editorController](self, "editorController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectionPath"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "boardItemsForSelectionPath:", v5));
  v7 = objc_msgSend(v6, "count") != 0;

  return v7;
}

- (CGPoint)smartZoomCenterForNoSelection
{
  void *v2;
  double v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvas](self, "canvas"));
  objc_msgSend(v2, "unscaledSize");
  v3 = sub_10005FDDC();
  v7 = sub_100061400(v3, v4, v5, v6);
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (void)zoomToCurrentSelection
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editorController](self, "editorController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectionPath"));
  -[CRLInteractiveCanvasController zoomToSelectionPath:](self, "zoomToSelectionPath:", v3);

}

- (void)zoomToFitAllContent
{
  double v3;
  double v4;
  double v5;
  double v6;
  CRLInteractiveCanvasController *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double x;
  double y;
  double width;
  double height;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unsigned int v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  CGFloat v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;

  if (-[CRLInteractiveCanvasController shouldCanvasScrollingSizeGrowToFitBoardContent](self, "shouldCanvasScrollingSizeGrowToFitBoardContent"))
  {
    -[CRLCanvas unscaledRectOfLayouts](self->mCanvas, "unscaledRectOfLayouts");
    v7 = self;
  }
  else
  {
    -[CRLInteractiveCanvasController defaultMinimumUnscaledCanvasSize](self, "defaultMinimumUnscaledCanvasSize");
    -[CRLCanvas unscaledRectOfLayouts](self->mCanvas, "unscaledRectOfLayouts");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v16 = sub_10005FDDC();
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v48.origin.x = v9;
    v48.origin.y = v11;
    v48.size.width = v13;
    v48.size.height = v15;
    v56.origin.x = v16;
    v56.origin.y = v18;
    v56.size.width = v20;
    v56.size.height = v22;
    v49 = CGRectUnion(v48, v56);
    x = v49.origin.x;
    y = v49.origin.y;
    width = v49.size.width;
    height = v49.size.height;
    v57.origin.x = v16;
    v57.origin.y = v18;
    v57.size.width = v20;
    v57.size.height = v22;
    if (!CGRectEqualToRect(v49, v57))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "canvasLayer"));
      if ((objc_msgSend(v28, "horizontallyCenteredInScrollView") & 1) != 0)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "canvasLayer"));
        v31 = objc_msgSend(v30, "verticallyCenteredInScrollView");

        if (v31)
        {
          v32 = sub_100061400(v16, v18, v20, v22);
          v34 = v33;
          v50.origin.x = x;
          v50.origin.y = y;
          v50.size.width = width;
          v50.size.height = height;
          v35 = v32 - CGRectGetMinX(v50);
          v51.origin.x = x;
          v51.origin.y = y;
          v51.size.width = width;
          v51.size.height = height;
          v36 = CGRectGetMaxX(v51) - v32;
          if (v35 < v36)
            v35 = v36;
          v52.origin.x = x;
          v52.origin.y = y;
          v52.size.width = width;
          v52.size.height = height;
          v37 = v34 - CGRectGetMinY(v52);
          v53.origin.x = x;
          v53.origin.y = y;
          v53.size.width = width;
          v53.size.height = height;
          v38 = CGRectGetMaxY(v53) - v34;
          if (v37 >= v38)
            v39 = v37;
          else
            v39 = v38;
          v40 = sub_1000603DC(v35, v39, 2.0);
          x = sub_10005FD98(v32, v34, v40);
          y = v41;
          width = v42;
          height = v43;
        }
      }
      else
      {

      }
      -[CRLInteractiveCanvasController p_targetViewScaleForUnscaledRect:](self, "p_targetViewScaleForUnscaledRect:", x, y, width, height);
      v45 = sub_1000603DC(-20.0, -20.0, 1.0 / v44);
      v47 = v46;
      v54.origin.x = x;
      v54.origin.y = y;
      v54.size.width = width;
      v54.size.height = height;
      v55 = CGRectInset(v54, v45, v47);
      x = v55.origin.x;
      y = v55.origin.y;
      width = v55.size.width;
      height = v55.size.height;
    }
    v7 = self;
    v3 = x;
    v4 = y;
    v5 = width;
    v6 = height;
  }
  -[CRLInteractiveCanvasController zoomWithAnimationToUnscaledRect:](v7, "zoomWithAnimationToUnscaledRect:", v3, v4, v5, v6);
}

- (void)zoomToSelectionPath:(id)a3
{
  id v4;
  void *v5;
  const CGRect *v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  char v15;
  void *v16;
  void *v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  CGRect v31;
  CGRect v32;
  CGRect v33;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController infosForSelectionPath:](self, "infosForSelectionPath:", v4));
  if (objc_msgSend(v5, "count"))
    v6 = &CGRectZero;
  else
    v6 = &CGRectNull;
  x = v6->origin.x;
  y = v6->origin.y;
  width = v6->size.width;
  height = v6->size.height;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = v5;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v27;
    v15 = 1;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layoutForInfoNearestVisibleRect:](self, "layoutForInfoNearestVisibleRect:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v16), (_QWORD)v26));
        objc_msgSend(v17, "rectInRootForSelectionPath:", v4);
        v22 = v18;
        v23 = v19;
        v24 = v20;
        v25 = v21;
        if ((v15 & 1) == 0)
        {
          v31.origin.x = x;
          v31.origin.y = y;
          v31.size.width = width;
          v31.size.height = height;
          *(CGRect *)&v18 = CGRectUnion(v31, *(CGRect *)&v22);
        }
        x = v18;
        y = v19;
        width = v20;
        height = v21;

        v15 = 0;
        v16 = (char *)v16 + 1;
      }
      while (v13 != v16);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      v15 = 0;
    }
    while (v13);
  }

  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  v33 = CGRectInset(v32, -10.0, -10.0);
  -[CRLInteractiveCanvasController zoomWithAnimationToUnscaledRect:](self, "zoomWithAnimationToUnscaledRect:", v33.origin.x, v33.origin.y, v33.size.width, v33.size.height);

}

- (double)p_targetViewScaleForUnscaledRect:(CGRect)a3
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  void *v13;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (CGRectIsNull(a3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012545B0);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2517C(v8, x, y, width, height);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012545D0);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController p_targetViewScaleForUnscaledRect:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = width;
    v19.size.height = height;
    v12 = NSStringFromCGRect(v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 1583, 0, "Don't know how to handle desired zoom rect %{public}@!", v13);

    return 1.0;
  }
  else
  {
    -[CRLInteractiveCanvasController visibleUnscaledRect](self, "visibleUnscaledRect");
    if (v15 / width >= v16 / height)
      v17 = v16 / height;
    else
      v17 = v15 / width;
    -[CRLInteractiveCanvasController viewScale](self, "viewScale");
    return v18 * v17;
  }
}

- (void)scrollCenteredOrZoomToUnscaledRect:(CGRect)a3 shouldAnimateScroll:(BOOL)a4
{
  _BOOL4 v4;
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  void *v12;
  double v13;
  uint64_t v14;
  id v15;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectIsNull(a3))
  {
    -[CRLInteractiveCanvasController p_targetViewScaleForUnscaledRect:](self, "p_targetViewScaleForUnscaledRect:", x, y, width, height);
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
    v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "canvasLayer"));

    objc_msgSend(v15, "viewScale");
    if (v13 == v11 || vabdd_f64(v13, v11) < 0.00999999978 || v11 < 0.1 && v13 == 0.1)
    {
      if (v4)
        v14 = 97;
      else
        v14 = 96;
      -[CRLInteractiveCanvasController scrollRectToVisible:scrollOptions:](self, "scrollRectToVisible:scrollOptions:", v14, x, y, width, height);
    }
    else
    {
      -[CRLInteractiveCanvasController zoomWithAnimationToUnscaledRect:](self, "zoomWithAnimationToUnscaledRect:", x, y, width, height);
    }

  }
}

+ (double)zoomAnimationDefaultDuration
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasLayer zoomAnimationDefaultCAAnimation](CRLCanvasLayer, "zoomAnimationDefaultCAAnimation"));
  objc_msgSend(v2, "duration");
  v4 = v3;

  return v4;
}

- (void)zoomWithAnimationToUnscaledRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[CRLCanvasLayer zoomAnimationDefaultCAAnimation](CRLCanvasLayer, "zoomAnimationDefaultCAAnimation"));
  -[CRLInteractiveCanvasController zoomWithAnimation:toUnscaledRect:](self, "zoomWithAnimation:toUnscaledRect:", v8, x, y, width, height);

}

- (void)zoomWithAnimationToUnscaledRect:(CGRect)a3 withDuration:(double)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = (id)objc_claimAutoreleasedReturnValue(+[CRLCanvasLayer zoomAnimationDefaultCAAnimation](CRLCanvasLayer, "zoomAnimationDefaultCAAnimation"));
  objc_msgSend(v10, "setDuration:", a4);
  -[CRLInteractiveCanvasController zoomWithAnimation:toUnscaledRect:](self, "zoomWithAnimation:toUnscaledRect:", v10, x, y, width, height);

}

- (void)zoomWithAnimation:(id)a3 toUnscaledRect:(CGRect)a4
{
  -[CRLInteractiveCanvasController zoomWithAnimation:toUnscaledRect:layoutOffscreenContent:completionBlock:](self, "zoomWithAnimation:toUnscaledRect:layoutOffscreenContent:completionBlock:", a3, 0, &stru_101254610, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (void)zoomWithAnimation:(id)a3 toUnscaledRect:(CGRect)a4 layoutOffscreenContent:(BOOL)a5 completionBlock:(id)a6
{
  _BOOL4 v7;
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  _QWORD v46[4];
  id v47;
  id v48;
  BOOL v49;
  id location;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  CGRect v56;

  v7 = a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a3;
  v14 = a6;
  v56.origin.x = x;
  v56.origin.y = y;
  v56.size.width = width;
  v56.size.height = height;
  if (!CGRectIsNull(v56))
  {
    if (v7)
    {
      self->mPreviewVisibleUnscaledRectForTiling.origin.x = x;
      self->mPreviewVisibleUnscaledRectForTiling.origin.y = y;
      self->mPreviewVisibleUnscaledRectForTiling.size.width = width;
      self->mPreviewVisibleUnscaledRectForTiling.size.height = height;
      self->mShouldLayoutOffscreenContentForZoomAnimation = 1;
      -[CRLInteractiveCanvasController invalidateVisibleBounds](self, "invalidateVisibleBounds");
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvas](self, "canvas"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "allReps"));

      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v52;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v52 != v18)
              objc_enumerationMutation(v16);
            objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)v19), "frameInUnscaledCanvas");
            self->mPreviewVisibleUnscaledRectForTiling.origin.x = sub_100060C2C(v20, v21, v22, v23, self->mPreviewVisibleUnscaledRectForTiling.origin.x, self->mPreviewVisibleUnscaledRectForTiling.origin.y, self->mPreviewVisibleUnscaledRectForTiling.size.width, self->mPreviewVisibleUnscaledRectForTiling.size.height);
            self->mPreviewVisibleUnscaledRectForTiling.origin.y = v24;
            self->mPreviewVisibleUnscaledRectForTiling.size.width = v25;
            self->mPreviewVisibleUnscaledRectForTiling.size.height = v26;
            v19 = (char *)v19 + 1;
          }
          while (v17 != v19);
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
        }
        while (v17);
      }

      -[CRLInteractiveCanvasController invalidateVisibleBounds](self, "invalidateVisibleBounds");
    }
    -[CRLInteractiveCanvasController p_targetViewScaleForUnscaledRect:](self, "p_targetViewScaleForUnscaledRect:", x, y, width, height);
    v28 = v27;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "canvasLayer"));

    objc_msgSend(v30, "minimumPinchViewScale");
    v32 = v31;
    objc_msgSend(v30, "maximumPinchViewScale");
    v45 = sub_1003C65EC(v28, v32, v33);
    self->mRectToIncludeWhenGrowingCanvasToFitContent.origin.x = x;
    self->mRectToIncludeWhenGrowingCanvasToFitContent.origin.y = y;
    self->mRectToIncludeWhenGrowingCanvasToFitContent.size.width = width;
    self->mRectToIncludeWhenGrowingCanvasToFitContent.size.height = height;
    objc_initWeak(&location, self);
    objc_msgSend(v30, "contentInset");
    v35 = v34;
    v37 = v36;
    v39 = v38;
    v41 = v40;
    v42 = sub_100061400(x, y, width, height);
    v44 = v43;
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_1003522BC;
    v46[3] = &unk_101254638;
    objc_copyWeak(&v48, &location);
    v49 = v7;
    v47 = v14;
    objc_msgSend(v30, "animateToViewScale:contentCenter:contentInset:animation:completionBlock:", v13, v46, v45, v42, v44, v35, v37, v39, v41);

    objc_destroyWeak(&v48);
    objc_destroyWeak(&location);

  }
}

- (BOOL)shouldZoomOnSelectionChange
{
  void *v3;
  char v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController delegate](self, "delegate"));
  v4 = objc_opt_respondsToSelector(v3, "zoomOnSelectionChange:");

  if ((v4 & 1) == 0)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController delegate](self, "delegate"));
  v6 = objc_msgSend(v5, "zoomOnSelectionChange:", self);

  return v6;
}

- (id)infoForSelectionPath:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController infosForSelectionPath:](self, "infosForSelectionPath:", a3));
  if (objc_msgSend(v3, "count") == (id)1)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "anyObject"));
  else
    v4 = 0;

  return v4;
}

- (CRLSelectionModelTranslator)selectionModelTranslator
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController delegate](self, "delegate"));
  v4 = objc_opt_respondsToSelector(v3, "selectionModelTranslatorForInteractiveCanvasController:");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController delegate](self, "delegate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectionModelTranslatorForInteractiveCanvasController:", self));

    if (v6)
      return (CRLSelectionModelTranslator *)v6;
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254658);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E25300(v7);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254678);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController selectionModelTranslator]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController delegate](self, "delegate"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 1706, 0, "ICC delegate %@ must respond to selectionModelTranslatorForInteractiveCanvasController", v11);

  }
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101254698);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E25274();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012546B8);
  v12 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController selectionModelTranslator]"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 1708, 0, "invalid nil value for '%{public}s'", "selectionModelTranslator");

  v6 = 0;
  return (CRLSelectionModelTranslator *)v6;
}

- (id)infosForSelectionPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController selectionModelTranslator](self, "selectionModelTranslator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "infosForSelectionPath:", v4));

  return v6;
}

- (NSSet)infosForCurrentSelectionPath
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editorController](self, "editorController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "selectionPath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController infosForSelectionPath:](self, "infosForSelectionPath:", v4));

  return (NSSet *)v5;
}

- (BOOL)currentSelectionPathContainsInfo:(id)a3
{
  id v4;
  uint64_t v5;
  objc_class *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  BOOL v15;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v4 = a3;
  objc_opt_class(NSObject, v5);
  v12 = sub_1002220C8(v4, v6, 1, v7, v8, v9, v10, v11, (uint64_t)&OBJC_PROTOCOL___CRLCanvasElementInfo);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editorController](self, "editorController"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100352948;
    v17[3] = &unk_101230FD0;
    v17[4] = v13;
    v17[5] = &v18;
    objc_msgSend(v14, "enumerateEditorsOnStackUsingBlock:", v17);

    v15 = *((_BYTE *)v19 + 24) != 0;
  }
  else
  {
    v15 = 0;
  }
  _Block_object_dispose(&v18, 8);

  return v15;
}

- (BOOL)hasSelection
{
  void *v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editorController](self, "editorController"));
  *(_QWORD *)&v5 = objc_opt_class(CRLFreehandDrawingEditor, v4).n128_u64[0];
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mostSpecificCurrentEditorOfClass:", v6, v5));

  *(_QWORD *)&v9 = objc_opt_class(_TtC8Freeform17CRLGroupSelection, v8).n128_u64[0];
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editorController](self, "editorController", v9));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "selectionPath"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mostSpecificSelectionOfClass:", 0));
  v15 = sub_100221D0C(v11, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController infosForCurrentSelectionPath](self, "infosForCurrentSelectionPath"));
  v18 = objc_msgSend(v17, "count");

  if (!v18)
    return 0;
  return !v7 || v16 == 0;
}

- (BOOL)hasSelectedInfosInMultipleContainers
{
  void *v2;
  void *v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  void *v7;
  unsigned __int8 v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editorController](self, "editorController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "selectionPath"));
  *(_QWORD *)&v5 = objc_opt_class(_TtC8Freeform17CRLGroupSelection, v4).n128_u64[0];
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mostSpecificSelectionOfClass:", v6, v5));

  if (v7)
    v8 = objc_msgSend(v7, "isCrossContainerSelection");
  else
    v8 = 0;

  return v8;
}

- (NSSet)containersForSelection
{
  void *v2;
  void *v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editorController](self, "editorController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "selectionPath"));
  *(_QWORD *)&v5 = objc_opt_class(_TtC8Freeform17CRLGroupSelection, v4).n128_u64[0];
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mostSpecificSelectionOfClass:", v6, v5));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "containerGroups"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v8));

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  }

  return (NSSet *)v9;
}

- (void)scrollCurrentSelectionToVisibleWithOptions:(unint64_t)a3
{
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editorController](self, "editorController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectionPath"));
  -[CRLInteractiveCanvasController scrollToSelectionPath:scrollOptions:](self, "scrollToSelectionPath:scrollOptions:", v5, a3);

}

- (id)selectionPathForSearchReference:(id)a3
{
  id v4;
  uint64_t v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_opt_class(CRLWPSearchReference, v5);
  v7 = sub_1002223BC(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController selectionModelTranslator](self, "selectionModelTranslator"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selection"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "storage"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectionPathForSelection:onStorage:", v10, v11));

  return v12;
}

- (Class)wpSelectionClassForStorage:(id)a3
{
  return (Class)objc_opt_class(CRLWPSelection, a2);
}

- (void)scrollSearchReferenceToVisible:(id)a3 scrollOptions:(unint64_t)a4
{
  id WeakRetained;
  char v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  v7 = objc_opt_respondsToSelector(WeakRetained, "willScrollSearchReferenceToVisible:");

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->mDelegate);
    objc_msgSend(v8, "willScrollSearchReferenceToVisible:", v10);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "selectionPath"));
  -[CRLInteractiveCanvasController scrollToSelectionPath:scrollOptions:](self, "scrollToSelectionPath:scrollOptions:", v9, a4);

}

- (void)setSelectionPath:(id)a3 withSelectionFlags:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = v6;
  if ((a4 & 0x4000) != 0)
  {
    if ((a4 & 4) != 0)
    {
      if ((a4 & 0x200) != 0)
        v9 = 9;
      else
        v9 = 1;
      v11 = v6;
      goto LABEL_21;
    }
    v12 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012546D8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E253C0((uint64_t)v7, v12);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012546F8);
    v13 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController setSelectionPath:withSelectionFlags:]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 1811, 0, "Caller set a selection path that does not want to set selection or scroll: %@", v7);

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editorController](self, "editorController"));
    objc_msgSend(v8, "setSelectionPath:withFlags:", v7, a4 & 0xFFFFFFFFFFFFFFFBLL);

    if ((a4 & 4) != 0)
    {
      if ((a4 & 0x200) != 0)
        v9 = 9;
      else
        v9 = 1;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editorController](self, "editorController"));
      v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "selectionPath"));

LABEL_21:
      -[CRLInteractiveCanvasController scrollToSelectionPath:scrollOptions:](self, "scrollToSelectionPath:scrollOptions:", v11, v9);

    }
  }

}

- (CGRect)rectInRootForScrollingToSelectionPath:(id)a3 onLayout:(id)a4 allowingZooming:(BOOL)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  if (a5)
    objc_msgSend(a4, "rectInRootForZoomingToSelectionPath:", a3);
  else
    objc_msgSend(a4, "rectInRootForSelectionPath:", a3);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- ($114667933B9B2D05530DD42EBD1EDB26)p_scrollingInformationForSelectionPath:(SEL)a3 allowZoom:(id)a4
{
  id v8;
  CGSize size;
  uint64_t v10;
  id v11;
  _BOOL4 IsNull;
  CGRect *v13;
  CGSize v14;
  CGSize v15;
  $114667933B9B2D05530DD42EBD1EDB26 *result;
  CGSize v17;
  CGPoint v18;
  _QWORD v19[4];
  id v20;
  CRLInteractiveCanvasController *v21;
  uint64_t *v22;
  _QWORD *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t *v26;
  _QWORD *v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  _QWORD v33[3];
  char v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  void *v38;
  CGPoint v39;
  CGSize v40;
  _QWORD v41[3];
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  CGRect *v48;
  uint64_t v49;
  void *v50;
  CGPoint origin;
  CGSize v52;

  v8 = a4;
  v47 = 0;
  v48 = (CGRect *)&v47;
  v49 = 0x4010000000;
  v50 = &unk_1010E66AB;
  size = CGRectNull.size;
  origin = CGRectNull.origin;
  v52 = size;
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  v42 = 0;
  -[CRLInteractiveCanvasController targetPointSize](self, "targetPointSize");
  v42 = v10;
  v35 = 0;
  v36 = &v35;
  v37 = 0x4010000000;
  v38 = &unk_1010E66AB;
  v17 = CGRectZero.size;
  v18 = CGRectZero.origin;
  v39 = CGRectZero.origin;
  v40 = v17;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v34 = 1;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100353280;
  v19[3] = &unk_101254720;
  v22 = &v29;
  v11 = v8;
  v23 = v33;
  v24 = &v47;
  v20 = v11;
  v21 = self;
  v28 = a5;
  v25 = &v35;
  v26 = &v43;
  v27 = v41;
  -[CRLInteractiveCanvasController forLayoutNearestVisibleRectForInfosForSelectionPath:performBlock:](self, "forLayoutNearestVisibleRectForInfosForSelectionPath:performBlock:", v11, v19);
  IsNull = CGRectIsNull(v48[1]);
  v13 = v48;
  if (IsNull)
  {
    v48[1].origin = v18;
    v13[1].size = v17;
  }
  v14 = v13[1].size;
  retstr->var0.origin = v13[1].origin;
  retstr->var0.size = v14;
  v15 = (CGSize)*((_OWORD *)v36 + 3);
  retstr->var2.origin = (CGPoint)*((_OWORD *)v36 + 2);
  *(_QWORD *)&retstr->var3 = 0;
  retstr->var3 = *((_BYTE *)v30 + 24);
  retstr->var2.size = v15;
  *(_QWORD *)&retstr->var1 = v44[3];

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(v33, 8);
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(v41, 8);
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);

  return result;
}

- (void)withLayoutForSelectionPath:(id)a3 performBlock:(id)a4
{
  -[CRLInteractiveCanvasController withLayoutForSelectionPath:flags:performBlock:](self, "withLayoutForSelectionPath:flags:performBlock:", a3, 0, a4);
}

- (void)withLayoutForSelectionPath:(id)a3 flags:(unint64_t)a4 performBlock:(id)a5
{
  id v7;
  void (**v8)(id, void *);
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  double v24;
  void *i;
  void *v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  double v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];

  v7 = a3;
  v8 = (void (**)(id, void *))a5;
  -[CRLInteractiveCanvasController layoutIfNeeded](self, "layoutIfNeeded");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layoutsForSelectionPath:](self, "layoutsForSelectionPath:", v7));
  if ((unint64_t)objc_msgSend(v9, "count") < 2)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "anyObject"));
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvas](self, "canvas"));
    -[CRLInteractiveCanvasController visibleBoundsRect](self, "visibleBoundsRect");
    objc_msgSend(v10, "convertBoundsToUnscaledRect:");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v19 = v9;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v20)
    {
      v21 = v20;
      v22 = 0;
      v23 = *(_QWORD *)v35;
      v24 = INFINITY;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(_QWORD *)v35 != v23)
            objc_enumerationMutation(v19);
          v26 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v26, "rectInRootForSelectionPath:", v7, (_QWORD)v34);
          v31 = sub_1000612CC(v27, v28, v29, v30, v12, v14, v16, v18);
          if (v31 < v24)
          {
            v32 = v31;
            v33 = v26;

            v24 = v32;
            v22 = v33;
          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v21);
    }
    else
    {
      v22 = 0;
    }

  }
  v8[2](v8, v22);

}

- (void)forLayoutNearestVisibleRectForInfosForSelectionPath:(id)a3 performBlock:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v6 = (void (**)(id, void *))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController infosForSelectionPath:](self, "infosForSelectionPath:", a3));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layoutForInfoNearestVisibleRect:](self, "layoutForInfoNearestVisibleRect:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v11)));
        if (v12)
          v6[2](v6, v12);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (CGRect)p_scaledRectToScrollToForSelectionPath:(id)a3 shouldCenterVertically:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  CKRecordID v20;
  Swift::String v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGRect result;

  v4 = a4;
  v6 = a3;
  -[CRLInteractiveCanvasController layoutIfNeeded](self, "layoutIfNeeded");
  -[CRLInteractiveCanvasController p_scrollingInformationForSelectionPath:allowZoom:](self, "p_scrollingInformationForSelectionPath:allowZoom:", v6, 0);

  -[CRLInteractiveCanvasController outsetSelectionRect:](self, "outsetSelectionRect:", (unsigned __int128)0, (unsigned __int128)0);
  -[CRLInteractiveCanvasController p_contentOffsetToScrollRectToVisible:shouldCenterVertically:forceCenteringVertically:forceCenteringHorizontally:](self, "p_contentOffsetToScrollRectToVisible:shouldCenterVertically:forceCenteringVertically:forceCenteringHorizontally:", v4, 0, 0);
  -[CRLInteractiveCanvasController unobscuredScrollViewFrame](self, "unobscuredScrollViewFrame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "canvasView"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "enclosingScrollView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "contentView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "superview"));
  objc_msgSend(v18, "convertRect:fromView:", v19, v8, v10, v12, v14);

  SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v20, v21);
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;

  v30 = v23;
  v31 = v25;
  v32 = v27;
  v33 = v29;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (void)scrollToCurrentSelectionPathAfterLayout
{
  -[CRLInteractiveCanvasController scrollToCurrentSelectionPathAfterLayoutWithOptions:](self, "scrollToCurrentSelectionPathAfterLayoutWithOptions:", 0);
}

- (void)scrollToCurrentSelectionPathAfterLayoutWithOptions:(unint64_t)a3
{
  void *v5;
  id v6;

  if (!self->mIsFetchingEditorController)
  {
    -[CRLCanvas i_setLayersInvalidWithoutInvalidatingAnySpecificLayers](self->mCanvas, "i_setLayersInvalidWithoutInvalidatingAnySpecificLayers");
    v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editorController](self, "editorController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectionPath"));
    -[CRLInteractiveCanvasController scrollToSelectionPath:scrollOptions:](self, "scrollToSelectionPath:scrollOptions:", v5, a3);

  }
}

- (void)scrollToSelectionPath:(id)a3 scrollOptions:(unint64_t)a4
{
  __int16 v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  id WeakRetained;
  char v15;
  id v16;
  CRLSelectionPath *mSelectionPathToScrollTo;
  CRLSelectionPath *v18;
  CRLSelectionPath *v19;
  void *v20;
  _QWORD v21[5];

  v6 = ~(_WORD)a4;
  v7 = a3;
  if ((v6 & 0x180) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254740);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E25454();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254760);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController scrollToSelectionPath:scrollOptions:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 1956, 0, "Scroll options CRLCanvasScrollOptionWaitForViewLayoutIfNeeded and CRLCanvasScrollOptionScrollForcingLayoutIfNeeded are mutually exclusive");

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "canvasLayer"));
  v13 = objc_msgSend(v12, "isLayoutDisabled");

  if ((v13 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
    v15 = objc_opt_respondsToSelector(WeakRetained, "willScrollToSelectionPath:onInteractiveCanvasController:");

    if ((v15 & 1) != 0)
    {
      v16 = objc_loadWeakRetained((id *)&self->mDelegate);
      objc_msgSend(v16, "willScrollToSelectionPath:onInteractiveCanvasController:", v7, self);

    }
    if (v7)
    {
      mSelectionPathToScrollTo = self->mSelectionPathToScrollTo;
      v18 = (CRLSelectionPath *)objc_msgSend(v7, "copy");
      v19 = self->mSelectionPathToScrollTo;
      self->mSelectionPathToScrollTo = v18;

      self->mOptionsForScrollingToSelection = a4;
      self->mSelectionShouldBeClearedInDidProcessAllChanges = 0;
      if (!mSelectionPathToScrollTo)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvas](self, "canvas"));
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_100353BD8;
        v21[3] = &unk_10122D110;
        v21[4] = self;
        objc_msgSend(v20, "performBlockAfterLayoutIfNecessary:", v21);

      }
    }
    if ((a4 & 0x80) != 0)
      -[CRLInteractiveCanvasController layoutIfNeeded](self, "layoutIfNeeded");
  }

}

- (void)p_clearSelectionScrollingState
{
  CRLSelectionPath *mSelectionPathToScrollTo;

  mSelectionPathToScrollTo = self->mSelectionPathToScrollTo;
  self->mSelectionPathToScrollTo = 0;

  self->mOptionsForScrollingToSelection = 0;
}

- (void)setOptionsForScrollingToSelectionAfterLayout:(unint64_t)a3
{
  self->mOptionsForScrollingToSelection |= a3;
}

- (void)clearOptionsForScrollingToSelectionAfterLayout:(unint64_t)a3
{
  self->mOptionsForScrollingToSelection &= ~a3;
}

- (double)p_safeAreaMargin
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvasView](self, "canvasView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "enclosingScrollView"));

  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4;
  objc_msgSend(v3, "safeAreaInsets");
  if (v5 < v6)
    v5 = v6;

  return v5;
}

- (CGPoint)p_computeClampedUnscaledContentOffsetWithTargetRect:(CGRect)a3 selectionContextRectWhenZooming:(CGRect)a4 viewScale:(double)a5 unscaledOutset:(double)dy
{
  CGFloat x;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CKRecordID v22;
  Swift::String v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  double v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  unsigned int v61;
  double v62;
  void *v63;
  double v64;
  CGFloat v65;
  double v66;
  CGFloat v67;
  double v68;
  CGFloat v69;
  double v70;
  CGFloat v71;
  double v72;
  double v73;
  double v74;
  double v75;
  CGFloat v76;
  double v77;
  CGFloat v78;
  double v79;
  CGFloat v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v94;
  double v95;
  CGPoint result;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;

  width = a4.size.width;
  height = a4.size.height;
  y = a4.origin.y;
  x = a4.origin.x;
  v7 = a3.size.height;
  v8 = a3.size.width;
  v9 = a3.origin.y;
  v10 = a3.origin.x;
  -[CRLInteractiveCanvasController p_safeAreaMargin](self, "p_safeAreaMargin");
  v13 = -v12 / a5;
  v97.origin.x = v10;
  v97.origin.y = v9;
  v97.size.width = v8;
  v97.size.height = v7;
  v90 = v13;
  v98 = CGRectInset(v97, v13, 0.0);
  v14 = v98.origin.x;
  v15 = v98.origin.y;
  v16 = v98.size.width;
  v17 = v98.size.height;
  -[CRLInteractiveCanvasController visibleBoundsRect](self, "visibleBoundsRect");
  v19 = v18 / a5;
  v21 = v20 / a5;
  v22.super.isa = (Class)-[CRLInteractiveCanvasController shouldCanvasScrollingSizeGrowToFitBoardContent](self, "shouldCanvasScrollingSizeGrowToFitBoardContent");
  v95 = v21;
  SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v22, v23);
  v28 = sub_100061AD8(v24, v25, v26, v27, v14, v15, v16, v17);
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v99.origin.x = CGRectZero.origin.x;
  v99.origin.y = CGRectZero.origin.y;
  v99.size.width = CGRectZero.size.width;
  v99.size.height = CGRectZero.size.height;
  v104.origin.x = x;
  v104.origin.y = y;
  v104.size.width = width;
  v104.size.height = height;
  if (CGRectEqualToRect(v99, v104))
  {
    v35 = v28;
  }
  else
  {
    v100.origin.x = x;
    v100.origin.y = y;
    v100.size.width = width;
    v100.size.height = height;
    v101 = CGRectInset(v100, v90 + dy, dy);
    v35 = sub_100061AD8(v28, v30, v32, v34, v101.origin.x, v101.origin.y, v101.size.width, v101.size.height);
    v30 = v36;
  }
  v94 = v30;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "canvasLayer"));

  if (-[CRLInteractiveCanvasController shouldCanvasScrollingSizeGrowToFitBoardContent](self, "shouldCanvasScrollingSizeGrowToFitBoardContent"))
  {
    objc_msgSend(v38, "bounds");
    v40 = v39;
    v42 = v41;
    v44 = v43;
    v46 = v45;
    -[CRLInteractiveCanvasController viewScale](self, "viewScale");
    v48 = sub_100060FD8(v40, v42, v44, v46, 1.0 / v47);
    v50 = v49;
    v52 = v51;
    v54 = v53;
  }
  else
  {
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvas](self, "canvas"));
    objc_msgSend(v55, "unscaledSize");
    v56 = sub_10005FDDC();
    v50 = v57;
    v52 = v58;
    v54 = v59;

    v60 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvas](self, "canvas"));
    v61 = objc_msgSend(v60, "isAnchoredAtRight");

    v62 = 0.0;
    if (v61)
      v62 = v52;
    v48 = v56 - v62;
  }
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvas](self, "canvas"));
  objc_msgSend(v63, "contentInset");
  v65 = v48 + v64;
  v67 = v50 + v66;
  v69 = v52 - (v64 + v68);
  v71 = v54 - (v66 + v70);

  v102.origin.x = v65;
  v102.origin.y = v67;
  v102.size.width = v69;
  v102.size.height = v71;
  v72 = CGRectGetMaxX(v102) - v19;
  objc_msgSend(v38, "bounds");
  v74 = v73;
  v76 = v75;
  v78 = v77;
  v80 = v79;
  -[CRLInteractiveCanvasController viewScale](self, "viewScale");
  v103.origin.x = sub_100060FD8(v74, v76, v78, v80, 1.0 / v81);
  v82 = CGRectGetMaxY(v103) - v95;
  v83 = sub_1003C65EC(v35, v65, v72);
  -[CRLInteractiveCanvasController clampedUnscaledContentOffset:forViewScale:](self, "clampedUnscaledContentOffset:forViewScale:", v83, sub_1003C65EC(v94, v67, v82), a5);
  v85 = v84;
  v87 = v86;

  v88 = v85;
  v89 = v87;
  result.y = v89;
  result.x = v88;
  return result;
}

- (void)p_scrollToSelectionPath:(id)a3 scrollOptions:(unint64_t)a4
{
  id v6;
  unint64_t v7;
  _BOOL4 v8;
  double v9;
  unint64_t v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  double width;
  double y;
  CGFloat height;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  CGFloat x;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  v6 = a3;
  v7 = a4 & 1;
  v8 = (a4 & 6) != 0;
  if (-[CRLInteractiveCanvasController animatingViewScale](self, "animatingViewScale"))
  {
LABEL_2:
    if (-[CRLInteractiveCanvasController textGesturesInFlight](self, "textGesturesInFlight"))
    {
      self->mDidSuppressScrollToSelectionDuringTextGestures = 1;
      self->mShouldAnimateScrollAfterTextGestures = v7;
    }
    goto LABEL_31;
  }
  if (-[CRLInteractiveCanvasController textGesturesInFlight](self, "textGesturesInFlight"))
  {
    if (!v6 || (a4 & 0x10) == 0)
      goto LABEL_2;
  }
  else if (!v6)
  {
    goto LABEL_2;
  }
  -[CRLInteractiveCanvasController p_scrollingInformationForSelectionPath:allowZoom:](self, "p_scrollingInformationForSelectionPath:allowZoom:", v6, (a4 & 6) != 0);
  v9 = 0.0;
  v10 = (a4 >> 1) & 1;
  if ((a4 & 4) != 0)
  {
    -[CRLInteractiveCanvasController viewScale](self, "viewScale");
    v9 = v11;
    LODWORD(v10) = 0;
  }
  else
  {
    v8 = 0;
  }
  if (v8)
  {
    -[CRLInteractiveCanvasController p_safeAreaMargin](self, "p_safeAreaMargin");
    v53 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "canvasLayer"));

    -[CRLInteractiveCanvasController fitWidthViewScale](self, "fitWidthViewScale");
    v16 = v15;
    objc_msgSend(v14, "maximumPinchViewScale");
    v18 = sub_1003C65EC(v9, v16, v17);
    if (!(v10 | (v18 < v9) & (a4 >> 2)))
      v18 = v9;
    v54 = v18;
    -[CRLInteractiveCanvasController visibleUnscaledRect](self, "visibleUnscaledRect");
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;
    -[CRLInteractiveCanvasController visibleUnscaledRectForAutoscroll](self, "visibleUnscaledRectForAutoscroll");
    v59.origin.x = v27;
    v59.origin.y = v28;
    v59.size.width = v29;
    v59.size.height = v30;
    v56.origin.x = v20;
    width = 0.0;
    v56.origin.y = v22;
    v56.size.width = v24;
    y = 0.0;
    v56.size.height = v26;
    height = 0.0;
    if (!CGRectEqualToRect(v56, v59))
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101254780);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E254D4();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012547A0);
      v34 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController p_scrollToSelectionPath:scrollOptions:]"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v35, v36, 2218, 0, "Scrolling automatically in an unsupported configuration!");

    }
    -[CRLInteractiveCanvasController visibleBoundsRect](self, "visibleBoundsRect");
    v38 = v54;
    v39 = v37 + -30.0 + v53 * -2.0;
    x = 0.0;
    if (0.0 * v54 > v39)
    {
      v41 = v39 / 0.0;
      -[CRLInteractiveCanvasController fitWidthViewScale](self, "fitWidthViewScale");
      v43 = v42;
      objc_msgSend(v14, "maximumPinchViewScale");
      v38 = sub_1003C65EC(v41, v43, v44);
      x = CGRectZero.origin.x;
      y = CGRectZero.origin.y;
      width = CGRectZero.size.width;
      height = CGRectZero.size.height;
    }
    v55 = height;
    v45 = x;
    v57.origin.x = 0.0;
    v57.origin.y = 0.0;
    v57.size.width = 0.0;
    v57.size.height = 0.0;
    v58 = CGRectInset(v57, -15.0 / v38, -15.0 / v38);
    v46 = v58.origin.x;
    v47 = v58.origin.y;
    v48 = v58.size.width;
    v49 = v58.size.height;
    -[CRLInteractiveCanvasController viewScale](self, "viewScale");
    if (v38 == v50 || vabdd_f64(v38, v50) < fabs(v50 * 0.000000999999997))
    {
      -[CRLInteractiveCanvasController scrollRectToVisible:scrollOptions:](self, "scrollRectToVisible:scrollOptions:", a4 & 0xFFFFFFFFFFFFFFF9, v46, v47, v48, v49);
    }
    else
    {
      -[CRLInteractiveCanvasController p_computeClampedUnscaledContentOffsetWithTargetRect:selectionContextRectWhenZooming:viewScale:unscaledOutset:](self, "p_computeClampedUnscaledContentOffsetWithTargetRect:selectionContextRectWhenZooming:viewScale:unscaledOutset:", v46, v47, v48, v49, v45, y, width, v55, *(_QWORD *)&v38, -15.0 / v38);
      -[CRLInteractiveCanvasController setViewScale:contentOffset:animated:completionHandler:](self, "setViewScale:contentOffset:animated:completionHandler:", v7, 0, v38, v51, v52);
    }

  }
LABEL_31:

}

- (void)layoutInvalidated
{
  -[CRLCanvas layoutInvalidated](self->mCanvas, "layoutInvalidated");
}

- (void)canvasInvalidatedForLayout:(id)a3
{
  -[CRLCanvas canvasInvalidatedForLayout:](self->mCanvas, "canvasInvalidatedForLayout:", a3);
}

- (void)canvasInvalidatedForRep:(id)a3
{
  -[CRLCanvas canvasInvalidatedForRep:](self->mCanvas, "canvasInvalidatedForRep:", a3);
}

- (void)invalidateReps
{
  -[CRLCanvas invalidateReps](self->mCanvas, "invalidateReps");
}

- (void)invalidateVisibleBounds
{
  -[CRLCanvas invalidateVisibleBounds](self->mCanvas, "invalidateVisibleBounds");
}

- (void)invalidateAllLayers
{
  -[CRLCanvas invalidateAllLayers](self->mCanvas, "invalidateAllLayers");
}

- (void)invalidateContentLayersForRep:(id)a3
{
  -[CRLCanvas invalidateContentLayersForRep:](self->mCanvas, "invalidateContentLayersForRep:", a3);
}

- (void)invalidateOverlayLayersForRep:(id)a3
{
  -[CRLCanvas invalidateOverlayLayersForRep:](self->mCanvas, "invalidateOverlayLayersForRep:", a3);
}

- (void)invalidateLayersForDecorator:(id)a3
{
  -[NSMutableSet addObject:](self->mDecoratorsWithInvalidLayers, "addObject:", a3);
  -[CRLCanvas i_setLayersInvalidWithoutInvalidatingAnySpecificLayers](self->mCanvas, "i_setLayersInvalidWithoutInvalidatingAnySpecificLayers");
}

- (BOOL)i_areLayersInvalidForDecorator:(id)a3
{
  if (self->mAllDecoratorLayersAreInvalid)
    return 1;
  else
    return -[NSMutableSet containsObject:](self->mDecoratorsWithInvalidLayers, "containsObject:", a3);
}

- (void)invalidateCollaboratorHUDControllers
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  if (-[CRLInteractiveCanvasController p_areAnyCollaboratorsPresent](self, "p_areAnyCollaboratorsPresent"))
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable crl_allObjects](self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary, "crl_allObjects", 0));
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          -[CRLInteractiveCanvasController invalidateLayersForDecorator:](self, "invalidateLayersForDecorator:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7));
          v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
}

- (void)setShouldSuppressRendering:(BOOL)a3 animated:(BOOL)a4
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  if (self->mShouldSuppressRendering != a3)
  {
    self->mShouldSuppressRendering = a3;
    if (!a3)
    {
      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvas topLevelReps](self->mCanvas, "topLevelReps", 0));
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v11;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(_QWORD *)v11 != v8)
              objc_enumerationMutation(v5);
            objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "recursivelyPerformSelector:", "setNeedsDisplay");
          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        }
        while (v7);
      }

    }
    -[CRLInteractiveCanvasController invalidateAllLayers](self, "invalidateAllLayers");
  }
}

- (void)setShouldSuppressRendering:(BOOL)a3
{
  -[CRLInteractiveCanvasController setShouldSuppressRendering:animated:](self, "setShouldSuppressRendering:animated:", a3, 1);
}

- (void)updateRenderableForRep:(id)a3 usingBlock:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012547C0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E25554();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012547E0);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController updateRenderableForRep:usingBlock:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 2328, 0, "This operation must only be performed on the main thread.");

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController renderableForRep:](self, "renderableForRep:", v6));
  if (v11)
    v7[2](v7, v11);

}

- (void)didExitPreviewMode
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvas topLevelReps](self->mCanvas, "topLevelReps", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)i), "recursivelyPerformSelectorIfImplemented:", "didExitPreviewMode");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)reuseTextInputResponderFrom:(id)a3
{
  objc_msgSend(a3, "setupTextInputResponder");
}

- (void)setupTextInputResponder
{
  void *v3;
  _TtC8Freeform21CRLTextInputResponder *v4;
  void *v5;
  void *v6;
  _TtC8Freeform21CRLTextInputResponder *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController textInputResponder](self, "textInputResponder"));

  if (!v3)
  {
    v4 = [_TtC8Freeform21CRLTextInputResponder alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "canvasView"));
    v7 = -[CRLTextInputResponder initWithNextResponder:icc:](v4, "initWithNextResponder:icc:", v6, self);
    -[CRLInteractiveCanvasController setTextInputResponder:](self, "setTextInputResponder:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editorController](self, "editorController"));
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textInputEditor"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController textInputResponder](self, "textInputResponder"));
    objc_msgSend(v9, "setEditor:withFlags:", v11, 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController textInputResponder](self, "textInputResponder"));
    objc_msgSend(v10, "reloadInputViews");

  }
}

- (void)teardownTextInputResponder
{
  _TtC8Freeform21CRLTextInputResponder *mTextInputResponder;

  mTextInputResponder = self->mTextInputResponder;
  if (mTextInputResponder)
  {
    self->mTextInputResponder = 0;

  }
}

- (void)resumeEditing
{
  unsigned int v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  Class v7;
  NSString *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  Class v16;
  NSString *v17;
  void *v18;
  uint64_t v19;
  Class v20;
  NSString *v21;
  void *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  unsigned int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;

  v3 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101254800);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    objc_opt_class(self, v6);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 67110146;
    v26 = v3;
    v27 = 2082;
    v28 = "-[CRLInteractiveCanvasController resumeEditing]";
    v29 = 2082;
    v30 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m";
    v31 = 1024;
    v32 = 2601;
    v33 = 2114;
    v34 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101254820);
  v10 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v11 = v10;
    v12 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v26 = v3;
    v27 = 2114;
    v28 = v12;
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController resumeEditing]"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
  objc_opt_class(self, v15);
  v17 = NSStringFromClass(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 2601, 0, "Abstract method not overridden by %{public}@", v18);

  objc_opt_class(self, v19);
  v21 = NSStringFromClass(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v22, "-[CRLInteractiveCanvasController resumeEditing]"));
  v24 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v23, 0));

  objc_exception_throw(v24);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  objc_super v13;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (CFSTR("CRLScenesDebugView") == a6)
  {
    -[CRLInteractiveCanvasController p_updateInfosToDisplayIfNeeded](self, "p_updateInfosToDisplayIfNeeded");
  }
  else if (off_1013DBBC0 == a6)
  {
    -[CRLInteractiveCanvasController recreateAllLayoutsAndReps](self, "recreateAllLayoutsAndReps");
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)CRLInteractiveCanvasController;
    -[CRLInteractiveCanvasController observeValueForKeyPath:ofObject:change:context:](&v13, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
  }

}

- (void)p_editorControllerDidChangeTextInputEditor:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  v17 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "object"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textInputEditor"));
  v12 = sub_100221DDC(v5, 1, v6, v7, v8, v9, v10, v11, (uint64_t)&OBJC_PROTOCOL____TtP8Freeform18CRLTextInputEditor_);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  if (v13)
    -[CRLInteractiveCanvasController setupTextInputResponder](self, "setupTextInputResponder");
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "userInfo"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("CRLEditorControllerSelectionFlagsKey")));
  v16 = objc_msgSend(v15, "unsignedIntegerValue");

  -[CRLInteractiveCanvasController setTextResponderEditorTo:withFlags:](self, "setTextResponderEditorTo:withFlags:", v13, v16);
}

- (void)p_editorControllerSelectionPathDidChange:(id)a3
{
  CRLInteractiveCanvasControllerDelegate **p_mDelegate;
  id v5;
  id WeakRetained;
  char v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  p_mDelegate = &self->mDelegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_mDelegate);
  v7 = objc_opt_respondsToSelector(WeakRetained, "selectionDidChange");

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_mDelegate);
    objc_msgSend(v8, "selectionDidChange");

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
  v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CRLEditorControllerOldSelectionPathKey")));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editorController](self, "editorController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "selectionPath"));

  -[CRLInteractiveCanvasController p_selectionPathDidChangeFromSelectionPath:toSelectionPath:](self, "p_selectionPathDidChangeFromSelectionPath:toSelectionPath:", v19, v11);
  -[CRLInteractiveCanvasController p_notifyRepsForChangeFromSelectionPath:toSelectionPath:](self, "p_notifyRepsForChangeFromSelectionPath:toSelectionPath:", v19, v11);
  v12 = objc_loadWeakRetained((id *)&self->mLayerHost);
  objc_msgSend(v12, "selectionPathDidChangeFromSelectionPath:toSelectionPath:", v19, v11);

  -[CRLInteractiveCanvasController updateMultiselectResizeInfoIfNeeded](self, "updateMultiselectResizeInfoIfNeeded");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", CFSTR("CRLEditorControllerSelectionFlagsKey")));
  v15 = (unint64_t)objc_msgSend(v14, "unsignedIntegerValue");

  v16 = (v15 >> 1) & 1;
  if (self->mTextGesturesInFlight)
  {
    if ((v15 & 4) != 0)
    {
      self->mDidSuppressScrollToSelectionDuringTextGestures = 1;
      self->mShouldAnimateScrollAfterTextGestures = (v15 & 2) != 0;
    }
  }
  else
  {
    -[CRLInteractiveCanvasController p_selectionDoneChangingWithFlags:](self, "p_selectionDoneChangingWithFlags:", v15);
    if ((v15 & 4) != 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editorController](self, "editorController"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "selectionPath"));
      -[CRLInteractiveCanvasController scrollToSelectionPath:scrollOptions:](self, "scrollToSelectionPath:scrollOptions:", v18, v16);

    }
  }
  -[CRLInteractiveCanvasController updateTipsBasedOnSelection:](self, "updateTipsBasedOnSelection:", v11);

}

- (void)updateMultiselectResizeInfoIfNeeded
{
  unsigned __int8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _TtC8Freeform24CRLMultiselectResizeInfo *v12;
  _TtC8Freeform24CRLMultiselectResizeInfo *mMultiselectResizeInfo;
  _TtC8Freeform24CRLMultiselectResizeInfo *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  objc_class *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *i;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  void *j;
  void *v36;
  _TtC8Freeform24CRLMultiselectResizeInfo *v37;
  _TtC8Freeform24CRLMultiselectResizeInfo *v38;
  _TtC8Freeform24CRLMultiselectResizeInfo *v39;
  _TtC8Freeform24CRLMultiselectResizeInfo *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  double v44;
  objc_class *v45;
  objc_class *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];

  v3 = -[CRLInteractiveCanvasController p_shouldSuppressMultiselectResizeInfo](self, "p_shouldSuppressMultiselectResizeInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController selectionModelTranslator](self, "selectionModelTranslator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editorController](self, "editorController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectionPath"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "unlockedBoardItemsForSelectionPath:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectsPassingTest:", &stru_101254840));
  if (!-[CRLInteractiveCanvasController displaysMultiselectionWithSingleBounds](self, "displaysMultiselectionWithSingleBounds")|| (v3 & 1) != 0|| (unint64_t)objc_msgSend(v8, "count") < 2)
  {
    mMultiselectResizeInfo = self->mMultiselectResizeInfo;
    if (!mMultiselectResizeInfo)
    {
      v11 = 0;
      goto LABEL_30;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMultiselectResizeInfo parentInfo](mMultiselectResizeInfo, "parentInfo"));
    v14 = self->mMultiselectResizeInfo;
    self->mMultiselectResizeInfo = 0;

    goto LABEL_8;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController topLevelContainerInfoForEditing](self, "topLevelContainerInfoForEditing"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMultiselectResizeInfo parentInfo](self->mMultiselectResizeInfo, "parentInfo"));

  if (v10 == v9)
  {
    v11 = 0;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMultiselectResizeInfo parentInfo](self->mMultiselectResizeInfo, "parentInfo"));
    v12 = self->mMultiselectResizeInfo;
    self->mMultiselectResizeInfo = 0;

  }
  v37 = self->mMultiselectResizeInfo;
  v38 = v37;
  if (!v37)
  {
    v39 = -[CRLMultiselectResizeInfo initWithParentInfo:]([_TtC8Freeform24CRLMultiselectResizeInfo alloc], "initWithParentInfo:", v9);
    v40 = self->mMultiselectResizeInfo;
    self->mMultiselectResizeInfo = v39;

    v38 = self->mMultiselectResizeInfo;
  }
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvas](self, "canvas"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "layoutController"));
  -[CRLMultiselectResizeInfo setRepresentedSelectedBoardItems:currentlyLaidOutWith:](v38, "setRepresentedSelectedBoardItems:currentlyLaidOutWith:", v8, v42);

  *(_QWORD *)&v44 = objc_opt_class(CRLMultiselectResizeRep, v43).n128_u64[0];
  v46 = v45;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController repForInfo:](self, "repForInfo:", self->mMultiselectResizeInfo, v44));
  v48 = sub_1002223BC(v46, v47);
  v49 = (void *)objc_claimAutoreleasedReturnValue(v48);

  objc_msgSend(v49, "selectionDidChange");
  if (!v37)
  {
LABEL_8:
    v51 = v8;
    v52 = v7;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController topLevelContainerRepForEditing](self, "topLevelContainerRepForEditing"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "layout"));
    objc_msgSend(v16, "invalidateChildren");

    objc_opt_class(NSObject, v17);
    v24 = sub_1002220C8(v11, v18, 1, v19, v20, v21, v22, v23, (uint64_t)&OBJC_PROTOCOL___CRLCanvasElementInfo);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (v25)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layoutsForInfo:](self, "layoutsForInfo:", v25));
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v58;
        do
        {
          for (i = 0; i != v28; i = (char *)i + 1)
          {
            if (*(_QWORD *)v58 != v29)
              objc_enumerationMutation(v26);
            objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)i), "invalidateChildren");
          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
        }
        while (v28);
      }

    }
    v50 = (void *)v25;
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvas topLevelReps](self->mCanvas, "topLevelReps"));
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v54;
      do
      {
        for (j = 0; j != v33; j = (char *)j + 1)
        {
          if (*(_QWORD *)v54 != v34)
            objc_enumerationMutation(v31);
          v36 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)j);
          objc_msgSend(v36, "recursivelyPerformSelectorIfImplemented:", "i_invalidateSelectionHighlightRenderable");
          objc_msgSend(v36, "recursivelyPerformSelectorIfImplemented:", "invalidateKnobs");
        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
      }
      while (v33);
    }

    -[CRLInteractiveCanvasController p_updateInfosToDisplayIfNeeded](self, "p_updateInfosToDisplayIfNeeded");
    v8 = v51;
    v7 = v52;
  }
LABEL_30:

}

- (BOOL)p_shouldSuppressMultiselectResizeInfo
{
  CRLInteractiveCanvasControllerDelegate **p_mDelegate;
  id WeakRetained;
  id v5;
  unsigned __int8 v6;

  p_mDelegate = &self->mDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  if ((objc_opt_respondsToSelector(WeakRetained, "wantsToSuppressMultiselectionWithSingleBoundsForInteractiveCanvasController:") & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)p_mDelegate);
    v6 = objc_msgSend(v5, "wantsToSuppressMultiselectionWithSingleBoundsForInteractiveCanvasController:", self);

    if ((v6 & 1) != 0)
      return 1;
  }
  else
  {

  }
  return -[CRLInteractiveCanvasController wantsToSuppressMultiselectionForPenTool](self, "wantsToSuppressMultiselectionForPenTool");
}

- (void)p_notifyRepsForChangeFromSelectionPath:(id)a3 toSelectionPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (!v11)
  {
    v8 = 0;
    if (v6)
      goto LABEL_3;
LABEL_5:
    v10 = 0;
    goto LABEL_6;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController selectionModelTranslator](self, "selectionModelTranslator"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "boardItemsForSelectionPath:", v11));

  if (!v6)
    goto LABEL_5;
LABEL_3:
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController selectionModelTranslator](self, "selectionModelTranslator"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "boardItemsForSelectionPath:", v6));

LABEL_6:
  -[CRLInteractiveCanvasController p_notifyRepsForSelectionChangeFrom:to:](self, "p_notifyRepsForSelectionChangeFrom:to:", v8, v10);

}

- (void)p_notifyRepsForSelectionChangeFrom:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  void *v33;
  id v34;
  id v35;
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
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];

  v6 = a3;
  v7 = a4;
  if (v6 && objc_msgSend(v6, "count"))
  {
    v34 = v6;
    v8 = objc_msgSend(v6, "mutableCopy");
    v9 = v8;
    if (v7)
      objc_msgSend(v8, "minusSet:", v7);
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v49;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v49 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)v14);
          v44 = 0u;
          v45 = 0u;
          v46 = 0u;
          v47 = 0u;
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController repsForInfo:](self, "repsForInfo:", v15));
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v45;
            do
            {
              v20 = 0;
              do
              {
                if (*(_QWORD *)v45 != v19)
                  objc_enumerationMutation(v16);
                objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)v20), "becameNotSelected");
                v20 = (char *)v20 + 1;
              }
              while (v18 != v20);
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
            }
            while (v18);
          }

          v14 = (char *)v14 + 1;
        }
        while (v14 != v12);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
      }
      while (v12);
    }

    v6 = v34;
  }
  if (v7 && objc_msgSend(v7, "count"))
  {
    v21 = objc_msgSend(v7, "mutableCopy");
    v22 = v21;
    if (v6)
      objc_msgSend(v21, "minusSet:", v6);
    v35 = v6;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v23 = v22;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v41;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v41 != v26)
            objc_enumerationMutation(v23);
          v28 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)v27);
          v36 = 0u;
          v37 = 0u;
          v38 = 0u;
          v39 = 0u;
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController repsForInfo:](self, "repsForInfo:", v28));
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v36, v52, 16);
          if (v30)
          {
            v31 = v30;
            v32 = *(_QWORD *)v37;
            do
            {
              v33 = 0;
              do
              {
                if (*(_QWORD *)v37 != v32)
                  objc_enumerationMutation(v29);
                objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)v33), "becameSelected");
                v33 = (char *)v33 + 1;
              }
              while (v31 != v33);
              v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v36, v52, 16);
            }
            while (v31);
          }

          v27 = (char *)v27 + 1;
        }
        while (v27 != v25);
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
      }
      while (v25);
    }

    v6 = v35;
  }

}

- (void)p_editorControllerSelectionDidChangeAndWantsKeyboard:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CRLEditorControllerOldSelectionPathKey")));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editorController](self, "editorController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectionPath"));

  -[CRLInteractiveCanvasController p_selectionPathDidChangeFromSelectionPath:toSelectionPath:](self, "p_selectionPathDidChangeFromSelectionPath:toSelectionPath:", v7, v6);
  -[CRLInteractiveCanvasController p_selectionDoneChangingWithFlags:](self, "p_selectionDoneChangingWithFlags:", 0);

}

- (CRLCanvasView)canvasView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "canvasView"));

  return (CRLCanvasView *)v3;
}

- (CRLCanvasLayer)canvasLayer
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "canvasLayer"));

  return (CRLCanvasLayer *)v3;
}

- (CGColor)canvasEdgeBackgroundColor
{
  void *v2;
  id v3;
  CGColor *v4;

  if (self->mDynamicallyZooming)
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  else
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor"));
  v3 = objc_retainAutorelease(v2);
  v4 = (CGColor *)objc_msgSend(v3, "CGColor");

  return v4;
}

+ (id)keyPathsForValuesAffectingViewScale
{
  return +[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("layerHost.canvasLayer.viewScale"));
}

- (double)viewScale
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "canvasLayer"));
  objc_msgSend(v3, "viewScale");
  v5 = v4;

  return v5;
}

- (void)setViewScale:(double)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "canvasLayer"));
  objc_msgSend(v4, "setViewScale:", a3);

}

+ (id)keyPathsForValuesAffectingCurrentViewScale
{
  return +[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("layerHost.canvasLayer.viewScale"));
}

- (double)currentViewScale
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  if (self->mDynamicallyZooming)
    return self->mDynamicViewScale;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "canvasLayer"));
  objc_msgSend(v4, "viewScale");
  v6 = v5;

  return v6;
}

- (double)fitWidthViewScale
{
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "canvasLayer"));

  -[CRLInteractiveCanvasController visibleBoundsRect](self, "visibleBoundsRect");
  v6 = v5;
  -[CRLCanvas unscaledSize](self->mCanvas, "unscaledSize");
  v8 = v6 / v7;
  objc_msgSend(v4, "minimumPinchViewScale");
  v10 = v9;
  objc_msgSend(v4, "maximumPinchViewScale");
  v12 = sub_1003C65EC(v8, v10, v11);

  return v12;
}

- (BOOL)shouldPreventSyncingViewScale
{
  return self->mCurrentlyScrolling;
}

- (BOOL)shouldPreventSyncingContentOffset
{
  return self->mDynamicallyZooming;
}

- (CGSize)canvasScrollingOutset
{
  double v2;
  double v3;
  CGSize result;

  v2 = 600.0;
  v3 = 600.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)shouldResizeCanvasToScrollView
{
  CRLInteractiveCanvasControllerDelegate **p_mDelegate;
  id WeakRetained;
  id v4;
  id v5;
  unsigned __int8 v6;

  p_mDelegate = &self->mDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained((id *)p_mDelegate);
    if ((objc_opt_respondsToSelector(v4, "shouldResizeCanvasToScrollView") & 1) != 0)
    {
      v5 = objc_loadWeakRetained((id *)p_mDelegate);
      v6 = objc_msgSend(v5, "shouldResizeCanvasToScrollView");

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

- (void)setViewScale:(double)a3 contentOffset:(CGPoint)a4 animated:(BOOL)a5 source:(id)a6
{
  _BOOL8 v6;
  double y;
  double x;
  NSString *v11;
  NSString *mCurrentInteractionSource;
  NSString *v13;

  v6 = a5;
  y = a4.y;
  x = a4.x;
  v11 = (NSString *)objc_msgSend(a6, "copy");
  mCurrentInteractionSource = self->mCurrentInteractionSource;
  self->mCurrentInteractionSource = v11;

  -[CRLInteractiveCanvasController setViewScale:contentOffset:animated:completionHandler:](self, "setViewScale:contentOffset:animated:completionHandler:", v6, 0, a3, x, y);
  v13 = self->mCurrentInteractionSource;
  self->mCurrentInteractionSource = 0;

}

- (void)setViewScale:(double)a3 contentOffset:(CGPoint)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL4 v6;
  double y;
  double x;
  uint64_t v11;
  double v12;
  double v13;
  id v14;
  double v15;
  id WeakRetained;
  char v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  id v31;

  v6 = a5;
  y = a4.y;
  x = a4.x;
  v31 = a6;
  v12 = 0.0;
  if (v6)
  {
    *(_QWORD *)&v13 = objc_opt_class(self, v11).n128_u64[0];
    objc_msgSend(v14, "defaultAutoZoomAnimationDuration", v13);
    v12 = v15;
    WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
    v17 = objc_opt_respondsToSelector(WeakRetained, "viewScaleZoomAnimationDurationForInteractiveCanvasController:");

    if ((v17 & 1) != 0)
    {
      v18 = objc_loadWeakRetained((id *)&self->mDelegate);
      objc_msgSend(v18, "viewScaleZoomAnimationDurationForInteractiveCanvasController:", self);
      v12 = v19;

    }
  }
  -[CRLInteractiveCanvasController clampedUnscaledContentOffset:forViewScale:](self, "clampedUnscaledContentOffset:forViewScale:", x, y, a3);
  v21 = v20;
  v23 = v22;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvasView](self, "canvasView"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "window"));
  objc_msgSend(v25, "bounds");
  v27 = v26;
  v29 = v28;

  if (v27 <= v29)
    v30 = 1;
  else
    v30 = 4;
  -[CRLInteractiveCanvasController animateToViewScale:contentOffset:duration:orientation:completionHandler:](self, "animateToViewScale:contentOffset:duration:orientation:completionHandler:", v30, v31, a3, v21, v23, v12);

}

- (CGPoint)clampedUnscaledContentOffset:(CGPoint)a3 forViewScale:(double)a4
{
  void *v6;
  void *v7;
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
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  unsigned int v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double MaxY;
  void *v54;
  unsigned int v55;
  double v56;
  double v57;
  unsigned __int8 v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  CGPoint result;
  CGRect v69;
  CGRect v70;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "canvasLayer"));

  -[CRLInteractiveCanvasController unobscuredScrollViewFrame](self, "unobscuredScrollViewFrame");
  v8 = 1.0 / a4;
  v11 = sub_1000603DC(v9, v10, v8);
  v66 = v12;
  objc_msgSend(v7, "contentInset");
  v14 = v13;
  v16 = v15;
  v18 = v8 * v17;
  v20 = v8 * v19;
  if (-[CRLInteractiveCanvasController shouldCanvasScrollingSizeGrowToFitBoardContent](self, "shouldCanvasScrollingSizeGrowToFitBoardContent"))
  {
    objc_msgSend(v7, "bounds");
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;
    -[CRLInteractiveCanvasController viewScale](self, "viewScale");
    v30 = sub_100060FD8(v22, v24, v26, v28, 1.0 / v29);
    v32 = v31;
    v34 = v33;
    v36 = v35;
  }
  else
  {
    v65 = v8 * v16;
    v37 = v11;
    v38 = v8 * v14;
    objc_msgSend(v7, "unscaledSize");
    v39 = sub_10005FDDC();
    v41 = v40;
    v43 = v42;
    v45 = v44;
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvas](self, "canvas"));
    v47 = objc_msgSend(v46, "isAnchoredAtRight");

    v48 = 0.0;
    if (v47)
      v48 = v43;
    v49 = v39 - v48;
    -[CRLInteractiveCanvasController viewScale](self, "viewScale");
    v51 = 1.0 / v50;
    v52 = v38 * v51;
    v11 = v37;
    v30 = v49 + v20 * v51;
    v32 = v41 + v18 * v51;
    v34 = v43 - (v20 * v51 + v65 * v51);
    v36 = v45 - (v18 * v51 + v52);
  }
  v69.origin.x = v30;
  v69.origin.y = v32;
  v69.size.width = v34;
  v69.size.height = v36;
  MaxY = CGRectGetMaxY(v69);
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvas](self, "canvas"));
  v55 = objc_msgSend(v54, "isAnchoredAtRight");

  if (v55)
  {
    v56 = -(v11 + v20);
    if (v30 > v56)
      v30 = -(v11 + v20);
  }
  else
  {
    v70.origin.x = v30;
    v70.origin.y = v32;
    v70.size.width = v34;
    v70.size.height = v36;
    v57 = CGRectGetMaxX(v70) - v11;
    v58 = -[CRLInteractiveCanvasController shouldCanvasScrollingSizeGrowToFitBoardContent](self, "shouldCanvasScrollingSizeGrowToFitBoardContent");
    if (v57 >= v20)
      v59 = v57;
    else
      v59 = v20;
    if ((v58 & 1) != 0)
      v56 = v57;
    else
      v56 = v59;
  }
  if (MaxY - v66 >= v18)
    v60 = MaxY - v66;
  else
    v60 = v18;
  v61 = sub_1003C65EC(a3.x, v30, v56);
  v62 = sub_1003C65EC(a3.y, v32, v60);

  v63 = v61;
  v64 = v62;
  result.y = v64;
  result.x = v63;
  return result;
}

- (void)setViewScale:(double)a3 andScrollViewFrame:(CGRect)a4 maintainPosition:(BOOL)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  double height;
  double width;
  double y;
  double x;
  void *v13;
  id v14;

  v6 = a6;
  v7 = a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v14 = (id)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "canvasLayer"));
  objc_msgSend(v13, "setViewScale:andScrollViewFrame:maintainPosition:animated:", v7, v6, a3, x, y, width, height);

}

- (void)setViewScale:(double)a3 andScrollViewFrame:(CGRect)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  double y;
  double x;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v5 = a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController delegate](self, "delegate"));
  v13 = objc_opt_respondsToSelector(v12, "interactiveCanvasControllerShouldMaintainPositionOnSetViewScale:");

  if ((v13 & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController delegate](self, "delegate"));
    v15 = (uint64_t)objc_msgSend(v14, "interactiveCanvasControllerShouldMaintainPositionOnSetViewScale:", self);

  }
  else
  {
    v15 = 1;
  }
  v17 = (id)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "canvasLayer"));
  objc_msgSend(v16, "setViewScale:andScrollViewFrame:maintainPosition:animated:", v15, v5, a3, x, y, width, height);

}

- (CGRect)unobscuredFrameOfView:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[CRLInteractiveCanvasController p_unosbcuredFrameOfView:includingObscuringRectangles:](self, "p_unosbcuredFrameOfView:includingObscuringRectangles:", a3, 1);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)p_unosbcuredFrameOfView:(id)a3 includingObscuringRectangles:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  void *v18;
  char v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  void *i;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  CGRect result;

  v4 = a4;
  v6 = a3;
  if (!v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254860);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E255D4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254880);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController p_unosbcuredFrameOfView:includingObscuringRectangles:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 2968, 0, "Cannot calculate unobscured frame without view");

  }
  objc_msgSend(v6, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController delegate](self, "delegate"));
  v19 = objc_opt_respondsToSelector(v18, "safeAreaLayoutFrameForInteractiveCanvasController:");

  if ((v19 & 1) != 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController delegate](self, "delegate"));
    objc_msgSend(v20, "safeAreaLayoutFrameForInteractiveCanvasController:", self);
    v11 = v21;
    v13 = v22;
    v15 = v23;
    v17 = v24;

  }
  if (v4)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController delegate](self, "delegate"));
    v26 = objc_opt_respondsToSelector(v25, "rectanglesObscuringView:");

    if ((v26 & 1) != 0)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController delegate](self, "delegate"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "rectanglesObscuringView:", v6));

    }
    else
    {
      v28 = 0;
    }
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v29 = v28;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v31; i = (char *)i + 1)
        {
          if (*(_QWORD *)v46 != v32)
            objc_enumerationMutation(v29);
          objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i), "CGRectValue", (_QWORD)v45);
          v11 = sub_100062850(v11, v13, v15, v17, v34, v35, v36, v37);
          v13 = v38;
          v15 = v39;
          v17 = v40;
        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      }
      while (v31);
    }

  }
  v41 = v11;
  v42 = v13;
  v43 = v15;
  v44 = v17;
  result.size.height = v44;
  result.size.width = v43;
  result.origin.y = v42;
  result.origin.x = v41;
  return result;
}

- (void)p_updateUnobscuredFrame
{
  void *v3;
  void *v4;
  void *v5;
  double x;
  double y;
  double width;
  double height;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvasView](self, "canvasView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "enclosingScrollView"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "superview"));
  if (v5)
  {
    -[CRLInteractiveCanvasController unobscuredFrameOfView:](self, "unobscuredFrameOfView:", v4);
    x = v29.origin.x;
    y = v29.origin.y;
    width = v29.size.width;
    height = v29.size.height;
    if (CGRectGetHeight(v29) == 0.0
      || (v30.origin.x = x,
          v30.origin.y = y,
          v30.size.width = width,
          v30.size.height = height,
          CGRectGetWidth(v30) == 0.0))
    {
      x = CGRectZero.origin.x;
      y = CGRectZero.origin.y;
      width = CGRectZero.size.width;
      height = CGRectZero.size.height;
    }
    -[CRLInteractiveCanvasController unobscuredScrollViewFrame](self, "unobscuredScrollViewFrame");
    v32.origin.x = v10;
    v32.origin.y = v11;
    v32.size.width = v12;
    v32.size.height = v13;
    v31.origin.x = x;
    v31.origin.y = y;
    v31.size.width = width;
    v31.size.height = height;
    if (!CGRectEqualToRect(v31, v32))
      -[CRLInteractiveCanvasController invalidateReps](self, "invalidateReps");
    -[CRLInteractiveCanvasController setUnobscuredScrollViewFrame:](self, "setUnobscuredScrollViewFrame:", x, y, width, height);
    -[CRLInteractiveCanvasController p_unosbcuredFrameOfView:includingObscuringRectangles:](self, "p_unosbcuredFrameOfView:includingObscuringRectangles:", v4, 0);
    self->mUnobscuredScrollViewFrameIgnoringObscuringRectangles.origin.x = v14;
    self->mUnobscuredScrollViewFrameIgnoringObscuringRectangles.origin.y = v15;
    self->mUnobscuredScrollViewFrameIgnoringObscuringRectangles.size.width = v16;
    self->mUnobscuredScrollViewFrameIgnoringObscuringRectangles.size.height = v17;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController i_decorators](self, "i_decorators", 0));
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(_QWORD *)v25 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
          if ((objc_opt_respondsToSelector(v23, "unobscuredFrameDidChange") & 1) != 0)
            objc_msgSend(v23, "unobscuredFrameDidChange");
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v20);
    }

  }
}

- (void)unobscuredFrameDidChange
{
  void *v3;
  char v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  CGRect v14;
  CGRect v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController delegate](self, "delegate"));
  v4 = objc_opt_respondsToSelector(v3, "interactiveCanvasControllerWillChangeUnobscuredFrame:");

  if ((v4 & 1) == 0)
    goto LABEL_3;
  -[CRLInteractiveCanvasController unobscuredScrollViewFrame](self, "unobscuredScrollViewFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController delegate](self, "delegate"));
  objc_msgSend(v13, "interactiveCanvasControllerWillChangeUnobscuredFrame:", self);

  -[CRLInteractiveCanvasController unobscuredScrollViewFrame](self, "unobscuredScrollViewFrame");
  v15.origin.x = v6;
  v15.origin.y = v8;
  v15.size.width = v10;
  v15.size.height = v12;
  if (CGRectEqualToRect(v14, v15))
LABEL_3:
    -[CRLInteractiveCanvasController p_updateUnobscuredFrame](self, "p_updateUnobscuredFrame");
}

- (CGRect)unobscuredScrollViewFrame
{
  void *v3;
  void *v4;
  double v5;
  CGFloat x;
  double v7;
  CGFloat y;
  double v9;
  CGFloat width;
  double v11;
  CGFloat height;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;
  CGRect v18;

  v18.origin.x = CGRectZero.origin.x;
  v18.origin.y = CGRectZero.origin.y;
  v18.size.width = CGRectZero.size.width;
  v18.size.height = CGRectZero.size.height;
  if (CGRectEqualToRect(self->mUnobscuredScrollViewFrame, v18))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvasView](self, "canvasView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "enclosingScrollView"));
    objc_msgSend(v4, "frame");
    x = v5;
    y = v7;
    width = v9;
    height = v11;

  }
  else
  {
    x = self->mUnobscuredScrollViewFrame.origin.x;
    y = self->mUnobscuredScrollViewFrame.origin.y;
    width = self->mUnobscuredScrollViewFrame.size.width;
    height = self->mUnobscuredScrollViewFrame.size.height;
  }
  v13 = x;
  v14 = y;
  v15 = width;
  v16 = height;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)p_unobscuredScrollViewFrameIgnoringObscuringRectangles
{
  void *v3;
  void *v4;
  double v5;
  CGFloat x;
  double v7;
  CGFloat y;
  double v9;
  CGFloat width;
  double v11;
  CGFloat height;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;
  CGRect v18;

  v18.origin.x = CGRectZero.origin.x;
  v18.origin.y = CGRectZero.origin.y;
  v18.size.width = CGRectZero.size.width;
  v18.size.height = CGRectZero.size.height;
  if (CGRectEqualToRect(self->mUnobscuredScrollViewFrameIgnoringObscuringRectangles, v18))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvasView](self, "canvasView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "enclosingScrollView"));
    objc_msgSend(v4, "frame");
    x = v5;
    y = v7;
    width = v9;
    height = v11;

  }
  else
  {
    x = self->mUnobscuredScrollViewFrameIgnoringObscuringRectangles.origin.x;
    y = self->mUnobscuredScrollViewFrameIgnoringObscuringRectangles.origin.y;
    width = self->mUnobscuredScrollViewFrameIgnoringObscuringRectangles.size.width;
    height = self->mUnobscuredScrollViewFrameIgnoringObscuringRectangles.size.height;
  }
  v13 = x;
  v14 = y;
  v15 = width;
  v16 = height;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGPoint)p_contentOffsetToScrollRectToVisible:(CGRect)a3 shouldCenterVertically:(BOOL)a4 forceCenteringVertically:(BOOL)a5 forceCenteringHorizontally:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v14;
  void *v15;
  double v16;
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
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  unsigned int v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  CGFloat v67;
  double v68;
  CGFloat v69;
  double v70;
  CGFloat v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  void *v92;
  double v93;
  CGFloat v94;
  double v95;
  CGFloat v96;
  double v97;
  CGFloat v98;
  double v99;
  double v100;
  CGFloat v101;
  CGFloat v102;
  CGFloat v103;
  CGFloat v104;
  double v105;
  CGFloat v106;
  CGFloat v107;
  CGFloat v108;
  CGFloat v109;
  double v110;
  double MaxY;
  CGFloat v112;
  CGFloat v113;
  CGFloat v114;
  CGFloat v115;
  double MinY;
  double v117;
  double v118;
  CGFloat v119;
  CGFloat v120;
  double v121;
  double v122;
  CGFloat v123;
  CGFloat v124;
  double v125;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  CGFloat v132;
  double v133;
  double v134;
  CGFloat v135;
  CGFloat v136;
  double v137;
  double v138;
  double v139;
  CGFloat v140;
  double v141;
  CGFloat v142;
  double v143;
  CGFloat v144;
  double v145;
  CGFloat v146;
  CGFloat v147;
  CGFloat v148;
  CGFloat v149;
  CGFloat v150;
  CGFloat v151;
  double MaxX;
  double MinX;
  double v154;
  double v155;
  double v156;
  double v157;
  CGFloat v158;
  CGFloat v159;
  double v160;
  double v161;
  double v162;
  double v163;
  double v164;
  double v165;
  CGFloat v166;
  double v167;
  double v168;
  double v169;
  CGFloat v170;
  double v171;
  CGFloat v172;
  double v173;
  double v174;
  double v175;
  CGFloat v176;
  CGFloat v177;
  CGFloat v178;
  CGFloat v179;
  CGFloat v180;
  CGFloat v181;
  CGFloat v182;
  CGFloat r2;
  CGFloat v184;
  double v185;
  CGFloat v186;
  double v187;
  CGFloat v188;
  double v189;
  CGFloat rect;
  double rect_8;
  CGFloat rect_8a;
  double rect_8c;
  double rect_8b;
  double rect_8d;
  double rect_16;
  CGFloat rect_16a;
  double rect_16b;
  double rect_24;
  double rect_24a;
  double v201;
  CGFloat v202;
  CGPoint result;
  CGRect v204;
  CGRect v205;
  CGRect v206;
  CGRect v207;
  CGRect v208;
  CGRect v209;
  CGRect v210;
  CGRect v211;
  CGRect v212;
  CGRect v213;
  CGRect v214;
  CGRect v215;
  CGRect v216;
  CGRect v217;
  CGRect v218;
  CGRect v219;
  CGRect v220;
  CGRect v221;
  CGRect v222;
  CGRect v223;
  CGRect v224;
  CGRect v225;
  CGRect v226;
  CGRect v227;
  CGRect v228;
  CGRect v229;
  CGRect v230;
  CGRect v231;
  CGRect v232;
  CGRect v233;
  CGRect v234;
  CGRect v235;
  CGRect v236;
  CGRect v237;
  CGRect v238;
  CGRect v239;
  CGRect v240;
  CGRect v241;
  CGRect v242;
  CGRect v243;
  CGRect v244;
  CGRect v245;
  CGRect v246;
  CGRect v247;
  CGRect v248;
  CGRect v249;

  v6 = a6;
  v7 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "canvasLayer"));

  objc_msgSend(v15, "contentInset");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  if (-[CRLInteractiveCanvasController shouldCanvasScrollingSizeGrowToFitBoardContent](self, "shouldCanvasScrollingSizeGrowToFitBoardContent"))
  {
    objc_msgSend(v15, "bounds");
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v31 = v30;
    -[CRLInteractiveCanvasController viewScale](self, "viewScale");
    v33 = sub_100060FD8(v25, v27, v29, v31, 1.0 / v32);
    v35 = v34;
    v37 = v36;
    v39 = v38;
  }
  else
  {
    objc_msgSend(v15, "unscaledSize");
    rect_16 = x;
    rect_24 = y;
    v40 = height;
    v41 = sub_10005FDDC();
    v201 = width;
    v43 = v42;
    v45 = v44;
    rect_8 = v46;
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvas](self, "canvas"));
    v48 = objc_msgSend(v47, "isAnchoredAtRight");

    v49 = 0.0;
    if (v48)
      v49 = v45;
    v50 = v41 - v49;
    -[CRLInteractiveCanvasController viewScale](self, "viewScale");
    v52 = 1.0 / v51;
    v33 = v50 + v19 * v52;
    height = v40;
    v35 = v43 + v17 * v52;
    width = v201;
    v37 = v45 - (v19 * v52 + v23 * v52);
    x = rect_16;
    y = rect_24;
    v39 = rect_8 - (v17 * v52 + v21 * v52);
  }
  v204.origin.x = x;
  v204.origin.y = y;
  v204.size.width = width;
  v204.size.height = height;
  v205 = CGRectIntersection(v204, *(CGRect *)&v33);
  v53 = v205.origin.x;
  v54 = v205.origin.y;
  v55 = v205.size.width;
  v56 = v205.size.height;
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "canvasView"));

  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "enclosingScrollView"));
  -[CRLInteractiveCanvasController contentOffset](self, "contentOffset");
  -[CRLInteractiveCanvasController convertUnscaledToBoundsPoint:](self, "convertUnscaledToBoundsPoint:");
  v61 = v60;
  v63 = v62;
  v206.origin.x = v53;
  v206.origin.y = v54;
  v206.size.width = v55;
  v206.size.height = v56;
  if (!CGRectIsEmpty(v206))
  {
    -[CRLInteractiveCanvasController convertUnscaledToBoundsRect:](self, "convertUnscaledToBoundsRect:", v53, v54, v55, v56);
    v65 = v64;
    v67 = v66;
    v69 = v68;
    v71 = v70;
    v72 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvas](self, "canvas"));
    objc_msgSend(v72, "contentsScale");
    v74 = sub_100063150(v65, v67, v69, v71, v73);
    v76 = v75;
    v78 = v77;
    v186 = v79;

    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "superview"));
    if (!v80)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012548A0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E25654();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012548C0);
      v81 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController p_contentOffsetToScrollRectToVisible:shouldCenterVertically:forceCenteringVertically:forceCenteringHorizontally:]"));
      v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v82, v83, 3098, 0, "We expect a superview for bounds calculation");

    }
    rect = v76;
    rect_8a = v74;
    v188 = v78;
    rect_24a = v63;
    v185 = v61;
    -[CRLInteractiveCanvasController unobscuredScrollViewFrame](self, "unobscuredScrollViewFrame");
    v85 = v84;
    v87 = v86;
    v89 = v88;
    v91 = v90;
    v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "superview"));
    objc_msgSend(v58, "convertRect:fromView:", v92, v85, v87, v89, v91);
    v94 = v93;
    v96 = v95;
    v98 = v97;
    v100 = v99;

    -[CRLInteractiveCanvasController p_safeAreaLayoutGuideLayoutFrame](self, "p_safeAreaLayoutGuideLayoutFrame");
    objc_msgSend(v58, "convertRect:fromView:", v59);
    v101 = v207.origin.x;
    v102 = v207.origin.y;
    v103 = v207.size.width;
    v104 = v207.size.height;
    if (CGRectIsEmpty(v207))
      goto LABEL_20;
    v208.origin.x = v101;
    v208.origin.y = v102;
    v208.size.width = v103;
    v208.size.height = v104;
    v245.origin.x = v94;
    v245.origin.y = v96;
    v245.size.width = v98;
    v245.size.height = v100;
    if (!CGRectIntersectsRect(v208, v245))
    {
LABEL_20:
      v210.size.width = v98;
    }
    else
    {
      v209.origin.x = v101;
      v209.origin.y = v102;
      v209.size.width = v103;
      v209.size.height = v104;
      v246.origin.x = v94;
      v246.origin.y = v96;
      v246.size.width = v98;
      v246.size.height = v100;
      v210 = CGRectIntersection(v209, v246);
      v94 = v210.origin.x;
      v96 = v210.origin.y;
      v100 = v210.size.height;
    }
    v105 = rect;
    v106 = rect_8a;
    v202 = v100;
    rect_16a = v96;
    v184 = v94;
    if (a4 || v7)
    {
      v123 = v94;
      v124 = v96;
      v122 = v210.size.width;
      v125 = v100;
      v247.origin.x = rect_8a;
      v247.origin.y = rect;
      v247.size.width = v188;
      v115 = v186;
      v247.size.height = v186;
      if (CGRectContainsRect(v210, v247) && !v7)
      {
        v120 = v188;
        if (v6)
          goto LABEL_42;
      }
      else
      {
        sub_100061400(rect_8a, rect, v188, v186);
        v105 = v127 + v100 * -0.5;
        if (-[CRLInteractiveCanvasController shouldCanvasScrollingSizeGrowToFitBoardContent](self, "shouldCanvasScrollingSizeGrowToFitBoardContent"))
        {
          v120 = v188;
          v115 = v100;
        }
        else
        {
          objc_msgSend(v15, "unscaledSize");
          -[CRLInteractiveCanvasController convertUnscaledToBoundsRect:](self, "convertUnscaledToBoundsRect:", sub_10005FDDC());
          v166 = v165;
          v168 = v167;
          v170 = v169;
          v172 = v171;
          objc_msgSend(v15, "contentInset");
          v187 = v168 + v173;
          if (!sub_10005FFE0(v166, v168 + v173, v170, v172, rect_8a, v105, v188, v202))
          {
            v174 = sub_100061AD8(rect_8a, v105, v188, v202, v166, v187, v170, v172);
            v175 = v170;
            v177 = v176;
            v179 = v178;
            v181 = v180;
            v182 = v174;
            r2 = v175;
            if (sub_10005FFE0(v166, v187, v175, v172, v174, v176, v178, v180))
            {
              v115 = v202;
              rect_24a = v177;
            }
            else
            {
              v243.origin.x = v182;
              v243.origin.y = v177;
              v243.size.width = v179;
              v243.size.height = v181;
              v249.origin.x = v166;
              v249.origin.y = v187;
              v249.size.width = r2;
              v249.size.height = v172;
              v244 = CGRectIntersection(v243, v249);
              rect_24a = v244.origin.y;
              v115 = v202;
            }
            v120 = v188;
            v106 = rect_8a;
            if (v6)
              goto LABEL_42;
            goto LABEL_47;
          }
          v120 = v188;
          v115 = v202;
        }
        rect_24a = v105;
        if (v6)
          goto LABEL_42;
      }
    }
    else
    {
      v107 = v94;
      v108 = v96;
      v109 = v210.size.width;
      v110 = v100;
      MaxY = CGRectGetMaxY(v210);
      v211.origin.x = rect_8a;
      v211.origin.y = rect;
      v211.size.width = v188;
      v112 = v96;
      v113 = v109;
      v114 = v188;
      v115 = v186;
      v211.size.height = v186;
      if (MaxY <= CGRectGetMaxY(v211))
        goto LABEL_34;
      v212.origin.x = v94;
      v212.origin.y = v112;
      v212.size.width = v113;
      v212.size.height = v202;
      MinY = CGRectGetMinY(v212);
      v213.origin.x = rect_8a;
      v213.origin.y = rect;
      v213.size.width = v188;
      v213.size.height = v186;
      if (MinY <= CGRectGetMinY(v213))
      {
LABEL_34:
        v218.origin.x = v94;
        v218.origin.y = v112;
        v218.size.width = v113;
        v218.size.height = v202;
        v128 = CGRectGetMinY(v218);
        v219.origin.x = rect_8a;
        v219.origin.y = rect;
        v219.size.width = v188;
        v219.size.height = v186;
        if (v128 < CGRectGetMinY(v219))
        {
          v220.origin.x = v94;
          v220.origin.y = v112;
          v220.size.width = v113;
          v220.size.height = v202;
          v129 = CGRectGetMaxY(v220);
          v221.origin.x = rect_8a;
          v221.origin.y = rect;
          v221.size.width = v188;
          v221.size.height = v186;
          if (v129 < CGRectGetMaxY(v221))
          {
            v222.origin.x = rect_8a;
            v222.origin.y = rect;
            v222.size.width = v188;
            v222.size.height = v186;
            v130 = CGRectGetMinY(v222);
            v223.origin.x = v94;
            v223.origin.y = v112;
            v223.size.width = v113;
            v223.size.height = v202;
            v131 = v130 - CGRectGetMinY(v223);
            v224.origin.x = rect_8a;
            v224.origin.y = rect;
            v132 = v113;
            v120 = v188;
            v224.size.width = v188;
            v224.size.height = v186;
            v133 = CGRectGetMaxY(v224);
            v225.origin.x = v94;
            v225.origin.y = v112;
            v225.size.width = v132;
            v225.size.height = v202;
            v134 = v133 - CGRectGetMaxY(v225);
            if (v131 < v134)
              v134 = v131;
            v105 = rect;
            v106 = rect_8a;
            rect_24a = rect_24a + v134;
            v122 = v132;
            if (v6)
              goto LABEL_42;
            goto LABEL_47;
          }
        }
        v135 = v113;
        v120 = v188;
        v122 = v135;
      }
      else
      {
        v214.origin.x = v94;
        v214.origin.y = v112;
        v214.size.width = v113;
        v214.size.height = v202;
        v189 = CGRectGetMaxY(v214);
        v215.origin.x = rect_8a;
        v215.origin.y = rect;
        v215.size.width = v114;
        v215.size.height = v186;
        v117 = v189 - CGRectGetMaxY(v215);
        v216.origin.x = v94;
        v216.origin.y = v112;
        v216.size.width = v113;
        v216.size.height = v202;
        v118 = CGRectGetMinY(v216);
        v217.origin.x = rect_8a;
        v217.origin.y = rect;
        v119 = v113;
        v120 = v114;
        v217.size.width = v114;
        v217.size.height = v186;
        v121 = v118 - CGRectGetMinY(v217);
        if (v117 < v121)
          v121 = v117;
        v106 = rect_8a;
        rect_24a = rect_24a - v121;
        v122 = v119;
      }
      v105 = rect;
      if (v6)
      {
LABEL_42:
        v136 = v105;
        v61 = sub_100061400(v106, v105, v120, v115) + v122 * -0.5;
        if (!-[CRLInteractiveCanvasController shouldCanvasScrollingSizeGrowToFitBoardContent](self, "shouldCanvasScrollingSizeGrowToFitBoardContent"))
        {
          objc_msgSend(v15, "unscaledSize");
          -[CRLInteractiveCanvasController convertUnscaledToBoundsRect:](self, "convertUnscaledToBoundsRect:", sub_10005FDDC());
          v138 = v137;
          v140 = v139;
          v142 = v141;
          v144 = v143;
          objc_msgSend(v15, "contentInset");
          rect_16b = v138 + v145;
          if (!sub_10005FFE0(v138 + v145, v140, v142, v144, v61, v136, v122, v115))
          {
            v61 = sub_100061AD8(v61, v136, v122, v115, rect_16b, v140, v142, v144);
            v147 = v146;
            v149 = v148;
            v151 = v150;
            if (!sub_10005FFE0(rect_16b, v140, v142, v144, v61, v146, v148, v150))
            {
              v226.origin.x = v61;
              v226.origin.y = v147;
              v226.size.width = v149;
              v226.size.height = v151;
              v248.origin.x = rect_16b;
              v248.origin.y = v140;
              v248.size.width = v142;
              v248.size.height = v144;
              *(_QWORD *)&v61 = (unint64_t)CGRectIntersection(v226, v248);
            }
          }
        }
LABEL_58:
        v63 = rect_24a;
        goto LABEL_59;
      }
    }
LABEL_47:
    v227.origin.x = v184;
    v227.origin.y = rect_16a;
    v227.size.width = v122;
    v227.size.height = v202;
    MaxX = CGRectGetMaxX(v227);
    v228.origin.x = v106;
    v228.origin.y = v105;
    v228.size.width = v120;
    v228.size.height = v115;
    if (MaxX <= CGRectGetMaxX(v228))
      goto LABEL_52;
    v229.origin.x = v184;
    v229.origin.y = rect_16a;
    v229.size.width = v122;
    v229.size.height = v202;
    MinX = CGRectGetMinX(v229);
    v230.origin.x = v106;
    v230.origin.y = v105;
    v230.size.width = v120;
    v230.size.height = v115;
    if (MinX <= CGRectGetMinX(v230))
    {
LABEL_52:
      v235.origin.x = v184;
      v235.origin.y = rect_16a;
      v235.size.width = v122;
      v235.size.height = v202;
      v156 = CGRectGetMinX(v235);
      v236.origin.x = v106;
      v236.origin.y = v105;
      v236.size.width = v120;
      v236.size.height = v115;
      if (v156 >= CGRectGetMinX(v236))
        goto LABEL_57;
      v237.origin.x = v184;
      v237.origin.y = rect_16a;
      v237.size.width = v122;
      v237.size.height = v202;
      v157 = CGRectGetMaxX(v237);
      v238.origin.x = v106;
      v238.origin.y = v105;
      v238.size.width = v120;
      v238.size.height = v115;
      if (v157 >= CGRectGetMaxX(v238))
      {
LABEL_57:
        v61 = v185;
      }
      else
      {
        v239.origin.x = v106;
        v239.origin.y = v105;
        v239.size.width = v120;
        v239.size.height = v115;
        rect_8d = CGRectGetMinX(v239);
        v240.origin.x = v184;
        v240.origin.y = rect_16a;
        v240.size.width = v122;
        v240.size.height = v202;
        v158 = CGRectGetMinX(v240);
        v159 = v106;
        v160 = rect_8d - v158;
        v241.origin.x = v159;
        v241.origin.y = v105;
        v241.size.width = v120;
        v241.size.height = v115;
        v161 = CGRectGetMaxX(v241);
        v242.origin.x = v184;
        v242.origin.y = rect_16a;
        v242.size.width = v122;
        v242.size.height = v202;
        v162 = v161 - CGRectGetMaxX(v242);
        if (v160 < v162)
          v162 = v160;
        v61 = v185 + v162;
      }
    }
    else
    {
      v231.origin.x = v184;
      v231.origin.y = rect_16a;
      v231.size.width = v122;
      v231.size.height = v202;
      rect_8c = CGRectGetMaxX(v231);
      v232.origin.x = v106;
      v232.origin.y = v105;
      v232.size.width = v120;
      v232.size.height = v115;
      rect_8b = rect_8c - CGRectGetMaxX(v232);
      v233.origin.x = v184;
      v233.origin.y = rect_16a;
      v233.size.width = v122;
      v233.size.height = v202;
      v154 = CGRectGetMinX(v233);
      v234.origin.x = v106;
      v234.origin.y = v105;
      v234.size.width = v120;
      v234.size.height = v115;
      v155 = v154 - CGRectGetMinX(v234);
      if (rect_8b < v155)
        v155 = rect_8b;
      v61 = v185 - v155;
    }
    goto LABEL_58;
  }
LABEL_59:

  v163 = v61;
  v164 = v63;
  result.y = v164;
  result.x = v163;
  return result;
}

- (void)scrollRectToVisible:(CGRect)a3 scrollOptions:(unint64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id WeakRetained;
  char v18;
  id v19;
  unsigned int v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CRLInteractiveCanvasController cancelScrollToCurrentSelectionPathAfterLayout](self, "cancelScrollToCurrentSelectionPathAfterLayout");
  if ((a4 & 2) == 0)
  {
    if ((a4 & 4) == 0)
      goto LABEL_3;
LABEL_14:
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254920);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E256D4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254940);
    v14 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController scrollRectToVisible:scrollOptions:]"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 3199, 0, "Cannot tell scrollRectToVisible to zoom!");

    if ((a4 & 1) == 0)
      goto LABEL_4;
LABEL_23:
    WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
    v18 = objc_opt_respondsToSelector(WeakRetained, "shouldAllowAnimatedScrollForInteractiveCanvasController:");

    if ((v18 & 1) != 0)
    {
      v19 = objc_loadWeakRetained((id *)&self->mDelegate);
      v20 = objc_msgSend(v19, "shouldAllowAnimatedScrollForInteractiveCanvasController:", self);

      v10 = v20;
    }
    else
    {
      v10 = 1;
    }
    goto LABEL_26;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012548E0);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E25754();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101254900);
  v11 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController scrollRectToVisible:scrollOptions:]"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 3198, 0, "Cannot tell scrollRectToVisible to zoom!");

  if ((a4 & 4) != 0)
    goto LABEL_14;
LABEL_3:
  if ((a4 & 1) != 0)
    goto LABEL_23;
LABEL_4:
  v10 = 0;
LABEL_26:
  -[CRLInteractiveCanvasController p_contentOffsetToScrollRectToVisible:shouldCenterVertically:forceCenteringVertically:forceCenteringHorizontally:](self, "p_contentOffsetToScrollRectToVisible:shouldCenterVertically:forceCenteringVertically:forceCenteringHorizontally:", (a4 >> 3) & 1, (a4 >> 5) & 1, (a4 >> 6) & 1, x, y, width, height);
  -[CRLInteractiveCanvasController convertBoundsToUnscaledPoint:](self, "convertBoundsToUnscaledPoint:");
  v22 = v21;
  v24 = v23;
  -[CRLInteractiveCanvasController contentOffset](self, "contentOffset");
  if (!sub_10005FDF0(v22, v24, v25, v26))
    -[CRLInteractiveCanvasController growCanvasAsNeededToSetContentOffset:scrollOptions:](self, "growCanvasAsNeededToSetContentOffset:scrollOptions:", v10, v22, v24);
}

- (void)scrollRectToVisibleWithSelectionOutset:(CGRect)a3 scrollOptions:(unint64_t)a4
{
  -[CRLInteractiveCanvasController outsetSelectionRect:](self, "outsetSelectionRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[CRLInteractiveCanvasController scrollRectToVisible:scrollOptions:](self, "scrollRectToVisible:scrollOptions:", a4);
}

- (void)growCanvasAsNeededToRestoreContentOffset:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;

  y = a3.y;
  x = a3.x;
  if (!-[CRLInteractiveCanvasController shouldCanvasScrollingSizeGrowToFitBoardContent](self, "shouldCanvasScrollingSizeGrowToFitBoardContent"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254960);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E257D4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254980);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController growCanvasAsNeededToRestoreContentOffset:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 3220, 0, "You shouldn't ask to grow the canvas if the canvas doesn't grow in general");

  }
  -[CRLInteractiveCanvasController growCanvasAsNeededToSetContentOffset:scrollOptions:](self, "growCanvasAsNeededToSetContentOffset:scrollOptions:", 0, x, y);
}

- (void)growCanvasAsNeededToSetContentOffset:(CGPoint)a3 scrollOptions:(unint64_t)a4
{
  double y;
  double x;
  id v8;
  Swift::String v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  void *v14;
  void *v15;
  CGSize size;
  Freeform::SyncEvent::FetchedRecordZoneChanges::Deletion v17;

  y = a3.y;
  x = a3.x;
  v8 = -[CRLInteractiveCanvasController visibleUnscaledRect](self, "visibleUnscaledRect");
  v17 = SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)v8, v9);
  self->mRectToIncludeWhenGrowingCanvasToFitContent.origin.x = v10;
  self->mRectToIncludeWhenGrowingCanvasToFitContent.origin.y = v11;
  self->mRectToIncludeWhenGrowingCanvasToFitContent.size.width = v12;
  self->mRectToIncludeWhenGrowingCanvasToFitContent.size.height = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost", v17.recordType._object));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "canvasLayer"));
  objc_msgSend(v15, "fixFrameAndScrollView");

  size = CGRectZero.size;
  self->mRectToIncludeWhenGrowingCanvasToFitContent.origin = CGRectZero.origin;
  self->mRectToIncludeWhenGrowingCanvasToFitContent.size = size;
  -[CRLInteractiveCanvasController setContentOffset:scrollOptions:](self, "setContentOffset:scrollOptions:", a4, x, y);
}

- (void)setContentOffset:(CGPoint)a3 source:(id)a4 scrollOptions:(unint64_t)a5
{
  double y;
  double x;
  NSString *v9;
  NSString *mCurrentInteractionSource;
  NSString *v11;

  y = a3.y;
  x = a3.x;
  v9 = (NSString *)objc_msgSend(a4, "copy");
  mCurrentInteractionSource = self->mCurrentInteractionSource;
  self->mCurrentInteractionSource = v9;

  -[CRLInteractiveCanvasController setContentOffset:scrollOptions:](self, "setContentOffset:scrollOptions:", a5, x, y);
  v11 = self->mCurrentInteractionSource;
  self->mCurrentInteractionSource = 0;

}

- (void)setContentOffset:(CGPoint)a3 scrollOptions:(unint64_t)a4
{
  unint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;

  v5 = a4 & 1;
  -[CRLInteractiveCanvasController convertUnscaledToBoundsPoint:](self, "convertUnscaledToBoundsPoint:", a3.x, a3.y);
  v7 = v6;
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
  v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "canvasView"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "enclosingScrollView"));
  objc_msgSend(v17, "convertPoint:toView:", v11, v7, v9);
  v13 = v12;
  v15 = v14;
  objc_msgSend(v11, "scrollableAreaContentInsets");
  objc_msgSend(v11, "setContentOffset:animated:", v5, sub_1000603B8(v13, v15, v16));

}

- (CGPoint)contentOffset
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat x;
  double v14;
  CGFloat y;
  double v16;
  double v17;
  CGPoint result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "canvasView"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "enclosingScrollView"));
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "contentOffset");
    objc_msgSend(v6, "convertPoint:toView:", v4);
    v8 = v7;
    v10 = v9;
    objc_msgSend(v6, "scrollableAreaContentInsets");
    -[CRLInteractiveCanvasController convertBoundsToUnscaledPoint:](self, "convertBoundsToUnscaledPoint:", sub_1000603D0(v8, v10, v11));
    x = v12;
    y = v14;
  }
  else
  {
    x = CGPointZero.x;
    y = CGPointZero.y;
  }

  v16 = x;
  v17 = y;
  result.y = v17;
  result.x = v16;
  return result;
}

- (CGSize)sizeOfScrollViewEnclosingCanvas
{
  double v2;
  double v3;
  CGSize result;

  -[CRLInteractiveCanvasController p_calculatedSizeOfScrollViewEnclosingCanvas](self, "p_calculatedSizeOfScrollViewEnclosingCanvas");
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)p_calculatedSizeOfScrollViewEnclosingCanvas
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CRLInteractiveCanvasControllerDelegate **p_mDelegate;
  id WeakRetained;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGSize result;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012549A0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E25854();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012549C0);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController p_calculatedSizeOfScrollViewEnclosingCanvas]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 3299, 0, "This operation must only be performed on the main thread.");

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "canvasView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v7, "enclosingScrollView"));
  objc_msgSend(v8, "scrollableAreaBounds");
  v10 = v9;
  v12 = v11;

  p_mDelegate = &self->mDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_mDelegate);
  LOBYTE(v7) = objc_opt_respondsToSelector(WeakRetained, "sizeOfScrollViewEnclosingCanvas");

  if ((v7 & 1) != 0)
  {
    v15 = objc_loadWeakRetained((id *)p_mDelegate);
    objc_msgSend(v15, "sizeOfScrollViewEnclosingCanvas");
    v10 = v16;
    v12 = v17;

  }
  v18 = v10;
  v19 = v12;
  result.height = v19;
  result.width = v18;
  return result;
}

- (CGSize)p_sizeOfScrollViewEnclosingCanvasForVisibleCanvasCalculations
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CRLInteractiveCanvasControllerDelegate **p_mDelegate;
  id WeakRetained;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "canvasView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v4, "enclosingScrollView"));
  objc_msgSend(v5, "scrollableAreaBounds");
  v7 = v6;
  v9 = v8;

  p_mDelegate = &self->mDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_mDelegate);
  LOBYTE(v4) = objc_opt_respondsToSelector(WeakRetained, "sizeOfScrollViewEnclosingCanvasForVisibleCanvasCalculations");

  if ((v4 & 1) != 0)
  {
    v12 = objc_loadWeakRetained((id *)p_mDelegate);
    objc_msgSend(v12, "sizeOfScrollViewEnclosingCanvasForVisibleCanvasCalculations");
    v7 = v13;
    v9 = v14;

  }
  v15 = v7;
  v16 = v9;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)updateCanvasViewSubviewFrames
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController i_interactiveCanvasLayerHelper](self, "i_interactiveCanvasLayerHelper"));
  objc_msgSend(v2, "updateLayerContainerFrames");

}

- (void)setNeedsDisplayOnLayer:(id)a3
{
  objc_msgSend(a3, "setNeedsDisplay");
}

- (void)setNeedsDisplayInRect:(CGRect)a3 onLayer:(id)a4
{
  objc_msgSend(a4, "setNeedsDisplayInRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CRLColor)selectionHighlightColor
{
  return self->mSelectionHighlightColor;
}

- (void)setSelectionHighlightColor:(id)a3
{
  CRLColor *v4;
  CRLColor *mSelectionHighlightColor;

  v4 = (CRLColor *)objc_msgSend(a3, "copy");
  mSelectionHighlightColor = self->mSelectionHighlightColor;
  self->mSelectionHighlightColor = v4;

  -[CRLInteractiveCanvasController i_invalidateSelectionHighlightLayers](self, "i_invalidateSelectionHighlightLayers");
}

- (void)setPrimaryFindResultSearchReference:(id)a3
{
  CRLSearchReference *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v5 = (CRLSearchReference *)a3;
  if (self->_primaryFindResultSearchReference != v5)
  {
    objc_storeStrong((id *)&self->_primaryFindResultSearchReference, a3);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvas](self, "canvas", 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topLevelReps"));

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "recursivelyPerformSelectorIfImplemented:withObject:", "i_primaryFindResultChanged:", v5);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

- (void)setSearchReferencesToHighlight:(id)a3
{
  NSMapTable *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v5 = (NSMapTable *)a3;
  if (self->_searchReferencesToHighlight != v5)
  {
    objc_storeStrong((id *)&self->_searchReferencesToHighlight, a3);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvas](self, "canvas", 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topLevelReps"));

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "recursivelyPerformSelectorIfImplemented:withObject:", "i_setSearchReferencesToHighlight:", v5);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

- (BOOL)hasMediaReplacer
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  unsigned __int8 v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController delegate](self, "delegate"));
  v4 = objc_opt_respondsToSelector(v3, "hasMediaReplacerForInteractiveCanvasController:");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController delegate](self, "delegate"));
  v6 = v5;
  if ((v4 & 1) != 0)
    v7 = objc_msgSend(v5, "hasMediaReplacerForInteractiveCanvasController:", self);
  else
    v7 = objc_opt_respondsToSelector(v5, "mediaReplacerForInteractiveCanvasController:");
  v8 = v7;

  return v8 & 1;
}

- (CRLMediaReplacer)mediaReplacer
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController delegate](self, "delegate"));
  v4 = objc_opt_respondsToSelector(v3, "mediaReplacerForInteractiveCanvasController:");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController delegate](self, "delegate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mediaReplacerForInteractiveCanvasController:", self));

  }
  else
  {
    v6 = 0;
  }
  return (CRLMediaReplacer *)v6;
}

- (CGRect)visibleScaledRectForCanvasUI
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[CRLInteractiveCanvasController p_visibleBoundsRectUsingSizeOfEnclosingScrollView:respectObscuredFrame:respectSafeArea:respectObscuringRects:respectAreaPastScollViewLimit:](self, "p_visibleBoundsRectUsingSizeOfEnclosingScrollView:respectObscuredFrame:respectSafeArea:respectObscuringRects:respectAreaPastScollViewLimit:", 0, 1, 1, 1, 0);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)spellCheckingSupported
{
  CRLInteractiveCanvasControllerDelegate **p_mDelegate;
  id WeakRetained;
  id v4;
  unsigned __int8 v5;

  p_mDelegate = &self->mDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  if ((objc_opt_respondsToSelector(WeakRetained, "spellCheckingSupported") & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)p_mDelegate);
    v5 = objc_msgSend(v4, "spellCheckingSupported");

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (BOOL)spellCheckingSuppressed
{
  unsigned int v3;
  CRLInteractiveCanvasControllerDelegate **p_mDelegate;
  id WeakRetained;
  id v6;
  unsigned __int8 v7;

  v3 = -[CRLInteractiveCanvasController spellCheckingSupported](self, "spellCheckingSupported");
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

- (void)p_spellCheckerWordsDidChangeNotification:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvas](self, "canvas", a3, 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topLevelReps"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "recursivelyPerformSelectorIfImplemented:", "i_spellCheckerWordsDidChange");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)p_spellCheckingStateChangedNotification:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvas](self, "canvas", a3, 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topLevelReps"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "recursivelyPerformSelectorIfImplemented:", "spellCheckingStateChanged");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (BOOL)isCanvasInteractive
{
  return 1;
}

- (BOOL)shouldShowTextOverflowGlyphs
{
  CRLInteractiveCanvasControllerDelegate **p_mDelegate;
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

- (BOOL)shouldShowInstructionalTextForLayout:(id)a3
{
  id v4;
  CRLInteractiveCanvasControllerDelegate **p_mDelegate;
  id WeakRetained;
  void *v7;
  id v8;
  char v9;
  id v10;
  unsigned __int8 v11;

  v4 = a3;
  p_mDelegate = &self->mDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_mDelegate);
  if (WeakRetained
    && (v7 = WeakRetained,
        v8 = objc_loadWeakRetained((id *)p_mDelegate),
        v9 = objc_opt_respondsToSelector(v8, "shouldShowInstructionalTextForLayout:"),
        v8,
        v7,
        (v9 & 1) != 0))
  {
    v10 = objc_loadWeakRetained((id *)p_mDelegate);
    v11 = objc_msgSend(v10, "shouldShowInstructionalTextForLayout:", v4);

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (BOOL)shouldEnableToolbarDoneButton
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  unsigned __int8 v17;
  BOOL v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editorController](self, "editorController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "textInputEditor"));
  v11 = sub_100221DDC(v4, 1, v5, v6, v7, v8, v9, v10, (uint64_t)&OBJC_PROTOCOL____TtP8Freeform18CRLTextInputEditor_);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editorController](self, "editorController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "selectionPath"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController modelsForSelectionPath:](self, "modelsForSelectionPath:", v14));

  v16 = objc_msgSend(v15, "count");
  v17 = objc_msgSend(v12, "wantsDoneButtonWhenEditing");
  if (v16)
    v18 = 1;
  else
    v18 = v17;

  return v18;
}

- (void)updateCanvasDotGridVisibilityIfNeeded
{
  CRLInteractiveCanvasControllerDelegate **p_mDelegate;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  id v14;

  p_mDelegate = &self->mDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  if (WeakRetained
    && (v5 = WeakRetained,
        v6 = objc_loadWeakRetained((id *)p_mDelegate),
        v7 = objc_opt_respondsToSelector(v6, "wantsToShowCanvasDotGridOnInteractiveCanvasController:"),
        v6,
        v5,
        (v7 & 1) != 0))
  {
    v8 = objc_loadWeakRetained((id *)p_mDelegate);
    v9 = objc_msgSend(v8, "wantsToShowCanvasDotGridOnInteractiveCanvasController:", self);

  }
  else
  {
    v9 = 0;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "canvasLayer"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "associatedBackgroundLayer"));
  v12 = objc_msgSend(v11, "enabled");

  if ((_DWORD)v9 != v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "associatedBackgroundLayer"));
    objc_msgSend(v13, "setEnabled:", v9);

  }
}

- (void)updateConnectorKnobVisibilityIfNeeded
{
  CRLInteractiveCanvasControllerDelegate **p_mDelegate;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  p_mDelegate = &self->mDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  if (WeakRetained
    && (v5 = WeakRetained,
        v6 = objc_loadWeakRetained((id *)p_mDelegate),
        v7 = objc_opt_respondsToSelector(v6, "wantsToShowConnectorKnobsOnInteractiveCanvasController:"),
        v6,
        v5,
        (v7 & 1) != 0))
  {
    v8 = objc_loadWeakRetained((id *)p_mDelegate);
    v9 = objc_msgSend(v8, "wantsToShowConnectorKnobsOnInteractiveCanvasController:", self);

  }
  else
  {
    v9 = 0;
  }
  if (self->mConnectorKnobsEnabled != (_DWORD)v9)
  {
    self->mConnectorKnobsEnabled = (char)v9;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvas topLevelReps](self->mCanvas, "topLevelReps", 0));
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), "recursivelyPerformSelectorIfImplemented:", "invalidateKnobs");
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v12);
    }

    -[CRLInteractiveCanvasController updateTipsWithConnectorKnobsEnabled:](self, "updateTipsWithConnectorKnobsEnabled:", v9);
    if ((_DWORD)v9)
      -[CRLInteractiveCanvasController animateIntoConnectorMode](self, "animateIntoConnectorMode");
  }
}

- (void)setFreehandDrawingToolkit:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_storeStrong((id *)&self->mFreehandDrawingToolkit, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "asiOSCVC"));
  objc_msgSend(v6, "i_startObservingFreehandDrawingToolkit");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "asUIKitHost"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "freehandDrawingGestureRecognizer"));

  objc_msgSend(v9, "setEnabled:", a3 != 0);
}

- (BOOL)p_shouldTransformCurrentSelectionAsSingleEntity
{
  if (self->mMultiselectResizeInfo)
    return 1;
  else
    return -[CRLFreehandDrawingToolkit isInDrawingMode](self->mFreehandDrawingToolkit, "isInDrawingMode");
}

- (CRLCanvasGuideController)guideController
{
  CRLCanvasGuideController *mGuideController;
  CRLCanvasGuideController *v4;
  CRLCanvasGuideController *v5;

  mGuideController = self->mGuideController;
  if (!mGuideController)
  {
    v4 = -[CRLCanvasGuideController initWithInteractiveCanvasController:]([CRLCanvasGuideController alloc], "initWithInteractiveCanvasController:", self);
    v5 = self->mGuideController;
    self->mGuideController = v4;

    mGuideController = self->mGuideController;
  }
  return mGuideController;
}

- (void)translateGuide:(id)a3 toContainerRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  double MinX;
  double v14;
  double MaxY;
  double MinY;
  double v17;
  id v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v18 = a3;
  objc_msgSend(v18, "setInfinite:", 0);
  v8 = objc_msgSend(v18, "guideType");
  v9 = x;
  v10 = y;
  v11 = width;
  v12 = height;
  if (v8)
  {
    MinX = CGRectGetMinX(*(CGRect *)&v9);
    objc_msgSend(v18, "offset");
    objc_msgSend(v18, "setOffset:", MinX + v14);
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = width;
    v19.size.height = height;
    objc_msgSend(v18, "setStart:", CGRectGetMinY(v19));
    v20.origin.x = x;
    v20.origin.y = y;
    v20.size.width = width;
    v20.size.height = height;
    MaxY = CGRectGetMaxY(v20);
  }
  else
  {
    MinY = CGRectGetMinY(*(CGRect *)&v9);
    objc_msgSend(v18, "offset");
    objc_msgSend(v18, "setOffset:", MinY + v17);
    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = width;
    v21.size.height = height;
    objc_msgSend(v18, "setStart:", CGRectGetMinX(v21));
    v22.origin.x = x;
    v22.origin.y = y;
    v22.size.width = width;
    v22.size.height = height;
    MaxY = CGRectGetMaxX(v22);
  }
  objc_msgSend(v18, "setEnd:", MaxY);

}

- (void)clipGuideToContainer:(id)a3 atUnscaledPoint:(CGPoint)a4
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  id v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double MaxY;
  id v19;
  CGRect v20;
  CGRect v21;

  v19 = a3;
  -[CRLInteractiveCanvasController visibleUnscaledRect](self, "visibleUnscaledRect");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v19, "setInfinite:", 0);
  v13 = objc_msgSend(v19, "guideType");
  v14 = v6;
  v15 = v8;
  v16 = v10;
  v17 = v12;
  if (v13)
  {
    objc_msgSend(v19, "setStart:", CGRectGetMinY(*(CGRect *)&v14));
    v20.origin.x = v6;
    v20.origin.y = v8;
    v20.size.width = v10;
    v20.size.height = v12;
    MaxY = CGRectGetMaxY(v20);
  }
  else
  {
    objc_msgSend(v19, "setStart:", CGRectGetMinX(*(CGRect *)&v14));
    v21.origin.x = v6;
    v21.origin.y = v8;
    v21.size.width = v10;
    v21.size.height = v12;
    MaxY = CGRectGetMaxX(v21);
  }
  objc_msgSend(v19, "setEnd:", MaxY);

}

- (void)translateGuides:(id)a3 toContainerRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        -[CRLInteractiveCanvasController translateGuide:toContainerRect:](self, "translateGuide:toContainerRect:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v13), x, y, width, height);
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (CGRect)boundingRectForActiveGuidesForPoint:(CGPoint)a3
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = CGRectInfinite.origin.x;
  y = CGRectInfinite.origin.y;
  width = CGRectInfinite.size.width;
  height = CGRectInfinite.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)provideDynamicGuidesForLayout:(id)a3
{
  return &__NSArray0__struct;
}

- (BOOL)shouldGenerateGuidesForLayout:(id)a3
{
  return 1;
}

- (NSArray)infosToDisplay
{
  return -[CRLCanvas infosToDisplay](self->mCanvas, "infosToDisplay");
}

- (void)setInfosToDisplay:(id)a3
{
  -[CRLCanvas i_setInfosToDisplay:updatingLayoutController:](self->mCanvas, "i_setInfosToDisplay:updatingLayoutController:", a3, 0);
  -[CRLCanvasEditor canvasInfosDidChange](self->mCanvasEditor, "canvasInfosDidChange");
  -[CRLCanvas i_updateInfosInLayoutController](self->mCanvas, "i_updateInfosInLayoutController");
}

- (void)setTemporaryAdditionalBoardItemsToDisplay:(id)a3
{
  unint64_t v4;
  void *v5;
  unsigned __int8 v6;
  NSArray *v7;
  NSArray *temporaryAdditionalBoardItemsToDisplay;
  void *v9;

  v4 = (unint64_t)a3;
  v5 = (void *)v4;
  if (v4 | (unint64_t)self->_temporaryAdditionalBoardItemsToDisplay)
  {
    v9 = (void *)v4;
    v6 = objc_msgSend((id)v4, "isEqual:");
    v5 = v9;
    if ((v6 & 1) == 0)
    {
      v7 = (NSArray *)objc_msgSend(v9, "copy");
      temporaryAdditionalBoardItemsToDisplay = self->_temporaryAdditionalBoardItemsToDisplay;
      self->_temporaryAdditionalBoardItemsToDisplay = v7;

      -[CRLInteractiveCanvasController p_updateInfosToDisplayIfNeeded](self, "p_updateInfosToDisplayIfNeeded");
      v5 = v9;
    }
  }

}

- (CGRect)p_safeAreaLayoutGuideLayoutFrame
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
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
  double v22;
  double v23;
  CGRect result;

  *(_QWORD *)&v3 = objc_opt_class(CRLScrollView, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost", v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "canvasView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "enclosingScrollView"));
  v9 = sub_100221D0C(v5, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "safeAreaLayoutGuide"));
  objc_msgSend(v11, "layoutFrame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v20 = v13;
  v21 = v15;
  v22 = v17;
  v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (void)clearLayoutsForTopLevelContainerChange
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layoutController](self, "layoutController"));
  objc_msgSend(v2, "i_removeAllLayouts");

}

- (id)topLevelZOrderedSiblingsOfInfos:(id)a3
{
  id v4;
  id v5;
  id v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  void *i;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  char isKindOfClass;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  void *v50;
  CRLInteractiveCanvasController *v51;
  id v52;
  id v53;
  id v54;
  uint64_t v55;
  void *j;
  void *v57;
  id v58;
  uint64_t v59;
  id v60;
  double v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  double v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  void *v73;
  id v74;
  CRLInteractiveCanvasController *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];

  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v87, v93, 16);
  if (v5)
  {
    v6 = v5;
    v75 = self;
    v77 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v88;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v88 != v8)
        objc_enumerationMutation(v4);
      v10 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "parentInfo"));
      v12 = v11 == 0;

      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "parentInfo"));
      v15 = v13;
      if (v77)
      {

        if ((void *)v77 != v15)
        {

          goto LABEL_23;
        }
      }
      else
      {
        objc_opt_class(NSObject, v14);
        v22 = sub_10022209C(v15, v16, 1, v17, v18, v19, v20, v21, (uint64_t)&OBJC_PROTOCOL___CRLContainerInfo);
        v77 = objc_claimAutoreleasedReturnValue(v22);

      }
      v7 |= v12;
      if (v6 == (id)++v9)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v87, v93, 16);
        if (v6)
          goto LABEL_3;

        if ((v7 & 1) == 0)
        {
          v67 = (void *)v77;
          goto LABEL_45;
        }
        if (!v77)
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_1012549E0);
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100E258D4();
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101254A00);
          v24 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100DE7468(v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController topLevelZOrderedSiblingsOfInfos:]"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v25, v26, 3832, 0, "If we're given any info without a parent, we should have been given at least one info with a parent, too.");

          v27 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));
          goto LABEL_49;
        }
LABEL_23:
        v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
        v83 = 0u;
        v84 = 0u;
        v85 = 0u;
        v86 = 0u;
        v74 = v4;
        v29 = v4;
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v83, v92, 16);
        if (v30)
        {
          v31 = v30;
          v32 = *(_QWORD *)v84;
          do
          {
            for (i = 0; i != v31; i = (char *)i + 1)
            {
              if (*(_QWORD *)v84 != v32)
                objc_enumerationMutation(v29);
              v34 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * (_QWORD)i);
              v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "parentInfo"));
              if (v35
                && (v36 = (void *)v35,
                    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "parentInfo")),
                    objc_opt_class(_TtC8Freeform20CRLRootContainerItem, v38),
                    isKindOfClass = objc_opt_isKindOfClass(v37, v39),
                    v37,
                    v36,
                    (isKindOfClass & 1) == 0))
              {
                v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "parentInfo"));
                objc_opt_class(NSObject, v42);
                v49 = sub_10022209C(v41, v43, 1, v44, v45, v46, v47, v48, (uint64_t)&OBJC_PROTOCOL___CRLContainerInfo);
                v50 = (void *)objc_claimAutoreleasedReturnValue(v49);

                objc_msgSend(v78, "crl_addNonNilObject:", v50);
              }
              else
              {
                objc_msgSend(v28, "addObject:", v34);
              }
            }
            v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v83, v92, 16);
          }
          while (v31);
        }

        objc_msgSend(v28, "unionSet:", v78);
        v51 = v75;
        v76 = v28;
        v73 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController topLevelZOrderedSiblingsOfInfos:](v51, "topLevelZOrderedSiblingsOfInfos:", v28));
        v27 = objc_msgSend(v73, "mutableCopy");
        v79 = 0u;
        v80 = 0u;
        v81 = 0u;
        v82 = 0u;
        v52 = v78;
        v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v79, v91, 16);
        if (v53)
        {
          v54 = v53;
          v55 = *(_QWORD *)v80;
          do
          {
            for (j = 0; j != v54; j = (char *)j + 1)
            {
              if (*(_QWORD *)v80 != v55)
                objc_enumerationMutation(v52);
              v57 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * (_QWORD)j);
              v58 = objc_msgSend(v27, "indexOfObject:", v57);
              if (v58 != (id)0x7FFFFFFFFFFFFFFFLL)
              {
                v60 = v58;
                *(_QWORD *)&v61 = objc_opt_class(NSArray, v59).n128_u64[0];
                v63 = v62;
                v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "childInfos", v61));
                v65 = sub_100221D0C(v63, v64);
                v66 = (void *)objc_claimAutoreleasedReturnValue(v65);

                objc_msgSend(v27, "replaceObjectsInRange:withObjectsFromArray:range:", v60, 1, v66, 0, objc_msgSend(v66, "count"));
              }
            }
            v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v79, v91, 16);
          }
          while (v54);
        }

        v4 = v74;
        v67 = (void *)v77;
        goto LABEL_46;
      }
    }
  }

  v67 = 0;
LABEL_45:
  *(_QWORD *)&v68 = objc_opt_class(NSArray, v23).n128_u64[0];
  v70 = v69;
  v52 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "childInfos", v68));
  v71 = sub_100221D0C(v70, v52);
  v27 = (id)objc_claimAutoreleasedReturnValue(v71);
LABEL_46:

  if (!v27)
    v27 = &__NSArray0__struct;

LABEL_49:
  return v27;
}

- (id)repsForInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layoutsForInfo:](self, "layoutsForInfo:", v4));
  v7 = v6;
  if (v6)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController repForLayout:](self, "repForLayout:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v11)));
          if (v12)
            objc_msgSend(v5, "addObject:", v12);

          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }
  }

  return v5;
}

- (id)repForInfo:(id)a3 createIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v4 = a4;
  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layoutForInfo:](self, "layoutForInfo:", v6));
  v8 = (void *)v7;
  if (!v7)
  {
    v8 = 0;
    if (v4)
    {
      -[CRLInteractiveCanvasController layoutIfNeeded](self, "layoutIfNeeded");
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layoutForInfo:](self, "layoutForInfo:", v6));
    }
  }
  v9 = !v4;
  if (v8)
    v10 = objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController repForLayout:](self, "repForLayout:", v8));
  else
    v10 = 0;
  if (v10)
    v11 = 1;
  else
    v11 = v9;
  if (v11)
    v12 = (void *)v10;
  else
    v12 = 0;
  if (v7 && (v11 & 1) == 0)
  {
    -[CRLInteractiveCanvasController layoutIfNeeded](self, "layoutIfNeeded");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController repForLayout:](self, "repForLayout:", v8));
  }
  if (!v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layoutsForInfo:](self, "layoutsForInfo:", v6));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allObjects"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v14));

    objc_msgSend(v15, "sortUsingSelector:", "orderedBefore:");
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "reverseObjectEnumerator", 0));
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v19)
            objc_enumerationMutation(v16);
          v21 = objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController repForLayout:](self, "repForLayout:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i)));
          if (v21)
          {
            v12 = (void *)v21;
            goto LABEL_27;
          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v18)
          continue;
        break;
      }
    }
    v12 = 0;
LABEL_27:

  }
  return v12;
}

- (id)repForInfo:(id)a3
{
  return -[CRLInteractiveCanvasController repForInfo:createIfNeeded:](self, "repForInfo:createIfNeeded:", a3, 0);
}

- (id)p_repForLayout:(id)a3 createIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  BOOL v8;

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvas repForLayout:](self->mCanvas, "repForLayout:", v6));
    if (v7)
      v8 = 1;
    else
      v8 = !v4;
    if (!v8)
    {
      -[CRLInteractiveCanvasController layoutIfNeeded](self, "layoutIfNeeded");
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvas repForLayout:](self->mCanvas, "repForLayout:", v6));
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)repForLayout:(id)a3
{
  return -[CRLInteractiveCanvasController p_repForLayout:createIfNeeded:](self, "p_repForLayout:createIfNeeded:", a3, 0);
}

- (id)renderableForRep:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController i_interactiveCanvasLayerHelper](self, "i_interactiveCanvasLayerHelper"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "renderableForRep:", v4));

  return v6;
}

- (id)containerRenderablesForRep:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController i_interactiveCanvasLayerHelper](self, "i_interactiveCanvasLayerHelper"));

  if (!v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254A20);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E25954();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254A40);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController containerRenderablesForRep:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 3976, 0, "invalid nil value for '%{public}s'", "self.i_interactiveCanvasLayerHelper");

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController i_interactiveCanvasLayerHelper](self, "i_interactiveCanvasLayerHelper"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "containerRenderablesForRep:", v4));

  return v10;
}

- (void)recreateAllLayoutsAndReps
{
  void *v3;
  void *v4;

  -[CRLInteractiveCanvasController endEditing](self, "endEditing");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor selectionPathWithInfos:](self->mCanvasEditor, "selectionPathWithInfos:", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editorController](self, "editorController"));
  objc_msgSend(v4, "setSelectionPath:", v3);

  -[CRLCanvas recreateAllLayoutsAndReps](self->mCanvas, "recreateAllLayoutsAndReps");
}

- (void)discardRepForClassChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parentRep"));
    v7 = v6;
    if (v6)
    {
      if (objc_msgSend(v6, "conformsToProtocol:", &OBJC_PROTOCOL___CRLCanvasMutableContainerRep))
      {
        objc_msgSend(v7, "removeChildRep:", v5);
      }
      else
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101254AA0);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E25A6C();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101254AC0);
        v10 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController discardRepForClassChange:]"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 4017, 0, "couldn't remove rep from parent");

      }
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvas](self, "canvas"));
    objc_msgSend(v13, "i_unregisterRep:", v5);

    -[CRLInteractiveCanvasController layoutInvalidated](self, "layoutInvalidated");
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254A60);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E259E0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254A80);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController discardRepForClassChange:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v9, 4007, 0, "invalid nil value for '%{public}s'", "rep");

  }
}

- (BOOL)allowedToEditMask
{
  return 1;
}

- (id)repsToHide
{
  NSMutableSet *v3;

  v3 = objc_opt_new(NSMutableSet);
  if (-[NSSet count](self->mRepsToHideForCurrentTracker, "count"))
    -[NSMutableSet unionSet:](v3, "unionSet:", self->mRepsToHideForCurrentTracker);
  return v3;
}

- (_TtC8Freeform24CRLMultiselectResizeInfo)multiselectResizeInfo
{
  return self->mMultiselectResizeInfo;
}

- (CGRect)visibleBoundsRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[CRLInteractiveCanvasController p_visibleBoundsRectUsingSizeOfEnclosingScrollView:respectObscuredFrame:respectSafeArea:respectObscuringRects:respectAreaPastScollViewLimit:](self, "p_visibleBoundsRectUsingSizeOfEnclosingScrollView:respectObscuredFrame:respectSafeArea:respectObscuringRects:respectAreaPastScollViewLimit:", 0, 1, 0, 1, 0);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)visibleBoundsRectUsingSizeOfEnclosingScrollView
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[CRLInteractiveCanvasController p_visibleBoundsRectUsingSizeOfEnclosingScrollView:respectObscuredFrame:respectSafeArea:respectObscuringRects:respectAreaPastScollViewLimit:](self, "p_visibleBoundsRectUsingSizeOfEnclosingScrollView:respectObscuredFrame:respectSafeArea:respectObscuringRects:respectAreaPastScollViewLimit:", 1, 1, 0, 0, 0);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)visibleBoundsRectIgnoringLimit
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[CRLInteractiveCanvasController p_visibleBoundsRectUsingSizeOfEnclosingScrollView:respectObscuredFrame:respectSafeArea:respectObscuringRects:respectAreaPastScollViewLimit:](self, "p_visibleBoundsRectUsingSizeOfEnclosingScrollView:respectObscuredFrame:respectSafeArea:respectObscuringRects:respectAreaPastScollViewLimit:", 0, 1, 0, 1, 1);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)p_visibleBoundsRectUsingSizeOfEnclosingScrollView:(BOOL)a3 respectObscuredFrame:(BOOL)a4 respectSafeArea:(BOOL)a5 respectObscuringRects:(BOOL)a6 respectAreaPastScollViewLimit:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double x;
  double v27;
  double y;
  double v29;
  double width;
  double v31;
  double height;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  id v40;
  Swift::String v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  void *v54;
  double v55;
  CGFloat v56;
  double v57;
  CGFloat v58;
  double v59;
  CGFloat v60;
  double v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  void *v79;
  double v80;
  double v81;
  double v82;
  double v83;
  Freeform::SyncEvent::FetchedRecordZoneChanges::Deletion v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect result;
  CGRect v92;
  CGRect v93;
  CGRect v94;

  v7 = a6;
  v8 = a5;
  *(_QWORD *)&v11 = objc_opt_class(CRLScrollView, a2).n128_u64[0];
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost", v11));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "canvasView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "enclosingScrollView"));
  v17 = sub_100221D0C(v13, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "canvasLayer"));

  if (!v20)
  {
    x = CGRectInfinite.origin.x;
    y = CGRectInfinite.origin.y;
    width = CGRectInfinite.size.width;
    height = CGRectInfinite.size.height;
    goto LABEL_15;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "canvasView"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "window"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "layer"));

  objc_msgSend(v20, "bounds");
  x = v25;
  y = v27;
  width = v29;
  height = v31;
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "layer"));
  if (a3 || (v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "window")), v34, !v34))
  {
    objc_msgSend(v33, "bounds");
    v40 = -[CRLInteractiveCanvasController p_sizeOfScrollViewEnclosingCanvasForVisibleCanvasCalculations](self, "p_sizeOfScrollViewEnclosingCanvasForVisibleCanvasCalculations");
    v84 = SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)v40, v41);
    v43 = v42;
    v45 = v44;
    v47 = v46;
    v49 = v48;
    if (!v8)
      goto LABEL_8;
    goto LABEL_7;
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "contentView"));
  if (v7)
    -[CRLInteractiveCanvasController unobscuredScrollViewFrame](self, "unobscuredScrollViewFrame");
  else
    -[CRLInteractiveCanvasController p_unobscuredScrollViewFrameIgnoringObscuringRectangles](self, "p_unobscuredScrollViewFrameIgnoringObscuringRectangles");
  v75 = v36;
  v76 = v37;
  v77 = v38;
  v78 = v39;
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "superview"));
  objc_msgSend(v35, "convertRect:fromView:", v79, v75, v76, v77, v78);
  v43 = v80;
  v45 = v81;
  v47 = v82;
  v49 = v83;

  if (v8)
  {
LABEL_7:
    -[CRLInteractiveCanvasController p_safeAreaLayoutGuideLayoutFrame](self, "p_safeAreaLayoutGuideLayoutFrame", v84.recordType._object);
    v92.origin.x = v50;
    v92.origin.y = v51;
    v92.size.width = v52;
    v92.size.height = v53;
    v85.origin.x = v43;
    v85.origin.y = v45;
    v85.size.width = v47;
    v85.size.height = v49;
    v86 = CGRectIntersection(v85, v92);
    v43 = v86.origin.x;
    v45 = v86.origin.y;
    v47 = v86.size.width;
    v49 = v86.size.height;
  }
LABEL_8:
  if (v33)
  {
    objc_msgSend(v33, "convertRect:fromLayer:", v20, x, y, width, height);
    v93.origin.x = v43;
    v93.origin.y = v45;
    v93.size.width = v47;
    v93.size.height = v49;
    v88 = CGRectIntersection(v87, v93);
    v54 = v33;
LABEL_13:
    objc_msgSend(v54, "convertRect:toLayer:", v20, v88.origin.x, v88.origin.y, v88.size.width, v88.size.height);
    x = v67;
    y = v68;
    width = v69;
    height = v70;
    goto LABEL_14;
  }
  if (v24)
  {
    objc_msgSend(v24, "convertRect:fromLayer:", v20, x, y, width, height);
    v56 = v55;
    v58 = v57;
    v60 = v59;
    v62 = v61;
    objc_msgSend(v24, "bounds");
    v94.origin.x = v63;
    v94.origin.y = v64;
    v94.size.width = v65;
    v94.size.height = v66;
    v89.origin.x = v56;
    v89.origin.y = v58;
    v89.size.width = v60;
    v89.size.height = v62;
    v88 = CGRectIntersection(v89, v94);
    v54 = v24;
    goto LABEL_13;
  }
LABEL_14:

LABEL_15:
  v90.origin.x = x;
  v90.origin.y = y;
  v90.size.width = width;
  v90.size.height = height;
  if (CGRectIsNull(v90))
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }

  v71 = x;
  v72 = y;
  v73 = width;
  v74 = height;
  result.size.height = v74;
  result.size.width = v73;
  result.origin.y = v72;
  result.origin.x = v71;
  return result;
}

- (CGRect)visibleBoundsRectForTiling
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect v7;
  CGRect result;

  if (self->mShouldLayoutOffscreenContentForZoomAnimation)
  {
    -[CRLInteractiveCanvasController convertUnscaledToBoundsRect:](self, "convertUnscaledToBoundsRect:", self->mPreviewVisibleUnscaledRectForTiling.origin.x, self->mPreviewVisibleUnscaledRectForTiling.origin.y, self->mPreviewVisibleUnscaledRectForTiling.size.width, self->mPreviewVisibleUnscaledRectForTiling.size.height);
  }
  else
  {
    -[CRLInteractiveCanvasController p_visibleBoundsRectForTiling](self, "p_visibleBoundsRectForTiling");
    if (CGRectIsNull(v7))
    {
      -[CRLInteractiveCanvasController p_calculateVisibleBoundsRectForTiling](self, "p_calculateVisibleBoundsRectForTiling");
      -[CRLInteractiveCanvasController setP_visibleBoundsRectForTiling:](self, "setP_visibleBoundsRectForTiling:");
    }
    -[CRLInteractiveCanvasController p_visibleBoundsRectForTiling](self, "p_visibleBoundsRectForTiling");
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)i_visibleBoundsRectForHitTestingCanvasView
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[CRLInteractiveCanvasController p_visibleBoundsRectUsingSizeOfEnclosingScrollView:respectObscuredFrame:respectSafeArea:respectObscuringRects:respectAreaPastScollViewLimit:](self, "p_visibleBoundsRectUsingSizeOfEnclosingScrollView:respectObscuredFrame:respectSafeArea:respectObscuringRects:respectAreaPastScollViewLimit:", 0, 1, 0, 0, 0);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)p_calculateVisibleBoundsRectForTiling
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[CRLInteractiveCanvasController p_visibleBoundsRectUsingSizeOfEnclosingScrollView:respectObscuredFrame:respectSafeArea:respectObscuringRects:respectAreaPastScollViewLimit:](self, "p_visibleBoundsRectUsingSizeOfEnclosingScrollView:respectObscuredFrame:respectSafeArea:respectObscuringRects:respectAreaPastScollViewLimit:", 1, 0, 0, 0, 0);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)visibleUnscaledRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect v7;
  CGRect result;

  -[CRLInteractiveCanvasController p_visibleUnscaledRect](self, "p_visibleUnscaledRect");
  if (CGRectIsNull(v7))
  {
    -[CRLInteractiveCanvasController p_calculateVisibleUnscaledRect](self, "p_calculateVisibleUnscaledRect");
    -[CRLInteractiveCanvasController setP_visibleUnscaledRect:](self, "setP_visibleUnscaledRect:");
  }
  -[CRLInteractiveCanvasController p_visibleUnscaledRect](self, "p_visibleUnscaledRect");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)visibleUnscaledRectIgnoringLimit
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[CRLInteractiveCanvasController visibleBoundsRectIgnoringLimit](self, "visibleBoundsRectIgnoringLimit");
  -[CRLInteractiveCanvasController convertBoundsToUnscaledRect:](self, "convertBoundsToUnscaledRect:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)p_calculateVisibleUnscaledRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[CRLInteractiveCanvasController visibleBoundsRect](self, "visibleBoundsRect");
  -[CRLInteractiveCanvasController convertBoundsToUnscaledRect:](self, "convertBoundsToUnscaledRect:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)allowAutoscroll
{
  return 1;
}

- (BOOL)allowNegativeAutoscroll
{
  return 1;
}

- (CGRect)convertUnscaledToBoundsRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;
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
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvas](self, "canvas"));
  objc_msgSend(v7, "convertUnscaledToBoundsRect:", x, y, width, height);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)convertBoundsToUnscaledRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;
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
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvas](self, "canvas"));
  objc_msgSend(v7, "convertBoundsToUnscaledRect:", x, y, width, height);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGPoint)convertUnscaledToBoundsPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvas](self, "canvas"));
  objc_msgSend(v5, "convertUnscaledToBoundsPoint:", x, y);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (CGPoint)convertBoundsToUnscaledPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvas](self, "canvas"));
  objc_msgSend(v5, "convertBoundsToUnscaledPoint:", x, y);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (CGSize)convertUnscaledToBoundsSize:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvas](self, "canvas"));
  objc_msgSend(v5, "convertUnscaledToBoundsSize:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)convertBoundsToUnscaledSize:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvas](self, "canvas"));
  objc_msgSend(v5, "convertBoundsToUnscaledSize:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGRect)growUnscaledCanvasLayerRect:(CGRect)a3 withViewScale:(double)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  void *v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  void *v30;
  char v31;
  double v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  unsigned int v41;
  double v42;
  uint64_t v43;
  double v44;
  uint64_t v45;
  double v46;
  double MinX;
  uint64_t v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect result;
  CGRect v69;
  CGRect v70;
  CGRect v71;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[CRLInteractiveCanvasController shouldCanvasScrollingSizeGrowToFitBoardContent](self, "shouldCanvasScrollingSizeGrowToFitBoardContent", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4))
  {
    if (!self->mHasCanvasEverLaidOut)
      -[CRLInteractiveCanvasController layoutIfNeeded](self, "layoutIfNeeded");
    -[CRLCanvas unscaledRectOfLayouts](self->mCanvas, "unscaledRectOfLayouts");
    v69 = CGRectInset(v55, -1194.0, -1194.0);
    v56.origin.x = x;
    v56.origin.y = y;
    v56.size.width = width;
    v56.size.height = height;
    v57 = CGRectUnion(v56, v69);
    v9 = v57.origin.x;
    v10 = v57.origin.y;
    v11 = v57.size.width;
    v12 = v57.size.height;
    if (-[CRLInteractiveCanvasController isInDynamicOperation](self, "isInDynamicOperation"))
    {
      v58.origin.x = v9;
      v58.origin.y = v10;
      v58.size.width = v11;
      v58.size.height = v12;
      v59 = CGRectUnion(v58, self->mUnscaledRectToGrowCanvasDuringDynamicOperation);
      v9 = v59.origin.x;
      v10 = v59.origin.y;
      v11 = v59.size.width;
      v12 = v59.size.height;
    }
    -[CRLInteractiveCanvasController visibleUnscaledRect](self, "visibleUnscaledRect");
    v70.origin.x = v13;
    v70.origin.y = v14;
    v70.size.width = v15;
    v70.size.height = v16;
    v60.origin.x = v9;
    v60.origin.y = v10;
    v60.size.width = v11;
    v60.size.height = v12;
    v61 = CGRectUnion(v60, v70);
    v17 = v61.origin.x;
    v18 = v61.origin.y;
    v19 = v61.size.width;
    v20 = v61.size.height;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
    objc_msgSend(v21, "rectToIncludeWhenGrowingCanvasToFitContent");
    v71.origin.x = v22;
    v71.origin.y = v23;
    v71.size.width = v24;
    v71.size.height = v25;
    v62.origin.x = v17;
    v62.origin.y = v18;
    v62.size.width = v19;
    v62.size.height = v20;
    v63 = CGRectUnion(v62, v71);
    v26 = v63.origin.x;
    v27 = v63.origin.y;
    v28 = v63.size.width;
    v29 = v63.size.height;

    v64.origin.x = v26;
    v64.origin.y = v27;
    v64.size.width = v28;
    v64.size.height = v29;
    v65 = CGRectUnion(v64, self->mRectToIncludeWhenGrowingCanvasToFitContent);
    x = v65.origin.x;
    y = v65.origin.y;
    width = v65.size.width;
    height = v65.size.height;
    if (-[CRLInteractiveCanvasController isInDynamicOperation](self, "isInDynamicOperation"))
    {
      self->mUnscaledRectToGrowCanvasDuringDynamicOperation.origin.x = x;
      self->mUnscaledRectToGrowCanvasDuringDynamicOperation.origin.y = y;
      self->mUnscaledRectToGrowCanvasDuringDynamicOperation.size.width = width;
      self->mUnscaledRectToGrowCanvasDuringDynamicOperation.size.height = height;
    }
    goto LABEL_21;
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvas](self, "canvas"));
  if ((objc_msgSend(v30, "isAnchoredAtRight") & 1) != 0)
  {

LABEL_12:
    if (!self->mDynamicallyZooming)
    {
      -[CRLInteractiveCanvasController visibleUnscaledRect](self, "visibleUnscaledRect");
      v33 = v32;
      v35 = v34;
      v37 = v36;
      v39 = v38;
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvas](self, "canvas"));
      v41 = objc_msgSend(v40, "isAnchoredAtRight");

      v42 = v33;
      v43 = v35;
      v44 = v37;
      v45 = v39;
      if (v41)
      {
        v46 = v37 - fmax(CGRectGetMaxX(*(CGRect *)&v42), 0.0);
      }
      else
      {
        MinX = CGRectGetMinX(*(CGRect *)&v42);
        if (MinX >= 0.0)
          MinX = -0.0;
        else
          v33 = 0.0;
        v46 = v37 + MinX;
      }
      v48 = 0;
      v49 = 1.0;
      v66.origin.x = x;
      v66.origin.y = y;
      v66.size.width = width;
      v66.size.height = height;
      v50 = v33;
      v67 = CGRectUnion(v66, *(CGRect *)(&v46 - 2));
      x = v67.origin.x;
      y = v67.origin.y;
      width = v67.size.width;
      height = v67.size.height;
    }
    goto LABEL_21;
  }
  if (!-[CRLInteractiveCanvasController resizeCanvasOnLayout](self, "resizeCanvasOnLayout"))
  {

    goto LABEL_21;
  }
  v31 = sub_1003A91F4();

  if ((v31 & 1) != 0)
    goto LABEL_12;
LABEL_21:
  v51 = x;
  v52 = y;
  v53 = width;
  v54 = height;
  result.size.height = v54;
  result.size.width = v53;
  result.origin.y = v52;
  result.origin.x = v51;
  return result;
}

- (BOOL)i_shouldAttemptToPreserveContentOffsetAfterFixFrame
{
  _BOOL4 v3;
  void *v4;
  unsigned __int8 v5;

  if (-[CRLInteractiveCanvasController shouldCanvasScrollingSizeGrowToFitBoardContent](self, "shouldCanvasScrollingSizeGrowToFitBoardContent"))
  {
    LOBYTE(v3) = !self->mDynamicallyZooming;
  }
  else
  {
    v3 = -[CRLInteractiveCanvasController resizeCanvasOnLayout](self, "resizeCanvasOnLayout");
    if (v3)
    {
      if ((sub_1003A91F4() & 1) != 0)
      {
        LOBYTE(v3) = 1;
      }
      else
      {
        v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvas](self, "canvas"));
        v5 = objc_msgSend(v4, "isAnchoredAtRight");

        LOBYTE(v3) = v5;
      }
    }
  }
  return v3;
}

- (id)unitFormatter
{
  NSFormatter *mUnitFormatter;
  void *v4;
  NSFormatter *v5;
  NSFormatter *v6;

  mUnitFormatter = self->mUnitFormatter;
  if (!mUnitFormatter)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRLRulerUnits instance](CRLRulerUnits, "instance"));
    v5 = (NSFormatter *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "formatter:lenient:", 0, 0));
    v6 = self->mUnitFormatter;
    self->mUnitFormatter = v5;

    mUnitFormatter = self->mUnitFormatter;
  }
  return mUnitFormatter;
}

- (id)numberFormatter
{
  NSNumberFormatter *mNumberFormatter;
  NSNumberFormatter *v4;
  NSNumberFormatter *v5;

  mNumberFormatter = self->mNumberFormatter;
  if (!mNumberFormatter)
  {
    v4 = (NSNumberFormatter *)objc_alloc_init((Class)NSNumberFormatter);
    v5 = self->mNumberFormatter;
    self->mNumberFormatter = v4;

    mNumberFormatter = self->mNumberFormatter;
  }
  return mNumberFormatter;
}

- (id)unitStringForPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  double v13;
  id v14;
  id v15;
  double v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CRLRulerUnits instance](CRLRulerUnits, "instance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController unitFormatter](self, "unitFormatter"));
  objc_msgSend(v6, "convertPointsToRulerUnits:", x);
  v9 = v8;
  objc_msgSend(v6, "convertPointsToRulerUnits:", y);
  v11 = v10;
  v12 = objc_alloc((Class)NSNumber);
  *(float *)&v13 = v9;
  v14 = objc_msgSend(v12, "initWithFloat:", v13);
  v15 = objc_alloc((Class)NSNumber);
  *(float *)&v16 = v11;
  v17 = objc_msgSend(v15, "initWithFloat:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringForObjectValue:", v14));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringForObjectValue:", v17));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("x: %@  y: %@"), 0, 0));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v21, v18, v19));

  return v22;
}

- (id)unitStringForSize:(CGSize)a3 forAccessibility:(BOOL)a4
{
  _BOOL4 v4;
  double height;
  double width;
  void *v8;
  void *v9;
  id v10;
  double v11;
  id v12;
  id v13;
  double v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;

  v4 = a4;
  height = a3.height;
  width = a3.width;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRLRulerUnits instance](CRLRulerUnits, "instance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController unitFormatter](self, "unitFormatter"));
  v10 = objc_alloc((Class)NSNumber);
  objc_msgSend(v8, "convertPointsToRulerUnits:", width);
  *(float *)&v11 = v11;
  v12 = objc_msgSend(v10, "initWithFloat:", v11);
  v13 = objc_alloc((Class)NSNumber);
  objc_msgSend(v8, "convertPointsToRulerUnits:", height);
  *(float *)&v14 = v14;
  v15 = objc_msgSend(v13, "initWithFloat:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForObjectValue:", v12));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForObjectValue:", v15));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v19 = v18;
  if (v4)
    v20 = CFSTR("width %@, height %@");
  else
    v20 = CFSTR("w: %@  h: %@");
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", v20, 0, 0));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v21, v16, v17));

  return v22;
}

- (id)unitStringForNumber:(double)a3
{
  void *v5;
  void *v6;
  id v7;
  double v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CRLRulerUnits instance](CRLRulerUnits, "instance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController unitFormatter](self, "unitFormatter"));
  v7 = objc_alloc((Class)NSNumber);
  objc_msgSend(v5, "convertPointsToRulerUnits:", a3);
  *(float *)&v8 = v8;
  v9 = objc_msgSend(v7, "initWithFloat:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringForObjectValue:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("%@"), 0, 0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v12, v10));

  return v13;
}

- (id)unitStringForAngle:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController numberFormatter](self, "numberFormatter"));
  objc_msgSend(v4, "setMaximumFractionDigits:", 1);
  objc_msgSend(v4, "setPositiveFormat:", CFSTR("##0.#"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("%@°"), 0, 0));
  sub_1000618C4(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringFromNumber:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v8));

  return v9;
}

- (id)unitStringForAngle:(double)a3 shouldNormalize:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (a4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController unitStringForAngle:](self, "unitStringForAngle:", a3));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController numberFormatter](self, "numberFormatter"));
    objc_msgSend(v6, "setMaximumFractionDigits:", 1);
    objc_msgSend(v6, "setPositiveFormat:", CFSTR("##0.#"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("%@°"), 0, 0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringFromNumber:", v9));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, v10));

  }
  return v5;
}

- (id)unitStringForAngle:(double)a3 andLength:(double)a4
{
  void *v7;
  void *v8;
  id v9;
  double v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CRLRulerUnits instance](CRLRulerUnits, "instance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController unitFormatter](self, "unitFormatter"));
  v9 = objc_alloc((Class)NSNumber);
  objc_msgSend(v7, "convertPointsToRulerUnits:", a4);
  *(float *)&v10 = v10;
  v11 = objc_msgSend(v9, "initWithFloat:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForObjectValue:", v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("%@  l: %@"), 0, 0));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController unitStringForAngle:](self, "unitStringForAngle:", a3));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v14, v15, v12));

  return v16;
}

- (CRLCanvasContainerRep)topLevelContainerRepForEditing
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController topLevelContainerInfoForEditing](self, "topLevelContainerInfoForEditing"));
  objc_opt_class(NSObject, v4);
  v11 = sub_1002220C8(v3, v5, 1, v6, v7, v8, v9, v10, (uint64_t)&OBJC_PROTOCOL___CRLCanvasElementInfo);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController repForInfo:](self, "repForInfo:", v12));
    objc_opt_class(CRLCanvasRep, v14);
    v21 = sub_10022209C(v13, v15, 1, v16, v17, v18, v19, v20, (uint64_t)&OBJC_PROTOCOL___CRLCanvasContainerRep);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

  }
  else
  {
    v22 = 0;
  }

  return (CRLCanvasContainerRep *)v22;
}

- (CRLContainerInfo)topLevelContainerInfoForEditing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController selectionModelTranslator](self, "selectionModelTranslator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editorController](self, "editorController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectionPath"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "containerToInsertIntoForSelectionPath:", v5));

  if (v6)
  {
    objc_opt_class(_TtC8Freeform12CRLGroupItem, v7);
    v9 = sub_100221D0C(v8, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }
  else
  {
    v10 = 0;
  }

  return (CRLContainerInfo *)v10;
}

- (NSArray)topLevelRepsForHitTesting
{
  unsigned int v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v3 = -[CRLInteractiveCanvasController hasSelectedInfosInMultipleContainers](self, "hasSelectedInfosInMultipleContainers");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController freehandDrawingToolkit](self, "freehandDrawingToolkit"));
  v5 = objc_msgSend(v4, "isInDrawingMode");

  if ((v5 & 1) != 0 || v3)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvas allRepsOrdered](self->mCanvas, "allRepsOrdered"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "crl_arrayOfObjectsPassingTest:", &stru_101254AE0));

    return (NSArray *)v17;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController topLevelContainerRepForEditing](self, "topLevelContainerRepForEditing"));
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "childReps", 0));
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v20 != v11)
              objc_enumerationMutation(v8);
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i), "info"));
            v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController repsForInfo:](self, "repsForInfo:", v13));
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "allObjects"));
            objc_msgSend(v7, "addObjectsFromArray:", v15);

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v10);
      }

    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvas topLevelReps](self->mCanvas, "topLevelReps"));
    }

    return (NSArray *)v7;
  }
}

+ (double)smallRepOutsetForHitTestingWithPrecision:(BOOL)a3
{
  double result;

  result = 20.0;
  if (a3)
    return 2.0;
  return result;
}

- (id)hitRep:(CGPoint)a3 withPrecision:(BOOL)a4 passingTest:(id)a5
{
  _BOOL8 v5;
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  id v14;
  double v15;
  void *v16;

  v5 = a4;
  y = a3.y;
  x = a3.x;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvas](self, "canvas"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController topLevelRepsForHitTesting](self, "topLevelRepsForHitTesting"));
  *(_QWORD *)&v13 = objc_opt_class(self, v12).n128_u64[0];
  objc_msgSend(v14, "smallRepOutsetForHitTestingWithPrecision:", v5, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "hitRep:withPrecision:inTopLevelReps:smallRepOutset:unscaledPointTransformForRep:passingTest:", v5, v11, 0, v9, x, y, v15));

  return v16;
}

- (id)hitRep:(CGPoint)a3 passingTest:(id)a4
{
  return -[CRLInteractiveCanvasController hitRep:withPrecision:passingTest:](self, "hitRep:withPrecision:passingTest:", 0, a4, a3.x, a3.y);
}

- (id)hitRep:(CGPoint)a3 withPrecision:(BOOL)a4
{
  return -[CRLInteractiveCanvasController hitRep:withPrecision:passingTest:](self, "hitRep:withPrecision:passingTest:", a4, 0, a3.x, a3.y);
}

- (id)hitRep:(CGPoint)a3
{
  return -[CRLInteractiveCanvasController hitRep:withPrecision:](self, "hitRep:withPrecision:", 0, a3.x, a3.y);
}

- (id)hitRepIgnoringClickThrough:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v6;
  id v7;
  _QWORD v9[8];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  y = a3.y;
  x = a3.x;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_10035BEDC;
  v14 = sub_10035BEEC;
  v15 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvas](self, "canvas"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10035BEF4;
  v9[3] = &unk_1012348A0;
  v9[4] = self;
  v9[5] = &v10;
  *(CGFloat *)&v9[6] = x;
  *(CGFloat *)&v9[7] = y;
  objc_msgSend(v6, "i_performBlockWhileIgnoringClickThrough:", v9);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (id)hitRepsAtPoint:(CGPoint)a3 withSlop:(CGSize)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  y = a3.y;
  x = a3.x;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvas topLevelReps](self->mCanvas, "topLevelReps", 0));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v13, "convertNaturalPointFromUnscaledCanvas:", x, y);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "hitReps:withSlop:"));
        if (v14)
          objc_msgSend(v7, "addObjectsFromArray:", v14);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  return v7;
}

- (void)p_recursiveHitKnobAtPoint:(CGPoint)a3 inputType:(int64_t)a4 inRep:(id)a5 minDistance:(double *)a6 hitKnob:(id *)a7 hitRep:(id *)a8
{
  double y;
  double x;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  unsigned int v22;
  double v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *i;
  id v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  double v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];

  y = a3.y;
  x = a3.x;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v32 = a5;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "knobs"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "reverseObjectEnumerator"));

  obj = v15;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v40;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v40 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)v19);
        v38 = 0.0;
        if (!*a7 || !objc_msgSend(v20, "overlapsWithKnob:"))
        {
          if ((objc_msgSend(v20, "isHitByUnscaledPoint:inputType:returningDistance:", a4, &v38, x, y) & 1) == 0)
            goto LABEL_14;
LABEL_12:
          v23 = v38;
          if (v38 >= *a6)
            goto LABEL_14;
LABEL_13:
          *a6 = v23;
          v24 = objc_retainAutorelease(v20);
          *a7 = v24;
          *a8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "rep"));
          goto LABEL_14;
        }
        v21 = objc_msgSend(*a7, "obscuresKnob:", v20);
        v22 = objc_msgSend(v20, "obscuresKnob:", *a7);
        if ((objc_msgSend(v20, "isHitByUnscaledPoint:inputType:returningDistance:", a4, &v38, x, y) & 1) == 0)
          goto LABEL_14;
        if (v22)
        {
          v23 = v38;
          goto LABEL_13;
        }
        if ((v21 & 1) == 0)
          goto LABEL_12;
LABEL_14:
        v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16, v23);
      v17 = v25;
    }
    while (v25);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "childReps"));
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v28; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v29)
          objc_enumerationMutation(v26);
        -[CRLInteractiveCanvasController p_recursiveHitKnobAtPoint:inputType:inRep:minDistance:hitKnob:hitRep:](self, "p_recursiveHitKnobAtPoint:inputType:inRep:minDistance:hitKnob:hitRep:", a4, *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i), a6, a7, a8, x, y);
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    }
    while (v28);
  }

}

- (id)hitKnobAtPoint:(CGPoint)a3 inputType:(int64_t)a4 returningRep:(id *)a5
{
  double y;
  double x;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  _BYTE v28[128];

  y = a3.y;
  x = a3.x;
  v27 = 0x47EFFFFFE0000000;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvas topLevelReps](self->mCanvas, "topLevelReps"));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = 0;
    v14 = *(_QWORD *)v24;
    do
    {
      v15 = 0;
      v16 = v12;
      v17 = v13;
      do
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v9);
        v18 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v15);
        v21 = v16;
        v22 = v17;
        -[CRLInteractiveCanvasController p_recursiveHitKnobAtPoint:inputType:inRep:minDistance:hitKnob:hitRep:](self, "p_recursiveHitKnobAtPoint:inputType:inRep:minDistance:hitKnob:hitRep:", a4, v18, &v27, &v22, &v21, x, y);
        v13 = v22;

        v12 = v21;
        v15 = (char *)v15 + 1;
        v16 = v12;
        v17 = v13;
      }
      while (v11 != v15);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v11);
  }
  else
  {
    v12 = 0;
    v13 = 0;
  }

  if (a5)
    *a5 = objc_retainAutorelease(v12);

  return v13;
}

- (CRLCanvasLayoutController)layoutController
{
  return -[CRLCanvas layoutController](self->mCanvas, "layoutController");
}

- (id)validatedLayoutForInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layoutController](self, "layoutController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "validatedLayoutForInfo:", v4));

  return v6;
}

- (id)layoutsForInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layoutController](self, "layoutController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layoutsForInfo:", v4));

  return v6;
}

- (id)layoutsForSelectionPath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v23;
  id obj;
  uint64_t v25;
  CRLInteractiveCanvasController *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];

  v4 = a3;
  v26 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController infosForSelectionPath:](self, "infosForSelectionPath:", v4));
  if (objc_msgSend(v5, "count"))
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v23 = v5;
    obj = v5;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v25 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v32 != v25)
            objc_enumerationMutation(obj);
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layoutsForInfo:](v26, "layoutsForInfo:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i), v23));
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", objc_msgSend(v10, "count")));
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          v30 = 0u;
          v12 = v10;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v28;
            do
            {
              for (j = 0; j != v14; j = (char *)j + 1)
              {
                if (*(_QWORD *)v28 != v15)
                  objc_enumerationMutation(v12);
                v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)j), "layoutForSelectionPath:", v4));
                if (v17)
                  objc_msgSend(v11, "addObject:", v17);

              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
            }
            while (v14);
          }

          if (objc_msgSend(v11, "count"))
          {
            if (!v8)
              v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
            objc_msgSend(v8, "unionSet:", v11);
          }

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v7);
    }
    else
    {
      v8 = 0;
    }

    v5 = v23;
  }
  else
  {
    v8 = 0;
  }
  v18 = objc_msgSend(v8, "copy", v23);
  v19 = v18;
  if (v18)
    v20 = v18;
  else
    v20 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  v21 = v20;

  return v21;
}

- (id)layoutForInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layoutController](self, "layoutController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layoutForInfo:", v4));

  return v6;
}

- (id)layoutForSelectionPath:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layoutsForSelectionPath:](self, "layoutsForSelectionPath:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "anyObject"));

  return v4;
}

- (id)layoutsForInfo:(id)a3 intersectingSelectionPath:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layoutsForInfo:](self, "layoutsForInfo:", a3));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10035C970;
  v11[3] = &unk_101254B08;
  v12 = v6;
  v8 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectsPassingTest:", v11));

  return v9;
}

- (id)layoutForInfoNearestVisibleRect:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  void *i;
  void *v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  double v33;
  id v34;
  double v36;
  double v37;
  double v38;
  double v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layoutsForInfo:](self, "layoutsForInfo:", v4));
  -[CRLInteractiveCanvasController visibleUnscaledRect](self, "visibleUnscaledRect");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v14 = v5;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v15)
  {
    v16 = v15;
    v36 = v11;
    v37 = v9;
    v17 = 0;
    v18 = *(_QWORD *)v41;
    v39 = INFINITY;
    v38 = v7;
    v20 = v11;
    v19 = v9;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v41 != v18)
          objc_enumerationMutation(v14);
        v22 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v22, "frameInRoot", *(_QWORD *)&v36, *(_QWORD *)&v37);
        -[CRLInteractiveCanvasController outsetSelectionRect:](self, "outsetSelectionRect:");
        v24 = v23;
        v26 = v25;
        v28 = v27;
        v30 = v29;
        v31 = sub_1000612CC(v23, v25, v27, v29, v7, v19, v20, v13);
        if (v31 == 0.0)
        {
          sub_10006145C(v24, v26, v28, v30, v7, v19, v20, v13);
          v33 = -v32;
        }
        else
        {
          v33 = v31;
        }
        if (v33 < v39)
        {
          v34 = v22;

          v17 = v34;
          v39 = v33;
        }
        v7 = v38;
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v16);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)layoutForInfoNearestVisibleRect:(id)a3 intersectingSelectionPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  double v22;
  void *i;
  void *v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  double v33;
  double v34;
  double v35;
  id v36;
  double v38;
  double v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  CGRect v45;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layoutsForInfo:intersectingSelectionPath:](self, "layoutsForInfo:intersectingSelectionPath:", v6, v7));
  -[CRLInteractiveCanvasController visibleUnscaledRect](self, "visibleUnscaledRect");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v17 = v8;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v18)
  {
    v19 = v18;
    v38 = v12;
    v39 = v10;
    v20 = 0;
    v21 = *(_QWORD *)v41;
    v22 = INFINITY;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(_QWORD *)v41 != v21)
          objc_enumerationMutation(v17);
        v24 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v24, "rectInRootForSelectionPath:", v7);
        -[CRLInteractiveCanvasController outsetSelectionRect:](self, "outsetSelectionRect:");
        v26 = v25;
        v28 = v27;
        v30 = v29;
        v32 = v31;
        v33 = sub_1000612CC(v25, v27, v29, v31, v10, v38, v14, v16);
        if (v33 == 0.0)
        {
          sub_10006145C(v26, v28, v30, v32, v10, v38, v14, v16);
          v35 = -v34;
        }
        else
        {
          v35 = v33;
        }
        v45.origin.x = v26;
        v45.origin.y = v28;
        v45.size.width = v30;
        v45.size.height = v32;
        if (!CGRectIsNull(v45) && v35 < v22)
        {
          v36 = v24;

          v20 = v36;
          v22 = v35;
        }
        v10 = v39;
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v19);
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)parentForFreehandDrawingLayoutsAtPoint:(CGPoint)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layoutController](self, "layoutController", a3.x, a3.y));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rootLayout"));

  return v4;
}

- (id)mostVisibleParentForFreehandDrawingLayouts
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;

  -[CRLInteractiveCanvasController visibleUnscaledRect](self, "visibleUnscaledRect");
  return -[CRLInteractiveCanvasController parentForFreehandDrawingLayoutsAtPoint:](self, "parentForFreehandDrawingLayoutsAtPoint:", sub_100061400(v3, v4, v5, v6));
}

- (void)setShouldSuppressFreehandContent:(BOOL)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  self->_shouldSuppressFreehandContent = a3;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvas topLevelReps](self->mCanvas, "topLevelReps", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i), "recursivelyPerformSelectorIfImplemented:", "suppressionOfFreehandContentDidChange");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)layoutIfNeeded
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "canvasLayer"));
  v5 = objc_msgSend(v4, "isLayoutDisabled");

  if ((v5 & 1) == 0)
    -[CRLCanvas i_layoutIfNeeded](self->mCanvas, "i_layoutIfNeeded");
}

- (void)performBlockOnMainThreadAfterLayoutIfNecessary:(id)a3
{
  id v4;
  void *v5;
  __CFRunLoop *Main;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  CRLInteractiveCanvasController *v10;
  id v11;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v8 = sub_10035D0B0;
    v9 = &unk_101231F00;
    v10 = self;
    v11 = v4;
    if (+[NSThread isMainThread](NSThread, "isMainThread", _NSConcreteStackBlock, 3221225472))
    {
      v8((uint64_t)&v7);
    }
    else
    {
      Main = CFRunLoopGetMain();
      CFRunLoopPerformBlock(Main, kCFRunLoopDefaultMode, &v7);
      CFRunLoopWakeUp(Main);
    }

  }
}

- (CALayer)repContainerLayer
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController i_interactiveCanvasLayerHelper](self, "i_interactiveCanvasLayerHelper"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "repContainerLayer"));

  return (CALayer *)v3;
}

- (NSArray)additionalLayersUnderRepLayers
{
  return 0;
}

- (BOOL)shouldEverShowPathHighlightOnInvisibleShapes
{
  return 1;
}

- (BOOL)shouldShowPathHighlightOnUnselectedInvisibleShapes
{
  return 0;
}

- (CALayer)overlayLayer
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController i_interactiveCanvasLayerHelper](self, "i_interactiveCanvasLayerHelper"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "overlayLayer"));

  return (CALayer *)v3;
}

- (void)setOverlayLayerSuppressed:(BOOL)a3
{
  id WeakRetained;
  void *v5;

  if (self->mOverlayLayerSuppressed != a3)
  {
    self->mOverlayLayerSuppressed = a3;
    if (a3)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->mLayerHost);
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "imageHUDController"));
      objc_msgSend(v5, "closeHUDWithAnimation:", 0);

    }
    -[CRLInteractiveCanvasController layoutInvalidated](self, "layoutInvalidated");
  }
}

- (void)closeOverlays
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->mLayerHost);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "imageHUDController"));
  objc_msgSend(v4, "closeHUDWithAnimation:", 1);

  -[CRLInteractiveCanvasController layoutInvalidated](self, "layoutInvalidated");
}

- (void)addDecorator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (v4)
  {
    if ((-[NSMutableArray containsObject:](self->mDecorators, "containsObject:", v4) & 1) == 0)
    {
      -[NSMutableArray addObject:](self->mDecorators, "addObject:", v4);
      -[CRLInteractiveCanvasController invalidateLayersForDecorator:](self, "invalidateLayersForDecorator:", v4);
    }
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254B28);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E25AEC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254B48);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController addDecorator:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 4804, 0, "invalid nil value for '%{public}s'", "decorator");

  }
}

- (void)removeDecorator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (v4)
  {
    if (-[NSMutableArray containsObject:](self->mDecorators, "containsObject:", v4))
    {
      -[NSMutableArray removeObject:](self->mDecorators, "removeObject:", v4);
      -[CRLInteractiveCanvasController invalidateLayersForDecorator:](self, "invalidateLayersForDecorator:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController i_interactiveCanvasLayerHelper](self, "i_interactiveCanvasLayerHelper"));
      objc_msgSend(v5, "decoratorWasRemoved:", v4);

    }
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254B68);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E25B78();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254B88);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController removeDecorator:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 4815, 0, "invalid nil value for '%{public}s'", "decorator");

  }
}

- (NSArray)i_decorators
{
  return (NSArray *)-[NSMutableArray copy](self->mDecorators, "copy");
}

- (id)p_repsForCollaboratorCursorSelectionPath:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *j;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];

  v4 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  if (v4)
  {
    *(_QWORD *)&v7 = objc_opt_class(_TtC8Freeform21CRLBoardItemSelection, v5).n128_u64[0];
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mostSpecificSelectionOfClass:", v8, v7));
    if ((uint64_t)objc_msgSend(v9, "itemCount") < 2)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layoutsForSelectionPath:](self, "layoutsForSelectionPath:", v4));
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v16 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(_QWORD *)v24 != v18)
              objc_enumerationMutation(v10);
            v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController repForLayout:](self, "repForLayout:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i)));
            if (v20)
              objc_msgSend(v6, "addObject:", v20);

          }
          v17 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        }
        while (v17);
      }
    }
    else
    {
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "boardItems"));
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v28;
        do
        {
          for (j = 0; j != v12; j = (char *)j + 1)
          {
            if (*(_QWORD *)v28 != v13)
              objc_enumerationMutation(v10);
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController repsForInfo:](self, "repsForInfo:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)j)));
            objc_msgSend(v6, "unionSet:", v15);

          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        }
        while (v12);
      }
    }

  }
  v21 = objc_msgSend(v6, "copy");

  return v21;
}

- (id)i_collaboratorPresenceSelectingLayout:(id)a3
{
  void *v4;
  uint64_t v5;
  _UNKNOWN **v6;
  void *i;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  CRLInteractiveCanvasController *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  void *v21;
  unsigned int v22;
  void *v23;
  id v25;
  id obj;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  v27 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController collaboratorCursorDelegate](self, "collaboratorCursorDelegate"));
  v25 = objc_alloc_init((Class)NSMutableSet);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController currentCollaboratorPresences](self, "currentCollaboratorPresences"));
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v28)
  {
    v5 = *(_QWORD *)v30;
    v6 = &off_1013AC000;
    do
    {
      for (i = 0; i != v28; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v5)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collaboratorCursorSelectionPathForRenderer:collaboratorPresence:", self, v8));
        *(_QWORD *)&v11 = objc_opt_class(v6 + 172, v10).n128_u64[0];
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mostSpecificSelectionOfClass:", v12, v11));
        v14 = v13;
        if (v9)
        {
          if ((uint64_t)objc_msgSend(v13, "itemCount") < 2)
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layoutsForSelectionPath:](self, "layoutsForSelectionPath:", v9));
            v22 = objc_msgSend(v21, "containsObject:", v27);

            if (!v22)
              goto LABEL_12;
LABEL_11:
            objc_msgSend(v25, "addObject:", v8);
            goto LABEL_12;
          }
          v15 = v5;
          v16 = self;
          v17 = v4;
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "boardItems"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "info"));
          v20 = objc_msgSend(v18, "containsObject:", v19);

          v4 = v17;
          self = v16;
          v5 = v15;
          v6 = &off_1013AC000;
          if ((v20 & 1) != 0)
            goto LABEL_11;
        }
LABEL_12:

      }
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v28);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController p_topCollaboratorPresenceOfPresences:](self, "p_topCollaboratorPresenceOfPresences:", v25));
  return v23;
}

- (id)p_topCollaboratorPresenceOfPresences:(id)a3
{
  id v4;
  void *v5;
  void *v6;
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
  void *v18;
  unsigned __int8 v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "count") > 1)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController i_decorators](self, "i_decorators", 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "reverseObjectEnumerator"));

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
    {
      v10 = v8;
      v11 = *(_QWORD *)v22;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v12);
          objc_opt_class(CRLCollaboratorCursorHUDController, v9);
          v15 = sub_100221D0C(v14, v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
          v17 = v16;
          if (v16)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "collaboratorPresence"));
            v19 = objc_msgSend(v4, "containsObject:", v18);

            if ((v19 & 1) != 0)
            {
              v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "collaboratorPresence"));

              goto LABEL_14;
            }
          }

          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v10)
          continue;
        break;
      }
    }

    v5 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "anyObject"));
  }
LABEL_14:

  return v5;
}

- (BOOL)i_shouldShowCollaboratorCursorForLayout:(id)a3
{
  void *v4;
  BOOL v5;

  if (self->mLayoutsShowingCollabCursorsDuringLayerUpdate)
    return -[NSSet containsObject:](self->mLayoutsShowingCollabCursorsDuringLayerUpdate, "containsObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController i_collaboratorPresenceSelectingLayout:](self, "i_collaboratorPresenceSelectingLayout:", a3));
  v5 = v4 != 0;

  return v5;
}

- (void)p_performBlockWithCachedLayoutsForCollaboratorCursors:(id)a3
{
  void (**v4)(void);

  v4 = (void (**)(void))a3;
  -[CRLInteractiveCanvasController p_beginCachingLayoutsForCollaboratorCursors](self, "p_beginCachingLayoutsForCollaboratorCursors");
  if (v4)
    v4[2]();
  -[CRLInteractiveCanvasController p_endCachingLayoutsForCollaboratorCursors](self, "p_endCachingLayoutsForCollaboratorCursors");

}

- (void)p_beginCachingLayoutsForCollaboratorCursors
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _UNKNOWN **v7;
  void *i;
  void *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *j;
  void *v20;
  NSSet *v21;
  NSSet *mLayoutsShowingCollabCursorsDuringLayerUpdate;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController collaboratorCursorDelegate](self, "collaboratorCursorDelegate"));
  if ((objc_opt_respondsToSelector(v4, "collaboratorCursorSelectionPathForRenderer:collaboratorPresence:") & 1) != 0)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController currentCollaboratorPresences](self, "currentCollaboratorPresences"));
    v26 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v26)
    {
      v6 = *(_QWORD *)v32;
      v7 = &off_1013AC000;
      v24 = v5;
      v25 = v4;
      v23 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(_QWORD *)v32 != v6)
            objc_enumerationMutation(v5);
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collaboratorCursorSelectionPathForRenderer:collaboratorPresence:", self, *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i), v23, v24, v25));
          *(_QWORD *)&v11 = objc_opt_class(v7 + 172, v10).n128_u64[0];
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mostSpecificSelectionOfClass:", v12, v11));
          v14 = v13;
          if (v9)
          {
            if ((uint64_t)objc_msgSend(v13, "itemCount") < 2)
            {
              v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layoutsForSelectionPath:](self, "layoutsForSelectionPath:", v9));
              objc_msgSend(v3, "unionSet:", v15);
            }
            else
            {
              v29 = 0u;
              v30 = 0u;
              v27 = 0u;
              v28 = 0u;
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "boardItems"));
              v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
              if (v16)
              {
                v17 = v16;
                v18 = *(_QWORD *)v28;
                do
                {
                  for (j = 0; j != v17; j = (char *)j + 1)
                  {
                    if (*(_QWORD *)v28 != v18)
                      objc_enumerationMutation(v15);
                    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layoutsForInfo:](self, "layoutsForInfo:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)j)));
                    objc_msgSend(v3, "unionSet:", v20);

                  }
                  v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
                }
                while (v17);
                v5 = v24;
                v4 = v25;
                v6 = v23;
              }
              v7 = &off_1013AC000;
            }

          }
        }
        v26 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v26);
    }

  }
  v21 = (NSSet *)objc_msgSend(v3, "copy");
  mLayoutsShowingCollabCursorsDuringLayerUpdate = self->mLayoutsShowingCollabCursorsDuringLayerUpdate;
  self->mLayoutsShowingCollabCursorsDuringLayerUpdate = v21;

}

- (void)p_endCachingLayoutsForCollaboratorCursors
{
  NSSet *mLayoutsShowingCollabCursorsDuringLayerUpdate;

  mLayoutsShowingCollabCursorsDuringLayerUpdate = self->mLayoutsShowingCollabCursorsDuringLayerUpdate;
  self->mLayoutsShowingCollabCursorsDuringLayerUpdate = 0;

}

- (void)collaboratorCursorSelectionPathChangedFromSelectionPath:(id)a3 toSelectionPath:(id)a4 collaboratorPresence:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableSet *v11;
  NSMutableSet *mCurrentCollaboratorPresences;
  NSMutableSet *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!self->mCurrentCollaboratorPresences)
  {
    v11 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    mCurrentCollaboratorPresences = self->mCurrentCollaboratorPresences;
    self->mCurrentCollaboratorPresences = v11;

  }
  v13 = self->mCurrentCollaboratorPresences;
  if (v9)
  {
    -[NSMutableSet addObject:](v13, "addObject:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController collaboratorCursorDelegate](self, "collaboratorCursorDelegate"));

    if (!v14)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101254BA8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E25C04();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101254BC8);
      v15 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController collaboratorCursorSelectionPathChangedFromSelectionPath:toSelectionPath:collaboratorPresence:]"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 4952, 0, "invalid nil value for '%{public}s'", "self.collaboratorCursorDelegate");

    }
  }
  else
  {
    -[NSMutableSet removeObject:](v13, "removeObject:", v10);
  }
  self->mCollaboratorCursorsInvalidated = 1;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKeyedSubscript:](self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary, "objectForKeyedSubscript:", v10));
  if (v18)
    -[CRLInteractiveCanvasController invalidateLayersForDecorator:](self, "invalidateLayersForDecorator:", v18);
  else
    -[CRLCanvas i_setLayersInvalidWithoutInvalidatingAnySpecificLayers](self->mCanvas, "i_setLayersInvalidWithoutInvalidatingAnySpecificLayers");

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvas](self, "canvas"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10035E2B8;
  v23[3] = &unk_10124CAD8;
  v23[4] = self;
  v24 = v10;
  v25 = v9;
  v26 = v8;
  v20 = v8;
  v21 = v9;
  v22 = v10;
  objc_msgSend(v19, "performBlockAfterLayoutIfNecessary:", v23);

}

- (NSSet)currentCollaboratorPresences
{
  return (NSSet *)self->mCurrentCollaboratorPresences;
}

- (BOOL)p_followEnabled
{
  return +[CRLFeatureFlagGroup isFollowEnabled](_TtC8Freeform19CRLFeatureFlagGroup, "isFollowEnabled");
}

- (void)scrollToCollaborator:(id)a3 withSelectionPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  unsigned int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  dispatch_time_t v31;
  _QWORD block[5];
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];

  v6 = a3;
  v7 = a4;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254C50);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E25D38();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254C70);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController scrollToCollaborator:withSelectionPath:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 5034, 0, "This operation must only be performed on the main thread.");

  }
  if (!-[CRLInteractiveCanvasController p_followEnabled](self, "p_followEnabled"))
    goto LABEL_23;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editingCoordinator](self, "editingCoordinator"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "followCoordinator"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "followingParticipant"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "presences"));
  v15 = objc_msgSend(v14, "containsObject:", v6);

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editingCoordinator](self, "editingCoordinator"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "followCoordinator"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "participantsFollowingLocalParticipant"));

  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v36;
    while (2)
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(_QWORD *)v36 != v21)
          objc_enumerationMutation(v18);
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i), "presences"));
        v24 = objc_msgSend(v23, "containsObject:", v6);

        if (v24)
        {

          goto LABEL_25;
        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v20)
        continue;
      break;
    }
  }

  if ((v15 & 1) == 0)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editingCoordinator](self, "editingCoordinator"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "followCoordinator"));
    objc_msgSend(v26, "endFollowSessionForLocalParticipantWithShouldShowRefollowPlacard:", 1);

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "presenceUUID"));
    LODWORD(v26) = -[CRLInteractiveCanvasController sendViewportRequestMessageTo:](self, "sendViewportRequestMessageTo:", v27);

    if ((_DWORD)v26)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editingCoordinator](self, "editingCoordinator"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "followCoordinator"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "presenceUUID"));
      objc_msgSend(v29, "setExpectingViewportForOneTimeScrollFrom:", v30);

      v31 = dispatch_time(0, 500000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10035EC54;
      block[3] = &unk_10122D3B0;
      block[4] = self;
      v33 = v6;
      v34 = v7;
      dispatch_after(v31, (dispatch_queue_t)&_dispatch_main_q, block);

      goto LABEL_25;
    }
LABEL_23:
    -[CRLInteractiveCanvasController scrollToSelectionPath:scrollOptions:](self, "scrollToSelectionPath:scrollOptions:", v7, 9);
    -[CRLInteractiveCanvasController showCollaboratorHUDForCollaborator:withSelectionPath:allowScroll:](self, "showCollaboratorHUDForCollaborator:withSelectionPath:allowScroll:", v6, v7, 1);
  }
LABEL_25:

}

- (void)collapseAllExpandedCollaboratorHUDs
{
  void *v3;
  unsigned int v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  int v9;
  void *i;
  void *v11;
  unsigned int v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editingCoordinator](self, "editingCoordinator"));
  v4 = objc_msgSend(v3, "enableCollaboratorCursors");

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable crl_allObjects](self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary, "crl_allObjects", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    v9 = v4 ^ 1;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v12 = objc_msgSend(v11, "shouldAutoHide");
        v13 = objc_msgSend(v11, "hudSize");
        if ((v12 | v9) == 1)
        {
          objc_msgSend(v11, "teardown");
        }
        else if (!v13)
        {
          -[CRLInteractiveCanvasController toggleSizeForCollaboratorHUDController:](self, "toggleSizeForCollaboratorHUDController:", v11);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (void)updateCollaboratorHUDForBeginFollowingCollaborator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char isKindOfClass;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;

  v4 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254C90);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E25DB8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254CB0);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController updateCollaboratorHUDForBeginFollowingCollaborator:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 5098, 0, "This operation must only be performed on the main thread.");

  }
  if (!-[CRLInteractiveCanvasController suppressesCollaboratorHUD](self, "suppressesCollaboratorHUD"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController collaboratorCursorDelegate](self, "collaboratorCursorDelegate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collaboratorCursorSelectionPathForRenderer:collaboratorPresence:", self, v4));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "orderedSelections"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastObject"));
    objc_opt_class(CRLCanvasSelection, v12);
    isKindOfClass = objc_opt_isKindOfClass(v11, v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editingCoordinator](self, "editingCoordinator"));
    v16 = objc_msgSend(v15, "enableCollaboratorCursors");

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKeyedSubscript:](self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary, "objectForKeyedSubscript:", v4));
    v18 = v17;
    if (v17 && (isKindOfClass & 1) == 0 && v16)
    {
      if (!objc_msgSend(v17, "hudSize"))
        -[CRLInteractiveCanvasController toggleSizeForCollaboratorHUDController:](self, "toggleSizeForCollaboratorHUDController:", v18);
    }
    else
    {
      objc_msgSend(v17, "teardown");
    }

  }
}

- (void)updateCollaboratorHUDForStopFollowingCollaborator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254CD0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E25E38();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254CF0);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController updateCollaboratorHUDForStopFollowingCollaborator:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 5121, 0, "This operation must only be performed on the main thread.");

  }
  if (!-[CRLInteractiveCanvasController suppressesCollaboratorHUD](self, "suppressesCollaboratorHUD"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKeyedSubscript:](self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary, "objectForKeyedSubscript:", v4));
    v9 = v8;
    if (v8 && !objc_msgSend(v8, "hudSize"))
      -[CRLInteractiveCanvasController toggleSizeForCollaboratorHUDController:](self, "toggleSizeForCollaboratorHUDController:", v9);

  }
}

- (void)showCollaboratorHUDForCollaborator:(id)a3 withSelectionPath:(id)a4 allowScroll:(BOOL)a5
{
  -[CRLInteractiveCanvasController p_showCollaboratorHUDForCollaborator:withSelectionPath:allowScroll:hudSize:](self, "p_showCollaboratorHUDForCollaborator:withSelectionPath:allowScroll:hudSize:", a3, a4, a5, 0);
}

- (void)p_showCollaboratorHUDForCollaborator:(id)a3 withSelectionPath:(id)a4 allowScroll:(BOOL)a5 hudSize:(unint64_t)a6
{
  uint64_t v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  char isKindOfClass;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  unsigned int v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];

  v7 = a5;
  v10 = a3;
  v11 = a4;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254D10);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E25F44();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254D30);
    v12 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController p_showCollaboratorHUDForCollaborator:withSelectionPath:allowScroll:hudSize:]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 5139, 0, "This operation must only be performed on the main thread.");

  }
  if (!-[CRLInteractiveCanvasController suppressesCollaboratorHUD](self, "suppressesCollaboratorHUD"))
  {
    if (!v11)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController collaboratorCursorDelegate](self, "collaboratorCursorDelegate"));
      v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "collaboratorCursorSelectionPathForRenderer:collaboratorPresence:", self, v10));

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKeyedSubscript:](self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary, "objectForKeyedSubscript:", v10));
    if (!v16)
      goto LABEL_37;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "orderedSelections"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "lastObject"));
    objc_opt_class(CRLCanvasSelection, v19);
    isKindOfClass = objc_opt_isKindOfClass(v18, v20);

    if (!-[CRLInteractiveCanvasController p_followEnabled](self, "p_followEnabled"))
      objc_msgSend(v16, "setShouldFadeOutUnconditionally:", isKindOfClass & 1);
    if (objc_msgSend(v16, "hudSize") == (id)a6)
    {
      if (!-[CRLInteractiveCanvasController p_followEnabled](self, "p_followEnabled"))
      {
        objc_msgSend(v16, "resetFadeOutTimer");
        goto LABEL_37;
      }
      if ((isKindOfClass & 1) != 0)
      {
        if (objc_msgSend(v16, "shouldAutoHide"))
        {
          objc_msgSend(v16, "resetAutoHideTimer");
LABEL_37:
          if (-[NSMapTable count](self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary, "count"))
          {
            v34 = v7;
            v37 = 0u;
            v38 = 0u;
            v35 = 0u;
            v36 = 0u;
            v25 = -[NSMapTable copy](self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary, "copy");
            v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
            if (v26)
            {
              v27 = v26;
              v28 = *(_QWORD *)v36;
              do
              {
                v29 = 0;
                do
                {
                  if (*(_QWORD *)v36 != v28)
                    objc_enumerationMutation(v25);
                  if (*(id *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)v29) != v10)
                  {
                    v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKeyedSubscript:](self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary, "objectForKeyedSubscript:"));
                    if (!((unint64_t)objc_msgSend(v30, "hudSize") | a6))
                    {
                      if (-[CRLInteractiveCanvasController p_followEnabled](self, "p_followEnabled")
                        && !objc_msgSend(v30, "shouldAutoHide"))
                      {
                        if (objc_msgSend(v30, "shouldAutoShrink"))
                          -[CRLInteractiveCanvasController toggleSizeForCollaboratorHUDController:](self, "toggleSizeForCollaboratorHUDController:", v30);
                      }
                      else
                      {
                        objc_msgSend(v30, "teardown");
                      }
                    }

                  }
                  v29 = (char *)v29 + 1;
                }
                while (v27 != v29);
                v31 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
                v27 = v31;
              }
              while (v31);
            }

            v7 = v34;
          }
          -[CRLInteractiveCanvasController p_collaboratorHUDPositionForSelectionPath:collaboratorPresence:allowScroll:hudSize:](self, "p_collaboratorHUDPositionForSelectionPath:collaboratorPresence:allowScroll:hudSize:", v11, v10, v7, a6);
          if (!v16)
          {
            v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKeyedSubscript:](self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary, "objectForKeyedSubscript:", v10));

            if (v32)
            {
              v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKeyedSubscript:](self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary, "objectForKeyedSubscript:", v10));
              objc_msgSend(v33, "teardown");

            }
            v16 = 0;
          }

          goto LABEL_60;
        }
      }
      else if (objc_msgSend(v16, "shouldAutoShrink"))
      {
        objc_msgSend(v16, "resetAutoShrinkTimer");
        goto LABEL_37;
      }
      objc_msgSend(v16, "teardown");

    }
    else
    {
      objc_msgSend(v16, "teardown");

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKeyedSubscript:](self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary, "objectForKeyedSubscript:", v10));
      if (!v16)
        goto LABEL_37;
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101254D50);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E25EB8();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101254D70);
      v22 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController p_showCollaboratorHUDForCollaborator:withSelectionPath:allowScroll:hudSize:]"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v23, v24, 5185, 0, "expected nil value for '%{public}s'", "mCollaboratorPresenceToCollaboratorHUDControllerDictionary[collaboratorPresence]");

    }
    v16 = 0;
    goto LABEL_37;
  }
LABEL_60:

}

- (void)hideCollaboratorHUDForCollaborator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254D90);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E25FC4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254DB0);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController hideCollaboratorHUDForCollaborator:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 5243, 0, "This operation must only be performed on the main thread.");

  }
  if (v4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKeyedSubscript:](self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary, "objectForKeyedSubscript:", v4));
    v9 = v8;
    if (v8)
      objc_msgSend(v8, "hideHUD");

  }
}

- ($BCFEF2EB514CD33A670EC6D7ECA04AF1)p_collaboratorHUDPositionForSelectionPath:(SEL)a3 collaboratorPresence:(id)a4 allowScroll:(id)a5 hudSize:(BOOL)a6
{
  _BOOL4 v8;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  double v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  double y;
  double x;
  uint64_t v27;
  void *i;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  BOOL v35;
  id v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  CGFloat v67;
  double v68;
  CGFloat v69;
  double v70;
  CGFloat v71;
  double v72;
  CGFloat v73;
  NSMapTable *mCollaboratorPresenceToCollaboratorHUDControllerDictionaryForFastSizing;
  NSMapTable *v75;
  NSMapTable *v76;
  CRLCollaboratorCursorHUDController *v77;
  CRLCollaboratorCursorHUDController *v78;
  void *v79;
  void *v80;
  unsigned __int8 v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  _BOOL8 v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  CRLCollaboratorCursorHUDController *v93;
  BOOL v94;
  CRLCollaboratorCursorHUDController *v95;
  CRLCollaboratorCursorHUDController *v96;
  void *v97;
  void *v98;
  unsigned int v99;
  void *v100;
  void *v101;
  id v102;
  id v103;
  id v104;
  uint64_t v105;
  void *j;
  void *v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  CGFloat v117;
  double v118;
  CGFloat v119;
  double v120;
  CGFloat v121;
  double v122;
  CGFloat v123;
  id v124;
  BOOL v125;
  BOOL v126;
  unsigned int v127;
  NSObject *v128;
  void *v129;
  void *v130;
  void *v131;
  id v132;
  id v133;
  uint64_t v134;
  uint64_t v135;
  void *k;
  void *v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  id v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  unsigned int v155;
  double v157;
  double v158;
  double v159;
  double v160;
  unsigned int v161;
  NSObject *v162;
  void *v163;
  void *v164;
  void *v165;
  double v166;
  double v167;
  double v168;
  double v169;
  double v170;
  double v171;
  double v172;
  void *v173;
  double v174;
  double v175;
  double v176;
  CGFloat v177;
  $BCFEF2EB514CD33A670EC6D7ECA04AF1 *result;
  uint64_t v179;
  void *v180;
  void *v181;
  id v182;
  id v183;
  id v185;
  id v186;
  unsigned int v187;
  CRLCollaboratorCursorHUDController *v188;
  id obj;
  id objb;
  id obja;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  uint8_t v204[128];
  uint8_t buf[4];
  unsigned int v206;
  __int16 v207;
  const char *v208;
  __int16 v209;
  const char *v210;
  __int16 v211;
  int v212;
  __int16 v213;
  id v214;
  __int16 v215;
  id v216;
  _BYTE v217[128];
  _BYTE v218[128];
  CGRect v219;
  CGRect v220;
  CGRect v221;

  v8 = a6;
  v11 = a4;
  v12 = a5;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254DD0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E26044();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254DF0);
    v13 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController p_collaboratorHUDPositionForSelectionPath:collaboratorPresence:allowScroll:hudSize:]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 5259, 0, "Should only update HUD on the layout thread.");

  }
  v17 = (id)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController p_layoutForShowingCollaboratorCursorHUDAtSelectionPath:](self, "p_layoutForShowingCollaboratorCursorHUDAtSelectionPath:", v11));
  if (!v17)
  {
    *(_QWORD *)&v18 = objc_opt_class(_TtC8Freeform21CRLBoardItemSelection, v16).n128_u64[0];
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mostSpecificSelectionOfClass:", v19, v18));
    v21 = v20;
    if (v20)
    {
      obj = (id)a7;
      v182 = v12;
      v185 = v11;
      v202 = 0u;
      v203 = 0u;
      v200 = 0u;
      v201 = 0u;
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "boardItems"));
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v200, v218, 16);
      if (v23)
      {
        v24 = v23;
        v17 = 0;
        x = CGRectZero.origin.x;
        y = CGRectZero.origin.y;
        v27 = *(_QWORD *)v201;
        do
        {
          for (i = 0; i != v24; i = (char *)i + 1)
          {
            if (*(_QWORD *)v201 != v27)
              objc_enumerationMutation(v22);
            v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layoutForInfoNearestVisibleRect:](self, "layoutForInfoNearestVisibleRect:", *(_QWORD *)(*((_QWORD *)&v200 + 1) + 8 * (_QWORD)i)));
            v30 = v29;
            if (v17)
            {
              objc_msgSend(v29, "frameInRoot");
              v33 = v31;
              v34 = v32;
              if (v32 < y || (v32 == y ? (v35 = v31 < x) : (v35 = 0), v35))
              {
                v36 = v30;

                y = v34;
                x = v33;
                v17 = v36;
              }
            }
            else
            {
              v17 = v29;
              objc_msgSend(v17, "frameInRoot");
              x = v37;
              y = v38;
            }

          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v200, v218, 16);
        }
        while (v24);
      }
      else
      {
        v17 = 0;
      }

      v11 = v185;
      v12 = v182;
      a7 = (unint64_t)obj;
    }
    else
    {
      v17 = 0;
    }

  }
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvasView](self, "canvasView"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "enclosingScrollView"));
  if (v8)
  {
    -[CRLInteractiveCanvasController p_scaledRectToScrollToForSelectionPath:shouldCenterVertically:](self, "p_scaledRectToScrollToForSelectionPath:shouldCenterVertically:", v11, 1);
    v42 = v41;
    v44 = v43;
    v46 = v45;
    v48 = v47;
  }
  else
  {
    -[CRLInteractiveCanvasController unobscuredScrollViewFrame](self, "unobscuredScrollViewFrame");
    v50 = v49;
    v52 = v51;
    v54 = v53;
    v56 = v55;
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "superview"));
    objc_msgSend(v39, "convertRect:fromView:", v57, v50, v52, v54, v56);
    v42 = v58;
    v44 = v59;
    v46 = v60;
    v48 = v61;

  }
  objc_msgSend(v40, "safeAreaInsets");
  -[CRLInteractiveCanvasController convertBoundsToUnscaledRect:](self, "convertBoundsToUnscaledRect:", v42 + v65, v44 + v62, v46 - (v65 + v63), v48 - (v62 + v64));
  v67 = v66;
  v69 = v68;
  v71 = v70;
  v73 = v72;
  if (v17)
  {
    mCollaboratorPresenceToCollaboratorHUDControllerDictionaryForFastSizing = self->mCollaboratorPresenceToCollaboratorHUDControllerDictionaryForFastSizing;
    if (!mCollaboratorPresenceToCollaboratorHUDControllerDictionaryForFastSizing)
    {
      v75 = (NSMapTable *)objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 0);
      v76 = self->mCollaboratorPresenceToCollaboratorHUDControllerDictionaryForFastSizing;
      self->mCollaboratorPresenceToCollaboratorHUDControllerDictionaryForFastSizing = v75;

      mCollaboratorPresenceToCollaboratorHUDControllerDictionaryForFastSizing = self->mCollaboratorPresenceToCollaboratorHUDControllerDictionaryForFastSizing;
    }
    v181 = v39;
    v77 = (CRLCollaboratorCursorHUDController *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKeyedSubscript:](mCollaboratorPresenceToCollaboratorHUDControllerDictionaryForFastSizing, "objectForKeyedSubscript:", v12));
    v78 = v77;
    v180 = v40;
    v183 = v12;
    if (!v77
      || -[CRLCollaboratorCursorHUDController hudSize](v77, "hudSize") != a7
      || (v79 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCollaboratorCursorHUDController string](v78, "string")),
          v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "displayName")),
          v81 = objc_msgSend(v79, "isEqualToString:", v80),
          v80,
          v79,
          (v81 & 1) == 0))
    {
      if (-[CRLInteractiveCanvasController p_followEnabled](self, "p_followEnabled"))
      {
        v82 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editingCoordinator](self, "editingCoordinator"));
        v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "followCoordinator"));
        objb = (id)a7;
        v84 = v12;
        v85 = v11;
        v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "followingParticipant"));
        v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "owner"));
        v88 = v86 == v87;

        v89 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editingCoordinator](self, "editingCoordinator"));
        v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "followCoordinator"));
        v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "localParticipant"));
        v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "owner"));
        v93 = v78;
        v94 = v91 == v92;

        v11 = v85;
        v12 = v84;

        LOBYTE(v179) = v94;
        v95 = -[CRLCollaboratorCursorHUDController initWithCollaboratorPresence:delegate:hudSize:shouldAutoShrink:shouldAutoHide:isFollowing:isLocalParticipant:]([CRLCollaboratorCursorHUDController alloc], "initWithCollaboratorPresence:delegate:hudSize:shouldAutoShrink:shouldAutoHide:isFollowing:isLocalParticipant:", v84, self, objb, 0, 0, v88, v179);
      }
      else
      {
        v96 = [CRLCollaboratorCursorHUDController alloc];
        v93 = (CRLCollaboratorCursorHUDController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "displayName"));
        v95 = -[CRLCollaboratorCursorHUDController initWithCollaboratorPresence:delegate:string:hudSize:shouldAutoTimeout:](v96, "initWithCollaboratorPresence:delegate:string:hudSize:shouldAutoTimeout:", v12, self, v93, a7, -[CRLInteractiveCanvasController p_shouldTimeoutCollabCursor](self, "p_shouldTimeoutCollabCursor"));

      }
      -[NSMapTable setObject:forKey:](self->mCollaboratorPresenceToCollaboratorHUDControllerDictionaryForFastSizing, "setObject:forKey:", v95, v12);
      v78 = v95;
    }
    v97 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
    v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "miniFormatterPresenter"));
    v99 = objc_msgSend(v98, "isPresentingMiniFormatter");

    v100 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
    v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "miniFormatterPresenter"));
    v187 = objc_msgSend(v101, "isPinnedToTopOfRep");

    v186 = v11;
    v196 = 0u;
    v197 = 0u;
    v198 = 0u;
    v199 = 0u;
    v102 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "unscaledPositionsForCollaboratorHUDForSelectionPath:", v11));
    v103 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v196, v217, 16);
    if (v103)
    {
      v104 = v103;
      v105 = *(_QWORD *)v197;
      while (2)
      {
        for (j = 0; j != v104; j = (char *)j + 1)
        {
          if (*(_QWORD *)v197 != v105)
            objc_enumerationMutation(v102);
          v107 = *(void **)(*((_QWORD *)&v196 + 1) + 8 * (_QWORD)j);
          objc_msgSend(v107, "position");
          v109 = v108;
          v111 = v110;
          -[CRLInteractiveCanvasController viewScale](self, "viewScale");
          v113 = sub_1000603DC(v109, v111, v112);
          v115 = v114;
          if (sub_1000637EC())
          {
            v127 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_101254E10);
            v128 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67110402;
              v206 = v127;
              v207 = 2082;
              v208 = "-[CRLInteractiveCanvasController p_collaboratorHUDPositionForSelectionPath:collaboratorPresence:all"
                     "owScroll:hudSize:]";
              v209 = 2082;
              v210 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m";
              v211 = 1024;
              v212 = 5336;
              v213 = 2112;
              v214 = v17;
              v215 = 2112;
              v216 = v186;
              _os_log_error_impl((void *)&_mh_execute_header, v128, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Position provided by %@ for selection %@ has NaN components!", buf, 0x36u);
            }
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_101254E30);
            v129 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
              sub_100DE7468(v129);
            v130 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController p_collaboratorHUDPositionForSelectionPath:collaboratorPresence:allowScroll:hudSize:]"));
            v131 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v130, v131, 5336, 0, "Position provided by %@ for selection %@ has NaN components!", v17, v186);

            goto LABEL_72;
          }
          -[CRLCollaboratorCursorHUDController scaledFrameForHUDAtPoint:withDirection:](v78, "scaledFrameForHUDAtPoint:withDirection:", objc_msgSend(v107, "direction"), v113, v115);
          -[CRLInteractiveCanvasController convertBoundsToUnscaledRect:](self, "convertBoundsToUnscaledRect:");
          v117 = v116;
          v119 = v118;
          v121 = v120;
          v123 = v122;
          if (v99)
          {
            v124 = objc_msgSend(v107, "direction");
            v125 = objc_msgSend(v107, "direction") == (id)1;
            if (v187)
              v126 = v124 == (id)2;
            else
              v126 = v125;
          }
          else
          {
            v126 = 0;
          }
          v219.origin.x = v67;
          v219.origin.y = v69;
          v219.size.width = v71;
          v219.size.height = v73;
          v221.origin.x = v117;
          v221.origin.y = v119;
          v221.size.width = v121;
          v221.size.height = v123;
          if (CGRectContainsRect(v219, v221) && !v126)
          {
            objc_msgSend(v107, "position");
            v158 = v157;
            v160 = v159;
            v146 = objc_msgSend(v107, "direction");

LABEL_104:
            v11 = v186;
            v39 = v181;
            v12 = v183;
            v40 = v180;
            goto LABEL_105;
          }
        }
        v104 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v196, v217, 16);
        if (v104)
          continue;
        break;
      }
    }
LABEL_72:
    v188 = v78;

    v194 = 0u;
    v195 = 0u;
    v192 = 0u;
    v193 = 0u;
    obja = v102;
    v132 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v192, v204, 16);
    if (v132)
    {
      v133 = v132;
      v134 = *(_QWORD *)v193;
      if (v187)
        v135 = 2;
      else
        v135 = 1;
      while (2)
      {
        for (k = 0; k != v133; k = (char *)k + 1)
        {
          if (*(_QWORD *)v193 != v134)
            objc_enumerationMutation(obja);
          v137 = *(void **)(*((_QWORD *)&v192 + 1) + 8 * (_QWORD)k);
          if (objc_msgSend(v137, "allowedToFlip"))
          {
            objc_msgSend(v137, "position");
            v139 = v138;
            v141 = v140;
            -[CRLInteractiveCanvasController viewScale](self, "viewScale");
            v143 = sub_1000603DC(v139, v141, v142);
            v145 = v144;
            if (sub_1000637EC())
            {
              v161 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_101254E50);
              v162 = off_1013D9070;
              if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67110402;
                v206 = v161;
                v207 = 2082;
                v208 = "-[CRLInteractiveCanvasController p_collaboratorHUDPositionForSelectionPath:collaboratorPresence:a"
                       "llowScroll:hudSize:]";
                v209 = 2082;
                v210 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m";
                v211 = 1024;
                v212 = 5369;
                v213 = 2112;
                v214 = v17;
                v215 = 2112;
                v216 = v186;
                _os_log_error_impl((void *)&_mh_execute_header, v162, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Position provided by %@ for selection %@ has NaN components!", buf, 0x36u);
              }
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_101254E70);
              v163 = off_1013D9070;
              if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                sub_100DE7468(v163);
              v164 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController p_collaboratorHUDPositionForSelectionPath:collaboratorPresence:allowScroll:hudSize:]"));
              v165 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
              +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v164, v165, 5369, 0, "Position provided by %@ for selection %@ has NaN components!", v17, v186);

              goto LABEL_101;
            }
            v146 = (id)sub_10040EB90((uint64_t)objc_msgSend(v137, "direction"));
            -[CRLCollaboratorCursorHUDController scaledFrameForHUDAtPoint:withDirection:](v188, "scaledFrameForHUDAtPoint:withDirection:", v146, v143, v145);
            -[CRLInteractiveCanvasController convertBoundsToUnscaledRect:](self, "convertBoundsToUnscaledRect:");
            v148 = v147;
            v150 = v149;
            v152 = v151;
            v154 = v153;
            if (v146 == (id)v135)
              v155 = v99;
            else
              v155 = 0;
            v220.origin.x = v67;
            v220.origin.y = v69;
            v220.size.width = v71;
            v220.size.height = v73;
            if (CGRectContainsRect(v220, *(CGRect *)&v148) && v155 == 0)
            {
              objc_msgSend(v137, "position");
              v158 = v167;
              v160 = v168;

              goto LABEL_104;
            }
          }
        }
        v133 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v192, v204, 16);
        if (v133)
          continue;
        break;
      }
    }
LABEL_101:

    v11 = v186;
    v39 = v181;
    v12 = v183;
    v40 = v180;
  }
  v158 = sub_100061400(v67, v69, v71, v73);
  v160 = v166;
  v146 = 0;
LABEL_105:
  -[CRLInteractiveCanvasController viewScale](self, "viewScale");
  v170 = sub_1000603DC(v158, v160, v169);
  v172 = v171;
  v173 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvas](self, "canvas"));
  objc_msgSend(v173, "contentsScale");
  v175 = sub_1000630F8(v170, v172, v174);
  v177 = v176;

  retstr->var0.x = v175;
  retstr->var0.y = v177;
  retstr->var1 = (unint64_t)v146;
  *(_QWORD *)&retstr->var2 = 0;
  retstr->var2 = 1;

  return result;
}

- (id)p_layoutForShowingCollaboratorCursorHUDAtSelectionPath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController modelsForSelectionPath:](self, "modelsForSelectionPath:", v4));
  v6 = objc_alloc_init((Class)NSMutableSet);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layoutForInfoNearestVisibleRect:intersectingSelectionPath:](self, "layoutForInfoNearestVisibleRect:intersectingSelectionPath:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v11), v4, (_QWORD)v15));
        if (v12)
          objc_msgSend(v6, "addObject:", v12);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "anyObject"));
  return v13;
}

- (void)removeAllCollaboratorHUDControllers
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable crl_allObjects](self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary, "crl_allObjects", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if (!objc_msgSend(v7, "hudSize"))
          objc_msgSend(v7, "teardown");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)setShouldSuppressesCollaboratorHUD:(BOOL)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  if (self->mSuppressesCollaboratorHUD != a3)
  {
    self->mSuppressesCollaboratorHUD = a3;
    if (a3)
    {
      v10 = 0u;
      v11 = 0u;
      v8 = 0u;
      v9 = 0u;
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable crl_allObjects](self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary, "crl_allObjects", 0));
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
      {
        v5 = v4;
        v6 = *(_QWORD *)v9;
        do
        {
          v7 = 0;
          do
          {
            if (*(_QWORD *)v9 != v6)
              objc_enumerationMutation(v3);
            objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "teardown");
            v7 = (char *)v7 + 1;
          }
          while (v5 != v7);
          v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        }
        while (v5);
      }

    }
  }
}

- (id)filteredMainCanvasRestoredSelectionPath:(id)a3
{
  return a3;
}

- (void)addCollaboratorHUDController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSMapTable *mCollaboratorPresenceToCollaboratorHUDControllerDictionary;
  NSMapTable *v9;
  NSMapTable *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSMapTable *v16;
  void *v17;

  v4 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254E90);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E26144();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254EB0);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController addCollaboratorHUDController:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 5469, 0, "This operation must only be performed on the main thread.");

  }
  mCollaboratorPresenceToCollaboratorHUDControllerDictionary = self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary;
  if (!mCollaboratorPresenceToCollaboratorHUDControllerDictionary)
  {
    v9 = (NSMapTable *)objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 0);
    v10 = self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary;
    self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary = v9;

    mCollaboratorPresenceToCollaboratorHUDControllerDictionary = self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collaboratorPresence"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKeyedSubscript:](mCollaboratorPresenceToCollaboratorHUDControllerDictionary, "objectForKeyedSubscript:", v11));

  if (v12)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254ED0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E260C4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254EF0);
    v13 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController addCollaboratorHUDController:]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 5474, 0, "Showing two huds for the same lobby session");

  }
  v16 = self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collaboratorPresence"));
  -[NSMapTable setObject:forKey:](v16, "setObject:forKey:", v4, v17);

  -[CRLInteractiveCanvasController addDecorator:](self, "addDecorator:", v4);
}

- (void)removeCollaboratorHUDController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSMapTable *mCollaboratorPresenceToCollaboratorHUDControllerDictionary;
  void *v9;

  v4 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254F10);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E261C4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254F30);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController removeCollaboratorHUDController:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 5480, 0, "Should only update HUD on the layout thread.");

  }
  mCollaboratorPresenceToCollaboratorHUDControllerDictionary = self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collaboratorPresence"));
  -[NSMapTable removeObjectForKey:](mCollaboratorPresenceToCollaboratorHUDControllerDictionary, "removeObjectForKey:", v9);

  -[CRLInteractiveCanvasController removeDecorator:](self, "removeDecorator:", v4);
}

- (void)updatePositionForCollaboratorHUDController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 mCurrentlyScrolling;

  v4 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254F50);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E26244();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254F70);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController updatePositionForCollaboratorHUDController:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 5487, 0, "Should only update HUD on the layout thread.");

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController collaboratorCursorDelegate](self, "collaboratorCursorDelegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collaboratorPresence"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collaboratorCursorSelectionPathForRenderer:collaboratorPresence:", self, v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collaboratorPresence"));
  if (objc_msgSend(v4, "hudSize"))
    mCurrentlyScrolling = 0;
  else
    mCurrentlyScrolling = self->mCurrentlyScrolling;
  -[CRLInteractiveCanvasController p_collaboratorHUDPositionForSelectionPath:collaboratorPresence:allowScroll:hudSize:](self, "p_collaboratorHUDPositionForSelectionPath:collaboratorPresence:allowScroll:hudSize:", v10, v11, mCurrentlyScrolling, objc_msgSend(v4, "hudSize"));

  objc_msgSend(v4, "hideHUD");
}

- (void)positionDidUpdateForCollaboratorHUDController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254F90);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E262C4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254FB0);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController positionDidUpdateForCollaboratorHUDController:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 5500, 0, "Should only update HUD on the layout thread.");

  }
  -[CRLInteractiveCanvasController invalidateLayersForDecorator:](self, "invalidateLayersForDecorator:", v4);

}

- (void)beginFollowing:(id)a3 forHUDController:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editingCoordinator](self, "editingCoordinator"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "followCoordinator"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "owner"));

  objc_msgSend(v7, "localParticipantWantsToStartFollowingCollaborator:", v8);
  -[CRLInteractiveCanvasController donateTipEventParticipantFollowed](self, "donateTipEventParticipantFollowed");
}

- (void)endFollowing:(id)a3 forHUDController:(id)a4
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editingCoordinator](self, "editingCoordinator", a3, a4));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "followCoordinator"));
  objc_msgSend(v4, "endFollowSessionForLocalParticipantWithShouldShowRefollowPlacard:", 0);

}

- (void)toggleSizeForCollaboratorHUDController:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collaboratorPresence"));
  v5 = objc_msgSend(v4, "hudSize");

  -[CRLInteractiveCanvasController p_showCollaboratorHUDForCollaborator:withSelectionPath:allowScroll:hudSize:](self, "p_showCollaboratorHUDForCollaborator:withSelectionPath:allowScroll:hudSize:", v6, 0, 0, v5 == 0);
}

- (BOOL)shouldSuppressCollaboratorCursorHUDForController:(id)a3
{
  return 0;
}

- (double)contentsScale
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvas](self, "canvas"));
  objc_msgSend(v2, "contentsScale");
  v4 = v3;

  return v4;
}

- (double)visibleCanvasWidth
{
  double v2;

  -[CRLInteractiveCanvasController visibleBoundsRect](self, "visibleBoundsRect");
  return v2;
}

- (UITraitCollection)currentTraitCollection
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvasView](self, "canvasView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "window"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "traitCollection"));

  return (UITraitCollection *)v4;
}

- (BOOL)canModifyHyperlinks
{
  return !-[CRLInteractiveCanvasController editingDisabled](self, "editingDisabled");
}

- (BOOL)shouldShowHyperlinkKnob
{
  return !-[CRLInteractiveCanvasController editingDisabled](self, "editingDisabled");
}

- (BOOL)isHyperlinkKnobEnabledForRep:(id)a3
{
  return 1;
}

- (BOOL)allowedToShowHyperlinkContextMenuForRep:(id)a3
{
  return 1;
}

- (BOOL)canCustomizeHyperlinkViewController
{
  return 1;
}

- (BOOL)openURL:(id)a3
{
  return 1;
}

- (void)beginDynamicOperation
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  char v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned __int8 v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];

  if (self->mDynamicOperationState)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254FD0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E263C4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254FF0);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController beginDynamicOperation]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 5589, 0, "didn't end previous dynamic operation before starting a new one");

  }
  if (atomic_load((unsigned int *)&self->mDynamicOperationCounter))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101255010);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E26344();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101255030);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController beginDynamicOperation]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 5590, 0, "Inspector-driven dynamic operation in process when beginning separate dynamic operation");

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  v11 = objc_opt_respondsToSelector(WeakRetained, "dynamicOperationWillBegin");

  if ((v11 & 1) != 0)
  {
    v12 = objc_loadWeakRetained((id *)&self->mDelegate);
    objc_msgSend(v12, "dynamicOperationWillBegin");

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editingCoordinator](self, "editingCoordinator"));
  objc_msgSend(v13, "suspendCollaborationWithReason:", CFSTR("CRLDynamicOperation"));

  self->mDynamicOperationState = 1;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "canvasLayer"));
  objc_msgSend(v15, "bounds");
  self->mUnscaledRectToGrowCanvasDuringDynamicOperation.origin.x = v16;
  self->mUnscaledRectToGrowCanvasDuringDynamicOperation.origin.y = v17;
  self->mUnscaledRectToGrowCanvasDuringDynamicOperation.size.width = v18;
  self->mUnscaledRectToGrowCanvasDuringDynamicOperation.size.height = v19;

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController i_decorators](self, "i_decorators", 0));
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v25, "willBeginDynamicOperation") & 1) != 0)
          objc_msgSend(v25, "willBeginDynamicOperation");
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v22);
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController tmCoordinator](self, "tmCoordinator"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "controllingTM"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "tracker"));

  if (!v28)
    goto LABEL_42;
  if ((objc_opt_respondsToSelector(v28, "shouldAllowScroll") & 1) != 0)
    v29 = objc_msgSend(v28, "shouldAllowScroll");
  else
    v29 = 0;
  if ((objc_opt_respondsToSelector(v28, "allowPopoverToRemainOpenDuringDynamicOperation") & 1) == 0
    || (objc_msgSend(v28, "allowPopoverToRemainOpenDuringDynamicOperation") & 1) == 0)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "asiOSCVC"));

    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "delegate"));
    if ((objc_opt_respondsToSelector(v32, "dismissPresentedViewController") & 1) != 0)
      objc_msgSend(v32, "dismissPresentedViewController");

  }
  if ((v29 & 1) == 0)
  {
LABEL_42:
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "canvasView"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "enclosingScrollView"));
    objc_msgSend(v35, "setScrollEnabled:", 0);

  }
}

- (void)willEndDynamicOperation
{
  void *v3;
  void *v4;
  void *v5;

  if (self->mDynamicOperationState != 1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101255050);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E26444();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101255070);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController willEndDynamicOperation]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 5644, 0, "didn't begin or already ending dynamic operation");

  }
  self->mDynamicOperationState = 2;
}

- (void)endDynamicOperation
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  id WeakRetained;
  char v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  if (self->mDynamicOperationState != 2)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101255090);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E26544();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012550B0);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController endDynamicOperation]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 5649, 0, "ending dynamic operation without starting a new one or calling willEnd");

  }
  if (atomic_load((unsigned int *)&self->mDynamicOperationCounter))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012550D0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E264C4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012550F0);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController endDynamicOperation]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 5650, 0, "Cannot begin inspector dynamic operation while in non-inspector dynamic operation");

  }
  self->mDynamicOperationState = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editingCoordinator](self, "editingCoordinator"));
  objc_msgSend(v10, "resumeCollaborationWithReason:", CFSTR("CRLDynamicOperation"));

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController i_decorators](self, "i_decorators", 0));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v16, "didEndDynamicOperation") & 1) != 0)
          objc_msgSend(v16, "didEndDynamicOperation");
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v13);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  v18 = objc_opt_respondsToSelector(WeakRetained, "dynamicOperationDidEnd");

  if ((v18 & 1) != 0)
  {
    v19 = objc_loadWeakRetained((id *)&self->mDelegate);
    objc_msgSend(v19, "dynamicOperationDidEnd");

  }
  -[CRLCanvas layoutInvalidated](self->mCanvas, "layoutInvalidated");
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "canvasView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "enclosingScrollView"));
  objc_msgSend(v22, "setScrollEnabled:", 1);

}

- (BOOL)isInDynamicOperation
{
  signed int v3;

  if (self->mDynamicOperationState)
    return 1;
  v3 = atomic_load((unsigned int *)&self->mDynamicOperationCounter);
  return v3 > 0;
}

- (BOOL)isDynamicOperationEnding
{
  return self->mDynamicOperationState == 2;
}

- (BOOL)shouldSupportedDynamicOperationsEnqueueCommandsInRealTime
{
  void *v3;
  uint64_t v4;
  void *v5;
  unsigned __int8 v6;
  void *v8;
  unsigned __int8 v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v4 = (uint64_t)objc_msgSend(v3, "thermalState");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("CRLForceEnableRealTimeCommands"));

  if ((v6 & 1) != 0)
    return 1;
  if (v4 > 1)
    return 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editingCoordinator](self, "editingCoordinator"));
  v9 = objc_msgSend(v8, "isInRealTimeSyncSession");

  return v9;
}

- (void)beginPossiblyParallelInspectorDynamicOperation
{
  int *p_mDynamicOperationCounter;
  unsigned int v3;
  id v4;

  p_mDynamicOperationCounter = &self->mDynamicOperationCounter;
  do
    v3 = __ldaxr((unsigned int *)p_mDynamicOperationCounter);
  while (__stlxr(v3 + 1, (unsigned int *)p_mDynamicOperationCounter));
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editingCoordinator](self, "editingCoordinator"));
  objc_msgSend(v4, "suspendCollaborationWithReason:", CFSTR("CRLPossiblyParallelInspectorDynamicOperation"));

}

- (void)endPossiblyParallelInspectorDynamicOperation
{
  int *p_mDynamicOperationCounter;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  p_mDynamicOperationCounter = &self->mDynamicOperationCounter;
  do
    v4 = __ldaxr((unsigned int *)p_mDynamicOperationCounter);
  while (__stlxr(v4 - 1, (unsigned int *)p_mDynamicOperationCounter));
  if (v4 <= 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101255110);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E265C4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101255130);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController endPossiblyParallelInspectorDynamicOperation]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 5720, 0, "Ended more dynamic operations than you began!");

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editingCoordinator](self, "editingCoordinator"));
  objc_msgSend(v8, "resumeCollaborationWithReason:", CFSTR("CRLPossiblyParallelInspectorDynamicOperation"));

}

- (BOOL)isInInspectorDynamicOperation
{
  signed int v2;

  v2 = atomic_load((unsigned int *)&self->mDynamicOperationCounter);
  return v2 > 0;
}

- (BOOL)shouldAllowKeyCommands
{
  void *v3;
  unsigned __int8 v4;
  unsigned int v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController textInputResponder](self, "textInputResponder"));
  v4 = objc_msgSend(v3, "isIgnoringKeyboardInput");

  if ((v4 & 1) != 0)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "asiOSCVC"));
    if ((objc_msgSend(v7, "shouldIgnoreKeyboardInput") & 1) != 0)
      LOBYTE(v5) = 0;
    else
      v5 = !-[CRLInteractiveCanvasController isInDynamicOperation](self, "isInDynamicOperation");

  }
  return v5;
}

- (BOOL)p_areAnyCollaboratorsPresent
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController currentCollaboratorPresences](self, "currentCollaboratorPresences"));
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (unint64_t)p_editingDisabledReasons
{
  return -[CRLInteractiveCanvasController documentIsSharedReadOnly](self, "documentIsSharedReadOnly");
}

+ (id)keyPathsForValuesAffectingEditingDisabled
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("documentIsSharedReadOnly"), CFSTR("isInReaderMode"), 0);
}

- (void)copyEditabilityPropertiesFromInteractiveCanvasController:(id)a3
{
  -[CRLInteractiveCanvasController setDocumentIsSharedReadOnly:](self, "setDocumentIsSharedReadOnly:", objc_msgSend(a3, "documentIsSharedReadOnly"));
}

- (void)setDocumentIsSharedReadOnly:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[5];

  if (self->mDocumentIsSharedReadOnly != a3)
  {
    v3 = a3;
    self->mDocumentIsSharedReadOnly = a3;
    -[CRLInteractiveCanvasController documentEditabilityDidChange](self, "documentEditabilityDidChange");
    if (v3)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "miniFormatterPresenter"));
      objc_msgSend(v6, "dismissMiniFormatter");

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "asiOSCVC"));
      objc_msgSend(v8, "resetGesturesForContextSwitch");

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editorController](self, "editorController"));
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100362CD0;
      v11[3] = &unk_101255158;
      v11[4] = self;
      objc_msgSend(v9, "enumerateEditorsOnStackLeastToMostSpecificUsingBlock:", v11);

      if (+[UIKeyboard isInHardwareKeyboardMode](UIKeyboard, "isInHardwareKeyboardMode"))
      {
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = sub_100362D44;
        v10[3] = &unk_10122D110;
        v10[4] = self;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
      }
    }
  }
}

- (void)documentEditabilityDidChange
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = -[CRLInteractiveCanvasController p_editingDisabledReasons](self, "p_editingDisabledReasons");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editorController](self, "editorController"));
  objc_msgSend(v4, "setEditingDisabledReasons:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editorController](self, "editorController"));
  objc_msgSend(v5, "enumerateEditorsOnStackUsingBlock:", &stru_101255198);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvas topLevelReps](self->mCanvas, "topLevelReps", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), "recursivelyPerformSelectorIfImplemented:", "documentEditabilityDidChange");
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (BOOL)usesAlternateDrawableSelectionHighlight
{
  return self->mUsesAlternateDrawableSelectionHighlight;
}

- (void)setUsesAlternateDrawableSelectionHighlight:(BOOL)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  if (self->mUsesAlternateDrawableSelectionHighlight != a3)
  {
    self->mUsesAlternateDrawableSelectionHighlight = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvas topLevelReps](self->mCanvas, "topLevelReps", 0));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v9, "recursivelyPerformSelectorIfImplemented:", "i_invalidateSelectionHighlightRenderable");
          objc_msgSend(v9, "recursivelyPerformSelectorIfImplemented:", "invalidateKnobs");
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

    -[CRLInteractiveCanvasController layoutInvalidated](self, "layoutInvalidated");
  }
}

- (void)setAllowsSelectionKnobs:(BOOL)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  if (self->mAllowsSelectionKnobs != a3)
  {
    self->mAllowsSelectionKnobs = a3;
    v8 = 0u;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvas topLevelReps](self->mCanvas, "topLevelReps", 0));
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i), "recursivelyPerformSelectorIfImplemented:", "invalidateKnobs");
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
}

- (void)setAllowsSelectionHighlight:(BOOL)a3
{
  if (self->mAllowsSelectionHighlight != a3)
  {
    self->mAllowsSelectionHighlight = a3;
    -[CRLInteractiveCanvasController invalidateAllLayers](self, "invalidateAllLayers");
  }
}

- (BOOL)shouldSuppressSelectionKnobsForRep:(id)a3
{
  _TtC8Freeform24CRLMultiselectResizeInfo *mMultiselectResizeInfo;
  id v4;
  void *v5;
  void *v6;

  mMultiselectResizeInfo = self->mMultiselectResizeInfo;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMultiselectResizeInfo representedSelectedBoardItems](mMultiselectResizeInfo, "representedSelectedBoardItems"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "info"));

  LOBYTE(v4) = objc_msgSend(v5, "containsObject:", v6);
  return (char)v4;
}

- (id)additionalDependentLayoutsForBoardItem:(id)a3
{
  id v4;
  _TtC8Freeform24CRLMultiselectResizeInfo *mMultiselectResizeInfo;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;

  v4 = a3;
  mMultiselectResizeInfo = self->mMultiselectResizeInfo;
  if (mMultiselectResizeInfo
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMultiselectResizeInfo representedSelectedBoardItems](mMultiselectResizeInfo, "representedSelectedBoardItems")), v7 = objc_msgSend(v6, "containsObject:", v4), v6, v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layoutForInfo:](self, "layoutForInfo:", self->mMultiselectResizeInfo));
    if (v8)
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v8));
    else
      v9 = 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)additionalChildInfosForLayout:(id)a3
{
  id v4;
  _TtC8Freeform24CRLMultiselectResizeInfo *mMultiselectResizeInfo;
  void *v6;
  void *v7;
  void *v8;
  _TtC8Freeform24CRLMultiselectResizeInfo *v10;

  v4 = a3;
  mMultiselectResizeInfo = self->mMultiselectResizeInfo;
  if (mMultiselectResizeInfo
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMultiselectResizeInfo parentInfo](mMultiselectResizeInfo, "parentInfo")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "info")),
        v7,
        v6,
        v6 == v7))
  {
    v10 = self->mMultiselectResizeInfo;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  }
  else
  {
    v8 = &__NSArray0__struct;
  }

  return v8;
}

- (void)i_invalidateSelectionHighlightLayers
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvas topLevelReps](self->mCanvas, "topLevelReps", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i), "recursivelyPerformSelectorIfImplemented:", "i_invalidateSelectionHighlightRenderable");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[CRLInteractiveCanvasController layoutInvalidated](self, "layoutInvalidated");
}

- (void)beginScrollingOperation
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController i_decorators](self, "i_decorators", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v7, "willBeginScrollingOperation") & 1) != 0)
          objc_msgSend(v7, "willBeginScrollingOperation");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)endScrollingOperation
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController i_decorators](self, "i_decorators", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v7, "didEndScrollingOperation") & 1) != 0)
          objc_msgSend(v7, "didEndScrollingOperation");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)p_beginZoomingOperation
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController i_decorators](self, "i_decorators", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v8, "willBeginZoomingOperation") & 1) != 0)
          objc_msgSend(v8, "willBeginZoomingOperation");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[CRLInteractiveCanvasController p_fadeOutForZoomOperation](self, "p_fadeOutForZoomOperation");
}

- (void)p_endZoomingOperation
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController i_decorators](self, "i_decorators", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v8, "didEndZoomingOperation") & 1) != 0)
          objc_msgSend(v8, "didEndZoomingOperation");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "canvasLayer"));
  objc_msgSend(v10, "layoutIfNeededIgnoringDisabledLayout");

  -[CRLInteractiveCanvasController p_fadeInForZoomOperation](self, "p_fadeInForZoomOperation");
}

- (void)p_fadeOutForZoomOperation
{
  void *v3;
  double v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSMutableArray *v9;
  NSMutableArray *mLayersWithZoomFadeAnimation;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  id v18;
  id v19;
  void *j;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *k;
  void *v27;
  id obj;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity")));
  objc_msgSend(v3, "setDuration:", 0.15);
  LODWORD(v4) = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4));
  objc_msgSend(v3, "setToValue:", v5);

  objc_msgSend(v3, "setRemovedOnCompletion:", 0);
  objc_msgSend(v3, "setFillMode:", kCAFillModeForwards);
  v6 = objc_alloc((Class)NSMutableArray);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController overlayLayer](self, "overlayLayer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sublayers"));
  v9 = (NSMutableArray *)objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v8, "count"));
  mLayersWithZoomFadeAnimation = self->mLayersWithZoomFadeAnimation;
  self->mLayersWithZoomFadeAnimation = v9;

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController overlayLayer](self, "overlayLayer"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sublayers"));

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v39 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v17, "crl_hideOverlayLayerDuringZoomOperations"))
        {
          objc_msgSend(v17, "addAnimation:forKey:", v3, CFSTR("CRLInteractiveCanvasControllerBeginZoomingOperation"));
          -[NSMutableArray addObject:](self->mLayersWithZoomFadeAnimation, "addObject:", v17);
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v14);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvas allReps](self->mCanvas, "allReps"));
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
  if (v18)
  {
    v19 = v18;
    v29 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v19; j = (char *)j + 1)
      {
        if (*(_QWORD *)v35 != v29)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)j);
        objc_msgSend(v21, "handleFadeOutForZoom");
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "additionalRenderablesToFadeDuringZoom"));
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v31;
          do
          {
            for (k = 0; k != v24; k = (char *)k + 1)
            {
              if (*(_QWORD *)v31 != v25)
                objc_enumerationMutation(v22);
              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1)
                                                                                 + 8 * (_QWORD)k), "layer"));
              objc_msgSend(v27, "addAnimation:forKey:", v3, CFSTR("CRLInteractiveCanvasControllerBeginZoomingOperation"));
              -[NSMutableArray addObject:](self->mLayersWithZoomFadeAnimation, "addObject:", v27);

            }
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
          }
          while (v24);
        }

      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    }
    while (v19);
  }

}

- (void)p_fadeInForZoomOperation
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  double v9;
  void *v10;
  NSMutableArray *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  void *v16;
  void *v17;
  NSMutableArray *mLayersWithZoomFadeAnimation;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];

  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvas allReps](self->mCanvas, "allReps"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i), "handleFadeInForZoom");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v5);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity")));
  objc_msgSend(v8, "setDuration:", 0.15);
  LODWORD(v9) = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v9));
  objc_msgSend(v8, "setFromValue:", v10);

  objc_msgSend(v8, "setRemovedOnCompletion:", 1);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = self->mLayersWithZoomFadeAnimation;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)j);
        objc_msgSend(v16, "opacity");
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
        objc_msgSend(v8, "setToValue:", v17);

        objc_msgSend(v16, "addAnimation:forKey:", v8, CFSTR("CRLInteractiveCanvasControllerEndZoomingOperation"));
        objc_msgSend(v16, "removeAnimationForKey:", CFSTR("CRLInteractiveCanvasControllerBeginZoomingOperation"));
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v13);
  }

  mLayersWithZoomFadeAnimation = self->mLayersWithZoomFadeAnimation;
  self->mLayersWithZoomFadeAnimation = 0;

}

- (void)setShowInvisibleObjects:(BOOL)a3
{
  if (self->mShowInvisibleObjects != a3)
  {
    self->mShowInvisibleObjects = a3;
    -[CRLInteractiveCanvasController layoutInvalidated](self, "layoutInvalidated");
  }
}

- (CRLDynamicOperationController)dynamicOperationController
{
  CRLDynamicOperationController *mDynOpController;
  CRLDynamicOperationController *v4;
  CRLDynamicOperationController *v5;

  mDynOpController = self->mDynOpController;
  if (!mDynOpController)
  {
    v4 = -[CRLDynamicOperationController initWithInteractiveCanvasController:]([CRLDynamicOperationController alloc], "initWithInteractiveCanvasController:", self);
    v5 = self->mDynOpController;
    self->mDynOpController = v4;

    mDynOpController = self->mDynOpController;
  }
  return mDynOpController;
}

- (CRLTrackerManipulatorCoordinator)tmCoordinator
{
  CRLTrackerManipulatorCoordinator *mTMCoordinator;
  CRLTrackerManipulatorCoordinator *v4;
  CRLTrackerManipulatorCoordinator *v5;

  mTMCoordinator = self->mTMCoordinator;
  if (!mTMCoordinator)
  {
    v4 = objc_alloc_init(CRLTrackerManipulatorCoordinator);
    v5 = self->mTMCoordinator;
    self->mTMCoordinator = v4;

    mTMCoordinator = self->mTMCoordinator;
  }
  return mTMCoordinator;
}

- (id)customRotateTrackerForCurrentSelection
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  CRLMultiRepRotateTracker *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  if (!-[CRLInteractiveCanvasController p_shouldTransformCurrentSelectionAsSingleEntity](self, "p_shouldTransformCurrentSelectionAsSingleEntity"))return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController infosForCurrentSelectionPath](self, "infosForCurrentSelectionPath", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController repForInfo:](self, "repForInfo:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i)));
        v10 = v9;
        if (v9)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "repForRotating"));

          if (v11 == v10)
            objc_msgSend(v3, "addObject:", v10);
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v12 = -[CRLMultiRepRotateTracker initWithReps:]([CRLMultiRepRotateTracker alloc], "initWithReps:", v3);
  return v12;
}

- (CRLGestureDispatcher)gestureDispatcher
{
  CRLGestureDispatcher *mGestureDispatcher;
  CRLGestureDispatcher *v4;
  CRLGestureDispatcher *v5;

  mGestureDispatcher = self->mGestureDispatcher;
  if (!mGestureDispatcher)
  {
    v4 = -[CRLGestureDispatcher initWithInteractiveCanvasController:]([CRLGestureDispatcher alloc], "initWithInteractiveCanvasController:", self);
    v5 = self->mGestureDispatcher;
    self->mGestureDispatcher = v4;

    mGestureDispatcher = self->mGestureDispatcher;
  }
  return mGestureDispatcher;
}

- (void)updateSelectionForTapAtPoint:(CGPoint)a3 extendingSelection:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController hitRep:](self, "hitRep:", a3.x, a3.y));
  -[CRLInteractiveCanvasController updateSelectionForInteractionWithRep:extendingSelection:](self, "updateSelectionForInteractionWithRep:extendingSelection:", v6, v4);

}

- (void)updateSelectionForInteractionWithRep:(id)a3 extendingSelection:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v4 = a4;
  v6 = a3;
  v20 = (id)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvasEditor](self, "canvasEditor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "repForSelecting"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "parentRepToPerformSelecting"));
    if (v8)
    {
      -[CRLInteractiveCanvasController endEditing](self, "endEditing");
      objc_msgSend(v8, "selectChildRep:extendingSelection:", v7, v4);
    }
    else if (v4)
    {
      -[CRLInteractiveCanvasController endEditing](self, "endEditing");
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "info"));
      v11 = objc_msgSend(v7, "isSelectedIgnoringLocking");
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "canvasEditorHelper"));
      v13 = v12;
      if (v11)
        v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "canvasSelectionPathExcludingInfo:", v10));
      else
        v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "canvasSelectionPathIncludingInfo:", v10));
      v15 = (void *)v14;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editorController](self, "editorController"));
      objc_msgSend(v16, "setSelectionPath:", v15);

    }
    else if ((objc_msgSend(v7, "isSelectedIgnoringLocking") & 1) != 0)
    {
      -[CRLInteractiveCanvasController updateSelectionForTapOnSelectedRep:](self, "updateSelectionForTapOnSelectedRep:", v7);
    }
    else
    {
      -[CRLInteractiveCanvasController endEditing](self, "endEditing");
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "info"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "selectionPathWithInfo:", v17));

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editorController](self, "editorController"));
      objc_msgSend(v19, "setSelectionPath:", v18);

    }
    goto LABEL_14;
  }
  if (!v4)
  {
    -[CRLInteractiveCanvasController endEditing](self, "endEditing");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "selectionPathWithInfos:", 0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editorController](self, "editorController"));
    objc_msgSend(v9, "setSelectionPath:", v8);

LABEL_14:
  }

}

- (BOOL)handleSingleTapAtPoint:(CGPoint)a3 extendingSelection:(BOOL)a4 inputType:(int64_t)a5
{
  _BOOL8 v6;
  double y;
  double x;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  BOOL v14;

  v6 = a4;
  y = a3.y;
  x = a3.x;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController hitRep:](self, "hitRep:"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "repForHandleSingleTap"));
  v12 = v11;
  if (!v6)
  {
    if (!v11)
    {
      v14 = 0;
      goto LABEL_15;
    }
    if ((!objc_msgSend(v10, "isLocked") || objc_msgSend(v10, "wantsToHandleTapsWhenLocked"))
      && (objc_msgSend(v12, "handleSingleTapAtPoint:inputType:", a5, x, y) & 1) != 0)
    {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  v13 = objc_msgSend(v11, "handleSingleTapsWhileExtendingSelectionAtPoint:inputType:", a5, x, y);
  if (v12)
    v14 = 1;
  else
    v14 = v13;
  if (v12 && (v13 & 1) == 0)
  {
LABEL_12:
    -[CRLInteractiveCanvasController updateSelectionForTapAtPoint:extendingSelection:](self, "updateSelectionForTapAtPoint:extendingSelection:", v6, x, y);
LABEL_13:
    v14 = 1;
  }
LABEL_15:

  return v14;
}

- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4
{
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned int v30;

  y = a3.y;
  x = a3.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController hitRep:](self, "hitRep:"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "repForSelecting"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "info"));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController selectionModelTranslator](self, "selectionModelTranslator"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editorController](self, "editorController"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "selectionPath"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "boardItemsForSelectionPath:", v13));

      if (objc_msgSend(v14, "count") != (id)1
        || (v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "info")),
            v16 = objc_msgSend(v14, "containsObject:", v15),
            v15,
            (v16 & 1) == 0))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvasEditor](self, "canvasEditor"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "info"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "selectionPathWithInfo:", v18));
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editorController](self, "editorController"));
        objc_msgSend(v20, "setSelectionPath:", v19);

      }
    }
    if (!objc_msgSend(v9, "isLocked")
      || objc_msgSend(v9, "wantsToHandleDoubleTapsWhenLocked"))
    {
      objc_msgSend(v9, "handleDoubleTapAtPoint:inputType:", a4, x, y);
    }
    objc_opt_class(CRLGroupRep, v21);
    if ((objc_opt_isKindOfClass(v9, v22) & 1) != 0)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvasView](self, "canvasView"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "layerHost"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "miniFormatterPresenter"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editorController](self, "editorController"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "selectionPath"));
      objc_msgSend(v25, "presentMiniFormatterForSelectionPath:", v27);

    }
  }
  else
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "asUIKitHost"));
    v30 = objc_msgSend(v29, "isCurrentlyInQuickSelectMode");

    if (v30)
      -[CRLInteractiveCanvasController updateSelectionForTapAtPoint:extendingSelection:](self, "updateSelectionForTapAtPoint:extendingSelection:", 0, x, y);
  }

  return v9 != 0;
}

- (BOOL)handleMultipleTapAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController hitRep:](self, "hitRep:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "repForSelecting"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "info"));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvasEditor](self, "canvasEditor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "info"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectionPathWithInfo:", v10));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editorController](self, "editorController"));
      objc_msgSend(v12, "setSelectionPath:", v11);

    }
    if ((objc_msgSend(v7, "isLocked") & 1) == 0)
      objc_msgSend(v7, "handleMultipleTapAtPoint:", x, y);
  }

  return v7 != 0;
}

- (void)tappedCanvasBackgroundAtPoint:(CGPoint)a3 inputType:(int64_t)a4
{
  double y;
  double x;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  uint64_t v20;
  void *v21;
  id WeakRetained;
  char v23;
  id v24;
  unsigned int v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;

  y = a3.y;
  x = a3.x;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost", a4));
  v30 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "asUIKitHost"));

  v8 = objc_msgSend(v30, "isCurrentlyInQuickSelectMode");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editorController](self, "editorController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectionPath"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController infosForSelectionPath:](self, "infosForSelectionPath:", v10));
  v12 = objc_msgSend(v11, "count");

  if ((v8 & 1) == 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvasEditor](self, "canvasEditor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "selectionPathWithInfos:", 0));

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editorController](self, "editorController"));
    objc_msgSend(v15, "setSelectionPath:withFlags:", v14, 0x2000);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "asiOSCVC"));

  objc_msgSend(v17, "becomeFirstResponderIfAppropriate");
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "delegate"));
  v19 = objc_opt_respondsToSelector(v18, "currentDocumentMode");

  if ((v19 & 1) == 0
    || (v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "delegate")),
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v20, "currentDocumentMode")),
        (id)v20,
        LOBYTE(v20) = objc_msgSend(v21, "handleTapOnCanvasBackgroundAtUnscaledPoint:", x, y),
        v21,
        (v20 & 1) == 0))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
    v23 = objc_opt_respondsToSelector(WeakRetained, "tappedCanvasBackgroundAtPoint:");

    if ((v23 & 1) != 0)
    {
      v24 = objc_loadWeakRetained((id *)&self->mDelegate);
      v25 = objc_msgSend(v24, "tappedCanvasBackgroundAtPoint:", x, y);

      if (((v25 | v8) & 1) != 0)
        goto LABEL_15;
    }
    else if ((v8 & 1) != 0)
    {
      goto LABEL_15;
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editorController](self, "editorController"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "selectionPath"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController infosForSelectionPath:](self, "infosForSelectionPath:", v27));
    v29 = objc_msgSend(v28, "count");

    if (!v29)
    {
      if ((objc_msgSend(v30, "contextMenuMightBeDisplayed") & 1) != 0 || v12)
      {
        objc_msgSend(v30, "hideEditMenu");
      }
      else if (!-[CRLInteractiveCanvasController editingDisabled](self, "editingDisabled"))
      {
        objc_msgSend(v30, "showDefaultEditUIForCurrentSelection");
      }
    }
  }
LABEL_15:

}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  CRLCanvasAnimation *mCurrentAnimation;
  void *v6;

  mCurrentAnimation = self->mCurrentAnimation;
  if (mCurrentAnimation)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAnimation actionForLayer:forKey:](mCurrentAnimation, "actionForLayer:forKey:", a3, a4));
  }
  else if (-[CRLInteractiveCanvasLayerUpdater isCanvasContentLayer:](self->mLayerUpdater, "isCanvasContentLayer:", a3, a4))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v6 = a3;
  v7 = v6;
  if (self->mShouldSuppressRendering)
    goto LABEL_36;
  if (!v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012551B8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2675C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012551D8);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController drawLayer:inContext:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 6339, 0, "invalid nil value for '%{public}s'", "layer");

    if (a4)
      goto LABEL_23;
    goto LABEL_14;
  }
  if (!a4)
  {
LABEL_14:
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012551F8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E266D0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101255218);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController drawLayer:inContext:]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 6340, 0, "invalid nil value for '%{public}s'", "ctx");

  }
LABEL_23:
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController i_interactiveCanvasLayerHelper](self, "i_interactiveCanvasLayerHelper"));

  if (!v14)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101255238);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E26644();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101255258);
    v15 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController drawLayer:inContext:]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 6342, 0, "invalid nil value for '%{public}s'", "self.i_interactiveCanvasLayerHelper");

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController i_interactiveCanvasLayerHelper](self, "i_interactiveCanvasLayerHelper"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "repForLayer:", v7));

  if (v19)
    -[CRLInteractiveCanvasController i_drawRepWithReadLock:inContext:forLayer:](self, "i_drawRepWithReadLock:inContext:forLayer:", v19, a4, v7);

LABEL_36:
}

- (BOOL)shouldLayoutTilingLayer:(id)a3
{
  void *v4;
  void *v5;
  BOOL v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "canvasLayer"));
  v6 = (objc_msgSend(v5, "isLayoutDisabled") & 1) == 0 && !self->mAnimatingViewScale;

  return v6;
}

- (CGRect)visibleBoundsForTilingLayer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v18;
  void *v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat x;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  double v34;
  objc_class *v35;
  objc_class *v36;
  void *v37;
  id v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect result;
  CGRect v66;
  CGRect v67;

  v4 = a3;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101255278);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E26874();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101255298);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController visibleBoundsForTilingLayer:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 6356, 0, "invalid nil value for '%{public}s'", "layer");

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "canvasLayer"));

  v10 = v4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "superlayer"));

  v12 = v10;
  if (v11)
  {
    v12 = v10;
    if (v9 != v10)
    {
      v12 = v10;
      do
      {
        v13 = v12;
        v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "superlayer"));

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "superlayer"));
      }
      while (v14 && v12 != v9);
    }
  }
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "superlayer"));
  v20 = height;
  v21 = width;
  v22 = y;
  x = CGRectNull.origin.x;
  if (!v19)
  {
    objc_opt_class(CRLCanvasSubviewLayer, v18);
    v20 = height;
    v21 = width;
    v22 = y;
    x = CGRectNull.origin.x;
    if ((objc_opt_isKindOfClass(v12, v24) & 1) == 0)
      goto LABEL_31;
    objc_msgSend(v10, "bounds");
    objc_msgSend(v12, "convertRect:fromLayer:", v10);
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;
    *(_QWORD *)&v34 = objc_opt_class(CRLCanvasSubview, v33).n128_u64[0];
    v36 = v35;
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "delegate", v34));
    v38 = sub_1002223BC(v36, v37);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v38);

    if (v19)
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvasView](self, "canvasView"));
      objc_msgSend(v19, "convertRect:toView:", v39, v26, v28, v30, v32);
      x = v40;
      v22 = v41;
      v21 = v42;
      v20 = v43;
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012552B8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E267E8();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012552D8);
      v44 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v44);
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController visibleBoundsForTilingLayer:]"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v39, v45, 6376, 0, "invalid nil value for '%{public}s'", "canvasSubview");

      v20 = height;
      v21 = width;
      v22 = y;
      x = CGRectNull.origin.x;
    }

  }
LABEL_31:
  v62.origin.x = x;
  v62.origin.y = v22;
  v62.size.width = v21;
  v62.size.height = v20;
  v66.origin.x = CGRectNull.origin.x;
  v66.origin.y = y;
  v66.size.width = width;
  v66.size.height = height;
  if (CGRectEqualToRect(v62, v66))
  {
    objc_msgSend(v10, "bounds");
    objc_msgSend(v9, "convertRect:fromLayer:", v10);
    x = v46;
    v22 = v47;
    v21 = v48;
    v20 = v49;
  }
  -[CRLInteractiveCanvasController visibleBoundsRectForTiling](self, "visibleBoundsRectForTiling");
  v67.origin.x = x;
  v67.origin.y = v22;
  v67.size.width = v21;
  v67.size.height = v20;
  v64 = CGRectIntersection(v63, v67);
  objc_msgSend(v9, "convertRect:toLayer:", v10, v64.origin.x, v64.origin.y, v64.size.width, v64.size.height);
  v51 = v50;
  v53 = v52;
  v55 = v54;
  v57 = v56;

  v58 = v51;
  v59 = v53;
  v60 = v55;
  v61 = v57;
  result.size.height = v61;
  result.size.width = v60;
  result.origin.y = v59;
  result.origin.x = v58;
  return result;
}

- (BOOL)scrollViewShouldOptOutOfUIScrollViewContentOffsetAnimationForScrollView:(id)a3
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "asiOSCVC"));
  v5 = objc_msgSend(v4, "shouldOptOutOfUIScrollViewContentOffsetAnimation");

  return v5;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
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
  double v27;
  double v28;
  double v29;
  double v30;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  void *i;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  uint64_t v57;
  void *j;
  void *v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  const __CFString *v70;
  void *v71;
  _BYTE v72[128];
  CGRect v73;
  CGRect v74;

  v4 = a3;
  -[CRLInteractiveCanvasController i_canvasDidUpdateVisibleBounds](self, "i_canvasDidUpdateVisibleBounds");
  v5 = (objc_msgSend(v4, "isDragging") & 1) != 0
    || (objc_msgSend(v4, "isDecelerating") & 1) != 0
    || self->mAnimatingScroll;
  -[CRLInteractiveCanvasController p_setCurrentlyScrolling:](self, "p_setCurrentlyScrolling:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController i_interactiveCanvasLayerHelper](self, "i_interactiveCanvasLayerHelper"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "popoutLayer"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "canvasLayer"));
    objc_msgSend(v9, "bounds");
    v11 = v10;
    v13 = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "canvasView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "canvasLayer"));
    objc_msgSend(v16, "contentInset");
    v18 = v17;
    v20 = v19;

    objc_msgSend(v4, "frame");
    v22 = v21;
    objc_msgSend(v4, "contentOffset");
    v24 = v11 + v22 - v23 - v20;
    objc_msgSend(v4, "frame");
    v26 = v25;
    objc_msgSend(v4, "contentOffset");
    v28 = v13 + v26 - v27 - v18;
    objc_msgSend(v7, "position");
    if (v30 != v24 || v29 != v28)
      objc_msgSend(v7, "setPosition:", v24, v28);
    -[CRLInteractiveCanvasController visibleBoundsRect](self, "visibleBoundsRect");
    v33 = v32;
    v35 = v34;
    v37 = v36;
    v39 = v38;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sublayers"));
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v65, v72, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v66;
      do
      {
        for (i = 0; i != v42; i = (char *)i + 1)
        {
          if (*(_QWORD *)v66 != v43)
            objc_enumerationMutation(v40);
          v45 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v45, "frame");
          v74.origin.x = v33;
          v74.origin.y = v35;
          v74.size.width = v37;
          v74.size.height = v39;
          objc_msgSend(v45, "setHidden:", !CGRectIntersectsRect(v73, v74));
        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v65, v72, 16);
      }
      while (v42);
    }

  }
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController delegate](self, "delegate"));
  v47 = objc_opt_respondsToSelector(v46, "interactiveCanvasControllerDidScroll:");

  if ((v47 & 1) != 0)
  {
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController delegate](self, "delegate"));
    objc_msgSend(v48, "interactiveCanvasControllerDidScroll:", self);

  }
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v70 = CFSTR("CRLInteractiveCanvasControllerInteractionSourceKey");
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController p_sourceInteractionSourceForNotficiationUserInfo](self, "p_sourceInteractionSourceForNotficiationUserInfo"));
  v71 = v50;
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1));
  objc_msgSend(v49, "postNotificationName:object:userInfo:", CFSTR("CRLCanvasUpdateScrollNotification"), self, v51);

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "asUIKitHost"));
  objc_msgSend(v53, "scrollViewDidScroll");

  -[CRLInteractiveCanvasController i_viewScrollDidChange](self, "i_viewScrollDidChange");
  if (-[CRLInteractiveCanvasController p_collaboratorOverlaysNeedUpdateForScroll](self, "p_collaboratorOverlaysNeedUpdateForScroll"))
  {
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable crl_allObjects](self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary, "crl_allObjects", 0));
    v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
    if (v55)
    {
      v56 = v55;
      v57 = *(_QWORD *)v62;
      do
      {
        for (j = 0; j != v56; j = (char *)j + 1)
        {
          if (*(_QWORD *)v62 != v57)
            objc_enumerationMutation(v54);
          -[CRLInteractiveCanvasController invalidateLayersForDecorator:](self, "invalidateLayersForDecorator:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)j));
        }
        v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
      }
      while (v56);
    }

  }
  if (-[CRLInteractiveCanvasController p_followEnabled](self, "p_followEnabled"))
    -[CRLInteractiveCanvasController collapseAllExpandedCollaboratorHUDs](self, "collapseAllExpandedCollaboratorHUDs");
  if (self->mCreateRepsForOffscreenLayouts)
  {
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "canvasLayer"));
    objc_msgSend(v60, "crl_setNeedsLayoutForTilingLayers");

  }
  else
  {
    -[CRLInteractiveCanvasController invalidateVisibleBounds](self, "invalidateVisibleBounds");
  }
  if (!self->mCurrentlyScrolling)
    -[CRLInteractiveCanvasController p_viewScrollingEnded](self, "p_viewScrollingEnded");

}

- (BOOL)p_collaboratorOverlaysNeedUpdateForScroll
{
  BOOL v3;
  void *v4;
  NSMutableSet *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  if (-[NSMapTable count](self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary, "count"))
    return 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController collaboratorCursorDelegate](self, "collaboratorCursorDelegate"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = self->mCurrentCollaboratorPresences;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collaboratorCursorSelectionPathForRenderer:collaboratorPresence:", self, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), (_QWORD)v16));
        if (v10)
        {
          v11 = (void *)v10;
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController selectionModelTranslator](self, "selectionModelTranslator"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "boardItemsForSelectionPath:", v11));
          v14 = objc_msgSend(v13, "count");

          if (v14)
          {
            v3 = 1;
            goto LABEL_14;
          }
        }
      }
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }
  v3 = 0;
LABEL_14:

  return v3;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  -[CRLInteractiveCanvasController p_setCurrentlyScrolling:](self, "p_setCurrentlyScrolling:", 1);
  -[CRLInteractiveCanvasController beginScrollingOperation](self, "beginScrollingOperation");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v7 = CFSTR("CRLInteractiveCanvasControllerInteractionSourceKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController p_sourceInteractionSourceForNotficiationUserInfo](self, "p_sourceInteractionSourceForNotficiationUserInfo"));
  v8 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("CRLCanvasWillScrollNotification"), self, v6);

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v5;

  if (!a4)
  {
    -[CRLInteractiveCanvasController p_setCurrentlyScrolling:](self, "p_setCurrentlyScrolling:", 0);
    -[CRLInteractiveCanvasController p_viewScrollingEnded](self, "p_viewScrollingEnded");
  }
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3));
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("CRLCanvasWillEndDraggingNotification"), self);

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  if (-[CRLInteractiveCanvasController currentlyScrolling](self, "currentlyScrolling", a3))
  {
    -[CRLInteractiveCanvasController p_setCurrentlyScrolling:](self, "p_setCurrentlyScrolling:", 0);
    -[CRLInteractiveCanvasController p_viewScrollingEnded](self, "p_viewScrollingEnded");
  }
}

- (void)contentInsetsDidChangeForScrollView:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "canvasLayer"));
  objc_msgSend(v3, "fixFrameAndScrollView");

}

- (void)scrollViewDidChangeAdjustedContentInset:(id)a3
{
  -[CRLInteractiveCanvasController p_updateUnobscuredFrame](self, "p_updateUnobscuredFrame", a3);
}

- (void)scrollView:(id)a3 willAnimateToContentOffset:(CGPoint)a4
{
  self->mAnimatingScroll = 1;
  -[CRLInteractiveCanvasController p_setCurrentlyScrolling:](self, "p_setCurrentlyScrolling:", 1, a4.x, a4.y);
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  self->mAnimatingScroll = 0;
  -[CRLInteractiveCanvasController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "p_scrollViewDidEndScrollingAnimation:", v4, 0.0);
  objc_opt_class(CRLScrollView, v5);
  v7 = sub_100221D0C(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (v8
    && -[NSMapTable count](self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary, "count")
    && !-[CRLInteractiveCanvasController scrollViewShouldOptOutOfUIScrollViewContentOffsetAnimationForScrollView:](self, "scrollViewShouldOptOutOfUIScrollViewContentOffsetAnimationForScrollView:", v8))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable crl_allObjects](self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary, "crl_allObjects", 0));
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          -[CRLInteractiveCanvasController invalidateLayersForDecorator:](self, "invalidateLayersForDecorator:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v13));
          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("CRLiOSScrollViewWillScrollToTopNotification"), v3);

  return 1;
}

- (void)scrollViewDidScrollToTop:(id)a3
{
  self->mAnimatingScroll = 0;
  -[CRLInteractiveCanvasController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "p_scrollViewDidEndScrollingAnimation:", a3, 0.0);
}

- (void)p_scrollViewDidEndScrollingAnimation:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  _BOOL8 v6;
  id v7;

  v7 = a3;
  objc_opt_class(CRLScrollView, v4);
  if ((objc_opt_isKindOfClass(v7, v5) & 1) != 0)
    -[CRLInteractiveCanvasController scrollViewDidScroll:](self, "scrollViewDidScroll:", v7);
  v6 = (objc_msgSend(v7, "isDragging") & 1) != 0
    || (objc_msgSend(v7, "isDecelerating") & 1) != 0
    || self->mAnimatingScroll;
  -[CRLInteractiveCanvasController p_setCurrentlyScrolling:](self, "p_setCurrentlyScrolling:", v6);
  if (!self->mCurrentlyScrolling)
    -[CRLInteractiveCanvasController p_viewScrollingEnded](self, "p_viewScrollingEnded");

}

- (void)p_setCurrentlyScrolling:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012552F8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E26900();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101255318);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController p_setCurrentlyScrolling:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 6605, 0, "This operation must only be performed on the main thread.");

  }
  if (self->mCurrentlyScrolling != v3)
  {
    self->mCurrentlyScrolling = v3;
    if (v3)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editingCoordinator](self, "editingCoordinator"));
      objc_msgSend(v8, "suspendCollaborationWithReason:", CFSTR("CRLCanvasScrolling"));
    }
    else
    {
      if (-[CRLInteractiveCanvasController p_areAnyCollaboratorsPresent](self, "p_areAnyCollaboratorsPresent"))
        self->mSelectionIsCurrentlyOnscreen = -[CRLInteractiveCanvasController p_currentSelectionIsOnscreen](self, "p_currentSelectionIsOnscreen");
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editingCoordinator](self, "editingCoordinator"));
      objc_msgSend(v8, "resumeCollaborationWithReason:", CFSTR("CRLCanvasScrolling"));
    }

  }
}

- (void)preprocessChanges:(id)a3 forChangeSource:(id)a4
{
  id v6;
  CRLSelectionPath *mSelectionPathToScrollTo;
  id v8;

  v8 = a3;
  v6 = a4;
  mSelectionPathToScrollTo = self->mSelectionPathToScrollTo;
  if (mSelectionPathToScrollTo
    && -[CRLInteractiveCanvasController shouldCancelScrollingToSelectionPath:forChanges:withChangeSource:](self, "shouldCancelScrollingToSelectionPath:forChanges:withChangeSource:", mSelectionPathToScrollTo, v8, v6))
  {
    self->mSelectionShouldBeClearedInDidProcessAllChanges = 1;
  }

}

- (BOOL)shouldCancelScrollingToSelectionPath:(id)a3 forChanges:(id)a4 withChangeSource:(id)a5
{
  return 1;
}

- (void)didProcessAllChanges
{
  NSObject *v3;
  CRLSelectionPath *mSelectionPathToScrollTo;
  int v5;
  CRLSelectionPath *v6;

  if (self->mSelectionShouldBeClearedInDidProcessAllChanges)
  {
    if (self->mSelectionPathToScrollTo)
    {
      if (qword_10147E368 != -1)
        dispatch_once(&qword_10147E368, &stru_101255338);
      v3 = off_1013D9068;
      if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_INFO))
      {
        mSelectionPathToScrollTo = self->mSelectionPathToScrollTo;
        v5 = 138412290;
        v6 = mSelectionPathToScrollTo;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Cancelling scroll to %@.", (uint8_t *)&v5, 0xCu);
      }
    }
    -[CRLInteractiveCanvasController cancelScrollToCurrentSelectionPathAfterLayout](self, "cancelScrollToCurrentSelectionPathAfterLayout");
    self->mSelectionShouldBeClearedInDidProcessAllChanges = 0;
  }
}

- (BOOL)selectionPathContainsOnlyInfosOnCanvas:(id)a3
{
  return 1;
}

- (void)p_updateInfosToDisplayIfNeeded
{
  void *v3;
  void *v4;
  id v5;
  _TtC8Freeform24CRLMultiselectResizeInfo *mMultiselectResizeInfo;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController board](self, "board"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "infosToDisplayForInteractiveCanvas"));
  v5 = objc_msgSend(v4, "mutableCopy");

  mMultiselectResizeInfo = self->mMultiselectResizeInfo;
  if (mMultiselectResizeInfo)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMultiselectResizeInfo parentInfo](mMultiselectResizeInfo, "parentInfo"));

    if (!v7)
      objc_msgSend(v5, "addObject:", self->mMultiselectResizeInfo);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController temporaryAdditionalBoardItemsToDisplay](self, "temporaryAdditionalBoardItemsToDisplay"));
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController temporaryAdditionalBoardItemsToDisplay](self, "temporaryAdditionalBoardItemsToDisplay"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "crl_intersectionWithArray:", v10));
    v12 = objc_msgSend(v11, "count");

    if (v12)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101255358);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E26980();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101255378);
      v13 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController p_updateInfosToDisplayIfNeeded]"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 6690, 0, "Temporary additional board items should not already be in our model!");

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController temporaryAdditionalBoardItemsToDisplay](self, "temporaryAdditionalBoardItemsToDisplay"));
    objc_msgSend(v5, "addObjectsFromArray:", v16);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController infosToDisplay](self, "infosToDisplay"));
  v18 = objc_msgSend(v17, "isEqual:", v5);

  if ((v18 & 1) == 0)
    -[CRLInteractiveCanvasController setInfosToDisplay:](self, "setInfosToDisplay:", v5);

}

- (void)processChanges:(id)a3 forChangeSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _TtC8Freeform24CRLMultiselectResizeInfo *mMultiselectResizeInfo;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;

  v6 = a3;
  v7 = a4;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101255398);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E26A00();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012553B8);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController processChanges:forChangeSource:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 6700, 0, "change notifications should only come in on the main thread");

  }
  -[CRLInteractiveCanvasController p_updateInfosToDisplayIfNeeded](self, "p_updateInfosToDisplayIfNeeded");
  if (objc_msgSend(v6, "crl_containsObjectPassingTest:", &stru_1012553F8))
    -[CRLInteractiveCanvasController recreateAllLayoutsAndReps](self, "recreateAllLayoutsAndReps");
  mMultiselectResizeInfo = self->mMultiselectResizeInfo;
  if (mMultiselectResizeInfo)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMultiselectResizeInfo representedSelectedBoardItems](mMultiselectResizeInfo, "representedSelectedBoardItems"));
    if (objc_msgSend(v12, "containsObject:", v7))
    {
      v13 = objc_msgSend(v6, "crl_containsObjectPassingTest:", &stru_101255418);

      if (!v13)
        goto LABEL_18;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController repForInfo:](self, "repForInfo:", self->mMultiselectResizeInfo));
      objc_msgSend(v12, "invalidateKnobs");
    }

  }
LABEL_18:
  if (-[CRLCanvas i_needsLayout](self->mCanvas, "i_needsLayout"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "canvasLayer"));
    objc_msgSend(v16, "setNeedsLayout");

  }
  objc_opt_class(NSObject, v14);
  v23 = sub_10022209C(v7, v17, 1, v18, v19, v20, v21, v22, (uint64_t)&OBJC_PROTOCOL___CRLCanvasElementInfo);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  if (v24)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController repsForInfo:](self, "repsForInfo:", v24));
    objc_msgSend(v25, "makeObjectsPerformSelector:withObject:", "processChanges:", v6);

  }
}

- (void)i_acquireLockAndPerformAction:(id)a3
{
  id v3;
  _QWORD *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  _BYTE v17[24];

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100366C34;
  v10[3] = &unk_101255440;
  v10[4] = self;
  v3 = a3;
  v11 = v3;
  v12 = &v13;
  v4 = objc_retainBlock(v10);
  ((void (*)(void))v4[2])();
  if (!*((_BYTE *)v14 + 24))
  {
    v5 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101255460);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E26A80();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101255480);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100E24B00(v7, (uint64_t)v17, v5);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController i_acquireLockAndPerformAction:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 6748, 0, "failed to perform locked action");

  }
  _Block_object_dispose(&v13, 8);

}

- (void)makeEditorPerformAction:(SEL)a3 withSender:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editorController](self, "editorController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "editorForEditAction:withSender:", a3, v8));

  if (v7)
    objc_msgSend(v7, "performSelector:withObject:", a3, v8);

}

- (BOOL)canPerformInteractiveAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;

  v10 = 0;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editorController](self, "editorController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "editorForEditAction:withSender:response:", a3, v6, &v10));

  return v8 != 0;
}

- (void)performDiscreteFrameChangingOperationOnDrawables:(id)a3 withBlock:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (void)setTextResponderEditorTo:(id)a3 withFlags:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  if (v6
    || !self->mPreventSettingNilEditorOnTextResponder
    && (!self->mTextInputResponderShareCount
     || (v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextInputResponder editor](self->mTextInputResponder, "editor")),
         v7,
         v6 = 0,
         !v7)))
  {
    v8 = v6;
    -[CRLTextInputResponder setEditor:withFlags:](self->mTextInputResponder, "setEditor:withFlags:", v6, a4);
    v6 = v8;
  }

}

- (void)i_textDidChange
{
  void *v3;
  void *v4;
  void *v5;

  if (-[CRLCanvas i_needsLayout](self->mCanvas, "i_needsLayout"))
  {
    if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012554A0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E26B00();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012554C0);
      v3 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController i_textDidChange]"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 6837, 0, "Don't expect to have changed text on background thread");

    }
    self->mNotifyTIRTextChangedAfterLayout = 1;
  }
}

- (void)i_selectionDidChange
{
  void *v3;
  void *v4;
  void *v5;

  if (-[CRLCanvas i_needsLayout](self->mCanvas, "i_needsLayout"))
  {
    if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012554E0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E26B80();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101255500);
      v3 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController i_selectionDidChange]"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 6850, 0, "Don't expect to have changed selection on background thread");

    }
    ++self->mNotifyTIRSelectionChangedAfterLayout;
  }
}

- (void)beginAnimations:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  CRLCanvasAnimation *v8;
  CRLCanvasAnimation *mCurrentAnimation;

  v4 = a3;
  if (self->mCurrentAnimation)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101255520);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E26C00();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101255540);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController beginAnimations:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 6866, 0, "animation nesting not yet supported");

  }
  +[CATransaction flush](CATransaction, "flush");
  +[CATransaction begin](CATransaction, "begin");
  v8 = -[CRLCanvasAnimation initWithAnimationID:]([CRLCanvasAnimation alloc], "initWithAnimationID:", v4);
  mCurrentAnimation = self->mCurrentAnimation;
  self->mCurrentAnimation = v8;

}

- (void)commitAnimations
{
  CRLCanvasAnimation *mCurrentAnimation;
  void *v4;
  void *v5;
  void *v6;

  mCurrentAnimation = self->mCurrentAnimation;
  if (!mCurrentAnimation)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101255560);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E26C80();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101255580);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController commitAnimations]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 6875, 0, "can't commit if we don't have an animation open");

    mCurrentAnimation = self->mCurrentAnimation;
  }
  self->mCurrentAnimation = 0;

  +[CATransaction commit](CATransaction, "commit");
}

- (_TtC8Freeform28CRLMathCalculationController)mathCalculationController
{
  _TtC8Freeform28CRLMathCalculationController *mMathCalculationController;
  _TtC8Freeform28CRLMathCalculationController *v4;
  _TtC8Freeform28CRLMathCalculationController *v5;

  mMathCalculationController = self->mMathCalculationController;
  if (!mMathCalculationController)
  {
    v4 = objc_alloc_init(_TtC8Freeform28CRLMathCalculationController);
    v5 = self->mMathCalculationController;
    self->mMathCalculationController = v4;

    mMathCalculationController = self->mMathCalculationController;
  }
  return mMathCalculationController;
}

- (void)i_canvasWillLayout:(id)a3
{
  double v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSMutableSet *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSMapTable *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *j;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  double x;
  double y;
  double width;
  double height;
  void *v33;
  CGAffineTransform v34[2];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  CGRect v45;
  CGRect v46;

  *(_QWORD *)&v4 = objc_opt_class(CRLFreehandDrawingTool, a2).n128_u64[0];
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController freehandDrawingToolkit](self, "freehandDrawingToolkit", v4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentTool"));
  v9 = sub_100221D0C(v6, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  if (objc_msgSend(v10, "isCurrentlyTracking"))
    objc_msgSend(v10, "doWorkBeforeCanvasLayout");
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v11 = self->mRepsToSetNeedsDisplay;
  v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v40 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController renderableForRep:](self, "renderableForRep:", v16));
        v18 = v17;
        if (v17)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "layer"));
          -[CRLInteractiveCanvasController setNeedsDisplayOnLayer:](self, "setNeedsDisplayOnLayer:", v19);

        }
        -[NSMapTable removeObjectForKey:](self->mRepsToRectsToInvalidate, "removeObjectForKey:", v16);

      }
      v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v13);
  }

  -[NSMutableSet removeAllObjects](self->mRepsToSetNeedsDisplay, "removeAllObjects");
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v20 = self->mRepsToRectsToInvalidate;
  v21 = -[NSMapTable countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(_QWORD *)v36 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)j);
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController renderableForRep:](self, "renderableForRep:", v25));
        if (v26)
        {
          memset(&v34[1], 0, sizeof(CGAffineTransform));
          if (v25)
            objc_msgSend(v25, "transformToConvertNaturalToLayerRelative");
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->mRepsToRectsToInvalidate, "objectForKey:", v25));
          if (objc_msgSend(v27, "count"))
          {
            v28 = 0;
            do
            {
              objc_msgSend(v27, "rectAtIndex:", v28);
              v34[0] = v34[1];
              v46 = CGRectApplyAffineTransform(v45, v34);
              x = v46.origin.x;
              y = v46.origin.y;
              width = v46.size.width;
              height = v46.size.height;
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "layer"));
              -[CRLInteractiveCanvasController setNeedsDisplayInRect:onLayer:](self, "setNeedsDisplayInRect:onLayer:", v33, x, y, width, height);

              ++v28;
            }
            while (v28 < (unint64_t)objc_msgSend(v27, "count"));
          }

        }
      }
      v22 = -[NSMapTable countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v22);
  }

  -[NSMapTable removeAllObjects](self->mRepsToRectsToInvalidate, "removeAllObjects");
}

- (void)i_layout
{
  void *v3;
  void *v4;
  void *v5;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012555A0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E26D00();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012555C0);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController i_layout]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 6929, 0, "i_layout should only be called by our CV, from the main thread");

  }
  -[CRLCanvas i_layoutIfNeededUpdatingLayerTree](self->mCanvas, "i_layoutIfNeededUpdatingLayerTree");
  sub_100194D2C();
}

- (void)i_viewWillBeginZooming
{
  double v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  const __CFString *v25;
  void *v26;

  -[CRLInteractiveCanvasController viewScale](self, "viewScale");
  self->mDynamicViewScale = v3;
  self->mDynamicallyZooming = 1;
  -[CRLInteractiveCanvasController p_beginZoomingOperation](self, "p_beginZoomingOperation");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController delegate](self, "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "interactiveCanvasControllerWillZoom:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController delegate](self, "delegate"));
    objc_msgSend(v6, "interactiveCanvasControllerWillZoom:", self);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v25 = CFSTR("CRLInteractiveCanvasControllerInteractionSourceKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController p_sourceInteractionSourceForNotficiationUserInfo](self, "p_sourceInteractionSourceForNotficiationUserInfo"));
  v26 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("CRLCanvasWillZoomNotification"), self, v9);

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvas topLevelReps](self->mCanvas, "topLevelReps", 0));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i), "recursivelyPerformSelectorIfImplemented:", "willBeginZooming");
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editingCoordinator](self, "editingCoordinator"));
  objc_msgSend(v15, "suspendCollaborationWithReason:", CFSTR("CRLCanvasZooming"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "canvasLayer"));
  objc_msgSend(v17, "layoutIfNeeded");

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "canvasLayer"));
  objc_msgSend(v19, "updateCanvasEdgeLayersIfNecessary");

}

- (void)i_viewIsZoomingAtPoint:(CGPoint)a3
{
  self->mZoomCenterInBounds = a3;
}

- (void)i_viewDidZoomToViewScale:(double)a3 notify:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[2];

  v4 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController delegate](self, "delegate"));
  v8 = objc_opt_respondsToSelector(v7, "interactiveCanvasControllerIsZooming:");

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController delegate](self, "delegate"));
    objc_msgSend(v9, "interactiveCanvasControllerIsZooming:", self);

  }
  if (v4)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v14[0] = CFSTR("CRLInteractiveCanvasControllerInteractionSourceKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController p_sourceInteractionSourceForNotficiationUserInfo](self, "p_sourceInteractionSourceForNotficiationUserInfo"));
    v14[1] = CFSTR("CRLInteractiveCanvasControllerViewScaleKey");
    v15[0] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
    v15[1] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 2));
    objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("CRLCanvasUpdateZoomNotification"), self, v13);

  }
  -[CRLInteractiveCanvasController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("currentViewScale"));
  self->mDynamicViewScale = a3;
  -[CRLInteractiveCanvasController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("currentViewScale"));
}

- (void)viewDidEndZooming
{
  -[CRLInteractiveCanvasController i_viewDidEndZoomingWithUserInfo:](self, "i_viewDidEndZoomingWithUserInfo:", &__NSDictionary0__struct);
}

- (void)i_viewDidEndZoomingWithUserInfo:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvas topLevelReps](self->mCanvas, "topLevelReps", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i), "recursivelyPerformSelectorIfImplemented:", "didEndZooming");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editingCoordinator](self, "editingCoordinator"));
  objc_msgSend(v10, "resumeCollaborationWithReason:", CFSTR("CRLCanvasZooming"));

  if (-[CRLInteractiveCanvasController shouldCanvasScrollingSizeGrowToFitBoardContent](self, "shouldCanvasScrollingSizeGrowToFitBoardContent"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "canvasLayer"));
    objc_msgSend(v12, "fixFrameAndScrollView");

  }
  self->mDynamicallyZooming = 0;
  -[CRLInteractiveCanvasController invalidateVisibleBounds](self, "invalidateVisibleBounds");
  -[CRLInteractiveCanvasController p_endZoomingOperation](self, "p_endZoomingOperation");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController delegate](self, "delegate"));
  v14 = objc_opt_respondsToSelector(v13, "interactiveCanvasControllerDidZoom:");

  if ((v14 & 1) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController delegate](self, "delegate"));
    objc_msgSend(v15, "interactiveCanvasControllerDidZoom:", self);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v16, "postNotificationName:object:userInfo:", CFSTR("CRLCanvasDidZoomNotification"), self, v4);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "canvasLayer"));
  objc_msgSend(v18, "updateCanvasEdgeLayersIfNecessary");

}

- (void)i_canvasContentsScaleDidChange
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *j;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];

  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController i_decorators](self, "i_decorators"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v8, "screenScaleDidChange") & 1) != 0)
          objc_msgSend(v8, "screenScaleDidChange");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v5);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvas topLevelReps](self->mCanvas, "topLevelReps", 0));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      for (j = 0; j != v11; j = (char *)j + 1)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)j), "recursivelyPerformSelector:", "screenScaleDidChange");
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v11);
  }

}

- (void)i_canvasWideGamutValueDidChange
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvas topLevelReps](self->mCanvas, "topLevelReps", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)i), "recursivelyPerformSelector:", "wideGamutValueDidChange");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)i_viewScaleDidChange
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  -[CRLInteractiveCanvasController i_canvasDidUpdateVisibleBounds](self, "i_canvasDidUpdateVisibleBounds");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvas topLevelReps](self->mCanvas, "topLevelReps", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i), "recursivelyPerformSelector:", "viewScaleDidChange");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[CRLInteractiveCanvasController layoutInvalidated](self, "layoutInvalidated");
  -[CRLInteractiveCanvasController invalidateAllLayers](self, "invalidateAllLayers");
}

- (double)i_viewScaleForProposedViewScale:(double)a3 originalViewScale:(double)a4 isFastPinch:(BOOL)a5
{
  _BOOL8 v5;
  CRLInteractiveCanvasControllerDelegate **p_mDelegate;
  id WeakRetained;
  char v11;
  id v12;
  void *v13;
  double v14;
  char v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  double v21;
  uint64_t i;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  void *j;
  double v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];

  v5 = a5;
  p_mDelegate = &self->mDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  v11 = objc_opt_respondsToSelector(WeakRetained, "canvasViewScaleForProposedViewScale:originalViewScale:");

  v12 = objc_loadWeakRetained((id *)p_mDelegate);
  v13 = v12;
  if ((v11 & 1) != 0)
  {
    objc_msgSend(v12, "canvasViewScaleForProposedViewScale:originalViewScale:", a3, a4);
    a3 = v14;

  }
  else
  {
    v15 = objc_opt_respondsToSelector(v12, "canvasViewScaleDetentsForInteractiveCanvasController:isFastPinch:");

    if ((v15 & 1) != 0)
    {
      v16 = objc_loadWeakRetained((id *)p_mDelegate);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "canvasViewScaleDetentsForInteractiveCanvasController:isFastPinch:", self, v5));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "sortedArrayUsingSelector:", "compare:"));

      if ((unint64_t)objc_msgSend(v18, "count") < 2)
      {
        v21 = 0.04;
      }
      else
      {
        v19 = objc_msgSend(v18, "count");
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet"));
        v21 = 0.04;
        if (v19 != (id)1)
        {
          for (i = 1; (id)i != v19; ++i)
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndexedSubscript:", i - 1));
            objc_msgSend(v23, "crl_CGFloatValue");
            v25 = v24;

            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndexedSubscript:", i));
            objc_msgSend(v26, "crl_CGFloatValue");
            v28 = v27;

            v29 = (v28 - v25) * 0.5;
            if (v29 <= 0.02)
            {
              if (vabdd_f64(a3, v25) >= vabdd_f64(a3, v28))
                v30 = i - 1;
              else
                v30 = i;
              objc_msgSend(v20, "addIndex:", v30);
            }
            else if (v21 > v29)
            {
              v21 = (v28 - v25) * 0.5;
            }
          }
        }
        if (objc_msgSend(v20, "count"))
        {
          v31 = objc_msgSend(v18, "mutableCopy");
          objc_msgSend(v31, "removeObjectsAtIndexes:", v20);

          v18 = v31;
        }

      }
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v32 = v18;
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      if (v33)
      {
        v34 = v33;
        v35 = *(_QWORD *)v40;
        while (2)
        {
          for (j = 0; j != v34; j = (char *)j + 1)
          {
            if (*(_QWORD *)v40 != v35)
              objc_enumerationMutation(v32);
            objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)j), "crl_CGFloatValue", (_QWORD)v39);
            if (vabdd_f64(a3, v37) < v21)
            {
              a3 = v37;
              goto LABEL_29;
            }
          }
          v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
          if (v34)
            continue;
          break;
        }
      }
LABEL_29:

    }
  }
  return a3;
}

- (CGSize)i_canvasCenterOffsetForProposedViewScale:(double)a3 originalViewScale:(double)a4
{
  CRLInteractiveCanvasControllerDelegate **p_mDelegate;
  id WeakRetained;
  char v8;
  id v9;
  double v10;
  CGFloat width;
  double v12;
  CGFloat height;
  double v14;
  double v15;
  CGSize result;

  p_mDelegate = &self->mDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  v8 = objc_opt_respondsToSelector(WeakRetained, "canvasCenterOffsetForProposedViewScale:originalViewScale:");

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)p_mDelegate);
    objc_msgSend(v9, "canvasCenterOffsetForProposedViewScale:originalViewScale:", a3, a4);
    width = v10;
    height = v12;

  }
  else
  {
    width = CGSizeZero.width;
    height = CGSizeZero.height;
  }
  v14 = width;
  v15 = height;
  result.height = v15;
  result.width = v14;
  return result;
}

- (double)i_nextCanvasViewScaleDetentForProposedViewScale:(double)a3 greater:(BOOL)a4 isFastPinch:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  CRLInteractiveCanvasControllerDelegate **p_mDelegate;
  id WeakRetained;
  char v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  char v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _QWORD v48[2];

  v5 = a5;
  v6 = a4;
  p_mDelegate = &self->mDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  v11 = objc_opt_respondsToSelector(WeakRetained, "nextCanvasViewScaleDetentForProposedViewScale:greater:");

  v12 = objc_loadWeakRetained((id *)p_mDelegate);
  v13 = v12;
  if ((v11 & 1) != 0)
  {
    objc_msgSend(v12, "nextCanvasViewScaleDetentForProposedViewScale:greater:", v6, a3);
    v15 = v14;

    return v15;
  }
  v16 = objc_opt_respondsToSelector(v12, "canvasViewScaleDetentsForInteractiveCanvasController:isFastPinch:");

  if ((v16 & 1) == 0)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "canvasLayer"));
    v40 = v39;
    if (v6)
      objc_msgSend(v39, "maximumPinchViewScale");
    else
      objc_msgSend(v39, "minimumPinchViewScale");
    v15 = v41;

    return v15;
  }
  v17 = objc_loadWeakRetained((id *)p_mDelegate);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "canvasViewScaleDetentsForInteractiveCanvasController:isFastPinch:", self, v5));

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "canvasLayer"));
  objc_msgSend(v20, "minimumPinchViewScale");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v48[0] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "canvasLayer"));
  objc_msgSend(v23, "maximumPinchViewScale");
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v48[1] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v48, 2));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "crl_arrayByAddingNonContainedObjectsFromArray:", v25));

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "sortedArrayUsingSelector:", "compare:"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectAtIndexedSubscript:", 0));
  objc_msgSend(v28, "crl_CGFloatValue");
  v30 = v29;

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v31 = v27;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v44;
    do
    {
      v35 = 0;
      v36 = v30;
      do
      {
        if (*(_QWORD *)v44 != v34)
          objc_enumerationMutation(v31);
        objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)v35), "crl_CGFloatValue", (_QWORD)v43);
        v30 = v37;
        if (v6)
        {
          if (v37 > a3)
            goto LABEL_18;
        }
        else if (v37 >= a3)
        {
          goto LABEL_19;
        }
        v35 = (char *)v35 + 1;
        v36 = v37;
      }
      while (v33 != v35);
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      v36 = v30;
    }
    while (v33);
  }
  else
  {
LABEL_18:
    v36 = v30;
  }
LABEL_19:

  return v36;
}

- (void)i_viewScrollDidChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  -[CRLInteractiveCanvasController i_canvasDidUpdateVisibleBounds](self, "i_canvasDidUpdateVisibleBounds");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "canvasLayer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "associatedBackgroundLayer"));
  objc_msgSend(v5, "setNeedsLayout");

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvas topLevelReps](self->mCanvas, "topLevelReps", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), "recursivelyPerformSelector:", "viewScrollDidChange");
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)i_viewScrollingEnded
{
  -[CRLInteractiveCanvasController i_viewScrollingEndedWithUserInfo:](self, "i_viewScrollingEndedWithUserInfo:", &__NSDictionary0__struct);
}

- (void)i_viewScrollingEndedWithUserInfo:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  id WeakRetained;
  char v11;
  id v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  -[CRLInteractiveCanvasController endScrollingOperation](self, "endScrollingOperation");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvas topLevelReps](self->mCanvas, "topLevelReps", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "recursivelyPerformSelector:", "viewScrollingEnded");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  v11 = objc_opt_respondsToSelector(WeakRetained, "interactiveCanvasControllerDidStopScrolling:");

  if ((v11 & 1) != 0)
  {
    v12 = objc_loadWeakRetained((id *)&self->mDelegate);
    objc_msgSend(v12, "interactiveCanvasControllerDidStopScrolling:", self);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v13, "postNotificationName:object:userInfo:", CFSTR("CRLCanvasDidScrollNotification"), self, v4);

}

- (void)i_recordUserViewScale
{
  void *v3;
  double v4;
  double v5;
  double v6;
  id WeakRetained;
  char v9;
  id v10;
  id v11;

  v11 = (id)objc_claimAutoreleasedReturnValue(-[CRLEditorController textInputEditor](self->mEditorController, "textInputEditor"));
  if ((objc_opt_respondsToSelector(v11, "targetPointSizeForSelectionWithViewScale:") & 1) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvas](self, "canvas"));
    objc_msgSend(v3, "viewScale");
    v5 = v4;

    objc_msgSend(v11, "targetPointSizeForSelectionWithViewScale:", v5);
    if (v6 >= 12.0 && v6 <= 72.0)
      -[CRLInteractiveCanvasController p_setTargetPointSize:](self, "p_setTargetPointSize:");
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  v9 = objc_opt_respondsToSelector(WeakRetained, "interactiveCanvasControllerDidZoomWithUserGesture:");

  if ((v9 & 1) != 0)
  {
    v10 = objc_loadWeakRetained((id *)&self->mDelegate);
    objc_msgSend(v10, "interactiveCanvasControllerDidZoomWithUserGesture:", self);

  }
}

- (void)i_repNeedsDisplay:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController i_interactiveCanvasLayerHelper](self, "i_interactiveCanvasLayerHelper"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController renderableForRep:](self, "renderableForRep:", v8));
    if (v5 && (objc_msgSend(v8, "directlyManagesLayerContent") & 1) == 0)
    {
      -[NSMutableSet addObject:](self->mRepsToSetNeedsDisplay, "addObject:", v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "canvasLayer"));
      objc_msgSend(v7, "setNeedsLayout");

    }
    else
    {
      -[CRLInteractiveCanvasController i_setNeedsDisplayIfNeededForAncestorRepOf:](self, "i_setNeedsDisplayIfNeededForAncestorRepOf:", v8);
    }

  }
}

- (void)i_repNeedsDisplay:(id)a3 inRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  void *v10;
  void *v11;
  CRLMutableRectList *v12;
  void *v13;
  void *v14;
  id v15;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v15 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController i_interactiveCanvasLayerHelper](self, "i_interactiveCanvasLayerHelper"));

  v10 = v15;
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController renderableForRep:](self, "renderableForRep:", v15));
    if (v11 && (objc_msgSend(v15, "directlyManagesLayerContent") & 1) == 0)
    {
      v12 = (CRLMutableRectList *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->mRepsToRectsToInvalidate, "objectForKey:", v15));
      if (!v12)
      {
        v12 = objc_alloc_init(CRLMutableRectList);
        -[NSMapTable setObject:forKey:](self->mRepsToRectsToInvalidate, "setObject:forKey:", v12, v15);
      }
      -[CRLMutableRectList addRect:](v12, "addRect:", x, y, width, height);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "canvasLayer"));
      objc_msgSend(v14, "setNeedsLayout");

    }
    else
    {
      -[CRLInteractiveCanvasController p_setNeedsDisplayIfNeededForAncestorRepOf:inRect:](self, "p_setNeedsDisplayIfNeededForAncestorRepOf:inRect:", v15, x, y, width, height);
    }

    v10 = v15;
  }

}

- (CRLCanvasAnimation)i_currentAnimation
{
  return self->mCurrentAnimation;
}

- (id)i_descriptionForViewScale:(double)a3 zoomMethod:(int64_t)a4
{
  void *v7;
  id WeakRetained;
  void *v9;
  double v10;
  void *v11;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v7, "descriptionForCanvasViewScale:zoomMethod:") & 1) == 0
    || (WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate),
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "descriptionForCanvasViewScale:zoomMethod:", a4, a3)),
        WeakRetained,
        !v9))
  {
    if ((objc_opt_respondsToSelector(v7, "viewScaleToDisplayForCanvasViewScale:") & 1) != 0)
    {
      objc_msgSend(v7, "viewScaleToDisplayForCanvasViewScale:", a3);
      a3 = v10;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter localizedStringFromNumber:numberStyle:](NSNumberFormatter, "localizedStringFromNumber:numberStyle:", v11, 3));

  }
  return v9;
}

- (void)p_updateCanvasSizeFromLayouts
{
  double v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  void *v10;
  unsigned int v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double width;
  double height;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  id v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  -[CRLInteractiveCanvasController defaultMinimumUnscaledCanvasSize](self, "defaultMinimumUnscaledCanvasSize");
  v3 = sub_10005FDDC();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvas](self, "canvas"));
  v11 = objc_msgSend(v10, "isAnchoredAtRight");

  v12 = 0.0;
  if (v11)
    v12 = v7;
  v13 = v3 - v12;
  if (v11)
    v14 = -1.79769313e308;
  else
    v14 = 1.79769313e308;
  -[CRLCanvas unscaledRectOfLayouts](self->mCanvas, "unscaledRectOfLayouts");
  v38.origin.x = v15;
  v38.origin.y = v16;
  v38.size.width = v17;
  v38.size.height = v18;
  v35.origin.x = v13;
  v35.origin.y = v5;
  v35.size.width = v7;
  v35.size.height = v9;
  v36 = CGRectUnion(v35, v38);
  v39.origin.x = 0.0;
  v39.origin.y = 0.0;
  v39.size.width = v14;
  v39.size.height = 1.79769313e308;
  v37 = CGRectIntersection(v36, v39);
  width = v37.size.width;
  height = v37.size.height;
  -[CRLInteractiveCanvasController canvasScrollingOutset](self, "canvasScrollingOutset", v37.origin.x, v37.origin.y);
  v22 = sub_1000603D0(width, height, v21);
  v24 = v23;
  if (-[CRLInteractiveCanvasController isInDynamicOperation](self, "isInDynamicOperation"))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "canvasLayer"));
    objc_msgSend(v26, "unscaledSize");
    v28 = v27;

    if (v28 >= v22)
      v22 = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "canvasLayer"));
    objc_msgSend(v30, "unscaledSize");
    v32 = v31;

    if (v32 >= v24)
      v24 = v32;
  }
  v34 = (id)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "canvasLayer"));
  objc_msgSend(v33, "setUnscaledSize:", v22, v24);

}

- (BOOL)i_isRepContentPlatformView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController i_interactiveCanvasLayerHelper](self, "i_interactiveCanvasLayerHelper"));

  if (!v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012555E0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E26D80();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101255600);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController i_isRepContentPlatformView:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 7289, 0, "invalid nil value for '%{public}s'", "self.i_interactiveCanvasLayerHelper");

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController i_interactiveCanvasLayerHelper](self, "i_interactiveCanvasLayerHelper"));
  v10 = objc_msgSend(v9, "isRepContentPlatformView:", v4);

  return v10;
}

- (void)i_drawRepWithReadLock:(id)a3 inContext:(CGContext *)a4 forLayer:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  CGAffineTransform v20;
  CGAffineTransform transform;

  v7 = a3;
  v8 = a5;
  if (v7)
  {
    if (a4)
      goto LABEL_22;
    goto LABEL_13;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101255620);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E26E98();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101255640);
  v9 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController i_drawRepWithReadLock:inContext:forLayer:]"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 7294, 0, "invalid nil value for '%{public}s'", "rep");

  if (!a4)
  {
LABEL_13:
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101255660);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E26E0C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101255680);
    v12 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController i_drawRepWithReadLock:inContext:forLayer:]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 7295, 0, "invalid nil value for '%{public}s'", "ctx");

  }
LABEL_22:
  CGContextSaveGState(a4);
  objc_msgSend(v7, "setupForDrawingInLayer:context:", v8, a4);
  if (objc_msgSend(v7, "drawsDescendantsIntoLayer"))
  {
    CGContextSaveGState(a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layout"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "geometry"));
    v17 = v16;
    if (v16)
      objc_msgSend(v16, "transform");
    else
      memset(&v20, 0, sizeof(v20));
    CGAffineTransformInvert(&transform, &v20);
    CGContextConcatCTM(a4, &transform);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "childrenToExcludeWhenDrawingDescendantsIntoLayer"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1003699E4;
    v19[3] = &unk_1012318E8;
    v19[4] = v18;
    objc_msgSend(v7, "recursivelyDrawInContext:keepingChildrenPassingTest:", a4, v19);
    CGContextRestoreGState(a4);

  }
  else
  {
    objc_msgSend(v7, "drawInLayerContext:", a4);
  }
  objc_msgSend(v7, "didDrawInLayer:context:", v8, a4);
  CGContextRestoreGState(a4);

}

- (void)p_viewScrollingEnded
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v5 = CFSTR("CRLInteractiveCanvasControllerInteractionSourceKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController p_sourceInteractionSourceForNotficiationUserInfo](self, "p_sourceInteractionSourceForNotficiationUserInfo"));
  v6 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));
  -[CRLInteractiveCanvasController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "i_viewScrollingEndedWithUserInfo:", v4, 0.0);

}

- (void)p_textGesturesWillBeginNotification:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  CRLInteractiveCanvasController *v12;

  v4 = a3;
  *(_QWORD *)&v6 = objc_opt_class(CRLInteractiveCanvasController, v5).n128_u64[0];
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo", v6));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CRLTextGesturesICC")));
  v11 = sub_100221D0C(v8, v10);
  v12 = (CRLInteractiveCanvasController *)objc_claimAutoreleasedReturnValue(v11);

  if (v12 == self)
    *(_DWORD *)&self->mTextGesturesInFlight = 1;

}

- (void)p_textGesturesDidEndNotification:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  CRLInteractiveCanvasController *v12;
  id WeakRetained;
  char v14;
  id v15;
  unsigned int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  CRLSelectionPath *mSelectionPathToScrollTo;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *i;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];

  v4 = a3;
  *(_QWORD *)&v6 = objc_opt_class(CRLInteractiveCanvasController, v5).n128_u64[0];
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo", v6));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CRLTextGesturesICC")));
  v11 = sub_100221D0C(v8, v10);
  v12 = (CRLInteractiveCanvasController *)objc_claimAutoreleasedReturnValue(v11);

  if (v12 == self)
  {
    self->mTextGesturesInFlight = 0;
    if (self->mSelectionDidChangeDuringTextGestures)
    {
      self->mSelectionDidChangeDuringTextGestures = 0;
      WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
      v14 = objc_opt_respondsToSelector(WeakRetained, "allowTextEditingToBegin");

      if ((v14 & 1) == 0
        || (v15 = objc_loadWeakRetained((id *)&self->mDelegate),
            v16 = objc_msgSend(v15, "allowTextEditingToBegin"),
            v15,
            v16))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "asiOSCVC"));

        if (objc_msgSend(v18, "preserveEditorSelection"))
          v19 = 128;
        else
          v19 = 0;
        -[CRLInteractiveCanvasController p_selectionDoneChangingWithFlags:](self, "p_selectionDoneChangingWithFlags:", v19);

      }
      if (self->mDidSuppressScrollToSelectionDuringTextGestures)
      {
        mSelectionPathToScrollTo = self->mSelectionPathToScrollTo;
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editorController](self, "editorController"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "selectionPath"));
        LODWORD(mSelectionPathToScrollTo) = -[CRLSelectionPath isEqual:](mSelectionPathToScrollTo, "isEqual:", v22);

        if ((_DWORD)mSelectionPathToScrollTo)
        {
          v23 = self->mOptionsForScrollingToSelection | 0x100;
        }
        else
        {
          if (self->mShouldAnimateScrollAfterTextGestures)
            v23 = 257;
          else
            v23 = 256;
          if (-[CRLInteractiveCanvasController shouldZoomOnSelectionChange](self, "shouldZoomOnSelectionChange"))
            v23 |= 2uLL;
        }
        -[CRLInteractiveCanvasController layoutInvalidated](self, "layoutInvalidated");
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editorController](self, "editorController"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "selectionPath"));
        -[CRLInteractiveCanvasController scrollToSelectionPath:scrollOptions:](self, "scrollToSelectionPath:scrollOptions:", v25, v23);

      }
    }
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvas topLevelReps](self->mCanvas, "topLevelReps", 0));
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v28; i = (char *)i + 1)
        {
          if (*(_QWORD *)v32 != v29)
            objc_enumerationMutation(v26);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i), "recursivelyPerformSelectorIfImplemented:withObject:", "gesturesDidEnd:", v4);
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v28);
    }

  }
}

- (void)p_selectionPathDidChangeFromSelectionPath:(id)a3 toSelectionPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *j;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController selectionModelTranslator](self, "selectionModelTranslator"));
  v9 = v8;
  if (v6)
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "infosForSelectionPath:", v6));
  else
    v10 = objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  v11 = (void *)v10;
  v30 = v7;
  v31 = v6;
  v29 = v9;
  if (v7)
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "infosForSelectionPath:", v7));
  else
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "crl_setBySubtractingSet:", v11));
  v28 = v11;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "crl_setBySubtractingSet:", v13));
  v27 = v14;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "setByAddingObjectsFromSet:"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController p_infosByAddingAllAncestors:](self, "p_infosByAddingAllAncestors:"));
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v18)
          objc_enumerationMutation(v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController repsForInfo:](self, "repsForInfo:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i)));
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v33;
          do
          {
            for (j = 0; j != v22; j = (char *)j + 1)
            {
              if (*(_QWORD *)v33 != v23)
                objc_enumerationMutation(v20);
              -[CRLInteractiveCanvasController invalidateOverlayLayersForRep:](self, "invalidateOverlayLayersForRep:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)j));
            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          }
          while (v22);
        }

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v17);
  }
  if (self->mTextGesturesInFlight)
    self->mSelectionDidChangeDuringTextGestures = 1;
  -[CRLInteractiveCanvasController sendRealTimeEnterToPeersIfNecessary](self, "sendRealTimeEnterToPeersIfNecessary");
  -[CRLInteractiveCanvasController sendSelectionPathToPeersIfNecessary](self, "sendSelectionPathToPeersIfNecessary");

}

- (id)p_infosByAddingAllAncestors:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  objc_class *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  void *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v33;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v33 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)v9), "parentInfo"));
        objc_opt_class(NSObject, v11);
        v18 = sub_1002220C8(v10, v12, 1, v13, v14, v15, v16, v17, (uint64_t)&OBJC_PROTOCOL___CRLCanvasElementInfo);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

        if (v19)
        {
          do
          {
            objc_msgSend(v4, "addObject:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "parentInfo"));
            objc_opt_class(NSObject, v21);
            v28 = sub_1002220C8(v20, v22, 1, v23, v24, v25, v26, v27, (uint64_t)&OBJC_PROTOCOL___CRLCanvasElementInfo);
            v29 = objc_claimAutoreleasedReturnValue(v28);

            v19 = (void *)v29;
          }
          while (v29);
        }
        v9 = (char *)v9 + 1;
      }
      while (v9 != v7);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v7);
  }

  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "setByAddingObjectsFromSet:", v4));
  return v30;
}

- (void)p_selectionDoneChangingWithFlags:(unint64_t)a3
{
  CRLInteractiveCanvasControllerDelegate **p_mDelegate;
  id WeakRetained;
  char v6;
  id v7;

  p_mDelegate = &self->mDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  v6 = objc_opt_respondsToSelector(WeakRetained, "selectionPathDidChangeWithFlags:");

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_mDelegate);
    objc_msgSend(v7, "selectionPathDidChangeWithFlags:", a3);

  }
}

- (double)defaultTargetPointSize
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  objc_msgSend(v2, "pointSize");
  v4 = v3;

  return v4;
}

- (double)targetPointSize
{
  void *v3;
  float v4;
  float v5;
  double result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v3, "floatForKey:", CFSTR("TSDTargetPointSize"));
  v5 = v4;

  if (v5 != 0.0)
    return v5;
  -[CRLInteractiveCanvasController defaultTargetPointSize](self, "defaultTargetPointSize");
  return result;
}

- (void)p_setTargetPointSize:(double)a3
{
  double v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setFloat:forKey:", CFSTR("TSDTargetPointSize"), v4);

}

- (CGRect)outsetSelectionRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect v11;
  CGRect v12;
  CGRect v13;
  CGRect result;
  CGRect v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectIsNull(a3))
  {
    v15.origin.x = CGRectZero.origin.x;
    v15.origin.y = CGRectZero.origin.y;
    v15.size.width = CGRectZero.size.width;
    v15.size.height = CGRectZero.size.height;
    v11.origin.x = x;
    v11.origin.y = y;
    v11.size.width = width;
    v11.size.height = height;
    if (!CGRectEqualToRect(v11, v15))
    {
      v12.origin.x = x;
      v12.origin.y = y;
      v12.size.width = width;
      v12.size.height = height;
      v13 = CGRectInset(v12, -15.0, -15.0);
      x = v13.origin.x;
      y = v13.origin.y;
      width = v13.size.width;
      height = v13.size.height;
    }
  }
  v7 = x;
  v8 = y;
  v9 = width;
  v10 = height;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (void)i_setNeedsDisplayIfNeededForAncestorRepOf:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "clipRect");
  if (-[CRLInteractiveCanvasController p_setNeedsDisplayIfNeededForAncestorRepOf:inRect:](self, "p_setNeedsDisplayIfNeededForAncestorRepOf:inRect:", v4))
  {
    -[NSMutableSet addObject:](self->mRepsDrawnIntoAncestorToSetNeedsDisplayOnUpdatedGeometry, "addObject:", v4);
  }

}

- (BOOL)p_setNeedsDisplayIfNeededForAncestorRepOf:(id)a3 inRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ancestorRepForDrawingIntoLayer"));
  if (v10)
  {
    -[CRLInteractiveCanvasController p_convertNeedsDisplayRect:fromRep:toRepForDrawing:](self, "p_convertNeedsDisplayRect:fromRep:toRepForDrawing:", v9, v10, x, y, width, height);
    -[CRLInteractiveCanvasController i_repNeedsDisplay:inRect:](self, "i_repNeedsDisplay:inRect:", v10);
  }

  return v10 != 0;
}

- (CGRect)p_convertNeedsDisplayRect:(CGRect)a3 fromRep:(id)a4 toRepForDrawing:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  void *v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGAffineTransform v31;
  CGAffineTransform v32;
  CGAffineTransform v33;
  CGAffineTransform v34;
  CGAffineTransform v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  memset(&v35, 0, sizeof(v35));
  v10 = a5;
  v11 = a4;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layout"));
  v13 = v12;
  if (v12)
    objc_msgSend(v12, "transform");
  else
    memset(&v35, 0, sizeof(v35));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "parentRep"));
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "layout"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "geometryInRoot"));
    v17 = v16;
    if (v16)
    {
      v33 = v35;
      objc_msgSend(v16, "transformByConcatenatingTransformTo:", &v33);
    }
    else
    {
      memset(&v34, 0, sizeof(v34));
    }
    v35 = v34;

  }
  v34 = v35;
  v36.origin.x = x;
  v36.origin.y = y;
  v36.size.width = width;
  v36.size.height = height;
  v37 = CGRectApplyAffineTransform(v36, &v34);
  v18 = v37.origin.x;
  v19 = v37.origin.y;
  v20 = v37.size.width;
  v21 = v37.size.height;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layout"));

  if (v22)
    objc_msgSend(v22, "transformInRoot");
  else
    memset(&v31, 0, sizeof(v31));
  CGAffineTransformInvert(&v32, &v31);
  v38.origin.x = v18;
  v38.origin.y = v19;
  v38.size.width = v20;
  v38.size.height = v21;
  v39 = CGRectApplyAffineTransform(v38, &v32);
  v23 = v39.origin.x;
  v24 = v39.origin.y;
  v25 = v39.size.width;
  v26 = v39.size.height;

  v27 = v23;
  v28 = v24;
  v29 = v25;
  v30 = v26;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (void)p_consumeRepsDrawnIntoAncestorToSetNeedsDisplayOnUpdatedGeometry
{
  id v3;
  NSMutableSet *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CRLMutableRectList *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *j;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  double x;
  double y;
  double width;
  double height;
  void *v33;
  CGAffineTransform v34[2];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  CGRect v45;
  CGRect v46;

  v3 = objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 0);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v4 = self->mRepsDrawnIntoAncestorToSetNeedsDisplayOnUpdatedGeometry;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v40 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ancestorRepForDrawingIntoLayer"));
        if (v10)
        {
          objc_msgSend(v9, "clipRect");
          -[CRLInteractiveCanvasController p_convertNeedsDisplayRect:fromRep:toRepForDrawing:](self, "p_convertNeedsDisplayRect:fromRep:toRepForDrawing:", v9, v10);
          v12 = v11;
          v14 = v13;
          v16 = v15;
          v18 = v17;
          v19 = (CRLMutableRectList *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", v10));
          if (!v19)
          {
            v19 = objc_alloc_init(CRLMutableRectList);
            objc_msgSend(v3, "setObject:forKey:", v19, v10);
          }
          -[CRLMutableRectList addRect:](v19, "addRect:", v12, v14, v16, v18);

        }
      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v6);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v20 = v3;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(_QWORD *)v36 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)j);
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController renderableForRep:](self, "renderableForRep:", v25));
        if (v26)
        {
          memset(&v34[1], 0, sizeof(CGAffineTransform));
          if (v25)
            objc_msgSend(v25, "transformToConvertNaturalToLayerRelative");
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKey:", v25));
          if (objc_msgSend(v27, "count"))
          {
            v28 = 0;
            do
            {
              objc_msgSend(v27, "rectAtIndex:", v28);
              v34[0] = v34[1];
              v46 = CGRectApplyAffineTransform(v45, v34);
              x = v46.origin.x;
              y = v46.origin.y;
              width = v46.size.width;
              height = v46.size.height;
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "layer"));
              -[CRLInteractiveCanvasController setNeedsDisplayInRect:onLayer:](self, "setNeedsDisplayInRect:onLayer:", v33, x, y, width, height);

              ++v28;
            }
            while (v28 < (unint64_t)objc_msgSend(v27, "count"));
          }

        }
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v22);
  }

  -[NSMutableSet removeAllObjects](self->mRepsDrawnIntoAncestorToSetNeedsDisplayOnUpdatedGeometry, "removeAllObjects");
}

- (void)animateToViewScale:(double)a3 contentOffset:(CGPoint)a4 duration:(double)a5 orientation:(int64_t)a6 completionHandler:(id)a7
{
  double y;
  double x;
  void (**v12)(id, uint64_t);
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  unsigned __int8 v42;
  double v43;
  double v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  _QWORD *v50;
  id v51;
  id v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  double v56;
  _QWORD v57[4];
  id v58;
  id v59;
  CRLInteractiveCanvasController *v60;
  void (**v61)(id, uint64_t);
  double v62;
  double v63;
  double v64;
  _QWORD v65[5];
  id v66;
  id v67;
  id v68;
  id v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  CGFloat v75;
  CGFloat v76;
  uint64_t v77;
  uint64_t v78;
  double v79;
  CGAffineTransform v80;
  CGAffineTransform v81;
  CGAffineTransform v82;
  CGAffineTransform v83;

  y = a4.y;
  x = a4.x;
  v12 = (void (**)(id, uint64_t))a7;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "canvasLayer"));
  objc_msgSend(v14, "viewScale");
  if (v15 == a3)
  {
    -[CRLInteractiveCanvasController contentOffset](self, "contentOffset");
    v17 = v16;
    v19 = v18;

    if (x == v17 && y == v19)
    {
      if (v12)
        v12[2](v12, 1);
      goto LABEL_28;
    }
  }
  else
  {

  }
  -[CRLInteractiveCanvasController clampedUnscaledContentOffset:forViewScale:](self, "clampedUnscaledContentOffset:forViewScale:", x, y, a3);
  v22 = v21;
  v23 = v20;
  if (v21 == x && v20 == y)
  {
    v22 = x;
    v23 = y;
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012556A0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E26F24();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012556C0);
    v24 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController animateToViewScale:contentOffset:duration:orientation:completionHandler:]"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v25, v26, 7617, 0, "Content offset was outside the expected range! Clamping to a possibly sane value.");

  }
  if (self->mAnimatingViewScale)
  {
    if (v12)
      v12[2](v12, 0);
  }
  else
  {
    v56 = a5;
    self->mAnimatingViewScale = 1;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController layerHost](self, "layerHost"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "canvasView"));

    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "canvasLayer"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "enclosingScrollView"));
    -[CRLInteractiveCanvasController i_viewWillBeginZooming](self, "i_viewWillBeginZooming");
    objc_msgSend(v29, "bounds");
    v32 = v31;
    v34 = v33;
    objc_msgSend(v29, "contentInset");
    v36 = v35;
    v38 = v37;
    v54 = v40;
    v55 = v39;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvas](self, "canvas"));
    v42 = objc_msgSend(v41, "isAnchoredAtRight");

    if ((v42 & 1) == 0)
    {
      memset(&v83, 0, sizeof(v83));
      CGAffineTransformMakeTranslation(&v83, -v32, -v34);
      v81 = v83;
      CGAffineTransformTranslate(&v82, &v81, v38, v36);
      v83 = v82;
      v80 = v82;
      objc_msgSend(v28, "setTransform:", &v80);
      objc_msgSend(v29, "bounds");
      v44 = v43;
      objc_msgSend(v29, "bounds");
      objc_msgSend(v29, "setBounds:", v38, v36, v44);
    }
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController p_sourceInteractionSourceForNotficiationUserInfo](self, "p_sourceInteractionSourceForNotficiationUserInfo"));
    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472;
    v65[2] = sub_10036AFF8;
    v65[3] = &unk_1012556E8;
    v65[4] = self;
    v70 = a3;
    v46 = v30;
    v66 = v46;
    v47 = v28;
    v67 = v47;
    v71 = v32;
    v72 = v34;
    v48 = v29;
    v68 = v48;
    v73 = v22;
    v74 = v23;
    v75 = v36;
    v76 = v38;
    v77 = v55;
    v78 = v54;
    v79 = v56;
    v49 = v45;
    v69 = v49;
    v50 = objc_retainBlock(v65);
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_10036B3B0;
    v57[3] = &unk_101255710;
    v51 = v47;
    v58 = v51;
    v52 = v48;
    v59 = v52;
    v60 = self;
    v62 = a3;
    v63 = v22;
    v64 = v23;
    v61 = v12;
    v53 = objc_retainBlock(v57);
    if (v56 <= 0.0)
    {
      ((void (*)(_QWORD *))v50[2])(v50);
      ((void (*)(_QWORD *, uint64_t))v53[2])(v53, 1);
    }
    else
    {
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v50, v53, v56);
    }

  }
LABEL_28:

}

+ (double)defaultAutoZoomAnimationDuration
{
  return 0.300000012;
}

- (void)doubleTappedCanvasBackgroundAtPoint:(CGPoint)a3
{
  double y;
  double x;
  CRLInteractiveCanvasControllerDelegate **p_mDelegate;
  id WeakRetained;
  char v7;
  id v8;

  y = a3.y;
  x = a3.x;
  p_mDelegate = &self->mDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  v7 = objc_opt_respondsToSelector(WeakRetained, "doubleTappedCanvasBackgroundAtPoint:");

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_mDelegate);
    objc_msgSend(v8, "doubleTappedCanvasBackgroundAtPoint:", x, y);

  }
}

- (BOOL)shouldCanvasScrollingSizeGrowToFitBoardContent
{
  return self->_shouldCanvasScrollingSizeGrowToFitBoardContent;
}

- (void)setShouldCanvasScrollingSizeGrowToFitBoardContent:(BOOL)a3
{
  self->_shouldCanvasScrollingSizeGrowToFitBoardContent = a3;
}

- (BOOL)isTearingDown
{
  return self->mIsTearingDown;
}

- (void)setIsTearingDown:(BOOL)a3
{
  self->mIsTearingDown = a3;
}

- (BOOL)hasBeenTornDown
{
  return self->mHasBeenTornDown;
}

- (void)setHasBeenTornDown:(BOOL)a3
{
  self->mHasBeenTornDown = a3;
}

- (_TtC8Freeform19CRLCanvasBackground)canvasBackground
{
  return self->mCanvasBackground;
}

- (BOOL)versionFidelityAlertWasShownIsValid
{
  return self->mVersionFidelityAlertWasShownIsValid;
}

- (void)setVersionFidelityAlertWasShownIsValid:(BOOL)a3
{
  self->mVersionFidelityAlertWasShownIsValid = a3;
}

- (unint64_t)versionFidelityAlertWasShown
{
  return self->mVersionFidelityAlertWasShown;
}

- (void)setVersionFidelityAlertWasShown:(unint64_t)a3
{
  self->mVersionFidelityAlertWasShown = a3;
}

- (CRLPKDrawingProvider)pkDrawingProvider
{
  return self->mPKDrawingProvider;
}

- (CRLCanvasLayerHosting)layerHost
{
  return (CRLCanvasLayerHosting *)objc_loadWeakRetained((id *)&self->mLayerHost);
}

- (CRLCanvas)canvas
{
  return self->mCanvas;
}

- (CRLInteractiveCanvasControllerDelegate)delegate
{
  return (CRLInteractiveCanvasControllerDelegate *)objc_loadWeakRetained((id *)&self->mDelegate);
}

- (CRLCollaboratorCursorRendererDelegate)collaboratorCursorDelegate
{
  return (CRLCollaboratorCursorRendererDelegate *)objc_loadWeakRetained((id *)&self->mCollaboratorCursorDelegate);
}

- (void)setCollaboratorCursorDelegate:(id)a3
{
  objc_storeWeak((id *)&self->mCollaboratorCursorDelegate, a3);
}

- (BOOL)shouldSuppressRendering
{
  return self->mShouldSuppressRendering;
}

- (BOOL)animatingViewScale
{
  return self->mAnimatingViewScale;
}

- (BOOL)displaysMultiselectionWithSingleBounds
{
  return self->mDisplaysMultiselectionWithSingleBounds;
}

- (void)setDisplaysMultiselectionWithSingleBounds:(BOOL)a3
{
  self->mDisplaysMultiselectionWithSingleBounds = a3;
}

- (BOOL)textGesturesInFlight
{
  return self->mTextGesturesInFlight;
}

- (void)setTextGesturesInFlight:(BOOL)a3
{
  self->mTextGesturesInFlight = a3;
}

- (CRLFreehandDrawingToolkit)freehandDrawingToolkit
{
  return self->mFreehandDrawingToolkit;
}

- (BOOL)resizeCanvasOnLayout
{
  return self->mResizeCanvasOnLayout;
}

- (void)setResizeCanvasOnLayout:(BOOL)a3
{
  self->mResizeCanvasOnLayout = a3;
}

- (void)setCanvasEditor:(id)a3
{
  objc_storeStrong((id *)&self->mCanvasEditor, a3);
}

- (_TtC8Freeform21CRLTextInputResponder)textInputResponder
{
  return self->mTextInputResponder;
}

- (BOOL)preventSettingNilEditorOnTextResponder
{
  return self->mPreventSettingNilEditorOnTextResponder;
}

- (void)setPreventSettingNilEditorOnTextResponder:(BOOL)a3
{
  self->mPreventSettingNilEditorOnTextResponder = a3;
}

- (BOOL)isDraggingToInsertBoardItems
{
  return self->mIsDraggingToInsertBoardItems;
}

- (void)setIsDraggingToInsertBoardItems:(BOOL)a3
{
  self->mIsDraggingToInsertBoardItems = a3;
}

- (BOOL)isDiscardingEdits
{
  return self->mDiscardingEdits;
}

- (BOOL)createRepsForOffscreenLayouts
{
  return self->mCreateRepsForOffscreenLayouts;
}

- (void)setCreateRepsForOffscreenLayouts:(BOOL)a3
{
  self->mCreateRepsForOffscreenLayouts = a3;
}

- (BOOL)currentlyScrolling
{
  return self->mCurrentlyScrolling;
}

- (void)setUnobscuredScrollViewFrame:(CGRect)a3
{
  self->mUnobscuredScrollViewFrame = a3;
}

- (BOOL)connectorKnobsEnabled
{
  return self->mConnectorKnobsEnabled;
}

- (void)setConnectorKnobsEnabled:(BOOL)a3
{
  self->mConnectorKnobsEnabled = a3;
}

- (NSArray)temporaryAdditionalBoardItemsToDisplay
{
  return self->_temporaryAdditionalBoardItemsToDisplay;
}

- (CGRect)p_visibleBoundsRectForTiling
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->mVisibleBoundsRectForTiling, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setP_visibleBoundsRectForTiling:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->mVisibleBoundsRectForTiling, &v3, 32, 1, 0);
}

- (CGRect)p_visibleUnscaledRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->mVisibleUnscaledRect, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setP_visibleUnscaledRect:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->mVisibleUnscaledRect, &v3, 32, 1, 0);
}

- (BOOL)shouldSuppressFreehandContent
{
  return self->_shouldSuppressFreehandContent;
}

- (BOOL)overlayLayerSuppressed
{
  return self->mOverlayLayerSuppressed;
}

- (BOOL)showGrayOverlay
{
  return self->mShowGrayOverlay;
}

- (BOOL)suppressesCollaboratorHUD
{
  return self->mSuppressesCollaboratorHUD;
}

- (void)setSuppressesCollaboratorHUD:(BOOL)a3
{
  self->mSuppressesCollaboratorHUD = a3;
}

- (BOOL)documentIsSharedReadOnly
{
  return self->mDocumentIsSharedReadOnly;
}

- (BOOL)allowsSelectionKnobs
{
  return self->mAllowsSelectionKnobs;
}

- (BOOL)allowsSelectionHighlight
{
  return self->mAllowsSelectionHighlight;
}

- (BOOL)showInvisibleObjects
{
  return self->mShowInvisibleObjects;
}

- (BOOL)floatingCursorInMotion
{
  return self->_floatingCursorInMotion;
}

- (void)setFloatingCursorInMotion:(BOOL)a3
{
  self->_floatingCursorInMotion = a3;
}

- (CRLSearchReference)primaryFindResultSearchReference
{
  return self->_primaryFindResultSearchReference;
}

- (NSMapTable)searchReferencesToHighlight
{
  return self->_searchReferencesToHighlight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchReferencesToHighlight, 0);
  objc_storeStrong((id *)&self->_primaryFindResultSearchReference, 0);
  objc_storeStrong((id *)&self->_temporaryAdditionalBoardItemsToDisplay, 0);
  objc_storeStrong((id *)&self->mFreehandDrawingToolkit, 0);
  objc_storeStrong((id *)&self->mMathCalculationController, 0);
  objc_storeStrong((id *)&self->mPKDrawingProvider, 0);
  objc_storeStrong((id *)&self->mCanvasBackground, 0);
  objc_storeStrong((id *)&self->mVisibleCollaboratorPresences, 0);
  objc_storeStrong((id *)&self->mSelectionPathToScrollTo, 0);
  objc_storeStrong((id *)&self->mBackgroundRenderingObjects, 0);
  objc_storeStrong((id *)&self->mCurrentInteractionSource, 0);
  objc_storeStrong((id *)&self->mLayersWithZoomFadeAnimation, 0);
  objc_storeStrong((id *)&self->mBlocksToPerformOnMainThreadWithValidLayouts, 0);
  objc_storeStrong((id *)&self->mNotificationsToPostWithValidLayouts, 0);
  objc_storeStrong((id *)&self->mRepsToHideForCurrentTracker, 0);
  objc_storeStrong((id *)&self->mGestureDispatcher, 0);
  objc_storeStrong((id *)&self->mLayoutsShowingCollabCursorsDuringLayerUpdate, 0);
  objc_storeStrong((id *)&self->mInfosPreviouslyShowingCollabCursors, 0);
  objc_storeStrong((id *)&self->mCollaboratorPresenceToCollaboratorHUDControllerDictionaryForFastSizing, 0);
  objc_storeStrong((id *)&self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary, 0);
  objc_storeStrong((id *)&self->mCurrentCollaboratorPresences, 0);
  objc_storeStrong((id *)&self->mMultiselectResizeInfo, 0);
  objc_storeStrong((id *)&self->mDynOpController, 0);
  objc_storeStrong((id *)&self->mTMCoordinator, 0);
  objc_storeStrong((id *)&self->mCurrentAnimation, 0);
  objc_storeStrong((id *)&self->mLiveSyncDecorator, 0);
  objc_storeStrong((id *)&self->mSelectionHighlightColor, 0);
  objc_storeStrong((id *)&self->mDecoratorsWithInvalidLayers, 0);
  objc_storeStrong((id *)&self->mDecorators, 0);
  objc_storeStrong((id *)&self->mRepsDrawnIntoAncestorToSetNeedsDisplayOnUpdatedGeometry, 0);
  objc_storeStrong((id *)&self->mRepsToRectsToInvalidate, 0);
  objc_storeStrong((id *)&self->mRepsToSetNeedsDisplay, 0);
  objc_storeStrong((id *)&self->mNumberFormatter, 0);
  objc_storeStrong((id *)&self->mUnitFormatter, 0);
  objc_storeStrong((id *)&self->mTextInputResponderSource, 0);
  objc_storeStrong((id *)&self->mGuideController, 0);
  objc_storeStrong((id *)&self->mEditorController, 0);
  objc_destroyWeak(&self->mObservedDocumentRoot);
  objc_destroyWeak((id *)&self->mLayerHost);
  objc_storeStrong((id *)&self->mCanvas, 0);
  objc_storeStrong((id *)&self->mTextInputResponder, 0);
  objc_storeStrong((id *)&self->mCanvasEditor, 0);
  objc_storeStrong((id *)&self->mLayerUpdater, 0);
  objc_destroyWeak((id *)&self->mDelegate);
  objc_destroyWeak((id *)&self->mCollaboratorCursorDelegate);
}

- (BOOL)p_accessibilityShouldCheckAncestorCanPerformAction:(SEL)a3 withSender:(id)a4
{
  return NSSelectorFromString(CFSTR("_accessibilitySpeak:")) == a3
      || NSSelectorFromString(CFSTR("_accessibilityPauseSpeaking:")) == a3;
}

- (CRLCanvasRep)repForTextEditingInspecting
{
  CRLInteractiveCanvasController *v2;
  id v3;

  v2 = self;
  v3 = sub_100B65674();

  return (CRLCanvasRep *)v3;
}

- (BOOL)anyConnectorKnobVisible
{
  CRLInteractiveCanvasController *v2;
  char v3;
  char v4;

  v2 = self;
  CRLInteractiveCanvasController.anyConnectorKnobVisible.getter();
  v4 = v3;

  return v4 & 1;
}

- (void)animateIntoConnectorMode
{
  CRLInteractiveCanvasController *v2;

  v2 = self;
  sub_100C59550();

}

- (CRLConnectionLineAbstractLayout)highestZOrderConnectionLineLayoutAcrossBoard
{
  CRLInteractiveCanvasController *v2;
  void *v3;

  v2 = self;
  v3 = sub_100C59BB0();

  return (CRLConnectionLineAbstractLayout *)v3;
}

- (void)sendSelectionPathToPeersIfNecessary
{
  CRLInteractiveCanvasController *v2;

  v2 = self;
  sub_100C59F14();

}

- (void)sendRealTimeEnterToPeersIfNecessary
{
  CRLInteractiveCanvasController *v2;

  v2 = self;
  sub_100C5ADA0();

}

- (BOOL)wantsToSuppressMultiselectionForPenTool
{
  CRLInteractiveCanvasController *v2;
  char v3;

  v2 = self;
  v3 = sub_100C5B3A0();

  return v3 & 1;
}

- (BOOL)sendViewportRequestMessageTo:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  CRLInteractiveCanvasController *v9;
  uint64_t v11;

  v5 = type metadata accessor for UUID(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  LOBYTE(a3) = sub_100C5B5A4(v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return a3 & 1;
}

- (void)donateTipEventObjectsConnectedWithConnectionLine
{
  sub_100C5BF94(self, (uint64_t)a2, &qword_1013DD280, (uint64_t)qword_10147F8C0, (uint64_t)sub_100859130);
}

- (void)donateTipEventParticipantFollowed
{
  sub_100C5BF94(self, (uint64_t)a2, &qword_1013DDF50, (uint64_t)qword_1014815B8, (uint64_t)sub_100D68404);
}

- (void)updateTipsWithConnectorKnobsEnabled:(BOOL)a3
{
  uint64_t v5;
  CRLInteractiveCanvasController *v6;
  uint64_t v7;
  CRLInteractiveCanvasController *v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[31];
  BOOL v12;

  if (a3)
  {
    v5 = qword_1013DD3A0;
    v6 = self;
    if (v5 != -1)
      swift_once(&qword_1013DD3A0, sub_1008B749C);
    v7 = sub_1004B804C(&qword_1013E6D60);
    sub_1004F2A1C(v7, (uint64_t)qword_10147FC30);
    Tips.Event.sendDonation<>(_:)(0, 0);
  }
  else
  {
    v8 = self;
  }
  if (qword_1013DD2A8 != -1)
    swift_once(&qword_1013DD2A8, sub_10085922C);
  v9 = sub_1004B804C((uint64_t *)&unk_1013E1B00);
  v10 = sub_1004F2A1C(v9, (uint64_t)qword_10147F938);
  v12 = a3;
  swift_beginAccess(v10, v11, 33, 0);
  Tips.Parameter.wrappedValue.setter(&v12, v9);
  swift_endAccess(v11);

}

+ (double)minimumRecommendedViewScale
{
  return 0.1;
}

+ (double)maximumRecommendedViewScale
{
  return 4.0;
}

@end
