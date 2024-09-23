@implementation CRLiOSPencilDownGestureRecognizer

- (CRLiOSPencilDownGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  CRLiOSPencilDownGestureRecognizer *v4;
  CRLiOSPencilDownGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRLiOSPencilDownGestureRecognizer;
  v4 = -[CRLiOSPencilDownGestureRecognizer initWithTarget:action:](&v7, "initWithTarget:action:", a3, a4);
  v5 = v4;
  if (v4)
    -[CRLiOSPencilDownGestureRecognizer setAllowedTouchTypes:](v4, "setAllowedTouchTypes:", &off_1012CAB58);
  return v5;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  void *v5;
  id v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "anyObject"));
  v6 = objc_msgSend(v5, "type");

  if (v6 != (id)2)
  {
    v7 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231C08);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF07A8(v7, v8);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231C28);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE81F0(v9, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSPencilDownGestureRecognizer touchesBegan:withEvent:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSPencilDownGestureRecognizer.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 25, 0, "Should only see pencil input to this gesture.");

  }
  -[CRLiOSPencilDownGestureRecognizer setState:](self, "setState:", 3);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  if (!-[CRLiOSPencilDownGestureRecognizer state](self, "state", a3, a4))
    -[CRLiOSPencilDownGestureRecognizer setState:](self, "setState:", 5);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  if (!-[CRLiOSPencilDownGestureRecognizer state](self, "state", a3, a4))
    -[CRLiOSPencilDownGestureRecognizer setState:](self, "setState:", 5);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  if (!-[CRLiOSPencilDownGestureRecognizer state](self, "state", a3, a4))
    -[CRLiOSPencilDownGestureRecognizer setState:](self, "setState:", 5);
}

@end
