@implementation _UIDynamicValueAnimation

+ (id)_dynamicValueAnimationMatchingCASpringAnimationWithMass:(double)a3 stiffness:(double)a4 damping:(float)a5 velocity:(float)a6 fromValue:(double)a7 toValue:(double)a8
{
  _UIDynamicValueAnimation *v12;
  id v13;

  v12 = -[_UIDynamicValueAnimation initWithValue:velocity:unitSize:]([_UIDynamicValueAnimation alloc], "initWithValue:velocity:unitSize:", a7, (a8 - a7) * a6, 0.001);
  v13 = +[_UIDynamicAnimationActiveValue activeValue:ofType:](_UIDynamicAnimationActiveValue, "activeValue:ofType:", 0, a8);
  objc_msgSend(v13, "_setBoundaryPull:", a4 / 1000.0 / a3);
  -[_UIDynamicValueAnimation _setDecelerationFactor:](v12, "_setDecelerationFactor:", 1.0 - a5 / a3 * 0.001);
  -[_UIDynamicValueAnimation addActiveValue:](v12, "addActiveValue:", v13);
  return v12;
}

- (_UIDynamicValueAnimation)initWithValue:(double)a3 velocity:(double)a4 unitSize:(double)a5
{
  _UIDynamicValueAnimation *result;
  objc_super v10;

  if (a5 <= 0.0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("unit size must be > 0"));
  v10.receiver = self;
  v10.super_class = (Class)_UIDynamicValueAnimation;
  result = -[_UIDynamicAnimation init](&v10, sel_init);
  if (result)
  {
    result->_value = a3;
    result->_velocity = a4 / 1000.0;
    result->_unitSize = a5;
    result->_friction = 0.08;
    result->_decelerationFactor = 0.998;
    result->_decelerationLnFactor = -0.00200200267;
    result->_multiplier = 1.0;
    result->_stepFunction = _UIDynamicAnimationStepFrictionOnly;
  }
  return result;
}

- (_UIDynamicValueAnimation)init
{
  return -[_UIDynamicValueAnimation initWithValue:velocity:unitSize:](self, "initWithValue:velocity:unitSize:", 0.0, 0.0, 1.0);
}

- (double)settlingDuration
{
  double value;
  double velocity;
  uint64_t v5;
  double v6;
  double v7;
  double result;

  value = self->_value;
  velocity = self->_velocity;
  v5 = -[UIScreen maximumFramesPerSecond](+[UIScreen mainScreen](UIScreen, "mainScreen"), "maximumFramesPerSecond");
  v6 = 0.0;
  if (!_UIDynamicAnimationIsAtRest((uint64_t)self))
  {
    v7 = 1.0 / (double)v5 * 1000.0;
    do
    {
      ((void (*)(_UIDynamicValueAnimation *, uint64_t))self->_stepFunction)(self, (uint64_t)v7);
      v6 = v7 + v6;
    }
    while (!_UIDynamicAnimationIsAtRest((uint64_t)self));
  }
  result = v6 / 1000.0;
  self->_value = value;
  self->_velocity = velocity;
  return result;
}

- (void)dealloc
{
  NSMutableArray *activeValues;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  activeValues = self->_activeValues;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](activeValues, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(activeValues);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "removeObserver:forKeyPath:", self, CFSTR("type"));
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](activeValues, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)_UIDynamicValueAnimation;
  -[_UIDynamicAnimation dealloc](&v8, sel_dealloc);
}

- (void)_stopAnimation
{
  objc_super v3;

  self->_applier = 0;
  self->_viewApplier = 0;
  v3.receiver = self;
  v3.super_class = (Class)_UIDynamicValueAnimation;
  -[_UIDynamicAnimation _stopAnimation](&v3, sel__stopAnimation);
}

- (void)_updateStepFunction
{
  NSMutableArray *activeValues;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  char v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  int v12;
  BOOL v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  activeValues = self->_activeValues;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](activeValues, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(activeValues);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v11, "type") == 1)
        {
          if (objc_msgSend(v11, "_isLowerBoundary"))
          {
            ++v7;
          }
          else
          {
            v12 = objc_msgSend(v11, "_isUpperBoundary");
            v6 += v12;
            v8 |= v12 ^ 1;
          }
        }
        else
        {
          v8 = 1;
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](activeValues, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
    v7 = 0;
    v8 = 0;
  }
  if (-[NSMutableArray count](self->_activeValues, "count"))
  {
    v14 = v7 > 1 || v6 > 1;
    if (((v14 | v8) & 1) != 0)
      v15 = _UIDynamicAnimationStep;
    else
      v15 = _UIDynamicAnimationStepFrictionAndSoftStopOnly;
  }
  else
  {
    v15 = _UIDynamicAnimationStepFrictionOnly;
  }
  self->_stepFunction = v15;
}

- (void)addActiveValue:(id)a3
{
  NSMutableArray *activeValues;

  if (a3)
  {
    activeValues = self->_activeValues;
    if (!activeValues)
    {
      activeValues = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
      self->_activeValues = activeValues;
    }
    -[NSMutableArray addObject:](activeValues, "addObject:", a3);
    objc_msgSend(a3, "addObserver:forKeyPath:options:context:", self, CFSTR("type"), 0, 0);
    -[_UIDynamicValueAnimation _updateStepFunction](self, "_updateStepFunction");
  }
}

- (void)removeActiveValue:(id)a3
{
  if (-[NSMutableArray containsObject:](self->_activeValues, "containsObject:"))
  {
    objc_msgSend(a3, "removeObserver:forKeyPath:", self, CFSTR("type"));
    -[NSMutableArray removeObject:](self->_activeValues, "removeObject:", a3);
    -[_UIDynamicValueAnimation _updateStepFunction](self, "_updateStepFunction");
  }
}

- (void)setActiveValues:(id)a3
{
  NSMutableArray *activeValues;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  activeValues = self->_activeValues;
  if (activeValues != a3)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](activeValues, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v20;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(activeValues);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v9++), "removeObserver:forKeyPath:", self, CFSTR("type"));
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](activeValues, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v7);
    }

    v10 = (NSMutableArray *)objc_msgSend(a3, "mutableCopy");
    self->_activeValues = v10;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v16;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "addObserver:forKeyPath:options:context:", self, CFSTR("type"), 0, 0);
        }
        while (v12 != v14);
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
      }
      while (v12);
    }
    -[_UIDynamicValueAnimation _updateStepFunction](self, "_updateStepFunction");
  }
}

- (BOOL)_animateForInterval:(double)a3
{
  double value;
  _BOOL8 v5;
  _QWORD v7[5];
  _QWORD v8[6];

  if ((uint64_t)(a3 * 1000.0) < 1)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    value = self->_value;
    ((void (*)(void))self->_stepFunction)();
    v5 = _UIDynamicAnimationIsAtRest((uint64_t)self);
    v7[4] = self;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __48___UIDynamicValueAnimation__animateForInterval___block_invoke;
    v8[3] = &unk_1E16B4168;
    v8[4] = self;
    *(double *)&v8[5] = value;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __48___UIDynamicValueAnimation__animateForInterval___block_invoke_2;
    v7[3] = &unk_1E16B4190;
    -[_UIDynamicAnimation _callAppliers:additionalEndAppliers:done:](self, "_callAppliers:additionalEndAppliers:done:", v8, v7, v5);
  }
  return v5;
}

- (void)runWithValueApplier:(id)a3 completion:(id)a4 forScreen:(id)a5 runLoopMode:(id)a6
{
  objc_super v9;

  if (a3)
  {
    if ((*((_BYTE *)&self->super + 20) & 2) != 0)
      return;

    self->_applier = (id)objc_msgSend(a3, "copy");
    goto LABEL_8;
  }
  if (!self->_applier && !self->_viewApplier)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("valueApplier must be non-nil"), a5, a6);
  if ((*((_BYTE *)&self->super + 20) & 2) == 0)
  {
LABEL_8:
    v9.receiver = self;
    v9.super_class = (Class)_UIDynamicValueAnimation;
    -[_UIDynamicAnimation runWithCompletion:](&v9, sel_runWithCompletion_, a4);
  }
}

- (void)runWithValueApplier:(id)a3 completion:(id)a4
{
  -[_UIDynamicValueAnimation runWithValueApplier:completion:forScreen:runLoopMode:](self, "runWithValueApplier:completion:forScreen:runLoopMode:", a3, a4, 0, 0);
}

- (void)runWithCompletion:(id)a3
{
  if (*(_OWORD *)&self->_applier == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Dynamic animations without pre-set appliers must be run with an explicit applier. Use runWithValueApplier:completion:"));
  -[_UIDynamicValueAnimation runWithValueApplier:completion:](self, "runWithValueApplier:completion:", 0, a3);
}

- (void)setFriction:(double)a3
{
  double v3;
  double v4;

  if (a3 > 1.0)
    a3 = 1.0;
  v3 = fmax(a3, 0.0);
  self->_friction = v3;
  v4 = v3 * -0.025 + 1.0;
  self->_decelerationFactor = v4;
  self->_decelerationLnFactor = log(v4);
}

- (void)_setDecelerationFactor:(double)a3
{
  double v3;

  v3 = 1.0;
  if ((1.0 - a3) / 0.025 <= 1.0)
    v3 = (1.0 - a3) / 0.025;
  self->_friction = fmax(v3, 0.0);
  self->_decelerationFactor = a3;
  self->_decelerationLnFactor = log(a3);
}

- (double)_multiplier
{
  return self->_multiplier;
}

- (void)_setMultiplier:(double)a3
{
  self->_multiplier = a3;
}

- (double)velocity
{
  return self->_velocity * 1000.0;
}

- (void)_setVelocity:(double)a3
{
  self->_velocity = a3 / 1000.0;
}

- (void)_appendSubclassDescription:(id)a3 atLevel:(int)a4
{
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  NSMutableArray *activeValues;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t i;
  void *v17;
  unint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[_UIDynamicValueAnimation value](self, "value");
  objc_msgSend(a3, "appendFormat:", CFSTR("; value = %f"), v7);
  -[_UIDynamicValueAnimation velocity](self, "velocity");
  objc_msgSend(a3, "appendFormat:", CFSTR("; velocity = %f"), v8);
  -[_UIDynamicValueAnimation friction](self, "friction");
  if (v9 != 0.002)
  {
    -[_UIDynamicValueAnimation friction](self, "friction");
    objc_msgSend(a3, "appendFormat:", CFSTR("; friction = %f"), v10);
  }
  if (-[NSMutableArray count](self->_activeValues, "count"))
  {
    objc_msgSend(a3, "appendString:", CFSTR("; active values = {"));
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    activeValues = self->_activeValues;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](activeValues, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      v15 = 1;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(activeValues);
          v17 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if ((v15 & 1) == 0)
            objc_msgSend(a3, "appendString:", CFSTR(","));
          objc_msgSend(v17, "_appendDescriptionToString:atLevel:", a3, (a4 + 1));
          v15 = 0;
        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](activeValues, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        v15 = 0;
      }
      while (v13);
    }
    objc_msgSend(a3, "appendString:", CFSTR("\n"));
    if (a4)
    {
      v18 = 1;
      do
      {
        objc_msgSend(a3, "appendString:", CFSTR("    "));
        ++v18;
      }
      while (v18 <= a4);
    }
    objc_msgSend(a3, "appendString:", CFSTR("}"));
  }
}

- (void)setVelocity:(double)a3
{
  self->_velocity = a3;
}

- (double)value
{
  return self->_value;
}

- (void)setValue:(double)a3
{
  self->_value = a3;
}

- (double)friction
{
  return self->_friction;
}

- (NSArray)activeValues
{
  return &self->_activeValues->super;
}

@end
