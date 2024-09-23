@implementation PSIParsedDate

- (PSIParsedDate)initWithAttributes:(id)a3 range:(_NSRange)a4 extensionRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v7;
  NSUInteger v8;
  id v11;
  PSIParsedDate *v12;
  PSIParsedDate *v13;
  objc_super v15;

  length = a5.length;
  location = a5.location;
  v7 = a4.length;
  v8 = a4.location;
  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PSIParsedDate;
  v12 = -[PSIParsedDate init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_attributes, a3);
    v13->_range.location = v8;
    v13->_range.length = v7;
    v13->_extensionRange.location = location;
    v13->_extensionRange.length = length;
  }

  return v13;
}

- (NSDictionary)attributes
{
  return self->_attributes;
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

- (_NSRange)extensionRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_extensionRange.length;
  location = self->_extensionRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end
