@implementation PTTextureRGBA

- (unint64_t)width
{
  return -[MTLTexture width](self->_texRGBA, "width");
}

- (unint64_t)height
{
  return -[MTLTexture height](self->_texRGBA, "height");
}

- (BOOL)isRGB
{
  return 1;
}

- (MTLTexture)texRGBA
{
  return (MTLTexture *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTexRGBA:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_texRGBA, 0);
}

@end
