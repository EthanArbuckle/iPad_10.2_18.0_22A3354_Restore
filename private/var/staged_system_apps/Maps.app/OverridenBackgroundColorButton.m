@implementation OverridenBackgroundColorButton

- (void)setOverridingBackgroundColor:(id)a3
{
  id v5;
  UIColor **p_overridingBackgroundColor;
  UIColor *v7;
  objc_super v8;

  v5 = a3;
  p_overridingBackgroundColor = &self->_overridingBackgroundColor;
  if ((objc_msgSend(v5, "isEqual:", self->_overridingBackgroundColor) & 1) == 0
    && (v5 || *p_overridingBackgroundColor))
  {
    objc_storeStrong((id *)&self->_overridingBackgroundColor, a3);
    v7 = *p_overridingBackgroundColor;
    v8.receiver = self;
    v8.super_class = (Class)OverridenBackgroundColorButton;
    -[OverridenBackgroundColorButton setBackgroundColor:](&v8, "setBackgroundColor:", v7);
    -[OverridenBackgroundColorButton setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (BOOL)hasRoundedRectColor
{
  UIColor *overridingBackgroundColor;
  void *v3;

  overridingBackgroundColor = self->_overridingBackgroundColor;
  if (overridingBackgroundColor)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    LODWORD(overridingBackgroundColor) = -[UIColor isEqual:](overridingBackgroundColor, "isEqual:", v3) ^ 1;

  }
  return (char)overridingBackgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (!-[OverridenBackgroundColorButton hasRoundedRectColor](self, "hasRoundedRectColor"))
  {
    v5.receiver = self;
    v5.super_class = (Class)OverridenBackgroundColorButton;
    -[OverridenBackgroundColorButton setBackgroundColor:](&v5, "setBackgroundColor:", v4);
  }

}

+ (id)newChromeBlueButton
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[OverridenBackgroundColorButton buttonWithType:](OverridenBackgroundColorButton, "buttonWithType:", 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "layer"));
  objc_msgSend(v3, "setCornerRadius:", 5.0);

  objc_msgSend(v2, "setClipsToBounds:", 1);
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 15.0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "titleLabel"));
  objc_msgSend(v5, "setFont:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  objc_msgSend(v2, "setTitleColor:forState:", v6, 0);

  objc_msgSend(v2, "setContentEdgeInsets:", 5.0, 15.0, 5.0, 15.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "theme"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "keyColor"));
  objc_msgSend(v2, "setOverridingBackgroundColor:", v8);

  return v2;
}

- (UIColor)overridingBackgroundColor
{
  return self->_overridingBackgroundColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overridingBackgroundColor, 0);
}

@end
