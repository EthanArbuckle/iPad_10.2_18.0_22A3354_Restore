@implementation TUAnimationRectFunction

- (TUAnimationRectFunction)initWithTimingFunction:(id)a3 startRect:(CGRect)a4 endRect:(CGRect)a5 speed:(double)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  id v15;
  TUAnimationRectFunction *v16;
  CAMediaTimingFunction *v17;
  CAMediaTimingFunction *timingFunction;
  objc_super v20;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v10 = a4.size.height;
  v11 = a4.size.width;
  v12 = a4.origin.y;
  v13 = a4.origin.x;
  v15 = a3;
  v20.receiver = self;
  v20.super_class = (Class)TUAnimationRectFunction;
  v16 = -[TUAnimationRectFunction init](&v20, sel_init);
  if (v16)
  {
    if (v15)
    {
      v17 = (CAMediaTimingFunction *)v15;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3038]);
      v17 = (CAMediaTimingFunction *)objc_claimAutoreleasedReturnValue();
    }
    timingFunction = v16->_timingFunction;
    v16->_timingFunction = v17;

    v16->_startValue.origin.x = v13;
    v16->_startValue.origin.y = v12;
    v16->_startValue.size.width = v11;
    v16->_startValue.size.height = v10;
    v16->_endValue.origin.x = x;
    v16->_endValue.origin.y = y;
    v16->_endValue.size.width = width;
    v16->_endValue.size.height = height;
    v16->_speed = a6;
    -[TUAnimationRectFunction _reloadFunctions](v16, "_reloadFunctions");
  }

  return v16;
}

- (CGRect)solveForTime:(double)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  -[TUAnimationRectFunction originFunction](self, "originFunction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "solveForTime:", a3);
  v7 = v6;
  v9 = v8;
  -[TUAnimationRectFunction sizeFunction](self, "sizeFunction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "solveForTime:", a3);
  v12 = v11;
  v14 = v13;

  v15 = v7;
  v16 = v9;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void)setStartValue:(CGRect)a3
{
  self->_startValue = a3;
  -[TUAnimationRectFunction _reloadFunctions](self, "_reloadFunctions");
}

- (void)setEndValue:(CGRect)a3
{
  self->_endValue = a3;
  -[TUAnimationRectFunction _reloadFunctions](self, "_reloadFunctions");
}

- (void)_reloadFunctions
{
  TUAnimationPointFunction *v3;
  TUAnimationSizeFunction *v4;

  v3 = -[TUAnimationPointFunction initWithTimingFunction:startRect:endRect:speed:]([TUAnimationPointFunction alloc], "initWithTimingFunction:startRect:endRect:speed:", self->_timingFunction, self->_startValue.origin.x, self->_startValue.origin.y, self->_endValue.origin.x, self->_endValue.origin.y, self->_speed);
  -[TUAnimationRectFunction setOriginFunction:](self, "setOriginFunction:", v3);

  v4 = -[TUAnimationSizeFunction initWithTimingFunction:startRect:endRect:speed:]([TUAnimationSizeFunction alloc], "initWithTimingFunction:startRect:endRect:speed:", self->_timingFunction, self->_startValue.size.width, self->_startValue.size.height, self->_endValue.size.width, self->_endValue.size.height, self->_speed);
  -[TUAnimationRectFunction setSizeFunction:](self, "setSizeFunction:", v4);

}

- (CAMediaTimingFunction)timingFunction
{
  return self->_timingFunction;
}

- (void)setTimingFunction:(id)a3
{
  objc_storeStrong((id *)&self->_timingFunction, a3);
}

- (CGRect)startValue
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_startValue.origin.x;
  y = self->_startValue.origin.y;
  width = self->_startValue.size.width;
  height = self->_startValue.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)endValue
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_endValue.origin.x;
  y = self->_endValue.origin.y;
  width = self->_endValue.size.width;
  height = self->_endValue.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
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

- (TUAnimationPointFunction)originFunction
{
  return self->_originFunction;
}

- (void)setOriginFunction:(id)a3
{
  objc_storeStrong((id *)&self->_originFunction, a3);
}

- (TUAnimationSizeFunction)sizeFunction
{
  return self->_sizeFunction;
}

- (void)setSizeFunction:(id)a3
{
  objc_storeStrong((id *)&self->_sizeFunction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeFunction, 0);
  objc_storeStrong((id *)&self->_originFunction, 0);
  objc_storeStrong((id *)&self->_timingFunction, 0);
}

@end
