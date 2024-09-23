@implementation TTRIContentUnavailableTextProperties

+ (Class)implClass
{
  return (Class)objc_opt_class();
}

- (id)asUIKit
{
  return self->super._impl;
}

- (UIFont)font
{
  void *v2;
  void *v3;

  -[TTRIContentUnavailableTextProperties asUIKit](self, "asUIKit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (void)setFont:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TTRIContentUnavailableTextProperties asUIKit](self, "asUIKit");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

}

- (UIColor)color
{
  void *v2;
  void *v3;

  -[TTRIContentUnavailableTextProperties asUIKit](self, "asUIKit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (void)setColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TTRIContentUnavailableTextProperties asUIKit](self, "asUIKit");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setColor:", v4);

}

@end
