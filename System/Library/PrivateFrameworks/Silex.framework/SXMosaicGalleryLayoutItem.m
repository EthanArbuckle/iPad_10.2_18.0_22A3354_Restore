@implementation SXMosaicGalleryLayoutItem

- (SXMosaicGalleryLayoutItem)initWithDimensions:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  SXMosaicGalleryLayoutItem *result;
  objc_super v6;

  height = a3.height;
  width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)SXMosaicGalleryLayoutItem;
  result = -[SXMosaicGalleryLayoutItem init](&v6, sel_init);
  if (result)
  {
    result->_dimensions.width = width;
    result->_dimensions.height = height;
  }
  return result;
}

- (double)aspectRatio
{
  double v3;
  double v4;
  double v5;

  -[SXMosaicGalleryLayoutItem dimensions](self, "dimensions");
  v4 = v3;
  -[SXMosaicGalleryLayoutItem dimensions](self, "dimensions");
  return v4 / v5;
}

- (int)tileType
{
  int result;
  double v4;

  result = self->_tileType;
  if (!result)
  {
    -[SXMosaicGalleryLayoutItem aspectRatio](self, "aspectRatio");
    if (v4 >= 2.5)
    {
      result = 4;
    }
    else if (v4 <= 1.05)
    {
      if (v4 >= 0.952380952)
        result = 1;
      else
        result = 2;
    }
    else
    {
      result = 3;
    }
    self->_tileType = result;
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Type: %i"), -[SXMosaicGalleryLayoutItem tileType](self, "tileType"));
}

- (CGSize)dimensions
{
  double width;
  double height;
  CGSize result;

  width = self->_dimensions.width;
  height = self->_dimensions.height;
  result.height = height;
  result.width = width;
  return result;
}

@end
