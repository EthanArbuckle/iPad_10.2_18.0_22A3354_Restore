@implementation ICQRemoteContainerViewControllerAnimator

- (ICQRemoteContainerViewControllerAnimator)init
{
  return -[ICQRemoteContainerViewControllerAnimator initWithPresenting:](self, "initWithPresenting:", 1);
}

- (ICQRemoteContainerViewControllerAnimator)initWithPresenting:(BOOL)a3
{
  ICQRemoteContainerViewControllerAnimator *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICQRemoteContainerViewControllerAnimator;
  result = -[ICQRemoteContainerViewControllerAnimator init](&v5, sel_init);
  if (result)
    result->_presenting = a3;
  return result;
}

- (id)_viewControllerForTransitionContext:(id)a3
{
  id v4;
  _BOOL4 v5;
  _QWORD *v6;
  void *v7;

  v4 = a3;
  v5 = -[ICQRemoteContainerViewControllerAnimator isPresenting](self, "isPresenting");
  v6 = (_QWORD *)MEMORY[0x24BEBE9B0];
  if (!v5)
    v6 = (_QWORD *)MEMORY[0x24BEBE9A0];
  objc_msgSend(v4, "viewControllerForKey:", *v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v4 = a3;
  -[ICQRemoteContainerViewControllerAnimator _viewControllerForTransitionContext:](self, "_viewControllerForTransitionContext:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v6);
  v8 = (void *)MEMORY[0x24BEBDB00];
  v9 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __62__ICQRemoteContainerViewControllerAnimator_animateTransition___block_invoke;
  v16[3] = &unk_24E3F34D8;
  v17 = v6;
  v18 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v8, "performWithoutAnimation:", v16);
  v12 = (void *)MEMORY[0x24BEBDB00];
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __62__ICQRemoteContainerViewControllerAnimator_animateTransition___block_invoke_3;
  v14[3] = &unk_24E3F3540;
  v15 = v4;
  v13 = v4;
  objc_msgSend(v12, "_animateUsingDefaultTimingWithOptions:animations:completion:", 134, &__block_literal_global, v14);

}

uint64_t __62__ICQRemoteContainerViewControllerAnimator_animateTransition___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "bounds");
  objc_msgSend(v2, "setFrame:");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __62__ICQRemoteContainerViewControllerAnimator_animateTransition___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", a2);
}

- (double)transitionDuration:(id)a3
{
  return 0.35;
}

- (BOOL)isPresenting
{
  return self->_presenting;
}

@end
