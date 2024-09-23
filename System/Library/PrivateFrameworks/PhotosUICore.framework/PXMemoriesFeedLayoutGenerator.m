@implementation PXMemoriesFeedLayoutGenerator

- (PXMemoriesFeedLayoutGenerator)initWithMetrics:(id)a3
{
  id v5;
  PXMemoriesFeedLayoutGenerator *v6;
  void *v8;
  objc_super v9;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMemoriesFeedLayoutGenerator.m"), 16, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[metrics isKindOfClass:[PXMemoriesFeedLayoutMetrics class]]"));

  }
  v9.receiver = self;
  v9.super_class = (Class)PXMemoriesFeedLayoutGenerator;
  v6 = -[PXMemoriesFeedLayoutGenerator initWithMetrics:](&v9, sel_initWithMetrics_, v5);

  return v6;
}

- (BOOL)includeDateHeader
{
  return self->_includeDateHeader;
}

- (void)setIncludeDateHeader:(BOOL)a3
{
  self->_includeDateHeader = a3;
}

- (BOOL)isFirstHeader
{
  return self->_isFirstHeader;
}

- (void)setIsFirstHeader:(BOOL)a3
{
  self->_isFirstHeader = a3;
}

@end
