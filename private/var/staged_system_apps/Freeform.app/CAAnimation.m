@implementation CAAnimation

- (float)solveForInput:(float)a3
{
  CAAnimation *v4;
  CAMediaTimingFunction *v5;
  double v6;
  float v7;
  float v8;

  v4 = self;
  v5 = -[CAAnimation timingFunction](v4, "timingFunction");
  if (!v5)
    v5 = (CAMediaTimingFunction *)objc_msgSend((id)objc_opt_self(CAMediaTimingFunction), "functionWithName:", kCAMediaTimingFunctionLinear);
  *(float *)&v6 = a3;
  -[CAMediaTimingFunction _solveForInput:](v5, "_solveForInput:", v6);
  v8 = v7;

  return v8;
}

@end
