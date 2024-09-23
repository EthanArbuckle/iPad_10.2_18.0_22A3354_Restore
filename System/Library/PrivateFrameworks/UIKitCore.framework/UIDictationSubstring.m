@implementation UIDictationSubstring

- (UIDictationSubstring)initWithString:(id)a3 range:(_NSRange)a4 enclosingRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v7;
  NSUInteger v8;
  id v11;
  UIDictationSubstring *v12;
  UIDictationSubstring *v13;
  objc_super v15;

  length = a5.length;
  location = a5.location;
  v7 = a4.length;
  v8 = a4.location;
  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UIDictationSubstring;
  v12 = -[UIDictationSubstring init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_string, a3);
    v13->_range.location = v8;
    v13->_range.length = v7;
    v13->_enclosingRange.location = location;
    v13->_enclosingRange.length = length;
  }

  return v13;
}

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
  objc_storeStrong((id *)&self->_string, a3);
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (_NSRange)enclosingRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_enclosingRange.length;
  location = self->_enclosingRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setEnclosingRange:(_NSRange)a3
{
  self->_enclosingRange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
}

@end
