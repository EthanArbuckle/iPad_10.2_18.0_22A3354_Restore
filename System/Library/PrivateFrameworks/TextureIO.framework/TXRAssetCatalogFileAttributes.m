@implementation TXRAssetCatalogFileAttributes

- (void)setColorSpace:(CGColorSpace *)a3
{
  CGColorSpaceRetain(a3);
  CGColorSpaceRelease(self->_colorSpace);
  self->_colorSpace = a3;
}

- (CGColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (TXRAssetCatalogFileAttributes)init
{
  TXRAssetCatalogFileAttributes *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TXRAssetCatalogFileAttributes;
  result = -[TXRAssetCatalogFileAttributes init](&v3, sel_init);
  if (result)
  {
    result->_exifOrientation = 1;
    result->_fileFormat = 0;
  }
  return result;
}

- (unsigned)exifOrientation
{
  return self->_exifOrientation;
}

- (void)setExifOrientation:(unsigned __int8)a3
{
  self->_exifOrientation = a3;
}

- (unint64_t)fileFormat
{
  return self->_fileFormat;
}

- (void)setFileFormat:(unint64_t)a3
{
  self->_fileFormat = a3;
}

@end
