@implementation _UIImageViewUncommonProperties

- (int64_t)defaultRenderingMode
{
  return self->_defaultRenderingMode;
}

- (unsigned)drawMode
{
  return self->_drawMode;
}

- (_UIImageCIImageRenderer)CIRenderer
{
  return self->_CIRenderer;
}

- (void)setDrawMode:(unsigned int)a3
{
  self->_drawMode = a3;
}

- (void)setDefaultRenderingMode:(int64_t)a3
{
  self->_defaultRenderingMode = a3;
}

- (UIImageSymbolConfiguration)overridingSymbolConfiguration
{
  return self->_overridingSymbolConfiguration;
}

- (void)setOverridingSymbolConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_overridingSymbolConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_CIRenderer, 0);
  objc_storeStrong((id *)&self->_preferredSymbolVariant, 0);
  objc_storeStrong((id *)&self->_overridingSymbolConfiguration, 0);
}

- (_UIImageSymbolVariant)preferredSymbolVariant
{
  return self->_preferredSymbolVariant;
}

- (void)setPreferredSymbolVariant:(id)a3
{
  objc_storeStrong((id *)&self->_preferredSymbolVariant, a3);
}

- (void)setCIRenderer:(id)a3
{
  objc_storeStrong((id *)&self->_CIRenderer, a3);
}

@end
