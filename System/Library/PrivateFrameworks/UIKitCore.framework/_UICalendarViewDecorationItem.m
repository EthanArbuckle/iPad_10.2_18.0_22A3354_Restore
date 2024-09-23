@implementation _UICalendarViewDecorationItem

- (id)_decorationViewForReuseView:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICalendarViewDecoration.m"), 204, CFSTR("This must be implemented by a decoration subclass"));

  return 0;
}

- (id)_decorationViewReusableKey
{
  return 0;
}

- (UIView)_decorationView
{
  return self->_decorationView;
}

- (void)_setDecorationView:(id)a3
{
  objc_storeStrong((id *)&self->_decorationView, a3);
}

- (UIView)_parent
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_parent);
}

- (void)_setParent:(id)a3
{
  objc_storeWeak((id *)&self->_parent, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_decorationView, 0);
}

@end
