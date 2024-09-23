@implementation CRLPdfTaggerSecondaryTextRunContext

- (CRLPdfTaggerSecondaryTextRunContext)initWithStateOfTagger:(id)a3 charRange:(_NSRange)a4 baseTextRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v7;
  NSUInteger v8;
  CRLPdfTaggerSecondaryTextRunContext *result;
  objc_super v10;

  length = a5.length;
  location = a5.location;
  v7 = a4.length;
  v8 = a4.location;
  v10.receiver = self;
  v10.super_class = (Class)CRLPdfTaggerSecondaryTextRunContext;
  result = -[CRLPdfTaggerContext initWithStateOfTagger:](&v10, "initWithStateOfTagger:", a3);
  if (result)
  {
    result->_charRange.location = v8;
    result->_charRange.length = v7;
    result->_baseTextRange.location = location;
    result->_baseTextRange.length = length;
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

- (_NSRange)baseTextRange
{
  _NSRange *p_baseTextRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_baseTextRange = &self->_baseTextRange;
  location = self->_baseTextRange.location;
  length = p_baseTextRange->length;
  result.length = length;
  result.location = location;
  return result;
}

@end
