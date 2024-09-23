@implementation _UITextTiledLayerMaskedRect

+ (id)ghostedRect:(CGRect)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRect:alpha:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0.2);
}

+ (id)rect:(CGRect)a3 alpha:(double)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRect:alpha:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4);
}

- (_UITextTiledLayerMaskedRect)initWithRect:(CGRect)a3 alpha:(double)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _UITextTiledLayerMaskedRect *result;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)_UITextTiledLayerMaskedRect;
  result = -[_UITextTiledLayerMaskedRect init](&v10, sel_init);
  if (result)
  {
    result->_alpha = a4;
    result->_boundingRect.origin.x = x;
    result->_boundingRect.origin.y = y;
    result->_boundingRect.size.width = width;
    result->_boundingRect.size.height = height;
  }
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  NSStringFromCGRect(self->_boundingRect);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@ alpha=%f>"), v4, self, v5, *(_QWORD *)&self->_alpha);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)alpha
{
  return self->_alpha;
}

- (CGRect)boundingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_boundingRect.origin.x;
  y = self->_boundingRect.origin.y;
  width = self->_boundingRect.size.width;
  height = self->_boundingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

@end
