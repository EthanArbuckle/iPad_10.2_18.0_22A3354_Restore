@implementation UISelectionFeedbackGenerator

+ (Class)_configurationClass
{
  return (Class)objc_opt_class();
}

- (void)userInteractionStartedAtLocation:(CGPoint)a3
{
  -[UIFeedbackGenerator activateWithCompletionBlock:](self, "activateWithCompletionBlock:", 0, a3.x, a3.y);
}

- (void)userInteractionStarted
{
  -[UISelectionFeedbackGenerator userInteractionStartedAtLocation:](self, "userInteractionStartedAtLocation:", 1.79769313e308, 1.79769313e308);
}

- (void)userInteractionEndedAtLocation:(CGPoint)a3
{
  -[UIFeedbackGenerator _clientDidUpdateGeneratorWithSelector:](self, "_clientDidUpdateGeneratorWithSelector:", a2, a3.x, a3.y);
  -[UIFeedbackGenerator deactivate](self, "deactivate");
}

- (void)userInteractionEnded
{
  -[UISelectionFeedbackGenerator userInteractionEndedAtLocation:](self, "userInteractionEndedAtLocation:", 1.79769313e308, 1.79769313e308);
}

- (void)userInteractionCancelledAtLocation:(CGPoint)a3
{
  -[UIFeedbackGenerator _clientDidUpdateGeneratorWithSelector:](self, "_clientDidUpdateGeneratorWithSelector:", a2, a3.x, a3.y);
  -[UIFeedbackGenerator deactivate](self, "deactivate");
}

- (void)userInteractionCancelled
{
  -[UISelectionFeedbackGenerator userInteractionCancelledAtLocation:](self, "userInteractionCancelledAtLocation:", 1.79769313e308, 1.79769313e308);
}

- (void)_deactivated
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UISelectionFeedbackGenerator;
  -[UIFeedbackGenerator _deactivated](&v3, sel__deactivated);
  self->_lastSelectionChangeTime = 0.0;
}

- (void)selectionChanged
{
  -[UISelectionFeedbackGenerator selectionChangedAtLocation:](self, "selectionChangedAtLocation:", 1.79769313e308, 1.79769313e308);
}

- (void)selectionChangedAtLocation:(CGPoint)a3
{
  CFTimeInterval v4;
  double lastSelectionChangeTime;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  void *v34;
  double v35;
  void *v36;
  id v37;

  -[UIFeedbackGenerator _clientDidUpdateGeneratorWithSelector:](self, "_clientDidUpdateGeneratorWithSelector:", a2);
  v4 = CACurrentMediaTime();
  lastSelectionChangeTime = self->_lastSelectionChangeTime;
  v6 = 1.0 / (v4 - lastSelectionChangeTime);
  if (v4 - lastSelectionChangeTime <= 0.0)
    v6 = 0.0;
  if (lastSelectionChangeTime > 0.0)
    v7 = v6;
  else
    v7 = 0.0;
  self->_lastSelectionChangeTime = v4;
  -[UISelectionFeedbackGenerator _selectionConfiguration](self, "_selectionConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "feedback");
  v37 = (id)objc_claimAutoreleasedReturnValue();

  -[UISelectionFeedbackGenerator _selectionConfiguration](self, "_selectionConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "maxSpeed");
  v11 = v10;

  if (v11 > 0.0)
  {
    -[UISelectionFeedbackGenerator _selectionConfiguration](self, "_selectionConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "maxSpeed");
    v14 = v7 / v13;

    v15 = fmin(fmax(v14, 0.0), 1.0);
    -[UISelectionFeedbackGenerator _selectionConfiguration](self, "_selectionConfiguration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "slowAudioVolume");
    v18 = v17;
    -[UISelectionFeedbackGenerator _selectionConfiguration](self, "_selectionConfiguration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "fastAudioVolume");
    v21 = v20;
    -[UISelectionFeedbackGenerator _selectionConfiguration](self, "_selectionConfiguration");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "slowAudioVolume");
    *(float *)&v18 = v18 + v15 * (v21 - v23);
    objc_msgSend(v37, "audioParameters");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v25) = LODWORD(v18);
    objc_msgSend(v24, "setVolume:", v25);

    -[UISelectionFeedbackGenerator _selectionConfiguration](self, "_selectionConfiguration");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "slowHapticVolume");
    v28 = v27;
    -[UISelectionFeedbackGenerator _selectionConfiguration](self, "_selectionConfiguration");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "fastHapticVolume");
    v31 = v30;
    -[UISelectionFeedbackGenerator _selectionConfiguration](self, "_selectionConfiguration");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "slowHapticVolume");
    *(float *)&v28 = v28 + v15 * (v31 - v33);
    objc_msgSend(v37, "hapticParameters");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v35) = LODWORD(v28);
    objc_msgSend(v34, "setVolume:", v35);

  }
  -[UISelectionFeedbackGenerator _selectionConfiguration](self, "_selectionConfiguration");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "minimumInterval");
  -[UIFeedbackGenerator _playFeedback:withMinimumIntervalPassed:since:prefersRegularPace:atLocation:](self, "_playFeedback:withMinimumIntervalPassed:since:prefersRegularPace:atLocation:", v37, &_playFeedbackWithSpeed_atLocation____lastTime, 1);

}

- (id)_stats_key
{
  return CFSTR("selection");
}

- (double)lastSelectionChangeTime
{
  return self->_lastSelectionChangeTime;
}

- (void)setLastSelectionChangeTime:(double)a3
{
  self->_lastSelectionChangeTime = a3;
}

@end
