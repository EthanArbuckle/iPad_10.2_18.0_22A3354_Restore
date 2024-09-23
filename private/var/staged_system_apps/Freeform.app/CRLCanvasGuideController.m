@implementation CRLCanvasGuideController

+ (BOOL)shouldSnapToOffscreenContent
{
  return 1;
}

+ (CRLColor)defaultGuideColor
{
  return +[CRLColor colorWithRed:green:blue:alpha:](CRLColor, "colorWithRed:green:blue:alpha:", 0.933, 0.792, 0.0, 1.0);
}

+ (void)setShouldAlignEdges:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("CRLDisplayEdgeGuides"));

}

+ (BOOL)shouldAlignEdges
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("CRLDisplayEdgeGuides"));

  return v3;
}

+ (void)setShouldAlignToSpacingGuides:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("CRLDisplaySpacingGuides"));

}

+ (BOOL)shouldAlignToSpacingGuides
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("CRLDisplaySpacingGuides"));

  return v3;
}

+ (void)setShouldAlignToSizingGuides:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("CRLDisplaySizingGuides"));

}

+ (void)setGuideColor:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a3);
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10122EE98);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DEB504();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10122EEB8);
  v3 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLCanvasGuideController setGuideColor:]"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasGuideController.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 288, 0, "iOS and QL do not support setting the guide color");

}

+ (BOOL)shouldAlignToSizingGuides
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("CRLDisplaySizingGuides"));

  return v3;
}

+ (void)setShouldAlignCenters:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("CRLDisplayCenterGuides"));

}

+ (BOOL)shouldAlignCenters
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("CRLDisplayCenterGuides"));

  return v3;
}

+ (void)setShouldSnapToGrid:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  if (+[CRLFeatureFlagsHelper isOSFeatureEnabled:](CRLFeatureFlagsHelper, "isOSFeatureEnabled:", 5))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("CRLSnapToGrid"));

  }
}

+ (BOOL)shouldSnapToGrid
{
  _BOOL4 v2;
  void *v3;
  unsigned __int8 v4;

  v2 = +[CRLFeatureFlagsHelper isOSFeatureEnabled:](CRLFeatureFlagsHelper, "isOSFeatureEnabled:", 5);
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("CRLSnapToGrid"));

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (double)snapDistanceToUseForGuides
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasGuideController interactiveCanvasController](self, "interactiveCanvasController"));
  v4 = 7.0;
  if (!objc_msgSend(v3, "isCanvasBackgroundAlignmentSnappingEnabled"))
    goto LABEL_4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasGuideController interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "canvasBackground"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "alignmentProvider"));

  if (v7)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasGuideController interactiveCanvasController](self, "interactiveCanvasController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "canvasBackground"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "alignmentProvider"));
    objc_msgSend(v9, "snapDistanceForViewScale:", 1.0);
    v4 = v10;

LABEL_4:
  }
  return v4;
}

+ (void)setShouldAlignEdgesToTemplateGuides:(BOOL)a3
{
  byte_101414C38 = a3;
}

+ (BOOL)shouldAlignEdgesToTemplateGuides
{
  return byte_101414C38;
}

+ (CRLColor)guideColor
{
  return (CRLColor *)_objc_msgSend(a1, "defaultGuideColor");
}

+ (void)setShouldUseHapticFeedbackWhenSnapping:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("CRLUseHapticFeedbackWhenSnapping"));

}

+ (BOOL)shouldUseHapticFeedbackWhenSnapping
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("CRLUseHapticFeedbackWhenSnapping"));

  return v3;
}

- (CRLCanvasGuideController)initWithInteractiveCanvasController:(id)a3
{
  id v4;
  CRLCanvasGuideController *v5;
  CRLCanvasGuideController *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *guideGenerationAccessQueue;
  dispatch_semaphore_t v9;
  OS_dispatch_semaphore *guideGenerationStateLock;
  CGSize size;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CRLCanvasGuideController;
  v5 = -[CRLCanvasGuideController init](&v16, "init");
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      objc_storeWeak((id *)&v5->_icc, v4);
      v7 = dispatch_queue_create("com.apple.freeform.CRLGuideGeneration", 0);
      guideGenerationAccessQueue = v6->_guideGenerationAccessQueue;
      v6->_guideGenerationAccessQueue = (OS_dispatch_queue *)v7;

      v9 = dispatch_semaphore_create(1);
      guideGenerationStateLock = v6->_guideGenerationStateLock;
      v6->_guideGenerationStateLock = (OS_dispatch_semaphore *)v9;

      size = CGRectNull.size;
      v6->_lastIgnoredRectForDisplayingGuides.origin = CGRectNull.origin;
      v6->_lastIgnoredRectForDisplayingGuides.size = size;
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10122EED8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DEB584();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10122EEF8);
      v12 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasGuideController initWithInteractiveCanvasController:]"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasGuideController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 431, 0, "invalid nil value for '%{public}s'", "icc");

      v6 = 0;
    }
  }

  return v6;
}

- (void)beginAlignmentOperationForRep:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122EF18);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEB614();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122EF38);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasGuideController beginAlignmentOperationForRep:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasGuideController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 447, 0, "invalid nil value for '%{public}s'", "rep");

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v4));
  -[CRLCanvasGuideController beginAlignmentOperationForReps:](self, "beginAlignmentOperationForReps:", v8);

}

- (void)beginAlignmentOperationForReps:(id)a3
{
  -[CRLCanvasGuideController beginAlignmentOperationForReps:preventCenterGuides:preventSpacingGuides:preventSizingGuides:](self, "beginAlignmentOperationForReps:preventCenterGuides:preventSpacingGuides:preventSizingGuides:", a3, 0, 0, 0);
}

- (void)beginAlignmentOperationForReps:(id)a3 preventCenterGuides:(BOOL)a4 preventSpacingGuides:(BOOL)a5 preventSizingGuides:(BOOL)a6
{
  id v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  int v17;
  void *v18;
  id v19;
  void *v20;
  CGSize size;
  unint64_t guideGenerationState;
  unint64_t *p_guideGenerationState;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *guideGenerationAccessQueue;
  id WeakRetained;
  NSObject *v30;
  _QWORD v34[4];
  id v35;
  CRLCanvasGuideController *v36;
  _QWORD *v37;
  _QWORD *v38;
  _QWORD block[5];
  id v40;
  id v41;
  _QWORD *v42;
  uint64_t *v43;
  _QWORD *v44;
  _QWORD *v45;
  BOOL v46;
  BOOL v47;
  BOOL v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;
  _QWORD v53[5];
  id v54;
  _QWORD v55[5];
  id v56;
  _QWORD v57[5];
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];

  v7 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v8 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122EF58);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEB9AC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122EF78);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEB904(v9, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasGuideController beginAlignmentOperationForReps:preventCenterGuides:preventSpacingGuides:preventSizingGuides:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasGuideController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 456, 0, "This operation must only be performed on the main thread.");

  }
  if (v7 && objc_msgSend(v7, "count"))
  {
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v12 = v7;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v60;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v60 != v14)
            objc_enumerationMutation(v12);
          v16 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v16, "exclusivelyProvidesGuidesWhileAligning"))
          {
            v13 = v16;
            goto LABEL_32;
          }
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
        if (v13)
          continue;
        break;
      }
    }
LABEL_32:

    size = CGRectNull.size;
    self->_lastIgnoredRectForDisplayingGuides.origin = CGRectNull.origin;
    self->_lastIgnoredRectForDisplayingGuides.size = size;
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_guideGenerationStateLock, 0xFFFFFFFFFFFFFFFFLL);
    p_guideGenerationState = &self->_guideGenerationState;
    guideGenerationState = self->_guideGenerationState;
    if (guideGenerationState != 3)
    {
      if (guideGenerationState)
      {
        v24 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10122EFD8);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DEB874();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10122EFF8);
        v25 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DEB7CC(v25, v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasGuideController beginAlignmentOperationForReps:preventCenterGuides:preventSpacingGuides:preventSizingGuides:]"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasGuideController.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v26, v27, 478, 0, "Guide state unexpected when begin alignment operation! %lu", *p_guideGenerationState);

      }
      else
      {
        *p_guideGenerationState = 1;
      }
    }
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_guideGenerationStateLock);
    v57[0] = 0;
    v57[1] = v57;
    v57[2] = 0x3032000000;
    v57[3] = sub_100046474;
    v57[4] = sub_100046484;
    v58 = 0;
    v55[0] = 0;
    v55[1] = v55;
    v55[2] = 0x3032000000;
    v55[3] = sub_100046474;
    v55[4] = sub_100046484;
    v56 = 0;
    v53[0] = 0;
    v53[1] = v53;
    v53[2] = 0x3032000000;
    v53[3] = sub_100046474;
    v53[4] = sub_100046484;
    v54 = 0;
    v49 = 0;
    v50 = &v49;
    v51 = 0x2020000000;
    v52 = 1;
    guideGenerationAccessQueue = self->_guideGenerationAccessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004648C;
    block[3] = &unk_10122F108;
    v46 = a4;
    v47 = a5;
    v48 = a6;
    block[4] = self;
    v42 = v53;
    v40 = v12;
    v43 = &v49;
    v44 = v57;
    v19 = v13;
    v41 = v19;
    v45 = v55;
    dispatch_sync(guideGenerationAccessQueue, block);
    if (*((_BYTE *)v50 + 24))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
      objc_msgSend(WeakRetained, "addDecorator:", self);

      v30 = self->_guideGenerationAccessQueue;
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_100047354;
      v34[3] = &unk_10122C5C8;
      v35 = v19;
      v36 = self;
      v37 = v57;
      v38 = v55;
      dispatch_async(v30, v34);

    }
    _Block_object_dispose(&v49, 8);
    _Block_object_dispose(v53, 8);

    _Block_object_dispose(v55, 8);
    _Block_object_dispose(v57, 8);

  }
  else
  {
    v17 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122EF98);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEB74C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122EFB8);
    v18 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEB6A4(v18, v17);
    v19 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasGuideController beginAlignmentOperationForReps:preventCenterGuides:preventSpacingGuides:preventSizingGuides:]"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasGuideController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 458, 0, "beginning alignment with no reps");

  }
}

- (CGPoint)snapRectToGuides:(CGRect)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[CRLCanvasGuideController snapRectToGuides:forKnobTag:snapSize:](self, "snapRectToGuides:forKnobTag:snapSize:", 0, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)snapRectToGuides:(CGRect)a3 forKnobTag:(unint64_t)a4
{
  double v4;
  double v5;
  CGPoint result;

  -[CRLCanvasGuideController snapRectToGuides:forKnobTag:snapSize:](self, "snapRectToGuides:forKnobTag:snapSize:", a4, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)snapRectToGuides:(CGRect)a3 forKnobTag:(unint64_t)a4 snapSize:(BOOL)a5
{
  double v5;
  double v6;
  uint64_t v7;
  CGPoint result;

  LOBYTE(v7) = 1;
  -[CRLCanvasGuideController snapRectToGuides:forKnobTag:snapSize:snapWithBackgroundAlignmentProvider:isLine:startPoint:endPoint:hasHorizontalFlip:hasVerticalFlip:snapWithGuides:](self, "snapRectToGuides:forKnobTag:snapSize:snapWithBackgroundAlignmentProvider:isLine:startPoint:endPoint:hasHorizontalFlip:hasVerticalFlip:snapWithGuides:", a4, a5, 1, 0, 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, CGPointZero.x, CGPointZero.y, CGPointZero.x, CGPointZero.y, v7);
  result.y = v6;
  result.x = v5;
  return result;
}

- (CGPoint)snapRectToGuides:(CGRect)a3 forKnobTag:(unint64_t)a4 snapSize:(BOOL)a5 snapWithBackgroundAlignmentProvider:(BOOL)a6 isLine:(BOOL)a7 startPoint:(CGPoint)a8 endPoint:(CGPoint)a9
{
  double v9;
  double v10;
  uint64_t v11;
  CGPoint result;

  LOBYTE(v11) = 1;
  -[CRLCanvasGuideController snapRectToGuides:forKnobTag:snapSize:snapWithBackgroundAlignmentProvider:isLine:startPoint:endPoint:hasHorizontalFlip:hasVerticalFlip:snapWithGuides:](self, "snapRectToGuides:forKnobTag:snapSize:snapWithBackgroundAlignmentProvider:isLine:startPoint:endPoint:hasHorizontalFlip:hasVerticalFlip:snapWithGuides:", a4, a5, a6, a7, 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a8.x, a8.y, a9.x, a9.y, v11);
  result.y = v10;
  result.x = v9;
  return result;
}

- (CGPoint)snapRectToGuides:(CGRect)a3 forKnobTag:(unint64_t)a4 snapSize:(BOOL)a5 snapWithBackgroundAlignmentProvider:(BOOL)a6 isLine:(BOOL)a7 startPoint:(CGPoint)a8 endPoint:(CGPoint)a9 hasHorizontalFlip:(BOOL)a10 hasVerticalFlip:(BOOL)a11 snapWithGuides:(BOOL)a12
{
  _BOOL4 v12;
  CGFloat y;
  CGFloat x;
  CGFloat v16;
  CGFloat v17;
  CGFloat height;
  double width;
  CGFloat v21;
  CGFloat v22;
  void *v24;
  void *v25;
  void *v26;
  unint64_t guideGenerationState;
  double v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSString *v34;
  void *v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  id WeakRetained;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  CRLBidirectionalGeometricOperator *v48;
  void *v49;
  float v50;
  double v51;
  void *v52;
  float v53;
  double v54;
  void *v55;
  unsigned int v56;
  void *v57;
  unsigned int v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  unsigned int v64;
  _BOOL4 v65;
  _BOOL4 v66;
  double v67;
  double v68;
  double v69;
  double v70;
  uint64_t v71;
  double v72;
  uint64_t v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  _BOOL4 v88;
  _BOOL4 v89;
  _BOOL4 v90;
  _QWORD v91[15];
  BOOL v92;
  CGPoint result;
  CGRect v94;

  v89 = a10;
  v90 = a11;
  v88 = a7;
  v12 = a6;
  y = a9.y;
  x = a9.x;
  v16 = a8.y;
  v17 = a8.x;
  height = a3.size.height;
  width = a3.size.width;
  v21 = a3.origin.y;
  v22 = a3.origin.x;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122F178);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEBCDC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122F198);
    v24 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasGuideController snapRectToGuides:forKnobTag:snapSize:snapWithBackgroundAlignmentProvider:isLine:startPoint:endPoint:hasHorizontalFlip:hasVerticalFlip:snapWithGuides:]"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasGuideController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v25, v26, 791, 0, "This operation must only be performed on the main thread.");

  }
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_guideGenerationStateLock, 0xFFFFFFFFFFFFFFFFLL);
  guideGenerationState = self->_guideGenerationState;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_guideGenerationStateLock);
  if (guideGenerationState == 2)
  {
    if (fabs(v22) == INFINITY
      || fabs(v21) == INFINITY
      || fabs(width) == INFINITY
      || (v28 = fabs(height), v28 >= INFINITY) && v28 <= INFINITY)
    {
      v29 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10122F1B8);
      v30 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DEBBD0(v30, v29, v22, v21, width, height);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10122F1D8);
      v31 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasGuideController snapRectToGuides:forKnobTag:snapSize:snapWithBackgroundAlignmentProvider:isLine:startPoint:endPoint:hasHorizontalFlip:hasVerticalFlip:snapWithGuides:]"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasGuideController.m"));
      v94.origin.x = v22;
      v94.origin.y = v21;
      v94.size.width = width;
      v94.size.height = height;
      v34 = NSStringFromCGRect(v94);
      v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v32, v33, 800, 0, "bad rect for snap rect! %@", v35);

    }
    v82 = y;
    v83 = x;
    v86 = v17;
    v87 = height;
    v84 = v16;
    v36 = 7.0;
    if (v12)
      -[CRLCanvasGuideController snapDistanceToUseForGuides](self, "snapDistanceToUseForGuides", 7.0);
    -[CRLCanvasGuideController p_maxSnapForSnapDistance:](self, "p_maxSnapForSnapDistance:", v36);
    v38 = v37;
    WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
    objc_msgSend(WeakRetained, "visibleUnscaledRect");
    v41 = v40;
    v43 = v42;
    v45 = v44;
    v47 = v46;

    if (a12)
    {
      v48 = objc_alloc_init(CRLBidirectionalGeometricOperator);
      v91[0] = _NSConcreteStackBlock;
      v91[1] = 3221225472;
      v91[2] = sub_1000485F8;
      v91[3] = &unk_10122F200;
      v91[5] = v38;
      v91[4] = self;
      v91[6] = a4;
      *(CGFloat *)&v91[7] = v22;
      *(CGFloat *)&v91[8] = v21;
      *(double *)&v91[9] = width;
      *(double *)&v91[10] = v87;
      v91[11] = v41;
      v91[12] = v43;
      v91[13] = v45;
      v91[14] = v47;
      v92 = a5;
      -[CRLBidirectionalGeometricOperator executeBidirectionalOperation:](v48, "executeBidirectionalOperation:", v91);
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBidirectionalGeometricOperator valueForKey:swapped:](v48, "valueForKey:swapped:", CFSTR("CRLCanvasGuideControllerHorizontalSnapOffsetKey"), 0));
      objc_msgSend(v49, "floatValue");
      v51 = v50;
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBidirectionalGeometricOperator valueForKey:swapped:](v48, "valueForKey:swapped:", CFSTR("CRLCanvasGuideControllerHorizontalSnapOffsetKey"), 1));
      objc_msgSend(v52, "floatValue");
      v54 = v53;

      v55 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBidirectionalGeometricOperator valueForKey:swapped:](v48, "valueForKey:swapped:", CFSTR("CRLCanvasGuideControllerDidSnapHorizontalKey"), 0));
      v56 = objc_msgSend(v55, "BOOLValue");

      v57 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBidirectionalGeometricOperator valueForKey:swapped:](v48, "valueForKey:swapped:", CFSTR("CRLCanvasGuideControllerDidSnapHorizontalKey"), 1));
      v58 = objc_msgSend(v57, "BOOLValue");

    }
    else
    {
      v58 = 0;
      v56 = 0;
      v51 = CGPointZero.x;
      v54 = CGPointZero.y;
    }
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasGuideController interactiveCanvasController](self, "interactiveCanvasController"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "canvasBackground"));

    v61 = objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "alignmentProvider"));
    v62 = (void *)v61;
    if (!v12
      || !v61
      || (v63 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasGuideController interactiveCanvasController](self, "interactiveCanvasController")),
          v64 = objc_msgSend(v63, "isCanvasBackgroundAlignmentSnappingEnabled"),
          v63,
          !v64))
    {
      self->_didJustSnapInX = v56;
      self->_didJustSnapInY = v58;
LABEL_70:

      goto LABEL_71;
    }
    if (a4 != 5 && a4)
    {
      v66 = v89;
      v65 = v90;
      if (v89 && v90)
      {
        v71 = sub_100260A54(a4);
      }
      else
      {
        v71 = a4;
        if (v90)
        {
          v73 = sub_100260F40(a4);
          v71 = sub_100260A54(v73);
        }
        else if (v89)
        {
          v71 = sub_100260F40(a4);
        }
      }
      v74 = sub_100260E54(v71, v22, v21, width, v87);
      v85 = v75;
      v86 = v74;
      objc_msgSend(v62, "alignmentPointForPoint:");
      switch(a4)
      {
        case 2uLL:
        case 8uLL:
          *(_WORD *)&self->_didJustSnapInX = 256;
          v69 = v86;
          break;
        case 3uLL:
        case 7uLL:
        case 9uLL:
          goto LABEL_55;
        case 4uLL:
        case 6uLL:
          *(_WORD *)&self->_didJustSnapInX = 1;
          v70 = v85;
          break;
        default:
          goto LABEL_56;
      }
      goto LABEL_56;
    }
    v66 = v89;
    v65 = v90;
    if (!v88)
      goto LABEL_40;
    objc_msgSend(v62, "alignmentPointForPoint:", v86, v84);
    if (vabdd_f64(v83, v86) <= 0.01)
    {
      v72 = -(width * 0.5);
      if (v84 >= v82)
        v72 = width * 0.5;
    }
    else
    {
      if (vabdd_f64(v82, v84) > 0.01)
      {
LABEL_40:
        objc_msgSend(v62, "originPointForAligningRect:", v22, v21, width, v87);
        v86 = v22;
LABEL_55:
        *(_WORD *)&self->_didJustSnapInX = 257;
LABEL_56:
        v76 = sub_1000603B8(v69, v70, v86);
        v78 = -v76;
        if (!v66)
          v78 = v76;
        v79 = -v77;
        if (!v65)
          v79 = v77;
        if (v56 && fabs(v51) < fabs(v76) && a12)
        {
          self->_didJustSnapInX = 1;
          v78 = v51;
        }
        if (v58 && fabs(v54) < fabs(v77) && a12)
          self->_didJustSnapInY = 1;
        else
          v54 = v79;
        v51 = v78;
        goto LABEL_70;
      }
      v72 = 0.0;
    }
    v69 = sub_1000603B8(v67, v68, v72);
    goto LABEL_55;
  }
  v51 = CGPointZero.x;
  v54 = CGPointZero.y;
LABEL_71:
  v80 = v51;
  v81 = v54;
  result.y = v81;
  result.x = v80;
  return result;
}

- (void)showGuidesAlignedWithRect:(CGRect)a3 shouldRenderX:(BOOL)a4 shouldRenderY:(BOOL)a5
{
  -[CRLCanvasGuideController showGuidesAlignedWithRect:forKnobTag:shouldRenderX:shouldRenderY:shouldRenderSizeGuides:](self, "showGuidesAlignedWithRect:forKnobTag:shouldRenderX:shouldRenderY:shouldRenderSizeGuides:", 0, a4, a5, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)showGuidesAlignedWithRect:(CGRect)a3 forKnobTag:(unint64_t)a4
{
  -[CRLCanvasGuideController showGuidesAlignedWithRect:forKnobTag:shouldRenderX:shouldRenderY:shouldRenderSizeGuides:](self, "showGuidesAlignedWithRect:forKnobTag:shouldRenderX:shouldRenderY:shouldRenderSizeGuides:", a4, 1, 1, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)showGuidesAlignedWithRect:(CGRect)a3 forKnobTag:(unint64_t)a4 shouldRenderX:(BOOL)a5 shouldRenderY:(BOOL)a6 shouldRenderSizeGuides:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  double height;
  double width;
  double y;
  double x;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t guideGenerationState;
  void *v21;
  __int16 v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id WeakRetained;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double MinX;
  void *v43;
  void *v44;
  double v45;
  double MaxX;
  void *v47;
  void *v48;
  double v49;
  double MinY;
  void *v51;
  void *v52;
  double v53;
  double MaxY;
  void *v55;
  void *v56;
  double v57;
  double MidX;
  void *v59;
  void *v60;
  double v61;
  double MidY;
  void *v63;
  void *v64;
  double v65;
  id v66;
  id v67;
  uint64_t v68;
  void *i;
  void *v70;
  uint64_t v71;
  void *v72;
  unsigned int v73;
  _BOOL4 v74;
  uint64_t v75;
  void *v76;
  unsigned int v77;
  _BOOL4 v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  id v83;
  uint64_t v84;
  void *j;
  void *v86;
  NSMutableSet *currentSizingGuideUIRenderables;
  id v88;
  void *v89;
  id v90;
  double v91;
  _BOOL4 obj;
  id obja;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _QWORD v98[9];
  uint64_t v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t (*v102)(uint64_t, uint64_t);
  void (*v103)(uint64_t);
  id v104;
  uint64_t v105;
  uint64_t *v106;
  uint64_t v107;
  uint64_t (*v108)(uint64_t, uint64_t);
  void (*v109)(uint64_t);
  id v110;
  uint64_t v111;
  uint64_t *v112;
  uint64_t v113;
  uint64_t (*v114)(uint64_t, uint64_t);
  void (*v115)(uint64_t);
  id v116;
  uint64_t v117;
  uint64_t *v118;
  uint64_t v119;
  uint64_t (*v120)(uint64_t, uint64_t);
  void (*v121)(uint64_t);
  id v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  _BYTE v127[128];
  _BYTE v128[128];
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;

  obj = a7;
  v7 = a6;
  v8 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v15 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122F220);
    v16 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
      sub_100DEBF24();

    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122F240);
    v17 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
      sub_100DEBE80(v15, v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasGuideController showGuidesAlignedWithRect:forKnobTag:shouldRenderX:shouldRenderY:shouldRenderSizeGuides:]"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasGuideController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 1143, 0, "This operation must only be performed on the main thread.");

  }
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_guideGenerationStateLock, 0xFFFFFFFFFFFFFFFFLL);
  guideGenerationState = self->_guideGenerationState;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_guideGenerationStateLock);
  if (guideGenerationState != 2)
  {
    self->_lastIgnoredRectForDisplayingGuides.origin.x = x;
    self->_lastIgnoredRectForDisplayingGuides.origin.y = y;
    self->_lastIgnoredRectForDisplayingGuides.size.width = width;
    self->_lastIgnoredRectForDisplayingGuides.size.height = height;
    self->_lastIgnoredKnobTag = a4;
    self->_lastIgnoredShouldShowSizeGuides = obj;
    return;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v22 = sub_100260884(a4);
  if (a4 && (v22 & 0x3DE) == 0)
  {
    v23 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122F260);
    v24 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_ERROR))
      sub_100DEBE00();

    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122F280);
    v25 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR))
      sub_100DEBD5C(v23, v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasGuideController showGuidesAlignedWithRect:forKnobTag:shouldRenderX:shouldRenderY:shouldRenderSizeGuides:]"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasGuideController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v26, v27, 1165, 0, "Attempting to do guide operation for an unsupported knob type");

  }
  if (v8)
  {
    if (-[CRLCanvasGuideController p_guidesAreRelevantForEdge:whileDraggingKnobTag:](self, "p_guidesAreRelevantForEdge:whileDraggingKnobTag:", 0, a4))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasGuideController p_guidesForEdge:ofFrame:](self, "p_guidesForEdge:ofFrame:", 0, x, y, width, height));
      objc_msgSend(v21, "addObjectsFromArray:", v28);

    }
    if (-[CRLCanvasGuideController p_guidesAreRelevantForEdge:whileDraggingKnobTag:](self, "p_guidesAreRelevantForEdge:whileDraggingKnobTag:", 2, a4))
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasGuideController p_guidesForEdge:ofFrame:](self, "p_guidesForEdge:ofFrame:", 2, x, y, width, height));
      objc_msgSend(v21, "addObjectsFromArray:", v29);

    }
    if (-[CRLCanvasGuideController p_guidesAreRelevantForEdge:whileDraggingKnobTag:](self, "p_guidesAreRelevantForEdge:whileDraggingKnobTag:", 1, a4))
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasGuideController p_guidesForEdge:ofFrame:](self, "p_guidesForEdge:ofFrame:", 1, x, y, width, height));
      objc_msgSend(v21, "addObjectsFromArray:", v30);

    }
  }
  if (v7)
  {
    if (-[CRLCanvasGuideController p_guidesAreRelevantForEdge:whileDraggingKnobTag:](self, "p_guidesAreRelevantForEdge:whileDraggingKnobTag:", 3, a4))
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasGuideController p_guidesForEdge:ofFrame:](self, "p_guidesForEdge:ofFrame:", 3, x, y, width, height));
      objc_msgSend(v21, "addObjectsFromArray:", v31);

    }
    if (-[CRLCanvasGuideController p_guidesAreRelevantForEdge:whileDraggingKnobTag:](self, "p_guidesAreRelevantForEdge:whileDraggingKnobTag:", 5, a4))
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasGuideController p_guidesForEdge:ofFrame:](self, "p_guidesForEdge:ofFrame:", 5, x, y, width, height));
      objc_msgSend(v21, "addObjectsFromArray:", v32);

    }
    if (-[CRLCanvasGuideController p_guidesAreRelevantForEdge:whileDraggingKnobTag:](self, "p_guidesAreRelevantForEdge:whileDraggingKnobTag:", 4, a4))
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasGuideController p_guidesForEdge:ofFrame:](self, "p_guidesForEdge:ofFrame:", 4, x, y, width, height));
      objc_msgSend(v21, "addObjectsFromArray:", v33);

    }
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  objc_msgSend(WeakRetained, "visibleUnscaledRect");
  v91 = v35;
  v37 = v36;
  v39 = v38;
  v41 = v40;

  if (self->_shouldAlignToSpacingGuides)
  {
    if (self->_shouldAlignEdges)
      goto LABEL_67;
    if (v8)
    {
      if (a4 && (sub_100260884(a4) & 0x92) == 0)
        goto LABEL_47;
      v129.origin.x = x;
      v129.origin.y = y;
      v129.size.width = width;
      v129.size.height = height;
      MinX = CGRectGetMinX(v129);
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasGuideController p_predicateCanBeSnappedToByEdge:ofFrame:inVisibleUnscaledRect:](self, "p_predicateCanBeSnappedToByEdge:ofFrame:inVisibleUnscaledRect:", 0, x, y, width, height, v91, v37, v39, v41));
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasGuideController p_closestGuideForOffset:predicate:inArray:](self, "p_closestGuideForOffset:predicate:inArray:", v43, self->_spacingGuidesForSnappingX, MinX));

      if (v44)
      {
        objc_msgSend(v44, "offset");
        if (v45 - MinX == 0.0 || vabdd_f64(v45, MinX) < 0.00999999978)
          objc_msgSend(v21, "addObject:", v44, *(_QWORD *)&v91);
      }

      if (a4)
      {
LABEL_47:
        if ((sub_100260884(a4) & 0x248) == 0)
        {
          if (!v7)
          {
            if (self->_shouldAlignCenters)
              goto LABEL_86;
LABEL_70:
            if ((sub_100260884(a4) & 4) != 0 || (sub_100260884(a4) & 0x100) != 0)
            {
LABEL_77:
              if (v7 && (!a4 || (sub_100260884(a4) & 0x10) == 0 && (sub_100260884(a4) & 0x40) == 0))
              {
                v134.origin.x = x;
                v134.origin.y = y;
                v134.size.width = width;
                v134.size.height = height;
                MidY = CGRectGetMidY(v134);
                v63 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasGuideController p_predicateCanBeSnappedToByEdge:ofFrame:inVisibleUnscaledRect:](self, "p_predicateCanBeSnappedToByEdge:ofFrame:inVisibleUnscaledRect:", 3, x, y, width, height, v91, v37, v39, v41));
                v64 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasGuideController p_closestGuideForOffset:predicate:inArray:](self, "p_closestGuideForOffset:predicate:inArray:", v63, self->_spacingCenterGuidesForSnappingY, MidY));

                if (v64)
                {
                  objc_msgSend(v64, "offset");
                  if (v65 - MidY == 0.0 || vabdd_f64(v65, MidY) < 0.00999999978)
                    objc_msgSend(v21, "addObject:", v64, *(_QWORD *)&v91);
                }

              }
              goto LABEL_86;
            }
LABEL_72:
            v133.origin.x = x;
            v133.origin.y = y;
            v133.size.width = width;
            v133.size.height = height;
            MidX = CGRectGetMidX(v133);
            v59 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasGuideController p_predicateCanBeSnappedToByEdge:ofFrame:inVisibleUnscaledRect:](self, "p_predicateCanBeSnappedToByEdge:ofFrame:inVisibleUnscaledRect:", 1, x, y, width, height, v91, v37, v39, v41));
            v60 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasGuideController p_closestGuideForOffset:predicate:inArray:](self, "p_closestGuideForOffset:predicate:inArray:", v59, self->_spacingCenterGuidesForSnappingX, MidX));

            if (v60)
            {
              objc_msgSend(v60, "offset");
              if (v61 - MidX == 0.0 || vabdd_f64(v61, MidX) < 0.00999999978)
                objc_msgSend(v21, "addObject:", v60, *(_QWORD *)&v91);
            }

            goto LABEL_77;
          }
          goto LABEL_55;
        }
      }
      v130.origin.x = x;
      v130.origin.y = y;
      v130.size.width = width;
      v130.size.height = height;
      MaxX = CGRectGetMaxX(v130);
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasGuideController p_predicateCanBeSnappedToByEdge:ofFrame:inVisibleUnscaledRect:](self, "p_predicateCanBeSnappedToByEdge:ofFrame:inVisibleUnscaledRect:", 2, x, y, width, height, v91, v37, v39, v41));
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasGuideController p_closestGuideForOffset:predicate:inArray:](self, "p_closestGuideForOffset:predicate:inArray:", v47, self->_spacingGuidesForSnappingX, MaxX));

      if (v48)
      {
        objc_msgSend(v48, "offset");
        if (v49 - MaxX == 0.0 || vabdd_f64(v49, MaxX) < 0.00999999978)
          objc_msgSend(v21, "addObject:", v48, *(_QWORD *)&v91);
      }

    }
    if (!v7)
      goto LABEL_67;
    if (!a4)
    {
LABEL_56:
      v131.origin.x = x;
      v131.origin.y = y;
      v131.size.width = width;
      v131.size.height = height;
      MinY = CGRectGetMinY(v131);
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasGuideController p_predicateCanBeSnappedToByEdge:ofFrame:inVisibleUnscaledRect:](self, "p_predicateCanBeSnappedToByEdge:ofFrame:inVisibleUnscaledRect:", 3, x, y, width, height, v91, v37, v39, v41));
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasGuideController p_closestGuideForOffset:predicate:inArray:](self, "p_closestGuideForOffset:predicate:inArray:", v51, self->_spacingGuidesForSnappingY, MinY));

      if (v52)
      {
        objc_msgSend(v52, "offset");
        if (v53 - MinY == 0.0 || vabdd_f64(v53, MinY) < 0.00999999978)
          objc_msgSend(v21, "addObject:", v52, *(_QWORD *)&v91);
      }

      if (!a4)
      {
LABEL_62:
        v132.origin.x = x;
        v132.origin.y = y;
        v132.size.width = width;
        v132.size.height = height;
        MaxY = CGRectGetMaxY(v132);
        v55 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasGuideController p_predicateCanBeSnappedToByEdge:ofFrame:inVisibleUnscaledRect:](self, "p_predicateCanBeSnappedToByEdge:ofFrame:inVisibleUnscaledRect:", 5, x, y, width, height, v91, v37, v39, v41));
        v56 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasGuideController p_closestGuideForOffset:predicate:inArray:](self, "p_closestGuideForOffset:predicate:inArray:", v55, self->_spacingGuidesForSnappingY, MaxY));

        if (v56)
        {
          objc_msgSend(v56, "offset");
          if (v57 - MaxY == 0.0 || vabdd_f64(v57, MaxY) < 0.00999999978)
            objc_msgSend(v21, "addObject:", v56, *(_QWORD *)&v91);
        }

LABEL_67:
        if (self->_shouldAlignCenters)
          goto LABEL_86;
        if (!v8)
          goto LABEL_77;
        if (!a4)
          goto LABEL_72;
        goto LABEL_70;
      }
LABEL_61:
      if ((sub_100260884(a4) & 0x380) == 0)
        goto LABEL_67;
      goto LABEL_62;
    }
LABEL_55:
    if ((sub_100260884(a4) & 0xE) == 0)
      goto LABEL_61;
    goto LABEL_56;
  }
LABEL_86:
  v125 = 0u;
  v126 = 0u;
  v123 = 0u;
  v124 = 0u;
  v66 = v21;
  v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v123, v128, 16);
  if (v67)
  {
    v68 = *(_QWORD *)v124;
    do
    {
      for (i = 0; i != v67; i = (char *)i + 1)
      {
        if (*(_QWORD *)v124 != v68)
          objc_enumerationMutation(v66);
        objc_msgSend(*(id *)(*((_QWORD *)&v123 + 1) + 8 * (_QWORD)i), "setSnappingObjectFrame:", x, y, width, height, *(_QWORD *)&v91);
      }
      v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v123, v128, 16);
    }
    while (v67);
  }

  v117 = 0;
  v118 = &v117;
  v119 = 0x3032000000;
  v120 = sub_100046474;
  v121 = sub_100046484;
  v122 = 0;
  v111 = 0;
  v112 = &v111;
  v113 = 0x3032000000;
  v114 = sub_100046474;
  v115 = sub_100046484;
  v116 = 0;
  v105 = 0;
  v106 = &v105;
  v107 = 0x3032000000;
  v108 = sub_100046474;
  v109 = sub_100046484;
  v110 = 0;
  v99 = 0;
  v100 = &v99;
  v101 = 0x3032000000;
  v102 = sub_100046474;
  v103 = sub_100046484;
  v104 = 0;
  v98[0] = _NSConcreteStackBlock;
  v98[1] = 3221225472;
  v98[2] = sub_100049C7C;
  v98[3] = &unk_10122F2A8;
  v98[4] = self;
  v98[5] = &v117;
  v98[6] = &v111;
  v98[7] = &v105;
  v98[8] = &v99;
  v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v98));
  objc_msgSend(v66, "filterUsingPredicate:", v70);

  if (v106[5])
    objc_msgSend(v66, "addObject:");
  v71 = v118[5];
  if (v71)
  {
    if (v106[5])
    {
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v118[5], "parentSpacing"));
      v73 = objc_msgSend(v72, "integerOffset");
      v74 = v73 == objc_msgSend((id)v106[5], "integerOffset");

      if (!v74)
        goto LABEL_100;
      v71 = v118[5];
    }
    objc_msgSend(v66, "addObject:", v71, *(_QWORD *)&v91);
  }
LABEL_100:
  if (v100[5])
    objc_msgSend(v66, "addObject:");
  v75 = v112[5];
  if (!v75)
    goto LABEL_107;
  if (!v100[5])
    goto LABEL_106;
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v112[5], "parentSpacing"));
  v77 = objc_msgSend(v76, "integerOffset");
  v78 = v77 == objc_msgSend((id)v100[5], "integerOffset");

  if (v78)
  {
    v75 = v112[5];
LABEL_106:
    objc_msgSend(v66, "addObject:", v75, *(_QWORD *)&v91);
  }
LABEL_107:
  if (-[CRLCanvasGuideController doNotRemoveExistingGuidesWhenDisplaying](self, "doNotRemoveExistingGuidesWhenDisplaying", *(_QWORD *)&v91))
  {
    v79 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet allObjects](self->_currentGuides, "allObjects"));
    objc_msgSend(v66, "addObjectsFromArray:", v79);

  }
  objc_storeStrong((id *)&self->_currentGuides, v21);
  self->_currentGuidesRect.origin.x = x;
  self->_currentGuidesRect.origin.y = y;
  self->_currentGuidesRect.size.width = width;
  self->_currentGuidesRect.size.height = height;
  -[NSMutableSet removeAllObjects](self->_currentSizingGuideUIRenderables, "removeAllObjects");
  if (obj && self->_shouldAlignToSizingGuides && (sub_100260884(a4) & 0x3DE) != 0)
  {
    obja = objc_alloc_init((Class)NSMutableSet);
    if (-[CRLCanvasGuideController p_sizingGuidesAreRelevantForOrientation:whileDraggingKnobTag:](self, "p_sizingGuidesAreRelevantForOrientation:whileDraggingKnobTag:", 0, a4))
    {
      v80 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasGuideController p_guidesForOffset:predicate:inArray:](self, "p_guidesForOffset:predicate:inArray:", 0, self->_horizontalSizingGuides, width));
      objc_msgSend(obja, "addObjectsFromArray:", v80);

    }
    if (-[CRLCanvasGuideController p_sizingGuidesAreRelevantForOrientation:whileDraggingKnobTag:](self, "p_sizingGuidesAreRelevantForOrientation:whileDraggingKnobTag:", 1, a4))
    {
      v81 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasGuideController p_guidesForOffset:predicate:inArray:](self, "p_guidesForOffset:predicate:inArray:", 0, self->_verticalSizingGuides, height));
      objc_msgSend(obja, "addObjectsFromArray:", v81);

    }
    v96 = 0u;
    v97 = 0u;
    v94 = 0u;
    v95 = 0u;
    v82 = obja;
    v83 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v94, v127, 16);
    if (v83)
    {
      v84 = *(_QWORD *)v95;
      do
      {
        for (j = 0; j != v83; j = (char *)j + 1)
        {
          if (*(_QWORD *)v95 != v84)
            objc_enumerationMutation(v82);
          v86 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * (_QWORD)j);
          objc_msgSend(v86, "setSnappingObjectFrame:", x, y, width, height);
          currentSizingGuideUIRenderables = self->_currentSizingGuideUIRenderables;
          v88 = objc_loadWeakRetained((id *)&self->_icc);
          v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "renderableWithICC:", v88));
          -[NSMutableSet addObject:](currentSizingGuideUIRenderables, "addObject:", v89);

        }
        v83 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v94, v127, 16);
      }
      while (v83);
    }

    objc_storeStrong((id *)&self->_currentSizingGuides, obja);
  }
  v90 = objc_loadWeakRetained((id *)&self->_icc);
  objc_msgSend(v90, "invalidateLayersForDecorator:", self);

  _Block_object_dispose(&v99, 8);
  _Block_object_dispose(&v105, 8);

  _Block_object_dispose(&v111, 8);
  _Block_object_dispose(&v117, 8);

}

- (NSSet)i_currentGuides
{
  return -[NSSet setByAddingObjectsFromSet:](self->_currentGuides, "setByAddingObjectsFromSet:", self->_currentSizingGuides);
}

- (void)showSizingGuidesAlignedWithLayout:(id)a3 forKnobTag:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t guideGenerationState;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  unint64_t v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  void *v26;
  NSMutableSet *currentSizingGuideUIRenderables;
  id WeakRetained;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _OWORD v34[3];
  _BYTE v35[128];

  v6 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122F2C8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEBFA4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122F2E8);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasGuideController showSizingGuidesAlignedWithLayout:forKnobTag:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasGuideController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 1398, 0, "This operation must only be performed on the main thread.");

  }
  if (self->_shouldAlignToSizingGuides)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_guideGenerationStateLock, 0xFFFFFFFFFFFFFFFFLL);
    guideGenerationState = self->_guideGenerationState;
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_guideGenerationStateLock);
    if (guideGenerationState == 2)
    {
      objc_msgSend(v6, "alignmentFrameForProvidingGuidesInRoot");
      v12 = v11;
      v14 = v13;
      if (v6)
        objc_msgSend(v6, "transform");
      else
        memset(v34, 0, sizeof(v34));
      v15 = sub_1000791B0(v34);
      sub_1000618C4(v15);
      if (v16 == 90.0 || fabs(v16 + -90.0) < 0.00999999978)
      {
        v17 = sub_100260A78(a4);
      }
      else
      {
        if (v16 != 270.0 && fabs(v16 + -270.0) >= 0.00999999978)
          goto LABEL_23;
        v17 = sub_100260890(a4);
      }
      a4 = v17;
LABEL_23:
      v18 = objc_alloc_init((Class)NSMutableArray);
      if (-[CRLCanvasGuideController p_sizingGuidesAreRelevantForOrientation:whileDraggingKnobTag:](self, "p_sizingGuidesAreRelevantForOrientation:whileDraggingKnobTag:", 0, a4))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasGuideController p_guidesForOffset:predicate:inArray:](self, "p_guidesForOffset:predicate:inArray:", 0, self->_horizontalSizingGuides, v12));
        objc_msgSend(v18, "addObjectsFromArray:", v19);

      }
      if (-[CRLCanvasGuideController p_sizingGuidesAreRelevantForOrientation:whileDraggingKnobTag:](self, "p_sizingGuidesAreRelevantForOrientation:whileDraggingKnobTag:", 1, a4))
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasGuideController p_guidesForOffset:predicate:inArray:](self, "p_guidesForOffset:predicate:inArray:", 0, self->_verticalSizingGuides, v14));
        objc_msgSend(v18, "addObjectsFromArray:", v20);

      }
      -[NSMutableSet removeAllObjects](self->_currentSizingGuideUIRenderables, "removeAllObjects");
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v21 = v18;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v23; i = (char *)i + 1)
          {
            if (*(_QWORD *)v31 != v24)
              objc_enumerationMutation(v21);
            v26 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v26, "setSnappingObjectLayout:", v6, (_QWORD)v30);
            currentSizingGuideUIRenderables = self->_currentSizingGuideUIRenderables;
            WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "renderableWithICC:", WeakRetained));
            -[NSMutableSet addObject:](currentSizingGuideUIRenderables, "addObject:", v29);

          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        }
        while (v23);
      }

    }
  }

}

- (void)showSizingGuideUIForRep:(id)a3 matchingWidth:(BOOL)a4 matchingHeight:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  CRLCanvasSizingGuideUILayer *v9;
  void *v10;
  id WeakRetained;
  NSMutableSet *currentSizingGuideUIRenderables;
  void *v13;
  id v14;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = [CRLCanvasSizingGuideUILayer alloc];
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layout"));

  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v14 = -[CRLCanvasSizingGuideUILayer initForLayout:withICC:showWidth:showHeight:](v9, "initForLayout:withICC:showWidth:showHeight:", v10, WeakRetained, v6, v5);

  currentSizingGuideUIRenderables = self->_currentSizingGuideUIRenderables;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRenderable renderableFromLayer:](CRLCanvasRenderable, "renderableFromLayer:", v14));
  -[NSMutableSet addObject:](currentSizingGuideUIRenderables, "addObject:", v13);

}

- (void)hideSizingGuides
{
  id WeakRetained;

  -[NSMutableSet removeAllObjects](self->_currentSizingGuideUIRenderables, "removeAllObjects");
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  objc_msgSend(WeakRetained, "invalidateLayersForDecorator:", self);

}

- (void)hideAlignmentGuides
{
  NSSet *currentGuides;
  NSSet *currentSizingGuides;
  id WeakRetained;

  currentGuides = self->_currentGuides;
  self->_currentGuides = 0;

  currentSizingGuides = self->_currentSizingGuides;
  self->_currentSizingGuides = 0;

  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  objc_msgSend(WeakRetained, "invalidateLayersForDecorator:", self);

}

- (void)endAlignmentOperation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  double v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  id WeakRetained;
  NSObject *guideGenerationAccessQueue;
  _QWORD block[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122F308);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEC024();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122F328);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasGuideController endAlignmentOperation]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasGuideController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 1457, 0, "This operation must only be performed on the main thread.");

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity")));
  objc_msgSend(v6, "setDelegate:", 0);
  objc_msgSend(v6, "setDuration:", 0.400000006);
  objc_msgSend(v6, "setFromValue:", &off_1012CC928);
  objc_msgSend(v6, "setToValue:", &off_1012CCB18);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasGuideController decoratorOverlayRenderables](self, "decoratorOverlayRenderables"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        LODWORD(v9) = 0;
        objc_msgSend(v13, "setOpacity:", v9);
        objc_msgSend(v13, "addAnimation:forKey:", v6, CFSTR("fade out"));
      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_guideGenerationStateLock, 0xFFFFFFFFFFFFFFFFLL);
  self->_guideGenerationState = 3;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_guideGenerationStateLock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  objc_msgSend(WeakRetained, "removeDecorator:", self);

  guideGenerationAccessQueue = self->_guideGenerationAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004A790;
  block[3] = &unk_10122D110;
  block[4] = self;
  dispatch_async(guideGenerationAccessQueue, block);

}

- (NSArray)decoratorOverlayRenderables
{
  unint64_t guideGenerationState;
  CRLInteractiveCanvasController **p_icc;
  id v5;
  BOOL IsEmpty;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *j;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *k;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id WeakRetained;
  double v31;
  id v32;
  double v33;
  double v34;
  id v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  id v41;
  void *v42;
  void *v43;
  CRLCanvasGuideController *v45;
  NSSet *obj;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  CGRect v62;

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_guideGenerationStateLock, 0xFFFFFFFFFFFFFFFFLL);
  guideGenerationState = self->_guideGenerationState;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_guideGenerationStateLock);
  if (guideGenerationState == 2
    && (p_icc = &self->_icc,
        v5 = objc_loadWeakRetained((id *)&self->_icc),
        objc_msgSend(v5, "visibleUnscaledRect"),
        IsEmpty = CGRectIsEmpty(v62),
        v5,
        !IsEmpty))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_horizontalSpacings, "allValues"));
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v56 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)i), "needsRedraw");
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
      }
      while (v10);
    }

    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_verticalSpacings, "allValues"));
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v52;
      do
      {
        for (j = 0; j != v15; j = (char *)j + 1)
        {
          if (*(_QWORD *)v52 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)j), "needsRedraw");
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
      }
      while (v15);
    }

    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v45 = self;
    obj = self->_currentGuides;
    v18 = -[NSSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
    if (v18)
    {
      v20 = v18;
      v21 = *(_QWORD *)v48;
      do
      {
        for (k = 0; k != v20; k = (char *)k + 1)
        {
          if (*(_QWORD *)v48 != v21)
            objc_enumerationMutation(obj);
          v23 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)k);
          v24 = objc_opt_class(CRLCanvasAlignmentGuide, v19);
          v25 = sub_100221D0C(v24, v23);
          v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
          v27 = v26;
          if (v26 && objc_msgSend(v26, "infinite"))
          {
            v28 = v7;
            v29 = objc_msgSend(v27, "guideType");
            WeakRetained = objc_loadWeakRetained((id *)p_icc);
            objc_msgSend(WeakRetained, "visibleUnscaledRect");
            if (v29 == (id)1)
            {
              objc_msgSend(v27, "setStart:", v31);

              v32 = objc_loadWeakRetained((id *)p_icc);
              objc_msgSend(v32, "visibleUnscaledRect");
              v34 = v33;
              v35 = objc_loadWeakRetained((id *)p_icc);
              objc_msgSend(v35, "visibleUnscaledRect");
              v37 = v34 + v36;
            }
            else
            {
              objc_msgSend(v27, "setStart:");

              v32 = objc_loadWeakRetained((id *)p_icc);
              objc_msgSend(v32, "visibleUnscaledRect");
              v39 = v38;
              v35 = objc_loadWeakRetained((id *)p_icc);
              objc_msgSend(v35, "visibleUnscaledRect");
              v37 = v39 + v40;
            }
            objc_msgSend(v27, "setEnd:", v37, v45);

            v7 = v28;
          }
          v41 = objc_loadWeakRetained((id *)p_icc);
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "renderableWithICC:", v41));

          if (v42)
            objc_msgSend(v7, "addObject:", v42);

        }
        v20 = -[NSSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
      }
      while (v20);
    }

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v45->_currentSizingGuideUIRenderables, "allObjects"));
    objc_msgSend(v7, "addObjectsFromArray:", v43);

  }
  else
  {
    v7 = &__NSArray0__struct;
  }
  return (NSArray *)v7;
}

- (double)p_maxSnapForSnapDistance:(double)a3
{
  id WeakRetained;
  double v5;
  double v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  objc_msgSend(WeakRetained, "viewScale");
  *(float *)&v5 = v5 + -1.0;
  v6 = a3 / (tanhf(*(float *)&v5) + 1.0);

  return v6;
}

- (BOOL)p_sizingGuidesAreRelevantForOrientation:(int)a3 whileDraggingKnobTag:(unint64_t)a4
{
  BOOL v4;
  BOOL v6;

  v4 = (a4 & 0xFFFFFFFFFFFFFFFDLL) != 4;
  v6 = a4 != 2 && a4 != 8;
  if (!a3)
    v4 = v6;
  return a4 && v4;
}

- (BOOL)p_guidesAreRelevantForEdge:(int)a3 whileDraggingKnobTag:(unint64_t)a4
{
  BOOL result;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;

  switch(a4)
  {
    case 0uLL:
      if (a3 > 5)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10122F388);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DEC1D4();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10122F3A8);
        v11 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasGuideController p_guidesAreRelevantForEdge:whileDraggingKnobTag:]"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasGuideController.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 1673, 0, "unexpected edge type");

        return 0;
      }
      if (((1 << a3) & 0x2D) != 0)
        return self->_shouldAlignEdges;
      return self->_shouldAlignCenters;
    case 1uLL:
      result = 0;
      switch(a3)
      {
        case 0:
        case 3:
          return self->_shouldAlignEdges;
        case 1:
        case 4:
          return self->_shouldAlignCenters;
        default:
          return result;
      }
      return result;
    case 2uLL:
      if (a3 == 4)
        return self->_shouldAlignCenters;
      if (a3 != 3)
        return 0;
      return self->_shouldAlignEdges;
    case 3uLL:
      if ((a3 & 0xFFFFFFFE) == 2)
        return self->_shouldAlignEdges;
      if (a3 != 4 && a3 != 1)
        return 0;
      return self->_shouldAlignCenters;
    case 4uLL:
      if (a3 == 1)
        return self->_shouldAlignCenters;
      if (a3)
        return 0;
      return self->_shouldAlignEdges;
    case 6uLL:
      if (a3 == 1)
        return self->_shouldAlignCenters;
      if (a3 != 2)
        return 0;
      return self->_shouldAlignEdges;
    case 7uLL:
      result = 0;
      switch(a3)
      {
        case 0:
        case 5:
          return self->_shouldAlignEdges;
        case 1:
        case 4:
          return self->_shouldAlignCenters;
        default:
          return result;
      }
      return result;
    case 8uLL:
      if (a3 == 4)
        return self->_shouldAlignCenters;
      if (a3 != 5)
        return 0;
      return self->_shouldAlignEdges;
    case 9uLL:
      result = 0;
      switch(a3)
      {
        case 1:
        case 4:
          return self->_shouldAlignCenters;
        case 2:
        case 5:
          return self->_shouldAlignEdges;
        default:
          return result;
      }
      return result;
    default:
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", *(_QWORD *)&a3);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10122F3C8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DEC138();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10122F3E8);
      v7 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasGuideController p_guidesAreRelevantForEdge:whileDraggingKnobTag:]"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasGuideController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 1677, 0, "unexpected knob tag %zu", a4);

      return 0;
  }
}

- (CGRect)p_alignmentFrameInRootForLayout:(id)a3
{
  NSMapTable *alignmentFrameInRootByLayout;
  void *v4;
  void *v5;
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
  CGRect result;

  alignmentFrameInRootByLayout = self->_alignmentFrameInRootByLayout;
  if (alignmentFrameInRootByLayout)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKeyedSubscript:](alignmentFrameInRootByLayout, "objectForKeyedSubscript:", a3));
    if (!v4)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10122F408);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DEC254();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10122F428);
      v5 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasGuideController p_alignmentFrameInRootForLayout:]"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasGuideController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 1688, 0, "invalid nil value for '%{public}s'", "value");

    }
    objc_msgSend(v4, "CGRectValue");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

  }
  else
  {
    objc_msgSend(a3, "alignmentFrameForProvidingGuidesInRoot");
    v9 = v16;
    v11 = v17;
    v13 = v18;
    v15 = v19;
  }
  v20 = v9;
  v21 = v11;
  v22 = v13;
  v23 = v15;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (void)p_addGuidesForLayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CRLCanvasAlignmentGuide *v24;
  CRLCanvasAlignmentGuide *v25;
  CRLCanvasAlignmentGuide *v26;
  CRLCanvasAlignmentGuide *v27;
  CRLCanvasAlignmentGuide *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  void *v34;
  CRLCanvasAlignmentGuide *v35;
  uint64_t v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "shouldDisplayGuides"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "additionalGuides"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasGuideController interactiveCanvasController](self, "interactiveCanvasController"));
    objc_msgSend(v7, "transformGuides:forLayout:", v6, v5);

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v43 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v13, "guideType"))
            v14 = 120;
          else
            v14 = 112;
          -[CRLCanvasGuideController p_addAlignmentGuide:toSortedArray:](self, "p_addAlignmentGuide:toSortedArray:", v13, *(Class *)((char *)&self->super.isa + v14));
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      }
      while (v10);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    -[CRLCanvasGuideController p_alignmentFrameInRootForLayout:](self, "p_alignmentFrameInRootForLayout:", v5);
    v20 = v16;
    v21 = v17;
    v22 = v18;
    v23 = v19;
    if (self->_shouldAlignCenters)
    {
      v24 = -[CRLCanvasAlignmentGuide initWithGeneratingObjectUnscaledRect:edge:]([CRLCanvasAlignmentGuide alloc], "initWithGeneratingObjectUnscaledRect:edge:", 1, v16, v17, v18, v19);
      objc_msgSend(v15, "addObject:", v24);
      v25 = -[CRLCanvasAlignmentGuide initWithGeneratingObjectUnscaledRect:edge:]([CRLCanvasAlignmentGuide alloc], "initWithGeneratingObjectUnscaledRect:edge:", 4, v20, v21, v22, v23);

      objc_msgSend(v15, "addObject:", v25);
    }
    else
    {
      v25 = 0;
    }
    if (self->_shouldAlignEdges)
    {
      v26 = -[CRLCanvasAlignmentGuide initWithGeneratingObjectUnscaledRect:edge:]([CRLCanvasAlignmentGuide alloc], "initWithGeneratingObjectUnscaledRect:edge:", 0, v20, v21, v22, v23);

      objc_msgSend(v15, "addObject:", v26);
      v27 = -[CRLCanvasAlignmentGuide initWithGeneratingObjectUnscaledRect:edge:]([CRLCanvasAlignmentGuide alloc], "initWithGeneratingObjectUnscaledRect:edge:", 2, v20, v21, v22, v23);

      objc_msgSend(v15, "addObject:", v27);
      v28 = -[CRLCanvasAlignmentGuide initWithGeneratingObjectUnscaledRect:edge:]([CRLCanvasAlignmentGuide alloc], "initWithGeneratingObjectUnscaledRect:edge:", 3, v20, v21, v22, v23);

      objc_msgSend(v15, "addObject:", v28);
      v25 = -[CRLCanvasAlignmentGuide initWithGeneratingObjectUnscaledRect:edge:]([CRLCanvasAlignmentGuide alloc], "initWithGeneratingObjectUnscaledRect:edge:", 5, v20, v21, v22, v23);

      objc_msgSend(v15, "addObject:", v25);
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasGuideController interactiveCanvasController](self, "interactiveCanvasController"));
    v37 = v5;
    objc_msgSend(v29, "transformGuides:forLayout:", v15, v5);

    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v30 = v15;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v39;
      do
      {
        v34 = 0;
        v35 = v25;
        do
        {
          if (*(_QWORD *)v39 != v33)
            objc_enumerationMutation(v30);
          v25 = (CRLCanvasAlignmentGuide *)*(id *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)v34);

          if (-[CRLCanvasAlignmentGuide guideType](v25, "guideType"))
            v36 = 120;
          else
            v36 = 112;
          -[CRLCanvasGuideController p_addAlignmentGuide:toSortedArray:](self, "p_addAlignmentGuide:toSortedArray:", v25, *(Class *)((char *)&self->super.isa + v36));
          v34 = (char *)v34 + 1;
          v35 = v25;
        }
        while (v32 != v34);
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
      }
      while (v32);
    }

    v5 = v37;
  }

}

- (void)p_addSpacingGuidesForFrame:(CGRect)a3 spacing:(id)a4 isVerticalSpacing:(BOOL)a5
{
  _BOOL4 v5;
  double height;
  double width;
  double y;
  double x;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v5 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v19 = a4;
  v11 = 120;
  if (v5)
  {
    v11 = 112;
    v12 = 136;
  }
  else
  {
    v12 = 128;
  }
  if (v5)
    v13 = 3;
  else
    v13 = 0;
  if (v5)
    v14 = 5;
  else
    v14 = 2;
  v15 = *(id *)((char *)&self->super.isa + v11);
  v16 = *(id *)((char *)&self->super.isa + v12);
  if (objc_msgSend(v19, "needsGuideForEdge:ofRect:", v13, x, y, width, height))
  {
    v17 = -[CRLCanvasSpacingGuide initForEdge:ofGeneratingObjectRect:andParentSpacing:]([CRLCanvasSpacingGuide alloc], "initForEdge:ofGeneratingObjectRect:andParentSpacing:", v13, v19, x, y, width, height);
    -[CRLCanvasGuideController p_addSpacingGuide:toSortedArray:](self, "p_addSpacingGuide:toSortedArray:", v17, v15);
    -[CRLCanvasGuideController p_addSpacingGuide:toSortedArray:](self, "p_addSpacingGuide:toSortedArray:", v17, v16);
  }
  else
  {
    v17 = 0;
  }
  if (objc_msgSend(v19, "needsGuideForEdge:ofRect:", v14, x, y, width, height))
  {
    v18 = -[CRLCanvasSpacingGuide initForEdge:ofGeneratingObjectRect:andParentSpacing:]([CRLCanvasSpacingGuide alloc], "initForEdge:ofGeneratingObjectRect:andParentSpacing:", v14, v19, x, y, width, height);

    -[CRLCanvasGuideController p_addSpacingGuide:toSortedArray:](self, "p_addSpacingGuide:toSortedArray:", v18, v15);
    -[CRLCanvasGuideController p_addSpacingGuide:toSortedArray:](self, "p_addSpacingGuide:toSortedArray:", v18, v16);
    v17 = v18;
  }

}

- (void)p_addAlignmentGuide:(id)a3 toSortedArray:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "insertObject:atIndex:", v7, -[CRLCanvasGuideController p_indexToInsertGuide:inSortedArray:](self, "p_indexToInsertGuide:inSortedArray:", v7, v6));

}

- (void)p_addSpacingGuide:(id)a3 toSortedArray:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "insertObject:atIndex:", v7, -[CRLCanvasGuideController p_indexToInsertGuide:inSortedArray:](self, "p_indexToInsertGuide:inSortedArray:", v7, v6));

}

- (void)p_addSizingGuide:(id)a3 toSortedArray:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "insertObject:atIndex:", v7, -[CRLCanvasGuideController p_indexToInsertGuide:inSortedArray:](self, "p_indexToInsertGuide:inSortedArray:", v7, v6));

}

- (void)p_addCenterAlignmentGuide:(id)a3 toSortedArray:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "insertObject:atIndex:", v7, -[CRLCanvasGuideController p_indexToInsertGuide:inSortedArray:](self, "p_indexToInsertGuide:inSortedArray:", v7, v6));

}

- (int64_t)p_indexToInsertGuide:(id)a3 inSortedArray:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  int64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v20;
  void *v21;
  void *v22;

  v5 = a3;
  v6 = a4;
  v7 = (uint64_t)objc_msgSend(v6, "count");
  if (v7 < 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122F448);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEC2E4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122F468);
    v20 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasGuideController p_indexToInsertGuide:inSortedArray:]"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasGuideController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 1799, 0, "Out-of-bounds type assignment was clamped to max");

    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else if (!v7)
  {
    v11 = 0;
    goto LABEL_16;
  }
  v8 = 0;
  v9 = v7 - 1;
  while (1)
  {
    v10 = v9 + v8;
    if (v9 + v8 < 0 != __OFADD__(v9, v8))
      ++v10;
    v11 = v10 >> 1;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v10 >> 1));
    objc_msgSend(v5, "offset");
    v14 = sub_1003C65A0(v13);
    objc_msgSend(v12, "offset");
    if (v14 == sub_1003C65A0(v15))
      break;
    objc_msgSend(v5, "offset");
    v17 = v16;
    objc_msgSend(v12, "offset");
    if (v17 < v18)
      v9 = v11 - 1;
    else
      v8 = v11 + 1;

    if (v8 > v9)
      goto LABEL_14;
  }
  objc_msgSend(v12, "offset");
  objc_msgSend(v5, "setOffset:");

  v8 = v11;
  v9 = v11;
LABEL_14:
  if (v9 >= v11)
    v11 = v8;
LABEL_16:

  return v11;
}

- (void)p_getOffset:(double *)a3 andGuidesArray:(id *)a4 forEdge:(int)a5 ofFrame:(CGRect)a6
{
  CGFloat MinX;
  uint64_t v10;

  switch(a5)
  {
    case 0:
      MinX = CGRectGetMinX(a6);
      goto LABEL_5;
    case 1:
      MinX = CGRectGetMidX(a6);
      goto LABEL_5;
    case 2:
      MinX = CGRectGetMaxX(a6);
LABEL_5:
      v10 = 120;
      goto LABEL_10;
    case 3:
      MinX = CGRectGetMinY(a6);
      goto LABEL_9;
    case 4:
      MinX = CGRectGetMidY(a6);
      goto LABEL_9;
    case 5:
      MinX = CGRectGetMaxY(a6);
LABEL_9:
      v10 = 112;
LABEL_10:
      *a3 = MinX;
      *a4 = objc_retainAutorelease(*(id *)((char *)&self->super.isa + v10));
      break;
    default:
      return;
  }
}

- (id)p_guidesForEdge:(int)a3 ofFrame:(CGRect)a4
{
  double width;
  double y;
  double x;
  uint64_t v7;
  id v9;
  id WeakRetained;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double height;
  id v24;
  double v25;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v7 = *(_QWORD *)&a3;
  v24 = 0;
  v25 = 0.0;
  -[CRLCanvasGuideController p_getOffset:andGuidesArray:forEdge:ofFrame:](self, "p_getOffset:andGuidesArray:forEdge:ofFrame:", &v25, &v24, *(_QWORD *)&a3);
  v9 = v24;
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  objc_msgSend(WeakRetained, "visibleUnscaledRect");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = v25;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasGuideController p_predicateCanBeSnappedToByEdge:ofFrame:inVisibleUnscaledRect:](self, "p_predicateCanBeSnappedToByEdge:ofFrame:inVisibleUnscaledRect:", v7, x, y, width, height, v12, v14, v16, v18));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasGuideController p_guidesForOffset:predicate:inArray:](self, "p_guidesForOffset:predicate:inArray:", v20, v9, v19));

  return v21;
}

- (id)p_guidesForOffset:(double)a3 predicate:(id)a4 inArray:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  id v20;
  unint64_t v21;
  void *v22;
  double v23;
  void *v24;
  double v25;
  void *v27;
  void *v28;
  void *v29;

  v7 = a4;
  v8 = a5;
  v9 = (uint64_t)objc_msgSend(v8, "count");
  if (v9 < 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122F488);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEC364();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122F4A8);
    v27 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasGuideController p_guidesForOffset:predicate:inArray:]"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasGuideController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v28, v29, 1873, 0, "Out-of-bounds type assignment was clamped to max");

    v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v10 = v9;
    if (!v9)
    {
      v20 = 0;
      goto LABEL_27;
    }
  }
  v11 = 0;
  v12 = 0;
  v13 = v10 - 1;
  do
  {
    v14 = v12;
    v15 = v13 + v11;
    if (v13 + v11 < 0 != __OFADD__(v13, v11))
      v16 = v15 + 1;
    else
      v16 = v13 + v11;
    v17 = v16 >> 1;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v16 >> 1));

    objc_msgSend(v12, "offset");
    if (vabdd_f64(a3, v18) < 0.01)
      break;
    objc_msgSend(v12, "offset");
    if (v19 > a3)
      v13 = v17 - 1;
    else
      v11 = v17 + 1;
  }
  while (v11 <= v13);
  v20 = objc_alloc_init((Class)NSMutableArray);
  if (v15 >= 2)
  {
    v21 = v17 + 1;
    do
    {
      v22 = v12;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v21 - 2));

      objc_msgSend(v12, "offset");
      if (vabdd_f64(v23, a3) > 0.01)
        break;
      if (!v7 || objc_msgSend(v7, "evaluateWithObject:", v12))
        objc_msgSend(v20, "addObject:", v12);
      --v21;
    }
    while (v21 > 1);
  }
  if (v17 < v10)
  {
    do
    {
      v24 = v12;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v17));

      objc_msgSend(v12, "offset");
      if (vabdd_f64(v25, a3) > 0.01)
        break;
      if (!v7 || objc_msgSend(v7, "evaluateWithObject:", v12))
        objc_msgSend(v20, "addObject:", v12);
      ++v17;
    }
    while (v10 != v17);
  }

LABEL_27:
  return v20;
}

- (id)p_guideClosestToEdge:(int)a3 ofFrame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  id WeakRetained;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  double v19;
  void *v20;
  void *v21;
  double v23;
  id v24;
  double v25;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = *(_QWORD *)&a3;
  v25 = 0.0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  objc_msgSend(WeakRetained, "visibleUnscaledRect");
  v23 = v11;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v24 = 0;
  -[CRLCanvasGuideController p_getOffset:andGuidesArray:forEdge:ofFrame:](self, "p_getOffset:andGuidesArray:forEdge:ofFrame:", &v25, &v24, v8, x, y, width, height);
  v18 = v24;
  v19 = v25;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasGuideController p_predicateCanBeSnappedToByEdge:ofFrame:inVisibleUnscaledRect:](self, "p_predicateCanBeSnappedToByEdge:ofFrame:inVisibleUnscaledRect:", v8, x, y, width, height, v23, v13, v15, v17));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasGuideController p_closestGuideForOffset:predicate:inArray:](self, "p_closestGuideForOffset:predicate:inArray:", v20, v18, v19));

  return v21;
}

- (id)p_closestGuideForOffset:(double)a3 predicate:(id)a4 inArray:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  id v25;
  unint64_t v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  id v32;
  uint64_t v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  id v39;
  void *v41;
  void *v42;
  void *v43;

  v8 = a4;
  v9 = a5;
  v10 = (uint64_t)objc_msgSend(v9, "count");
  if (v10 < 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122F4C8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEC3E4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122F4E8);
    v41 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasGuideController p_closestGuideForOffset:predicate:inArray:]"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasGuideController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v42, v43, 1934, 0, "Out-of-bounds type assignment was clamped to max");

    v11 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v11 = v10;
    if (!v10)
    {
      v25 = 0;
      goto LABEL_36;
    }
  }
  v12 = 0;
  v13 = 0;
  v14 = v11 - 1;
  do
  {
    v15 = v13;
    v16 = v14 + v12;
    if (v14 + v12 < 0 != __OFADD__(v14, v12))
      v17 = v16 + 1;
    else
      v17 = v14 + v12;
    v18 = v17 >> 1;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v17 >> 1));

    objc_msgSend(v13, "offset");
    if (v19 == a3)
      break;
    objc_msgSend(v13, "offset");
    if (v20 > a3)
      v14 = v18 - 1;
    else
      v12 = v18 + 1;
  }
  while (v12 <= v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v18));

  objc_msgSend(v21, "offset");
  v23 = vabdd_f64(v22, a3);
  -[CRLCanvasGuideController snapDistanceToUseForGuides](self, "snapDistanceToUseForGuides");
  if (v23 >= v24 + v24 || v8 && !objc_msgSend(v8, "evaluateWithObject:", v21))
    v25 = 0;
  else
    v25 = v21;
  if (v16 >= 2)
  {
    v26 = v18 + 1;
    do
    {
      v27 = v21;
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v26 - 2));

      objc_msgSend(v21, "offset");
      v29 = vabdd_f64(v28, a3);
      -[CRLCanvasGuideController snapDistanceToUseForGuides](self, "snapDistanceToUseForGuides");
      if (v29 > v30 + v30)
        break;
      if (v25)
      {
        objc_msgSend(v25, "offset");
        if (v29 >= vabdd_f64(v31, a3))
          continue;
      }
      if (!v8 || objc_msgSend(v8, "evaluateWithObject:", v21))
      {
        v32 = v21;

        v25 = v32;
      }
      --v26;
    }
    while (v26 > 1);
  }
  v33 = v18 + 1;
  if (v33 < v11)
  {
    do
    {
      v34 = v21;
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v33));

      objc_msgSend(v21, "offset");
      v36 = vabdd_f64(v35, a3);
      -[CRLCanvasGuideController snapDistanceToUseForGuides](self, "snapDistanceToUseForGuides");
      if (v36 > v37 + v37)
        break;
      if (v25)
      {
        objc_msgSend(v25, "offset");
        if (v36 >= vabdd_f64(v38, a3))
          continue;
      }
      if (!v8 || objc_msgSend(v8, "evaluateWithObject:", v21))
      {
        v39 = v21;

        v25 = v39;
      }
      ++v33;
    }
    while (v11 != v33);
  }

LABEL_36:
  return v25;
}

- (float)p_spacingForCenterOrSpacingGuide:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  float v21;
  uint64_t v22;
  id v23;
  double v24;

  v3 = a3;
  v5 = objc_opt_class(CRLCanvasSpacingGuide, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) == 0)
  {
    v7 = objc_opt_class(CRLCanvasCenterAlignmentGuide, v6);
    if ((objc_opt_isKindOfClass(v3, v7) & 1) == 0)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10122F508);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DEC464();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10122F528);
      v8 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasGuideController p_spacingForCenterOrSpacingGuide:]"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasGuideController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 2000, 0, "Guide must have an associated spacing.");

    }
  }
  v11 = objc_opt_class(CRLCanvasSpacingGuide, v6);
  if ((objc_opt_isKindOfClass(v3, v11) & 1) != 0)
  {
    v13 = objc_opt_class(CRLCanvasSpacingGuide, v12);
    v14 = sub_100221D0C(v13, v3);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "parentSpacing"));
    objc_msgSend(v16, "exactOffset");
    v18 = v17;

LABEL_16:
    v21 = v18;

    goto LABEL_17;
  }
  v19 = objc_opt_class(CRLCanvasCenterAlignmentGuide, v12);
  v21 = 0.0;
  if ((objc_opt_isKindOfClass(v3, v19) & 1) != 0)
  {
    v22 = objc_opt_class(CRLCanvasCenterAlignmentGuide, v20);
    v23 = sub_100221D0C(v22, v3);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v23);
    objc_msgSend(v15, "exactOffset");
    v18 = v24;
    goto LABEL_16;
  }
LABEL_17:

  return v21;
}

- (id)p_predicateCanBeSnappedToInVisibleUnscaledRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v7;
  _QWORD v9[8];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (+[CRLCanvasGuideController shouldSnapToOffscreenContent](CRLCanvasGuideController, "shouldSnapToOffscreenContent"))
  {
    v7 = 0;
  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10004CC4C;
    v9[3] = &unk_10122F548;
    *(CGFloat *)&v9[4] = x;
    *(CGFloat *)&v9[5] = y;
    *(CGFloat *)&v9[6] = width;
    *(CGFloat *)&v9[7] = height;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v9));
  }
  return v7;
}

- (id)p_predicateCanBeSnappedToByEdge:(int)a3 ofFrame:(CGRect)a4 inVisibleUnscaledRect:(CGRect)a5
{
  _QWORD v6[4];
  CGRect v7;
  CGRect v8;
  int v9;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10004CD24;
  v6[3] = &unk_10122F568;
  v9 = a3;
  v7 = a4;
  v8 = a5;
  return (id)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v6));
}

- (CRLInteractiveCanvasController)interactiveCanvasController
{
  return (CRLInteractiveCanvasController *)objc_loadWeakRetained((id *)&self->_icc);
}

- (BOOL)doNotRemoveExistingGuidesWhenDisplaying
{
  return self->_doNotRemoveExistingGuidesWhenDisplaying;
}

- (void)setDoNotRemoveExistingGuidesWhenDisplaying:(BOOL)a3
{
  self->_doNotRemoveExistingGuidesWhenDisplaying = a3;
}

- (BOOL)didJustSnapInX
{
  return self->_didJustSnapInX;
}

- (void)setDidJustSnapInX:(BOOL)a3
{
  self->_didJustSnapInX = a3;
}

- (BOOL)didJustSnapInY
{
  return self->_didJustSnapInY;
}

- (void)setDidJustSnapInY:(BOOL)a3
{
  self->_didJustSnapInY = a3;
}

- (CGRect)i_currentGuidesRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_currentGuidesRect.origin.x;
  y = self->_currentGuidesRect.origin.y;
  width = self->_currentGuidesRect.size.width;
  height = self->_currentGuidesRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_icc);
  objc_storeStrong((id *)&self->_alignmentFrameInRootByLayout, 0);
  objc_storeStrong((id *)&self->_currentSizingGuideUIRenderables, 0);
  objc_storeStrong((id *)&self->_currentSizingGuides, 0);
  objc_storeStrong((id *)&self->_currentGuides, 0);
  objc_storeStrong((id *)&self->_spacingCenterGuidesForSnappingY, 0);
  objc_storeStrong((id *)&self->_spacingCenterGuidesForSnappingX, 0);
  objc_storeStrong((id *)&self->_spacingGuidesForSnappingY, 0);
  objc_storeStrong((id *)&self->_spacingGuidesForSnappingX, 0);
  objc_storeStrong((id *)&self->_guidesForSnappingX, 0);
  objc_storeStrong((id *)&self->_guidesForSnappingY, 0);
  objc_storeStrong((id *)&self->_horizontalSizingGuides, 0);
  objc_storeStrong((id *)&self->_verticalSizingGuides, 0);
  objc_storeStrong((id *)&self->_horizontalSpacings, 0);
  objc_storeStrong((id *)&self->_verticalSpacings, 0);
  objc_storeStrong((id *)&self->_guideGenerationStateLock, 0);
  objc_storeStrong((id *)&self->_guideGenerationAccessQueue, 0);
}

@end
