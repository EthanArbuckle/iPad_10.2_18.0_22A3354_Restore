@implementation UIGestureRecognizer

- (UIGestureRecognizer)initWithGestureDispatcher:(id)a3 gestureKind:(id)a4
{
  id v6;
  id v7;
  UIGestureRecognizer *v8;
  UIGestureRecognizer *v9;

  v6 = a3;
  v7 = a4;
  v8 = -[UIGestureRecognizer initWithTarget:action:](self, "initWithTarget:action:", v6, "handleGesture:");
  v9 = v8;
  if (v8)
  {
    -[UIGestureRecognizer setGestureDelegate:](v8, "setGestureDelegate:", v6);
    -[UIGestureRecognizer setGestureKind:](v9, "setGestureKind:", v7);
    -[UIGestureRecognizer setName:](v9, "setName:", v7);
  }

  return v9;
}

- (void)setGestureKind:(id)a3
{
  objc_setAssociatedObject(self, &unk_101414DA0, a3, (void *)0x301);
}

- (NSString)gestureKind
{
  id AssociatedObject;
  __CFString *v3;
  __CFString *v4;
  NSString *v5;

  AssociatedObject = objc_getAssociatedObject(self, &unk_101414DA0);
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v4 = v3;
  if (!v3)
    v3 = CFSTR("CRLWPUndefinedGestureKind");
  v5 = v3;

  return v5;
}

- (void)setCachedGestureTarget:(id)a3
{
  id v4;
  TSDCachedGestureTargetHolder *value;

  v4 = a3;
  value = -[TSDCachedGestureTargetHolder initWithTarget:]([TSDCachedGestureTargetHolder alloc], "initWithTarget:", v4);

  objc_setAssociatedObject(self, &unk_101414DA1, value, (void *)0x301);
}

- (id)cachedGestureTarget
{
  id AssociatedObject;
  void *v3;
  void *v4;

  AssociatedObject = objc_getAssociatedObject(self, &unk_101414DA1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "weakCachedGestureTarget"));

  return v4;
}

- (void)setTargetRep:(id)a3
{
  objc_setAssociatedObject(self, &unk_101414DA2, a3, (void *)0x301);
}

- (CRLCanvasRep)targetRep
{
  return (CRLCanvasRep *)objc_getAssociatedObject(self, &unk_101414DA2);
}

- (int64_t)inputType
{
  return 1;
}

- (CGPoint)unscaledLocationForICC:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "canvasView"));
  -[UIGestureRecognizer locationInView:](self, "locationInView:", v5);
  objc_msgSend(v4, "convertBoundsToUnscaledPoint:");
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (CRLGestureDelegate)gestureDelegate
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIGestureRecognizer delegate](self, "delegate"));
  v9 = sub_100221DDC(v2, 1, v3, v4, v5, v6, v7, v8, (uint64_t)&OBJC_PROTOCOL___CRLGestureDelegate);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return (CRLGestureDelegate *)v10;
}

- (void)setGestureDelegate:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;

  v9 = sub_100221DDC(a3, 1, (uint64_t)a3, v3, v4, v5, v6, v7, (uint64_t)&OBJC_PROTOCOL___UIGestureRecognizerDelegate);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if (!v10)
  {
    v11 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101235CC0);
    v12 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF72A4(v11, v12);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101235CE0);
    v13 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE81F0(v13, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[UIGestureRecognizer(CRLGestureDispatcher) setGestureDelegate:]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/UIGestureRecognizer+Text.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 84, 0, "invalid nil value for '%{public}s'", "grDelegate");

  }
  -[UIGestureRecognizer setDelegate:](self, "setDelegate:", v10);

}

- (int)gestureState
{
  return -[UIGestureRecognizer state](self, "state");
}

- (BOOL)isDone
{
  return -[UIGestureRecognizer gestureState](self, "gestureState") - 3 < 3;
}

@end
