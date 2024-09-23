@implementation _NSAttributes

- (_NSAttributes)initWithAttributes:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  _NSAttributes *v7;
  objc_super v9;

  length = a4.length;
  location = a4.location;
  v9.receiver = self;
  v9.super_class = (Class)_NSAttributes;
  v7 = -[_NSAttributes init](&v9, sel_init);
  if (v7)
  {
    v7->_attributes = (NSDictionary *)a3;
    v7->_range.location = location;
    v7->_range.length = length;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_NSAttributes;
  -[_NSAttributes dealloc](&v3, sel_dealloc);
}

- (void)setAttributesInTextStorage:(id)a3
{
  objc_msgSend(a3, "setAttributes:range:", self->_attributes, self->_range.location, self->_range.length);
}

@end
