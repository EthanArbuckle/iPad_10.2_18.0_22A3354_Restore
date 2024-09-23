@implementation PXGPointReference

- (PXGPointReference)initWithPoint:(CGPoint)a3 layout:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  PXGPointReference *v8;
  PXGPointReference *v9;
  objc_super v11;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PXGPointReference;
  v8 = -[PXGPointReference init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_point.x = x;
    v8->_point.y = y;
    objc_storeWeak((id *)&v8->_layout, v7);
    v9->_isValid = 1;
  }

  return v9;
}

- (PXGPointReference)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGPointReference.m"), 35, CFSTR("%s is not available as initializer"), "-[PXGPointReference init]");

  abort();
}

- (void)invalidate
{
  id v3;

  self->_isValid = 0;
  -[PXGPointReference layout](self, "layout");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removePointReference:", self);

}

- (CGPoint)point
{
  double x;
  double y;
  CGPoint result;

  x = self->_point.x;
  y = self->_point.y;
  result.y = y;
  result.x = x;
  return result;
}

- (PXGLayout)layout
{
  return (PXGLayout *)objc_loadWeakRetained((id *)&self->_layout);
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_layout);
}

@end
