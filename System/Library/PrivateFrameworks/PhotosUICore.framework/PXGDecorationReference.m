@implementation PXGDecorationReference

- (PXGDecorationReference)initWithDecoratedSpriteReference:(id)a3 decorationType:(int64_t)a4
{
  id v7;
  PXGDecorationReference *v8;
  PXGDecorationReference *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXGDecorationReference;
  v8 = -[PXGDecorationReference init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_decoratedSpriteReference, a3);
    v9->_decorationType = a4;
  }

  return v9;
}

- (PXGDecorationReference)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGDecoratingLayout.m"), 1170, CFSTR("%s is not available as initializer"), "-[PXGDecorationReference init]");

  abort();
}

- (PXGSpriteReference)decoratedSpriteReference
{
  return self->_decoratedSpriteReference;
}

- (int64_t)decorationType
{
  return self->_decorationType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decoratedSpriteReference, 0);
}

@end
