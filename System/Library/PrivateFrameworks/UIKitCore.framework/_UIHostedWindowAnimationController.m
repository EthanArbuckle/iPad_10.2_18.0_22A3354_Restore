@implementation _UIHostedWindowAnimationController

- (double)transitionDuration:(id)a3
{
  return self->_duration;
}

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  uint64_t v17;
  id v18;
  id v19;
  void (**v20)(_QWORD);
  id v21;
  id v22;
  void (**v23)(void *, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(id *);
  void *v27;
  _UIHostedWindowAnimationController *v28;
  id v29;
  id v30;
  _QWORD aBlock[4];
  id v32;
  _UIHostedWindowAnimationController *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v4 = a3;
  objc_msgSend(v4, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerForKey:", CFSTR("UITransitionContextToViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finalFrameForViewController:", v6);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[_UIHostedWindowAnimationController transitionDuration:](self, "transitionDuration:", v4);
  v16 = v15;
  v17 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __56___UIHostedWindowAnimationController_animateTransition___block_invoke;
  aBlock[3] = &unk_1E16BDF18;
  v18 = v5;
  v35 = v8;
  v36 = v10;
  v37 = v12;
  v38 = v14;
  v32 = v18;
  v33 = self;
  v19 = v4;
  v34 = v19;
  v20 = (void (**)(_QWORD))_Block_copy(aBlock);
  v24 = v17;
  v25 = 3221225472;
  v26 = __56___UIHostedWindowAnimationController_animateTransition___block_invoke_2;
  v27 = &unk_1E16B2B40;
  v28 = self;
  v21 = v19;
  v29 = v21;
  v22 = v18;
  v30 = v22;
  v23 = (void (**)(void *, uint64_t))_Block_copy(&v24);
  if (objc_msgSend(v21, "isAnimated", v24, v25, v26, v27, v28))
  {
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", objc_msgSend(v21, "_completionCurve") << 16, v20, v23, v16, 0.0);
    objc_msgSend(v21, "_setTransitionIsInFlight:", 1);
  }
  else
  {
    v20[2](v20);
    v23[2](v23, 1);
  }

}

- (id)transitionActions
{
  return self->_transitionActions;
}

- (void)setTransitionActions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_transitionActions, 0);
}

@end
