@implementation WBSCachedFont

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
  objc_storeStrong((id *)&self->_font, a3);
}

- (double)size
{
  return self->_size;
}

- (void)setSize:(double)a3
{
  self->_size = a3;
}

- (int64_t)fontWeight
{
  return self->_fontWeight;
}

- (void)setFontWeight:(int64_t)a3
{
  self->_fontWeight = a3;
}

- (int64_t)fontDesign
{
  return self->_fontDesign;
}

- (void)setFontDesign:(int64_t)a3
{
  self->_fontDesign = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_font, 0);
}

@end
