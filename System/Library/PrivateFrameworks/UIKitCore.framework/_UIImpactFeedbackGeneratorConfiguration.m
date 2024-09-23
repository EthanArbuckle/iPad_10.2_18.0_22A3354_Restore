@implementation _UIImpactFeedbackGeneratorConfiguration

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

+ (id)lightConfiguration
{
  return (id)objc_msgSend(a1, "_configurationWithKey:preparationBlock:", CFSTR("light"), &__block_literal_global_47_0);
}

- (int64_t)requiredSupportLevel
{
  return 2;
}

+ (id)refreshConfiguration
{
  void *v2;

  objc_msgSend(a1, "_configurationWithKey:requiredSupportLevel:preparationBlock:", CFSTR("refresh"), 2, &__block_literal_global_59_0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRequiredPeripheralSupportLevel:", 1);
  return v2;
}

+ (id)rigidConfiguration
{
  return (id)objc_msgSend(a1, "_configurationWithKey:preparationBlock:", CFSTR("rigid"), &__block_literal_global_56_0);
}

+ (id)strongConfiguration
{
  return (id)objc_msgSend(a1, "_configurationWithKey:preparationBlock:", CFSTR("heavy"), &__block_literal_global_50_0);
}

+ (id)defaultConfiguration
{
  return (id)objc_msgSend(a1, "_configurationWithKey:preparationBlock:", CFSTR("medium"), &__block_literal_global_180);
}

- (id)feedbackKeyPaths
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIImpactFeedbackGeneratorConfiguration;
  -[_UIFeedbackGeneratorConfiguration feedbackKeyPaths](&v6, sel_feedbackKeyPaths);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_feedback);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hidFeedbackPatternName, 0);
  objc_storeStrong(&self->_feedbackUpdateBlock, 0);
  objc_storeStrong((id *)&self->_feedback, 0);
}

+ (id)softConfiguration
{
  return (id)objc_msgSend(a1, "_configurationWithKey:preparationBlock:", CFSTR("soft"), &__block_literal_global_53);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIImpactFeedbackGeneratorConfiguration;
  v4 = -[_UIFeedbackGeneratorConfiguration copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = objc_msgSend(self->_feedbackUpdateBlock, "copy");
  v6 = (void *)v4[12];
  v4[12] = v5;

  v4[13] = *(_QWORD *)&self->_minimumInterval;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  double *v4;
  BOOL v5;
  objc_super v7;

  v4 = (double *)a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIImpactFeedbackGeneratorConfiguration;
  if (-[_UIFeedbackGeneratorConfiguration isEqual:](&v7, sel_isEqual_, v4))
    v5 = self->_minimumInterval == v4[13];
  else
    v5 = 0;

  return v5;
}

- (id)hidFeedbackPatternNameKeyPaths
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIImpactFeedbackGeneratorConfiguration;
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
  -[_UIImpactFeedbackGeneratorConfiguration hidFeedbackPatternName](self, "hidFeedbackPatternName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    +[_UIFeedbackBackBoardHIDPattern feedbackPatternWithName:deviceType:senderID:](_UIFeedbackBackBoardHIDPattern, "feedbackPatternWithName:deviceType:senderID:", v9, a4, a5);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)_UIImpactFeedbackGeneratorConfiguration;
    -[_UIFeedbackGeneratorConfiguration _alternateFeedback:forDevice:senderID:](&v13, sel__alternateFeedback_forDevice_senderID_, v8, a4, a5);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;

  return v11;
}

- (void)setFeedbackUpdateBlock:(id)a3
{
  id v4;
  void *v5;
  id feedbackUpdateBlock;

  v4 = a3;
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  v5 = _Block_copy(v4);

  feedbackUpdateBlock = self->_feedbackUpdateBlock;
  self->_feedbackUpdateBlock = v5;

}

- (id)feedbackUpdateBlock
{
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  return _Block_copy(self->_feedbackUpdateBlock);
}

- (NSString)hidFeedbackPatternName
{
  return self->_hidFeedbackPatternName;
}

- (void)setHidFeedbackPatternName:(id)a3
{
  objc_storeStrong((id *)&self->_hidFeedbackPatternName, a3);
}

@end
