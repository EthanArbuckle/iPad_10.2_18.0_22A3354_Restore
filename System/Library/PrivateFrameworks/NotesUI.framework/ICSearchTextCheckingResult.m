@implementation ICSearchTextCheckingResult

- (ICSearchTextCheckingResult)initWithRange:(_NSRange)a3
{
  return -[ICSearchTextCheckingResult initWithRange:csEvaluatorMatchString:](self, "initWithRange:csEvaluatorMatchString:", a3.location, a3.length, 0);
}

- (ICSearchTextCheckingResult)initWithRange:(_NSRange)a3 csEvaluatorMatchString:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  ICSearchTextCheckingResult *v9;
  ICSearchTextCheckingResult *v10;
  objc_super v12;

  length = a3.length;
  location = a3.location;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICSearchTextCheckingResult;
  v9 = -[ICSearchTextCheckingResult init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_ic_range.location = location;
    v9->_ic_range.length = length;
    objc_storeStrong((id *)&v9->_csEvaluatorMatchString, a4);
  }

  return v10;
}

- (NSString)csEvaluatorMatchString
{
  return self->_csEvaluatorMatchString;
}

- (void)setCsEvaluatorMatchString:(id)a3
{
  objc_storeStrong((id *)&self->_csEvaluatorMatchString, a3);
}

- (_NSRange)ic_range
{
  _NSRange *p_ic_range;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_ic_range = &self->_ic_range;
  location = self->_ic_range.location;
  length = p_ic_range->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setIc_range:(_NSRange)a3
{
  self->_ic_range = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_csEvaluatorMatchString, 0);
}

@end
