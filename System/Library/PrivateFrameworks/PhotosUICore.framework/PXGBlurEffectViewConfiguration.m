@implementation PXGBlurEffectViewConfiguration

- (PXGBlurEffectViewConfiguration)initWithStyle:(int64_t)a3
{
  PXGBlurEffectViewConfiguration *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXGBlurEffectViewConfiguration;
  result = -[PXGBlurEffectViewConfiguration init](&v5, sel_init);
  if (result)
    result->_style = a3;
  return result;
}

- (PXGBlurEffectViewConfiguration)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGBlurEffectView.m"), 35, CFSTR("%s is not available as initializer"), "-[PXGBlurEffectViewConfiguration init]");

  abort();
}

- (unint64_t)hash
{
  return self->_style;
}

- (BOOL)isEqual:(id)a3
{
  PXGBlurEffectViewConfiguration *v4;
  BOOL v5;

  v4 = (PXGBlurEffectViewConfiguration *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && v4->_style == self->_style;
  }

  return v5;
}

- (int64_t)style
{
  return self->_style;
}

@end
