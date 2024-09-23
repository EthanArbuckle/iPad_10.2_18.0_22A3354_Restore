@implementation UITouchForceGestureRecognizer

- (UITouchForceGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  UITouchForceGestureRecognizer *v4;
  UITouchForceGestureRecognizer *v5;
  _UIVelocityIntegrator *v6;
  _UIVelocityIntegrator *velocityIntegrator;
  UITouchForceGestureRecognizer *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UITouchForceGestureRecognizer;
  v4 = -[UIGestureRecognizer initWithTarget:action:](&v10, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_touchForce = 0.0;
    v4->_minimumRequiredTouchForce = 0.0;
    v4->_allowableMovement = 10.0;
    v4->_maximumNumberOfTouches = 0;
    v6 = objc_alloc_init(_UIVelocityIntegrator);
    -[_UIVelocityIntegrator setMinimumRequiredMovement:](v6, "setMinimumRequiredMovement:", 0.0);
    velocityIntegrator = v5->_velocityIntegrator;
    v5->_velocityIntegrator = v6;

    v5->_velocity = 0.0;
    v5->_steady = 1;
    v5->_automaticTouchForce = 0.0;
    v5->_automaticTouchForceDuration = 0.5;
    -[UIGestureRecognizer setAllowedTouchTypes:](v5, "setAllowedTouchTypes:", &unk_1E1A93680);
    -[UIGestureRecognizer setAllowedPressTypes:](v5, "setAllowedPressTypes:", MEMORY[0x1E0C9AA60]);
    -[UIGestureRecognizer setCancelsTouchesInView:](v5, "setCancelsTouchesInView:", 0);
    v8 = v5;
  }

  return v5;
}

- (void)setView:(id)a3
{
  CADisplayLink *continuousEvaluationDisplayLink;
  objc_super v6;

  if (!a3)
  {
    -[CADisplayLink invalidate](self->_continuousEvaluationDisplayLink, "invalidate");
    continuousEvaluationDisplayLink = self->_continuousEvaluationDisplayLink;
    self->_continuousEvaluationDisplayLink = 0;

  }
  v6.receiver = self;
  v6.super_class = (Class)UITouchForceGestureRecognizer;
  -[UIGestureRecognizer setView:](&v6, sel_setView_, a3);
}

- (void)reset
{
  NSMutableSet *currentTouches;
  CGPoint v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UITouchForceGestureRecognizer;
  -[UIGestureRecognizer reset](&v5, sel_reset);
  currentTouches = self->_currentTouches;
  self->_currentTouches = 0;

  self->_touchForce = 0.0;
  self->_currentTouchForce = 0.0;
  self->_eventTouchCount = 0;
  self->_touchesBeganTimestamp = 0.0;
  v4 = (CGPoint)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  self->_initialCentroidOfTouches = v4;
  self->_currentCentroidOfTouches = v4;
  -[_UIVelocityIntegrator reset](self->_velocityIntegrator, "reset");
  self->_velocity = 0.0;
  self->_steady = 1;
  -[UITouchForceGestureRecognizer _endContinuousEvaluation](self, "_endContinuousEvaluation");
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  NSMutableSet *currentTouches;
  NSMutableSet *v8;
  NSMutableSet *v9;
  void *v10;
  double v11;
  CGFloat v12;

  currentTouches = self->_currentTouches;
  if (currentTouches)
  {
    -[NSMutableSet unionSet:](currentTouches, "unionSet:", a3);
  }
  else
  {
    v8 = (NSMutableSet *)objc_msgSend(a3, "mutableCopy");
    v9 = self->_currentTouches;
    self->_currentTouches = v8;

    objc_msgSend(a3, "anyObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timestamp");
    self->_touchesBeganTimestamp = v11;

    self->_currentCentroidOfTouches.x = _CentroidOfTouches(a3, 0);
    self->_currentCentroidOfTouches.y = v12;
    self->_initialCentroidOfTouches = self->_currentCentroidOfTouches;
    -[UITouchForceGestureRecognizer _beginForContinuousEvaluationForTouches:](self, "_beginForContinuousEvaluationForTouches:", a3);
  }
  -[UITouchForceGestureRecognizer _evaluateTouches:withEvent:](self, "_evaluateTouches:withEvent:", a3, a4);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableSet *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        if (-[UITouch _mightBeConsideredForForceSystemGesture](*(void **)(*((_QWORD *)&v20 + 1) + 8 * v10)))
        {
          v18 = 0u;
          v19 = 0u;
          v16 = 0u;
          v17 = 0u;
          v11 = self->_currentTouches;
          v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v17;
            do
            {
              v15 = 0;
              do
              {
                if (*(_QWORD *)v17 != v14)
                  objc_enumerationMutation(v11);
                -[UIGestureRecognizer ignoreTouch:forEvent:](self, "ignoreTouch:forEvent:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15++), a4, (_QWORD)v16);
              }
              while (v13 != v15);
              v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
            }
            while (v13);
          }

          -[NSMutableSet removeAllObjects](self->_currentTouches, "removeAllObjects");
          -[UITouchForceGestureRecognizer _endIfNeeded:](self, "_endIfNeeded:", 1);

          return;
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      if (v8)
        continue;
      break;
    }
  }

  -[UITouchForceGestureRecognizer _evaluateTouches:withEvent:](self, "_evaluateTouches:withEvent:", v6, a4);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  -[NSMutableSet minusSet:](self->_currentTouches, "minusSet:", a3, a4);
  if (!-[NSMutableSet count](self->_currentTouches, "count"))
    -[UITouchForceGestureRecognizer _endIfNeeded:](self, "_endIfNeeded:", -[UITouchForceGestureRecognizer _validateHysteresis](self, "_validateHysteresis"));
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[NSMutableSet minusSet:](self->_currentTouches, "minusSet:", a3, a4);
  if (!-[NSMutableSet count](self->_currentTouches, "count"))
    -[UITouchForceGestureRecognizer _endIfNeeded:](self, "_endIfNeeded:", 1);
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)_shouldReceiveTouch:(id)a3 forEvent:(id)a4 recognizerView:(id)a5
{
  void (**configurationBlock)(id, UITouchForceGestureRecognizer *);
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  objc_super v15;

  if ((-[UITouch _mightBeConsideredForForceSystemGesture](a3) & 1) != 0)
    return 0;
  configurationBlock = (void (**)(id, UITouchForceGestureRecognizer *))self->_configurationBlock;
  if (configurationBlock)
    configurationBlock[2](configurationBlock, self);
  -[UITouchForceGestureRecognizer automaticTouchForce](self, "automaticTouchForce");
  if (v10 == 0.0)
  {
    objc_msgSend(a3, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "traitCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "forceTouchCapability");

    if (v13 != 2)
      return 0;
  }
  v15.receiver = self;
  v15.super_class = (Class)UITouchForceGestureRecognizer;
  return -[UIGestureRecognizer _shouldReceiveTouch:forEvent:recognizerView:](&v15, sel__shouldReceiveTouch_forEvent_recognizerView_, a3, a4, a5);
}

- (void)_evaluateTouches:(id)a3 withEvent:(id)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t i;
  double v13;
  double v14;
  CGFloat v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "count"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = a3;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      v11 = 0.0;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "force", (_QWORD)v18);
          v11 = v11 + v13;
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }
    else
    {
      v11 = 0.0;
    }

    v14 = v11 / (double)(unint64_t)objc_msgSend(v7, "count");
  }
  else
  {
    v14 = 0.0;
  }
  self->_currentCentroidOfTouches.x = _CentroidOfTouches(a3, 0);
  self->_currentCentroidOfTouches.y = v15;
  self->_currentTouchForce = v14;
  objc_msgSend(a4, "allTouches");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  self->_eventTouchCount = objc_msgSend(v16, "count");

  objc_msgSend(a3, "anyObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "timestamp");
  -[UITouchForceGestureRecognizer _evaluateAutomaticTouchForceForTimeInterval:actualTouchForce:](self, "_evaluateAutomaticTouchForceForTimeInterval:actualTouchForce:");
  -[UITouchForceGestureRecognizer _evaluateWithTouchForce:centroidAtLocation:](self, "_evaluateWithTouchForce:centroidAtLocation:");

}

- (void)_evaluateWithTouchForce:(double)a3 centroidAtLocation:(CGPoint)a4
{
  UIGestureRecognizerState v6;
  UITouchForceGestureRecognizer *v7;
  uint64_t v8;
  double v9;
  UITouchForceGestureRecognizer *v10;

  if (-[UITouchForceGestureRecognizer _validateHysteresis](self, "_validateHysteresis", a3, a4.x, a4.y))
  {
    -[UITouchForceGestureRecognizer _updateTouchForce:](self, "_updateTouchForce:", a3);
    -[UITouchForceGestureRecognizer _endIfNeeded:](self, "_endIfNeeded:", 1);
    return;
  }
  v6 = -[UIGestureRecognizer state](self, "state");
  if ((unint64_t)(v6 - 3) < 3)
  {
    v9 = 0.0;
    v10 = self;
LABEL_12:
    -[UITouchForceGestureRecognizer _updateTouchForce:](v10, "_updateTouchForce:", v9);
    return;
  }
  if ((unint64_t)(v6 - 1) < 2)
  {
    v7 = self;
    v8 = 2;
LABEL_11:
    -[UIGestureRecognizer setState:](v7, "setState:", v8);
    v10 = self;
    v9 = a3;
    goto LABEL_12;
  }
  if (v6 == UIGestureRecognizerStatePossible && self->_minimumRequiredTouchForce <= a3)
  {
    v7 = self;
    v8 = 1;
    goto LABEL_11;
  }
}

- (void)_endIfNeeded:(BOOL)a3
{
  _BOOL4 v3;
  UIGestureRecognizerState v5;
  uint64_t v6;

  v3 = a3;
  v5 = -[UIGestureRecognizer state](self, "state");
  if ((unint64_t)(v5 - 3) < 3)
  {
LABEL_7:
    -[UITouchForceGestureRecognizer _updateTouchForce:](self, "_updateTouchForce:", 0.0);
    goto LABEL_8;
  }
  if ((unint64_t)(v5 - 1) < 2)
  {
    if (v3)
      v6 = 4;
    else
      v6 = 3;
    -[UIGestureRecognizer setState:](self, "setState:", v6);
    goto LABEL_7;
  }
  if (v5 == UIGestureRecognizerStatePossible)
    -[UIGestureRecognizer setState:](self, "setState:", 5);
LABEL_8:
  -[UITouchForceGestureRecognizer _endContinuousEvaluation](self, "_endContinuousEvaluation");
}

- (void)_updateTouchForce:(double)a3
{
  double v5;
  double v6;
  double v7;
  float v8;

  -[UITouchForceGestureRecognizer setTouchForce:](self, "setTouchForce:");
  v5 = 0.0;
  -[_UIVelocityIntegrator addSample:](self->_velocityIntegrator, "addSample:", 0.0, a3);
  if (-[_UIVelocityIntegrator hasVelocity](self->_velocityIntegrator, "hasVelocity"))
  {
    -[_UIVelocityIntegrator velocity](self->_velocityIntegrator, "velocity");
    v5 = v6;
  }
  -[UITouchForceGestureRecognizer setVelocity:](self, "setVelocity:", v5);
  -[UITouchForceGestureRecognizer velocity](self, "velocity");
  if (v7 != 0.0)
  {
    v8 = v7 * 100.0;
    v7 = roundf(v8) / 100.0;
  }
  -[UITouchForceGestureRecognizer setSteady:](self, "setSteady:", v7 == 0.0);
}

- (BOOL)_hasExceededAllowableMovement
{
  double allowableMovement;
  float64x2_t v3;
  double v4;

  allowableMovement = self->_allowableMovement;
  if (allowableMovement <= 0.0)
    return 0;
  v3 = vsubq_f64((float64x2_t)self->_currentCentroidOfTouches, (float64x2_t)self->_initialCentroidOfTouches);
  v4 = sqrt(vaddvq_f64(vmulq_f64(v3, v3)));
  if (v4 >= allowableMovement)
    v4 = self->_allowableMovement;
  return v4 / allowableMovement >= 1.0;
}

- (BOOL)_hasExceededMaximumNumberOfTouches
{
  unint64_t v3;

  v3 = -[UITouchForceGestureRecognizer maximumNumberOfTouches](self, "maximumNumberOfTouches");
  if (v3)
    LOBYTE(v3) = self->_eventTouchCount > v3;
  return v3;
}

- (BOOL)_validateHysteresis
{
  return -[UITouchForceGestureRecognizer _hasExceededAllowableMovement](self, "_hasExceededAllowableMovement")
      || -[UITouchForceGestureRecognizer _hasExceededMaximumNumberOfTouches](self, "_hasExceededMaximumNumberOfTouches");
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
  -[UITouchForceGestureRecognizer _evaluateAutomaticTouchForceForTimeInterval:actualTouchForce:](self, "_evaluateAutomaticTouchForceForTimeInterval:actualTouchForce:", CACurrentMediaTime(), self->_currentTouchForce);
  -[UITouchForceGestureRecognizer _evaluateWithTouchForce:centroidAtLocation:](self, "_evaluateWithTouchForce:centroidAtLocation:");
}

- (void)_endContinuousEvaluation
{
  -[CADisplayLink setPaused:](self->_continuousEvaluationDisplayLink, "setPaused:", 1);
}

- (double)_evaluateAutomaticTouchForceForTimeInterval:(double)a3 actualTouchForce:(double)a4
{
  double automaticTouchForce;
  double v5;

  automaticTouchForce = self->_automaticTouchForce;
  if (automaticTouchForce > 0.0)
  {
    v5 = automaticTouchForce * ((a3 - self->_touchesBeganTimestamp) / self->_automaticTouchForceDuration);
    if (v5 >= a4)
      return v5;
  }
  return a4;
}

- (double)touchDuration
{
  double result;
  double v4;

  result = 0.0;
  if (self->_touchesBeganTimestamp < 978307200.0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate", 0.0);
    return v4 - self->_touchesBeganTimestamp;
  }
  return result;
}

- (double)touchForce
{
  return self->_touchForce;
}

- (void)setTouchForce:(double)a3
{
  self->_touchForce = a3;
}

- (double)minimumRequiredTouchForce
{
  return self->_minimumRequiredTouchForce;
}

- (void)setMinimumRequiredTouchForce:(double)a3
{
  self->_minimumRequiredTouchForce = a3;
}

- (double)velocity
{
  return self->_velocity;
}

- (void)setVelocity:(double)a3
{
  self->_velocity = a3;
}

- (BOOL)isSteady
{
  return self->_steady;
}

- (void)setSteady:(BOOL)a3
{
  self->_steady = a3;
}

- (double)allowableMovement
{
  return self->_allowableMovement;
}

- (void)setAllowableMovement:(double)a3
{
  self->_allowableMovement = a3;
}

- (unint64_t)maximumNumberOfTouches
{
  return self->_maximumNumberOfTouches;
}

- (void)setMaximumNumberOfTouches:(unint64_t)a3
{
  self->_maximumNumberOfTouches = a3;
}

- (double)automaticTouchForce
{
  return self->_automaticTouchForce;
}

- (void)setAutomaticTouchForce:(double)a3
{
  self->_automaticTouchForce = a3;
}

- (double)automaticTouchForceDuration
{
  return self->_automaticTouchForceDuration;
}

- (void)setAutomaticTouchForceDuration:(double)a3
{
  self->_automaticTouchForceDuration = a3;
}

- (id)configurationBlock
{
  return self->_configurationBlock;
}

- (void)setConfigurationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_configurationBlock, 0);
  objc_storeStrong((id *)&self->_velocityIntegrator, 0);
  objc_storeStrong((id *)&self->_currentTouches, 0);
  objc_storeStrong((id *)&self->_continuousEvaluationDisplayLink, 0);
}

@end
