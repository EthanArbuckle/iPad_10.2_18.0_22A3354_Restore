@implementation _UIModulationFeedbackGeneratorConfiguration

- (int64_t)requiredSupportLevel
{
  return 2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIModulationFeedbackGeneratorConfiguration;
  v4 = -[_UIFeedbackGeneratorConfiguration copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = objc_msgSend(self->_feedbackUpdateBlock, "copy");
  v6 = (void *)v4[12];
  v4[12] = v5;

  return v4;
}

- (id)feedbackKeyPaths
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIModulationFeedbackGeneratorConfiguration;
  -[_UIFeedbackGeneratorConfiguration feedbackKeyPaths](&v6, sel_feedbackKeyPaths);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_feedback);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setFeedback:(id)a3
{
  _UIFeedbackContinuousPlayable *v4;
  _UIFeedbackContinuousPlayable *feedback;

  v4 = (_UIFeedbackContinuousPlayable *)a3;
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  feedback = self->_feedback;
  self->_feedback = v4;

}

- (_UIFeedbackContinuousPlayable)feedback
{
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  return self->_feedback;
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

- (void).cxx_destruct
{
  objc_storeStrong(&self->_feedbackUpdateBlock, 0);
  objc_storeStrong((id *)&self->_feedback, 0);
}

@end
