@implementation _SBSteppedAnimationTimingFunction

+ (id)timingFunctionWithTimingFunction:(id)a3 constrainedToIntervalBetween:(double)a4 and:(double)a5
{
  id v8;
  void *v9;

  v8 = a3;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTimingFunction:constrainedToIntervalBetween:and:", v8, a4, a5);

  return v9;
}

- (_SBSteppedAnimationTimingFunction)initWithTimingFunction:(id)a3 constrainedToIntervalBetween:(double)a4 and:(double)a5
{
  id v10;
  _SBSteppedAnimationTimingFunction *v11;
  _SBSteppedAnimationTimingFunction *v12;
  void *v14;
  objc_super v15;

  v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_SBSteppedAnimationTimingFunction;
  v11 = -[_SBSteppedAnimationTimingFunction init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_timingFunction, a3);
    if (a4 >= a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("SBFSteppedAnimationTimingFunctionCalculator.m"), 91, CFSTR("Invalid timing interval for function (%f, %f)"), *(_QWORD *)&a4, *(_QWORD *)&a5);

    }
    v12->_constrainedRange.start = fmin(fmax(a4, 0.0), 1.0);
    v12->_constrainedRange.duration = fmin(fmax(a5, 0.0), 1.0) - a4;
  }

  return v12;
}

- (double)valueAtPercentage:(double)a3
{
  CAMediaTimingFunction *timingFunction;
  double start;
  float v6;
  double duration;
  float v8;

  timingFunction = self->_timingFunction;
  start = self->_constrainedRange.start;
  v6 = 0.0;
  if (start <= a3)
  {
    duration = self->_constrainedRange.duration;
    v6 = 1.0;
    if (start + duration >= a3)
    {
      a3 = (fmin(fmax(a3, 0.0), 1.0) - start) / duration;
      v6 = a3;
    }
  }
  *(float *)&a3 = v6;
  -[CAMediaTimingFunction _solveForInput:](timingFunction, "_solveForInput:", a3);
  return v8;
}

- (CAMediaTimingFunction)timingFunction
{
  return self->_timingFunction;
}

- (SBNormalizedTransitionInterval)constrainedRange
{
  double start;
  double duration;
  SBNormalizedTransitionInterval result;

  start = self->_constrainedRange.start;
  duration = self->_constrainedRange.duration;
  result.duration = duration;
  result.start = start;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timingFunction, 0);
}

@end
