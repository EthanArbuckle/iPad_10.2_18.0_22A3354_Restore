@implementation SBFSteppedAnimationTimingFunctionCalculator

- (SBFSteppedAnimationTimingFunctionCalculator)init
{
  SBFSteppedAnimationTimingFunctionCalculator *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *functionsByName;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBFSteppedAnimationTimingFunctionCalculator;
  v2 = -[SBFSteppedAnimationTimingFunctionCalculator init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    functionsByName = v2->_functionsByName;
    v2->_functionsByName = v3;

  }
  return v2;
}

- (void)addTimingFunction:(id)a3 withName:(id)a4
{
  -[SBFSteppedAnimationTimingFunctionCalculator addTimingFunction:withName:constrainedToIntervalBetween:and:](self, "addTimingFunction:withName:constrainedToIntervalBetween:and:", a3, a4, 0.0, 1.0);
}

- (void)addTimingFunction:(id)a3 withName:(id)a4 constrainedToIntervalBetween:(double)a5 and:(double)a6
{
  id v10;
  id v11;

  v10 = a4;
  +[_SBSteppedAnimationTimingFunction timingFunctionWithTimingFunction:constrainedToIntervalBetween:and:](_SBSteppedAnimationTimingFunction, "timingFunctionWithTimingFunction:constrainedToIntervalBetween:and:", a3, a5, a6);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](self->_functionsByName, "setObject:forKey:", v11, v10);

}

- (void)addTimingFunctionWithName:(id)a3 fromNormalizedAnimationSettings:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "timingFunction");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "delay");
  v9 = v8;
  objc_msgSend(v6, "duration");
  v11 = v10;

  -[SBFSteppedAnimationTimingFunctionCalculator addTimingFunction:withName:constrainedToIntervalBetween:and:](self, "addTimingFunction:withName:constrainedToIntervalBetween:and:", v12, v7, v9, v11);
}

- (id)timingFunctionNames
{
  return (id)-[NSMutableDictionary allKeys](self->_functionsByName, "allKeys");
}

- (double)valueForFunctionWithName:(id)a3
{
  void *v4;
  double v5;
  double v6;

  -[NSMutableDictionary objectForKey:](self->_functionsByName, "objectForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueAtPercentage:", self->_percentComplete);
  v6 = v5;

  return v6;
}

- (void)setPercentComplete:(double)a3
{
  self->_percentComplete = fmin(fmax(a3, 0.0), 1.0);
}

- (double)percentComplete
{
  return self->_percentComplete;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_functionsByName, 0);
}

@end
