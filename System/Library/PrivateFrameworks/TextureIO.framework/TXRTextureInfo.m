@implementation TXRTextureInfo

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (void)setPixelFormat:(unint64_t)a3
{
  self->_pixelFormat = a3;
}

- (unint64_t)alphaInfo
{
  return self->_alphaInfo;
}

- (void)setAlphaInfo:(unint64_t)a3
{
  self->_alphaInfo = a3;
}

- (__n128)dimensions
{
  return a1[2];
}

- (void)setDimensions:(TXRTextureInfo *)self
{
  __int128 v2;

  *(_OWORD *)self->_dimensions = v2;
}

- (unint64_t)mipmapLevelCount
{
  return self->_mipmapLevelCount;
}

- (void)setMipmapLevelCount:(unint64_t)a3
{
  self->_mipmapLevelCount = a3;
}

- (unint64_t)arrayLength
{
  return self->_arrayLength;
}

- (void)setArrayLength:(unint64_t)a3
{
  self->_arrayLength = a3;
}

- (BOOL)cubemap
{
  return self->_cubemap;
}

- (void)setCubemap:(BOOL)a3
{
  self->_cubemap = a3;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end
