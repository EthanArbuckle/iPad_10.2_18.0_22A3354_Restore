@implementation CRLPdfTaggerPrimaryTextRunContext

- (CRLPdfTaggerPrimaryTextRunContext)initWithStateOfTagger:(id)a3 charRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  CRLPdfTaggerPrimaryTextRunContext *result;
  objc_super v7;

  length = a4.length;
  location = a4.location;
  v7.receiver = self;
  v7.super_class = (Class)CRLPdfTaggerPrimaryTextRunContext;
  result = -[CRLPdfTaggerContext initWithStateOfTagger:](&v7, "initWithStateOfTagger:", a3);
  if (result)
  {
    result->_charRange.location = location;
    result->_charRange.length = length;
  }
  return result;
}

- (_NSRange)charRange
{
  _NSRange *p_charRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_charRange = &self->_charRange;
  location = self->_charRange.location;
  length = p_charRange->length;
  result.length = length;
  result.location = location;
  return result;
}

@end
