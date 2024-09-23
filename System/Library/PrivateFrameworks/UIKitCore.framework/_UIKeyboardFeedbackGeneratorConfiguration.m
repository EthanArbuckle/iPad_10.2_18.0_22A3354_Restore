@implementation _UIKeyboardFeedbackGeneratorConfiguration

+ (id)defaultConfiguration
{
  return (id)objc_msgSend(a1, "_configurationWithKey:preparationBlock:", CFSTR("default"), &__block_literal_global_187);
}

- (id)feedbackKeyPaths
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIKeyboardFeedbackGeneratorConfiguration;
  -[_UIFeedbackGeneratorConfiguration feedbackKeyPaths](&v6, sel_feedbackKeyPaths);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_feedbacks);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)defaultEnabled
{
  void *v2;
  BOOL v3;

  +[_UIFeedbackPreferences sharedPreferences](_UIFeedbackPreferences, "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "enabledFeedbackTypesForCategory:", 0x1E171F900) & 1;

  return v3;
}

- (void)setFeedbacks:(id)a3
{
  NSDictionary *v4;
  NSDictionary *feedbacks;

  v4 = (NSDictionary *)a3;
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  feedbacks = self->_feedbacks;
  self->_feedbacks = v4;

}

- (NSDictionary)feedbacks
{
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  return self->_feedbacks;
}

- (double)slowTypingTime
{
  return self->_slowTypingTime;
}

- (void)setSlowTypingTime:(double)a3
{
  self->_slowTypingTime = a3;
}

- (double)fastTypingTime
{
  return self->_fastTypingTime;
}

- (void)setFastTypingTime:(double)a3
{
  self->_fastTypingTime = a3;
}

- (double)fastTypingVolumeMultiplier
{
  return self->_fastTypingVolumeMultiplier;
}

- (void)setFastTypingVolumeMultiplier:(double)a3
{
  self->_fastTypingVolumeMultiplier = a3;
}

- (BOOL)scalingForSpeedEnabled
{
  return self->_scalingForSpeedEnabled;
}

- (void)setScalingForSpeedEnabled:(BOOL)a3
{
  self->_scalingForSpeedEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbacks, 0);
}

@end
