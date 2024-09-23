@implementation _PXCustomTimingFunctionAnimationFactory

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", a4);
}

- (id)_timingFunctionForAnimationInView:(id)a3 withKeyPath:(id)a4
{
  return self->_timingFunction;
}

- (CAMediaTimingFunction)timingFunction
{
  return self->_timingFunction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timingFunction, 0);
}

+ (id)factoryWithTimingFunction:(id)a3
{
  id v5;
  _QWORD *v6;
  void *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXStoryScrubberContentLayout.m"), 1337, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("timingFunction"));

  }
  v6 = objc_alloc_init((Class)a1);
  v7 = (void *)v6[1];
  v6[1] = v5;

  return v6;
}

@end
