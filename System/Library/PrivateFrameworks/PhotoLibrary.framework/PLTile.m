@implementation PLTile

- (BOOL)visible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
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

- (void)setImageRect:(CGRect)a3
{
  self->_imageRect = a3;
}

- (void)setDecodedSurface:(__IOSurface *)a3
{
  __IOSurface *decodedSurface;

  decodedSurface = self->_decodedSurface;
  if (decodedSurface != a3)
  {
    if (a3)
    {
      CFRetain(a3);
      decodedSurface = self->_decodedSurface;
    }
    if (decodedSurface)
    {
      IOSurfaceDecrementUseCount(decodedSurface);
      CFRelease(self->_decodedSurface);
    }
    self->_decodedSurface = a3;
  }
}

- (__IOSurface)decodedSurface
{
  return self->_decodedSurface;
}

- (void)setTileId:(id)a3
{
  id v5;

  if (self->_tileId != a3)
  {
    v5 = a3;

    self->_tileId = a3;
  }
}

- (id)tileId
{
  return self->_tileId;
}

- (void)dealloc
{
  __IOSurface *decodedSurface;
  objc_super v4;

  decodedSurface = self->_decodedSurface;
  if (decodedSurface)
  {
    IOSurfaceDecrementUseCount(decodedSurface);
    CFRelease(self->_decodedSurface);
  }
  v4.receiver = self;
  v4.super_class = (Class)PLTile;
  -[PLTile dealloc](&v4, sel_dealloc);
}

@end
