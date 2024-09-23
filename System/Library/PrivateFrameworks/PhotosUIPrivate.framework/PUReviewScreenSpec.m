@implementation PUReviewScreenSpec

- (PUReviewScreenSpec)initWithOptions:(unint64_t)a3
{
  PUReviewScreenSpec *result;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUReviewScreenSpec;
  result = -[PUReviewScreenSpec init](&v6, sel_init);
  if (result)
  {
    v5 = 263400;
    if ((a3 & 2) != 0)
      v5 = 279784;
    result->_options = a3;
    result->_oneUpOptions = ((a3 & 1) << 8) & 0xFDFF | ((a3 & 1) << 9) | v5;
    result->_allowSendButton = a3 & 1;
  }
  return result;
}

- (unint64_t)options
{
  return self->_options;
}

- (unint64_t)oneUpOptions
{
  return self->_oneUpOptions;
}

- (BOOL)allowSendButton
{
  return self->_allowSendButton;
}

@end
