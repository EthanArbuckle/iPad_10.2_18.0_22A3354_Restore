@implementation SXQuickLookLayoutAttributes

- (SXQuickLookLayoutAttributes)initWithThumbnailFrame:(CGRect)a3 errorLabelFrame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  SXQuickLookLayoutAttributes *result;
  objc_super v13;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)SXQuickLookLayoutAttributes;
  result = -[SXQuickLookLayoutAttributes init](&v13, sel_init);
  if (result)
  {
    result->_thumbnailFrame.origin.x = v11;
    result->_thumbnailFrame.origin.y = v10;
    result->_thumbnailFrame.size.width = v9;
    result->_thumbnailFrame.size.height = v8;
    result->_errorLabelFrame.origin.x = x;
    result->_errorLabelFrame.origin.y = y;
    result->_errorLabelFrame.size.width = width;
    result->_errorLabelFrame.size.height = height;
  }
  return result;
}

- (CGRect)thumbnailFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_thumbnailFrame.origin.x;
  y = self->_thumbnailFrame.origin.y;
  width = self->_thumbnailFrame.size.width;
  height = self->_thumbnailFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)errorLabelFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_errorLabelFrame.origin.x;
  y = self->_errorLabelFrame.origin.y;
  width = self->_errorLabelFrame.size.width;
  height = self->_errorLabelFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

@end
