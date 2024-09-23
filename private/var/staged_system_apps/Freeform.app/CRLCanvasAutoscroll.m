@implementation CRLCanvasAutoscroll

- (void)dealloc
{
  objc_super v3;

  -[CRLCanvasAutoscroll invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CRLCanvasAutoscroll;
  -[CRLCanvasAutoscroll dealloc](&v3, "dealloc");
}

+ (void)startAutoscroll:(id)a3 unscaledPoint:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat width;
  CGFloat height;
  void *v16;
  CRLCanvasAutoscroll *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
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
  double v47;
  double v48;
  unsigned __int8 v49;
  unsigned int v50;
  double MinX;
  double MaxX;
  int v53;
  BOOL v54;
  char v55;
  double v56;
  uint64_t v57;
  int v58;
  BOOL v59;
  double MinY;
  double MaxY;
  double v62;
  int v63;
  BOOL v64;
  double v65;
  int v66;
  BOOL v67;
  CGFloat v68;
  void *v69;
  void *v70;
  void *v71;
  double v72;
  double v73;
  double v74;
  CGFloat v75;
  CGFloat v76;
  CGFloat v77;
  CGFloat v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  id v84;
  CGPoint v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;

  y = a4.y;
  x = a4.x;
  v84 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "icc"));
  objc_msgSend(v6, "viewScale");
  v8 = 20.0 / v7;
  if (v84 && (objc_opt_respondsToSelector(v84, "unscaledStartAutoscrollThreshold") & 1) != 0)
  {
    objc_msgSend(v84, "unscaledStartAutoscrollThreshold");
    v10 = v9;
    objc_msgSend(v6, "viewScale");
    v8 = v10 / v11;
  }
  objc_msgSend(v6, "visibleUnscaledRectForAutoscroll");
  v87 = CGRectInset(v86, v8, v8);
  v12 = v87.origin.x;
  v13 = v87.origin.y;
  width = v87.size.width;
  height = v87.size.height;
  v85.x = x;
  v85.y = y;
  if (!CGRectContainsPoint(v87, v85) && objc_msgSend(v6, "allowAutoscroll"))
  {
    v79 = v8;
    v81 = x;
    v82 = y;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "autoscroll"));

    if (!v16)
    {
      v17 = objc_alloc_init(CRLCanvasAutoscroll);
      objc_msgSend(v84, "setAutoscroll:", v17);

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "canvasView"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "enclosingScrollView"));

    objc_msgSend(v6, "contentOffset");
    v80 = v20;
    v83 = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layerHost"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "canvasView"));
    objc_msgSend(v23, "bounds");
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v31 = v30;
    objc_msgSend(v6, "viewScale");
    v33 = sub_100060FD8(v25, v27, v29, v31, 1.0 / v32);
    v77 = v34;
    v78 = v33;
    v75 = v36;
    v76 = v35;

    objc_msgSend(v19, "scrollableAreaBounds");
    v38 = v37;
    v40 = v39;
    objc_msgSend(v19, "scrollableAreaContentInsets");
    v43 = v38 - (v41 + v42);
    v46 = v40 - (v44 + v45);
    objc_msgSend(v6, "viewScale");
    v72 = sub_1000603DC(v43, v46, 1.0 / v47);
    v74 = v48;
    if (v84 && (objc_opt_respondsToSelector(v84, "allowedAutoscrollDirections") & 1) != 0)
      v49 = objc_msgSend(v84, "allowedAutoscrollDirections");
    else
      v49 = 15;
    v50 = objc_msgSend(v6, "allowNegativeAutoscroll", *(_QWORD *)&v72);
    v88.origin.x = v12;
    v88.origin.y = v13;
    v88.size.width = width;
    v88.size.height = height;
    MinX = CGRectGetMinX(v88);
    v89.origin.x = v12;
    v89.origin.y = v13;
    v89.size.width = width;
    v89.size.height = height;
    MaxX = CGRectGetMaxX(v89);
    if (v80 > 0.0)
      v53 = 1;
    else
      v53 = v50;
    if ((v49 & 1) == 0 || (v81 < MinX ? (v54 = v53 == 0) : (v54 = 1), v54))
    {
      v57 = 0;
      if (v80 >= 0.0)
        v58 = 1;
      else
        v58 = v50;
      v55 = 1;
      if ((v49 & 2) == 0 || (v81 >= MaxX ? (v59 = v58 == 0) : (v59 = 1), v59))
      {
        v56 = 0.0;
      }
      else
      {
        v91.origin.y = v77;
        v91.origin.x = v78;
        v91.size.height = v75;
        v91.size.width = v76;
        if (v80 >= CGRectGetMaxX(v91) - v73)
        {
          v56 = 0.0;
          v57 = 0;
        }
        else
        {
          v92.origin.x = v12;
          v92.origin.y = v13;
          v92.size.width = width;
          v92.size.height = height;
          v55 = 0;
          v56 = v81 - CGRectGetMaxX(v92);
          v57 = 2;
        }
      }
    }
    else
    {
      v90.origin.x = v12;
      v90.origin.y = v13;
      v90.size.width = width;
      v90.size.height = height;
      v55 = 0;
      v56 = CGRectGetMinX(v90) - v81;
      v57 = 1;
    }
    v93.origin.x = v12;
    v93.origin.y = v13;
    v93.size.width = width;
    v93.size.height = height;
    MinY = CGRectGetMinY(v93);
    v94.origin.x = v12;
    v94.origin.y = v13;
    v94.size.width = width;
    v94.size.height = height;
    MaxY = CGRectGetMaxY(v94);
    v62 = v83;
    if (v83 > 0.0)
      v63 = 1;
    else
      v63 = v50;
    if ((v49 & 4) == 0 || (v82 < MinY ? (v64 = v63 == 0) : (v64 = 1), v64))
    {
      if (v83 >= 0.0)
        v66 = 1;
      else
        v66 = v50;
      if ((v49 & 8) == 0)
        goto LABEL_56;
      v67 = v82 < MaxY || v66 == 0;
      if (v67
        || (v96.origin.y = v77,
            v96.origin.x = v78,
            v96.size.height = v75,
            v96.size.width = v76,
            v68 = CGRectGetMaxY(v96),
            v62 = v74,
            MaxY = v68 - v74,
            v83 >= MaxY))
      {
LABEL_56:
        if ((v55 & 1) != 0)
        {
          v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "autoscroll", MaxY, v62));
          objc_msgSend(v69, "invalidate");
LABEL_59:

          goto LABEL_60;
        }
LABEL_58:
        v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "editingCoordinator"));
        v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "followCoordinator"));
        objc_msgSend(v71, "endFollowSessionForLocalParticipantWithShouldShowRefollowPlacard:", 1);

        v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "autoscroll"));
        objc_msgSend(v69, "p_startAutoscroll:unscaledPoint:unscaledDistancePastVisibleRect:unscaledInset:directions:repeatInterval:", v84, v57, v81, v82, v56, v79, 0.035);
        goto LABEL_59;
      }
      v57 = v57 | 8;
      v97.origin.x = v12;
      v97.origin.y = v13;
      v97.size.width = width;
      v97.size.height = height;
      v65 = v82 - CGRectGetMaxY(v97);
    }
    else
    {
      v57 = v57 | 4;
      v95.origin.x = v12;
      v95.origin.y = v13;
      v95.size.width = width;
      v95.size.height = height;
      v65 = CGRectGetMinY(v95) - v82;
    }
    if (v56 < v65)
      v56 = v65;
    goto LABEL_58;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "autoscroll"));
  objc_msgSend(v19, "invalidate");
LABEL_60:

}

- (BOOL)p_startAutoscroll:(id)a3 unscaledPoint:(CGPoint)a4 unscaledDistancePastVisibleRect:(double)a5 unscaledInset:(double)a6 directions:(int)a7 repeatInterval:(double)a8
{
  uint64_t v9;
  double y;
  double x;
  id v15;
  id v16;
  char v17;
  BOOL v18;
  id v19;
  NSTimer *timer;
  BOOL v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  int v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  NSTimer *v32;
  NSTimer *v33;
  void *v34;

  v9 = *(_QWORD *)&a7;
  y = a4.y;
  x = a4.x;
  v15 = a3;
  if (self->_timer)
  {
    v16 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasAutoscroll target](self, "target"));
    if (v16 == v15
      && (-[CRLCanvasAutoscroll unscaledAutoscrollPoint](self, "unscaledAutoscrollPoint"), v23 == x)
      && v22 == y
      && -[CRLCanvasAutoscroll directions](self, "directions") == (_DWORD)v9)
    {
      -[CRLCanvasAutoscroll repeatInterval](self, "repeatInterval");
      v25 = v24;

      if (v25 == a8)
      {
LABEL_31:
        v21 = 1;
        goto LABEL_32;
      }
    }
    else
    {

    }
  }
  v17 = objc_opt_respondsToSelector(v15, "updateAfterAutoscroll:");
  v18 = a8 == 0.0 || (_DWORD)v9 == 0;
  if (!v18 && (v17 & 1) != 0)
  {
    v19 = objc_msgSend(objc_alloc((Class)NSDate), "initWithTimeIntervalSinceNow:", 0.0);
    timer = self->_timer;
    if (timer)
    {
      -[NSTimer setFireDate:](timer, "setFireDate:", v19);
    }
    else
    {
      +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
      self->_lastFired = v26;
      if (!+[NSThread isMainThread](NSThread, "isMainThread"))
      {
        v27 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10123F8D0);
        v28 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E049EC(v27, v28);
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10123F8F0);
        v29 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE81F0(v29, v27);
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasAutoscroll p_startAutoscroll:unscaledPoint:unscaledDistancePastVisibleRect:unscaledInset:directions:repeatInterval:]"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasAutoscroll.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v30, v31, 170, 0, "This operation must only be performed on the main thread.");

      }
      v32 = (NSTimer *)objc_msgSend(objc_alloc((Class)NSTimer), "initWithFireDate:interval:target:selector:userInfo:repeats:", v19, self, "timerFired:", 0, 1, a8);
      v33 = self->_timer;
      self->_timer = v32;

      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
      objc_msgSend(v34, "addTimer:forMode:", self->_timer, NSDefaultRunLoopMode);

    }
    if (-[CRLCanvasAutoscroll directions](self, "directions") != (_DWORD)v9)
      -[CRLCanvasAutoscroll setCount:](self, "setCount:", 0);
    -[CRLCanvasAutoscroll setTarget:](self, "setTarget:", v15);
    -[CRLCanvasAutoscroll setUnscaledAutoscrollPoint:](self, "setUnscaledAutoscrollPoint:", x, y);
    -[CRLCanvasAutoscroll setAdjustedUnscaledAutoscrollPoint:](self, "setAdjustedUnscaledAutoscrollPoint:", x, y);
    -[CRLCanvasAutoscroll setDirections:](self, "setDirections:", v9);
    -[CRLCanvasAutoscroll setRepeatInterval:](self, "setRepeatInterval:", a8);
    -[CRLCanvasAutoscroll setUnscaledDistancePastVisibleRect:](self, "setUnscaledDistancePastVisibleRect:", a5);
    -[CRLCanvasAutoscroll setUnscaledInset:](self, "setUnscaledInset:", a6);

    goto LABEL_31;
  }
  -[CRLCanvasAutoscroll invalidate](self, "invalidate");
  v21 = 0;
LABEL_32:

  return v21;
}

- (void)invalidate
{
  NSTimer *timer;
  NSTimer *v4;
  NSTimer *v5;
  NSTimer *v6;
  void *v7;
  double y;
  _QWORD block[4];
  NSTimer *v10;

  timer = self->_timer;
  if (timer)
  {
    v4 = timer;
    v5 = self->_timer;
    self->_timer = 0;

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100199948;
    block[3] = &unk_10122D110;
    v10 = v4;
    v6 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAutoscroll target](self, "target"));
  objc_msgSend(v7, "autoscrollWillNotStart");

  -[CRLCanvasAutoscroll setTarget:](self, "setTarget:", 0);
  y = CGPointZero.y;
  -[CRLCanvasAutoscroll setUnscaledAutoscrollPoint:](self, "setUnscaledAutoscrollPoint:", CGPointZero.x, y);
  -[CRLCanvasAutoscroll setAdjustedUnscaledAutoscrollPoint:](self, "setAdjustedUnscaledAutoscrollPoint:", CGPointZero.x, y);
  -[CRLCanvasAutoscroll setDirections:](self, "setDirections:", 0);
  -[CRLCanvasAutoscroll setRepeatInterval:](self, "setRepeatInterval:", 0.0);
  -[CRLCanvasAutoscroll setCount:](self, "setCount:", 0);
  -[CRLCanvasAutoscroll setUnscaledDistancePastVisibleRect:](self, "setUnscaledDistancePastVisibleRect:", 0.0);
  -[CRLCanvasAutoscroll setUnscaledInset:](self, "setUnscaledInset:", 1.0);
}

- (unint64_t)p_unscaledDeltaForCount:(unint64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  unint64_t result;

  v5 = objc_claimAutoreleasedReturnValue(-[CRLCanvasAutoscroll target](self, "target"));
  if (v5
    && (v6 = (void *)v5,
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAutoscroll target](self, "target")),
        v8 = objc_opt_respondsToSelector(v7, "maximumAutoscrollDeltaForCount:"),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAutoscroll target](self, "target"));
    v10 = objc_msgSend(v9, "maximumAutoscrollDeltaForCount:", a3);

    v11 = (double)(unint64_t)v10;
  }
  else
  {
    v11 = 48.0;
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v13 = v12 - self->_lastFired;
  -[CRLCanvasAutoscroll repeatInterval](self, "repeatInterval");
  result = (unint64_t)(v11 * (v13 / v14));
  if (a3 <= 0x18)
    return (unint64_t)(float)((float)(1.0 / (float)(26 - a3)) * (float)result);
  return result;
}

- (void)timerFired:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;

  -[CRLCanvasAutoscroll setCount:](self, "setCount:", (char *)-[CRLCanvasAutoscroll count](self, "count", a3) + 1);
  v4 = objc_claimAutoreleasedReturnValue(-[CRLCanvasAutoscroll target](self, "target"));
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAutoscroll target](self, "target"));
    v7 = objc_opt_respondsToSelector(v6, "allowedAutoscrollDirections");

    if ((v7 & 1) != 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAutoscroll target](self, "target"));
      v9 = objc_msgSend(v8, "allowedAutoscrollDirections");

      v10 = -[CRLCanvasAutoscroll directions](self, "directions");
      if ((v10 & ~v9) != 0)
      {
        v11 = v10;
        -[CRLCanvasAutoscroll setCount:](self, "setCount:", 0);
        -[CRLCanvasAutoscroll setDirections:](self, "setDirections:", v11 & v9);
      }
    }
  }
  -[CRLCanvasAutoscroll p_autoscrollIfPossibleWithDelta:](self, "p_autoscrollIfPossibleWithDelta:", -[CRLCanvasAutoscroll p_unscaledDeltaForCount:](self, "p_unscaledDeltaForCount:", -[CRLCanvasAutoscroll count](self, "count")));
}

- (void)p_autoscrollIfPossibleWithDelta:(unint64_t)a3
{
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
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
  double v46;
  double v47;
  uint64_t v48;
  void *v49;
  void *v50;
  char v51;
  void *v52;
  unsigned __int8 v53;
  double v54;
  double v55;
  double MinX;
  double v57;
  float v58;
  float v59;
  double MaxX;
  void *v61;
  double MaxY;
  double v63;
  double v64;
  float v65;
  float v66;
  float v67;
  float v68;
  double v69;
  double v70;
  float v71;
  float v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  void *v78;
  double v79;
  double MinY;
  double v81;
  double v82;
  CGFloat v83;
  double v84;
  id v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;

  v5 = -[CRLCanvasAutoscroll directions](self, "directions");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAutoscroll target](self, "target"));
  v85 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "icc"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "canvasView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "enclosingScrollView"));
  objc_msgSend(v85, "contentOffset");
  v84 = v9;
  v81 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "layerHost"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "canvasLayer"));
  objc_msgSend(v12, "contentInset");
  v14 = v13;
  v16 = v15;

  objc_msgSend(v85, "viewScale");
  v18 = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "layerHost"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "canvasView"));
  objc_msgSend(v20, "bounds");
  v21 = 1.0 / v18;
  v82 = sub_100060FD8(v22, v23, v24, v25, 1.0 / v18);
  v83 = v26;
  v28 = v27;
  v30 = v29;

  objc_msgSend(v8, "scrollableAreaBounds");
  v32 = v31;
  v34 = v33;
  objc_msgSend(v8, "scrollableAreaContentInsets");
  v37 = v32 - (v35 + v36);
  v40 = v34 - (v38 + v39);
  objc_msgSend(v85, "viewScale");
  v42 = sub_1000603DC(v37, v40, 1.0 / v41);
  v44 = v43;
  v45 = sub_1000603DC(v16, v14, v21);
  v47 = v46;
  v48 = objc_claimAutoreleasedReturnValue(-[CRLCanvasAutoscroll target](self, "target", v45));
  MinY = v47;
  if (v48
    && (v49 = (void *)v48,
        v50 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAutoscroll target](self, "target")),
        v51 = objc_opt_respondsToSelector(v50, "allowScrollingOutsideOfBounds"),
        v50,
        v49,
        (v51 & 1) != 0))
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAutoscroll target](self, "target"));
    v53 = objc_msgSend(v52, "allowScrollingOutsideOfBounds");

  }
  else
  {
    v53 = objc_msgSend(v85, "shouldCanvasScrollingSizeGrowToFitBoardContent", *(_QWORD *)&v47);
  }
  if ((v5 & 1) != 0)
  {
    v54 = v44;
    v86.origin.x = v82;
    v86.origin.y = v83;
    v86.size.width = v28;
    v86.size.height = v30;
    MinX = CGRectGetMinX(v86);
    v55 = v84 - (double)a3;
    v57 = v81;
    if ((v53 & 1) == 0)
    {
      if (v84 <= MinX)
      {
        v5 &= ~1u;
        v55 = v84;
      }
      else
      {
        v58 = v55;
        v59 = MinX;
        v55 = fmaxf(v58, v59);
      }
    }
    v61 = v85;
  }
  else
  {
    if ((v5 & 2) == 0)
    {
      v54 = v44;
      v55 = v84;
LABEL_13:
      v61 = v85;
      v57 = v81;
      goto LABEL_16;
    }
    v87.origin.x = v82;
    v87.origin.y = v83;
    v87.size.width = v28;
    v87.size.height = v30;
    MaxX = CGRectGetMaxX(v87);
    v55 = v84 + (double)a3;
    if ((v53 & 1) != 0)
    {
      v54 = v44;
      goto LABEL_13;
    }
    v69 = v42;
    v54 = v44;
    v70 = MaxX - v69;
    v61 = v85;
    v57 = v81;
    if (v84 >= v70)
    {
      v5 &= ~2u;
      v55 = v84;
    }
    else
    {
      v71 = v55;
      v72 = v70;
      v55 = fminf(v71, v72);
    }
  }
LABEL_16:
  if ((v5 & 4) != 0)
  {
    if (objc_msgSend(v61, "shouldCanvasScrollingSizeGrowToFitBoardContent"))
    {
      v89.origin.x = v82;
      v89.origin.y = v83;
      v89.size.width = v28;
      v89.size.height = v30;
      MinY = CGRectGetMinY(v89);
    }
    v63 = v57 - (double)a3;
    if ((v53 & 1) == 0)
    {
      if (v57 <= MinY)
      {
        v5 &= ~4u;
        v61 = v85;
        goto LABEL_31;
      }
      v67 = v63;
      v68 = MinY;
      v63 = fmaxf(v67, v68);
    }
LABEL_26:
    v61 = v85;
    goto LABEL_32;
  }
  if ((v5 & 8) == 0)
    goto LABEL_31;
  v88.origin.x = v82;
  v88.origin.y = v83;
  v88.size.width = v28;
  v88.size.height = v30;
  MaxY = CGRectGetMaxY(v88);
  v63 = v57 + (double)a3;
  if ((v53 & 1) != 0)
    goto LABEL_26;
  v64 = MaxY - v54;
  v61 = v85;
  if (v57 < v64)
  {
    v65 = v63;
    v66 = v64;
    v63 = fminf(v65, v66);
    goto LABEL_32;
  }
  v5 &= ~8u;
LABEL_31:
  v63 = v57;
  if (!v5)
  {
    -[CRLCanvasAutoscroll invalidate](self, "invalidate");
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(v61, "setContentOffset:source:scrollOptions:", CFSTR("CRLCanvasAutoscrollInteractionSource"), 0, v55, v63, *(_QWORD *)&MinY);
  -[CRLCanvasAutoscroll setLastAutoscrollDelta:](self, "setLastAutoscrollDelta:", sub_1000603B8(v55, v63, v84));
  -[CRLCanvasAutoscroll adjustedUnscaledAutoscrollPoint](self, "adjustedUnscaledAutoscrollPoint");
  v74 = v73;
  v76 = v75;
  -[CRLCanvasAutoscroll lastAutoscrollDelta](self, "lastAutoscrollDelta");
  -[CRLCanvasAutoscroll setAdjustedUnscaledAutoscrollPoint:](self, "setAdjustedUnscaledAutoscrollPoint:", sub_1000603D0(v74, v76, v77));
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAutoscroll target](self, "target"));
  objc_msgSend(v78, "updateAfterAutoscroll:", self);

  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  self->_lastFired = v79;
LABEL_33:

}

- (CRLCanvasAutoscrollDelegate)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
  objc_storeStrong((id *)&self->_target, a3);
}

- (CGPoint)unscaledAutoscrollPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_unscaledAutoscrollPoint.x;
  y = self->_unscaledAutoscrollPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setUnscaledAutoscrollPoint:(CGPoint)a3
{
  self->_unscaledAutoscrollPoint = a3;
}

- (CGPoint)adjustedUnscaledAutoscrollPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_adjustedUnscaledAutoscrollPoint.x;
  y = self->_adjustedUnscaledAutoscrollPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setAdjustedUnscaledAutoscrollPoint:(CGPoint)a3
{
  self->_adjustedUnscaledAutoscrollPoint = a3;
}

- (int)directions
{
  return self->_directions;
}

- (void)setDirections:(int)a3
{
  self->_directions = a3;
}

- (double)repeatInterval
{
  return self->_repeatInterval;
}

- (void)setRepeatInterval:(double)a3
{
  self->_repeatInterval = a3;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (double)unscaledDistancePastVisibleRect
{
  return self->_unscaledDistancePastVisibleRect;
}

- (void)setUnscaledDistancePastVisibleRect:(double)a3
{
  self->_unscaledDistancePastVisibleRect = a3;
}

- (CGPoint)lastAutoscrollDelta
{
  double x;
  double y;
  CGPoint result;

  x = self->_lastAutoscrollDelta.x;
  y = self->_lastAutoscrollDelta.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLastAutoscrollDelta:(CGPoint)a3
{
  self->_lastAutoscrollDelta = a3;
}

- (double)unscaledInset
{
  return self->_unscaledInset;
}

- (void)setUnscaledInset:(double)a3
{
  self->_unscaledInset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
