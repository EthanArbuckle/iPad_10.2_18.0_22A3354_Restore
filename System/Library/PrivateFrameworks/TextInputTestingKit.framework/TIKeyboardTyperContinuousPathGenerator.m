@implementation TIKeyboardTyperContinuousPathGenerator

- (TIKeyboardTyperContinuousPathGenerator)initWithVelocity:(double)a3 timestamp:(double)a4 dt:(double)a5 stallDuration:(double)a6
{
  TIKeyboardTyperContinuousPathGenerator *v9;
  NSMutableArray *v10;
  NSMutableArray *targets;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TIKeyboardTyperContinuousPathGenerator;
  v9 = -[TIKeyboardTyperContinuousPathGenerator init](&v13, sel_init, a3, a4);
  if (v9)
  {
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    targets = v9->_targets;
    v9->_targets = v10;

    v9->_velocity = a3;
    v9->_dt = a5;
    v9->_stallDuration = a6;
  }
  return v9;
}

- (void)addTargetPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  NSMutableArray *targets;
  void *v7;

  y = a3.y;
  x = a3.x;
  targets = self->_targets;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](targets, "addObject:", v7);

  if (-[NSMutableArray count](self->_targets, "count") == 1)
  {
    self->_currentPoint.x = x;
    self->_currentPoint.y = y;
  }
}

- (BOOL)isDone
{
  return -[NSMutableArray count](self->_targets, "count") == 0;
}

- (void)step
{
  unint64_t i;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double y;
  double x;
  double v16;
  double v17;
  double v18;
  double dt;
  double v20;
  double v21;

  for (i = 0; -[NSMutableArray count](self->_targets, "count"); ++i)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_targets, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "CGPointValue");
    v6 = v5;
    v8 = v7;

    if (hypot(v6 - self->_currentPoint.x, v8 - self->_currentPoint.y) >= 1.0e-10)
      break;
    -[NSMutableArray removeObjectAtIndex:](self->_targets, "removeObjectAtIndex:", 0);
  }
  if (-[NSMutableArray count](self->_targets, "count"))
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_targets, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "CGPointValue");
    v11 = v10;
    v13 = v12;

    x = self->_currentPoint.x;
    y = self->_currentPoint.y;
    v16 = v11 - x;
    v17 = v13 - y;
    v18 = hypot(v16, v13 - y);
    dt = self->_dt;
    v20 = dt * self->_velocity;
    if (v18 > v20)
    {
      v21 = v20 / v18;
      v16 = v16 * v21;
      v17 = v17 * v21;
    }
  }
  else
  {
    v16 = *MEMORY[0x24BDBEFB0];
    v17 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    x = self->_currentPoint.x;
    y = self->_currentPoint.y;
    dt = self->_dt;
  }
  self->_currentPoint.x = v16 + x;
  self->_currentPoint.y = v17 + y;
  self->_currentTimestamp = self->_currentTimestamp + dt + self->_stallDuration * (double)i;
}

- (CGPoint)currentPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_currentPoint.x;
  y = self->_currentPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)currentTimestamp
{
  return self->_currentTimestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targets, 0);
}

@end
