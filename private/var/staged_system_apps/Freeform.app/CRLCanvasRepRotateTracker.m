@implementation CRLCanvasRepRotateTracker

- (CRLCanvasRepRotateTracker)initWithRep:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  long double v23;
  CGAffineTransform v25;
  CGAffineTransform v26;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CRLCanvasRepRotateTracker;
  v5 = -[CRLCanvasRepRotateTracker init](&v27, "init");
  if (v5)
  {
    if (!v4)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101260858);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E38614();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101260878);
      v6 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE87A4(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRepRotateTracker initWithRep:]"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRepRotateTracker.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 87, 0, "invalid nil value for '%{public}s'", "rep");

    }
    objc_msgSend(v5, "setRep:", v4);
    v5[105] = 1;
    *(_OWORD *)(v5 + 24) = xmmword_100EEC428;
    objc_msgSend(*((id *)v5 + 1), "angleForRotation");
    *((_QWORD *)v5 + 10) = v9;
    *((_QWORD *)v5 + 11) = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rep"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layout"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "parent"));

    v13 = *((double *)v5 + 10);
    if (v12)
    {
      v14 = sub_100061F64(v13 * 0.0174532925);
      v16 = v15;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rep"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "layout"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "parent"));
      v20 = v19;
      if (v19)
        objc_msgSend(v19, "transformInRoot");
      else
        memset(&v25, 0, sizeof(v25));
      CGAffineTransformInvert(&v26, &v25);
      v21 = sub_10006214C((float64x2_t *)&v26, v14, v16);
      v23 = v22;

      v13 = sub_1000618B4(v21, v23) * 57.2957795;
      *((double *)v5 + 10) = v13;
    }
    *((double *)v5 + 7) = v13;
    *((double *)v5 + 8) = v13;
    *((_QWORD *)v5 + 9) = 0;
    v5[107] = 1;
  }

  return (CRLCanvasRepRotateTracker *)v5;
}

- (void)dealloc
{
  objc_super v3;

  -[CRLCanvasRepRotateTracker p_hideHUD](self, "p_hideHUD");
  -[CRLCanvasRenderable setDelegate:](self->mGuideRenderable, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CRLCanvasRepRotateTracker;
  -[CRLCanvasRepRotateTracker dealloc](&v3, "dealloc");
}

- (void)addRotateDelta:(double)a3
{
  self->mRotateDeltaInRadians = self->mRotateDeltaInRadians - a3;
}

- (double)currentTotalAngleOfRotationInRadians
{
  return (self->mOriginalAngleInDegrees - self->mCurrentLogicalAngleInDegrees) * 0.0174532925;
}

- (BOOL)isWaitingToBeginRotation
{
  return !self->mDidBeginRotation && self->mRotateDeltaInRadians == 0.0;
}

- (void)willBeginDynamicOperationForReps:(id)a3
{
  unsigned int v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self->mRep, "interactiveCanvasController", a3));
  if (objc_msgSend(v5, "shouldSupportedDynamicOperationsEnqueueCommandsInRealTime"))
  {
    v4 = -[CRLCanvasRep allowsSupportedDynamicOperationsToBeRealTime](self->mRep, "allowsSupportedDynamicOperationsToBeRealTime");

    if (v4)
      self->mIsEnqueueingCommandsInRealTime = 1;
  }
  else
  {

  }
}

- (void)changeDynamicLayoutsForReps:(id)a3
{
  id v4;
  CRLCanvasRep *v5;
  CRLCanvasRep *mRep;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  _BOOL4 v12;
  double mSnapThreshold;
  BOOL v14;
  BOOL v15;
  float v16;
  double v17;
  double v18;
  double v19;
  _BOOL8 v20;
  void *v21;
  void *v22;
  void *v23;

  v4 = a3;
  if (objc_msgSend(v4, "count") != (id)1
    || (v5 = (CRLCanvasRep *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "anyObject")),
        mRep = self->mRep,
        v5,
        v5 != mRep))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101260898);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E386C0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012608B8);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRepRotateTracker changeDynamicLayoutsForReps:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRepRotateTracker.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 186, 0, "attempting to rotate more than one rep, or the wrong rep");

  }
  if (-[CRLCanvasRepRotateTracker isWaitingToBeginRotation](self, "isWaitingToBeginRotation"))
  {
    -[CRLCanvasRepRotateTracker p_updateCenterForRotationIfNecessary](self, "p_updateCenterForRotationIfNecessary");
    -[CRLCanvasRepRotateTracker p_updateHUDWithAngle:](self, "p_updateHUDWithAngle:", self->mOriginalAngleInDegrees);
    -[CRLCanvasRepRotateTracker p_sproingHUD](self, "p_sproingHUD");
    if (-[CRLCanvasRepRotateTracker shouldShowGuides](self, "shouldShowGuides"))
      -[CRLCanvasRepRotateTracker p_updateGuideRenderableWithAngle:didSnap:](self, "p_updateGuideRenderableWithAngle:didSnap:", 0, self->mOriginalAngleInDegrees);
  }
  else
  {
    if (!self->mDidBeginRotation)
    {
      -[CRLCanvasRepRotateTracker p_begin](self, "p_begin");
      -[CRLCanvasRepRotateTracker p_sproingHUD](self, "p_sproingHUD");
      self->mDidBeginRotation = 1;
    }
    sub_1000618C4(self->mCurrentPhysicalAngleInDegrees + self->mRotateDeltaInRadians * 180.0 / 3.14159265);
    self->mCurrentLogicalAngleInDegrees = v10;
    self->mCurrentPhysicalAngleInDegrees = v10;
    self->mRotateDeltaInRadians = 0.0;
    v11 = vabdd_f64(v10, self->mOriginalAngleInDegrees);
    if (self->mMovedMinimumDistance)
    {
      v12 = 1;
    }
    else
    {
      v12 = v11 < 350.0 && v11 > 10.0;
      self->mMovedMinimumDistance = v12;
    }
    mSnapThreshold = self->mSnapThreshold;
    if (mSnapThreshold <= 20.0 && (v11 < 355.0 ? (v14 = v11 <= 5.0) : (v14 = 1), v14 ? (v15 = !v12) : (v15 = 0), v15))
    {
      v20 = 0;
      v18 = 0.0;
    }
    else
    {
      v16 = v10 / 45.0;
      v17 = floorf(v16);
      if (fabs(-(v10 - v17 * 45.0)) >= fabs(-(v10 - (v17 + 1.0) * 45.0)))
        v18 = -(v10 - (v17 + 1.0) * 45.0);
      else
        v18 = -(v10 - v17 * 45.0);
      v19 = fabs(v18);
      v20 = v19 <= mSnapThreshold;
      if (v19 > mSnapThreshold)
        v18 = 0.0;
      else
        sub_1000618C4(v10 + v18);
      self->mCurrentLogicalAngleInDegrees = v10;
    }
    self->mPreviousSnap = v18;
    -[CRLCanvasRep dynamicallyRotatingWithTracker:](self->mRep, "dynamicallyRotatingWithTracker:", self);
    -[CRLCanvasRepRotateTracker p_updateHUDWithAngle:](self, "p_updateHUDWithAngle:", self->mCurrentLogicalAngleInDegrees);
    if (-[CRLCanvasRepRotateTracker shouldShowGuides](self, "shouldShowGuides"))
      -[CRLCanvasRepRotateTracker p_updateGuideRenderableWithAngle:didSnap:](self, "p_updateGuideRenderableWithAngle:didSnap:", v20, self->mCurrentLogicalAngleInDegrees);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self->mRep, "layout"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "layoutController"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self->mRep, "layout"));
    objc_msgSend(v22, "validateLayoutWithDependencies:", v23);

  }
}

- (CGAffineTransform)rotateTransform
{
  double mCurrentLogicalAngleInDegrees;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  long double v18;
  double v19;
  double x;
  double y;
  CGAffineTransform v23;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v26;
  float64x2_t v27[3];

  mCurrentLogicalAngleInDegrees = self->mCurrentLogicalAngleInDegrees;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepRotateTracker rep](self, "rep"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layout"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "parent"));

  if (v8)
  {
    v9 = sub_100061F64(self->mCurrentLogicalAngleInDegrees * 0.0174532925);
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepRotateTracker rep](self, "rep"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layout"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "parent"));
    v15 = v14;
    if (v14)
      objc_msgSend(v14, "transformInRoot");
    else
      memset(v27, 0, sizeof(v27));
    v16 = sub_10006214C(v27, v9, v11);
    v18 = v17;

    mCurrentLogicalAngleInDegrees = sub_1000618B4(v16, v18) * 57.2957795;
  }
  v19 = self->mOriginalAngleForRotationInDegrees - mCurrentLogicalAngleInDegrees;
  x = self->mCenterForRotation.x;
  y = self->mCenterForRotation.y;
  CGAffineTransformMakeTranslation(&t1, -x, -y);
  CGAffineTransformMakeRotation(&t2, v19 * 0.0174532925);
  CGAffineTransformConcat(&v26, &t1, &t2);
  CGAffineTransformMakeTranslation(&v23, x, y);
  return CGAffineTransformConcat(retstr, &v26, &v23);
}

- (BOOL)shouldOpenCommandGroupToCommitChangesForReps:(id)a3
{
  return 0;
}

- (void)commitChangesForReps:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  CRLCommandSelectionBehavior *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  if (self->mDidBeginRotation)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self->mRep, "interactiveCanvasController", a3));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "commandController"));
    if (-[CRLCanvasRepRotateTracker isInspectorDrivenTracking](self, "isInspectorDrivenTracking"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "infosForCurrentSelectionPath"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v8 = v6;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v25 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layoutForInfo:", v13, (_QWORD)v24));
            if (objc_msgSend(v14, "supportsRotation"))
              objc_msgSend(v7, "addObject:", v13);

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        }
        while (v10);
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "canvasEditor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "selectionPathWithInfos:", v7));

    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "canvasEditor"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self->mRep, "info"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v18));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "selectionPathWithInfos:", v19));

    }
    v20 = -[CRLCommandSelectionBehavior initWithCommitSelectionPath:forwardSelectionPath:reverseSelectionPath:]([CRLCommandSelectionBehavior alloc], "initWithCommitSelectionPath:forwardSelectionPath:reverseSelectionPath:", 0, v16, v16);
    objc_msgSend(v5, "openGroupWithSelectionBehavior:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep actionStringForRotate](self->mRep, "actionStringForRotate"));
    objc_msgSend(v5, "setCurrentGroupActionString:", v21);

    -[CRLCanvasRep dynamicRotateDidEndWithTracker:](self->mRep, "dynamicRotateDidEndWithTracker:", self);
    if (-[CRLCanvasRep shouldRasterizeRenderableDuringRotation](self->mRep, "shouldRasterizeRenderableDuringRotation"))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self->mRep, "interactiveCanvasController"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "renderableForRep:", self->mRep));
      objc_msgSend(v23, "setShouldRasterize:", 0);

    }
    if (-[CRLCanvasRepRotateTracker isInspectorDrivenTracking](self, "isInspectorDrivenTracking", (_QWORD)v24))
      -[CRLCanvasRep setShowKnobsDuringManipulation:](self->mRep, "setShowKnobsDuringManipulation:", 0);
    objc_msgSend(v5, "closeGroup");
    if (self->mIsEnqueueingCommandsInRealTime)
      objc_msgSend(v5, "closeGroup");

  }
  -[CRLCanvasRepRotateTracker p_hideHUD](self, "p_hideHUD", a3);
  -[CRLCanvasRepRotateTracker p_hideGuideRenderable](self, "p_hideGuideRenderable");
}

- (BOOL)supportsAlignmentGuides
{
  return 0;
}

- (BOOL)operationShouldBeDynamic
{
  return 1;
}

- (BOOL)traceIfDesiredForBeginOperation
{
  NSObject *v2;
  uint8_t v4[16];

  if (qword_10147E368 != -1)
    dispatch_once(&qword_10147E368, &stru_1012608D8);
  v2 = off_1013D9068;
  if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "begin rotate operation", v4, 2u);
  }
  return 1;
}

- (BOOL)traceIfDesiredForEndOperation
{
  NSObject *v3;
  double v4;
  int v6;
  double v7;

  if (qword_10147E368 != -1)
    dispatch_once(&qword_10147E368, &stru_1012608F8);
  v3 = off_1013D9068;
  if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_INFO))
  {
    v4 = self->mCurrentLogicalAngleInDegrees - self->mOriginalAngleInDegrees;
    v6 = 134217984;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "end rotate operation. rotated by %f degrees", (uint8_t *)&v6, 0xCu);
  }
  return 1;
}

- (id)repsToHide
{
  NSSet *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  uint64_t v11;

  v3 = objc_opt_new(NSSet);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepRotateTracker rep](self, "rep"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parentRep"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layout"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepRotateTracker rep](self, "rep"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layout"));
  v9 = objc_msgSend(v6, "childLayoutIsCurrentlyHiddenWhileManipulating:", v8);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepRotateTracker rep](self, "rep"));
    v11 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v10));

    v3 = (NSSet *)v11;
  }

  return v3;
}

- (NSArray)decoratorOverlayRenderables
{
  void *v2;
  CRLCanvasShapeRenderable *mGuideRenderable;

  if (self->mGuideRenderable)
  {
    mGuideRenderable = self->mGuideRenderable;
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &mGuideRenderable, 1));
  }
  else
  {
    v2 = &__NSArray0__struct;
  }
  return (NSArray *)v2;
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return +[NSNull null](NSNull, "null", a3, a4);
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "valueForKey:", CFSTR("icc"), a4));
  objc_msgSend(v5, "removeDecorator:", self);

}

- (void)p_begin
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self->mRep, "interactiveCanvasController"));
  objc_msgSend(v6, "endEditing");
  if (self->mIsEnqueueingCommandsInRealTime)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "commandController"));
    objc_msgSend(v3, "openGroup");
    objc_msgSend(v3, "enableRealTimeSyncProgressiveEnqueuingInCurrentGroup");

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepRotateTracker rep](self, "rep"));
  if (objc_msgSend(v4, "shouldRasterizeRenderableDuringRotation"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "renderableForRep:", v4));
    objc_msgSend(v5, "setShouldRasterize:", 1);
    objc_msgSend(v5, "contentsScale");
    objc_msgSend(v5, "setRasterizationScale:");

  }
  objc_msgSend(v4, "dynamicRotateDidBegin");
  objc_msgSend(v4, "setShowKnobsDuringManipulation:", -[CRLCanvasRepRotateTracker isInspectorDrivenTracking](self, "isInspectorDrivenTracking"));
  -[CRLCanvasRepRotateTracker p_updateCenterForRotationIfNecessary](self, "p_updateCenterForRotationIfNecessary");

}

- (void)p_updateCenterForRotationIfNecessary
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  double v12;
  double v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;

  if (self->mCenterForRotation.x == INFINITY && self->mCenterForRotation.y == INFINITY)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepRotateTracker rep](self, "rep"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layout"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "originalGeometry"));
    objc_msgSend(v5, "centerForRotation");
    if (v6)
    {
      v12 = v8;
      v13 = v7;
      objc_msgSend(v6, "transform");
      v8 = v12;
      v7 = v13;
      v10 = v14;
      v9 = v15;
      v11 = v16;
    }
    else
    {
      v11 = 0uLL;
      v10 = 0uLL;
      v9 = 0uLL;
    }
    self->mCenterForRotation = (CGPoint)vaddq_f64(v11, vmlaq_n_f64(vmulq_n_f64(v9, v8), v10, v7));

  }
}

- (CGPoint)p_scaledCenterForRotation
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self->mRep, "interactiveCanvasController"));
  -[CRLCanvasRepRotateTracker unscaledCenterForRotation](self, "unscaledCenterForRotation");
  objc_msgSend(v3, "convertUnscaledToBoundsPoint:");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (CGPoint)unscaledCenterForRotation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double x;
  double y;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGAffineTransform v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  CGAffineTransform v40;
  CGAffineTransform v41;
  CGPoint result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self->mRep, "layout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "originalGeometry"));

  if (!v4)
  {
    memset(&v41, 0, sizeof(v41));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self->mRep, "layout"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "geometry"));
    v10 = v9;
    if (v9)
      objc_msgSend(v9, "transform");
    else
      memset(&v36, 0, sizeof(v36));
    CGAffineTransformInvert(&v41, &v36);

    x = self->mCenterForRotation.x;
    y = self->mCenterForRotation.y;
    v13 = v41.tx + y * v41.c + v41.a * x;
    v14 = v41.ty + y * v41.d + v41.b * x;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self->mRep, "layout"));
    v16 = v25;
    if (v25)
    {
      objc_msgSend(v25, "transformInRoot");
      v17 = v31;
      v18 = v30;
      v19 = v33;
      v20 = v32;
      v21 = v35;
      v22 = v34;
      goto LABEL_14;
    }
LABEL_13:
    v21 = 0.0;
    v19 = 0.0;
    v17 = 0.0;
    v22 = 0.0;
    v20 = 0.0;
    v18 = 0.0;
    goto LABEL_14;
  }
  memset(&v41, 0, sizeof(v41));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self->mRep, "layout"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "originalGeometry"));
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "transform");
  else
    memset(&v40, 0, sizeof(v40));
  CGAffineTransformInvert(&v41, &v40);

  v11 = self->mCenterForRotation.x;
  v12 = self->mCenterForRotation.y;
  v13 = v41.tx + v12 * v41.c + v41.a * v11;
  v14 = v41.ty + v12 * v41.d + v41.b * v11;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self->mRep, "layout"));
  v16 = v15;
  if (!v15)
  {
    v38 = 0u;
    v39 = 0u;
    v37 = 0u;
    goto LABEL_13;
  }
  objc_msgSend(v15, "originalTransformInRoot");
  v17 = *((double *)&v37 + 1);
  v18 = *(double *)&v37;
  v19 = *((double *)&v38 + 1);
  v20 = *(double *)&v38;
  v21 = *((double *)&v39 + 1);
  v22 = *(double *)&v39;
LABEL_14:
  v26 = v22 + v14 * v20 + v18 * v13;
  v27 = v21 + v14 * v19 + v17 * v13;

  v28 = v26;
  v29 = v27;
  result.y = v29;
  result.x = v28;
  return result;
}

- (void)setUnscaledCenterForRotation:(CGPoint)a3
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
  void *v13;
  void *v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  void *v18;
  double v19;
  double v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;
  CGAffineTransform v24;
  float64x2_t v25;
  float64x2_t v26;
  float64x2_t v27;
  CGAffineTransform v28;
  CGAffineTransform v29;

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self->mRep, "layout"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "originalGeometry"));

  if (!v7)
  {
    memset(&v29, 0, sizeof(v29));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self->mRep, "layout"));
    v11 = v10;
    if (v10)
      objc_msgSend(v10, "transformInRoot");
    else
      memset(&v24, 0, sizeof(v24));
    CGAffineTransformInvert(&v29, &v24);

    v20 = v29.tx + y * v29.c + v29.a * x;
    v19 = v29.ty + y * v29.d + v29.b * x;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self->mRep, "layout"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "geometry"));
    v14 = v18;
    if (v18)
    {
      objc_msgSend(v18, "transform");
      v15 = v21;
      v16 = v22;
      v17 = v23;
      goto LABEL_15;
    }
    v17 = 0uLL;
LABEL_14:
    v15 = 0uLL;
    v16 = 0uLL;
    goto LABEL_15;
  }
  memset(&v29, 0, sizeof(v29));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self->mRep, "layout"));
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "originalTransformInRoot");
  else
    memset(&v28, 0, sizeof(v28));
  CGAffineTransformInvert(&v29, &v28);

  v20 = v29.tx + y * v29.c + v29.a * x;
  v19 = v29.ty + y * v29.d + v29.b * x;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self->mRep, "layout"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "originalGeometry"));
  v14 = v13;
  if (!v13)
  {
    v17 = 0uLL;
    v26 = 0u;
    v27 = 0u;
    v25 = 0u;
    goto LABEL_14;
  }
  objc_msgSend(v13, "transform");
  v15 = v25;
  v16 = v26;
  v17 = v27;
LABEL_15:
  self->mCenterForRotation = (CGPoint)vaddq_f64(v17, vmlaq_n_f64(vmulq_n_f64(v16, v19), v15, v20));

}

- (NSSet)repsBeingRotated
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepRotateTracker rep](self, "rep"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v2));

  return (NSSet *)v3;
}

- (void)p_updateHUDWithAngle:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
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
  double v24;
  double v25;
  double v26;
  double v27;

  if (-[CRLCanvasRepRotateTracker shouldShowHUD](self, "shouldShowHUD"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self->mRep, "interactiveCanvasController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasHUDController sharedHUDController](CRLCanvasHUDController, "sharedHUDController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "unitStringForAngle:", a3));
    objc_msgSend(v6, "setLabelText:", v7);
    if (-[CRLCanvasRepRotateTracker shouldRespectScaledHUDPosition](self, "shouldRespectScaledHUDPosition"))
    {
      -[CRLCanvasRepRotateTracker scaledHUDPosition](self, "scaledHUDPosition");
      v10 = sub_1000603D0(v8, v9, 20.0);
      v12 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "canvasView"));
      objc_msgSend(v6, "showHUDForKey:forTouchPoint:inCanvasView:withNudge:size:anchorPoint:", self, v13, 0, v10, v12, CGSizeZero.width, CGSizeZero.height, 0.0, 1.0);
    }
    else
    {
      -[CRLCanvasRepRotateTracker p_scaledCenterForRotation](self, "p_scaledCenterForRotation");
      v15 = v14;
      v17 = v16;
      -[CRLCanvasRep unscaledGuidePosition](self->mRep, "unscaledGuidePosition");
      objc_msgSend(v5, "convertUnscaledToBoundsPoint:");
      v26 = 0.0;
      v27 = 0.0;
      v20 = sub_10006108C(v18, v19, v15, v17);
      sub_100061EF8(&v26, v20 + 25.0, (a3 + 90.0) * -0.0174532925);
      v21 = sub_1000603D0(v26, v27, v15);
      v23 = sub_1000630C4(v21, v22);
      v25 = v24;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "canvasView"));
      objc_msgSend(v6, "showHUDForKey:forTouchPoint:inCanvasView:withUpwardsNudge:", self, v13, v23, v25, 0.0);
    }

  }
}

- (void)p_sproingHUD
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
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
  double v31;
  double v32;
  void *v33;
  void *v34;

  if (!self->mHaveSproingedHUD)
  {
    if (-[CRLCanvasRepRotateTracker shouldShowHUD](self, "shouldShowHUD"))
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasHUDController sharedHUDController](CRLCanvasHUDController, "sharedHUDController"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
      objc_msgSend(v4, "center");
      v6 = v5;
      v8 = v7;

      -[CRLCanvasRepRotateTracker p_scaledCenterForRotation](self, "p_scaledCenterForRotation");
      v10 = v9;
      v12 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "superview"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self->mRep, "interactiveCanvasController"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "layerHost"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "canvasView"));
      objc_msgSend(v14, "convertPoint:fromView:", v17, v10, v12);
      v19 = v18;
      v21 = v20;

      v22 = sub_1000603B8(v19, v21, v6);
      v24 = v23;
      v25 = sub_10006108C(v19, v21, v6, v8);
      v26 = sub_1000603DC(v22, v24, 70.0 / v25);
      v27 = sub_1000603D0(v6, v8, v26);
      v29 = v28;
      v30 = sub_10006108C(v27, v28, v6, v8);
      if (v25 >= v30)
        v31 = v27;
      else
        v31 = v19;
      if (v25 >= v30)
        v32 = v29;
      else
        v32 = v21;
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "layer"));
      objc_msgSend(v34, "crl_addZoomAnimationFromPoint:", v31, v32);

    }
    self->mHaveSproingedHUD = 1;
  }
}

- (void)p_hideHUD
{
  id v3;

  if (-[CRLCanvasRepRotateTracker shouldShowHUD](self, "shouldShowHUD"))
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(+[CRLCanvasHUDController sharedHUDController](CRLCanvasHUDController, "sharedHUDController"));
    objc_msgSend(v3, "hideHUDForKey:", self);

  }
}

- (void)p_updateGuideRenderableWithAngle:(double)a3 didSnap:(BOOL)a4
{
  _BOOL4 v4;
  CRLCanvasShapeRenderable *mGuideRenderable;
  void *v8;
  void *v9;
  double v10;
  double v11;
  CRLCanvasShapeRenderable *v12;
  CRLCanvasShapeRenderable *v13;
  CGColor *v14;
  CGPath *Mutable;
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
  CGAffineTransform v26;
  CGAffineTransform v27;
  CGRect v28;

  v4 = a4;
  mGuideRenderable = self->mGuideRenderable;
  if (!mGuideRenderable)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self->mRep, "interactiveCanvasController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "canvas"));
    objc_msgSend(v9, "contentsScale");
    v11 = v10;

    v12 = (CRLCanvasShapeRenderable *)objc_claimAutoreleasedReturnValue(+[CRLCanvasShapeRenderable renderable](CRLCanvasShapeRenderable, "renderable"));
    v13 = self->mGuideRenderable;
    self->mGuideRenderable = v12;

    v14 = sub_100011C1C(0.933000028, 0.791999996, 0.0, 1.0);
    -[CRLCanvasShapeRenderable setStrokeColor:](self->mGuideRenderable, "setStrokeColor:", v14);
    CGColorRelease(v14);
    -[CRLCanvasShapeRenderable setFillColor:](self->mGuideRenderable, "setFillColor:", 0);
    -[CRLCanvasShapeRenderable setLineWidth:](self->mGuideRenderable, "setLineWidth:", 1.0 / v11);
    -[CRLCanvasRenderable setZPosition:](self->mGuideRenderable, "setZPosition:", -1.0);
    -[CRLCanvasRenderable setAnchorPoint:](self->mGuideRenderable, "setAnchorPoint:", 0.5, 0.0);
    -[CRLCanvasRenderable setDelegate:](self->mGuideRenderable, "setDelegate:", self);
    -[CRLCanvasRenderable setEdgeAntialiasingMask:](self->mGuideRenderable, "setEdgeAntialiasingMask:", 0);
    Mutable = CGPathCreateMutable();
    -[CRLCanvasRepRotateTracker p_scaledCenterForRotation](self, "p_scaledCenterForRotation");
    v17 = floor(v16);
    v19 = floor(v18);
    -[CRLCanvasRep unscaledGuidePosition](self->mRep, "unscaledGuidePosition");
    objc_msgSend(v8, "convertUnscaledToBoundsPoint:");
    v21 = v20;
    v23 = v22;
    CGPathMoveToPoint(Mutable, 0, 0.0, -10.0);
    v24 = sub_10006108C(v21, v23, v17, v19);
    CGPathAddLineToPoint(Mutable, 0, 0.0, v24 + 10.0);
    v28.origin.x = -5.5;
    v28.origin.y = -5.5;
    v28.size.width = 11.0;
    v28.size.height = 11.0;
    CGPathAddEllipseInRect(Mutable, 0, v28);
    CGPathMoveToPoint(Mutable, 0, -10.0, 0.0);
    CGPathAddLineToPoint(Mutable, 0, 10.0, 0.0);
    -[CRLCanvasShapeRenderable setPath:](self->mGuideRenderable, "setPath:", Mutable);
    CGPathRelease(Mutable);
    -[CRLCanvasRenderable setPosition:](self->mGuideRenderable, "setPosition:", v17, v19);
    objc_msgSend(v8, "addDecorator:", self);

    mGuideRenderable = self->mGuideRenderable;
  }
  CGAffineTransformMakeRotation(&v27, (a3 + 180.0) * -0.0174532925);
  v26 = v27;
  -[CRLCanvasRenderable setAffineTransform:](mGuideRenderable, "setAffineTransform:", &v26);
  LODWORD(v25) = 1050253722;
  if (v4)
    *(float *)&v25 = 1.0;
  -[CRLCanvasRenderable setOpacity:](self->mGuideRenderable, "setOpacity:", v25);
}

- (void)p_hideGuideRenderable
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity")));
  objc_msgSend(v8, "setDuration:", 0.400000006);
  -[CRLCanvasRenderable opacity](self->mGuideRenderable, "opacity");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  objc_msgSend(v8, "setFromValue:", v3);

  LODWORD(v4) = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4));
  objc_msgSend(v8, "setToValue:", v5);

  objc_msgSend(v8, "setDelegate:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self->mRep, "interactiveCanvasController"));
  objc_msgSend(v8, "setValue:forKey:", v6, CFSTR("icc"));

  -[CRLCanvasRenderable addAnimation:forKey:](self->mGuideRenderable, "addAnimation:forKey:", v8, CFSTR("fade out"));
  LODWORD(v7) = 0;
  -[CRLCanvasRenderable setOpacity:](self->mGuideRenderable, "setOpacity:", v7);

}

- (BOOL)shouldShowGuides
{
  return self->mShouldShowGuides;
}

- (void)setShouldShowGuides:(BOOL)a3
{
  self->mShouldShowGuides = a3;
}

- (BOOL)isEnqueueingCommandsInRealTime
{
  return self->mIsEnqueueingCommandsInRealTime;
}

- (CRLCanvasRep)rep
{
  return self->mRep;
}

- (void)setRep:(id)a3
{
  objc_storeStrong((id *)&self->mRep, a3);
}

- (BOOL)shouldShowHUD
{
  return self->mShouldShowHUD;
}

- (void)setShouldShowHUD:(BOOL)a3
{
  self->mShouldShowHUD = a3;
}

- (CGPoint)centerForRotation
{
  double x;
  double y;
  CGPoint result;

  x = self->mCenterForRotation.x;
  y = self->mCenterForRotation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCenterForRotation:(CGPoint)a3
{
  self->mCenterForRotation = a3;
}

- (double)currentLogicalAngleInDegrees
{
  return self->mCurrentLogicalAngleInDegrees;
}

- (double)originalAngleInDegrees
{
  return self->mOriginalAngleInDegrees;
}

- (CGPoint)scaledHUDPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->mScaledHUDPosition.x;
  y = self->mScaledHUDPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setScaledHUDPosition:(CGPoint)a3
{
  self->mScaledHUDPosition = a3;
}

- (BOOL)shouldRespectScaledHUDPosition
{
  return self->_mShouldRespectScaledHUDPosition;
}

- (void)setShouldRespectScaledHUDPosition:(BOOL)a3
{
  self->_mShouldRespectScaledHUDPosition = a3;
}

- (double)snapThreshold
{
  return self->mSnapThreshold;
}

- (void)setSnapThreshold:(double)a3
{
  self->mSnapThreshold = a3;
}

- (BOOL)isInspectorDrivenTracking
{
  return self->mIsInspectorDrivenTracking;
}

- (void)setIsInspectorDrivenTracking:(BOOL)a3
{
  self->mIsInspectorDrivenTracking = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mGuideRenderable, 0);
  objc_storeStrong((id *)&self->mRep, 0);
}

@end
