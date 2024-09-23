@implementation CRLMaskResizeTracker

- (CRLMaskResizeTracker)initWithImageRep:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  CRLMaskResizeTracker *v9;
  CRLMaskResizeTracker *v10;
  void *v11;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  CGFloat v19;
  objc_super v21;

  v5 = a3;
  if (!v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101237D88);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DFA49C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101237DA8);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMaskResizeTracker initWithImageRep:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMaskResizeTracker.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 30, 0, "Invalid parameter not satisfying: %{public}s", "imageRep != nil");

  }
  v21.receiver = self;
  v21.super_class = (Class)CRLMaskResizeTracker;
  v9 = -[CRLMaskResizeTracker init](&v21, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->mImageRep, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "imageLayout"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "imageGeometry"));
    objc_msgSend(v12, "frame");
    v17 = sub_100061400(v13, v14, v15, v16);
    v19 = v18;

    v10->mCenterInParentSpace.x = v17;
    v10->mCenterInParentSpace.y = v19;

  }
  return v10;
}

- (CGAffineTransform)p_currentResizeTransform
{
  double mSliderValue;
  double v6;
  double v7;
  CGFloat v8;
  CGAffineTransform v10;

  mSliderValue = self->mSliderValue;
  -[CRLImageRep maskScale](self->mImageRep, "maskScale");
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  CGAffineTransformMakeScale(&v10, mSliderValue / v6, mSliderValue / v6);
  v7 = sub_1000603DC(self->mCenterInParentSpace.x, self->mCenterInParentSpace.y, -1.0);
  return sub_1000796D4(&v10, retstr, v7, v8);
}

- (CGAffineTransform)transformForImageKnobPosition
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[CRLMaskResizeTracker p_currentResizeTransform](self, "p_currentResizeTransform");
  return CGAffineTransformMakeTranslation(retstr, v9 + CGPointZero.y * v7 + v5 * CGPointZero.x, v10 + CGPointZero.y * v8 + v6 * CGPointZero.x);
}

- (BOOL)isInspectorDrivenTracking
{
  return 1;
}

- (void)willBeginDynamicOperationForReps:(id)a3
{
  id v4;
  CRLImageRep *v5;
  CRLImageRep *mImageRep;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (objc_msgSend(v4, "count") != (id)1
    || (v5 = (CRLImageRep *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "anyObject")),
        mImageRep = self->mImageRep,
        v5,
        v5 != mImageRep))
  {
    v7 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101237DC8);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DFA540((uint64_t)v4, v7, v8);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101237DE8);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMaskResizeTracker willBeginDynamicOperationForReps:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMaskResizeTracker.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 68, 0, "Unexpected rep(s) for transformation %@", v4);

  }
}

- (BOOL)operationShouldBeDynamic
{
  return 1;
}

- (BOOL)shouldOpenCommandGroupToCommitChangesForReps:(id)a3
{
  return 0;
}

- (void)changeDynamicLayoutsForReps:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;

  v4 = a3;
  if (objc_msgSend(v4, "count") != (id)1
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "anyObject")),
        v7 = objc_opt_class(CRLImageRep, v6),
        isKindOfClass = objc_opt_isKindOfClass(v5, v7),
        v5,
        (isKindOfClass & 1) == 0))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101237E08);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DFA5F0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101237E28);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMaskResizeTracker changeDynamicLayoutsForReps:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMaskResizeTracker.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 80, 0, "image mask editor not given correct reps for resize");

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self->mImageRep, "imageLayout"));
  v13 = objc_msgSend(v12, "isInMaskScaleMode");

  if ((v13 & 1) == 0)
    -[CRLImageRep beginDynamicallyChangingMaskScale](self->mImageRep, "beginDynamicallyChangingMaskScale");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self->mImageRep, "imageLayout"));
  -[CRLMaskResizeTracker p_currentResizeTransform](self, "p_currentResizeTransform");
  objc_msgSend(v14, "resizeWithTransform:", &v17);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self->mImageRep, "imageLayout"));
  v16 = objc_msgSend(v15, "maskEditMode");

  if (v16 == (id)3)
    -[CRLCanvasRep invalidateKnobPositions](self->mImageRep, "invalidateKnobPositions");

}

- (void)commitChangesForReps:(id)a3
{
  CRLImageRep *v4;
  void *v5;
  void *v6;
  CRLCanvasCommandSelectionBehavior *v7;
  void *v8;
  CRLCanvasCommandSelectionBehavior *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _TtC8Freeform30CRLCommandSetImageItemGeometry *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  CRLCanvasCommandSelectionBehavior *v43;
  char v44[48];

  v4 = self->mImageRep;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](v4, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "commandController"));
  v7 = [CRLCanvasCommandSelectionBehavior alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "canvasEditor"));
  v9 = -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:type:](v7, "initWithCanvasEditor:type:", v8, 2);

  v43 = v9;
  objc_msgSend(v6, "openGroupWithSelectionBehavior:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep actionStringForResize](v4, "actionStringForResize"));
  objc_msgSend(v6, "setCurrentGroupActionString:", v10);

  -[CRLMaskResizeTracker p_currentResizeTransform](self, "p_currentResizeTransform");
  v11 = objc_claimAutoreleasedReturnValue(-[CRLImageRep resizedGeometryForTransform:](v4, "resizedGeometryForTransform:", v44));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](v4, "imageLayout"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "maskLayout"));
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "infoGeometry"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](v4, "imageLayout"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "maskLayout"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "pathSource"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageInfo](v4, "imageInfo"));
  v41 = (void *)v14;
  v42 = (void *)v11;
  v19 = -[CRLCommandSetImageItemGeometry initWithImageItem:imageGeometry:maskGeometry:maskPathSource:]([_TtC8Freeform30CRLCommandSetImageItemGeometry alloc], "initWithImageItem:imageGeometry:maskGeometry:maskPathSource:", v18, v11, v14, v17);
  objc_msgSend(v6, "enqueueCommand:", v19);
  objc_msgSend(v6, "closeGroup");
  -[CRLImageRep endDynamicallyChangingMaskScale:](v4, "endDynamicallyChangingMaskScale:", self->mSliderValue);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](v4, "imageLayout"));
  v21 = objc_msgSend(v20, "maskEditMode");

  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layerHost"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "imageHUDController"));
  objc_msgSend(v23, "setNotAllowedToHideHUD:", 1);

  objc_msgSend(v5, "layoutIfNeeded");
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self->mImageRep, "info"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "repsForInfo:", v24));

  if (v25
    && objc_msgSend(v25, "count")
    && (objc_msgSend(v25, "containsObject:", self->mImageRep) & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    v40 = v21;
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101237E48);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DFA674();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101237E68);
    v26 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMaskResizeTracker commitChangesForReps:]"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMaskResizeTracker.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v27, v28, 135, 0, "Image rep was moved to floating to manipulate it. This will probably do something bad for template objects.");

    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "anyObject"));
    v31 = objc_opt_class(CRLImageRep, v30);
    v39 = v29;
    v32 = sub_100221D0C(v31, v29);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    objc_msgSend(v33, "editMaskWithHUD:", 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "imageLayout"));
    v35 = objc_msgSend(v34, "maskEditMode");

    if (v35 != v40)
    {
      if (v40 == (id)3)
        v36 = 3;
      else
        v36 = 2;
      objc_msgSend(v33, "beginEditingMaskInMaskEditMode:", v36);
    }

  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layerHost"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "imageHUDController"));
  objc_msgSend(v38, "setNotAllowedToHideHUD:", 0);

  +[CATransaction commit](CATransaction, "commit");
}

- (BOOL)supportsAlignmentGuides
{
  return 0;
}

- (BOOL)traceIfDesiredForBeginOperation
{
  NSObject *v2;
  uint8_t v4[16];

  if (qword_10147E368 != -1)
    dispatch_once(&qword_10147E368, &stru_101237E88);
  v2 = off_1013D9068;
  if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "begin resize mask with slider operation", v4, 2u);
  }
  return 1;
}

- (BOOL)traceIfDesiredForEndOperation
{
  NSObject *v2;
  uint8_t v4[16];

  if (qword_10147E368 != -1)
    dispatch_once(&qword_10147E368, &stru_101237EA8);
  v2 = off_1013D9068;
  if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "end resize mask with slider operation", v4, 2u);
  }
  return 1;
}

- (double)sliderValue
{
  return self->mSliderValue;
}

- (void)setSliderValue:(double)a3
{
  self->mSliderValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mImageRep, 0);
}

@end
