@implementation UIPasteControlConfiguration

- (UIPasteControlConfiguration)init
{
  UIPasteControlConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIPasteControlConfiguration;
  result = -[UIPasteControlConfiguration init](&v3, sel_init);
  if (result)
  {
    result->_cornerStyle = 2;
    result->_imagePlacement = 2;
  }
  return result;
}

- (UIPasteControlConfiguration)initWithCoder:(id)a3
{
  id v4;
  UIPasteControlConfiguration *v5;
  float v6;
  uint64_t v7;
  UIColor *baseForegroundColor;
  uint64_t v9;
  UIColor *baseBackgroundColor;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UIPasteControlConfiguration;
  v5 = -[UIPasteControlConfiguration init](&v12, sel_init);
  if (v5)
  {
    v5->_displayMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIPasteControlConfigurationDisplayMode"));
    v5->_cornerStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIPasteControlConfigurationCornerStyle"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("UIPasteControlConfigurationCornerRadius"));
    v5->_cornerRadius = v6;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIPasteControlConfigurationBaseForegroundColor"));
    v7 = objc_claimAutoreleasedReturnValue();
    baseForegroundColor = v5->_baseForegroundColor;
    v5->_baseForegroundColor = (UIColor *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIPasteControlConfigurationBaseBackgroundColor"));
    v9 = objc_claimAutoreleasedReturnValue();
    baseBackgroundColor = v5->_baseBackgroundColor;
    v5->_baseBackgroundColor = (UIColor *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t displayMode;
  double cornerRadius;
  id v6;

  displayMode = self->_displayMode;
  v6 = a3;
  objc_msgSend(v6, "encodeInteger:forKey:", displayMode, CFSTR("UIPasteControlConfigurationDisplayMode"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_cornerStyle, CFSTR("UIPasteControlConfigurationCornerStyle"));
  cornerRadius = self->_cornerRadius;
  *(float *)&cornerRadius = cornerRadius;
  objc_msgSend(v6, "encodeFloat:forKey:", CFSTR("UIPasteControlConfigurationCornerRadius"), cornerRadius);
  objc_msgSend(v6, "encodeObject:forKey:", self->_baseForegroundColor, CFSTR("UIPasteControlConfigurationBaseForegroundColor"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_baseBackgroundColor, CFSTR("UIPasteControlConfigurationBaseBackgroundColor"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIPasteControlDisplayMode)displayMode
{
  return self->_displayMode;
}

- (void)setDisplayMode:(UIPasteControlDisplayMode)displayMode
{
  self->_displayMode = displayMode;
}

- (UIButtonConfigurationCornerStyle)cornerStyle
{
  return self->_cornerStyle;
}

- (void)setCornerStyle:(UIButtonConfigurationCornerStyle)cornerStyle
{
  self->_cornerStyle = cornerStyle;
}

- (CGFloat)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(CGFloat)cornerRadius
{
  self->_cornerRadius = cornerRadius;
}

- (unint64_t)imagePlacement
{
  return self->_imagePlacement;
}

- (void)setImagePlacement:(unint64_t)a3
{
  self->_imagePlacement = a3;
}

- (UIColor)baseForegroundColor
{
  return self->_baseForegroundColor;
}

- (void)setBaseForegroundColor:(UIColor *)baseForegroundColor
{
  objc_storeStrong((id *)&self->_baseForegroundColor, baseForegroundColor);
}

- (UIColor)baseBackgroundColor
{
  return self->_baseBackgroundColor;
}

- (void)setBaseBackgroundColor:(UIColor *)baseBackgroundColor
{
  objc_storeStrong((id *)&self->_baseBackgroundColor, baseBackgroundColor);
}

- (BOOL)_shouldLayoutSynchronously
{
  return self->__shouldLayoutSynchronously;
}

- (void)set_shouldLayoutSynchronously:(BOOL)a3
{
  self->__shouldLayoutSynchronously = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseBackgroundColor, 0);
  objc_storeStrong((id *)&self->_baseForegroundColor, 0);
}

@end
