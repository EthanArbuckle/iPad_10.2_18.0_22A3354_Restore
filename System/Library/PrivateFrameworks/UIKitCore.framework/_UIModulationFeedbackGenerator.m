@implementation _UIModulationFeedbackGenerator

+ (Class)_configurationClass
{
  return (Class)objc_opt_class();
}

- (void)valueUpdated:(double)a3
{
  void *v5;
  void (**v6)(_QWORD, _QWORD, double);
  void *v7;
  id v8;

  -[UIFeedbackGenerator _clientDidUpdateGeneratorWithSelector:](self, "_clientDidUpdateGeneratorWithSelector:", a2);
  -[_UIModulationFeedbackGenerator playingContinuousFeedback](self, "playingContinuousFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_UIModulationFeedbackGenerator _modulationConfiguration](self, "_modulationConfiguration");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "feedbackUpdateBlock");
    v6 = (void (**)(_QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
    -[_UIModulationFeedbackGenerator playingContinuousFeedback](self, "playingContinuousFeedback");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, double))v6)[2](v6, v7, a3);

  }
  else
  {
    self->_currentValue = a3;
  }
}

- (void)activateWithCompletionBlock:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  _UIModulationFeedbackGenerator *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __62___UIModulationFeedbackGenerator_activateWithCompletionBlock___block_invoke;
  v5[3] = &unk_1E16BC218;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)_UIModulationFeedbackGenerator;
  v5[0] = MEMORY[0x1E0C809B0];
  v3 = v7;
  -[UIFeedbackGenerator activateWithCompletionBlock:](&v4, sel_activateWithCompletionBlock_, v5);

}

- (void)activateWithInitialValue:(double)a3 completionBlock:(id)a4
{
  self->_currentValue = a3;
  -[_UIModulationFeedbackGenerator activateWithCompletionBlock:](self, "activateWithCompletionBlock:", a4);
}

- (void)deactivate
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIModulationFeedbackGenerator;
  -[UIFeedbackGenerator deactivate](&v5, sel_deactivate);
  if (!-[UIFeedbackGenerator isActive](self, "isActive"))
  {
    -[_UIModulationFeedbackGenerator playingContinuousFeedback](self, "playingContinuousFeedback");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[_UIModulationFeedbackGenerator playingContinuousFeedback](self, "playingContinuousFeedback");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stop");

      -[_UIModulationFeedbackGenerator setPlayingContinuousFeedback:](self, "setPlayingContinuousFeedback:", 0);
    }
  }
}

- (id)_stats_key
{
  return CFSTR("modulation");
}

- (_UIFeedbackContinuousPlayable)playingContinuousFeedback
{
  return self->_playingContinuousFeedback;
}

- (void)setPlayingContinuousFeedback:(id)a3
{
  objc_storeStrong((id *)&self->_playingContinuousFeedback, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playingContinuousFeedback, 0);
}

@end
