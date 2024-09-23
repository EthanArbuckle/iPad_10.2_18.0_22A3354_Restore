@implementation _TPTemplatedColoredImageView

- (void)setTemplateImageColor:(id)a3
{
  UIColor *v5;
  UIColor **p_templateImageColor;
  void *v7;
  UIColor *v8;

  v5 = (UIColor *)a3;
  p_templateImageColor = &self->_templateImageColor;
  if (self->_templateImageColor != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_templateImageColor, a3);
    -[_TPTemplatedColoredImageView layer](self, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setContentsMultiplyColor:", -[UIColor CGColor](*p_templateImageColor, "CGColor"));

    v5 = v8;
  }

}

- (UIColor)templateImageColor
{
  return self->_templateImageColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiplyColorFilter, 0);
  objc_storeStrong((id *)&self->_templateImageColor, 0);
}

@end
