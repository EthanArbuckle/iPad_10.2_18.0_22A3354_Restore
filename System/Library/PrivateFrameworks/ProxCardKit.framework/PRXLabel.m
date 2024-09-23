@implementation PRXLabel

- (PRXLabel)initWithStyle:(int64_t)a3
{
  PRXLabel *v4;
  PRXLabel *v5;
  PRXTextStyleDefinition *v6;
  void *v7;
  void *v8;
  PRXLabel *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PRXLabel;
  v4 = -[PRXLabel init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_style = a3;
    v6 = -[PRXTextStyleDefinition initWithStyle:]([PRXTextStyleDefinition alloc], "initWithStyle:", a3);
    -[PRXTextStyleDefinition textColor](v6, "textColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXLabel setTextColor:](v5, "setTextColor:", v7);

    -[PRXTextStyleDefinition font](v6, "font");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXLabel setFont:](v5, "setFont:", v8);

    -[PRXLabel setTextAlignment:](v5, "setTextAlignment:", -[PRXTextStyleDefinition textAlignment](v6, "textAlignment"));
    -[PRXLabel setAccessibilityTraits:](v5, "setAccessibilityTraits:", -[PRXTextStyleDefinition accessibilityTraits](v6, "accessibilityTraits"));
    -[PRXLabel setNumberOfLines:](v5, "setNumberOfLines:", -[PRXTextStyleDefinition numberOfLines](v6, "numberOfLines"));
    -[PRXLabel setAdjustsFontForContentSizeCategory:](v5, "setAdjustsFontForContentSizeCategory:", 1);
    v9 = v5;

  }
  return v5;
}

+ (PRXLabel)labelWithStyle:(int64_t)a3
{
  return (PRXLabel *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithStyle:", a3);
}

- (int64_t)style
{
  return self->_style;
}

@end
