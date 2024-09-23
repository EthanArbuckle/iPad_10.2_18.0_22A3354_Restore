@implementation CRLWPImmediatePressGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  objc_super v15;

  v6 = a4;
  v7 = a3;
  -[CRLWPImmediatePressGestureRecognizer setDidSendReset:](self, "setDidSendReset:", 0);
  -[CRLWPImmediatePressGestureRecognizer setPreviousTimestamp:](self, "setPreviousTimestamp:", CFAbsoluteTimeGetCurrent());
  v15.receiver = self;
  v15.super_class = (Class)CRLWPImmediatePressGestureRecognizer;
  -[CRLWPImmediatePressGestureRecognizer touchesBegan:withEvent:](&v15, "touchesBegan:withEvent:", v7, v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "anyObject"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPImmediatePressGestureRecognizer canvasView](self, "canvasView"));

  if (v9)
    v10 = objc_claimAutoreleasedReturnValue(-[CRLWPImmediatePressGestureRecognizer canvasView](self, "canvasView"));
  else
    v10 = objc_claimAutoreleasedReturnValue(-[CRLWPImmediatePressGestureRecognizer view](self, "view"));
  v11 = (void *)v10;
  objc_msgSend(v8, "locationInView:", v10);
  -[CRLWPImmediatePressGestureRecognizer setPreviousPosition:](self, "setPreviousPosition:");

  v12 = objc_msgSend(v8, "tapCount");
  -[CRLWPImmediatePressGestureRecognizer setInputType:](self, "setInputType:", sub_10033831C((_BOOL8)objc_msgSend(v8, "type")));
  v13 = -[CRLWPImmediatePressGestureRecognizer state](self, "state");
  if ((unint64_t)v12 < 2)
  {
    if ((uint64_t)v13 <= 0)
    {
      -[CRLWPImmediatePressGestureRecognizer previousPosition](self, "previousPosition");
      -[CRLWPImmediatePressGestureRecognizer setInitialPosition:](self, "setInitialPosition:");
      if ((-[CRLWPImmediatePressGestureRecognizer modifierFlags](self, "modifierFlags") & 0x20000) != 0)
      {
        v14 = 1;
        goto LABEL_13;
      }
      if (-[CRLWPImmediatePressGestureRecognizer disallowOptionKey](self, "disallowOptionKey")
        && (-[CRLWPImmediatePressGestureRecognizer modifierFlags](self, "modifierFlags") & 0x80000) != 0)
      {
LABEL_6:
        v14 = 5;
LABEL_13:
        -[CRLWPImmediatePressGestureRecognizer setState:](self, "setState:", v14);
      }
    }
  }
  else if (v13 != (id)5)
  {
    goto LABEL_6;
  }

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  double Current;
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
  double v19;
  double v20;
  double v21;
  int v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;

  v6 = a3;
  v7 = a4;
  Current = CFAbsoluteTimeGetCurrent();
  -[CRLWPImmediatePressGestureRecognizer previousTimestamp](self, "previousTimestamp");
  v10 = Current - v9;
  -[CRLWPImmediatePressGestureRecognizer setPreviousTimestamp:](self, "setPreviousTimestamp:", Current);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "anyObject"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPImmediatePressGestureRecognizer view](self, "view"));
  objc_msgSend(v11, "locationInView:", v12);
  v14 = v13;
  v16 = v15;

  -[CRLWPImmediatePressGestureRecognizer previousPosition](self, "previousPosition");
  v18 = v17;
  v20 = v19;
  -[CRLWPImmediatePressGestureRecognizer setPreviousPosition:](self, "setPreviousPosition:", v14, v16);
  if (v10 <= 0.0)
  {
    v22 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125E770);
    v23 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E350D8(v22, v23);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125E790);
    v24 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE81F0(v24, v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPImmediatePressGestureRecognizer touchesMoved:withEvent:]"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPImmediatePressGestureRecognizer.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v25, v26, 75, 0, "Time travel should have had a non-zero value here");

    v21 = 0.0;
  }
  else
  {
    v21 = sub_10006108C(v18, v20, v14, v16) / v10;
  }
  -[CRLWPImmediatePressGestureRecognizer setVelocity:](self, "setVelocity:", v21);
  v27.receiver = self;
  v27.super_class = (Class)CRLWPImmediatePressGestureRecognizer;
  -[CRLWPImmediatePressGestureRecognizer touchesMoved:withEvent:](&v27, "touchesMoved:withEvent:", v6, v7);

}

- (void)reset
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CRLWPImmediatePressGestureRecognizer;
  -[CRLWPImmediatePressGestureRecognizer reset](&v12, "reset");
  if (!-[CRLWPImmediatePressGestureRecognizer didSendReset](self, "didSendReset"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPImmediatePressGestureRecognizer delegate](self, "delegate"));
    v10 = sub_100221DDC(v3, 1, v4, v5, v6, v7, v8, v9, (uint64_t)&OBJC_PROTOCOL___CRLGestureDelegate);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

    objc_msgSend(v11, "didReset:", self);
    -[CRLWPImmediatePressGestureRecognizer setDidSendReset:](self, "setDidSendReset:", 1);

  }
}

- (int64_t)inputType
{
  return self->_inputType;
}

- (void)setInputType:(int64_t)a3
{
  self->_inputType = a3;
}

- (double)velocity
{
  return self->_velocity;
}

- (void)setVelocity:(double)a3
{
  self->_velocity = a3;
}

- (CGPoint)initialPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_initialPosition.x;
  y = self->_initialPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInitialPosition:(CGPoint)a3
{
  self->_initialPosition = a3;
}

- (UIView)canvasView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_canvasView);
}

- (void)setCanvasView:(id)a3
{
  objc_storeWeak((id *)&self->_canvasView, a3);
}

- (BOOL)disallowOptionKey
{
  return self->_disallowOptionKey;
}

- (void)setDisallowOptionKey:(BOOL)a3
{
  self->_disallowOptionKey = a3;
}

- (BOOL)didSendReset
{
  return self->_didSendReset;
}

- (void)setDidSendReset:(BOOL)a3
{
  self->_didSendReset = a3;
}

- (double)previousTimestamp
{
  return self->_previousTimestamp;
}

- (void)setPreviousTimestamp:(double)a3
{
  self->_previousTimestamp = a3;
}

- (CGPoint)previousPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_previousPosition.x;
  y = self->_previousPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPreviousPosition:(CGPoint)a3
{
  self->_previousPosition = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_canvasView);
}

@end
