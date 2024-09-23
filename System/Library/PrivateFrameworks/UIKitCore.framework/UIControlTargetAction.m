@implementation UIControlTargetAction

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_actionHandler, 0);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  objc_super v9;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if (self->_actionHandler)
  {
    v10.receiver = self;
    v10.super_class = (Class)UIControlTargetAction;
    -[UIControlTargetAction description](&v10, sel_description);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ actionHandler=%@ events=0x%lX"), v4, self->_actionHandler, self->_eventMask);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UIControlTargetAction;
    -[UIControlTargetAction description](&v9, sel_description);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained(&self->_target);
    NSStringFromSelector(self->_action);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ target=%p action=%@ events=0x%lX"), v4, WeakRetained, v7, self->_eventMask);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

@end
