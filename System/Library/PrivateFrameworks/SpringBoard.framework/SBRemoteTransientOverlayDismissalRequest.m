@implementation SBRemoteTransientOverlayDismissalRequest

- (SBRemoteTransientOverlayDismissalRequest)initWithViewController:(id)a3
{
  id v5;
  SBRemoteTransientOverlayDismissalRequest *v6;
  SBRemoteTransientOverlayDismissalRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBRemoteTransientOverlayDismissalRequest;
  v6 = -[SBRemoteTransientOverlayDismissalRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_animated = 1;
    objc_storeStrong((id *)&v6->_viewController, a3);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v4 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithViewController:", self->_viewController);
  v5 = v4;
  if (v4)
  {
    *(_BYTE *)(v4 + 8) = self->_animated;
    v6 = objc_msgSend(self->_completionHandler, "copy");
    v7 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v6;

    *(_BYTE *)(v5 + 9) = self->_shouldInvalidatePresentation;
  }
  return (id)v5;
}

- (BOOL)isAnimated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)shouldInvalidatePresentation
{
  return self->_shouldInvalidatePresentation;
}

- (void)setShouldInvalidatePresentation:(BOOL)a3
{
  self->_shouldInvalidatePresentation = a3;
}

- (SBTransientOverlayViewController)viewController
{
  return self->_viewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
