@implementation WBSOpenSearchURLTemplateParameter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setPrefix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (void)setOptional:(BOOL)a3
{
  self->_optional = a3;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)name
{
  return self->_name;
}

- (NSString)prefix
{
  return self->_prefix;
}

- (BOOL)isOptional
{
  return self->_optional;
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

@end
