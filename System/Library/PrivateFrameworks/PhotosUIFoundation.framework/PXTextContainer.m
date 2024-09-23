@implementation PXTextContainer

- (PXTextContainer)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXTextContainer.m"), 20, CFSTR("%s is not available as initializer"), "-[PXTextContainer initWithCoder:]");

  abort();
}

- (PXTextContainer)initWithSize:(CGSize)a3
{
  return -[PXTextContainer initWithSize:layoutOrientation:](self, "initWithSize:layoutOrientation:", 0, a3.width, a3.height);
}

- (PXTextContainer)initWithSize:(CGSize)a3 layoutOrientation:(int64_t)a4
{
  PXTextContainer *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXTextContainer;
  result = -[PXTextContainer initWithSize:](&v6, sel_initWithSize_, a3.width, a3.height);
  if (result)
    result->_preferredOrientation = a4;
  return result;
}

- (int64_t)preferredOrientation
{
  return self->_preferredOrientation;
}

@end
