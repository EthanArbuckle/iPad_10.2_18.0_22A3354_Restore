@implementation _UIStatesFeedbackGenerator

+ (Class)_configurationClass
{
  return (Class)objc_opt_class();
}

- (_UIStatesFeedbackGenerator)initWithConfiguration:(id)a3 view:(id)a4
{
  _UIStatesFeedbackGenerator *v4;
  _UIStatesFeedbackGenerator *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIStatesFeedbackGenerator;
  v4 = -[UIFeedbackGenerator initWithConfiguration:view:](&v9, sel_initWithConfiguration_view_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[_UIStatesFeedbackGenerator _statesConfiguration](v4, "_statesConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "initialState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIStatesFeedbackGenerator setCurrentState:](v5, "setCurrentState:", v7);

  }
  return v5;
}

- (void)setCurrentState:(id)a3
{
  objc_storeStrong((id *)&self->_currentState, a3);
}

- (_UIStatesFeedbackGenerator)initWithStyle:(int64_t)a3 view:(id)a4
{
  id v6;
  __objc2_class **v7;
  void *v8;
  _UIStatesFeedbackGenerator *v9;
  objc_super v11;

  v6 = a4;
  if (a3)
  {
    if (a3 != 1)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v7 = off_1E167CE70;
  }
  else
  {
    v7 = off_1E167CE68;
  }
  -[__objc2_class defaultConfiguration](*v7, "defaultConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  v11.receiver = self;
  v11.super_class = (Class)_UIStatesFeedbackGenerator;
  v9 = -[UIFeedbackGenerator initWithConfiguration:view:](&v11, sel_initWithConfiguration_view_, v8, v6);

  return v9;
}

- (_UIStatesFeedbackGenerator)initWithStyle:(int64_t)a3
{
  return -[_UIStatesFeedbackGenerator initWithStyle:view:](self, "initWithStyle:view:", a3, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playingContinuousFeedback, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
}

- (id)_configurationFromState:(id)a3 toState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v6 = a3;
  v7 = a4;
  -[_UIStatesFeedbackGenerator _statesConfiguration](self, "_statesConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stateChangeConfigurations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[_UIStatesFeedbackGeneratorConfiguration keyFromState:toState:](_UIStatesFeedbackGeneratorConfiguration, "keyFromState:toState:", v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    +[_UIStatesFeedbackGeneratorConfiguration keyFromState:toState:](_UIStatesFeedbackGeneratorConfiguration, "keyFromState:toState:", 0, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "objectForKeyedSubscript:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v12 = (void *)v14;
      v10 = v13;
      goto LABEL_5;
    }
    +[_UIStatesFeedbackGeneratorConfiguration keyFromState:toState:](_UIStatesFeedbackGeneratorConfiguration, "keyFromState:toState:", v6, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v11;
LABEL_5:

  return v12;
}

- (void)transitionToState:(id)a3 updated:(double)a4 atLocation:(CGPoint)a5
{
  double y;
  double x;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  _UIFeedbackContinuousPlayable *playingContinuousFeedback;
  _UIFeedbackContinuousPlayable *v16;
  _UIFeedbackContinuousPlayable *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  long double v24;
  double v25;
  double v26;
  void *v27;
  float v28;
  double v29;
  double v30;
  float v31;
  void *v32;
  double v33;
  double v34;
  id v35;

  y = a5.y;
  x = a5.x;
  v35 = a3;
  -[UIFeedbackGenerator _clientDidUpdateGeneratorWithSelector:](self, "_clientDidUpdateGeneratorWithSelector:", a2);
  if (-[UIFeedbackGenerator _isEnabled](self, "_isEnabled"))
  {
    -[_UIStatesFeedbackGenerator currentState](self, "currentState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIStatesFeedbackGenerator _configurationFromState:toState:](self, "_configurationFromState:toState:", v10, v35);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "approachFeedback");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      if (self->_approachActivated)
        goto LABEL_4;
      objc_msgSend(v11, "approachStart");
      if (v34 >= a4)
      {
        self->_approachActivated = 1;
        goto LABEL_18;
      }
      if (self->_approachActivated)
      {
LABEL_4:
        objc_msgSend(v11, "approachStart");
        if (v13 <= a4)
        {
          objc_msgSend(v11, "approachEnd");
          if (v14 >= a4)
          {
            playingContinuousFeedback = self->_playingContinuousFeedback;
            if (!playingContinuousFeedback)
            {
              v16 = (_UIFeedbackContinuousPlayable *)objc_msgSend(v12, "copy");
              v17 = self->_playingContinuousFeedback;
              self->_playingContinuousFeedback = v16;

            }
            objc_msgSend(v11, "approachEnd");
            v19 = v18;
            objc_msgSend(v11, "approachStart");
            v21 = v19 - v20;
            objc_msgSend(v11, "approachStart");
            v23 = (a4 - v22) / v21;
            objc_msgSend(v11, "approachCurvature");
            if (v23 != 0.0)
              v23 = pow(v24, (v23 + -1.0) * 10.0);
            objc_msgSend(v11, "approachVolumeMax");
            v26 = v25;
            objc_msgSend(v12, "hapticParameters");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "volume");
            v29 = v23 * v28;

            if (v26 >= v29)
              v30 = v29;
            else
              v30 = v26;
            v31 = v30;
            -[_UIFeedbackContinuousPlayable hapticParameters](self->_playingContinuousFeedback, "hapticParameters");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(float *)&v33 = v31;
            objc_msgSend(v32, "setVolume:", v33);

            if (!playingContinuousFeedback)
              -[UIFeedbackGenerator _playFeedback:atLocation:](self, "_playFeedback:atLocation:", self->_playingContinuousFeedback, x, y);
            goto LABEL_18;
          }
        }
      }
    }
    -[_UIStatesFeedbackGenerator _stopPlayingContinuousFeedback](self, "_stopPlayingContinuousFeedback");
LABEL_18:

  }
}

- (void)transitionToState:(id)a3 ended:(BOOL)a4 atLocation:(CGPoint)a5
{
  double y;
  double x;
  _BOOL4 v7;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  y = a5.y;
  x = a5.x;
  v7 = a4;
  v13 = a3;
  -[UIFeedbackGenerator _clientDidUpdateGeneratorWithSelector:](self, "_clientDidUpdateGeneratorWithSelector:", a2);
  if (-[UIFeedbackGenerator _isEnabled](self, "_isEnabled"))
  {
    -[_UIStatesFeedbackGenerator _stopPlayingContinuousFeedback](self, "_stopPlayingContinuousFeedback");
    if (v7)
    {
      -[_UIStatesFeedbackGenerator currentState](self, "currentState");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIStatesFeedbackGenerator _configurationFromState:toState:](self, "_configurationFromState:toState:", v10, v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "thresholdFeedback");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIFeedbackGenerator _playFeedback:atLocation:](self, "_playFeedback:atLocation:", v12, x, y);

      -[_UIStatesFeedbackGenerator setCurrentState:](self, "setCurrentState:", v13);
    }
  }

}

- (void)transitionToState:(id)a3 updated:(double)a4
{
  -[_UIStatesFeedbackGenerator transitionToState:updated:atLocation:](self, "transitionToState:updated:atLocation:", a3, a4, 1.79769313e308, 1.79769313e308);
}

- (void)transitionToState:(id)a3 ended:(BOOL)a4
{
  -[_UIStatesFeedbackGenerator transitionToState:ended:atLocation:](self, "transitionToState:ended:atLocation:", a3, a4, 1.79769313e308, 1.79769313e308);
}

- (void)_stopPlayingContinuousFeedback
{
  _UIFeedbackContinuousPlayable *playingContinuousFeedback;

  playingContinuousFeedback = self->_playingContinuousFeedback;
  if (playingContinuousFeedback)
  {
    -[_UIFeedbackContinuousPlayable stop](playingContinuousFeedback, "stop");
    -[_UIStatesFeedbackGenerator setPlayingContinuousFeedback:](self, "setPlayingContinuousFeedback:", 0);
    self->_approachActivated = 0;
  }
}

- (id)_stats_key
{
  return CFSTR("states");
}

- (NSString)currentState
{
  return self->_currentState;
}

- (BOOL)_approachActivated
{
  return self->_approachActivated;
}

- (void)_setApproachActivated:(BOOL)a3
{
  self->_approachActivated = a3;
}

- (_UIFeedbackContinuousPlayable)playingContinuousFeedback
{
  return self->_playingContinuousFeedback;
}

- (void)setPlayingContinuousFeedback:(id)a3
{
  objc_storeStrong((id *)&self->_playingContinuousFeedback, a3);
}

@end
