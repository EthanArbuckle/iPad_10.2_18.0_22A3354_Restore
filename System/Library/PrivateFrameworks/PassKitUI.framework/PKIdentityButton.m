@implementation PKIdentityButton

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

+ (PKIdentityButton)buttonWithLabel:(PKIdentityButtonLabel)label style:(PKIdentityButtonStyle)style
{
  return (PKIdentityButton *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLabel:style:", label, style);
}

- (PKIdentityButton)init
{
  _PKIdentityButton *v3;

  v3 = objc_alloc_init(_PKIdentityButton);

  return (PKIdentityButton *)v3;
}

- (PKIdentityButton)initWithCoder:(id)a3
{
  id v4;
  _PKIdentityButton *v5;

  v4 = a3;
  v5 = -[_PKIdentityButton initWithCoder:]([_PKIdentityButton alloc], "initWithCoder:", v4);

  return (PKIdentityButton *)v5;
}

- (PKIdentityButton)initWithLabel:(PKIdentityButtonLabel)label style:(PKIdentityButtonStyle)style
{
  _PKIdentityButton *v5;

  v5 = -[_PKIdentityButton initWithLabel:style:]([_PKIdentityButton alloc], "initWithLabel:style:", label, style);

  return (PKIdentityButton *)v5;
}

- (CGFloat)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(CGFloat)cornerRadius
{
  self->_cornerRadius = cornerRadius;
}

@end
