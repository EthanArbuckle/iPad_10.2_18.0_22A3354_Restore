@implementation PREditorElementLayoutAttributes

- (PREditorElementLayoutAttributes)initWithRect:(CGRect)a3 variant:(unint64_t)a4 resolvedTitleLayout:(unint64_t)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  PREditorElementLayoutAttributes *result;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)PREditorElementLayoutAttributes;
  result = -[PREditorElementLayoutAttributes init](&v12, sel_init);
  if (result)
  {
    result->_rect.origin.x = x;
    result->_rect.origin.y = y;
    result->_rect.size.width = width;
    result->_rect.size.height = height;
    result->_variant = a4;
    result->_resolvedTitleLayout = a5;
  }
  return result;
}

- (CGRect)rect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rect.origin.x;
  y = self->_rect.origin.y;
  width = self->_rect.size.width;
  height = self->_rect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (unint64_t)variant
{
  return self->_variant;
}

- (unint64_t)resolvedTitleLayout
{
  return self->_resolvedTitleLayout;
}

@end
