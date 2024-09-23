@implementation CRLCanvasView

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
      dispatch_once(&qword_10147E370, &stru_1012576E0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2A3E8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101257700);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasView dealloc]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasView.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 43, 0, "teardown not called for CRLCanvasView.");

  }
  v6.receiver = self;
  v6.super_class = (Class)CRLCanvasView;
  -[CRLCanvasView dealloc](&v6, "dealloc");
}

+ (Class)layerClass
{
  return (Class)objc_opt_class(CRLCanvasLayer, a2);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  id WeakRetained;
  _BOOL4 v9;
  BOOL v10;
  objc_super v12;
  CGPoint v13;
  CGRect v14;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  objc_msgSend(WeakRetained, "i_visibleBoundsRectForHitTestingCanvasView");
  v13.x = x;
  v13.y = y;
  v9 = CGRectContainsPoint(v14, v13);

  if (v9)
  {
    v12.receiver = self;
    v12.super_class = (Class)CRLCanvasView;
    v10 = -[CRLCanvasView pointInside:withEvent:](&v12, "pointInside:withEvent:", v7, x, y);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)setController:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);

  if (WeakRetained)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101257720);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2A468();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101257740);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasView setController:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasView.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 61, 0, "shouldn't try to set canvasView's controller more than once");

  }
  v9 = objc_loadWeakRetained((id *)&self->_controller);

  if (!v9)
  {
    objc_storeWeak((id *)&self->_controller, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasView canvasLayer](self, "canvasLayer"));
    objc_msgSend(v10, "setController:", v4);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layerHost"));
    -[CRLCanvasView setLayerHost:](self, "setLayerHost:", v11);

  }
}

- (void)teardown
{
  void *v3;
  void *v4;
  void *v5;
  UICoordinateSpace *unscaledCoordinateSpace;
  void *v7;

  if (self->_isTornDown)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101257760);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2A4E8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101257780);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasView teardown]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasView.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 72, 0, "attempting to call teardown on an instance of CRLCanvasView that has already been torn down.");

  }
  self->_isTornDown = 1;
  objc_storeWeak((id *)&self->_controller, 0);
  unscaledCoordinateSpace = self->_unscaledCoordinateSpace;
  self->_unscaledCoordinateSpace = 0;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasView canvasLayer](self, "canvasLayer"));
  objc_msgSend(v7, "teardown");

}

- (CRLCanvasLayer)canvasLayer
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;

  *(_QWORD *)&v3 = objc_opt_class(CRLCanvasLayer, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasView layer](self, "layer", v3));
  v7 = sub_100221D0C(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return (CRLCanvasLayer *)v8;
}

- (CRLScrollView)enclosingScrollView
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;

  *(_QWORD *)&v3 = objc_opt_class(CRLScrollView, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasView superview](self, "superview", v3));
  v7 = sub_100221D0C(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return (CRLScrollView *)v8;
}

- (void)setCanvasSubviews:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];

  v4 = a3;
  v5 = objc_alloc((Class)NSMutableOrderedSet);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasView subviews](self, "subviews"));
  v7 = objc_msgSend(v5, "initWithArray:", v6);

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "containsObject:", v13))
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasView subviews](self, "subviews"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastObject"));

          if (v13 != v15)
          {
            objc_msgSend(v13, "removeFromSuperview");
            -[CRLCanvasView addSubview:](self, "addSubview:", v13);
          }
          objc_msgSend(v7, "removeObject:", v13);
        }
        else
        {
          -[CRLCanvasView addSubview:](self, "addSubview:", v13);
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v10);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v16 = v7;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)j), "removeFromSuperview", (_QWORD)v21);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v18);
  }

}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id WeakRetained;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasView layer](self, "layer"));
  if (v8 == v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "i_currentAnimation"));

    if (v12)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "actionForLayer:forKey:", v6, v7));

      goto LABEL_6;
    }
  }
  else
  {

  }
  v14.receiver = self;
  v14.super_class = (Class)CRLCanvasView;
  v9 = -[CRLCanvasView actionForLayer:forKey:](&v14, "actionForLayer:forKey:", v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
LABEL_6:

  return v10;
}

- (UIViewController)rootViewControllerForColorMagnifierHUD
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasView window](self, "window"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rootViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "childViewControllers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastObject"));

  return (UIViewController *)v5;
}

- (UICoordinateSpace)unscaledCoordinateSpace
{
  UICoordinateSpace *unscaledCoordinateSpace;
  CRLAdditionalTransformCoordinateSpace *v4;
  UICoordinateSpace *v5;

  unscaledCoordinateSpace = self->_unscaledCoordinateSpace;
  if (!unscaledCoordinateSpace)
  {
    v4 = -[CRLAdditionalTransformCoordinateSpace initWithCoordinateSpace:identifier:]([CRLAdditionalTransformCoordinateSpace alloc], "initWithCoordinateSpace:identifier:", self, CFSTR("CRLCanvasViewUnscaledSpaceIdentifier"));
    v5 = self->_unscaledCoordinateSpace;
    self->_unscaledCoordinateSpace = (UICoordinateSpace *)v4;

    unscaledCoordinateSpace = self->_unscaledCoordinateSpace;
  }
  return unscaledCoordinateSpace;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  CRLCanvasView *v8;
  CRLCanvasView *v9;
  BOOL v10;
  id WeakRetained;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  CRLCanvasView *v15;
  objc_super v17;

  y = a3.y;
  x = a3.x;
  v17.receiver = self;
  v17.super_class = (Class)CRLCanvasView;
  v7 = -[CRLCanvasView hitTest:withEvent:](&v17, "hitTest:withEvent:", a4);
  v8 = (CRLCanvasView *)objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v8)
    v10 = v8 == self;
  else
    v10 = 1;
  if (!v10)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "layerHost"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "asiOSCVC"));
    v14 = objc_msgSend(v13, "canvasSubview:shouldHandleEventAtBoundsPoint:", v9, x, y);

    if ((v14 & 1) == 0)
    {
      v15 = self;

      v9 = v15;
    }
  }
  return v9;
}

- (void)find:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasView controller](self, "controller"));
  objc_msgSend(v5, "endEditing");

  v6.receiver = self;
  v6.super_class = (Class)CRLCanvasView;
  -[CRLCanvasView find:](&v6, "find:", v4);

}

- (void)findAndReplace:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasView controller](self, "controller"));
  objc_msgSend(v5, "endEditing");

  v6.receiver = self;
  v6.super_class = (Class)CRLCanvasView;
  -[CRLCanvasView findAndReplace:](&v6, "findAndReplace:", v4);

}

- (BOOL)_accessibilityShouldUpdateQuickSpeakContent
{
  return 1;
}

- (CGAffineTransform)additionalTransformIntoCoordinateSpace:(SEL)a3
{
  id v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  double v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  CGAffineTransform *result;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("CRLCanvasViewUnscaledSpaceIdentifier"));

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasView controller](self, "controller"));
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "viewScale");
      CGAffineTransformMakeScale(retstr, 1.0 / v11, 1.0 / v11);
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012577E0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E2A568();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101257800);
      v19 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasView additionalTransformIntoCoordinateSpace:]"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasView.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v20, v21, 178, 0, "invalid nil value for '%{public}s'", "icc");

      v22 = *(_OWORD *)&CGAffineTransformIdentity.c;
      *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
      *(_OWORD *)&retstr->c = v22;
      *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    }

  }
  else
  {
    v12 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012577A0);
    v13 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2A60C(v13, (uint64_t)v6, v12);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012577C0);
    v14 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasView additionalTransformIntoCoordinateSpace:]"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasView.m"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 173, 0, "Unhandled coordinate space: %{public}@", v17);

    v18 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&retstr->c = v18;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  }

  return result;
}

- (CRLCanvasLayerHosting)layerHost
{
  return (CRLCanvasLayerHosting *)objc_loadWeakRetained((id *)&self->_layerHost);
}

- (void)setLayerHost:(id)a3
{
  objc_storeWeak((id *)&self->_layerHost, a3);
}

- (CRLInteractiveCanvasController)controller
{
  return (CRLInteractiveCanvasController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (MTLDevice)metalDeviceForScreenWithCanvas
{
  return self->_metalDeviceForScreenWithCanvas;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unscaledCoordinateSpace, 0);
  objc_storeStrong((id *)&self->_metalDeviceForScreenWithCanvas, 0);
  objc_destroyWeak((id *)&self->_controller);
  objc_destroyWeak((id *)&self->_layerHost);
}

@end
