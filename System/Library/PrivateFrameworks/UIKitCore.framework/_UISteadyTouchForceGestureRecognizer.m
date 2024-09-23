@implementation _UISteadyTouchForceGestureRecognizer

- (_UISteadyTouchForceGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _UISteadyTouchForceGestureRecognizer *v4;
  _UISteadyTouchForceGestureRecognizer *v5;
  _UISteadyTouchForceGestureRecognizer *v6;
  _UIVelocityIntegrator *v7;
  _UIVelocityIntegrator *velocityIntegrator;
  _UISteadyTouchForceGestureRecognizer *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_UISteadyTouchForceGestureRecognizer;
  v4 = -[UIGestureRecognizer initWithTarget:action:](&v11, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_minimumSteadyTouchForceDuration = 0.4;
    v6 = v4;
    v7 = objc_alloc_init(_UIVelocityIntegrator);
    -[_UIVelocityIntegrator setMinimumRequiredMovement:](v7, "setMinimumRequiredMovement:", 0.0);
    velocityIntegrator = v6->_velocityIntegrator;
    v6->_velocityIntegrator = v7;

    -[UIGestureRecognizer setAllowedTouchTypes:](v6, "setAllowedTouchTypes:", &unk_1E1A945F8);
    -[UIGestureRecognizer setAllowedPressTypes:](v6, "setAllowedPressTypes:", MEMORY[0x1E0C9AA60]);

    v9 = v6;
  }

  return v5;
}

- (void)setView:(id)a3
{
  id v4;
  CADisplayLink *continuousEvaluationDisplayLink;
  objc_super v6;

  v4 = a3;
  if (!v4)
  {
    -[CADisplayLink invalidate](self->_continuousEvaluationDisplayLink, "invalidate");
    continuousEvaluationDisplayLink = self->_continuousEvaluationDisplayLink;
    self->_continuousEvaluationDisplayLink = 0;

  }
  v6.receiver = self;
  v6.super_class = (Class)_UISteadyTouchForceGestureRecognizer;
  -[UIGestureRecognizer setView:](&v6, sel_setView_, v4);

}

- (void)recognize
{
  if (-[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStatePossible)
    -[UIGestureRecognizer setState:](self, "setState:", 3);
  -[_UISteadyTouchForceGestureRecognizer _endContinuousEvaluation](self, "_endContinuousEvaluation");
}

- (void)cancel
{
  UIGestureRecognizerState v3;

  v3 = -[UIGestureRecognizer state](self, "state");
  if ((unint64_t)v3 <= UIGestureRecognizerStateChanged)
    -[UIGestureRecognizer setState:](self, "setState:", qword_186681F18[v3]);
  -[_UISteadyTouchForceGestureRecognizer _endContinuousEvaluation](self, "_endContinuousEvaluation");
}

- (double)minimumSteadyTouchForceDuration
{
  uint64_t v2;

  v2 = 2;
  if (!self->_useOverridingMinimumDuration)
    v2 = 3;
  return *(double *)((char *)&self->super.super.isa
                   + OBJC_IVAR____UISteadyTouchForceGestureRecognizer__continuousEvaluationDisplayLink[v2]);
}

- (void)reset
{
  NSDate *steadyTimestamp;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UISteadyTouchForceGestureRecognizer;
  -[UIGestureRecognizer reset](&v4, sel_reset);
  -[_UIVelocityIntegrator reset](self->_velocityIntegrator, "reset");
  self->_currentTouchForce = 0.0;
  steadyTimestamp = self->_steadyTimestamp;
  self->_steadyTimestamp = 0;

  self->_useOverridingMinimumDuration = 0;
  -[_UISteadyTouchForceGestureRecognizer _endContinuousEvaluation](self, "_endContinuousEvaluation");
}

- (void)_adjustSteadyForceDurationIfNeeded:(id)a3 event:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(a3, "valueForKey:", CFSTR("window"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        objc_msgSend(v6, "_gestureRecognizersForWindow:", v12, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v19;
          while (2)
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v19 != v16)
                objc_enumerationMutation(v13);
              if (_isDragInteractionGestureRecognizer(*(void **)(*((_QWORD *)&v18 + 1) + 8 * j)))
              {
                self->_overrideMinimumSteadyTouchForceDuration = 0.125;
                self->_useOverridingMinimumDuration = 1;

                goto LABEL_18;
              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
            if (v15)
              continue;
            break;
          }
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v9);
  }
LABEL_18:

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;

  v6 = a3;
  -[_UISteadyTouchForceGestureRecognizer _adjustSteadyForceDurationIfNeeded:event:](self, "_adjustSteadyForceDurationIfNeeded:event:", v6, a4);
  -[_UISteadyTouchForceGestureRecognizer _evaluateTouches:](self, "_evaluateTouches:", v6);
  -[_UISteadyTouchForceGestureRecognizer _beginForContinuousEvaluationForTouches:](self, "_beginForContinuousEvaluationForTouches:", v6);

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[UIGestureRecognizer _allActiveTouches](self, "_allActiveTouches", a3, a4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9), "phase") < 3)
        {

          return;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v7)
        continue;
      break;
    }
  }

  -[_UISteadyTouchForceGestureRecognizer cancel](self, "cancel");
}

- (void)_evaluateTouches:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  double v11;
  double v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      v9 = 0.0;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "force", (_QWORD)v13);
          v9 = v9 + v11;
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }
    else
    {
      v9 = 0.0;
    }

    v12 = v9 / (double)(unint64_t)objc_msgSend(v5, "count");
  }
  else
  {
    v12 = 0.0;
  }

  -[_UISteadyTouchForceGestureRecognizer _evaluateWithTouchForce:](self, "_evaluateWithTouchForce:", v12);
  self->_currentTouchForce = v12;

}

- (void)_evaluateWithTouchForce:(double)a3
{
  double v4;
  float v5;
  NSDate *steadyTimestamp;
  NSDate *v7;
  double v8;
  double v9;
  double v10;
  NSDate *obj;

  -[_UIVelocityIntegrator addSample:](self->_velocityIntegrator, "addSample:", 0.0, a3);
  if (!-[_UIVelocityIntegrator hasVelocity](self->_velocityIntegrator, "hasVelocity"))
    goto LABEL_6;
  -[_UIVelocityIntegrator velocity](self->_velocityIntegrator, "velocity");
  if (v4 != 0.0)
  {
    v5 = fabs(v4) * 100.0;
    v4 = roundf(v5) / 100.0;
  }
  if (v4 > 0.5)
  {
    steadyTimestamp = self->_steadyTimestamp;
    self->_steadyTimestamp = 0;
  }
  else
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
    obj = v7;
    if (self->_steadyTimestamp)
    {
      -[NSDate timeIntervalSinceDate:](v7, "timeIntervalSinceDate:");
      v9 = v8;
      -[_UISteadyTouchForceGestureRecognizer minimumSteadyTouchForceDuration](self, "minimumSteadyTouchForceDuration");
      if (v9 >= v10)
        -[_UISteadyTouchForceGestureRecognizer recognize](self, "recognize");
    }
    else
    {
      objc_storeStrong((id *)&self->_steadyTimestamp, v7);
    }
    steadyTimestamp = obj;
  }

}

- (void)_beginForContinuousEvaluationForTouches:(id)a3
{
  CADisplayLink *continuousEvaluationDisplayLink;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CADisplayLink *v9;
  CADisplayLink *v10;
  CADisplayLink *v11;
  void *v12;

  continuousEvaluationDisplayLink = self->_continuousEvaluationDisplayLink;
  if (!continuousEvaluationDisplayLink)
  {
    objc_msgSend(a3, "anyObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "screen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "displayLinkWithTarget:selector:", self, sel__updateForContinuousEvaluation_);
    v9 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
    v10 = self->_continuousEvaluationDisplayLink;
    self->_continuousEvaluationDisplayLink = v9;

    v11 = self->_continuousEvaluationDisplayLink;
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v11, "addToRunLoop:forMode:", v12, *MEMORY[0x1E0C99860]);

    continuousEvaluationDisplayLink = self->_continuousEvaluationDisplayLink;
  }
  -[CADisplayLink setPaused:](continuousEvaluationDisplayLink, "setPaused:", 0);
}

- (void)_updateForContinuousEvaluation:(id)a3
{
  -[_UISteadyTouchForceGestureRecognizer _evaluateWithTouchForce:](self, "_evaluateWithTouchForce:", a3, self->_currentTouchForce);
}

- (void)_endContinuousEvaluation
{
  -[CADisplayLink setPaused:](self->_continuousEvaluationDisplayLink, "setPaused:", 1);
}

- (void)setMinimumSteadyTouchForceDuration:(double)a3
{
  self->_minimumSteadyTouchForceDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_steadyTimestamp, 0);
  objc_storeStrong((id *)&self->_velocityIntegrator, 0);
  objc_storeStrong((id *)&self->_continuousEvaluationDisplayLink, 0);
}

@end
