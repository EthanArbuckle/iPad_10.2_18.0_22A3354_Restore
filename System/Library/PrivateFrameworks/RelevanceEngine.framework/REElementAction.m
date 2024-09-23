@implementation REElementAction

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (REElementAction)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)REElementAction;
  return -[REElementAction init](&v4, sel_init, a3);
}

- (REElementActionDelegate)delegate
{
  return (REElementActionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)_didFinish:(BOOL)a3
{
  _BOOL8 v3;
  REElementActionDelegate **p_delegate;
  id WeakRetained;
  char v7;
  id v8;

  v3 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v8, "elementAction:didFinishTask:", self, v3);

  }
}

- (BOOL)forceExecution
{
  return self->_forceExecution;
}

- (void)setForceExecution:(BOOL)a3
{
  self->_forceExecution = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
