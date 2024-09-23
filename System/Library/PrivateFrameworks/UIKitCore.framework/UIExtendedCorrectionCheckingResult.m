@implementation UIExtendedCorrectionCheckingResult

- (UIExtendedCorrectionCheckingResult)initWithRange:(_NSRange)a3 replacementString:(id)a4 sentenceRange:(_NSRange)a5 detail:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v9;
  NSUInteger v10;
  id v12;
  UIExtendedCorrectionCheckingResult *v13;
  UIExtendedCorrectionCheckingResult *v14;
  uint64_t v15;
  NSDictionary *detail;
  objc_super v18;

  length = a5.length;
  location = a5.location;
  v9 = a3.length;
  v10 = a3.location;
  v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)UIExtendedCorrectionCheckingResult;
  v13 = -[NSSubstitutionCheckingResult initWithRange:replacementString:](&v18, sel_initWithRange_replacementString_, v10, v9, a4);
  v14 = v13;
  if (v13)
  {
    v13->_sentenceRange.location = location;
    v13->_sentenceRange.length = length;
    v15 = objc_msgSend(v12, "copy");
    detail = v14->_detail;
    v14->_detail = (NSDictionary *)v15;

  }
  return v14;
}

- (_NSRange)sentenceRange
{
  _NSRange *p_sentenceRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_sentenceRange = &self->_sentenceRange;
  location = self->_sentenceRange.location;
  length = p_sentenceRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (id)detail
{
  return self->_detail;
}

- (BOOL)isPostEditingResult
{
  return self->_detail != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detail, 0);
}

@end
