@implementation _UITapticEngine

- (_UITapticEngine)init
{
  _UITapticEngine *v2;
  _UIStatesFeedbackGenerator *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UITapticEngine;
  v2 = -[_UITapticEngine init](&v5, sel_init);
  v3 = -[_UIStatesFeedbackGenerator initWithStyle:]([_UIStatesFeedbackGenerator alloc], "initWithStyle:", 0);
  -[_UITapticEngine setFeedbackGenerator:](v2, "setFeedbackGenerator:", v3);

  return v2;
}

- (void)prepareUsingFeedback:(int64_t)a3
{
  _QWORD v5[6];

  if (pthread_main_np() == 1)
  {
    if (!self->_feedbackActivated)
    {
      -[UIFeedbackGenerator activateWithCompletionBlock:](self->_feedbackGenerator, "activateWithCompletionBlock:", 0);
      self->_feedbackActivated = 1;
    }
  }
  else
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __40___UITapticEngine_prepareUsingFeedback___block_invoke;
    v5[3] = &unk_1E16B1888;
    v5[4] = self;
    v5[5] = a3;
    dispatch_async(MEMORY[0x1E0C80D38], v5);
  }
}

- (void)endUsingFeedback:(int64_t)a3
{
  _QWORD v5[6];

  if (pthread_main_np() == 1)
  {
    if (self->_feedbackActivated)
    {
      -[UIFeedbackGenerator deactivate](self->_feedbackGenerator, "deactivate");
      self->_feedbackActivated = 0;
    }
  }
  else
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __36___UITapticEngine_endUsingFeedback___block_invoke;
    v5[3] = &unk_1E16B1888;
    v5[4] = self;
    v5[5] = a3;
    dispatch_async(MEMORY[0x1E0C80D38], v5);
  }
}

- (void)actuateFeedback:(int64_t)a3
{
  void *v5;
  _UIStatesFeedbackGenerator *feedbackGenerator;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD block[6];

  if (pthread_main_np() == 1)
  {
    -[_UITapticEngine _stateForFeedback:](self, "_stateForFeedback:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    feedbackGenerator = self->_feedbackGenerator;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __35___UITapticEngine_actuateFeedback___block_invoke_2;
    v8[3] = &unk_1E16B2218;
    v8[4] = self;
    v9 = v5;
    v7 = v5;
    -[UIFeedbackGenerator activateWithCompletionBlock:](feedbackGenerator, "activateWithCompletionBlock:", v8);

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35___UITapticEngine_actuateFeedback___block_invoke;
    block[3] = &unk_1E16B1888;
    block[4] = self;
    block[5] = a3;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

- (id)_stateForFeedback:(int64_t)a3
{
  __CFString *v3;
  __CFString **v4;

  v3 = 0;
  v4 = _UIStatesFeedbackGeneratorForcePresentationStatePreview;
  if (a3 <= 1)
  {
    if (a3)
    {
      if (a3 != 1)
        return v3;
      goto LABEL_8;
    }
LABEL_10:
    v3 = *v4;
    return v3;
  }
  switch(a3)
  {
    case 2:
      v4 = _UIStatesFeedbackGeneratorForcePresentationStateCancel;
      goto LABEL_10;
    case 1001:
      goto LABEL_10;
    case 1002:
LABEL_8:
      v4 = _UIStatesFeedbackGeneratorForcePresentationStateCommit;
      goto LABEL_10;
  }
  return v3;
}

- (_UIStatesFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackGenerator, a3);
}

- (BOOL)feedbackActivated
{
  return self->_feedbackActivated;
}

- (void)setFeedbackActivated:(BOOL)a3
{
  self->_feedbackActivated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
}

@end
