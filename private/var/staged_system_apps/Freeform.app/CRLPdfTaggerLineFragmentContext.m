@implementation CRLPdfTaggerLineFragmentContext

- (CRLPdfTaggerLineFragmentContext)initWithStateOfTagger:(id)a3 lineFragmentCharRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  CRLPdfTaggerLineFragmentContext *result;
  objc_super v7;

  length = a4.length;
  location = a4.location;
  v7.receiver = self;
  v7.super_class = (Class)CRLPdfTaggerLineFragmentContext;
  result = -[CRLPdfTaggerContext initWithStateOfTagger:](&v7, "initWithStateOfTagger:", a3);
  if (result)
  {
    result->_lineFragmentCharRange.location = location;
    result->_lineFragmentCharRange.length = length;
  }
  return result;
}

- (_NSRange)lineFragmentCharRange
{
  _NSRange *p_lineFragmentCharRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_lineFragmentCharRange = &self->_lineFragmentCharRange;
  location = self->_lineFragmentCharRange.location;
  length = p_lineFragmentCharRange->length;
  result.length = length;
  result.location = location;
  return result;
}

@end
