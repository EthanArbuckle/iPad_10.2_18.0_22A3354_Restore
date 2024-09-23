@implementation _UISelectionFeedbackGeneratorConfiguration

- (void)setMinimumInterval:(double)a3
{
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  self->_minimumInterval = a3;
}

- (void)setFeedback:(id)a3
{
  _UIFeedbackDiscretePlayable *v4;
  _UIFeedbackDiscretePlayable *feedback;

  v4 = (_UIFeedbackDiscretePlayable *)a3;
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  feedback = self->_feedback;
  self->_feedback = v4;

}

- (void)setHidFeedbackPatternName:(id)a3
{
  objc_storeStrong((id *)&self->_hidFeedbackPatternName, a3);
}

+ (id)pageControlConfiguration
{
  return (id)objc_msgSend(a1, "_configurationWithKey:requiredSupportLevel:preparationBlock:", CFSTR("pageControl"), 2, &__block_literal_global_43);
}

- (int64_t)requiredPeripheralSupportLevel
{
  return 1;
}

+ (id)lightConfiguration
{
  return (id)objc_msgSend(a1, "_configurationWithKey:requiredSupportLevel:preparationBlock:", CFSTR("light"), 2, &__block_literal_global_33);
}

+ (id)strongConfiguration
{
  return (id)objc_msgSend(a1, "_configurationWithKey:requiredSupportLevel:preparationBlock:", CFSTR("strong"), 2, &__block_literal_global_36_0);
}

+ (id)defaultConfiguration
{
  return (id)objc_msgSend(a1, "_configurationWithKey:requiredSupportLevel:preparationBlock:", CFSTR("default"), 2, &__block_literal_global_182);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hidFeedbackPatternName, 0);
  objc_storeStrong((id *)&self->_feedback, 0);
}

+ (id)pickerConfiguration
{
  return (id)objc_msgSend(a1, "_configurationWithKey:requiredSupportLevel:preparationBlock:", CFSTR("picker"), 0, &__block_literal_global_39);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UISelectionFeedbackGeneratorConfiguration;
  result = -[_UIFeedbackGeneratorConfiguration copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_QWORD *)result + 15) = *(_QWORD *)&self->_minimumInterval;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  double *v4;
  BOOL v5;
  objc_super v7;

  v4 = (double *)a3;
  v7.receiver = self;
  v7.super_class = (Class)_UISelectionFeedbackGeneratorConfiguration;
  if (-[_UIFeedbackGeneratorConfiguration isEqual:](&v7, sel_isEqual_, v4))
    v5 = self->_minimumInterval == v4[15];
  else
    v5 = 0;

  return v5;
}

- (id)feedbackKeyPaths
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UISelectionFeedbackGeneratorConfiguration;
  -[_UIFeedbackGeneratorUserInteractionDrivenConfiguration feedbackKeyPaths](&v6, sel_feedbackKeyPaths);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_feedback);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)hidFeedbackPatternNameKeyPaths
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UISelectionFeedbackGeneratorConfiguration;
  -[_UIFeedbackGeneratorConfiguration hidFeedbackPatternNameKeyPaths](&v6, sel_hidFeedbackPatternNameKeyPaths);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_hidFeedbackPatternName);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_alternateFeedback:(id)a3 forDevice:(int64_t)a4 senderID:(unint64_t)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v8 = a3;
  -[_UISelectionFeedbackGeneratorConfiguration hidFeedbackPatternName](self, "hidFeedbackPatternName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    +[_UIFeedbackBackBoardHIDPattern feedbackPatternWithName:deviceType:senderID:](_UIFeedbackBackBoardHIDPattern, "feedbackPatternWithName:deviceType:senderID:", v9, a4, a5);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)_UISelectionFeedbackGeneratorConfiguration;
    -[_UIFeedbackGeneratorConfiguration _alternateFeedback:forDevice:senderID:](&v13, sel__alternateFeedback_forDevice_senderID_, v8, a4, a5);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;

  return v11;
}

- (_UIFeedbackDiscretePlayable)feedback
{
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  return self->_feedback;
}

- (double)minimumInterval
{
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  return self->_minimumInterval;
}

- (NSString)hidFeedbackPatternName
{
  return self->_hidFeedbackPatternName;
}

- (double)maxSpeed
{
  return self->_maxSpeed;
}

- (void)setMaxSpeed:(double)a3
{
  self->_maxSpeed = a3;
}

- (double)slowAudioVolume
{
  return self->_slowAudioVolume;
}

- (void)setSlowAudioVolume:(double)a3
{
  self->_slowAudioVolume = a3;
}

- (double)fastAudioVolume
{
  return self->_fastAudioVolume;
}

- (void)setFastAudioVolume:(double)a3
{
  self->_fastAudioVolume = a3;
}

- (double)slowHapticVolume
{
  return self->_slowHapticVolume;
}

- (void)setSlowHapticVolume:(double)a3
{
  self->_slowHapticVolume = a3;
}

- (double)fastHapticVolume
{
  return self->_fastHapticVolume;
}

- (void)setFastHapticVolume:(double)a3
{
  self->_fastHapticVolume = a3;
}

@end
