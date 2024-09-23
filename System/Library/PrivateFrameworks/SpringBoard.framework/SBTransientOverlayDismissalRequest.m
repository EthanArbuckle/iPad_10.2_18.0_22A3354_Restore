@implementation SBTransientOverlayDismissalRequest

+ (id)dismissalRequestForAllViewControllers
{
  _QWORD *v2;

  v2 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "_init");
  if (v2)
    v2[3] = 2;
  return v2;
}

+ (id)dismissalRequestForAllViewControllersInWindowScene:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "_init");
  v6 = (void *)v5;
  if (v5)
  {
    *(_QWORD *)(v5 + 24) = 3;
    objc_storeWeak((id *)(v5 + 40), v4);
  }

  return v6;
}

+ (id)dismissalRequestForViewController:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;

  v5 = a3;
  v6 = objc_msgSend(objc_alloc((Class)a1), "_init");
  v7 = (void *)v6;
  if (v6)
  {
    *(_QWORD *)(v6 + 24) = 1;
    objc_storeStrong((id *)(v6 + 32), a3);
  }

  return v7;
}

- (id)_init
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBTransientOverlayDismissalRequest;
  result = -[SBTransientOverlayDismissalRequest init](&v3, sel_init);
  if (result)
    *((_BYTE *)result + 8) = 1;
  return result;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[SBTransientOverlayDismissalRequest _copyWithClass:](self, "_copyWithClass:", objc_opt_class());
}

- (id)_copyWithClass:(Class)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;

  v4 = objc_msgSend([a3 alloc], "_init");
  v5 = v4;
  if (v4)
  {
    *(_BYTE *)(v4 + 8) = self->_animated;
    v6 = objc_msgSend(self->_completionHandler, "copy");
    v7 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v6;

    *(_QWORD *)(v5 + 24) = self->_requestType;
    objc_storeStrong((id *)(v5 + 32), self->_viewController);
    WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    objc_storeWeak((id *)(v5 + 40), WeakRetained);

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

- (int64_t)requestType
{
  return self->_requestType;
}

- (SBTransientOverlayViewController)viewController
{
  return self->_viewController;
}

- (SBWindowScene)windowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
