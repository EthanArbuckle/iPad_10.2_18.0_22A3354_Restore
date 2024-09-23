@implementation WAAQICategory

- (WAAQICategory)initWithRange:(_NSRange)a3 color:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  WAAQICategory *v9;
  WAAQICategory *v10;
  objc_super v12;

  length = a3.length;
  location = a3.location;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WAAQICategory;
  v9 = -[WAAQICategory init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_range.location = location;
    v9->_range.length = length;
    objc_storeStrong((id *)&v9->_color, a4);
  }

  return v10;
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

- (UIColor)color
{
  return self->_color;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
}

@end
