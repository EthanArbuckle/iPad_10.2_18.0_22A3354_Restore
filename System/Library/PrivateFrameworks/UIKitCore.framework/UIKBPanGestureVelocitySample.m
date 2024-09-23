@implementation UIKBPanGestureVelocitySample

- (void)pullValuesFrom:(id)a3
{
  id v4;
  double v5;
  double v6;

  v4 = a3;
  objc_msgSend(v4, "start");
  -[UIKBPanGestureVelocitySample setStart:](self, "setStart:");
  objc_msgSend(v4, "end");
  -[UIKBPanGestureVelocitySample setEnd:](self, "setEnd:");
  objc_msgSend(v4, "dt");
  -[UIKBPanGestureVelocitySample setDt:](self, "setDt:");
  objc_msgSend(v4, "force");
  -[UIKBPanGestureVelocitySample setForce:](self, "setForce:");
  objc_msgSend(v4, "majorRadius");
  v6 = v5;

  -[UIKBPanGestureVelocitySample setMajorRadius:](self, "setMajorRadius:", v6);
}

- (void)resetValues
{
  double v3;
  double v4;

  v3 = *MEMORY[0x1E0C9D538];
  v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[UIKBPanGestureVelocitySample setStart:](self, "setStart:", *MEMORY[0x1E0C9D538], v4);
  -[UIKBPanGestureVelocitySample setEnd:](self, "setEnd:", v3, v4);
  -[UIKBPanGestureVelocitySample setDt:](self, "setDt:", 0.0);
  -[UIKBPanGestureVelocitySample setForce:](self, "setForce:", 0.0);
  -[UIKBPanGestureVelocitySample setMajorRadius:](self, "setMajorRadius:", 0.0);
}

- (CGPoint)start
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->start, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setStart:(CGPoint)a3
{
  CGPoint v3;

  v3 = a3;
  objc_copyStruct(&self->start, &v3, 16, 1, 0);
}

- (CGPoint)end
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->end, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setEnd:(CGPoint)a3
{
  CGPoint v3;

  v3 = a3;
  objc_copyStruct(&self->end, &v3, 16, 1, 0);
}

- (double)dt
{
  return self->dt;
}

- (void)setDt:(double)a3
{
  self->dt = a3;
}

- (double)force
{
  return self->force;
}

- (void)setForce:(double)a3
{
  self->force = a3;
}

- (double)majorRadius
{
  return self->majorRadius;
}

- (void)setMajorRadius:(double)a3
{
  self->majorRadius = a3;
}

@end
