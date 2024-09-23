@implementation _TUIElementTextStyleObject

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- ($0F674443F67B1BBEFA3E91226872A32D)styleRef
{
  return ($0F674443F67B1BBEFA3E91226872A32D)self->_styleRef;
}

- (void)setStyleRef:(id)a3
{
  self->_styleRef = ($36225AD0C84429F3A125462FE9B8891F)a3;
}

- (TUIFontSpec)fontSpec
{
  return self->_fontSpec;
}

- (void)setFontSpec:(id)a3
{
  objc_storeStrong((id *)&self->_fontSpec, a3);
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_fontSpec, 0);
}

@end
