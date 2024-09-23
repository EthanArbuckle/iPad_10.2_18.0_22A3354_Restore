@implementation BSUIProfileImageBox

- (Class)layoutClass
{
  return (Class)objc_opt_class(BSUIProfileImageBoxLayout, a2);
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (UIColor)maskColor
{
  return self->_maskColor;
}

- (void)setMaskColor:(id)a3
{
  objc_storeStrong((id *)&self->_maskColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskColor, 0);
}

@end
