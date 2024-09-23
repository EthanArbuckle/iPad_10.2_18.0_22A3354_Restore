@implementation PXCollectionTileLayoutTemplate

- (void)prepare
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXCollectionTileLayoutTemplate;
  -[PXLayoutTemplate prepare](&v7, sel_prepare);
  -[PXLayoutTemplate bounds](self, "bounds");
  self->_imageRect.origin.x = v3;
  self->_imageRect.origin.y = v4;
  self->_imageRect.size.width = v5;
  self->_imageRect.size.height = v6;
  self->_titleSubtitleRect.origin.x = v3;
  self->_titleSubtitleRect.origin.y = v4;
  self->_titleSubtitleRect.size.width = v5;
  self->_titleSubtitleRect.size.height = v6;
}

- (CGRect)imageRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_imageRect.origin.x;
  y = self->_imageRect.origin.y;
  width = self->_imageRect.size.width;
  height = self->_imageRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)titleSubtitleRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_titleSubtitleRect.origin.x;
  y = self->_titleSubtitleRect.origin.y;
  width = self->_titleSubtitleRect.size.width;
  height = self->_titleSubtitleRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

@end
