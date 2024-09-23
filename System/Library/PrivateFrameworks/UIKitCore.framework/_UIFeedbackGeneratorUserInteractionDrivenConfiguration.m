@implementation _UIFeedbackGeneratorUserInteractionDrivenConfiguration

- (void)setInteractionEndedFeedback:(id)a3
{
  _UIFeedbackDiscretePlayable *v4;
  _UIFeedbackDiscretePlayable *interactionEndedFeedback;

  v4 = (_UIFeedbackDiscretePlayable *)a3;
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  interactionEndedFeedback = self->_interactionEndedFeedback;
  self->_interactionEndedFeedback = v4;

}

- (void)setInteractionStartedFeedback:(id)a3
{
  _UIFeedbackDiscretePlayable *v4;
  _UIFeedbackDiscretePlayable *interactionStartedFeedback;

  v4 = (_UIFeedbackDiscretePlayable *)a3;
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  interactionStartedFeedback = self->_interactionStartedFeedback;
  self->_interactionStartedFeedback = v4;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionCancelledFeedback, 0);
  objc_storeStrong((id *)&self->_interactionEndedFeedback, 0);
  objc_storeStrong((id *)&self->_interactionStartedFeedback, 0);
}

- (id)feedbackKeyPaths
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)_UIFeedbackGeneratorUserInteractionDrivenConfiguration;
  -[_UIFeedbackGeneratorConfiguration feedbackKeyPaths](&v9, sel_feedbackKeyPaths);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_interactionStartedFeedback);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  NSStringFromSelector(sel_interactionEndedFeedback);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  NSStringFromSelector(sel_interactionCancelledFeedback);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (_UIFeedbackDiscretePlayable)interactionStartedFeedback
{
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  return self->_interactionStartedFeedback;
}

- (_UIFeedbackDiscretePlayable)interactionEndedFeedback
{
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  return self->_interactionEndedFeedback;
}

- (void)setInteractionCancelledFeedback:(id)a3
{
  _UIFeedbackDiscretePlayable *v4;
  _UIFeedbackDiscretePlayable *interactionCancelledFeedback;

  v4 = (_UIFeedbackDiscretePlayable *)a3;
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  interactionCancelledFeedback = self->_interactionCancelledFeedback;
  self->_interactionCancelledFeedback = v4;

}

- (_UIFeedbackDiscretePlayable)interactionCancelledFeedback
{
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  return self->_interactionCancelledFeedback;
}

@end
