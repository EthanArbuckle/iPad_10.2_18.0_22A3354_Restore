@implementation CRLiOSCanvasZoomPinchGestureRecognizer

- (void)reset
{
  objc_super v3;

  -[CRLiOSCanvasZoomPinchGestureRecognizer p_stopCancellationTimer](self, "p_stopCancellationTimer");
  self->_zoomTimedOut = 0;
  v3.receiver = self;
  v3.super_class = (Class)CRLiOSCanvasZoomPinchGestureRecognizer;
  -[CRLiOSCanvasZoomPinchGestureRecognizer reset](&v3, "reset");
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  if (!self->_zoomTimedOut)
  {
    v5.receiver = self;
    v5.super_class = (Class)CRLiOSCanvasZoomPinchGestureRecognizer;
    -[CRLiOSCanvasZoomPinchGestureRecognizer touchesBegan:withEvent:](&v5, "touchesBegan:withEvent:", a3, a4);
    if (-[CRLiOSCanvasZoomPinchGestureRecognizer numberOfTouches](self, "numberOfTouches") == (id)1)
      -[CRLiOSCanvasZoomPinchGestureRecognizer p_startCancellationTimer](self, "p_startCancellationTimer");
    else
      -[CRLiOSCanvasZoomPinchGestureRecognizer p_stopCancellationTimer](self, "p_stopCancellationTimer");
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  objc_super v4;

  if (!self->_zoomTimedOut)
  {
    v4.receiver = self;
    v4.super_class = (Class)CRLiOSCanvasZoomPinchGestureRecognizer;
    -[CRLiOSCanvasZoomPinchGestureRecognizer touchesMoved:withEvent:](&v4, "touchesMoved:withEvent:", a3, a4);
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLiOSCanvasZoomPinchGestureRecognizer;
  -[CRLiOSCanvasZoomPinchGestureRecognizer touchesEnded:withEvent:](&v5, "touchesEnded:withEvent:", a3, a4);
  -[CRLiOSCanvasZoomPinchGestureRecognizer p_stopCancellationTimer](self, "p_stopCancellationTimer");
  if (self->_zoomTimedOut)
    -[CRLiOSCanvasZoomPinchGestureRecognizer setState:](self, "setState:", 5);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLiOSCanvasZoomPinchGestureRecognizer;
  -[CRLiOSCanvasZoomPinchGestureRecognizer touchesCancelled:withEvent:](&v5, "touchesCancelled:withEvent:", a3, a4);
  -[CRLiOSCanvasZoomPinchGestureRecognizer p_stopCancellationTimer](self, "p_stopCancellationTimer");
  if (self->_zoomTimedOut)
    -[CRLiOSCanvasZoomPinchGestureRecognizer setState:](self, "setState:", 5);
}

- (void)p_startCancellationTimer
{
  -[CRLiOSCanvasZoomPinchGestureRecognizer performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "p_cancelAfterDelay", 0, 0.2);
}

- (void)p_stopCancellationTimer
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "p_cancelAfterDelay", 0);
}

- (void)p_cancelAfterDelay
{
  self->_zoomTimedOut = 1;
}

@end
