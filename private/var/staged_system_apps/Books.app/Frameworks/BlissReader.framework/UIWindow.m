@implementation UIWindow

- (double)statusBarMinDimension
{
  double v2;
  double v3;

  -[UIStatusBarManager statusBarFrame](-[UIWindowScene statusBarManager](-[UIWindow windowScene](self, "windowScene"), "statusBarManager"), "statusBarFrame");
  if (v2 >= v3)
    return v3;
  else
    return v2;
}

- (void)moveViewAboveStatusBar:(id)a3 zPosition:(double)a4 hostView:(id)a5
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _QWORD v19[9];

  if (!a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[UIWindow(THAdditions) moveViewAboveStatusBar:zPosition:hostView:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/UIWindow_THAdditions.m"), 61, CFSTR("invalid nil value for '%s'"), "view");
  v9 = objc_msgSend(a3, "superview");
  if (v9 == -[UIWindow rootView](self, "rootView") || objc_msgSend(a3, "stateRestoreBlock"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[UIWindow(THAdditions) moveViewAboveStatusBar:zPosition:hostView:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/UIWindow_THAdditions.m"), 62, CFSTR("view has already been moved above status bar"));
  objc_msgSend(objc_msgSend(a3, "layer"), "zPosition");
  v11 = v10;
  objc_msgSend(a3, "center");
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_FDB94;
  v19[3] = &unk_4299A0;
  v19[6] = v12;
  v19[7] = v13;
  v19[4] = a3;
  v19[5] = objc_msgSend(a3, "superview");
  v19[8] = v11;
  objc_msgSend(a3, "setStateRestoreBlock:", v19);
  v14 = -[UIWindow rootView](self, "rootView");
  objc_msgSend(a3, "center");
  v16 = v15;
  v18 = v17;
  if (objc_msgSend(a3, "superview"))
    a5 = objc_msgSend(a3, "superview");
  objc_msgSend(v14, "convertPoint:fromView:", a5, v16, v18);
  objc_msgSend(a3, "setCenter:");
  objc_msgSend(-[UIWindow rootView](self, "rootView"), "addSubview:", a3);
  objc_msgSend(objc_msgSend(a3, "layer"), "setZPosition:", a4);
}

- (void)moveViewBackBelowStatusBar:(id)a3 preserveCurrentFrame:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;

  v4 = a4;
  v7 = +[TSWPEffectsWindow sharedEffectsWindowAboveStatusBarForView:](TSWPEffectsWindow, "sharedEffectsWindowAboveStatusBarForView:");
  if (!a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[UIWindow(THAdditions) moveViewBackBelowStatusBar:preserveCurrentFrame:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/UIWindow_THAdditions.m"), 84, CFSTR("invalid nil value for '%s'"), "view");
  if (objc_msgSend(a3, "superview") != v7
    && (v8 = objc_msgSend(a3, "superview"), v8 != -[UIWindow rootView](self, "rootView"))
    || !objc_msgSend(a3, "stateRestoreBlock"))
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[UIWindow(THAdditions) moveViewBackBelowStatusBar:preserveCurrentFrame:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/UIWindow_THAdditions.m"), 85, CFSTR("view is not above status bar"));
  }
  v9 = objc_msgSend(a3, "superview");
  objc_msgSend(a3, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = objc_msgSend(a3, "superview");
  objc_msgSend(a3, "th_restoreState");
  if (v4)
  {
    objc_msgSend(objc_msgSend(a3, "superview"), "convertRect:fromView:", v18, v11, v13, v15, v17);
    objc_msgSend(a3, "setFrame:");
  }
  if (v9 != v7 && !-[UIWindow hasRaisedViews](self, "hasRaisedViews"))
    -[UIWindow th_restoreState](self, "th_restoreState");
}

+ (void)moveViewToEffectsWindowAboveStatusBar:(id)a3 zPosition:(double)a4 hostView:(id)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  float v23;
  int64_t v24;
  double v25;
  float v26;
  float v27;
  int64_t v28;
  double v29;
  float v30;
  _QWORD v31[9];

  v8 = +[TSWPEffectsWindow sharedEffectsWindowAboveStatusBarForView:](TSWPEffectsWindow, "sharedEffectsWindowAboveStatusBarForView:", a5);
  if (!a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[UIWindow(THAdditions) moveViewToEffectsWindowAboveStatusBar:zPosition:hostView:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/UIWindow_THAdditions.m"), 110, CFSTR("invalid nil value for '%s'"), "view");
  if (objc_msgSend(a3, "superview") == v8 || objc_msgSend(a3, "stateRestoreBlock"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[UIWindow(THAdditions) moveViewToEffectsWindowAboveStatusBar:zPosition:hostView:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/UIWindow_THAdditions.m"), 111, CFSTR("view has already been moved above status bar"));
  objc_msgSend(objc_msgSend(a3, "layer"), "zPosition");
  v10 = v9;
  objc_msgSend(a3, "center");
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_FE054;
  v31[3] = &unk_4299A0;
  v31[6] = v11;
  v31[7] = v12;
  v31[4] = a3;
  v31[5] = objc_msgSend(a3, "superview");
  v31[8] = v10;
  objc_msgSend(a3, "setStateRestoreBlock:", v31);
  v13 = a5;
  if (objc_msgSend(a3, "superview"))
    v13 = objc_msgSend(a3, "superview");
  if (objc_msgSend(a3, "window"))
    v14 = a3;
  else
    v14 = a5;
  v15 = objc_msgSend(v14, "window");
  objc_msgSend(a3, "center");
  v18 = v17;
  if (v13)
  {
    objc_msgSend(v13, "convertPoint:toView:", 0);
    v18 = v19;
  }
  if (v15)
  {
    objc_msgSend(v8, "convertPoint:fromWindow:", v15);
    v22 = v21;
  }
  else
  {
    v23 = v16;
    v24 = llroundf(v23);
    objc_msgSend(v8, "bounds");
    v26 = v25;
    v22 = (double)(v24 % (uint64_t)llroundf(v26));
    v27 = v18;
    v28 = llroundf(v27);
    objc_msgSend(v8, "bounds");
    v30 = v29;
    v20 = (double)(v28 % (uint64_t)llroundf(v30));
  }
  objc_msgSend(a3, "setCenter:", v22, v20);
  objc_msgSend(v8, "addSubview:", a3);
  objc_msgSend(objc_msgSend(a3, "layer"), "setZPosition:", a4);
}

- (id)rootView
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  double v22;
  double v23;
  __int128 v24;
  _QWORD v26[12];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _OWORD v30[3];
  _OWORD v31[3];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;

  if (!-[UIWindow stateRestoreBlock](self, "stateRestoreBlock"))
  {
    if (objc_msgSend(-[UIWindow subviews](self, "subviews"), "count") != (char *)&dword_0 + 1)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[UIWindow(THAdditions) rootView]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/UIWindow_THAdditions.m"), 158, CFSTR("can't pick a root view if there's more than one subview"));
    v3 = objc_msgSend(-[UIWindow subviews](self, "subviews"), "lastObject");
    -[UIWindow windowLevel](self, "windowLevel");
    v5 = v4;
    v6 = -[UIWindow backgroundColor](self, "backgroundColor");
    objc_msgSend(v3, "center");
    v8 = v7;
    v10 = v9;
    v36 = 0u;
    v37 = 0u;
    v35 = 0u;
    if (v3)
      objc_msgSend(v3, "transform");
    v11 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    objc_msgSend(v11, "setBackgroundColor:", +[UIColor clearColor](UIColor, "clearColor"));
    objc_msgSend(v3, "bounds");
    objc_msgSend(v11, "setBounds:");
    objc_msgSend(v3, "center");
    objc_msgSend(v11, "setCenter:");
    if (v3)
    {
      objc_msgSend(v3, "transform");
    }
    else
    {
      v33 = 0u;
      v34 = 0u;
      v32 = 0u;
    }
    v31[0] = v32;
    v31[1] = v33;
    v31[2] = v34;
    objc_msgSend(v11, "setTransform:", v31);
    -[UIWindow addSubview:](self, "addSubview:", v11);
    objc_msgSend(v11, "bounds");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    -[UIWindow statusBarMinDimension](self, "statusBarMinDimension");
    v21 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v13, v20 + v15, v17, v19 - v20);
    objc_msgSend(v21, "setBackgroundColor:", +[UIColor clearColor](UIColor, "clearColor"));
    objc_msgSend(v21, "setClipsToBounds:", 1);
    objc_msgSend(v11, "addSubview:", v21);
    objc_msgSend(v3, "center");
    objc_msgSend(v21, "convertPoint:fromView:", objc_msgSend(v3, "superview"), v22, v23);
    objc_msgSend(v3, "setCenter:");
    v24 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v30[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v30[1] = v24;
    v30[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    objc_msgSend(v3, "setTransform:", v30);
    objc_msgSend(v21, "addSubview:", v3);
    -[UIWindow setBackgroundColor:](self, "setBackgroundColor:", +[UIColor clearColor](UIColor, "clearColor"));
    -[UIWindow setWindowLevel:](self, "setWindowLevel:", UIWindowLevelStatusBar + 1.0);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_FE3E8;
    v26[3] = &unk_4299C8;
    v26[4] = self;
    v26[5] = v6;
    v26[9] = v5;
    v26[10] = v8;
    v26[11] = v10;
    v27 = v35;
    v28 = v36;
    v29 = v37;
    v26[6] = v3;
    v26[7] = v21;
    v26[8] = v11;
    -[UIWindow setStateRestoreBlock:](self, "setStateRestoreBlock:", v26);

  }
  return objc_msgSend(-[UIWindow subviews](self, "subviews"), "lastObject");
}

- (BOOL)hasRaisedViews
{
  return (unint64_t)objc_msgSend(objc_msgSend(-[UIWindow rootView](self, "rootView"), "subviews"), "count") > 1;
}

@end
