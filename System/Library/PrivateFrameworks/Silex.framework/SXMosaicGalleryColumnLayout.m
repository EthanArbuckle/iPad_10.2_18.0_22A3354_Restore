@implementation SXMosaicGalleryColumnLayout

- (SXMosaicGalleryColumnLayout)initWithWidth:(double)a3 gutter:(double)a4
{
  SXMosaicGalleryColumnLayout *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SXMosaicGalleryColumnLayout;
  result = -[SXMosaicGalleryColumnLayout init](&v7, sel_init);
  if (result)
  {
    result->_width = a3;
    result->_gutter = a4;
  }
  return result;
}

- (double)positionForColumnRange:(_NSRange)a3 numberOfColumns:(unint64_t)a4
{
  double result;

  -[SXMosaicGalleryColumnLayout positionOfColumn:inNumberOfColumns:](self, "positionOfColumn:inNumberOfColumns:", a3.location, a4);
  return result;
}

- (double)widthForColumnRange:(_NSRange)a3 numberOfColumns:(unint64_t)a4
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v8;
  double v9;
  NSUInteger v10;
  NSUInteger v11;
  double v12;
  double v13;

  length = a3.length;
  location = a3.location;
  v8 = a3.location + a3.length;
  v9 = 0.0;
  if (a3.location < a3.location + a3.length)
  {
    v10 = a3.length;
    v11 = a3.location;
    do
    {
      -[SXMosaicGalleryColumnLayout widthOfColumn:inNumberOfColumns:](self, "widthOfColumn:inNumberOfColumns:", v11, a4);
      v9 = v9 + v12;
      ++v11;
      --v10;
    }
    while (v10);
  }
  if (a4 != 1 && length != a4)
  {
    -[SXMosaicGalleryColumnLayout gutter](self, "gutter");
    if (!location || v8 == a4)
      return v9 + v13 * -0.5;
    else
      return v9 - v13;
  }
  return v9;
}

- (double)positionOfColumn:(unint64_t)a3 inNumberOfColumns:(unint64_t)a4
{
  uint64_t v7;
  double v8;
  double v9;
  double v10;

  if (!a3)
    return 0.0;
  v7 = 0;
  v8 = 0.0;
  do
  {
    -[SXMosaicGalleryColumnLayout widthOfColumn:inNumberOfColumns:](self, "widthOfColumn:inNumberOfColumns:", v7, a4);
    v8 = v8 + v9;
    ++v7;
  }
  while (a3 != v7);
  -[SXMosaicGalleryColumnLayout gutter](self, "gutter");
  return v8 + v10 * 0.5;
}

- (double)widthOfColumn:(unint64_t)a3 inNumberOfColumns:(unint64_t)a4
{
  double v6;
  double v7;
  double v8;
  double result;

  -[SXMosaicGalleryColumnLayout width](self, "width");
  v7 = v6 / (double)a4;
  v8 = floor(v7);
  result = ceil(v7);
  if (a3 == 1)
    return v8;
  return result;
}

- (double)width
{
  return self->_width;
}

- (double)gutter
{
  return self->_gutter;
}

@end
