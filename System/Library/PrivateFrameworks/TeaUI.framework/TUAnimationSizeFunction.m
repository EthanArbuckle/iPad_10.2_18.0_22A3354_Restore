@implementation TUAnimationSizeFunction

- (TUAnimationSizeFunction)initWithTimingFunction:(id)a3 startRect:(CGSize)a4 endRect:(CGSize)a5 speed:(double)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat v9;
  CGFloat v10;
  id v12;
  TUAnimationSizeFunction *v13;
  CAMediaTimingFunction *v14;
  CAMediaTimingFunction *timingFunction;
  objc_super v17;

  height = a5.height;
  width = a5.width;
  v9 = a4.height;
  v10 = a4.width;
  v12 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TUAnimationSizeFunction;
  v13 = -[TUAnimationSizeFunction init](&v17, sel_init);
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

    v13->_startValue.width = v10;
    v13->_startValue.height = v9;
    v13->_endValue.width = width;
    v13->_endValue.height = height;
    v13->_speed = a6;
    -[TUAnimationSizeFunction _reloadFunctions](v13, "_reloadFunctions");
  }

  return v13;
}

- (CGSize)solveForTime:(double)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  -[TUAnimationSizeFunction widthFunction](self, "widthFunction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "solveForTime:", a3);
  v7 = v6;
  -[TUAnimationSizeFunction heightFunction](self, "heightFunction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "solveForTime:", a3);
  v10 = v9;

  v11 = v7;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)setStartValue:(CGSize)a3
{
  self->_startValue = a3;
  -[TUAnimationSizeFunction _reloadFunctions](self, "_reloadFunctions");
}

- (void)setEndValue:(CGSize)a3
{
  self->_endValue = a3;
  -[TUAnimationSizeFunction _reloadFunctions](self, "_reloadFunctions");
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
  aBlock[2] = __43__TUAnimationSizeFunction__reloadFunctions__block_invoke;
  aBlock[3] = &unk_1E6309518;
  aBlock[4] = self;
  v3 = (void (**)(_QWORD, double, double))_Block_copy(aBlock);
  -[TUAnimationSizeFunction startValue](self, "startValue");
  v5 = v4;
  -[TUAnimationSizeFunction endValue](self, "endValue");
  v3[2](v3, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUAnimationSizeFunction setWidthFunction:](self, "setWidthFunction:", v7);

  -[TUAnimationSizeFunction startValue](self, "startValue");
  v9 = v8;
  -[TUAnimationSizeFunction endValue](self, "endValue");
  ((void (*)(void (**)(_QWORD, double, double), double))v3[2])(v3, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUAnimationSizeFunction setHeightFunction:](self, "setHeightFunction:", v10);

}

TUAnimationFloatFunction *__43__TUAnimationSizeFunction__reloadFunctions__block_invoke(uint64_t a1, double a2, double a3)
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

- (CGSize)startValue
{
  double width;
  double height;
  CGSize result;

  width = self->_startValue.width;
  height = self->_startValue.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)endValue
{
  double width;
  double height;
  CGSize result;

  width = self->_endValue.width;
  height = self->_endValue.height;
  result.height = height;
  result.width = width;
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

- (TUAnimationFloatFunction)widthFunction
{
  return self->_widthFunction;
}

- (void)setWidthFunction:(id)a3
{
  objc_storeStrong((id *)&self->_widthFunction, a3);
}

- (TUAnimationFloatFunction)heightFunction
{
  return self->_heightFunction;
}

- (void)setHeightFunction:(id)a3
{
  objc_storeStrong((id *)&self->_heightFunction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightFunction, 0);
  objc_storeStrong((id *)&self->_widthFunction, 0);
  objc_storeStrong((id *)&self->_timingFunction, 0);
}

@end
