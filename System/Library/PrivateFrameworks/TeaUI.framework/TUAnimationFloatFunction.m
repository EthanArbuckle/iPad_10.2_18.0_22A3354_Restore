@implementation TUAnimationFloatFunction

- (TUAnimationFloatFunction)init
{
  TUAnimationFloatFunction *v2;
  uint64_t v3;
  CAMediaTimingFunction *timingFunction;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUAnimationFloatFunction;
  v2 = -[TUAnimationFloatFunction init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3038]);
    v3 = objc_claimAutoreleasedReturnValue();
    timingFunction = v2->_timingFunction;
    v2->_timingFunction = (CAMediaTimingFunction *)v3;

    v2->_speed = 1.0;
  }
  return v2;
}

- (TUAnimationFloatFunction)initWithTimingFunction:(id)a3 startValue:(double)a4 endValue:(double)a5 speed:(double)a6
{
  id v10;
  TUAnimationFloatFunction *v11;
  CAMediaTimingFunction *v12;
  CAMediaTimingFunction *timingFunction;
  objc_super v15;

  v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TUAnimationFloatFunction;
  v11 = -[TUAnimationFloatFunction init](&v15, sel_init);
  if (v11)
  {
    if (v10)
    {
      v12 = (CAMediaTimingFunction *)v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3038]);
      v12 = (CAMediaTimingFunction *)objc_claimAutoreleasedReturnValue();
    }
    timingFunction = v11->_timingFunction;
    v11->_timingFunction = v12;

    v11->_startValue = a4;
    v11->_endValue = a5;
    v11->_speed = a6;
  }

  return v11;
}

- (double)solveForTime:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  float v15;
  double v16;

  -[TUAnimationFloatFunction startValue](self, "startValue");
  v6 = v5;
  -[TUAnimationFloatFunction endValue](self, "endValue");
  v8 = v7;
  -[TUAnimationFloatFunction startValue](self, "startValue");
  v10 = v9;
  -[TUAnimationFloatFunction timingFunction](self, "timingFunction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUAnimationFloatFunction speed](self, "speed");
  v13 = v12 * a3;
  v14 = 0.0;
  if (v13 >= 0.0)
  {
    v14 = v13;
    if (v13 > 1.0)
      v14 = 1.0;
  }
  *(float *)&v14 = v14;
  objc_msgSend(v11, "_solveForInput:", v14);
  v16 = v6 + (v8 - v10) * v15;

  return v16;
}

- (CAMediaTimingFunction)timingFunction
{
  return self->_timingFunction;
}

- (void)setTimingFunction:(id)a3
{
  objc_storeStrong((id *)&self->_timingFunction, a3);
}

- (double)startValue
{
  return self->_startValue;
}

- (void)setStartValue:(double)a3
{
  self->_startValue = a3;
}

- (double)endValue
{
  return self->_endValue;
}

- (void)setEndValue:(double)a3
{
  self->_endValue = a3;
}

- (double)speed
{
  return self->_speed;
}

- (void)setSpeed:(double)a3
{
  self->_speed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timingFunction, 0);
}

@end
