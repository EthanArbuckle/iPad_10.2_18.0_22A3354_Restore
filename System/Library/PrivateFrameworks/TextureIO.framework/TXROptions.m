@implementation TXROptions

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = -[TXROptions init](+[TXROptions allocWithZone:](TXROptions, "allocWithZone:", a3), "init");
  *((_BYTE *)result + 8) = self->_cubemapFromVerticallyStackedImage;
  *((_QWORD *)result + 2) = self->_originOperation;
  *((_QWORD *)result + 3) = self->_colorSpaceHandling;
  *((_BYTE *)result + 32) = self->_multiplyAlpha;
  return result;
}

- (BOOL)cubemapFromVerticallyStackedImage
{
  return self->_cubemapFromVerticallyStackedImage;
}

- (void)setCubemapFromVerticallyStackedImage:(BOOL)a3
{
  self->_cubemapFromVerticallyStackedImage = a3;
}

- (unint64_t)originOperation
{
  return self->_originOperation;
}

- (void)setOriginOperation:(unint64_t)a3
{
  self->_originOperation = a3;
}

- (unint64_t)colorSpaceHandling
{
  return self->_colorSpaceHandling;
}

- (void)setColorSpaceHandling:(unint64_t)a3
{
  self->_colorSpaceHandling = a3;
}

- (BOOL)multiplyAlpha
{
  return self->_multiplyAlpha;
}

- (void)setMultiplyAlpha:(BOOL)a3
{
  self->_multiplyAlpha = a3;
}

@end
