@implementation PKBorderedButtonConfiguration

- (void)_initializeDefaults
{
  double v3;
  id v4;

  PKScreenScale();
  -[PKBorderedButtonConfiguration setBorderWidth:](self, "setBorderWidth:", 1.0 / v3);
  objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKBorderedButtonConfiguration setBorderColor:](self, "setBorderColor:", v4);

}

+ (id)plainButtonConfiguration
{
  void *v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___PKBorderedButtonConfiguration;
  objc_msgSendSuper2(&v4, sel_plainButtonConfiguration);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_initializeDefaults");
  return v2;
}

+ (id)tintedButtonConfiguration
{
  void *v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___PKBorderedButtonConfiguration;
  objc_msgSendSuper2(&v4, sel_tintedButtonConfiguration);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_initializeDefaults");
  return v2;
}

+ (id)grayButtonConfiguration
{
  void *v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___PKBorderedButtonConfiguration;
  objc_msgSendSuper2(&v4, sel_grayButtonConfiguration);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_initializeDefaults");
  return v2;
}

+ (id)filledButtonConfiguration
{
  void *v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___PKBorderedButtonConfiguration;
  objc_msgSendSuper2(&v4, sel_filledButtonConfiguration);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_initializeDefaults");
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKBorderedButtonConfiguration;
  v4 = -[UIButtonConfiguration copyWithZone:](&v6, sel_copyWithZone_, a3);
  *((_QWORD *)v4 + 34) = self->_border;
  objc_storeStrong((id *)v4 + 36, self->_borderColor);
  *((_QWORD *)v4 + 35) = *(_QWORD *)&self->_borderWidth;
  return v4;
}

- (unint64_t)border
{
  return self->_border;
}

- (void)setBorder:(unint64_t)a3
{
  self->_border = a3;
}

- (double)borderWidth
{
  return self->_borderWidth;
}

- (void)setBorderWidth:(double)a3
{
  self->_borderWidth = a3;
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (void)setBorderColor:(id)a3
{
  objc_storeStrong((id *)&self->_borderColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderColor, 0);
}

@end
