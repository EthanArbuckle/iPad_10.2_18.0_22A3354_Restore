@implementation _PXVisualDiagnosticsDrawTextConfiguration

- (_PXVisualDiagnosticsDrawTextConfiguration)init
{
  _PXVisualDiagnosticsDrawTextConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_PXVisualDiagnosticsDrawTextConfiguration;
  result = -[_PXVisualDiagnosticsDrawTextConfiguration init](&v3, sel_init);
  if (result)
    result->_relativePosition = (CGPoint)*MEMORY[0x24BDBEFB0];
  return result;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (void)setAttributedText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (CGPoint)relativePosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_relativePosition.x;
  y = self->_relativePosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setRelativePosition:(CGPoint)a3
{
  self->_relativePosition = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
