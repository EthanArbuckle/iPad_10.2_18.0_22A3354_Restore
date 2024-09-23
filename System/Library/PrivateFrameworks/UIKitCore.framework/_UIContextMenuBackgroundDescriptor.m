@implementation _UIContextMenuBackgroundDescriptor

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (UIColor)contentBackgroundColor
{
  return self->_contentBackgroundColor;
}

- (void)setContentBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_contentBackgroundColor, a3);
}

- (UIVisualEffect)effect
{
  return self->_effect;
}

- (void)setEffect:(id)a3
{
  objc_storeStrong((id *)&self->_effect, a3);
}

- (UIShape)backgroundShape
{
  return self->_backgroundShape;
}

- (void)setBackgroundShape:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundShape, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundShape, 0);
  objc_storeStrong((id *)&self->_effect, 0);
  objc_storeStrong((id *)&self->_contentBackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
