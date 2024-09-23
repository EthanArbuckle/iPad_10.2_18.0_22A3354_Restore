@implementation CRLCanvasHUDController

- (void)p_commonInit
{
  NSMutableSet *v3;
  NSMutableSet *objectsShowingHUD;

  v3 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  objectsShowingHUD = self->_objectsShowingHUD;
  self->_objectsShowingHUD = v3;

}

- (void)dealloc
{
  objc_super v3;

  -[NSTimer invalidate](self->_stringTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CRLCanvasHUDController;
  -[CRLCanvasHUDController dealloc](&v3, "dealloc");
}

+ (CRLCanvasHUDController)sharedHUDController
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10024B2BC;
  block[3] = &unk_10122DC38;
  block[4] = a1;
  if (qword_101415278 != -1)
    dispatch_once(&qword_101415278, block);
  return (CRLCanvasHUDController *)(id)qword_101415270;
}

- (void)setLabelText:(id)a3
{
  double v5;
  NSTimer *stringTimer;
  NSTimer *v7;
  NSTimer *v8;
  NSTimer *v9;
  double v10;
  id WeakRetained;
  id v12;

  v12 = a3;
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  if (v5 - self->_lastTimeUpdated >= 0.05)
  {
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    self->_lastTimeUpdated = v10;
    if (objc_msgSend(v12, "length"))
    {
      objc_storeStrong((id *)&self->_lastStringSet, a3);
      -[CRLCanvasHUDController p_displayText:](self, "p_displayText:", v12);
    }
  }
  else
  {
    stringTimer = self->_stringTimer;
    if (stringTimer)
    {
      -[NSTimer invalidate](stringTimer, "invalidate");
      v7 = self->_stringTimer;
      self->_stringTimer = 0;

    }
    v8 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "p_labelTextTimerFired", 0, 0, 0.200000003));
    v9 = self->_stringTimer;
    self->_stringTimer = v8;

    objc_storeStrong((id *)&self->_lastStringSet, a3);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_canvasView);

  if (WeakRetained)
    -[CRLCanvasHUDController p_layoutUpdatingOffset:](self, "p_layoutUpdatingOffset:", 0);

}

- (void)showHUDForKey:(id)a3 forTouchPoint:(CGPoint)a4 inCanvasView:(id)a5 withUpwardsNudge:(double)a6
{
  -[CRLCanvasHUDController showHUDForKey:forTouchPoint:inCanvasView:withUpwardsNudge:size:](self, "showHUDForKey:forTouchPoint:inCanvasView:withUpwardsNudge:size:", a3, a5, 0, a4.x, a4.y, a6);
}

- (void)showHUDForKey:(id)a3 forTouchPoint:(CGPoint)a4 inCanvasView:(id)a5 withUpwardsNudge:(double)a6 size:(unint64_t)a7
{
  -[CRLCanvasHUDController showHUDForKey:forTouchPoint:inCanvasView:withNudge:size:](self, "showHUDForKey:forTouchPoint:inCanvasView:withNudge:size:", a3, a5, a7, a4.x, a4.y, 0.0, -a6);
}

- (void)showHUDForKey:(id)a3 forTouchPoint:(CGPoint)a4 inCanvasView:(id)a5 withNudge:(CGSize)a6 size:(unint64_t)a7
{
  -[CRLCanvasHUDController showHUDForKey:forTouchPoint:inCanvasView:withNudge:size:anchorPoint:](self, "showHUDForKey:forTouchPoint:inCanvasView:withNudge:size:anchorPoint:", a3, a5, a7, a4.x, a4.y, a6.width, a6.height, 0.5, 0.5);
}

- (void)showHUDForKey:(id)a3 forTouchPoint:(CGPoint)a4 inCanvasView:(id)a5 withNudge:(CGSize)a6 size:(unint64_t)a7 anchorPoint:(CGPoint)a8
{
  double y;
  double x;
  double height;
  double width;
  double v13;
  double v14;
  NSMutableSet *objectsShowingHUD;
  id v18;

  y = a8.y;
  x = a8.x;
  height = a6.height;
  width = a6.width;
  v13 = a4.y;
  v14 = a4.x;
  objectsShowingHUD = self->_objectsShowingHUD;
  v18 = a5;
  -[NSMutableSet addObject:](objectsShowingHUD, "addObject:", a3);
  -[CRLCanvasHUDController p_showHUDAtPoint:inCanvasView:withNudge:size:anchorPoint:](self, "p_showHUDAtPoint:inCanvasView:withNudge:size:anchorPoint:", v18, a7, v14, v13, width, height, x, y);

}

- (void)hideHUDForKey:(id)a3
{
  CGPoint v4;
  NSTimer *stringTimer;
  NSTimer *v6;
  id v7;

  v7 = a3;
  if (-[NSMutableSet containsObject:](self->_objectsShowingHUD, "containsObject:"))
  {
    -[NSMutableSet removeObject:](self->_objectsShowingHUD, "removeObject:", v7);
    if (!-[NSMutableSet count](self->_objectsShowingHUD, "count"))
    {
      -[CRLCanvasHUDController p_hideHUD](self, "p_hideHUD");
      v4 = CGPointZero;
      self->_touchPoint = CGPointZero;
      self->_HUDPoint = v4;
      self->_HUDOffset = 0;
      objc_storeWeak((id *)&self->_canvasView, 0);
      stringTimer = self->_stringTimer;
      if (stringTimer)
      {
        -[NSTimer invalidate](stringTimer, "invalidate");
        v6 = self->_stringTimer;
        self->_stringTimer = 0;

      }
    }
  }

}

- (void)p_labelTextTimerFired
{
  NSTimer *stringTimer;
  NSTimer *v4;

  stringTimer = self->_stringTimer;
  if (stringTimer)
  {
    -[NSTimer invalidate](stringTimer, "invalidate");
    v4 = self->_stringTimer;
    self->_stringTimer = 0;

  }
  -[CRLCanvasHUDController setLabelText:](self, "setLabelText:", self->_lastStringSet);
}

- (CRLCanvasHUDController)init
{
  CRLCanvasHUDController *v2;
  CRLCanvasHUDController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLCanvasHUDController;
  v2 = -[CRLCanvasHUDController initWithNibName:bundle:](&v5, "initWithNibName:bundle:", 0, 0);
  v3 = v2;
  if (v2)
    -[CRLCanvasHUDController p_commonInit](v2, "p_commonInit");
  return v3;
}

- (id)hudView
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;

  *(_QWORD *)&v3 = objc_opt_class(CRLiOSCanvasHUDView, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasHUDController view](self, "view", v3));
  v7 = sub_100221D0C(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

- (void)loadView
{
  id v3;

  v3 = -[CRLiOSCanvasHUDView initForHUDViewSize:]([CRLiOSCanvasHUDView alloc], "initForHUDViewSize:", 0);
  -[CRLCanvasHUDController setView:](self, "setView:", v3);

}

- (void)p_showHUDAtPoint:(CGPoint)a3 inCanvasView:(id)a4 withNudge:(CGSize)a5 size:(unint64_t)a6 anchorPoint:(CGPoint)a7
{
  double y;
  double x;
  double height;
  double width;
  double v12;
  double v13;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSString *v39;
  void *v40;
  id WeakRetained;
  void *v42;
  id v43;
  int v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  CGPoint v53;

  y = a7.y;
  x = a7.x;
  height = a5.height;
  width = a5.width;
  v12 = a3.y;
  v13 = a3.x;
  v15 = a4;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasHUDController hudView](self, "hudView"));
  objc_msgSend(v16, "updateViewToHUDViewSize:", a6);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "enclosingScrollView"));
  v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "superview"));

  if (!v18)
    v18 = v15;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasHUDController view](self, "view"));
  v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "superview"));

  if (v20 != v18)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasHUDController view](self, "view"));
    objc_msgSend(v21, "removeFromSuperview");

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasHUDController view](self, "view"));
    objc_msgSend(v18, "addSubview:", v22);

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasHUDController view](self, "view"));
  v24 = objc_msgSend(v23, "isHidden");

  if (v24)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasHUDController view](self, "view"));
    objc_msgSend(v25, "setHidden:", 0);

  }
  objc_msgSend(v15, "convertPoint:toView:", v18, v13, v12);
  v27 = v26;
  v29 = v28;
  v31 = sub_1000613A8(x, y, 0.0, 0.0, 1.0, 1.0);
  v32 = v30;
  if (v31 != x || v30 != y)
  {
    v34 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101247AE8);
    v35 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1163C(v35, v34, x, y);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101247B08);
    v36 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasHUDController p_showHUDAtPoint:inCanvasView:withNudge:size:anchorPoint:]"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasHUDController.m"));
    v53.x = x;
    v53.y = y;
    v39 = NSStringFromCGPoint(v53);
    v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v37, v38, 204, 0, "Anchor point should be [0, 1]! Got %@", v40);

  }
  self->_anchorPoint.x = v31;
  self->_anchorPoint.y = v32;
  self->_touchPoint.x = v27;
  self->_touchPoint.y = v29;
  self->_HUDPoint.x = width + v27;
  self->_HUDPoint.y = height + v29;
  WeakRetained = objc_loadWeakRetained((id *)&self->_canvasView);
  if (WeakRetained)
  {
    v42 = WeakRetained;
    v43 = objc_loadWeakRetained((id *)&self->_canvasView);

    if (v43 != v15)
    {
      v44 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101247B28);
      v45 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E11594(v44, v45);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101247B48);
      v46 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE87A4(v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasHUDController p_showHUDAtPoint:inCanvasView:withNudge:size:anchorPoint:]"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasHUDController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v47, v48, 211, 0, "trying to move the CanvasHUD from one canvas to another while it is visible!");

    }
  }
  objc_storeWeak((id *)&self->_canvasView, v15);
  -[CRLCanvasHUDController p_layoutUpdatingOffset:](self, "p_layoutUpdatingOffset:", 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasHUDController view](self, "view"));
  objc_msgSend(v49, "alpha");
  v51 = v50;

  if (v51 != 1.0)
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasHUDController view](self, "view"));
    objc_msgSend(v52, "setAlpha:", 1.0);

  }
}

- (void)p_hideHUD
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasHUDController view](self, "view"));
  objc_msgSend(v2, "setHidden:", 1);

}

- (void)p_displayText:(id)a3
{
  id v4;
  void *v5;
  _BOOL8 v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v6 = objc_msgSend(v5, "userInterfaceLayoutDirection") == (id)1;

  v7 = objc_alloc_init((Class)NSMutableParagraphStyle);
  objc_msgSend(v7, "setAlignment:", 1);
  objc_msgSend(v7, "setBaseWritingDirection:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasHUDController hudView](self, "hudView"));
  +[CRLiOSCanvasHUDView fontSizeForHUDViewSize:](CRLiOSCanvasHUDView, "fontSizeForHUDViewSize:", objc_msgSend(v8, "hudSize"));
  v10 = v9;

  objc_opt_class(UIFont, v11);
  if ((objc_opt_respondsToSelector(v12, "monospacedDigitSystemFontOfSize:weight:") & 1) != 0)
    v13 = objc_claimAutoreleasedReturnValue(+[UIFont monospacedDigitSystemFontOfSize:weight:](UIFont, "monospacedDigitSystemFontOfSize:weight:", v10, UIFontWeightBold));
  else
    v13 = objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", v10));
  v14 = (void *)v13;
  v19[0] = NSParagraphStyleAttributeName;
  v19[1] = NSFontAttributeName;
  v20[0] = v7;
  v20[1] = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 2));
  v16 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", v4, v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasHUDController hudView](self, "hudView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "label"));
  objc_msgSend(v18, "setAttributedText:", v16);

}

- (void)p_layoutUpdatingOffset:(BOOL)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  id WeakRetained;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  CGFloat height;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double MinY;
  double MaxY;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  uint64_t v54;
  unint64_t v55;
  double v56;
  double v57;
  double v58;
  uint64_t v59;
  double *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t HUDOffset;
  unint64_t v68;
  double *v69;
  BOOL v70;
  char v71;
  BOOL v72;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v76;
  double v77;
  double v78;
  double v79;
  _QWORD v80[9];
  double v81;
  double v82[13];
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasHUDController hudView](self, "hudView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "label"));

  objc_msgSend(v6, "bounds");
  objc_msgSend(v6, "sizeThatFits:", v7, v8);
  v10 = v9 + 18.0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasHUDController hudView](self, "hudView"));
  +[CRLiOSCanvasHUDView viewHeightForHUDViewSize:](CRLiOSCanvasHUDView, "viewHeightForHUDViewSize:", objc_msgSend(v11, "hudSize"));
  v13 = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasHUDController view](self, "view"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "superview"));

  WeakRetained = objc_loadWeakRetained((id *)&self->_canvasView);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "controller"));
  objc_msgSend(v17, "visibleScaledRectForCanvasUI");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  v26 = objc_loadWeakRetained((id *)&self->_canvasView);
  objc_msgSend(v26, "convertRect:toView:", v15, v19, v21, v23, v25);
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;

  v83.origin.x = v28;
  v83.origin.y = v30;
  v83.size.width = v32;
  v83.size.height = v34;
  v84 = CGRectInset(v83, 6.0, 6.0);
  height = v84.size.height;
  y = v84.origin.y;
  x = v84.origin.x;
  width = v84.size.width;
  -[CRLCanvasHUDController p_frameForHUDWithSize:anchoredAtPoint:insideRect:](self, "p_frameForHUDWithSize:anchoredAtPoint:insideRect:", v10, v13, self->_HUDPoint.x, self->_HUDPoint.y);
  v78 = v37;
  v79 = v36;
  v76 = v39;
  v77 = v38;
  v41 = self->_touchPoint.x;
  v40 = self->_touchPoint.y;
  v42 = 0.0;
  if (self->_HUDPoint.x != v41 || self->_HUDPoint.y != v40)
  {
    v72 = a3;
    v85.origin.x = x;
    v85.origin.y = y;
    v85.size.width = width;
    v85.size.height = height;
    MinY = CGRectGetMinY(v85);
    v86.origin.x = x;
    v86.origin.y = y;
    v86.size.width = width;
    v86.size.height = height;
    MaxY = CGRectGetMaxY(v86);
    v45 = sub_1003C65EC(v40, MinY, MaxY);
    self->_touchPoint.x = v41;
    self->_touchPoint.y = v45;
    -[CRLCanvasHUDController p_touchRectForHUDWithFrame:](self, "p_touchRectForHUDWithFrame:", v79, v78, v77, v76);
    v47 = v46;
    v49 = v48;
    v51 = v50;
    v53 = v52;
    v54 = 0;
    v55 = 0;
    v56 = INFINITY;
    v57 = INFINITY;
    v58 = INFINITY;
    do
    {
      v59 = qword_100EEE6C8[v54];
      v81 = 0.0;
      v82[0] = 0.0;
      v60 = &v82[4 * v59 + 1];
      -[CRLCanvasHUDController p_HUDFrame:offset:fromTouchRect:insideRect:overlap:shift:](self, "p_HUDFrame:offset:fromTouchRect:insideRect:overlap:shift:", v59, v82, &v81, v79, v78, v77, v76, v47, v49, v51, v53, *(_QWORD *)&x, *(_QWORD *)&y, *(_QWORD *)&width, *(_QWORD *)&height);
      *((_QWORD *)v60 - 4) = v61;
      *((_QWORD *)v60 - 3) = v62;
      *((_QWORD *)v60 - 2) = v63;
      *((_QWORD *)v60 - 1) = v64;
      if (v82[0] >= v58)
      {
        if (v82[0] == v58 && v81 < v57 && v57 - v81 > 2.0)
        {
          v55 = v59;
          v57 = v81;
        }
      }
      else
      {
        v57 = v81;
        v55 = v59;
        v58 = v82[0];
      }
      ++v54;
      HUDOffset = self->_HUDOffset;
      if (v59 == HUDOffset)
        v56 = v82[0];
    }
    while (v54 != 3);
    if (v56 != v58 || v55 == HUDOffset || v55 == 1)
      v68 = v55;
    else
      v68 = self->_HUDOffset;
    v69 = &v82[4 * v68 + 1];
    v78 = *(v69 - 3);
    v79 = *(v69 - 4);
    v76 = *(v69 - 1);
    v77 = *(v69 - 2);
    if (v72)
    {
      if (HUDOffset)
        v70 = HUDOffset == v68;
      else
        v70 = 1;
      self->_HUDOffset = v68;
      v71 = !v70;
      v42 = 0.0;
      if ((v71 & 1) != 0)
        v42 = 0.15;
    }
    else
    {
      v42 = 0.0;
    }
  }
  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472;
  v80[2] = sub_10024C2D0;
  v80[3] = &unk_10122F7A8;
  v80[4] = self;
  *(double *)&v80[5] = v79;
  *(double *)&v80[6] = v78;
  *(double *)&v80[7] = v77;
  *(double *)&v80[8] = v76;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v80, v42);

}

- (CGFloat)p_HUDFrame:(CGFloat)a3 offset:(CGFloat)a4 fromTouchRect:(CGFloat)a5 insideRect:(double)a6 overlap:(double)a7 shift:(double)a8
{
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  double v32;
  double v33;
  double v34;
  double *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v46;
  double v47;
  double v48;
  double v49;
  CGRect v50;
  CGRect v51;

  if (a11 != 1)
  {
    v46 = a6;
    v47 = a7;
    v48 = a8;
    v49 = a9;
    objc_msgSend(a1, "p_touchRectForHUDWithFrame:", a2, a3, a4, a5);
    v33 = a4 * 0.5 + v32 * 1.5 + 1.0;
    if (a11 == 3)
    {
      v34 = v33 + a1[6];
    }
    else
    {
      if (a11 != 2)
      {
        v35 = a1 + 9;
        v34 = a1[8];
LABEL_10:
        objc_msgSend(a1, "p_frameForHUDWithSize:anchoredAtPoint:insideRect:", a4, a5, v34, *v35, a14, a15, a16, a17);
        v29 = v36;
        v28 = v37;
        v27 = v38;
        v26 = v39;
        a8 = v48;
        a9 = v49;
        a6 = v46;
        a7 = v47;
        if (!a12)
          goto LABEL_12;
        goto LABEL_11;
      }
      v34 = a1[6] - v33;
    }
    v35 = a1 + 9;
    goto LABEL_10;
  }
  v26 = a5;
  v27 = a4;
  v28 = a3;
  v29 = a2;
  if (a12)
  {
LABEL_11:
    v50.origin.x = v29;
    v50.origin.y = v28;
    v50.size.width = v27;
    v50.size.height = v26;
    v51 = CGRectIntersection(v50, *(CGRect *)&a6);
    *a12 = v51.size.width * v51.size.height;
  }
LABEL_12:
  if (a13)
  {
    v40 = sub_100061400(a2, a3, a4, a5);
    v42 = v41;
    v43 = sub_100061400(v29, v28, v27, v26);
    *a13 = sub_10006108C(v40, v42, v43, v44);
  }
  return v29;
}

- (CGRect)p_frameForHUDWithSize:(CGSize)a3 anchoredAtPoint:(CGPoint)a4 insideRect:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v9;
  double v10;
  double v12;
  CKRecordID v13;
  Swift::String v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  id WeakRetained;
  void *v27;
  void *v28;
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
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a4.y;
  v10 = a4.x;
  v12 = sub_100060FCC(self->_anchorPoint.x, self->_anchorPoint.y, a3.width);
  sub_1000603B8(v10, v9, v12);
  SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v13, v14);
  v19 = sub_100061AD8(v15, v16, v17, v18, x, y, width, height);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  WeakRetained = objc_loadWeakRetained((id *)&self->_canvasView);
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "controller"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "canvas"));
  objc_msgSend(v28, "contentsScale");
  v30 = sub_100063150(v19, v21, v23, v25, v29);
  v32 = v31;
  v34 = v33;
  v36 = v35;

  v37 = v30;
  v38 = v32;
  v39 = v34;
  v40 = v36;
  result.size.height = v40;
  result.size.width = v39;
  result.origin.y = v38;
  result.origin.x = v37;
  return result;
}

- (CGRect)p_touchRectForHUDWithFrame:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = sub_10005FD98(self->_touchPoint.x, self->_touchPoint.y, 30.0);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)p_setHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasHUDController hudView](self, "hudView"));
  objc_msgSend(v4, "setHidden:", v3);

}

- (NSString)crlaxLastStringSet
{
  return self->_lastStringSet;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_canvasView);
  objc_storeStrong((id *)&self->_objectsShowingHUD, 0);
  objc_storeStrong((id *)&self->_stringTimer, 0);
  objc_storeStrong((id *)&self->_lastStringSet, 0);
}

@end
