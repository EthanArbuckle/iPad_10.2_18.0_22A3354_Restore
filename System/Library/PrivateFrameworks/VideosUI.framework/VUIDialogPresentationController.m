@implementation VUIDialogPresentationController

- (VUIDialogPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  VUIDialogPresentationController *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VUIDialogPresentationController;
  v4 = -[VUIDialogPresentationController initWithPresentedViewController:presentingViewController:](&v8, sel_initWithPresentedViewController_presentingViewController_, a3, a4);
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v4, sel__tapGesture_);
    -[VUIDialogPresentationController backdropView](v4, "backdropView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addGestureRecognizer:", v5);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[VUIDialogPresentationController backdropView](self, "backdropView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllGestureRecognizers");

  v4.receiver = self;
  v4.super_class = (Class)VUIDialogPresentationController;
  -[VUIDialogPresentationController dealloc](&v4, sel_dealloc);
}

- (int64_t)presentationStyle
{
  return 5;
}

- (void)presentationTransitionWillBegin
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)VUIDialogPresentationController;
  -[VUIDialogPresentationController presentationTransitionWillBegin](&v14, sel_presentationTransitionWillBegin);
  -[VUIDialogPresentationController presentedView](self, "presentedView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setContinuousCornerRadius:", 16.0);

  -[VUIDialogPresentationController presentedView](self, "presentedView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClipsToBounds:", 1);

  -[VUIDialogPresentationController containerView](self, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIDialogPresentationController backdropView](self, "backdropView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);

  -[VUIDialogPresentationController backdropView](self, "backdropView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAutoresizingMask:", 18);

  -[VUIDialogPresentationController backdropView](self, "backdropView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v9);

  -[VUIDialogPresentationController backdropView](self, "backdropView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIDialogPresentationController containerView](self, "containerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  objc_msgSend(v10, "setFrame:");

  -[VUIDialogPresentationController _layoutPresentedView](self, "_layoutPresentedView");
  -[VUIDialogPresentationController presentedViewController](self, "presentedViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "transitionCoordinator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "animateAlongsideTransition:completion:", 0, &__block_literal_global_146);

}

uint64_t __66__VUIDialogPresentationController_presentationTransitionWillBegin__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isCancelled");
  if ((_DWORD)result)
    return objc_msgSend(MEMORY[0x1E0DC3F98], "_synchronizeDrawing");
  return result;
}

- (void)dismissalTransitionWillBegin
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUIDialogPresentationController;
  -[VUIDialogPresentationController dismissalTransitionWillBegin](&v5, sel_dismissalTransitionWillBegin);
  -[VUIDialogPresentationController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transitionCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "animateAlongsideTransition:completion:", 0, &__block_literal_global_11_1);

}

uint64_t __63__VUIDialogPresentationController_dismissalTransitionWillBegin__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isCancelled");
  if ((result & 1) == 0)
    return objc_msgSend(MEMORY[0x1E0DC3F98], "_synchronizeDrawing");
  return result;
}

- (UIVisualEffectView)backdropView
{
  UIVisualEffectView *backdropView;
  UIVisualEffectView *v4;
  UIVisualEffectView *v5;

  backdropView = self->_backdropView;
  if (!backdropView)
  {
    v4 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", 0);
    v5 = self->_backdropView;
    self->_backdropView = v4;

    backdropView = self->_backdropView;
  }
  return backdropView;
}

- (void)_layoutPresentedView
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  CGRect v21;
  CGRect v22;

  -[VUIDialogPresentationController presentedView](self, "presentedView");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  -[VUIDialogPresentationController modalSize](self, "modalSize");
  v4 = v3;
  v6 = v5;
  -[VUIDialogPresentationController containerView](self, "containerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v21.origin.x = v9;
  v21.origin.y = v11;
  v21.size.width = v13;
  v21.size.height = v15;
  v16 = CGRectGetWidth(v21) + -33.0;
  v22.origin.x = v9;
  v22.origin.y = v11;
  v22.size.width = v13;
  v22.size.height = v15;
  v17 = CGRectGetHeight(v22) + -33.0;
  if (v16 >= v4)
    v18 = v4;
  else
    v18 = v16;
  if (v17 >= v6)
    v19 = v6;
  else
    v19 = v17;
  objc_msgSend(v20, "setFrame:", (v13 - v18) * 0.5, (v15 - v19) * 0.5);

}

- (void)_tapGesture:(id)a3
{
  id v3;

  -[VUIDialogPresentationController presentedViewController](self, "presentedViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (CGSize)modalSize
{
  double width;
  double height;
  CGSize result;

  width = self->_modalSize.width;
  height = self->_modalSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setModalSize:(CGSize)a3
{
  self->_modalSize = a3;
}

- (id)completedAnimationBlock
{
  return self->_completedAnimationBlock;
}

- (void)setCompletedAnimationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completedAnimationBlock, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
}

@end
