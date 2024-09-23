@implementation CRLWPTapAndTouchGestureRecognizer

- (void)p_failBecauseFingerStayedUpTooLongAfterTap
{
  -[CRLWPTapAndTouchGestureRecognizer setState:](self, "setState:", 5);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  double v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  *(_QWORD *)&v9 = objc_opt_class(self, v8).n128_u64[0];
  objc_msgSend(v10, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "p_failBecauseFingerStayedUpTooLongAfterTap", 0, v9);
  v15.receiver = self;
  v15.super_class = (Class)CRLWPTapAndTouchGestureRecognizer;
  -[CRLWPTapAndTouchGestureRecognizer touchesBegan:withEvent:](&v15, "touchesBegan:withEvent:", v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allTouches"));

  v12 = objc_msgSend(v11, "count");
  if ((unint64_t)v12 < 2)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "anyObject"));
    -[CRLWPTapAndTouchGestureRecognizer setInputType:](self, "setInputType:", sub_10033831C((_BOOL8)objc_msgSend(v13, "type")));
    if ((unint64_t)objc_msgSend(v13, "tapCount") >= self->_numberOfTapsRequired + 1)
    {
      if (objc_msgSend(v13, "tapCount") == (id)(self->_numberOfTapsRequired + 1))
        v14 = 1;
      else
        v14 = 5;
      -[CRLWPTapAndTouchGestureRecognizer setState:](self, "setState:", v14);
    }

  }
  else
  {
    -[CRLWPTapAndTouchGestureRecognizer setState:](self, "setState:", 5);
  }

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLWPTapAndTouchGestureRecognizer;
  -[CRLWPTapAndTouchGestureRecognizer touchesMoved:withEvent:](&v6, "touchesMoved:withEvent:", a3, a4);
  if (-[CRLWPTapAndTouchGestureRecognizer state](self, "state") == (id)1
    || -[CRLWPTapAndTouchGestureRecognizer state](self, "state") == (id)2)
  {
    v5 = 2;
  }
  else if (-[CRLWPTapAndTouchGestureRecognizer state](self, "state"))
  {
    v5 = 4;
  }
  else
  {
    v5 = 5;
  }
  -[CRLWPTapAndTouchGestureRecognizer setState:](self, "setState:", v5);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  CRLWPTapAndTouchGestureRecognizer *v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRLWPTapAndTouchGestureRecognizer;
  -[CRLWPTapAndTouchGestureRecognizer touchesEnded:withEvent:](&v7, "touchesEnded:withEvent:", a3, a4);
  if (-[CRLWPTapAndTouchGestureRecognizer state](self, "state") == (id)1
    || -[CRLWPTapAndTouchGestureRecognizer state](self, "state") == (id)2)
  {
    v5 = self;
    v6 = 3;
LABEL_4:
    -[CRLWPTapAndTouchGestureRecognizer setState:](v5, "setState:", v6);
    return;
  }
  if (-[CRLWPTapAndTouchGestureRecognizer state](self, "state"))
  {
    v5 = self;
    v6 = 4;
    goto LABEL_4;
  }
  -[CRLWPTapAndTouchGestureRecognizer setState:](self, "setState:", 0);
  -[CRLWPTapAndTouchGestureRecognizer performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "p_failBecauseFingerStayedUpTooLongAfterTap", 0, 0.400000006);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLWPTapAndTouchGestureRecognizer;
  -[CRLWPTapAndTouchGestureRecognizer touchesCancelled:withEvent:](&v5, "touchesCancelled:withEvent:", a3, a4);
  -[CRLWPTapAndTouchGestureRecognizer setState:](self, "setState:", 4);
}

- (void)reset
{
  double v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  objc_super v14;

  *(_QWORD *)&v3 = objc_opt_class(self, a2).n128_u64[0];
  objc_msgSend(v4, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "p_failBecauseFingerStayedUpTooLongAfterTap", 0, v3);
  v14.receiver = self;
  v14.super_class = (Class)CRLWPTapAndTouchGestureRecognizer;
  -[CRLWPTapAndTouchGestureRecognizer reset](&v14, "reset");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTapAndTouchGestureRecognizer delegate](self, "delegate"));
  v12 = sub_100221DDC(v5, 1, v6, v7, v8, v9, v10, v11, (uint64_t)&OBJC_PROTOCOL___CRLGestureDelegate);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  objc_msgSend(v13, "didReset:", self);
}

- (int64_t)inputType
{
  return self->_inputType;
}

- (void)setInputType:(int64_t)a3
{
  self->_inputType = a3;
}

- (unint64_t)numberOfTapsRequired
{
  return self->_numberOfTapsRequired;
}

- (void)setNumberOfTapsRequired:(unint64_t)a3
{
  self->_numberOfTapsRequired = a3;
}

@end
