@implementation SBHTintedIconImageStyleConfiguration

- (SBHTintedIconImageStyleConfiguration)initWithConfigurationType:(int64_t)a3 tintColor:(id)a4
{
  id v6;
  SBHTintedIconImageStyleConfiguration *v7;
  uint64_t v8;
  UIColor *tintColor;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBHTintedIconImageStyleConfiguration;
  v7 = -[SBHIconImageStyleConfiguration initWithConfigurationType:tintColor:](&v11, sel_initWithConfigurationType_tintColor_, a3, v6);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    tintColor = v7->_tintColor;
    v7->_tintColor = (UIColor *)v8;

  }
  return v7;
}

- (int64_t)configurationType
{
  return 4;
}

- (id)tintColor
{
  return self->_tintColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
}

@end
