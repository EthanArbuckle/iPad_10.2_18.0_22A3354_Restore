@implementation TUAnimationPointFunction

- (TUAnimationPointFunction)initWithTimingFunction:(id)a3 startRect:(CGPoint)a4 endRect:(CGPoint)a5 speed:(double)a6
{
  CGFloat y;
  CGFloat x;
  CGFloat v9;
  CGFloat v10;
  id v12;
  TUAnimationPointFunction *v13;
  CAMediaTimingFunction *v14;
  CAMediaTimingFunction *timingFunction;
  objc_super v17;

  y = a5.y;
  x = a5.x;
  v9 = a4.y;
  v10 = a4.x;
  v12 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TUAnimationPointFunction;
  v13 = -[TUAnimationPointFunction init](&v17, sel_init);
  if (v13)
  {
    if (v12)
    {
      v14 = (CAMediaTimingFunction *)v12;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3038]);
      v14 = (CAMediaTimingFunction *)objc_claimAutoreleasedReturnValue();
    }
    timingFunction = v13->_timingFunction;
    v13->_timingFunction = v14;

    v13->_startValue.x = v10;
    v13->_startValue.y = v9;
    v13->_endValue.x = x;
    v13->_endValue.y = y;
    v13->_speed = a6;
    -[TUAnimationPointFunction _reloadFunctions](v13, "_reloadFunctions");
  }

  return v13;
}

- (CGPoint)solveForTime:(double)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  -[TUAnimationPointFunction xFunction](self, "xFunction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "solveForTime:", a3);
  v7 = v6;
  -[TUAnimationPointFunction yFunction](self, "yFunction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "solveForTime:", a3);
  v10 = v9;

  v11 = v7;
  v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (void)setStartValue:(CGPoint)a3
{
  self->_startValue = a3;
  -[TUAnimationPointFunction _reloadFunctions](self, "_reloadFunctions");
}

- (void)setEndValue:(CGPoint)a3
{
  self->_endValue = a3;
  -[TUAnimationPointFunction _reloadFunctions](self, "_reloadFunctions");
}

- (void)_reloadFunctions
{
  void (**v3)(_QWORD, double, double);
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__TUAnimationPointFunction__reloadFunctions__block_invoke;
  aBlock[3] = &unk_1E6309518;
  aBlock[4] = self;
  v3 = (void (**)(_QWORD, double, double))_Block_copy(aBlock);
  -[TUAnimationPointFunction startValue](self, "startValue");
  v5 = v4;
  -[TUAnimationPointFunction endValue](self, "endValue");
  v3[2](v3, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUAnimationPointFunction setXFunction:](self, "setXFunction:", v7);

  -[TUAnimationPointFunction startValue](self, "startValue");
  v9 = v8;
  -[TUAnimationPointFunction endValue](self, "endValue");
  ((void (*)(void (**)(_QWORD, double, double), double))v3[2])(v3, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUAnimationPointFunction setYFunction:](self, "setYFunction:", v10);

}

TUAnimationFloatFunction *__44__TUAnimationPointFunction__reloadFunctions__block_invoke(uint64_t a1, double a2, double a3)
{
  TUAnimationFloatFunction *v6;
  void *v7;
  double v8;
  TUAnimationFloatFunction *v9;

  v6 = [TUAnimationFloatFunction alloc];
  objc_msgSend(*(id *)(a1 + 32), "timingFunction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "speed");
  v9 = -[TUAnimationFloatFunction initWithTimingFunction:startValue:endValue:speed:](v6, "initWithTimingFunction:startValue:endValue:speed:", v7, a2, a3, v8);

  return v9;
}

- (CAMediaTimingFunction)timingFunction
{
  return self->_timingFunction;
}

- (void)setTimingFunction:(id)a3
{
  objc_storeStrong((id *)&self->_timingFunction, a3);
}

- (CGPoint)startValue
{
  double x;
  double y;
  CGPoint result;

  x = self->_startValue.x;
  y = self->_startValue.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)endValue
{
  double x;
  double y;
  CGPoint result;

  x = self->_endValue.x;
  y = self->_endValue.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)speed
{
  return self->_speed;
}

- (void)setSpeed:(double)a3
{
  self->_speed = a3;
}

- (TUAnimationFloatFunction)xFunction
{
  return self->_xFunction;
}

- (void)setXFunction:(id)a3
{
  objc_storeStrong((id *)&self->_xFunction, a3);
}

- (TUAnimationFloatFunction)yFunction
{
  return self->_yFunction;
}

- (void)setYFunction:(id)a3
{
  objc_storeStrong((id *)&self->_yFunction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_yFunction, 0);
  objc_storeStrong((id *)&self->_xFunction, 0);
  objc_storeStrong((id *)&self->_timingFunction, 0);
}

@end
