@implementation _UIEdgeFeedbackGenerator

+ (Class)_configurationClass
{
  return (Class)objc_opt_class();
}

- (_UIEdgeFeedbackGenerator)initWithConfiguration:(id)a3 view:(id)a4
{
  _UIEdgeFeedbackGenerator *v4;
  _UIEdgeFeedbackGenerator *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIEdgeFeedbackGenerator;
  v4 = -[UIFeedbackGenerator initWithConfiguration:view:](&v8, sel_initWithConfiguration_view_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[_UIEdgeFeedbackGenerator _edgeConfiguration](v4, "_edgeConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIEdgeFeedbackGenerator setAxis:](v5, "setAxis:", objc_msgSend(v6, "_defaultAxis"));

  }
  return v5;
}

- (void)setAxis:(int64_t)a3
{
  self->_axis = a3;
}

- (void)setDistance:(double)a3
{
  self->_distance = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playingContinuousFeedback, 0);
  objc_storeStrong((id *)&self->_feedbackEngine, 0);
}

- (_UIEdgeFeedbackGenerator)initWithStyle:(int64_t)a3
{
  return -[_UIEdgeFeedbackGenerator initWithStyle:view:](self, "initWithStyle:view:", a3, 0);
}

- (_UIEdgeFeedbackGenerator)initWithStyle:(int64_t)a3 coordinateSpace:(id)a4
{
  void *v6;
  _UIEdgeFeedbackGenerator *v7;

  _viewFromCoordinateSpace(a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_UIEdgeFeedbackGenerator initWithStyle:view:](self, "initWithStyle:view:", a3, v6);

  return v7;
}

- (_UIEdgeFeedbackGenerator)initWithStyle:(int64_t)a3 view:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  _UIEdgeFeedbackGenerator *v9;
  objc_super v11;

  v6 = a4;
  switch(a3)
  {
    case 0:
      objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_configurationClass"), "verticalScrollConfiguration");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1:
      objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_configurationClass"), "horizontalScrollConfiguration");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_configurationClass"), "sliderConfiguration");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3:
      objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_configurationClass"), "swipePresentationConfiguration");
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v8 = (void *)v7;
      break;
    default:
      v8 = 0;
      break;
  }
  v11.receiver = self;
  v11.super_class = (Class)_UIEdgeFeedbackGenerator;
  v9 = -[UIFeedbackGenerator initWithConfiguration:view:](&v11, sel_initWithConfiguration_view_, v8, v6);

  return v9;
}

- (void)_stopAnimatingWithTimeout:(double)a3
{
  -[_UIEdgeFeedbackGenerator _cancelStopAnimatingTimeout](self, "_cancelStopAnimatingTimeout");
  -[_UIEdgeFeedbackGenerator performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__animationEnded, 0, a3);
}

- (void)_cancelStopAnimatingTimeout
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__animationEnded, 0);
}

- (void)userInteractionStartedAtLocation:(CGPoint)a3
{
  if (-[UIFeedbackGenerator _isEnabled](self, "_isEnabled", a3.x, a3.y))
  {
    if (-[_UIEdgeFeedbackGenerator _state](self, "_state") == 2
      || -[_UIEdgeFeedbackGenerator _state](self, "_state") == 3)
    {
      -[_UIEdgeFeedbackGenerator _cancelStopAnimatingTimeout](self, "_cancelStopAnimatingTimeout");
      -[_UIEdgeFeedbackGenerator _animationEnded](self, "_animationEnded");
    }
    -[_UIEdgeFeedbackGenerator _setLastState:](self, "_setLastState:", 0);
    -[_UIEdgeFeedbackGenerator _setValue:](self, "_setValue:", 2.22507386e-308);
    -[_UIEdgeFeedbackGenerator _setPreviousValue:](self, "_setPreviousValue:", 2.22507386e-308);
    -[_UIEdgeFeedbackGenerator _setLastValueUpdateTime:](self, "_setLastValueUpdateTime:", 2.22507386e-308);
    -[_UIEdgeFeedbackGenerator _setPreviousValueUpdateTime:](self, "_setPreviousValueUpdateTime:", 2.22507386e-308);
    -[_UIEdgeFeedbackGenerator _setState:](self, "_setState:", 1);
  }
}

- (void)userInteractionStarted
{
  -[_UIEdgeFeedbackGenerator userInteractionStartedAtLocation:](self, "userInteractionStartedAtLocation:", 1.79769313e308, 1.79769313e308);
}

- (void)userInteractionEndedAtLocation:(CGPoint)a3
{
  if (-[UIFeedbackGenerator _isEnabled](self, "_isEnabled", a3.x, a3.y))
  {
    -[UIFeedbackGenerator _clientDidUpdateGeneratorWithSelector:](self, "_clientDidUpdateGeneratorWithSelector:", a2);
    if (-[_UIEdgeFeedbackGenerator _state](self, "_state") == 1)
      -[_UIEdgeFeedbackGenerator _animationStartedUsingTimeout:](self, "_animationStartedUsingTimeout:", 1);
  }
}

- (void)userInteractionEnded
{
  -[_UIEdgeFeedbackGenerator userInteractionEndedAtLocation:](self, "userInteractionEndedAtLocation:", 1.79769313e308, 1.79769313e308);
}

- (void)userInteractionCancelledAtLocation:(CGPoint)a3
{
  if (-[UIFeedbackGenerator _isEnabled](self, "_isEnabled", a3.x, a3.y))
  {
    -[UIFeedbackGenerator _clientDidUpdateGeneratorWithSelector:](self, "_clientDidUpdateGeneratorWithSelector:", a2);
    if (-[_UIEdgeFeedbackGenerator _state](self, "_state") == 1)
      -[_UIEdgeFeedbackGenerator _deactivate](self, "_deactivate");
  }
}

- (void)userInteractionCancelled
{
  -[_UIEdgeFeedbackGenerator userInteractionCancelledAtLocation:](self, "userInteractionCancelledAtLocation:", 1.79769313e308, 1.79769313e308);
}

- (void)_deactivate
{
  -[_UIEdgeFeedbackGenerator _cancelStopAnimatingTimeout](self, "_cancelStopAnimatingTimeout");
  -[_UIEdgeFeedbackGenerator _setState:](self, "_setState:", 0);
  -[_UIEdgeFeedbackGenerator _setCloseToEdge:](self, "_setCloseToEdge:", 0);
}

- (void)_animationStarted
{
  if (-[UIFeedbackGenerator _isEnabled](self, "_isEnabled"))
    -[_UIEdgeFeedbackGenerator _animationStartedUsingTimeout:](self, "_animationStartedUsingTimeout:", 0);
}

- (void)_animationStartedUsingTimeout:(BOOL)a3
{
  if (a3)
  {
    -[_UIEdgeFeedbackGenerator _setState:](self, "_setState:", 3);
    -[_UIEdgeFeedbackGenerator _stopAnimatingWithTimeout:](self, "_stopAnimatingWithTimeout:", 0.2);
  }
  else
  {
    -[_UIEdgeFeedbackGenerator _setState:](self, "_setState:", 2);
  }
}

- (void)_animationEnded
{
  if (-[UIFeedbackGenerator _isEnabled](self, "_isEnabled")
    && (-[_UIEdgeFeedbackGenerator _state](self, "_state") == 2
     || -[_UIEdgeFeedbackGenerator _state](self, "_state") == 3))
  {
    -[_UIEdgeFeedbackGenerator _deactivate](self, "_deactivate");
  }
}

- (void)_updateCloseToEdge
{
  double v3;
  double v4;
  _UIEdgeFeedbackGenerator *v5;
  uint64_t v6;
  double value;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double extentBeyondDistance;
  double v14;
  double v15;
  _BOOL8 v16;
  double v17;
  double v18;

  if (-[_UIEdgeFeedbackGenerator _isOvershot](self, "_isOvershot"))
    goto LABEL_8;
  -[_UIEdgeFeedbackGenerator _effectiveDistance](self, "_effectiveDistance");
  v4 = v3;
  if (v3 < 1.0)
  {
    v5 = self;
    v6 = 0;
LABEL_9:
    -[_UIEdgeFeedbackGenerator _setCloseToEdge:](v5, "_setCloseToEdge:", v6);
    return;
  }
  value = self->_value;
  v8 = value >= v4 - value ? v4 - value : self->_value;
  -[_UIEdgeFeedbackGenerator _edgeConfiguration](self, "_edgeConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minDistanceFromEdge");
  v11 = v10;

  if (v8 < v11)
  {
LABEL_8:
    v5 = self;
    v6 = 1;
    goto LABEL_9;
  }
  if (self->_previousValue != 2.22507386e-308)
  {
    v12 = self->_value + self->_velocity * 0.3;
    extentBeyondDistance = self->_extentBeyondDistance;
    v14 = v4 + extentBeyondDistance;
    v15 = -extentBeyondDistance;
    if (v12 <= v15)
      v12 = v15;
    if (v14 <= v12)
      v12 = v14;
    v16 = -[_UIEdgeFeedbackGenerator _valueIsOvershot:](self, "_valueIsOvershot:", v12);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v18 = v17;
    if (!v16 && self->_state == 1 && -[_UIEdgeFeedbackGenerator _isCloseToEdge](self, "_isCloseToEdge"))
      v16 = v18 - self->_closeToEdgeUpdateTime < 1.0;
    else
      self->_closeToEdgeUpdateTime = v18;
    v5 = self;
    v6 = v16;
    goto LABEL_9;
  }
}

- (void)_setCloseToEdge:(BOOL)a3
{
  if (self->_closeToEdge != a3)
  {
    self->_closeToEdge = a3;
    if (a3)
      -[UIFeedbackGenerator activateWithCompletionBlock:](self, "activateWithCompletionBlock:", 0);
    else
      -[UIFeedbackGenerator deactivate](self, "deactivate");
  }
}

- (double)_effectiveDistance
{
  double distance;
  int64_t axis;
  void *v4;
  double Width;
  CGRect v7;
  CGRect v8;

  distance = self->_distance;
  if (distance <= 0.0)
  {
    axis = self->_axis;
    if (axis == 1)
    {
      -[UIFeedbackGenerator view](self, "view");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bounds");
      Width = CGRectGetWidth(v8);
      goto LABEL_6;
    }
    distance = 0.0;
    if (axis == 2)
    {
      -[UIFeedbackGenerator view](self, "view");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bounds");
      Width = CGRectGetHeight(v7);
LABEL_6:
      distance = Width;

    }
  }
  return distance;
}

- (void)_setState:(int64_t)a3
{
  int64_t state;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, double);
  float v15;

  state = self->_state;
  if (state != a3)
  {
    if (state == 1)
    {
      -[_UIEdgeFeedbackGenerator _playingContinuousFeedback](self, "_playingContinuousFeedback");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stop");

      -[_UIEdgeFeedbackGenerator _setPlayingContinuousFeedback:](self, "_setPlayingContinuousFeedback:", 0);
      -[_UIEdgeFeedbackGenerator _edgeConfiguration](self, "_edgeConfiguration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "userInteractingReleaseFeedback");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (self->_value != 2.22507386e-308
        && -[_UIEdgeFeedbackGenerator _isOvershot](self, "_isOvershot")
        && !self->_playedOvershotThresholdFeedback
        && v8 != 0)
      {
        -[_UIEdgeFeedbackGenerator _edgeConfiguration](self, "_edgeConfiguration");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "userInteractingReleaseFeedbackUpdateBlock");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          v12 = objc_msgSend(v8, "copy");

          -[_UIEdgeFeedbackGenerator _edgeConfiguration](self, "_edgeConfiguration");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "userInteractingReleaseFeedbackUpdateBlock");
          v14 = (void (**)(_QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
          -[_UIEdgeFeedbackGenerator _percentBeyondDistance](self, "_percentBeyondDistance");
          v14[2](v14, v12, v15);

          v8 = (void *)v12;
        }
        -[UIFeedbackGenerator _playFeedback:atLocation:](self, "_playFeedback:atLocation:", v8, 1.79769313e308, 1.79769313e308);
      }

    }
    self->_state = a3;
    if (!a3)
      self->_playedOvershotThresholdFeedback = 0;
  }
}

- (BOOL)_valueIsOvershot:(double)a3
{
  double v4;
  double v6;

  if (self->_extentBeyondDistance <= 0.0)
  {
    if (fabs(a3) > 2.22044605e-16)
    {
      -[_UIEdgeFeedbackGenerator _effectiveDistance](self, "_effectiveDistance");
      return vabdd_f64(a3, v6) <= 2.22044605e-16;
    }
  }
  else if (a3 >= 0.0)
  {
    -[_UIEdgeFeedbackGenerator _effectiveDistance](self, "_effectiveDistance");
    return v4 < a3;
  }
  return 1;
}

- (BOOL)_isOvershot
{
  return -[_UIEdgeFeedbackGenerator _valueIsOvershot:](self, "_valueIsOvershot:", self->_value);
}

- (float)_percentBeyondDistance
{
  double value;
  double v4;
  double v5;

  value = self->_value;
  if (value >= 0.0)
  {
    -[_UIEdgeFeedbackGenerator _effectiveDistance](self, "_effectiveDistance");
    v4 = value - v5;
  }
  else
  {
    v4 = -value;
  }
  return v4 / self->_extentBeyondDistance;
}

- (void)positionUpdated:(double)a3 atLocation:(CGPoint)a4
{
  double y;
  double x;
  double v9;
  double v10;
  double lastValueUpdateTime;
  double previousValueUpdateTime;
  double value;
  double v14;

  y = a4.y;
  x = a4.x;
  if (-[UIFeedbackGenerator _isEnabled](self, "_isEnabled"))
  {
    if (self->_state)
    {
      -[UIFeedbackGenerator _clientDidUpdateGeneratorWithSelector:](self, "_clientDidUpdateGeneratorWithSelector:", a2);
      if (self->_value != a3)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v10 = v9;
        lastValueUpdateTime = self->_lastValueUpdateTime;
        if (lastValueUpdateTime == 2.22507386e-308)
        {
          v14 = 0.0;
        }
        else
        {
          previousValueUpdateTime = self->_previousValueUpdateTime;
          value = self->_value;
          if (previousValueUpdateTime == 2.22507386e-308)
            v14 = (a3 - value) / (v10 - lastValueUpdateTime);
          else
            v14 = (value - self->_previousValue) / (lastValueUpdateTime - previousValueUpdateTime);
          -[_UIEdgeFeedbackGenerator _setPreviousValueUpdateTime:](self, "_setPreviousValueUpdateTime:");
        }
        -[_UIEdgeFeedbackGenerator _setLastValueUpdateTime:](self, "_setLastValueUpdateTime:", v10);
        -[_UIEdgeFeedbackGenerator _positionUpdated:withVelocity:atLocation:](self, "_positionUpdated:withVelocity:atLocation:", a3, v14, x, y);
      }
    }
  }
}

- (void)positionUpdated:(double)a3
{
  -[_UIEdgeFeedbackGenerator positionUpdated:atLocation:](self, "positionUpdated:atLocation:", a3, 1.79769313e308, 1.79769313e308);
}

- (void)_positionUpdated:(double)a3 withVelocity:(double)a4 atLocation:(CGPoint)a5
{
  double y;
  double x;
  _BOOL4 v10;
  double previousValue;
  double value;
  int v14;
  _BOOL4 v15;
  _BOOL4 v16;
  _BOOL4 v17;
  int64_t state;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void (**v25)(_QWORD, _QWORD, double);
  void *v26;
  float v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void (**v35)(_QWORD, _QWORD, double);
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void (**v43)(_QWORD, _QWORD, double);
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void (**v50)(_QWORD, _QWORD, double);

  y = a5.y;
  x = a5.x;
  if (-[UIFeedbackGenerator _isEnabled](self, "_isEnabled") && self->_value != a3 && self->_state)
  {
    v10 = -[_UIEdgeFeedbackGenerator _isOvershot](self, "_isOvershot");
    previousValue = self->_previousValue;
    value = self->_value;
    if (previousValue == 2.22507386e-308 || value == 2.22507386e-308)
      v14 = 0;
    else
      v14 = (value > previousValue) ^ (value < a3);
    -[_UIEdgeFeedbackGenerator _setPreviousValue:](self, "_setPreviousValue:");
    -[_UIEdgeFeedbackGenerator _setValue:](self, "_setValue:", a3);
    -[_UIEdgeFeedbackGenerator _setVelocity:](self, "_setVelocity:", a4);
    -[_UIEdgeFeedbackGenerator _updateCloseToEdge](self, "_updateCloseToEdge");
    v15 = -[_UIEdgeFeedbackGenerator _isOvershot](self, "_isOvershot");
    v16 = v15;
    if (self->_previousValue == 2.22507386e-308)
      v17 = v15;
    else
      v17 = v10;
    state = self->_state;
    switch(state)
    {
      case 3:
        -[_UIEdgeFeedbackGenerator _stopAnimatingWithTimeout:](self, "_stopAnimatingWithTimeout:", 0.2);
        break;
      case 2:
        break;
      case 1:
        if (v15
          && (-[_UIEdgeFeedbackGenerator _edgeConfiguration](self, "_edgeConfiguration"),
              v19 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v19, "userInteractingBeyondEdgeFeedbackUpdateBlock"),
              v20 = (void *)objc_claimAutoreleasedReturnValue(),
              v20,
              v19,
              v20))
        {
          -[_UIEdgeFeedbackGenerator _playingContinuousFeedback](self, "_playingContinuousFeedback");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v21)
          {
            -[_UIEdgeFeedbackGenerator _edgeConfiguration](self, "_edgeConfiguration");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "userInteractingBeyondEdgeFeedback");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[_UIEdgeFeedbackGenerator _setPlayingContinuousFeedback:](self, "_setPlayingContinuousFeedback:", v23);

          }
          -[_UIEdgeFeedbackGenerator _edgeConfiguration](self, "_edgeConfiguration");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "userInteractingBeyondEdgeFeedbackUpdateBlock");
          v25 = (void (**)(_QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
          -[_UIEdgeFeedbackGenerator _playingContinuousFeedback](self, "_playingContinuousFeedback");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIEdgeFeedbackGenerator _percentBeyondDistance](self, "_percentBeyondDistance");
          ((void (**)(_QWORD, void *, double))v25)[2](v25, v26, v27);

          if (!v21)
          {
            -[_UIEdgeFeedbackGenerator _playingContinuousFeedback](self, "_playingContinuousFeedback");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIFeedbackGenerator _playFeedback:atLocation:](self, "_playFeedback:atLocation:", v28, x, y);

          }
        }
        else
        {
          -[_UIEdgeFeedbackGenerator _playingContinuousFeedback](self, "_playingContinuousFeedback");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "stop");

          -[_UIEdgeFeedbackGenerator _setPlayingContinuousFeedback:](self, "_setPlayingContinuousFeedback:", 0);
        }
        -[_UIEdgeFeedbackGenerator _edgeConfiguration](self, "_edgeConfiguration");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "userInteractingThresholdFeedback");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          if (v17 || !v16 || self->_playedOvershotThresholdFeedback)
          {
            if (v17 && !v16 && self->_playedOvershotThresholdFeedback)
              self->_playedOvershotThresholdFeedback = 0;
          }
          else
          {
            -[_UIEdgeFeedbackGenerator _edgeConfiguration](self, "_edgeConfiguration");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "userInteractingThresholdFeedbackUpdateBlock");
            v47 = (void *)objc_claimAutoreleasedReturnValue();

            if (v47)
            {
              v48 = objc_msgSend(v30, "copy");

              -[_UIEdgeFeedbackGenerator _edgeConfiguration](self, "_edgeConfiguration");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "userInteractingThresholdFeedbackUpdateBlock");
              v50 = (void (**)(_QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
              v50[2](v50, v48, a4);

              v30 = (void *)v48;
            }
            -[UIFeedbackGenerator _playFeedback:atLocation:](self, "_playFeedback:atLocation:", v30, x, y);
            self->_playedOvershotThresholdFeedback = 1;
          }
        }
LABEL_49:

        state = self->_state;
        goto LABEL_50;
      default:
LABEL_50:
        -[_UIEdgeFeedbackGenerator _setLastState:](self, "_setLastState:", state);
        return;
    }
    -[_UIEdgeFeedbackGenerator _edgeConfiguration](self, "_edgeConfiguration");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "animatingThresholdFeedback");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17 && v16 && !self->_playedOvershotThresholdFeedback && v30)
    {
      -[_UIEdgeFeedbackGenerator _edgeConfiguration](self, "_edgeConfiguration");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "animatingThresholdFeedbackUpdateBlock");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        v33 = objc_msgSend(v30, "copy");

        -[_UIEdgeFeedbackGenerator _edgeConfiguration](self, "_edgeConfiguration");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "animatingThresholdFeedbackUpdateBlock");
        v35 = (void (**)(_QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
        v35[2](v35, v33, a4);

        v30 = (void *)v33;
      }
      -[UIFeedbackGenerator _playFeedback:atLocation:](self, "_playFeedback:atLocation:", v30, x, y);
      self->_playedOvershotThresholdFeedback = 1;
    }
    if ((self->_lastState & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      -[_UIEdgeFeedbackGenerator _edgeConfiguration](self, "_edgeConfiguration");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "animatingMaximumExtentFeedback");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (v37)
        v38 = v14;
      else
        v38 = 0;
      if (v38 == 1)
      {
        -[_UIEdgeFeedbackGenerator _edgeConfiguration](self, "_edgeConfiguration");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "animatingMaximumExtentFeedbackUpdateBlock");
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (v40)
        {
          v41 = objc_msgSend(v37, "copy");

          -[_UIEdgeFeedbackGenerator _edgeConfiguration](self, "_edgeConfiguration");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "animatingMaximumExtentFeedbackUpdateBlock");
          v43 = (void (**)(_QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
          v43[2](v43, v41, a4);

          v37 = (void *)v41;
        }
        -[UIFeedbackGenerator _playFeedback:atLocation:](self, "_playFeedback:atLocation:", v37, x, y);
      }
      v30 = v37;
    }
    goto LABEL_49;
  }
}

- (id)_stats_key
{
  return CFSTR("edge");
}

- (double)distance
{
  return self->_distance;
}

- (int64_t)axis
{
  return self->_axis;
}

- (double)extentBeyondDistance
{
  return self->_extentBeyondDistance;
}

- (void)setExtentBeyondDistance:(double)a3
{
  self->_extentBeyondDistance = a3;
}

- (BOOL)_isCloseToEdge
{
  return self->_closeToEdge;
}

- (double)_closeToEdgeUpdateTime
{
  return self->_closeToEdgeUpdateTime;
}

- (void)_setCloseToEdgeUpdateTime:(double)a3
{
  self->_closeToEdgeUpdateTime = a3;
}

- (double)_value
{
  return self->_value;
}

- (void)_setValue:(double)a3
{
  self->_value = a3;
}

- (double)_previousValue
{
  return self->_previousValue;
}

- (void)_setPreviousValue:(double)a3
{
  self->_previousValue = a3;
}

- (int64_t)_lastState
{
  return self->_lastState;
}

- (void)_setLastState:(int64_t)a3
{
  self->_lastState = a3;
}

- (double)_lastValueUpdateTime
{
  return self->_lastValueUpdateTime;
}

- (void)_setLastValueUpdateTime:(double)a3
{
  self->_lastValueUpdateTime = a3;
}

- (double)_previousValueUpdateTime
{
  return self->_previousValueUpdateTime;
}

- (void)_setPreviousValueUpdateTime:(double)a3
{
  self->_previousValueUpdateTime = a3;
}

- (double)_velocity
{
  return self->_velocity;
}

- (void)_setVelocity:(double)a3
{
  self->_velocity = a3;
}

- (_UIFeedbackContinuousPlayable)_playingContinuousFeedback
{
  return self->_playingContinuousFeedback;
}

- (void)_setPlayingContinuousFeedback:(id)a3
{
  objc_storeStrong((id *)&self->_playingContinuousFeedback, a3);
}

- (int64_t)_state
{
  return self->_state;
}

@end
