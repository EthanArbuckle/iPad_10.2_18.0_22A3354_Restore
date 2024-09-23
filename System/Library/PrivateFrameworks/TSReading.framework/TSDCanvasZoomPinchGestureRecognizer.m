@implementation TSDCanvasZoomPinchGestureRecognizer

- (void)reset
{
  objc_super v3;

  -[TSDCanvasZoomPinchGestureRecognizer p_stopCancellationTimer](self, "p_stopCancellationTimer");
  self->mZoomTimedOut = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSDCanvasZoomPinchGestureRecognizer;
  -[TSDCanvasZoomPinchGestureRecognizer reset](&v3, sel_reset);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  if (!self->mZoomTimedOut)
  {
    v5.receiver = self;
    v5.super_class = (Class)TSDCanvasZoomPinchGestureRecognizer;
    -[TSDCanvasZoomPinchGestureRecognizer touchesBegan:withEvent:](&v5, sel_touchesBegan_withEvent_, a3, a4);
    if (-[TSDCanvasZoomPinchGestureRecognizer numberOfTouches](self, "numberOfTouches") == 1)
      -[TSDCanvasZoomPinchGestureRecognizer p_startCancellationTimer](self, "p_startCancellationTimer");
    else
      -[TSDCanvasZoomPinchGestureRecognizer p_stopCancellationTimer](self, "p_stopCancellationTimer");
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  objc_super v4;

  if (!self->mZoomTimedOut)
  {
    v4.receiver = self;
    v4.super_class = (Class)TSDCanvasZoomPinchGestureRecognizer;
    -[TSDCanvasZoomPinchGestureRecognizer touchesMoved:withEvent:](&v4, sel_touchesMoved_withEvent_, a3, a4);
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDCanvasZoomPinchGestureRecognizer;
  -[TSDCanvasZoomPinchGestureRecognizer touchesEnded:withEvent:](&v5, sel_touchesEnded_withEvent_, a3, a4);
  -[TSDCanvasZoomPinchGestureRecognizer p_stopCancellationTimer](self, "p_stopCancellationTimer");
  if (self->mZoomTimedOut)
    -[TSDCanvasZoomPinchGestureRecognizer setState:](self, "setState:", 5);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDCanvasZoomPinchGestureRecognizer;
  -[TSDCanvasZoomPinchGestureRecognizer touchesCancelled:withEvent:](&v5, sel_touchesCancelled_withEvent_, a3, a4);
  -[TSDCanvasZoomPinchGestureRecognizer p_stopCancellationTimer](self, "p_stopCancellationTimer");
  if (self->mZoomTimedOut)
    -[TSDCanvasZoomPinchGestureRecognizer setState:](self, "setState:", 5);
}

- (void)p_startCancellationTimer
{
  -[TSDCanvasZoomPinchGestureRecognizer performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_p_cancelAfterDelay, 0, 0.2);
}

- (void)p_stopCancellationTimer
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_p_cancelAfterDelay, 0);
}

- (void)p_cancelAfterDelay
{
  self->mZoomTimedOut = 1;
}

@end
