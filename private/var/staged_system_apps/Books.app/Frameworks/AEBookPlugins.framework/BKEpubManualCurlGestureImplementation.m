@implementation BKEpubManualCurlGestureImplementation

- (BKEpubManualCurlGestureImplementation)initWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5
{
  double y;
  double x;
  double v8;
  double v9;
  BKEpubManualCurlGestureImplementation *result;
  objc_super v11;

  y = a4.y;
  x = a4.x;
  v8 = a3.y;
  v9 = a3.x;
  v11.receiver = self;
  v11.super_class = (Class)BKEpubManualCurlGestureImplementation;
  result = -[BKEpubManualCurlGestureImplementation init](&v11, "init");
  if (result)
  {
    result->_startPoint.x = v9;
    result->_startPoint.y = v8;
    result->_endPoint.x = x;
    result->_endPoint.y = y;
    result->_duration = a5;
    result->_velocity.x = (x - v9) / a5;
    result->_velocity.y = (y - v8) / a5;
  }
  return result;
}

- (void)setStartTime:(double)a3
{
  double v3;

  v3 = self->_duration + a3;
  self->_startTime = a3;
  self->_endTime = v3;
}

- (CGPoint)startLocationInView:(id)a3
{
  double v3;
  double v4;
  CGPoint result;

  objc_msgSend(a3, "convertPoint:fromView:", 0, self->_startPoint.x, self->_startPoint.y);
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)locationInView:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGPoint result;

  v4 = a3;
  -[BKEpubManualCurlGestureImplementation nextTime](self, "nextTime");
  v6 = v5;
  -[BKEpubManualCurlGestureImplementation startTime](self, "startTime");
  v8 = v6 - v7;
  -[BKEpubManualCurlGestureImplementation duration](self, "duration");
  v10 = v8 / v9;
  -[BKEpubManualCurlGestureImplementation startPoint](self, "startPoint");
  v12 = v11;
  -[BKEpubManualCurlGestureImplementation endPoint](self, "endPoint");
  v14 = v13;
  -[BKEpubManualCurlGestureImplementation startPoint](self, "startPoint");
  v16 = v12 + (v14 - v15) * v10;
  -[BKEpubManualCurlGestureImplementation startPoint](self, "startPoint");
  v18 = v17;
  -[BKEpubManualCurlGestureImplementation endPoint](self, "endPoint");
  v20 = v19;
  -[BKEpubManualCurlGestureImplementation startPoint](self, "startPoint");
  objc_msgSend(v4, "convertPoint:fromView:", 0, v16, v18 + (v20 - v21) * v10);
  v23 = v22;
  v25 = v24;

  v26 = v23;
  v27 = v25;
  result.y = v27;
  result.x = v26;
  return result;
}

- (CGPoint)translationInView:(id)a3
{
  double x;
  double y;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGPoint result;

  x = self->_startPoint.x;
  y = self->_startPoint.y;
  v6 = a3;
  objc_msgSend(v6, "convertPoint:fromView:", 0, x, y);
  v8 = v7;
  v10 = v9;
  -[BKEpubManualCurlGestureImplementation locationInView:](self, "locationInView:", v6);
  v12 = v11;
  v14 = v13;

  v15 = v12 - v8;
  v16 = v14 - v10;
  result.y = v16;
  result.x = v15;
  return result;
}

- (CGPoint)velocityInView:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  v4 = a3;
  -[BKEpubManualCurlGestureImplementation velocity](self, "velocity");
  objc_msgSend(v4, "convertPoint:fromView:", 0);
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (CGPoint)startPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_startPoint.x;
  y = self->_startPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)endPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_endPoint.x;
  y = self->_endPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)duration
{
  return self->_duration;
}

- (double)startTime
{
  return self->_startTime;
}

- (double)endTime
{
  return self->_endTime;
}

- (double)nextTime
{
  return self->_nextTime;
}

- (void)setNextTime:(double)a3
{
  self->_nextTime = a3;
}

- (CGPoint)velocity
{
  double x;
  double y;
  CGPoint result;

  x = self->_velocity.x;
  y = self->_velocity.y;
  result.y = y;
  result.x = x;
  return result;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

@end
