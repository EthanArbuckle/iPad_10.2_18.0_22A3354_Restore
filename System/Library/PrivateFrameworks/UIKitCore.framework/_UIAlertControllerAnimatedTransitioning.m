@implementation _UIAlertControllerAnimatedTransitioning

- (_UIAlertControllerAnimatedTransitioning)initWithInteractionProgress:(id)a3
{
  id v3;
  _UIAlertControllerAnimatedTransitioning *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIAlertControllerAnimatedTransitioning;
  v3 = a3;
  v4 = -[_UIAlertControllerAnimatedTransitioning init](&v6, sel_init);
  -[_UIAlertControllerAnimatedTransitioning setInteractionProgress:](v4, "setInteractionProgress:", v3, v6.receiver, v6.super_class);

  return v4;
}

- (id)_alertControllerForContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "viewControllerForKey:", CFSTR("UITransitionContextFromViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerForKey:", CFSTR("UITransitionContextToViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[_UIAlertControllerAnimatedTransitioning isPresentation](self, "isPresentation"))
    v7 = v6;
  else
    v7 = v5;
  +[UIAlertController _alertControllerContainedInViewController:](UIAlertController, "_alertControllerContainedInViewController:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (double)transitionDuration:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;

  -[_UIAlertControllerAnimatedTransitioning _alertControllerForContext:](self, "_alertControllerForContext:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_visualStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transitionDurationForPresentation:ofAlertController:", -[_UIAlertControllerAnimatedTransitioning isPresentation](self, "isPresentation"), v4);
  v7 = v6;

  return v7;
}

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  _BOOL4 v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  double v18;
  double v19;
  void *v20;
  _QWORD v21[4];
  void *v22;
  id v23;
  id v24;
  char v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  _UIAlertControllerAnimatedTransitioning *v30;

  v4 = a3;
  -[_UIAlertControllerAnimatedTransitioning _alertControllerForContext:](self, "_alertControllerForContext:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_visualStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_systemProvidedPresentationDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "isInteractive");
  v9 = -[_UIAlertControllerAnimatedTransitioning isPresentation](self, "isPresentation");
  v10 = objc_msgSend(v6, "transitionOfType:shouldBeInteractiveForAlertController:", !v9, v5);
  if (v8
    && v9
    && (-[_UIAlertControllerAnimatedTransitioning interactionProgress](self, "interactionProgress"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v11)
    && v10)
  {
    if (+[UIAlertController _shouldUsePresentationController](UIAlertController, "_shouldUsePresentationController"))
    {
      objc_msgSend(v5, "view");
    }
    else
    {
      objc_msgSend(v5, "_foregroundView");
    }
    v16 = (id)objc_claimAutoreleasedReturnValue();
    -[_UIAlertControllerAnimatedTransitioning transitionDuration:](self, "transitionDuration:", v4);
    v19 = v18;
    objc_msgSend(v4, "containerView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __61___UIAlertControllerAnimatedTransitioning_animateTransition___block_invoke;
    v26[3] = &unk_1E16B2B68;
    v27 = v4;
    v28 = v7;
    v29 = v5;
    v30 = self;
    v17 = v4;
    v14 = v5;
    v15 = v7;
    objc_msgSend(v6, "animateRevealOfAlertControllerView:alertController:inContainerView:duration:completionBlock:", v16, v14, v20, v26, v19);

  }
  else
  {
    if (v10)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v7, "_didBeginSystemProvidedPresentationOfAlertController:", v5);
      +[UIDevice currentDevice](UIDevice, "currentDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_tapticEngine");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "actuateFeedback:", 1);

    }
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __61___UIAlertControllerAnimatedTransitioning_animateTransition___block_invoke_3;
    v21[3] = &unk_1E16B2B90;
    v25 = v10;
    v22 = v7;
    v23 = v5;
    v24 = v4;
    v14 = v4;
    v15 = v5;
    v16 = v7;
    -[_UIAlertControllerAnimatedTransitioning _animateTransition:completionBlock:](self, "_animateTransition:completionBlock:", v14, v21);

    v17 = v22;
  }

}

- (void)_animateTransition:(id)a3 completionBlock:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  SEL v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;

  v19 = a2;
  v23 = a3;
  v21 = a4;
  objc_msgSend(v23, "viewControllerForKey:", CFSTR("UITransitionContextFromViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "viewControllerForKey:", CFSTR("UITransitionContextToViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "containerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v6;
  if (_UIAppUseModernRotationAndPresentationBehaviors() && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v23, "_toView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_fromView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "view", v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "containerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v9);

  }
  v12 = -[_UIAlertControllerAnimatedTransitioning isPresentation](self, "isPresentation", v19);
  -[_UIAlertControllerAnimatedTransitioning _alertControllerForContext:](self, "_alertControllerForContext:", v23);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[UIAlertController _shouldUsePresentationController](UIAlertController, "_shouldUsePresentationController"))
  {
    objc_msgSend(v13, "view");
  }
  else
  {
    objc_msgSend(v13, "_foregroundView");
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_updateViewFrameForLandscapePresentationInShimIfNecessary");
  objc_msgSend(v8, "layoutBelowIfNeeded");
  objc_msgSend(v13, "_visualStyle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", v20, self, CFSTR("_UIAlertControllerTransitioning.m"), 140, CFSTR("UIAlertController is expected to have a visual style during transitioning"));

  }
  if (v12)
    v16 = v9;
  else
    v16 = v10;
  v17 = v16;
  -[_UIAlertControllerAnimatedTransitioning transitionDuration:](self, "transitionDuration:", v23);
  objc_msgSend(v15, "animateAlertControllerView:ofAlertController:forPresentation:inContainerView:descendantOfContainerView:duration:completionBlock:", v14, v13, v12, v8, v17, v21);

}

- (BOOL)isPresentation
{
  return self->_presentation;
}

- (void)setPresentation:(BOOL)a3
{
  self->_presentation = a3;
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_alertController, a3);
}

- (UIInteractionProgress)interactionProgress
{
  return self->_interactionProgress;
}

- (void)setInteractionProgress:(id)a3
{
  objc_storeStrong((id *)&self->_interactionProgress, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionProgress, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
}

@end
