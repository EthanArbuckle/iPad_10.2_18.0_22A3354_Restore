@implementation VUIConfirmationTransitioningDelegate

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__VUIConfirmationTransitioningDelegate_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_24 != -1)
    dispatch_once(&sharedInstance_onceToken_24, block);
  return (id)sharedInstance__sharedInstance_0;
}

void __54__VUIConfirmationTransitioningDelegate_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)sharedInstance__sharedInstance_0;
  sharedInstance__sharedInstance_0 = v1;

}

- (VUIConfirmationTransitioningDelegate)init
{

  return 0;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  return self->_presentTransition;
}

- (id)animationControllerForDismissedController:(id)a3
{
  return self->_dismissTransition;
}

- (id)_init
{
  VUIConfirmationTransitioningDelegate *v2;
  VUIConfirmationAnimatedTransitioning *v3;
  VUIConfirmationAnimatedTransitioning *presentTransition;
  VUIConfirmationAnimatedTransitioning *v5;
  VUIConfirmationAnimatedTransitioning *dismissTransition;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VUIConfirmationTransitioningDelegate;
  v2 = -[VUIConfirmationTransitioningDelegate init](&v8, sel_init);
  if (v2)
  {
    v3 = -[VUIConfirmationAnimatedTransitioning initWithPresenting:]([VUIConfirmationAnimatedTransitioning alloc], "initWithPresenting:", 1);
    presentTransition = v2->_presentTransition;
    v2->_presentTransition = v3;

    -[VUIConfirmationAnimatedTransitioning setDelegate:](v2->_presentTransition, "setDelegate:", v2);
    v5 = -[VUIConfirmationAnimatedTransitioning initWithPresenting:]([VUIConfirmationAnimatedTransitioning alloc], "initWithPresenting:", 0);
    dismissTransition = v2->_dismissTransition;
    v2->_dismissTransition = v5;

    -[VUIConfirmationAnimatedTransitioning setDelegate:](v2->_dismissTransition, "setDelegate:", v2);
  }
  return v2;
}

- (void)confirmationAnimatedTransitioningAnimationDidEnd:(id)a3
{
  VUIConfirmationAnimatedTransitioning *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  VUIConfirmationAnimatedTransitioning *v9;

  v4 = (VUIConfirmationAnimatedTransitioning *)a3;
  if (self->_presentTransition == v4)
  {
    v9 = v4;
    -[VUIConfirmationTransitioningDelegate presentedHandlerBlock](self, "presentedHandlerBlock");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v9;
    if (v7)
    {
      -[VUIConfirmationTransitioningDelegate presentedHandlerBlock](self, "presentedHandlerBlock");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
  }
  else if (self->_dismissTransition == v4)
  {
    v9 = v4;
    -[VUIConfirmationTransitioningDelegate dismissedHandlerBlock](self, "dismissedHandlerBlock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v9;
    if (v5)
    {
      -[VUIConfirmationTransitioningDelegate dismissedHandlerBlock](self, "dismissedHandlerBlock");
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v8 = (void *)v6;
      (*(void (**)(void))(v6 + 16))();

      v4 = v9;
    }
  }

}

- (id)presentedHandlerBlock
{
  return self->_presentedHandlerBlock;
}

- (void)setPresentedHandlerBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)dismissedHandlerBlock
{
  return self->_dismissedHandlerBlock;
}

- (void)setDismissedHandlerBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissedHandlerBlock, 0);
  objc_storeStrong(&self->_presentedHandlerBlock, 0);
  objc_storeStrong((id *)&self->_dismissTransition, 0);
  objc_storeStrong((id *)&self->_presentTransition, 0);
}

@end
