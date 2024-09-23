@implementation PXGFence

- (unint64_t)type
{
  return self->_type;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (PXGFence)initWithLayout:(id)a3 type:(unint64_t)a4
{
  id v6;
  PXGFence *v7;
  PXGFence *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXGFence;
  v7 = -[PXGFence init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_layout, v6);
    v8->_type = a4;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_layout);
}

- (PXGFence)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGFence.m"), 24, CFSTR("%s is not available as initializer"), "-[PXGFence init]");

  abort();
}

- (PXGLayout)layout
{
  return (PXGLayout *)objc_loadWeakRetained((id *)&self->_layout);
}

@end
