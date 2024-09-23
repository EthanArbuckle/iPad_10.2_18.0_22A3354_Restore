@implementation CRLCanvasRepFreeTransformTracker

- (CRLCanvasRepFreeTransformTracker)initWithReps:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  double v25;
  double v26;
  CGPoint v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  void *j;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  objc_super v54;
  _BYTE v55[128];
  _BYTE v56[128];

  v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)CRLCanvasRepFreeTransformTracker;
  v5 = -[CRLCanvasRepFreeTransformTracker init](&v54, "init");
  if (v5)
  {
    if (!objc_msgSend(v4, "count"))
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123DB98);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E0172C();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123DBB8);
      v6 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRepFreeTransformTracker initWithReps:]"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRepFreeTransformTracker.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 110, 0, "Tried to free transform with no reps");

    }
    v9 = objc_msgSend(v4, "copy");
    v10 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "anyObject"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "interactiveCanvasController"));
    v13 = (void *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = v12;

    v14 = objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
    v15 = (void *)*((_QWORD *)v5 + 5);
    *((_QWORD *)v5 + 5) = v14;

    v16 = objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
    v17 = (void *)*((_QWORD *)v5 + 6);
    *((_QWORD *)v5 + 6) = v16;

    *(_OWORD *)(v5 + 24) = xmmword_100EEC428;
    if ((unint64_t)objc_msgSend(*((id *)v5 + 2), "count") >= 2)
    {
      v5[208] = 1;
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v5 + 2), "anyObject"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "layout"));
      v5[208] = objc_msgSend(v19, "supportsRotation");

    }
    *((_QWORD *)v5 + 27) = 0x408F380000000000;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v20 = *((id *)v5 + 2);
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v51;
      while (2)
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(_QWORD *)v51 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)i), "angleForRotation");
          v26 = *((double *)v5 + 27);
          if (v26 == 999.0)
          {
            *((double *)v5 + 27) = v25;
          }
          else if (v25 != v26)
          {
            *((_QWORD *)v5 + 27) = 0;
            goto LABEL_27;
          }
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
        if (v22)
          continue;
        break;
      }
    }
LABEL_27:

    *(_DWORD *)(v5 + 57) = 0;
    v27 = CGPointZero;
    *((CGPoint *)v5 + 4) = CGPointZero;
    *((_QWORD *)v5 + 25) = 0;
    *(CGPoint *)(v5 + 152) = v27;
    *(_WORD *)(v5 + 209) = 0;
    v27.x = *((CGFloat *)v5 + 27);
    *((_QWORD *)v5 + 29) = *(_QWORD *)&v27.x;
    *((_QWORD *)v5 + 30) = *(_QWORD *)&v27.x;
    v5[248] = 1;
    *((_QWORD *)v5 + 32) = 0;
    *((_WORD *)v5 + 148) = 0;
    *((_OWORD *)v5 + 19) = xmmword_100EED720;
    *((_OWORD *)v5 + 20) = xmmword_100EED730;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v28 = *((id *)v5 + 2);
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v47;
      do
      {
        for (j = 0; j != v30; j = (char *)j + 1)
        {
          if (*(_QWORD *)v47 != v31)
            objc_enumerationMutation(v28);
          v33 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)j);
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "infoForTransforming", (_QWORD)v46));
          if (v34)
          {
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "interactiveCanvasController"));
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "layoutForInfo:", v34));

            objc_msgSend(v36, "minimumSizeForResizingKnob:", 0);
            v38 = v37;
            v40 = v39;
            objc_msgSend(v33, "boundsForStandardKnobs");
            if (v41 > 0.0)
            {
              v43 = *((double *)v5 + 41);
              if (v43 < v38 / v41)
                v43 = v38 / v41;
              *((double *)v5 + 41) = v43;
            }
            if (v42 > 0.0)
            {
              v44 = *((double *)v5 + 41);
              if (v44 < v40 / v42)
                v44 = v40 / v42;
              *((double *)v5 + 41) = v44;
            }

          }
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
      }
      while (v30);
    }

    *((double *)v5 + 41) = fmin(*((double *)v5 + 41), 1.0);
  }

  return (CRLCanvasRepFreeTransformTracker *)v5;
}

- (void)dealloc
{
  objc_super v3;

  -[CRLCanvasRenderable setDelegate:](self->mRotationGuideRenderable, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CRLCanvasRepFreeTransformTracker;
  -[CRLCanvasRepFreeTransformTracker dealloc](&v3, "dealloc");
}

- (void)addUnscaledDragDelta:(CGPoint)a3
{
  double x;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  CGFloat v13;

  x = a3.x;
  if (self->mStartedDragging)
    goto LABEL_6;
  v5 = sub_1000603D0(self->mUnscaledDragDetent.x, self->mUnscaledDragDetent.y, a3.x);
  self->mUnscaledDragDetent.x = v5;
  self->mUnscaledDragDetent.y = v6;
  v7 = sub_100061070(v5, v6);
  -[CRLInteractiveCanvasController viewScale](self->mICC, "viewScale");
  v9 = v7 * v8;
  v10 = 20.0;
  if (!self->mStartedRotation && !self->mStartedMagnification)
    v10 = 5.0;
  self->mStartedDragging = v9 > v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  self->mLastUpdateGuidesTimestamp = v12;

  if (self->mStartedDragging)
  {
LABEL_6:
    self->mUnscaledDragDelta.x = sub_1000603D0(self->mUnscaledDragDelta.x, self->mUnscaledDragDelta.y, x);
    self->mUnscaledDragDelta.y = v13;
  }
}

- (void)addRotateDelta:(double)a3
{
  self->mRotateDeltaInRadians = self->mRotateDeltaInRadians - a3;
}

- (void)setMagnification:(double)a3
{
  double v3;
  double mMagnificationStartOffset;
  double mMagnifyBy;

  if (!self->mStartedMagnification)
  {
    v3 = 0.85;
    if (self->mStartedRotation)
      v3 = 0.75;
    if (v3 <= a3 && dbl_100EED740[!self->mStartedRotation] >= a3)
    {
      mMagnifyBy = self->mMagnifyBy;
      goto LABEL_13;
    }
    self->mStartedMagnification = 1;
    self->mMagnificationStartOffset = a3 + -1.0;
  }
  mMagnificationStartOffset = self->mMagnificationStartOffset;
  if (mMagnificationStartOffset + 1.0 <= a3)
    mMagnifyBy = a3 - mMagnificationStartOffset;
  else
    mMagnifyBy = a3 / (mMagnificationStartOffset + 1.0);
LABEL_13:
  if (self->mMinimumMagnification >= mMagnifyBy)
    mMagnifyBy = self->mMinimumMagnification;
  self->mMagnifyBy = mMagnifyBy;
}

- (CGSize)currentSizeForLayout:(id)a3
{
  double mMagnifyBy;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  objc_msgSend(a3, "initialBoundsForStandardKnobs");
  mMagnifyBy = self->mMagnifyBy;
  v6 = fabs(mMagnifyBy * v5);
  v8 = fabs(mMagnifyBy * v7);
  result.height = v8;
  result.width = v6;
  return result;
}

- (id)selectedRepForLayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  __int128 v9;
  void *v10;
  NSSet *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKeyedSubscript:](self->mLayoutToSelectedRepMap, "objectForKeyedSubscript:", v4));
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v8 = v4;
    if (v8)
    {
      v9 = 0uLL;
      v10 = v8;
      v21 = v8;
      do
      {
        v24 = v9;
        v25 = v9;
        v22 = v9;
        v23 = v9;
        v11 = self->mReps;
        v12 = -[NSSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v23;
          while (2)
          {
            for (i = 0; i != v13; i = (char *)i + 1)
            {
              if (*(_QWORD *)v23 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "layout"));

              if (v10 == v17)
              {
                -[NSMapTable setObject:forKeyedSubscript:](self->mLayoutToSelectedRepMap, "setObject:forKeyedSubscript:", v16, v21);
                v7 = v16;
                goto LABEL_24;
              }
            }
            v13 = -[NSSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
            if (v13)
              continue;
            break;
          }
        }

        v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "parent"));
        v10 = (void *)v18;
        v9 = 0uLL;
      }
      while (v18);
    }
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", *(double *)&v9);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123DBD8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E017AC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123DBF8);
    v19 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRepFreeTransformTracker selectedRepForLayout:]"));
    v11 = (NSSet *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRepFreeTransformTracker.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 240, 0, "CRLCanvasRepFreeTransformTracker: could not find a selected rep for the given layout");
    v7 = 0;
LABEL_24:

  }
  return v7;
}

- (id)currentGeometryForLayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  __int128 v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  CGAffineTransform v33;
  CGAffineTransform v34;
  CGAffineTransform v35;
  CGAffineTransform v36;
  CGAffineTransform t2;
  CGAffineTransform t1;
  _BYTE v39[48];
  CGAffineTransform v40;
  _BYTE v41[48];
  CGAffineTransform v42;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "computeInfoGeometryDuringResize"));
  v6 = v5;
  if (!v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepFreeTransformTracker selectedRepForLayout:](self, "selectedRepForLayout:", v4));
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layout"));

    if (v9 == v4)
    {
      memset(&v42, 0, sizeof(v42));
      -[CRLCanvasRepFreeTransformTracker freeTransformForLayout:](self, "freeTransformForLayout:", v4);
      if (v4)
        objc_msgSend(v4, "layoutTransformInInfoSpace:", v41);
      else
        memset(&v42, 0, sizeof(v42));
      v40 = v42;
      v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "resizedGeometryForTransform:", &v40));
      goto LABEL_25;
    }
    memset(&v42, 0, sizeof(v42));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layout"));
    -[CRLCanvasRepFreeTransformTracker resizeTransformForLayout:](self, "resizeTransformForLayout:", v4);
    if (v10)
      objc_msgSend(v10, "layoutTransformInInfoSpace:", v39);
    else
      memset(&v42, 0, sizeof(v42));

    v11 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v40.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v40.c = v11;
    *(_OWORD *)&v40.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    *(_QWORD *)&v13 = objc_opt_class(CRLCanvasLayout, v12).n128_u64[0];
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parent", v13));
    v17 = sub_100221D0C(v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

    if (!v18 || !objc_msgSend(v18, "isBeingManipulated"))
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController repForLayout:](self->mICC, "repForLayout:", v4));
      t1 = v42;
      v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "resizedGeometryForTransform:", &t1));

LABEL_24:
LABEL_25:

      goto LABEL_26;
    }
    do
    {
      if (!objc_msgSend(v18, "isBeingManipulated"))
        break;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "originalPureGeometry"));
      v20 = v19;
      if (v19)
        objc_msgSend(v19, "transform");
      else
        memset(&t2, 0, sizeof(t2));
      t1 = v40;
      CGAffineTransformConcat(&v40, &t1, &t2);

      *(_QWORD *)&v22 = objc_opt_class(CRLCanvasLayout, v21).n128_u64[0];
      v24 = v23;
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "parent", v22));
      v26 = sub_100221D0C(v24, v25);
      v27 = objc_claimAutoreleasedReturnValue(v26);

      v18 = (void *)v27;
    }
    while (v27);
    memset(&t1, 0, sizeof(t1));
    v36 = v42;
    v35 = v40;
    sub_100079650(&v36, &v35, &t1);
    t1.tx = 0.0;
    t1.ty = 0.0;
    v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "infoGeometryBeforeDynamicOperation"));
    if (v28)
    {
      v29 = (void *)v28;
    }
    else
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "info"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "geometry"));

      if (!v29)
      {
        memset(&v33, 0, sizeof(v33));
        goto LABEL_23;
      }
    }
    objc_msgSend(v29, "fullTransform");

LABEL_23:
    v36 = t1;
    CGAffineTransformConcat(&v34, &v33, &v36);
    v7 = (id)objc_claimAutoreleasedReturnValue(+[CRLCanvasInfoGeometry geometryFromFullTransform:](CRLCanvasInfoGeometry, "geometryFromFullTransform:", &v34));
    goto LABEL_24;
  }
  v7 = v5;
LABEL_26:

  return v7;
}

- (void)willBeginDynamicOperationForReps:(id)a3
{
  NSSet *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  if (-[CRLInteractiveCanvasController shouldSupportedDynamicOperationsEnqueueCommandsInRealTime](self->mICC, "shouldSupportedDynamicOperationsEnqueueCommandsInRealTime", a3))
  {
    self->mIsEnqueueingCommandsInRealTime = 1;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = self->mReps;
    v5 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "allowsSupportedDynamicOperationsToBeRealTime", (_QWORD)v9) & 1) == 0)
          {
            self->mIsEnqueueingCommandsInRealTime = 0;
            goto LABEL_12;
          }
        }
        v6 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
}

- (void)changeDynamicLayoutsForReps:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double x;
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
  CGFloat v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  double v33;
  double mCurrentAngleInDegrees;
  double v35;
  int mIgnoreDetents;
  _BOOL4 v37;
  _BOOL4 v38;
  _BOOL4 v39;
  BOOL v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double mMagnifyBy;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  NSSet *v51;
  id v52;
  id v53;
  uint64_t v54;
  void *i;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  if (v5 != (id)-[NSSet count](self->mReps, "count"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123DC18);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0182C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123DC38);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRepFreeTransformTracker changeDynamicLayoutsForReps:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRepFreeTransformTracker.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 301, 0, "Mismatched rep count");

  }
  x = self->mUnscaledDrag.x;
  v10 = self->mRotateDeltaInRadians * 180.0;
  self->mRotateDeltaInRadians = 0.0;
  v11 = sub_1000603D0(x, self->mUnscaledDrag.y, self->mUnscaledDragDelta.x);
  v13 = v12;
  -[CRLInteractiveCanvasController viewScale](self->mICC, "viewScale");
  v15 = sub_1000630F8(v11, v13, v14);
  self->mUnscaledDrag.x = v15;
  self->mUnscaledDrag.y = v16;
  v17 = sub_1000603B8(v15, v16, x);
  v19 = v18;
  self->mUnscaledDragDelta.x = sub_1000603B8(self->mUnscaledDragDelta.x, self->mUnscaledDragDelta.y, v17);
  self->mUnscaledDragDelta.y = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v21, "timeIntervalSinceReferenceDate");
  v23 = v22;

  v24 = v23 - self->mLastUpdateGuidesTimestamp;
  self->mLastUpdateGuidesTimestamp = v23;
  if (v24 > 0.005)
  {
    -[CRLInteractiveCanvasController viewScale](self->mICC, "viewScale");
    v26 = sub_1000603DC(v17, v19, v25 / v24);
    self->mSmoothedDragSpeed.x = sub_100060FB8(self->mSmoothedDragSpeed.x, self->mSmoothedDragSpeed.y, v26, v27, fmin(v24 * 5.0, 1.0));
    self->mSmoothedDragSpeed.y = v28;
  }
  v29 = v10 / 3.14159265;
  if (self->mRotationSnapped)
  {
    v30 = v29 + self->mRotationDetent;
    self->mRotationDetent = v30;
    if (self->mSupportsRotation)
    {
      v31 = fabs(v30);
      v32 = 272;
      if (!self->mStartedRotation)
        v32 = 264;
      if (v31 > *(double *)((char *)&self->super.isa + v32))
      {
        self->mRotationSnapped = 0;
        self->mStartedRotation = 1;
        sub_1000618C4(v29 + self->mCurrentAngleInDegrees);
        self->mCurrentAngleInDegrees = v33;
      }
    }
  }
  else
  {
    mCurrentAngleInDegrees = self->mCurrentAngleInDegrees;
    sub_1000618C4(v29 + mCurrentAngleInDegrees);
    self->mCurrentAngleInDegrees = v35;
    mIgnoreDetents = self->mIgnoreDetents;
    if (!self->mIgnoreDetents)
    {
      v37 = mCurrentAngleInDegrees < 90.0;
      if (v35 <= 270.0)
        v37 = 0;
      v38 = mCurrentAngleInDegrees > 270.0;
      if (v35 >= 90.0)
        v38 = 0;
      if (v29 > 0.0)
        v37 = v38;
      while (1)
      {
        v39 = (mCurrentAngleInDegrees - (double)mIgnoreDetents) * (v35 - (double)mIgnoreDetents) <= 0.0;
        if (!mIgnoreDetents)
          v39 = v37;
        if (v39)
          break;
        v40 = mIgnoreDetents >= 0x10E;
        mIgnoreDetents += 90;
        if (v40)
        {
          self->mRotationSnapped = 0;
          goto LABEL_33;
        }
      }
      self->mRotationSnapped = v39;
      self->mCurrentAngleInDegrees = (double)mIgnoreDetents;
      self->mRotationDetent = 0.0;
    }
  }
LABEL_33:
  if (!self->mStartedFreeTransform)
  {
    if (!self->mStartedRotation && !self->mStartedMagnification && !self->mStartedDragging)
      goto LABEL_75;
    -[CRLCanvasRepFreeTransformTracker p_begin](self, "p_begin");
    self->mStartedFreeTransform = 1;
  }
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController commandController](self->mICC, "commandController"));
  v42 = v41;
  if (self->mIsEnqueueingCommandsInRealTime)
    objc_msgSend(v41, "openGroup");
  if (self->mStartedDragging && self->mShouldShowAndSnapToAlignmentGuides)
  {
    -[CRLCanvasRepFreeTransformTracker p_updateDragGuidesAndSnap:](self, "p_updateDragGuidesAndSnap:", v17, v19);
  }
  else
  {
    self->mPreviousDragSnapDiff = CGPointZero;
    *(_DWORD *)&self->mSnappedInX = 0;
  }
  self->mIsDragging = 0;
  self->mIsResizing = 0;
  self->mIsRotating = 0;
  v43 = self->mCurrentAngleInDegrees;
  v44 = self->mLastAngleInDegrees - v43;
  if (v44 < 0.0)
    v44 = -v44;
  if (v44 > 0.05)
  {
    self->mLastAngleInDegrees = v43;
    self->mIsRotating = 1;
  }
  mMagnifyBy = self->mMagnifyBy;
  if (self->mLastMagnifyBy != mMagnifyBy)
  {
    self->mLastMagnifyBy = mMagnifyBy;
    *(_WORD *)&self->mIsResizing = 257;
  }
  v46 = sub_1000603B8(self->mLastUnscledDrag.x, self->mLastUnscledDrag.y, self->mUnscaledDrag.x);
  v48 = sub_100061070(v46, v47);
  -[CRLInteractiveCanvasController viewScale](self->mICC, "viewScale");
  if (v48 * v49 >= 0.5)
  {
    self->mLastUnscledDrag = self->mUnscaledDrag;
    self->mIsDragging = 1;
LABEL_56:
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v51 = self->mReps;
    v52 = -[NSSet countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
    if (v52)
    {
      v53 = v52;
      v54 = *(_QWORD *)v64;
      do
      {
        for (i = 0; i != v53; i = (char *)i + 1)
        {
          if (*(_QWORD *)v64 != v54)
            objc_enumerationMutation(v51);
          v56 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v56, "dynamicallyFreeTransformingWithTracker:", self, (_QWORD)v63);
          v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "layout"));
          objc_msgSend(v50, "addObject:", v57);

        }
        v53 = -[NSSet countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
      }
      while (v53);
    }

    if (self->mShouldShowAndSnapToAlignmentGuides && (unint64_t)objc_msgSend(v4, "count") <= 0xE)
    {
      v58 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet anyObject](self->mReps, "anyObject"));
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "layout"));
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "layoutController"));
      objc_msgSend(v60, "validateLayoutsWithDependencies:", v50);

    }
    goto LABEL_67;
  }
  if (self->mIsDragging || self->mIsRotating || self->mIsResizing)
    goto LABEL_56;
LABEL_67:
  if (self->mShouldRenderGuideInX || self->mShouldRenderGuideInY)
  {
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController guideController](self->mICC, "guideController", (_QWORD)v63));
    objc_msgSend(v61, "showGuidesAlignedWithRect:shouldRenderX:shouldRenderY:", self->mShouldRenderGuideInX, self->mShouldRenderGuideInY, self->mAlignmentRect.origin.x, self->mAlignmentRect.origin.y, self->mAlignmentRect.size.width, self->mAlignmentRect.size.height);

    v62 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController guideController](self->mICC, "guideController"));
    objc_msgSend(v62, "setDoNotRemoveExistingGuidesWhenDisplaying:", 0);
  }
  else
  {
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController guideController](self->mICC, "guideController"));
    objc_msgSend(v62, "hideAlignmentGuides");
  }

  if (self->mStartedRotation)
    -[CRLCanvasRepFreeTransformTracker p_updateGuideRenderableWithAngle:didSnap:](self, "p_updateGuideRenderableWithAngle:didSnap:", self->mRotationSnapped, self->mCurrentAngleInDegrees);
  if (self->mIsEnqueueingCommandsInRealTime)
    objc_msgSend(v42, "closeGroup");

LABEL_75:
}

- (CGAffineTransform)rotateTransformForLayout:(SEL)a3
{
  id v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  __int128 v23;
  float64x2_t v24;
  float64x2_t v25;
  float64x2_t v26;
  float64x2_t v27;
  void *v28;
  float64x2_t v29;
  double v30;
  CGFloat v31;
  CGAffineTransform *result;
  __int128 v33;
  double v34;
  double v35;
  double v36;
  float64x2_t v37;
  float64x2_t v38;
  float64x2_t v39;
  CGAffineTransform v40;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v43;
  CGAffineTransform v44;

  v6 = a4;
  v7 = self->mOriginalAngleInDegrees - self->mCurrentAngleInDegrees;
  -[CRLCanvasRepFreeTransformTracker pivotPointForLayout:](self, "pivotPointForLayout:", v6);
  v9 = v8;
  v11 = v10;
  memset(&v44, 0, sizeof(v44));
  CGAffineTransformMakeTranslation(&t1, -v8, -v10);
  CGAffineTransformMakeRotation(&t2, v7 * 0.0174532925);
  CGAffineTransformConcat(&v43, &t1, &t2);
  CGAffineTransformMakeTranslation(&v40, v9, v11);
  CGAffineTransformConcat(&v44, &v43, &v40);
  if (objc_msgSend(v6, "supportsRotation"))
  {
    v12 = *(_OWORD *)&v44.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v44.a;
    *(_OWORD *)&retstr->c = v12;
    v13 = *(_OWORD *)&v44.tx;
LABEL_5:
    *(_OWORD *)&retstr->tx = v13;
    goto LABEL_13;
  }
  if ((id)-[NSSet count](self->mReps, "count") == (id)1)
  {
    v14 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&retstr->c = v14;
    v13 = *(_OWORD *)&CGAffineTransformIdentity.tx;
    goto LABEL_5;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKeyedSubscript:](self->mLayoutToCenterForRotationMap, "objectForKeyedSubscript:", v6));
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "CGPointValue");
    v18 = v17;
    v20 = v19;
  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "originalGeometry"));
    objc_msgSend(v6, "centerForRotation");
    if (v21)
    {
      v33 = v23;
      v35 = v22;
      objc_msgSend(v21, "transform");
      v23 = v33;
      v22 = v35;
      v25 = v37;
      v24 = v38;
      v26 = v39;
    }
    else
    {
      v26 = 0uLL;
      v38 = 0u;
      v39 = 0u;
      v37 = 0u;
      v25 = 0uLL;
      v24 = 0uLL;
    }
    v27 = vaddq_f64(v26, vmlaq_n_f64(vmulq_n_f64(v24, *(double *)&v23), v25, v22));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", *(_QWORD *)&v27.f64[1], *((_QWORD *)&v23 + 1), *(_OWORD *)&v27, *(_OWORD *)&v37, *(_OWORD *)&v38, *(_OWORD *)&v39));
    -[NSMapTable setObject:forKeyedSubscript:](self->mLayoutToCenterForRotationMap, "setObject:forKeyedSubscript:", v28, v6);

    v20 = v34;
    v18 = v36;
  }
  v29 = vaddq_f64(*(float64x2_t *)&v44.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v44.c, v20), *(float64x2_t *)&v44.a, v18));
  v30 = sub_1000603B8(v29.f64[0], v29.f64[1], v18);
  CGAffineTransformMakeTranslation(retstr, v30, v31);

LABEL_13:
  return result;
}

- (CGAffineTransform)resizeTransformForLayout:(SEL)a3
{
  id v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  id v12;
  uint64_t v13;
  __int128 v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  CGAffineTransform *result;
  CGAffineTransform v33;
  CGAffineTransform v34;
  CGAffineTransform v35;
  CGAffineTransform v36;
  CGAffineTransform v37;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v40;
  CGAffineTransform v41;

  v6 = a4;
  -[CRLCanvasRepFreeTransformTracker pivotPointForLayout:](self, "pivotPointForLayout:", v6);
  v8 = v7;
  v10 = v9;
  memset(&v41, 0, sizeof(v41));
  CGAffineTransformMakeTranslation(&t1, -v7, -v9);
  CGAffineTransformMakeScale(&t2, self->mMagnifyBy, self->mMagnifyBy);
  CGAffineTransformConcat(&v40, &t1, &t2);
  CGAffineTransformMakeTranslation(&v37, v8, v10);
  CGAffineTransformConcat(&v41, &v40, &v37);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepFreeTransformTracker selectedRepForLayout:](self, "selectedRepForLayout:", v6));
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layout"));

  if (v12 == v6)
  {
    v31 = *(_OWORD *)&v41.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v41.a;
    *(_OWORD *)&retstr->c = v31;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v41.tx;
  }
  else
  {
    v14 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v36.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v36.c = v14;
    *(_OWORD *)&v36.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    *(_QWORD *)&v15 = objc_opt_class(CRLCanvasLayout, v13).n128_u64[0];
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "parent", v15));
    v19 = sub_100221D0C(v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

    if (v20 && objc_msgSend(v20, "isBeingManipulated"))
    {
      do
      {
        if (!objc_msgSend(v20, "isBeingManipulated"))
          break;
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "originalPureGeometry"));
        v22 = v21;
        if (v21)
          objc_msgSend(v21, "transform");
        else
          memset(&v35, 0, sizeof(v35));
        v34 = v36;
        CGAffineTransformConcat(&v36, &v34, &v35);

        *(_QWORD *)&v24 = objc_opt_class(CRLCanvasLayout, v23).n128_u64[0];
        v26 = v25;
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "parent", v24));
        v28 = sub_100221D0C(v26, v27);
        v29 = objc_claimAutoreleasedReturnValue(v28);

        v20 = (void *)v29;
      }
      while (v29);
      *(_OWORD *)&retstr->c = 0u;
      *(_OWORD *)&retstr->tx = 0u;
      *(_OWORD *)&retstr->a = 0u;
      v34 = v41;
      v33 = v36;
      sub_100079650(&v34, &v33, retstr);
      retstr->tx = 0.0;
      retstr->ty = 0.0;
    }
    else
    {
      v30 = *(_OWORD *)&v41.c;
      *(_OWORD *)&retstr->a = *(_OWORD *)&v41.a;
      *(_OWORD *)&retstr->c = v30;
      *(_OWORD *)&retstr->tx = *(_OWORD *)&v41.tx;
    }

  }
  return result;
}

- (CGAffineTransform)freeTransformForLayout:(SEL)a3
{
  id v6;
  void *v7;
  id v8;
  CGAffineTransform *result;
  CGAffineTransform v10;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v13;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepFreeTransformTracker selectedRepForLayout:](self, "selectedRepForLayout:", v6));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layout"));

  if (v8 == v6)
  {
    -[CRLCanvasRepFreeTransformTracker rotateTransformForLayout:](self, "rotateTransformForLayout:", v6);
    -[CRLCanvasRepFreeTransformTracker resizeTransformForLayout:](self, "resizeTransformForLayout:", v6);
    CGAffineTransformConcat(&v13, &t1, &t2);
    -[CRLCanvasRepFreeTransformTracker p_translationTransformForLayout:](self, "p_translationTransformForLayout:", v6);
    CGAffineTransformConcat(retstr, &v13, &v10);
  }
  else
  {
    -[CRLCanvasRepFreeTransformTracker resizeTransformForLayout:](self, "resizeTransformForLayout:", v6);
  }

  return result;
}

- (void)applyNewBoundsToRep:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  CRLCanvasCommandSelectionBehavior *v15;
  void *v16;
  void *v17;
  void *v18;
  CRLCanvasCommandSelectionBehavior *v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController commandController](self->mICC, "commandController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layout"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "finalInfoGeometryForFreeTransform"));

  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layout"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepFreeTransformTracker currentGeometryForLayout:](self, "currentGeometryForLayout:", v8));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "infoForTransforming"));
  v10 = v9;
  if (v9
    && self->mStartedFreeTransform
    && (objc_msgSend(v9, "conformsToProtocol:", &OBJC_PROTOCOL___CRLResizingAwareInfo) & 1) == 0)
  {
    v11 = objc_msgSend(v4, "newCommandToApplyGeometry:toInfo:", v7, v10);
    if (!v11)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123DC58);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E018AC();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123DC78);
      v12 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRepFreeTransformTracker applyNewBoundsToRep:]"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRepFreeTransformTracker.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 534, 0, "invalid nil value for '%{public}s'", "cmd");

    }
    v15 = [CRLCanvasCommandSelectionBehavior alloc];
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvasEditor](self->mICC, "canvasEditor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController editorController](self->mICC, "editorController"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "selectionPath"));
    v19 = -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:type:selectionPath:selectionFlags:](v15, "initWithCanvasEditor:type:selectionPath:selectionFlags:", v16, 2, v18, 4);

    objc_msgSend(v5, "enqueueCommand:withSelectionBehavior:", v11, v19);
  }
  objc_msgSend(v4, "dynamicFreeTransformDidEndWithTracker:", self);
  objc_msgSend(v4, "invalidateKnobs");

}

- (BOOL)shouldOpenCommandGroupToCommitChangesForReps:(id)a3
{
  return 0;
}

- (void)commitChangesForReps:(id)a3
{
  void *v4;
  void *v5;
  NSSet *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  CRLCommandSelectionBehavior *v14;
  void *v15;
  void *v16;
  NSSet *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *j;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];

  if (self->mStartedFreeTransform)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController commandController](self->mICC, "commandController", a3));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v6 = self->mReps;
    v7 = -[NSSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v9)
            objc_enumerationMutation(v6);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i), "info"));
          objc_msgSend(v5, "addObject:", v11);

        }
        v8 = -[NSSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v8);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvasEditor](self->mICC, "canvasEditor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "selectionPathWithInfos:", v5));

    v14 = -[CRLCommandSelectionBehavior initWithCommitSelectionPath:forwardSelectionPath:reverseSelectionPath:]([CRLCommandSelectionBehavior alloc], "initWithCommitSelectionPath:forwardSelectionPath:reverseSelectionPath:", 0, v13, v13);
    objc_msgSend(v4, "openGroupWithSelectionBehavior:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet anyObject](self->mReps, "anyObject"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "actionStringForFreeTransform"));
    objc_msgSend(v4, "setCurrentGroupActionString:", v16);

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v17 = self->mReps;
    v18 = -[NSSet countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v23;
      do
      {
        for (j = 0; j != v19; j = (char *)j + 1)
        {
          if (*(_QWORD *)v23 != v20)
            objc_enumerationMutation(v17);
          -[CRLCanvasRepFreeTransformTracker applyNewBoundsToRep:](self, "applyNewBoundsToRep:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)j), (_QWORD)v22);
        }
        v19 = -[NSSet countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v19);
    }

    objc_msgSend(v4, "closeGroup");
    if (self->mIsEnqueueingCommandsInRealTime)
      objc_msgSend(v4, "closeGroup");

  }
  -[CRLCanvasRepFreeTransformTracker p_hideGuideRenderable](self, "p_hideGuideRenderable", a3, (_QWORD)v22);
}

- (BOOL)supportsAlignmentGuides
{
  return 1;
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
    dispatch_once(&qword_10147E368, &stru_10123DC98);
  v2 = off_1013D9068;
  if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Begin free transform operation", v4, 2u);
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
    dispatch_once(&qword_10147E368, &stru_10123DCB8);
  v3 = off_1013D9068;
  if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_INFO))
  {
    v4 = self->mCurrentAngleInDegrees - self->mOriginalAngleInDegrees;
    v6 = 134217984;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "End free transform operation. rotated by %f degrees", (uint8_t *)&v6, 0xCu);
  }
  return 1;
}

- (NSArray)decoratorOverlayRenderables
{
  void *v2;
  CRLCanvasShapeRenderable *mRotationGuideRenderable;

  if (self->mShouldShowRotationGuide && self->mRotationGuideRenderable)
  {
    mRotationGuideRenderable = self->mRotationGuideRenderable;
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &mRotationGuideRenderable, 1));
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
  NSSet *v4;
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

  -[CRLInteractiveCanvasController endEditing](self->mICC, "endEditing");
  if (self->mIsEnqueueingCommandsInRealTime)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController commandController](self->mICC, "commandController"));
    objc_msgSend(v3, "openGroup");
    objc_msgSend(v3, "enableRealTimeSyncProgressiveEnqueuingInCurrentGroup");

  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->mReps;
  v5 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
        objc_msgSend(v9, "dynamicFreeTransformDidBeginWithTracker:", self, (_QWORD)v10);
        objc_msgSend(v9, "setShowKnobsDuringManipulation:", 0);
      }
      v6 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  -[CRLCanvasRepFreeTransformTracker p_updateCenterForRotationIfNecessary](self, "p_updateCenterForRotationIfNecessary");
}

- (CGRect)p_unscaledBoundingRectForReps:(id)a3
{
  id v3;
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  CGRect v26;
  CGRect v27;
  CGRect result;
  CGRect v29;

  v3 = a3;
  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v3);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v12, "boundsForStandardKnobs");
        objc_msgSend(v12, "convertNaturalRectToUnscaledCanvas:");
        v29.origin.x = v13;
        v29.origin.y = v14;
        v29.size.width = v15;
        v29.size.height = v16;
        v26.origin.x = x;
        v26.origin.y = y;
        v26.size.width = width;
        v26.size.height = height;
        v27 = CGRectUnion(v26, v29);
        x = v27.origin.x;
        y = v27.origin.y;
        width = v27.size.width;
        height = v27.size.height;
      }
      v9 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }

  v17 = x;
  v18 = y;
  v19 = width;
  v20 = height;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGPoint)p_centerForRotationForRep:(id)a3 inUnscaledBoundingRect:(CGRect)a4
{
  double v5;
  double v6;
  double v7;
  id v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;
  CGPoint result;

  v5 = sub_100061400(a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v7 = v6;
  v8 = a3;
  objc_msgSend(v8, "convertNaturalPointFromUnscaledCanvas:", v5, v7);
  v18 = v10;
  v19 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layout"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "geometry"));
  if (v12)
  {
    objc_msgSend(v12, "transform");
    v13 = v21;
    v14 = v22;
    v15 = v23;
  }
  else
  {
    v15 = 0uLL;
    v13 = 0uLL;
    v14 = 0uLL;
  }
  v20 = vaddq_f64(v15, vmlaq_n_f64(vmulq_n_f64(v14, v18), v13, v19));

  v17 = v20.f64[1];
  v16 = v20.f64[0];
  result.y = v17;
  result.x = v16;
  return result;
}

- (void)p_updateCenterForRotationIfNecessary
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;

  if (self->mUnscaledPivotPoint.x == INFINITY && self->mUnscaledPivotPoint.y == INFINITY)
  {
    if ((id)-[NSSet count](self->mReps, "count") == (id)1)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet anyObject](self->mReps, "anyObject"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layout"));

      objc_msgSend(v5, "centerForRotation");
      if (v5)
      {
        v16 = v7;
        v17 = v6;
        objc_msgSend(v5, "originalTransformInRoot");
        v7 = v16;
        v6 = v17;
        v9 = v18;
        v8 = v19;
        v10 = v20;
      }
      else
      {
        v10 = 0uLL;
        v9 = 0uLL;
        v8 = 0uLL;
      }
      self->mUnscaledPivotPoint = (CGPoint)vaddq_f64(v10, vmlaq_n_f64(vmulq_n_f64(v8, v7), v9, v6));

    }
    else
    {
      -[CRLCanvasRepFreeTransformTracker p_unscaledBoundingRectForReps:](self, "p_unscaledBoundingRectForReps:", self->mReps);
      self->mUnscaledPivotPoint.x = sub_100061400(v11, v12, v13, v14);
      self->mUnscaledPivotPoint.y = v15;
    }
  }
}

- (CGPoint)pivotPointForLayout:(id)a3
{
  id v4;
  void *v5;
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
  double v17;
  double x;
  double y;
  void *v20;
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
  CGAffineTransform v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  CGAffineTransform v35;
  CGAffineTransform v36;
  CGPoint result;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "originalGeometry"));

  if (!v5)
  {
    memset(&v36, 0, sizeof(v36));
    if (v4)
      objc_msgSend(v4, "transformInRoot");
    else
      memset(&v31, 0, sizeof(v31));
    CGAffineTransformInvert(&v36, &v31);
    x = self->mUnscaledPivotPoint.x;
    y = self->mUnscaledPivotPoint.y;
    v8 = v36.tx + y * v36.c + v36.a * x;
    v9 = v36.ty + y * v36.d + v36.b * x;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "geometry"));
    v11 = v20;
    if (v20)
    {
      objc_msgSend(v20, "transform");
      v12 = v26;
      v13 = v25;
      v14 = v28;
      v15 = v27;
      v16 = v30;
      v17 = v29;
      goto LABEL_14;
    }
LABEL_13:
    v16 = 0.0;
    v14 = 0.0;
    v12 = 0.0;
    v17 = 0.0;
    v15 = 0.0;
    v13 = 0.0;
    goto LABEL_14;
  }
  memset(&v36, 0, sizeof(v36));
  if (v4)
    objc_msgSend(v4, "originalTransformInRoot");
  else
    memset(&v35, 0, sizeof(v35));
  CGAffineTransformInvert(&v36, &v35);
  v6 = self->mUnscaledPivotPoint.x;
  v7 = self->mUnscaledPivotPoint.y;
  v8 = v36.tx + v7 * v36.c + v36.a * v6;
  v9 = v36.ty + v7 * v36.d + v36.b * v6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "originalGeometry"));
  v11 = v10;
  if (!v10)
  {
    v33 = 0u;
    v34 = 0u;
    v32 = 0u;
    goto LABEL_13;
  }
  objc_msgSend(v10, "transform");
  v12 = *((double *)&v32 + 1);
  v13 = *(double *)&v32;
  v14 = *((double *)&v33 + 1);
  v15 = *(double *)&v33;
  v16 = *((double *)&v34 + 1);
  v17 = *(double *)&v34;
LABEL_14:
  v21 = v17 + v9 * v15 + v13 * v8;
  v22 = v16 + v9 * v14 + v12 * v8;

  v23 = v21;
  v24 = v22;
  result.y = v24;
  result.x = v23;
  return result;
}

- (CGPoint)p_scaledCenterForRotation
{
  double v2;
  double v3;
  CGPoint result;

  -[CRLInteractiveCanvasController convertUnscaledToBoundsPoint:](self->mICC, "convertUnscaledToBoundsPoint:", self->mUnscaledPivotPoint.x, self->mUnscaledPivotPoint.y);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGAffineTransform)p_translationTransformForLayout:(SEL)a3
{
  id v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  CGAffineTransform *result;
  CGAffineTransform v14;
  CGAffineTransform v15;

  v6 = a4;
  v7 = self->mUnscaledDrag.x + self->mPreviousDragSnapDiff.x;
  v8 = self->mUnscaledDrag.y + self->mPreviousDragSnapDiff.y;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "parent"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "parent"));
    v11 = v10;
    if (v10)
      objc_msgSend(v10, "transformInRoot");
    else
      memset(&v14, 0, sizeof(v14));
    CGAffineTransformInvert(&v15, &v14);
    v7 = sub_10006214C((float64x2_t *)&v15, v7, v8);
    v8 = v12;

  }
  CGAffineTransformMakeTranslation(retstr, v7, v8);

  return result;
}

- (void)p_updateGuideRenderableWithAngle:(double)a3 didSnap:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  double v8;
  double v9;
  CRLCanvasShapeRenderable *v10;
  CRLCanvasShapeRenderable *mRotationGuideRenderable;
  CGColor *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double MidX;
  double v20;
  double MinY;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v26;
  double v27;
  CGPath *Mutable;
  void *v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  CRLCanvasShapeRenderable *v34;
  double v35;
  CGAffineTransform v36;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  v4 = a4;
  if (!self->mRotationGuideRenderable)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvas](self->mICC, "canvas"));
    objc_msgSend(v7, "contentsScale");
    v9 = v8;

    v10 = (CRLCanvasShapeRenderable *)objc_claimAutoreleasedReturnValue(+[CRLCanvasShapeRenderable renderable](CRLCanvasShapeRenderable, "renderable"));
    mRotationGuideRenderable = self->mRotationGuideRenderable;
    self->mRotationGuideRenderable = v10;

    v12 = sub_100011C1C(0.933000028, 0.791999996, 0.0, 1.0);
    -[CRLCanvasShapeRenderable setStrokeColor:](self->mRotationGuideRenderable, "setStrokeColor:", v12);
    CGColorRelease(v12);
    -[CRLCanvasShapeRenderable setFillColor:](self->mRotationGuideRenderable, "setFillColor:", 0);
    -[CRLCanvasShapeRenderable setLineWidth:](self->mRotationGuideRenderable, "setLineWidth:", 1.0 / v9);
    -[CRLCanvasRenderable setZPosition:](self->mRotationGuideRenderable, "setZPosition:", -1.0);
    -[CRLCanvasRenderable setAnchorPoint:](self->mRotationGuideRenderable, "setAnchorPoint:", 0.5, 0.0);
    -[CRLCanvasRenderable setDelegate:](self->mRotationGuideRenderable, "setDelegate:", self);
    -[CRLCanvasRenderable setEdgeAntialiasingMask:](self->mRotationGuideRenderable, "setEdgeAntialiasingMask:", 0);
    -[CRLCanvasRepFreeTransformTracker p_scaledCenterForRotation](self, "p_scaledCenterForRotation");
    v14 = floor(v13);
    v16 = floor(v15);
    if ((id)-[NSSet count](self->mReps, "count") == (id)1)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet anyObject](self->mReps, "anyObject"));
      objc_msgSend(v17, "unscaledGuidePosition");
      MidX = v18;
      MinY = v20;

    }
    else
    {
      -[CRLCanvasRepFreeTransformTracker p_unscaledBoundingRectForReps:](self, "p_unscaledBoundingRectForReps:", self->mReps);
      x = v40.origin.x;
      y = v40.origin.y;
      width = v40.size.width;
      height = v40.size.height;
      MidX = CGRectGetMidX(v40);
      v41.origin.x = x;
      v41.origin.y = y;
      v41.size.width = width;
      v41.size.height = height;
      MinY = CGRectGetMinY(v41);
    }
    -[CRLInteractiveCanvasController convertUnscaledToBoundsPoint:](self->mICC, "convertUnscaledToBoundsPoint:", MidX, MinY);
    self->mRotationGuideLength = sub_10006108C(v26, v27, v14, v16) / self->mMagnifyBy;
    -[CRLCanvasRenderable setPosition:](self->mRotationGuideRenderable, "setPosition:", v14, v16);
    -[CRLInteractiveCanvasController addDecorator:](self->mICC, "addDecorator:", self);
  }
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 0.0, -10.0);
  CGPathAddLineToPoint(Mutable, 0, 0.0, self->mRotationGuideLength * self->mMagnifyBy + 10.0);
  v42.origin.x = -5.5;
  v42.origin.y = -5.5;
  v42.size.width = 11.0;
  v42.size.height = 11.0;
  CGPathAddEllipseInRect(Mutable, 0, v42);
  CGPathMoveToPoint(Mutable, 0, -10.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 10.0, 0.0);
  -[CRLCanvasShapeRenderable setPath:](self->mRotationGuideRenderable, "setPath:", Mutable);
  CGPathRelease(Mutable);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController canvas](self->mICC, "canvas"));
  objc_msgSend(v29, "convertUnscaledToBoundsPoint:", sub_1000603D0(self->mUnscaledDrag.x, self->mUnscaledDrag.y, self->mPreviousDragSnapDiff.x));
  v31 = v30;
  v33 = v32;

  CGAffineTransformMakeRotation(&t1, (a3 + 180.0) * -0.0174532925);
  CGAffineTransformMakeTranslation(&t2, v31, v33);
  CGAffineTransformConcat(&v39, &t1, &t2);
  v34 = self->mRotationGuideRenderable;
  v36 = v39;
  -[CRLCanvasRenderable setAffineTransform:](v34, "setAffineTransform:", &v36);
  LODWORD(v35) = 0.5;
  if (v4)
    *(float *)&v35 = 1.0;
  -[CRLCanvasRenderable setOpacity:](self->mRotationGuideRenderable, "setOpacity:", v35);
}

- (void)p_hideGuideRenderable
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity")));
  objc_msgSend(v7, "setDuration:", 0.400000006);
  -[CRLCanvasRenderable opacity](self->mRotationGuideRenderable, "opacity");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  objc_msgSend(v7, "setFromValue:", v3);

  LODWORD(v4) = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4));
  objc_msgSend(v7, "setToValue:", v5);

  objc_msgSend(v7, "setDelegate:", self);
  objc_msgSend(v7, "setValue:forKey:", self->mICC, CFSTR("icc"));
  -[CRLCanvasRenderable addAnimation:forKey:](self->mRotationGuideRenderable, "addAnimation:forKey:", v7, CFSTR("fade out"));
  LODWORD(v6) = 0;
  -[CRLCanvasRenderable setOpacity:](self->mRotationGuideRenderable, "setOpacity:", v6);

}

- (void)p_updateDragGuidesAndSnap:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  BOOL v7;
  double v8;
  _BOOL4 v9;
  double v10;
  unsigned __int8 v11;
  unsigned __int8 v12;
  CGSize size;
  NSSet *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  void *v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];

  y = a3.y;
  x = a3.x;
  v6 = sub_100061070(self->mSmoothedDragSpeed.x, self->mSmoothedDragSpeed.y);
  if (-[CRLInteractiveCanvasController currentlyScrolling](self->mICC, "currentlyScrolling"))
  {
    v7 = 0;
  }
  else
  {
    v8 = 200.0;
    if (!self->mSnappedInX)
      v8 = 100.0;
    v7 = v6 < v8;
  }
  self->mShouldRenderGuideInX = v7;
  if (-[CRLInteractiveCanvasController currentlyScrolling](self->mICC, "currentlyScrolling"))
  {
    v9 = 0;
  }
  else
  {
    v10 = 200.0;
    if (!self->mSnappedInY)
      v10 = 100.0;
    v9 = v6 < v10;
  }
  self->mShouldRenderGuideInY = v9;
  if (self->mShouldRenderGuideInX)
  {
    v11 = 1;
    if (v9)
    {
LABEL_13:
      v12 = 1;
      goto LABEL_16;
    }
  }
  else
  {
    v11 = -[CRLInteractiveCanvasController isCanvasBackgroundAlignmentSnappingEnabled](self->mICC, "isCanvasBackgroundAlignmentSnappingEnabled");
    if (self->mShouldRenderGuideInY)
      goto LABEL_13;
  }
  v12 = -[CRLInteractiveCanvasController isCanvasBackgroundAlignmentSnappingEnabled](self->mICC, "isCanvasBackgroundAlignmentSnappingEnabled");
LABEL_16:
  size = CGRectZero.size;
  self->mAlignmentRect.origin = CGRectZero.origin;
  self->mAlignmentRect.size = size;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v14 = self->mReps;
  v15 = -[NSSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v19, "shouldShowSizesInRulers", (_QWORD)v32))
        {
          objc_msgSend(v19, "snapRectForDynamicDragWithOffset:", sub_1000603B8(x, y, self->mPreviousDragSnapDiff.x));
          self->mAlignmentRect.origin.x = sub_100060C2C(self->mAlignmentRect.origin.x, self->mAlignmentRect.origin.y, self->mAlignmentRect.size.width, self->mAlignmentRect.size.height, v20, v21, v22, v23);
          self->mAlignmentRect.origin.y = v24;
          self->mAlignmentRect.size.width = v25;
          self->mAlignmentRect.size.height = v26;
        }
      }
      v16 = -[NSSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v16);
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasController guideController](self->mICC, "guideController"));
  objc_msgSend(v27, "snapRectToGuides:", self->mAlignmentRect.origin.x, self->mAlignmentRect.origin.y, self->mAlignmentRect.size.width, self->mAlignmentRect.size.height);
  v29 = v28;
  v31 = v30;
  self->mSnappedInX = objc_msgSend(v27, "didJustSnapInX");
  self->mSnappedInY = objc_msgSend(v27, "didJustSnapInY");
  if ((v11 & 1) == 0)
  {
    self->mSnappedInX = 0;
    v29 = 0.0;
  }
  if ((v12 & 1) == 0)
  {
    self->mSnappedInY = 0;
    v31 = 0.0;
  }
  self->mAlignmentRect = CGRectOffset(self->mAlignmentRect, v29, v31);
  self->mPreviousDragSnapDiff.x = v29;
  self->mPreviousDragSnapDiff.y = v31;

}

- (double)rotationInitialDetentThreshold
{
  return self->mRotationInitialDetentThreshold;
}

- (void)setRotationInitialDetentThreshold:(double)a3
{
  self->mRotationInitialDetentThreshold = a3;
}

- (double)rotationDetentThreshold
{
  return self->mRotationDetentThreshold;
}

- (void)setRotationDetentThreshold:(double)a3
{
  self->mRotationDetentThreshold = a3;
}

- (BOOL)shouldShowAndSnapToAlignmentGuides
{
  return self->mShouldShowAndSnapToAlignmentGuides;
}

- (void)setShouldShowAndSnapToAlignmentGuides:(BOOL)a3
{
  self->mShouldShowAndSnapToAlignmentGuides = a3;
}

- (BOOL)shouldShowRotationGuide
{
  return self->mShouldShowRotationGuide;
}

- (void)setShouldShowRotationGuide:(BOOL)a3
{
  self->mShouldShowRotationGuide = a3;
}

- (BOOL)isDragging
{
  return self->mIsDragging;
}

- (BOOL)isRotating
{
  return self->mIsRotating;
}

- (BOOL)isResizing
{
  return self->mIsResizing;
}

- (BOOL)hasEverResized
{
  return self->mHasEverResized;
}

- (BOOL)isEnqueueingCommandsInRealTime
{
  return self->mIsEnqueueingCommandsInRealTime;
}

- (BOOL)inRotateResizeMode
{
  return self->_inRotateResizeMode;
}

- (void)setInRotateResizeMode:(BOOL)a3
{
  self->_inRotateResizeMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mRotationGuideRenderable, 0);
  objc_storeStrong((id *)&self->mLayoutToCenterForRotationMap, 0);
  objc_storeStrong((id *)&self->mLayoutToSelectedRepMap, 0);
  objc_storeStrong((id *)&self->mReps, 0);
  objc_storeStrong((id *)&self->mICC, 0);
}

@end
