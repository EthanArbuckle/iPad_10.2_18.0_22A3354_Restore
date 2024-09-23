@implementation _ACTKeyboardTouchState

- (TIKeyboardTouchEvent)lastTouchEvent
{
  return self->_lastTouchEvent;
}

- (void)setLastTouchEvent:(id)a3
{
  objc_storeStrong((id *)&self->_lastTouchEvent, a3);
}

- (CGPoint)initialDragPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_initialDragPoint.x;
  y = self->_initialDragPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInitialDragPoint:(CGPoint)a3
{
  self->_initialDragPoint = a3;
}

- (BOOL)dragged
{
  return self->_dragged;
}

- (void)setDragged:(BOOL)a3
{
  self->_dragged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastTouchEvent, 0);
}

@end
