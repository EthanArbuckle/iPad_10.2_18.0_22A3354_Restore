@implementation PXAssistantTraitCollection

- (PXAssistantTraitCollection)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssistantTraitCollection.m"), 17, CFSTR("%s is not available as initializer"), "-[PXAssistantTraitCollection init]");

  abort();
}

- (PXAssistantTraitCollection)initWithDisplayScale:(double)a3 isRTL:(BOOL)a4
{
  PXAssistantTraitCollection *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXAssistantTraitCollection;
  result = -[PXAssistantTraitCollection init](&v7, sel_init);
  if (result)
  {
    result->_displayScale = a3;
    result->_isRTL = a4;
  }
  return result;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

@end
