@implementation SBTransientOverlayPresentationRequest

- (SBTransientOverlayPresentationRequest)initWithViewController:(id)a3
{
  id v5;
  SBTransientOverlayPresentationRequest *v6;
  SBTransientOverlayPresentationRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBTransientOverlayPresentationRequest;
  v6 = -[SBTransientOverlayPresentationRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_animated = 1;
    v6->_shouldDismissSiri = 1;
    objc_storeStrong((id *)&v6->_viewController, a3);
  }

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[SBTransientOverlayPresentationRequest _copyWithClass:](self, "_copyWithClass:", objc_opt_class());
}

- (id)_copyWithClass:(Class)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;

  v4 = objc_msgSend([a3 alloc], "initWithViewController:", self->_viewController);
  v5 = v4;
  if (v4)
  {
    *(_BYTE *)(v4 + 8) = self->_animated;
    v6 = objc_msgSend(self->_completionHandler, "copy");
    v7 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v6;

    *(_BYTE *)(v5 + 24) = self->_shouldDismissSiri;
    objc_storeStrong((id *)(v5 + 40), self->_originatingProcess);
    WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    objc_storeWeak((id *)(v5 + 48), WeakRetained);

  }
  return (id)v5;
}

- (BOOL)isAnimated
{
  return self->_animated;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (BOOL)shouldDismissSiri
{
  return self->_shouldDismissSiri;
}

- (SBTransientOverlayViewController)viewController
{
  return self->_viewController;
}

- (SBWindowScene)windowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (BSProcessHandle)originatingProcess
{
  return self->_originatingProcess;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_originatingProcess, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
