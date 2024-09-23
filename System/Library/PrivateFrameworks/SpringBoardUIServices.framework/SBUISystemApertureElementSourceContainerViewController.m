@implementation SBUISystemApertureElementSourceContainerViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setElementViewController:(id)a3
{
  SBUISystemApertureElement *v4;
  void *v5;
  SBUISystemApertureElement *v6;
  _QWORD v7[5];
  SBUISystemApertureElement *v8;

  v4 = (SBUISystemApertureElement *)a3;
  if (self->_elementViewController != v4)
  {
    v5 = (void *)MEMORY[0x1E0CEABB0];
    v7[1] = 3221225472;
    v7[2] = __83__SBUISystemApertureElementSourceContainerViewController_setElementViewController___block_invoke;
    v7[3] = &unk_1E4C3E6A0;
    v7[4] = self;
    v6 = v4;
    v7[0] = MEMORY[0x1E0C809B0];
    v8 = v4;
    objc_msgSend(v5, "performWithoutAnimation:", v7);

    v4 = v6;
  }

}

void __83__SBUISystemApertureElementSourceContainerViewController_setElementViewController___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "willMoveToParentViewController:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "removeFromParentViewController");
  objc_msgSend(*(id *)(a1 + 40), "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "willMoveToParentViewController:", 0);
    objc_msgSend(*(id *)(a1 + 40), "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    objc_msgSend(*(id *)(a1 + 40), "removeFromParentViewController");
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 968), *(id *)(a1 + 40));
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "addChildViewController:");
    objc_msgSend(*(id *)(a1 + 32), "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", v6);

    objc_msgSend(*(id *)(a1 + 40), "didMoveToParentViewController:", *(_QWORD *)(a1 + 32));
  }
}

- (id)_transitionCoordinator
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  -[UIViewController systemApertureElementContext](self, "systemApertureElementContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transitionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transitionCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SBUISystemApertureElementSourceContainerViewController;
    -[SBUISystemApertureElementSourceContainerViewController _transitionCoordinator](&v10, sel__transitionCoordinator);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (SBUISystemApertureElement)elementViewController
{
  return self->_elementViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementViewController, 0);
}

@end
