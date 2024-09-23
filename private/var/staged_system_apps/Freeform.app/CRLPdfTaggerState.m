@implementation CRLPdfTaggerState

- (CRLPdfTaggerState)initWithTagStackHeight:(unint64_t)a3
{
  CRLPdfTaggerState *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLPdfTaggerState;
  result = -[CRLPdfTaggerState init](&v5, "init");
  if (result)
    result->_tagStackHeight = a3;
  return result;
}

- (unint64_t)tagStackHeight
{
  return self->_tagStackHeight;
}

@end
