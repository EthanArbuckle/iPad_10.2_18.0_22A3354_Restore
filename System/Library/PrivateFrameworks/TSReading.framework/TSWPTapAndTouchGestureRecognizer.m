@implementation TSWPTapAndTouchGestureRecognizer

- (void)p_failBecauseFingerStayedUpTooLongAfterTap
{
  -[TSWPTapAndTouchGestureRecognizer setState:](self, "setState:", 5);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  void *v7;
  TSWPTapAndTouchGestureRecognizer *v8;
  uint64_t v9;
  objc_super v10;

  objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_p_failBecauseFingerStayedUpTooLongAfterTap, 0);
  v10.receiver = self;
  v10.super_class = (Class)TSWPTapAndTouchGestureRecognizer;
  -[TSWPTapAndTouchGestureRecognizer touchesBegan:withEvent:](&v10, sel_touchesBegan_withEvent_, a3, a4);
  if ((unint64_t)objc_msgSend((id)objc_msgSend(a4, "allTouches"), "count") >= 2)
    goto LABEL_5;
  v7 = (void *)objc_msgSend(a3, "anyObject");
  if (objc_msgSend(v7, "tapCount") < self->_numberOfTapsRequired + 1)
    return;
  if (objc_msgSend(v7, "tapCount") == self->_numberOfTapsRequired + 1)
  {
    v8 = self;
    v9 = 1;
  }
  else
  {
LABEL_5:
    v8 = self;
    v9 = 5;
  }
  -[TSWPTapAndTouchGestureRecognizer setState:](v8, "setState:", v9);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSWPTapAndTouchGestureRecognizer;
  -[TSWPTapAndTouchGestureRecognizer touchesMoved:withEvent:](&v6, sel_touchesMoved_withEvent_, a3, a4);
  if (-[TSWPTapAndTouchGestureRecognizer state](self, "state") == 1
    || -[TSWPTapAndTouchGestureRecognizer state](self, "state") == 2)
  {
    v5 = 2;
  }
  else if (-[TSWPTapAndTouchGestureRecognizer state](self, "state"))
  {
    v5 = 4;
  }
  else
  {
    v5 = 5;
  }
  -[TSWPTapAndTouchGestureRecognizer setState:](self, "setState:", v5);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  TSWPTapAndTouchGestureRecognizer *v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSWPTapAndTouchGestureRecognizer;
  -[TSWPTapAndTouchGestureRecognizer touchesEnded:withEvent:](&v7, sel_touchesEnded_withEvent_, a3, a4);
  if (-[TSWPTapAndTouchGestureRecognizer state](self, "state") == 1
    || -[TSWPTapAndTouchGestureRecognizer state](self, "state") == 2)
  {
    v5 = self;
    v6 = 3;
LABEL_4:
    -[TSWPTapAndTouchGestureRecognizer setState:](v5, "setState:", v6);
    return;
  }
  if (-[TSWPTapAndTouchGestureRecognizer state](self, "state"))
  {
    v5 = self;
    v6 = 4;
    goto LABEL_4;
  }
  -[TSWPTapAndTouchGestureRecognizer setState:](self, "setState:", 0);
  -[TSWPTapAndTouchGestureRecognizer performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_p_failBecauseFingerStayedUpTooLongAfterTap, 0, 0.400000006);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSWPTapAndTouchGestureRecognizer;
  -[TSWPTapAndTouchGestureRecognizer touchesCancelled:withEvent:](&v5, sel_touchesCancelled_withEvent_, a3, a4);
  -[TSWPTapAndTouchGestureRecognizer setState:](self, "setState:", 4);
}

- (void)reset
{
  objc_super v3;

  objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_p_failBecauseFingerStayedUpTooLongAfterTap, 0);
  v3.receiver = self;
  v3.super_class = (Class)TSWPTapAndTouchGestureRecognizer;
  -[TSWPTapAndTouchGestureRecognizer reset](&v3, sel_reset);
  -[TSWPTapAndTouchGestureRecognizer delegate](self, "delegate");
  objc_msgSend((id)TSUProtocolCast(), "didReset:", self);
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
