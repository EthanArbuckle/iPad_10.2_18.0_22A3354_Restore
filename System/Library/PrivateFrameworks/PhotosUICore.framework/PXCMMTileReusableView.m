@implementation PXCMMTileReusableView

- (PXCMMTileReusableView)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMTileReusableView.m"), 20, CFSTR("%s is not available as initializer"), "-[PXCMMTileReusableView init]");

  abort();
}

- (PXCMMTileReusableView)initWithView:(id)a3
{
  id v5;
  PXCMMTileReusableView *v6;
  PXCMMTileReusableView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXCMMTileReusableView;
  v6 = -[PXCMMTileReusableView init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_underlyingView, a3);

  return v7;
}

- (UIView)view
{
  return self->_underlyingView;
}

- (void)becomeReusable
{
  -[UIView setHidden:](self->_underlyingView, "setHidden:", 1);
}

- (void)prepareForReuse
{
  -[UIView setHidden:](self->_underlyingView, "setHidden:", 0);
}

- (UIView)underlyingView
{
  return self->_underlyingView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingView, 0);
}

@end
