@implementation SSMLRangeConversionResult

- (SSMLRangeConversionResult)init
{
  SSMLRangeConversionResult *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSMLRangeConversionResult;
  result = -[SSMLRangeConversionResult init](&v3, sel_init);
  if (result)
  {
    result->_convertedRange.location = 0;
    result->_convertedRange.length = 0;
  }
  return result;
}

- (NSString)plainString
{
  return self->_plainString;
}

- (void)setPlainString:(id)a3
{
  objc_storeStrong((id *)&self->_plainString, a3);
}

- (_NSRange)convertedRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_convertedRange.length;
  location = self->_convertedRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setConvertedRange:(_NSRange)a3
{
  self->_convertedRange = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_plainString, 0);
}

@end
