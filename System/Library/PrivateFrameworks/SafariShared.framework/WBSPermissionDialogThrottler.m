@implementation WBSPermissionDialogThrottler

- (WBSPermissionDialogThrottler)init
{
  WBSPermissionDialogThrottler *v2;
  NSMutableArray *v3;
  NSMutableArray *requestedPresentations;
  WBSPermissionDialogThrottler *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WBSPermissionDialogThrottler;
  v2 = -[WBSPermissionDialogThrottler init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    requestedPresentations = v2->_requestedPresentations;
    v2->_requestedPresentations = v3;

    v5 = v2;
  }

  return v2;
}

- (void)requestPermissionDialogPresentation:(id)a3
{
  NSMutableArray *requestedPresentations;
  void *v5;

  requestedPresentations = self->_requestedPresentations;
  v5 = (void *)MEMORY[0x1A8599ED0](a3, a2);
  -[NSMutableArray addObject:](requestedPresentations, "addObject:", v5);

  -[WBSPermissionDialogThrottler _callNextPresentationHandlerIfNeeded](self, "_callNextPresentationHandlerIfNeeded");
}

- (void)didCompletePermissionDialog:(BOOL)a3
{
  int64_t v3;

  self->_isShowingDialog = 0;
  if (a3)
    v3 = 0;
  else
    v3 = self->_denyCount + 1;
  self->_denyCount = v3;
  -[WBSPermissionDialogThrottler _callNextPresentationHandlerIfNeeded](self, "_callNextPresentationHandlerIfNeeded");
}

- (void)willPerformUserInitiatedNavigation
{
  self->_denyCount = 0;
}

- (void)invalidate
{
  self->_invalidated = 1;
  -[WBSPermissionDialogThrottler _callNextPresentationHandlerIfNeeded](self, "_callNextPresentationHandlerIfNeeded");
}

- (void)_callNextPresentationHandlerIfNeeded
{
  uint64_t v3;
  void (**v4)(_QWORD);
  BOOL v5;
  char v6;

  if (!self->_callingPresentationHandler && -[NSMutableArray count](self->_requestedPresentations, "count"))
  {
    do
    {
      if (self->_isShowingDialog && !self->_invalidated)
        break;
      -[NSMutableArray firstObject](self->_requestedPresentations, "firstObject");
      v3 = objc_claimAutoreleasedReturnValue();
      if (!v3)
        break;
      v4 = (void (**)(_QWORD))v3;
      -[NSMutableArray removeObjectAtIndex:](self->_requestedPresentations, "removeObjectAtIndex:", 0);
      v5 = !self->_invalidated
        && -[WBSPermissionDialogThrottler _canShowPermissionDialog](self, "_canShowPermissionDialog");
      v6 = self->_isShowingDialog || v5;
      self->_isShowingDialog = v6;
      self->_callingPresentationHandler = 1;
      v4[2](v4);
      self->_callingPresentationHandler = 0;

    }
    while (-[NSMutableArray count](self->_requestedPresentations, "count"));
  }
}

- (BOOL)_canShowPermissionDialog
{
  return !self->_invalidated && self->_denyCount < 3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedPresentations, 0);
}

@end
