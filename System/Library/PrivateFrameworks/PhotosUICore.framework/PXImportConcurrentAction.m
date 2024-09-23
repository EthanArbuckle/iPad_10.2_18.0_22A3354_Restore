@implementation PXImportConcurrentAction

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (-[PXImportConcurrentAction isCancelled](self, "isCancelled"))
  {
    NSStringFromSelector(sel_isFinished);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXImportConcurrentAction willChangeValueForKey:](self, "willChangeValueForKey:", v3);

    self->_finished = 1;
    NSStringFromSelector(sel_isFinished);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[PXImportConcurrentAction didChangeValueForKey:](self, "didChangeValueForKey:");
  }
  else
  {
    NSStringFromSelector(sel_isExecuting);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXImportConcurrentAction willChangeValueForKey:](self, "willChangeValueForKey:", v4);

    self->_executing = 1;
    NSStringFromSelector(sel_isExecuting);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXImportConcurrentAction didChangeValueForKey:](self, "didChangeValueForKey:", v5);

    +[_PXImportConcurrentActionManager sharedInstance](_PXImportConcurrentActionManager, "sharedInstance");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addOperation:", self);
  }

}

- (id)performAction
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXImportConcurrentAction.m"), 43, CFSTR("Subclassers to implement"));

  return 0;
}

- (void)finish
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  NSStringFromSelector(sel_isExecuting);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXImportConcurrentAction willChangeValueForKey:](self, "willChangeValueForKey:", v3);

  self->_executing = 0;
  NSStringFromSelector(sel_isExecuting);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXImportConcurrentAction didChangeValueForKey:](self, "didChangeValueForKey:", v4);

  NSStringFromSelector(sel_isFinished);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXImportConcurrentAction willChangeValueForKey:](self, "willChangeValueForKey:", v5);

  self->_finished = 1;
  NSStringFromSelector(sel_isFinished);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXImportConcurrentAction didChangeValueForKey:](self, "didChangeValueForKey:", v6);

  +[_PXImportConcurrentActionManager sharedInstance](_PXImportConcurrentActionManager, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeOperation:", self);

}

- (BOOL)isConcurrent
{
  return 1;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isExecuting
{
  return self->_executing;
}

- (BOOL)isFinished
{
  return self->_finished;
}

@end
