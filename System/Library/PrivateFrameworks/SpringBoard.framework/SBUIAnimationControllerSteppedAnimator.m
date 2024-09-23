@implementation SBUIAnimationControllerSteppedAnimator

- (SBUIAnimationControllerSteppedAnimator)initWithAnimationController:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  SBUIAnimationControllerSteppedAnimator *v8;

  v5 = (void *)MEMORY[0x1E0CB3488];
  v6 = a3;
  objc_msgSend(v5, "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIAnimationControllerSteppedAnimator.m"), 17, CFSTR("use the designated initializer"));

  v8 = -[SBUIAnimationControllerSteppedAnimator initWithAnimationController:stepper:](self, "initWithAnimationController:stepper:", v6, 0);
  return v8;
}

- (SBUIAnimationControllerSteppedAnimator)initWithAnimationController:(id)a3 stepper:(id)a4
{
  id v7;
  SBUIAnimationControllerSteppedAnimator *v8;
  SBUIAnimationControllerSteppedAnimator *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBUIAnimationControllerSteppedAnimator;
  v8 = -[SBUIAnimationControllerAnimator initWithAnimationController:](&v11, sel_initWithAnimationController_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_stepper, a4);

  return v9;
}

- (void)updateTransition:(id)a3 withPercentComplete:(double)a4
{
  -[SBAnimationStepper setStepPercentage:](self->_stepper, "setStepPercentage:", a3, a4);
}

- (void)cancelTransition:(id)a3 withCompletionSpeed:(double)a4 completionCurve:(int64_t)a5
{
  void *v6;
  SBAnimationStepper *stepper;
  id v8;
  _QWORD v9[4];
  id v10;

  -[SBUIAnimationControllerAnimator animationController](self, "animationController", a3, a5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_addAuditHistoryItem:", CFSTR("finishSteppingBackwardToStart"));
  stepper = self->_stepper;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __95__SBUIAnimationControllerSteppedAnimator_cancelTransition_withCompletionSpeed_completionCurve___block_invoke;
  v9[3] = &unk_1E8E9E980;
  v10 = v6;
  v8 = v6;
  -[SBAnimationStepper finishSteppingBackwardToStartWithCompletion:](stepper, "finishSteppingBackwardToStartWithCompletion:", v9);

}

uint64_t __95__SBUIAnimationControllerSteppedAnimator_cancelTransition_withCompletionSpeed_completionCurve___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_addAuditHistoryItem:", CFSTR("finishSteppingBackwardToStart didn't complete!"));
  return objc_msgSend(*(id *)(a1 + 32), "_noteAnimationDidFail");
}

- (void)finishInteractiveTransition:(id)a3 withCompletionSpeed:(double)a4 completionCurve:(int64_t)a5
{
  void *v6;
  SBAnimationStepper *stepper;
  id v8;
  _QWORD v9[4];
  id v10;

  -[SBUIAnimationControllerAnimator animationController](self, "animationController", a3, a5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_addAuditHistoryItem:", CFSTR("finishSteppingForwardToEnd"));
  stepper = self->_stepper;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __106__SBUIAnimationControllerSteppedAnimator_finishInteractiveTransition_withCompletionSpeed_completionCurve___block_invoke;
  v9[3] = &unk_1E8E9E980;
  v10 = v6;
  v8 = v6;
  -[SBAnimationStepper finishSteppingForwardToEndWithCompletion:](stepper, "finishSteppingForwardToEndWithCompletion:", v9);

}

uint64_t __106__SBUIAnimationControllerSteppedAnimator_finishInteractiveTransition_withCompletionSpeed_completionCurve___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_addAuditHistoryItem:", CFSTR("finishSteppingForwardToEnd didn't complete!"));
  return objc_msgSend(*(id *)(a1 + 32), "_noteAnimationDidFinish");
}

- (double)percentComplete
{
  void *v2;
  double v3;
  double v4;

  -[SBUIAnimationControllerSteppedAnimator stepper](self, "stepper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stepPercentage");
  v4 = v3;

  return v4;
}

- (SBAnimationStepper)stepper
{
  return self->_stepper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stepper, 0);
}

@end
