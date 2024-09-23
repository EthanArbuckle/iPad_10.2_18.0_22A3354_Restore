@implementation SBTransientOverlayBlockTransitionCoordinator

- (void)startTransitionWithContextProvider:(id)a3
{
  id v5;
  void (**startTransitionHandler)(void);
  id v7;
  void *v8;
  id v9;

  v5 = a3;
  startTransitionHandler = (void (**)(void))self->_startTransitionHandler;
  v9 = v5;
  if (!startTransitionHandler)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTransientOverlayBlockTransitionCoordinator.m"), 16, CFSTR("startTransitionHandler must be non-null when the transition starts."));

    startTransitionHandler = (void (**)(void))self->_startTransitionHandler;
  }
  startTransitionHandler[2]();
  v7 = self->_startTransitionHandler;
  self->_startTransitionHandler = 0;

}

- (void)finalizeTransitionWithContextProvider:(id)a3
{
  void (**finalizeTransitionHandler)(id, id);
  id v5;

  finalizeTransitionHandler = (void (**)(id, id))self->_finalizeTransitionHandler;
  if (finalizeTransitionHandler)
  {
    finalizeTransitionHandler[2](finalizeTransitionHandler, a3);
    v5 = self->_finalizeTransitionHandler;
    self->_finalizeTransitionHandler = 0;

  }
}

- (id)startTransitionHandler
{
  return self->_startTransitionHandler;
}

- (void)setStartTransitionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)finalizeTransitionHandler
{
  return self->_finalizeTransitionHandler;
}

- (void)setFinalizeTransitionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_finalizeTransitionHandler, 0);
  objc_storeStrong(&self->_startTransitionHandler, 0);
}

@end
