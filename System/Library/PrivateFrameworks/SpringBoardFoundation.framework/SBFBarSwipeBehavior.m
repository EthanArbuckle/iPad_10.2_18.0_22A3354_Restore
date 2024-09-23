@implementation SBFBarSwipeBehavior

- (SBFBarSwipeBehavior)initWithGrabberView:(id)a3 settleAffordanceAnimationBehaviorDescription:(id)a4
{
  id v8;
  id v9;
  SBFBarSwipeBehavior *v10;
  SBFBarSwipeBehavior *v11;
  void *v13;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFBarSwipeBehavior.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("grabberView"));

  }
  v14.receiver = self;
  v14.super_class = (Class)SBFBarSwipeBehavior;
  v10 = -[SBFBarSwipeBehavior init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_grabberView, a3);
    objc_storeStrong((id *)&v11->_settleAffordanceAnimationBehaviorDescription, a4);
    v11->_feedbackType = 1010;
    -[SBFBarSwipeBehavior _createFeedbackGenerator](v11, "_createFeedbackGenerator");
  }

  return v11;
}

- (void)setFeedbackType:(int64_t)a3
{
  if (self->_feedbackType != a3)
  {
    self->_feedbackType = a3;
    -[SBFBarSwipeBehavior _createFeedbackGenerator](self, "_createFeedbackGenerator");
  }
}

- (void)barSwipeInteractionBegan:(id)a3
{
  self->_didFireAction = 0;
  -[UINotificationFeedbackGenerator prepare](self->_dismissalFeedbackGenerator, "prepare", a3);
}

- (void)barSwipeInteractionChanged:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  v4 = a3;
  -[SBFBarSwipeBehavior _grabberViewContainerView](self, "_grabberViewContainerView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "translationInView:");
  v6 = v5;
  v8 = v7;

  -[SBFBarSwipeBehavior _progressWithTranslation:liftoffVelocity:](self, "_progressWithTranslation:liftoffVelocity:", v6, v8, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  -[SBFBarSwipeBehavior _offsetGrabberForProgress:](self, "_offsetGrabberForProgress:");
  if (BSFloatGreaterThanOrEqualToFloat())
    -[SBFBarSwipeBehavior _fireAction](self, "_fireAction");

}

- (void)barSwipeInteractionEnded:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;

  v4 = a3;
  -[SBFBarSwipeBehavior _grabberViewContainerView](self, "_grabberViewContainerView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "translationInView:", v13);
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "velocityInView:", v13);
  v10 = v9;
  v12 = v11;

  -[SBFBarSwipeBehavior _progressWithTranslation:liftoffVelocity:](self, "_progressWithTranslation:liftoffVelocity:", v6, v8, v10, v12);
  if (BSFloatGreaterThanOrEqualToFloat())
    -[SBFBarSwipeBehavior _fireAction](self, "_fireAction");
  -[SBFBarSwipeBehavior _settleGrabber](self, "_settleGrabber");

}

- (double)_progressWithTranslation:(CGPoint)a3 liftoffVelocity:(CGPoint)a4
{
  double result;

  BSIntervalMap();
  return result;
}

- (id)_settleAffordanceAnimationBehaviorDescription
{
  UIViewSpringAnimationBehaviorDescribing *settleAffordanceAnimationBehaviorDescription;
  SBFFluidBehaviorSettings *v4;
  UIViewSpringAnimationBehaviorDescribing *v5;

  settleAffordanceAnimationBehaviorDescription = self->_settleAffordanceAnimationBehaviorDescription;
  if (!settleAffordanceAnimationBehaviorDescription)
  {
    v4 = objc_alloc_init(SBFFluidBehaviorSettings);
    -[SBFFluidBehaviorSettings setDefaultValues](v4, "setDefaultValues");
    -[SBFFluidBehaviorSettings setDampingRatio:](v4, "setDampingRatio:", 0.471);
    -[SBFFluidBehaviorSettings setResponse:](v4, "setResponse:", 0.299);
    v5 = self->_settleAffordanceAnimationBehaviorDescription;
    self->_settleAffordanceAnimationBehaviorDescription = (UIViewSpringAnimationBehaviorDescribing *)v4;

    settleAffordanceAnimationBehaviorDescription = self->_settleAffordanceAnimationBehaviorDescription;
  }
  return settleAffordanceAnimationBehaviorDescription;
}

- (id)_grabberViewContainerView
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(WeakRetained, "barSwipeBehaviorGrabberViewContainer:", self),
        (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[UIView superview](self->_grabberView, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (void)_settleGrabber
{
  void *v3;
  _QWORD v4[5];

  -[SBFBarSwipeBehavior _settleAffordanceAnimationBehaviorDescription](self, "_settleAffordanceAnimationBehaviorDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__SBFBarSwipeBehavior__settleGrabber__block_invoke;
  v4[3] = &unk_1E200E188;
  v4[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "_animateUsingSpringBehavior:tracking:animations:completion:", v3, 0, v4, 0);

}

uint64_t __37__SBFBarSwipeBehavior__settleGrabber__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setGrabberAdditionalEdgeSpacing:", 0.0);
}

- (void)_offsetGrabberForProgress:(double)a3
{
  -[SBFBarSwipeBehavior _setGrabberAdditionalEdgeSpacing:](self, "_setGrabberAdditionalEdgeSpacing:", a3 * 15.0 + 0.0);
}

- (void)_setGrabberAdditionalEdgeSpacing:(double)a3
{
  id WeakRetained;

  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_grabberViewAdditionalEdgeSpacing = a3;
    -[UIView setNeedsLayout](self->_grabberView, "setNeedsLayout");
    -[UIView layoutIfNeeded](self->_grabberView, "layoutIfNeeded");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "barSwipeBehavior:didUpdateAdditionalEdgeSpacing:", self, self->_grabberViewAdditionalEdgeSpacing);

  }
}

- (void)_createFeedbackGenerator
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UINotificationFeedbackGenerator *v8;
  UINotificationFeedbackGenerator *dismissalFeedbackGenerator;
  id v10;

  v3 = objc_alloc(MEMORY[0x1E0CEA7D0]);
  v4 = (void *)MEMORY[0x1E0CEAE28];
  v5 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_feedbackType);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithObject:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "privateConfigurationForTypes:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (UINotificationFeedbackGenerator *)objc_msgSend(v3, "initWithConfiguration:", v7);
  dismissalFeedbackGenerator = self->_dismissalFeedbackGenerator;
  self->_dismissalFeedbackGenerator = v8;

}

- (void)_fireAction
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_18AB69000, log, OS_LOG_TYPE_ERROR, "%{public}@: Delegate (%{public}@) doesn't implement required method 'barSwipeBehaviorActionPerformed:'", (uint8_t *)&v3, 0x16u);
}

- (UIView)grabberView
{
  return self->_grabberView;
}

- (double)grabberViewAdditionalEdgeSpacing
{
  return self->_grabberViewAdditionalEdgeSpacing;
}

- (UIViewSpringAnimationBehaviorDescribing)settleAffordanceAnimationBehaviorDescription
{
  return self->_settleAffordanceAnimationBehaviorDescription;
}

- (SBFBarSwipeBehaviorDelegate)delegate
{
  return (SBFBarSwipeBehaviorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)feedbackType
{
  return self->_feedbackType;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_grabberView, 0);
  objc_storeStrong((id *)&self->_dismissalFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_settleAffordanceAnimationBehaviorDescription, 0);
}

@end
