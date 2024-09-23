@implementation _TUIRuleLayerConfig

- (_TUIRuleLayerConfig)initWithColor:(id)a3
{
  id v5;
  _TUIRuleLayerConfig *v6;
  _TUIRuleLayerConfig *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_TUIRuleLayerConfig;
  v6 = -[_TUIRuleLayerConfig init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_color, a3);

  return v7;
}

- (Class)layerClass
{
  return (Class)objc_opt_class(CALayer, a2);
}

- (Class)layerClassForSize:(CGSize)a3
{
  return (Class)objc_opt_class(CALayer, a2);
}

- (void)configureLayer:(id)a3
{
  UIColor *color;
  id v4;

  color = self->_color;
  v4 = a3;
  objc_msgSend(v4, "setBackgroundColor:", -[UIColor CGColor](color, "CGColor"));

}

- (void)dynamicUserInterfaceTraitDidChangeForLayer:(id)a3
{
  UIColor *color;
  id v4;

  color = self->_color;
  v4 = a3;
  objc_msgSend(v4, "setBackgroundColor:", -[UIColor CGColor](color, "CGColor"));

}

- (BOOL)isEqualToConfig:(id)a3
{
  _TUIRuleLayerConfig *v4;
  _TUIRuleLayerConfig *v5;
  uint64_t v6;
  unsigned __int8 v7;
  UIColor *v8;
  UIColor *color;

  v4 = (_TUIRuleLayerConfig *)a3;
  v5 = v4;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    v6 = objc_opt_class(v4);
    if (v6 == objc_opt_class(_TUIRuleLayerConfig))
    {
      v8 = (UIColor *)objc_claimAutoreleasedReturnValue(-[_TUIRuleLayerConfig color](v5, "color"));
      color = self->_color;
      if (color == v8)
        v7 = 1;
      else
        v7 = -[UIColor isEqual:](color, "isEqual:", v8);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (BOOL)reuseLayerForBoundsChange
{
  return 1;
}

- (UIColor)color
{
  return self->_color;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
}

@end
