@implementation NCAnimationCoordinator

+ (id)animationCoordinatorWithDuration:(double)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0D01908], "factoryWithDuration:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithAnimationFactory:", v5);

  return v6;
}

- (NCAnimationCoordinator)initWithAnimationFactory:(id)a3
{
  id v5;
  NCAnimationCoordinator *v6;
  NCAnimationCoordinator *v7;
  _UIViewControllerTransitionContext *v8;
  _UIViewControllerTransitionContext *transitionContext;
  _UIViewControllerTransitionContext *v10;
  _UIViewControllerTransitionContext *v11;
  double v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NCAnimationCoordinator;
  v6 = -[NCAnimationCoordinator init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_factory, a3);
    v8 = (_UIViewControllerTransitionContext *)objc_alloc_init(MEMORY[0x1E0DC4490]);
    transitionContext = v7->_transitionContext;
    v7->_transitionContext = v8;

    v10 = v7->_transitionContext;
    -[BSUIAnimationFactory duration](v7->_factory, "duration");
    -[_UIViewControllerTransitionContext _setDuration:](v10, "_setDuration:");
    v11 = v7->_transitionContext;
    -[BSUIAnimationFactory duration](v7->_factory, "duration");
    -[_UIViewControllerTransitionContext _setIsAnimated:](v11, "_setIsAnimated:", v12 > 0.0);
  }

  return v7;
}

- (void)setDurationInherited:(BOOL)a3
{
  _UIViewControllerTransitionContext *transitionContext;
  double v5;
  _UIViewControllerTransitionContext *v6;
  _BOOL8 v7;
  double v8;

  self->_durationInherited = a3;
  transitionContext = self->_transitionContext;
  v5 = 0.0;
  if (!a3)
    -[BSUIAnimationFactory duration](self->_factory, "duration", 0.0);
  -[_UIViewControllerTransitionContext _setDuration:](transitionContext, "_setDuration:", v5);
  v6 = self->_transitionContext;
  if (self->_durationInherited)
  {
    v7 = 1;
  }
  else
  {
    -[BSUIAnimationFactory duration](self->_factory, "duration");
    v7 = v8 > 0.0;
  }
  -[_UIViewControllerTransitionContext _setIsAnimated:](v6, "_setIsAnimated:", v7);
}

- (UIViewControllerTransitionCoordinator)transitionCoordinator
{
  return (UIViewControllerTransitionCoordinator *)-[_UIViewControllerTransitionContext _transitionCoordinator](self->_transitionContext, "_transitionCoordinator");
}

- (void)viewOfChildContainer:(id)a3 willChangeToSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  id v8;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  -[NCAnimationCoordinator transitionCoordinator](self, "transitionCoordinator");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewWillTransitionToSize:withTransitionCoordinator:", v8, width, height);

}

- (void)animate:(id)a3 completion:(id)a4
{
  id v6;

  v6 = a4;
  -[NCAnimationCoordinator setAnimations:](self, "setAnimations:", a3);
  -[NCAnimationCoordinator setCompletion:](self, "setCompletion:", v6);

  -[NCAnimationCoordinator animateTransition:](self, "animateTransition:", self->_transitionContext);
}

- (double)transitionDuration:(id)a3
{
  double result;

  if (self->_durationInherited)
    objc_msgSend(MEMORY[0x1E0DC3F10], "_currentAnimationDuration", a3);
  else
    -[_UIViewControllerTransitionContext _duration](self->_transitionContext, "_duration", a3);
  return result;
}

- (void)animateTransition:(id)a3
{
  double v4;
  double v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void (**animations)(id, NCAnimationCoordinator *);
  _QWORD v12[5];
  _QWORD aBlock[5];

  -[_UIViewControllerTransitionContext _setAnimator:](self->_transitionContext, "_setAnimator:", self);
  -[NCAnimationCoordinator transitionDuration:](self, "transitionDuration:", self->_transitionContext);
  v5 = v4;
  -[_UIViewControllerTransitionContext _setIsAnimated:](self->_transitionContext, "_setIsAnimated:", v4 > 0.0);
  if (v5 > 0.0
    && (self->_animations
     || -[_UIViewControllerTransitionContext _alongsideAnimationsCount](self->_transitionContext, "_alongsideAnimationsCount") >= 1))
  {
    v6 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __44__NCAnimationCoordinator_animateTransition___block_invoke;
    aBlock[3] = &unk_1E8D1B568;
    aBlock[4] = self;
    v7 = _Block_copy(aBlock);
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __44__NCAnimationCoordinator_animateTransition___block_invoke_2;
    v12[3] = &unk_1E8D1CDC0;
    v12[4] = self;
    v8 = _Block_copy(v12);
    v9 = (void *)MEMORY[0x1E0DC3F10];
    -[BSUIAnimationFactory delay](self->_factory, "delay");
    objc_msgSend(v9, "_animateWithDuration:delay:options:factory:animations:completion:", self->_animationOptions, self->_factory, v7, v8, v5, v10);

  }
  else
  {
    animations = (void (**)(id, NCAnimationCoordinator *))self->_animations;
    if (animations)
      animations[2](animations, self);
    -[_UIViewControllerTransitionContext __runAlongsideAnimations](self->_transitionContext, "__runAlongsideAnimations");
    -[_UIViewControllerTransitionContext completeTransition:](self->_transitionContext, "completeTransition:", 1);
    -[_UIViewControllerTransitionContext _setAnimator:](self->_transitionContext, "_setAnimator:", 0);
  }
}

uint64_t __44__NCAnimationCoordinator_animateTransition___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 40);
  if (v3)
  {
    (*(void (**)(void))(v3 + 16))();
    v2 = *(_QWORD *)(a1 + 32);
  }
  return objc_msgSend(*(id *)(v2 + 16), "__runAlongsideAnimations");
}

uint64_t __44__NCAnimationCoordinator_animateTransition___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if ((a2 & 1) == 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "cancelInteractiveTransition");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "completeTransition:", a2);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "_setAnimator:", 0);
}

- (void)animationEnded:(BOOL)a3
{
  void (**completion)(id, NCAnimationCoordinator *, BOOL);
  id animations;
  id v6;

  completion = (void (**)(id, NCAnimationCoordinator *, BOOL))self->_completion;
  if (completion)
    completion[2](completion, self, a3);
  animations = self->_animations;
  self->_animations = 0;

  v6 = self->_completion;
  self->_completion = 0;

}

- (unint64_t)animationOptions
{
  return self->_animationOptions;
}

- (void)setAnimationOptions:(unint64_t)a3
{
  self->_animationOptions = a3;
}

- (BOOL)isDurationInherited
{
  return self->_durationInherited;
}

- (id)animations
{
  return self->_animations;
}

- (void)setAnimations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_animations, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
  objc_storeStrong((id *)&self->_factory, 0);
}

@end
