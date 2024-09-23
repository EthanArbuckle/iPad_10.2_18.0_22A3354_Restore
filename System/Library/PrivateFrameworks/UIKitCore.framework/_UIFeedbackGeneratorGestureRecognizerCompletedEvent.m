@implementation _UIFeedbackGeneratorGestureRecognizerCompletedEvent

+ (id)completedEventFromEvent:(id)a3 inView:(id)a4
{
  id v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init((Class)a1);
  v9 = v8;
  if (v7)
    v10 = v7[10];
  else
    v10 = 0;
  v8[1] = v10;
  objc_msgSend(v7, "locationInView:", v6);
  v12 = v11;
  v14 = v13;

  v9[2] = v12;
  v9[3] = v14;
  return v9;
}

- (CGPoint)locationInView:(id)a3
{
  double x;
  double y;
  CGPoint result;

  x = self->_locationInView.x;
  y = self->_locationInView.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)locationInView
{
  double x;
  double y;
  CGPoint result;

  x = self->_locationInView.x;
  y = self->_locationInView.y;
  result.y = y;
  result.x = x;
  return result;
}

@end
