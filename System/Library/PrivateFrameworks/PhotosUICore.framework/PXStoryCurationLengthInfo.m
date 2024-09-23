@implementation PXStoryCurationLengthInfo

- (PXStoryCurationLengthInfo)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryCurationLengthInfo.m"), 16, CFSTR("%s is not available as initializer"), "-[PXStoryCurationLengthInfo init]");

  abort();
}

- (PXStoryCurationLengthInfo)initWithAvailableLengths:(unint64_t)a3 defaultLength:(unint64_t)a4
{
  PXStoryCurationLengthInfo *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXStoryCurationLengthInfo;
  result = -[PXStoryCurationLengthInfo init](&v7, sel_init);
  if (result)
  {
    result->_availableCurationLengths = a3;
    result->_defaultCurationLength = a4;
  }
  return result;
}

- (unint64_t)availableCurationLengths
{
  return self->_availableCurationLengths;
}

- (unint64_t)defaultCurationLength
{
  return self->_defaultCurationLength;
}

@end
