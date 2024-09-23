@implementation PTTextureYUV

- (void)setTexLuma:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void)setTexChroma:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_texChroma, 0);
  objc_storeStrong((id *)&self->_texLuma, 0);
}

- (unint64_t)width
{
  return -[MTLTexture width](self->_texLuma, "width");
}

- (unint64_t)height
{
  return -[MTLTexture height](self->_texLuma, "height");
}

- (BOOL)isRGB
{
  return 0;
}

- (MTLTexture)texLuma
{
  return (MTLTexture *)objc_getProperty(self, a2, 48, 1);
}

- (MTLTexture)texChroma
{
  return (MTLTexture *)objc_getProperty(self, a2, 56, 1);
}

@end
